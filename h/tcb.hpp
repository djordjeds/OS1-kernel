#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_TCB_HPP
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_TCB_HPP

#include "../lib/hw.h"
#include "syscall_c.h"
#include "scheduler.hpp"
#include "list.hpp"

// Thread Control Block
class TCB{
public:
    //---[NEW i DELETE]--------------------------------------------
    void *operator new(size_t n){return __mem_alloc(n);}
    void *operator new[](size_t n){return __mem_alloc(n);}
    void operator delete(void *p) {__mem_free(p);}
    void operator delete[](void *p) {__mem_free(p);}
    //-------------------------------------------------------------
    enum state {CREATED, READY, RUNNING, FINISHED, BLOCKED, SLEEPING, INACTIVE};

    ~TCB();

    bool isFinished() const {
        if(current_state==FINISHED){
            return true;
        }
        else return false;
    }

    void setState(state my_state) {current_state=my_state; return;}
    state getState() {return current_state;}

    uint64 getTimeSlice() const { return timeSlice; }

    //using Body = void (*)();
    using Body = void(*)(void*);

    static TCB* initKernel();

    static TCB* initInactiveThread();

    static TCB* initConsoleThread();

    static TCB* inactiveThread;

    static TCB* consolePrintThread;

    static TCB* running;

    static TCB* kernel;

    time_t time_to_sleep;

    //static void yield();
private:
    //sa stavljanjem u listu svih niti i za potrebe sistemskog poziva thread_create
    TCB(TCB** handle, Body body, void *arg, uint64 *stack_f, bool privileged=false) :
            body(body),
            stack(body != nullptr ? stack_f : nullptr),
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) &stack_f[DEFAULT_STACK_SIZE]: 0
                    }),
            arg(arg),
            timeSlice(DEFAULT_TIME_SLICE),
            privileged(privileged)
    {
        *handle=this;
        if(body==nullptr){
            current_state=RUNNING;
        }
        else{
            current_state=CREATED;
        }
        my_id=++all_threads_id;
        all_threads.addLast(this);

        time_to_sleep=-1;
    }

    //bez stavljanja u listu niti, najvise za privilegovane
    TCB(Body body, void *arg, uint64 *stack_f, bool privileged=false) :
            body(body),
            stack(body != nullptr ? stack_f : nullptr),
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) &stack_f[DEFAULT_STACK_SIZE]: 0
                    }),
            arg(arg),
            timeSlice(DEFAULT_TIME_SLICE),
            privileged(privileged)
    {
        if(body==nullptr){
            current_state=RUNNING;
        }
        else{
            current_state=CREATED;
        }

        time_to_sleep=-1;
    }

    struct Context
    {
        uint64 ra;
        uint64 sp;
    };

    Body body;
    uint64 *stack;
    Context context;
    void* arg;
    state current_state;
    uint64 timeSlice;
    bool privileged; //S mode - 1, U mode - 0

    uint64 my_id;
    //lista svih niti, kada se pokrene ~TCB() nit se unistava i izbacuje iz liste
    static List<TCB> all_threads;
    static uint64 all_threads_id;

    friend class Riscv;
    friend class _sem;
    friend class SleepingThread;

    static void threadWrapper();

    static void inactiveWrapper(void* arg);

    static void consoleThreadWrapper(void* arg);

    static void contextSwitch(Context *oldContext, Context *runningContext);

    static void dispatch();

    static uint64 timeSliceCounter;

    void prepare();

    static int exit();

    //sems
    static int block();
    int unblock();

    static int sleep(time_t);

    static List<TCB>::Elem* find_elem_in_allthreads(uint64 id);

    int start(); //za Thread C++ API
};

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_TCB_HPP