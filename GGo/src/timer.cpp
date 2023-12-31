#include"timer.h"
#include"util.h"

namespace GGo{
bool Timer::cancel()
{
    TimerManager::RWMutexType::writeLock lock(m_manager->m_mutex);
    if(m_cb == nullptr){
        return false;
    }
    m_cb = nullptr;
    auto it = m_manager->m_timers.find(shared_from_this());
    if (it == m_manager->m_timers.end())
    {
        return false;
    }
    m_manager->m_timers.erase(it);
    return true;
}

bool Timer::refresh()
{
    TimerManager::RWMutexType::writeLock lock(m_manager->m_mutex);
    if(!m_cb){
        return false;
    }
    auto it = m_manager->m_timers.find(shared_from_this());
    if(it == m_manager->m_timers.end()){
        return false;
    }
    //如果没有回调函数或者管理器内没有找到这个计时器，则直接跳出，返回失败
    m_manager->m_timers.erase(it);
    m_next = GGo::getCurrentMS() + m_ms;
    m_manager->m_timers.insert(shared_from_this());
    return true;
}

bool Timer::reset(uint64_t ms, bool from_now)
{
    if(m_ms == ms && !from_now){
        return true;
    }
    TimerManager::RWMutexType::writeLock lock(m_manager->m_mutex);
    if(m_cb == nullptr){
        return false;
    }
    auto it = m_manager->m_timers.find(shared_from_this());
    if(it == m_manager->m_timers.end()){
        return false;
    }
    m_manager->m_timers.erase(it);
    //TODO::这段没看懂，from_now的作用与锁的传递
    uint64_t start = 0;
    if(from_now){
        start = GGo::getCurrentMS();
    }else{
        start = m_next - m_ms;
    }
    m_ms = ms;
    m_next = start + m_ms;
    m_manager->addTimer(shared_from_this(),lock);
    return true;
}

Timer::Timer(uint64_t ms, std::function<void()> cb, bool reloop, TimerManager *manager)
            :m_reloop(reloop)
            ,m_ms(ms)
            ,m_cb(cb)
            ,m_manager(manager)
{
    m_next = GGo::getCurrentMS() + m_ms;
}

Timer::Timer(uint64_t next)
            :m_next(next)
{    
}

TimerManager::TimerManager()
{
    m_previouseTime = GGo::getCurrentMS();
}

TimerManager::~TimerManager()
{
}

Timer::ptr TimerManager::addTimer(uint64_t ms, std::function<void()> cb, bool reloop)
{   
    Timer::ptr timer(new Timer(ms, cb, reloop, this));
    RWMutexType::writeLock lock(m_mutex);
    addTimer(timer, lock);
    return timer;
}

//定时器每次执行前检查条件是否存在
static void onTimer(std::weak_ptr<void> weak_cond, std::function<void()> cb){
    std::shared_ptr<void> tmp = weak_cond.lock();
    if(tmp){
        cb();
    }
}

Timer::ptr TimerManager::addConditionTimer(uint64_t ms, std::function<void()> cb, std::weak_ptr<void> weak_cond, bool reloop)
{
    return addTimer(ms, std::bind(&onTimer, weak_cond, cb), reloop);
}

uint64_t TimerManager::getNextTimer()
{
    RWMutexType::readLock lock(m_mutex);
    m_tickled = false;
    if(m_timers.empty()){
        return ~0ull;
    }

    const Timer::ptr next = *m_timers.begin();
    uint64_t now_ms = GGo::getCurrentMS();
    if(now_ms >= next->m_next){
        return 0;
    }else{
        return next->m_next - now_ms;
    }
}

void TimerManager::listExpriedCb(std::vector<std::function<void()>> &cbs)
{
    uint64_t now_ms = GGo::getCurrentMS();
    std::vector<Timer::ptr> expried;
    //TODO:: 这次检查有必要吗
    {
        RWMutexType::readLock lock(m_mutex);
        if(m_timers.empty()){
            return;
        }
    }
    RWMutexType::writeLock lock(m_mutex);
    if(m_timers.empty()){
        return;
    }
    bool isRollover = detectClockRollover(now_ms);
    if(!isRollover && ((*m_timers.begin())->m_next > now_ms)){
        return;
    }

    Timer::ptr now_timer(new Timer(now_ms));
    auto it = isRollover ? m_timers.end() : m_timers.lower_bound(now_timer);
    while(it != m_timers.end() && (*it)->m_next == now_ms){
        it++;
    }
    expried.insert(expried.begin(), m_timers.begin(), it);
    m_timers.erase(m_timers.begin(), it);
    cbs.reserve(expried.size());
    for(auto& timer : expried){
        cbs.push_back(timer->m_cb);
        if(timer->m_reloop){
            timer->m_next = now_ms + timer->m_ms;
            m_timers.insert(timer);
        }else{
            timer->m_cb = nullptr;
        }
    }

}

bool TimerManager::hasTimer()
{
    RWMutexType::readLock lock(m_mutex);
    return !m_timers.empty();
}

bool TimerManager::detectClockRollover(uint64_t now_ms)
{
    bool isRollover = false;

    if(now_ms < m_previouseTime && now_ms < (m_previouseTime - 60 * 60 * 1000)){
        isRollover = true;
    }
    m_previouseTime = now_ms;
    return isRollover;
}

void TimerManager::addTimer(Timer::ptr timer, RWMutexType::writeLock &lock)
{
    auto it = m_timers.insert(timer).first;
    bool at_front = (it == m_timers.begin()) && !m_tickled;
    if(at_front){
        m_tickled = true;
    }
    lock.unlock();
    if(at_front){
        onTimerInsertedAtFront();
    }

}

bool Timer::Comparator::operator()(const Timer::ptr &lhs, const Timer::ptr &rhs) const
{
    if(!lhs && !rhs){
        return false;
    }
    if(!lhs){
        return true;
    }
    if(!rhs){
        return false;
    }
    if(lhs->m_next < rhs->m_next){
        return true;
    }
    if(rhs->m_next > rhs->m_next){
        return false;
    }
    return lhs.get() < rhs.get();
}

}