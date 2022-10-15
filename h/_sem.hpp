//
// Created by DjordjeS on 24.7.2022.
//

#ifndef _sem_hpp_os
#define _sem_hpp_os

#include "syscall_c.h"
#include "tcb.hpp"
#include "list.hpp"

class _sem{
public:
    //---[NEW i DELETE]--------------------------------------------
    void *operator new(size_t n){return __mem_alloc(n);}
    void *operator new[](size_t n){return __mem_alloc(n);}
    void operator delete(void *p) {__mem_free(p);}
    void operator delete[](void *p) {__mem_free(p);}
    //-------------------------------------------------------------

    int value () const { return val; }

private:
    _sem(sem_t *handle, unsigned init=1) : val(init){
        *handle = this;
        active=true;
    }
    ~_sem();

    int wait ();
    int signal ();
    int close ();
    int val;
    bool active;
    List<TCB> blocked;

    friend class Riscv;
    friend class ConsoleBuffer;
};
#endif //_sem_hpp_os