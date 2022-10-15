//
// Created by DjordjeS on 21.7.2022.
//

#include "../h/tcb.hpp"
#include "../h/workers.hpp"
#include "../h/print.hpp"
#include "../test/printing.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"
#include "../h/userMain.hpp"
#include "../h/MemoryAllocator.hpp"

void testWrapper(void *arg){
    userMain();
    printString("User finished\n");
}

void main(){
    MemoryAllocator::initMemory();
    TCB* kernelThread = TCB::initKernel();
    TCB* inactiveThread = TCB::initInactiveThread();
    TCB* consolePrintThread = TCB::initConsoleThread();

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    thread_t user1;
    thread_create(&user1, testWrapper, (void*)nullptr);

    while (!user1->isFinished() || Riscv::buffer_output->getSize() > 0) {
        thread_dispatch();
    }
    printString("Main finished\n");

    delete user1;
    delete kernelThread;
    delete inactiveThread;
    delete consolePrintThread;
}