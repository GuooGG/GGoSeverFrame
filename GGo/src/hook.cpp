#include"hook.h"
#include"logSystem.h"
#include"fiber.h"
#include"ioScheduler.h"
#include"config.h"
#include"fdManager.h"
#include<dlfcn.h>

static GGo::Logger::ptr g_logger = GGO_LOG_NAME("system");

namespace GGo{

static thread_local bool t_hook_enable = false;
static GGo::ConfigVar<int>::ptr g_tcp_connect_timeout_config =
    GGo::Config::Lookup("tcp.connect.timeout", 5000, "tcp connect timeout (/ms)");
static int s_connect_timeout = -1;

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
    socket_f = (socket_fun)dlsym(RTLD_NEXT, "socket");
    connect_f = (connect_fun)dlsym(RTLD_NEXT, "connext");
    accept_f = (accept_fun)dlsym(RTLD_NEXT, "accept");
    read_f = (read_fun)dlsym(RTLD_NEXT, "read");
    readv_f = (readv_fun)dlsym(RTLD_NEXT, "readv");
    recv_f = (recv_fun)dlsym(RTLD_NEXT, "recv");
    recvfrom_f = (recvfrom_fun)dlsym(RTLD_NEXT, "recvfrom");
    recvmsg_f = (recvmsg_fun)dlsym(RTLD_NEXT, "recvmsg");
    write_f = (write_fun)dlsym(RTLD_NEXT, "write");
    writev_f = (writev_fun)dlsym(RTLD_NEXT, "writev");
    send_f = (send_fun)dlsym(RTLD_NEXT, "send");
    sendto_f = (sendto_fun)dlsym(RTLD_NEXT, "sendto");
    sendmsg_f = (sendmsg_fun)dlsym(RTLD_NEXT, "sendmsg");
    close_f = (close_fun)dlsym(RTLD_NEXT, "close");
    fcntl_f = (fcntl_fun)dlsym(RTLD_NEXT, "fcntl");
    ioctl_f = (ioctl_fun)dlsym(RTLD_NEXT, "ioctl");
    setsockopt_f = (setsockopt_fun)dlsym(RTLD_NEXT, "getsockopt");
    getsockopt_f = (getsockopt_fun)dlsym(RTLD_NEXT, "getsockopt");
}

struct __HookIniter
{
    __HookIniter()
    {
        hook_init();
        s_connect_timeout = g_tcp_connect_timeout_config->getValue();

        g_tcp_connect_timeout_config->addListener([](const int& oldv, const int& newv){
            GGO_LOG_INFO(g_logger) << "tcp connect timeout changed from "
                                << oldv << " ms to " << newv << " ms.";
            s_connect_timeout = newv;
        });
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

struct timer_condition
{
    int cancelled = 0;
};

template<typename Func, typename... Args>
static int64_t do_io(int fd, Func fun, const char* fun_name, uint32_t event, int timeout_type, Args&&... args)
{
    if(!GGo::t_hook_enable){
        return fun(fd, std::forward<Args>(args)...);
    }

    GGo::FdCtx::ptr fdctx = GGo::FdMgr::GetInstance()->get(fd);
    if(!fdctx){
        //在文件句柄管理器内没有该句柄
        return fun(fd, std::forward<Args>(args)...);
    }

    // 在管理器内找到了句柄的上下文
    if(fdctx->isClose()){
        //试图操作已经关闭的文件句柄
        errno = EBADF;
        return -1;
    }

    if(!fdctx->isSocket() || fdctx->getUsrNonblock()){
        //文件不是socket或者是其他用户设置的非阻塞的io，直接执行即可
        return fun(fd, std::forward<Args>(args)...);
    }

    //下面处理socket_io的情况
    //TODO:: io核心方法
    uint64_t timeout = fdctx->getTimeout(timeout_type);
    std::shared_ptr<timer_condition> t_cond(new timer_condition);
    int64_t rt = -1;
    do
    {
        // 先执行一遍
        rt = fun(fd, std::forward<Args>(args)...);
        while(rt == -1 && errno == EINTR){
            // 如果是系统中断导致的错误,则再执行一次
            rt = fun(fd, std::forward<Args>(args)...);
        }
        if(rt == -1 && errno == EAGAIN){
            GGo::IOScheduler* ioscheduler = GGo::IOScheduler::getThis();
            GGo::Timer::ptr timer;
            std::weak_ptr<timer_condition> w_cond(t_cond);

            if(timeout != (uint64_t)-1){
                // 设定的超时时间不为-1
                timer = ioscheduler->addConditionTimer(timeout, [w_cond, fd, ioscheduler, event](){
                    std::shared_ptr<timer_condition> t = w_cond.lock();
                    if(!t || t->cancelled){
                        return;
                    }
                    // 超时时间到，但是事件还没执行，设置错状态，触发事件
                    t->cancelled = ETIMEDOUT;
                    ioscheduler->cancelEvent(fd, (GGo::IOScheduler::Event)event);
                }, w_cond);
            }

            rt = ioscheduler->addEvent(fd, (GGo::IOScheduler::Event)event);
            if(rt){

            }else{
                GGo::Fiber::yieldToHold();
                if(timer){
                    timer->cancel();
                    if(t_cond->cancelled){
                        errno = t_cond->cancelled;
                        return -1;
                    }
                }
            }
        }

    } while (rt == -1);

    return rt;
}

extern "C"{

sleep_fun sleep_f = nullptr;
usleep_fun usleep_f = nullptr;
nanosleep_fun nanosleep_f = nullptr;
socket_fun socket_f = nullptr;
connect_fun connect_f = nullptr;
accept_fun accept_f = nullptr;
read_fun read_f = nullptr;
readv_fun readv_f = nullptr;
recv_fun recv_f = nullptr;
recvfrom_fun recvfrom_f = nullptr;
recvmsg_fun recvmsg_f = nullptr;
write_fun write_f = nullptr;
writev_fun writev_f = nullptr;
send_fun send_f = nullptr;
sendto_fun sendto_f = nullptr;
sendmsg_fun sendmsg_f = nullptr;
close_fun close_f = nullptr;
fcntl_fun fcntl_f = nullptr;
ioctl_fun ioctl_f = nullptr;
setsockopt_fun setsockopt_f = nullptr;
getsockopt_fun getsockopt_f = nullptr;

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

int socket(int domain, int type, int protocol){
    if(!GGo::t_hook_enable){
        GGO_LOG_DEBUG(g_logger) << "original socket";
        return socket_f(domain, type, protocol);
    }
    GGO_LOG_INFO(g_logger) << "hooked socket";
    return socket_f(domain, type, protocol);
}

int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen){
    if(!GGo::t_hook_enable){
        GGO_LOG_DEBUG(g_logger) << "original connect";
        return connect_f(sockfd, addr, addrlen);
    }
    GGO_LOG_DEBUG(g_logger) << "hooked connect";
    return connect_f(sockfd, addr, addrlen);
}

int accept(int s, struct sockaddr *addr, socklen_t *addrlen){
    if(!GGo::t_hook_enable){
        GGO_LOG_DEBUG(g_logger) << "original accept";
        return accept_f(s, addr, addrlen);
    }
    GGO_LOG_DEBUG(g_logger) << "hooked accept";
    return accept_f(s, addr, addrlen);
}


}
