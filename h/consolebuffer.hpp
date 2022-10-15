//
// Created by DjordjeS on 30.7.2022.
//

#ifndef _console_buffer_hpp_
#define _console_buffer_hpp_
#include "_sem.hpp"

#define N 1000

class ConsoleBuffer{
public:
    //---[NEW i DELETE]--------------------------------------------
    void *operator new(size_t n){return __mem_alloc(n);}
    void *operator new[](size_t n){return __mem_alloc(n);}
    void operator delete(void *p) {__mem_free(p);}
    void operator delete[](void *p) {__mem_free(p);}
    //-------------------------------------------------------------

    ConsoleBuffer();
    ConsoleBuffer(int cap);
    ~ConsoleBuffer();
    void put(char);
    char take();
    void put_kernel(char);
    char take_kernel();
    int getSize() const;

private:
    char buffer[N+1];
    int front = 0, rear = 0, size = 0, capacity;
    sem_t mutexP;
    sem_t mutexC;
    sem_t empty, full;

    friend class Riscv;
};

#endif //_console_buffer_hpp_