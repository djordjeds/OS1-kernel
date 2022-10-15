//
// Created by DjordjeS on 1.8.2022.
//

#include "../h/syscall_cpp.hpp"

struct p_struct{
    time_t time;
    PeriodicThread *p_thr;
};

void PeriodicThread::periodicWrapper(void* par){
    p_struct *my_ps = (p_struct*)par;
    while (1){
        time_sleep(my_ps->time);
        my_ps->p_thr->periodicActivation();
    }
}

PeriodicThread::PeriodicThread(time_t period) :
    Thread(PeriodicThread::periodicWrapper, (void*)(new (p_struct){period, this}))
{ }