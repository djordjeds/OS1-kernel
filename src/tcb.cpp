#include "../h/tcb.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.h"
#include "../h/scheduler.hpp"
#include "../h/sleepingthread.hpp"


TCB* TCB::kernel = nullptr;

TCB* TCB::running = nullptr;

uint64 TCB::timeSliceCounter = 0;

uint64 TCB::all_threads_id=0;
List<TCB> TCB::all_threads;

TCB* TCB::consolePrintThread = nullptr;

TCB* TCB::inactiveThread = nullptr;

TCB::~TCB() {
    //ako je INACTIVE nit
    if(this->current_state==INACTIVE){
        delete inactiveThread->stack;
        inactiveThread= nullptr;
        return;
    }

    //uklanjanje iz liste svih niti
    List<TCB>::Elem* tren=all_threads.head;
    List<TCB>::Elem* prev=nullptr;
    while(tren!=nullptr){
        if(tren->data->my_id==this->my_id){
            //pronasao sebe u listi svih niti
            if(prev==nullptr){
                //ja sam head nit u listi
                all_threads.removeFirst();
                break;
            }
            else{
                prev->next=tren->next;
                delete tren;
                break;
            }
        }
        prev=tren;
        tren=tren->next;
    }

    delete[] stack;
}

TCB *TCB::initKernel(){

    TCB* kernelThr=new TCB(nullptr, nullptr, nullptr,true);
    kernel=kernelThr;
    running = kernel;

    Riscv::buffer_input = new ConsoleBuffer();
    Riscv::buffer_output = new ConsoleBuffer();

    return kernelThr;
}

//void TCB::yield()
//{
//    __asm__ volatile ("ecall");
//}

void TCB::dispatch(){

    TCB *old = running;
    if (old->current_state == RUNNING){
        //provera jer je mozda INACTIVE

        old->setState(READY);
        Scheduler::put(old);
    }
    running = Scheduler::get();

    if(running){
        running->setState(RUNNING);
    }else{
        //idle nit - inicijalizacija nje je u mainu
        running=inactiveThread;
    }

    //reinstate the privilege level
    if(running->privileged==false){
        Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    }
    else{
        Riscv::ms_sstatus(Riscv::SSTATUS_SPP);
    }
    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper(){
    Riscv::popSppSpie();
    running->body(running->arg);
    running->setState(FINISHED);
    thread_dispatch();
    //dispatch();
}

void TCB::prepare(){
    this->setState(READY);
    Scheduler::put(this);
};

int TCB::exit(){
    if(running->current_state == RUNNING){
        running->setState(FINISHED);
        dispatch();
        return 0;
    }
    else{
        return -8;
    }
};

int TCB::block(){
    if(running->getState() == RUNNING){
        running->setState(BLOCKED);
        dispatch();
        return 0;
    }
    else{
        return -2;
    }
}

int TCB::unblock(){
    if(this->current_state == BLOCKED){
        this->prepare();
        return 0;
    }
    else{
        return -16;
    }
}

int TCB::sleep(time_t time) {
    if(running->getState() == RUNNING){
        running->setState(SLEEPING);
        SleepingThread::go_sleep(running,time);
        dispatch();
        return 0;
    }
    else{
        return -2;
    }
}

List<TCB>::Elem *TCB::find_elem_in_allthreads(uint64 id_to_find) {
    List<TCB>::Elem* tren=all_threads.head;

    while(tren!=nullptr){
        if(tren->data->my_id==id_to_find){
            return tren;
        }
        tren=tren->next;
    }

    return nullptr;
}


//-------|INACTIVE THREAD|-----------------
TCB* TCB::initInactiveThread() {
    if(inactiveThread==nullptr){
            uint64 *stack = (uint64*)__mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
            inactiveThread=new TCB(&inactiveWrapper, (void*)nullptr, (uint64*)stack, true);
            inactiveThread->setState(INACTIVE);
    }
    return inactiveThread;

}
void TCB::inactiveWrapper(void* arg) {
    while(1){
        thread_dispatch();
    }
}

//-------|CONSOLE PRINT THREAD|-----------------
TCB *TCB::initConsoleThread() {
    if(consolePrintThread==nullptr){
        uint64 *stack = (uint64*)__mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
        consolePrintThread=new TCB(&consoleThreadWrapper, (void*)nullptr, (uint64*)stack, true);
        consolePrintThread->prepare();
    }
    return consolePrintThread;
}
void TCB::consoleThreadWrapper(void* arg) {
    uint8 current_status;
    while(1){
        current_status=*((char *) CONSOLE_STATUS);
        while((CONSOLE_TX_STATUS_BIT & current_status)){
            char reciv_char = Riscv::buffer_output->take();
            (*((char*)CONSOLE_TX_DATA)) = reciv_char;
            current_status = *((char*) CONSOLE_STATUS);
        }
    }
}

int TCB::start() {
    if(this->current_state == CREATED){
        this->setState(READY);
        Scheduler::put(this);
        return 0;
    }
    else return -2;
}


