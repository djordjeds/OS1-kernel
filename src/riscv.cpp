#include "../h/riscv.hpp"
#include "../h/tcb.hpp"
#include "../h/print.hpp"
#include "../test/printing.hpp"
#include "../h/syscall_c.h"
#include "../h/_sem.hpp"
#include "../h/sleepingthread.hpp"

//using Body = void (*)();
using Body = void(*)(void*);

ConsoleBuffer* Riscv::buffer_input = nullptr;
ConsoleBuffer* Riscv::buffer_output = nullptr;

void Riscv::popSppSpie(){
    mc_sstatus(SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret"); //return after handling a trap - S(supervisor)
}

uint64 Riscv::sysfunctions(uint64 *params){

    switch(params[0]){
        //----------[MEMORY]-------------------------------------------------------------
        case 0x01: //mem_alloc
            return (uint64)__mem_alloc(MEM_BLOCK_SIZE * params[1]);
            break;

        case 0x02: //mem_free
            return (uint64)__mem_free((void*)params[1]);
            break;

        //----------[THREADS]-------------------------------------------------------------
        case 0x11: //thread_create
        {
//          size_t size=DEFAULT_STACK_SIZE * sizeof(uint64);
//          size_t my_size=size/MEM_BLOCK_SIZE;
//          if(size % MEM_BLOCK_SIZE > 0){
//              my_size++;
//          }
//          uint64* stack=(uint64*)__mem_alloc((uint64)MEM_BLOCK_SIZE * my_size);
            TCB* t = new TCB((thread_t *) params[1], (Body) params[2], (void *) params[3], (uint64*)params[4]);
            t->prepare();
            return 0;
        }
        break;

        case 0x12: //thread_exit
            return TCB::exit();
            break;

        case 0x13: //thread_dispatch
        {
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            return 0;
        }
        break;

        case 0x14: //thread_make za Thread C++ API
        {
            new TCB((thread_t *) params[1], (Body) params[2], (void *) params[3], (uint64*)params[4]);
            return 0;
        }
        break;

        case 0x15: //thread_start za Thread C++ API
        {
            thread_t t=(thread_t)params[1];
            return t->start();
        }
            break;

        //----------[SEMS]-------------------------------------------------------------
        case 0x21: //sem_open
        {
            new _sem((sem_t *) params[1], (unsigned) params[2]);
            return 0;
        }
        break;

        case 0x22: //sem_close
        {
            sem_t sem=(sem_t)params[1];
            return sem->close();
        }
        break;

        case 0x23: //sem_wait
        {
            sem_t sem=(sem_t)params[1];
            return sem->wait();
        }
        break;

        case 0x24: //sem_signal
        {
            sem_t sem=(sem_t)params[1];
            return sem->signal();
        }
        break;

        //----------[MISC]-------------------------------------------------------------
        case 0x31: //time_sleep
            return TCB::sleep((time_t)params[1]);
            break;

        case 0x41: //getc
            return (uint64)buffer_input->take_kernel();
            break;

        case 0x42: //putc
            buffer_output->put_kernel((uint8)params[1]);
            return 0;
            break;

        case 0x69: //test f
            return params[1]-params[2];
            break;

        default: return -16;
    }

}

void Riscv::handleSupervisorTrap(){
    uint64 params[8];
    __asm__ volatile ("mv %0, a7" : "=r" (params[7]));
    __asm__ volatile ("mv %0, a6" : "=r" (params[6]));
    __asm__ volatile ("mv %0, a5" : "=r" (params[5]));
    __asm__ volatile ("mv %0, a4" : "=r" (params[4]));
    __asm__ volatile ("mv %0, a3" : "=r" (params[3]));
    __asm__ volatile ("mv %0, a2" : "=r" (params[2]));
    __asm__ volatile ("mv %0, a1" : "=r" (params[1]));
    __asm__ volatile ("mv %0, a0" : "=r" (params[0]));

    uint64 scause = r_scause();
    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL){
        // interrupt: no; cause code: ENVIRONMENT CALL (ecall) from U-mode(8)user or S-mode(9)supervisor
        uint64 volatile sepc = r_sepc() + 4;
        uint64 volatile sstatus = r_sstatus();

        uint64 result=sysfunctions(params);

        w_sstatus(sstatus);
        w_sepc(sepc);

        __asm__ volatile ("mv a0, %0" : : "r" (result));
    }
    else if (scause == 0x8000000000000001UL){
        // TIMER interrupt: yes; cause code: supervisor SOFTWARE INTERRUPT (CLINT; machine TIMER interrupt)
        TCB::timeSliceCounter++;
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()){
            uint64 volatile sepc = r_sepc();
            uint64 volatile sstatus = r_sstatus();
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc);
        }

        SleepingThread::tick();
        mc_sip(SIP_SSIP);
    }
    else if (scause == 0x8000000000000009UL){
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        // console_handler();
        uint64 device = plic_claim();
        uint8 current_status;
        char sent_char;

        if (device == CONSOLE_IRQ){
            while(true){
                current_status = *((uint8*)CONSOLE_STATUS);
                if((CONSOLE_RX_STATUS_BIT & current_status) == 0) break;
                sent_char = *((char*)CONSOLE_RX_DATA);
                buffer_input->put_kernel(sent_char);
            }
        }
        plic_complete(device);
    }
    else{
        //UNKNOWN
//        uint64 scause = r_scause(), sepc = r_sepc();
//        printString("----------------------------\n");
//        printString("SCAUSE: "); //opis razloga za prelazak u sistemski rezim
//        printInteger(scause);
//        printString("\n");
//
//        printString("SEPC:   "); //sačuvana vrednost registra pc u korisničkom režimu
//        printInteger(sepc);
//        printString("\n----------------------------\n");
//        while(true);
    }
}