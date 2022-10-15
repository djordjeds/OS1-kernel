#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_SCHEDULER_HPP
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_SCHEDULER_HPP

#include "list.hpp"

class TCB;

class Scheduler
{
private:
    //spremne niti u Scheduleru
    static List<TCB> readyThreadQueue;

public:
    static TCB* get();
    static int getLength();
    static void put(TCB* ccb);

};

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_SCHEDULER_HPP