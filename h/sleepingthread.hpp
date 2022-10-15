//
// Created by DjordjeS on 26.7.2022.
//

#ifndef _sleeping_thread_hpp_
#define _sleeping_thread_hpp_

#include "list.hpp"
#include "tcb.hpp"

class SleepingThread{

public:
    //---[NEW i DELETE]--------------------------------------------
    void *operator new(size_t n){return __mem_alloc(n);}
    void *operator new[](size_t n){return __mem_alloc(n);}
    void operator delete(void *p) {__mem_free(p);}
    void operator delete[](void *p) {__mem_free(p);}
    //-------------------------------------------------------------

    static List<TCB> sleeping_threads;
    static void go_sleep(TCB* thread, time_t time);
    static void tick();
private:

    static time_t time_elapsed;
};


#endif //_sleeping_thread_hpp_