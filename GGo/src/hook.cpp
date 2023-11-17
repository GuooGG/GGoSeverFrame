#include"hook.h"
#include"logSystem.h"
#include"fiber.h"
#include"ioScheduler.h"
#include<dlfcn.h>

namespace GGo{

static thread_local bool t_hook_enable = false;

GGo::Logger::ptr g_logger = GGO_LOG_NAME("system");

// hook模块初始化
void hook_init()
{
    static bool is_inited = false;
    if (is_inited)
    {
        return;
    }
    sleep_f = (sleep_fun)dlsym(RTLD_NEXT, "sleep");
    usleep_f = (usleep_fun)dlsym(RTLD_NEXT, "usleep");
    nanosleep_f = (nanosleep_fun)dlsym(RTLD_NEXT, "nanosleep");
}

struct __HookIniter
{
    __HookIniter()
    {
        hook_init();
    }
};

static __HookIniter s_hook_initer;

bool is_hook_enbale()
{
    return t_hook_enable;
}

void set_hook_enable(bool flag)
{
    t_hook_enable = flag;
}


}

extern "C"{

sleep_fun sleep_f = nullptr;
usleep_fun usleep_f = nullptr;
nanosleep_fun nanosleep_f = nullptr;

unsigned int sleep(unsigned int seconds){
    if(!GGo::t_hook_enable){
        return sleep_f(seconds);
    }

    GGo::Fiber::ptr fiber = GGo::Fiber::getThis();
    GGo::IOScheduler* ioscheduler = GGo::IOScheduler::getThis();

    ioscheduler->addTimer(seconds * 1000, std::bind((void(GGo::Scheduler::*)(GGo::Fiber::ptr, int))&GGo::IOScheduler::schedule,
                                                ioscheduler,
                                                fiber,
                                                -1));
    GGo::Fiber::yieldToHold();
    return 0;
}

int usleep(useconds_t usec){
    if(!GGo::t_hook_enable){
        return usleep_f(usec);
    }
    GGo::Fiber::ptr fiber = GGo::Fiber::getThis();
    GGo::IOScheduler* ioscheduler = GGo::IOScheduler::getThis();

    ioscheduler->addTimer(usec / 1000, std::bind((void(GGo::Scheduler::*)(GGo::Fiber::ptr, int)) & GGo::IOScheduler::schedule,
                                                 ioscheduler,
                                                 fiber,
                                                 -1));
    GGo::Fiber::yieldToHold();
    return 0;
}

int nanosleep(const struct timespec *req, struct timespec *rem){
    if(!GGo::t_hook_enable){
        return nanosleep_f(req, rem);
    }
    
    int timeout_ms = req->tv_sec * 1000 + req->tv_nsec / 1000000;
    GGo::Fiber::ptr fiber = GGo::Fiber::getThis();
    GGo::IOScheduler* ioscheduler = GGo::IOScheduler::getThis();
    ioscheduler->addTimer(timeout_ms, std::bind((void(GGo::Scheduler::*)(GGo::Fiber::ptr, int)) & GGo::IOScheduler::schedule,
                                                 ioscheduler,
                                                 fiber,
                                                 -1));
    GGo::Fiber::yieldToHold();
    return 0;
}
}
