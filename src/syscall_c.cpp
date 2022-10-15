#include "../h/syscall_c.h"
#include "../lib/hw.h"
#include "../h/tcb.hpp"

void move_regs(){
    __asm__ volatile ("mv a7, a6");
    __asm__ volatile ("mv a6, a5");
    __asm__ volatile ("mv a5, a4");
    __asm__ volatile ("mv a4, a3");
    __asm__ volatile ("mv a3, a2");
    __asm__ volatile ("mv a2, a1");
    __asm__ volatile ("mv a1, a0");
}

//==========[MEMORY]=============================================================
void* mem_alloc (size_t size){
    uint64 func_id=0x01;
    uint64 result;

    if(size<=0) return nullptr;

    size_t my_size=size/MEM_BLOCK_SIZE;
    if(size % MEM_BLOCK_SIZE > 0){
        my_size++;
    }
    __asm__ volatile ("mv a1, %0" : : "r" (my_size));

    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    return (void*)result;
}

int mem_free (void* p){
    uint64 func_id=0x02;
    uint64 result;

    if(p==nullptr) return -8;

    move_regs();
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    if(result!=0) return -8;
    else return result;
}

//==========[THREADS]=============================================================
int thread_create (thread_t* handle, void(*start_routine)(void*),void* arg){
    uint64 func_id=0x11;
    uint64 result;

    if(handle==nullptr) return -4;
    uint64* stack=(uint64*)mem_alloc((size_t)DEFAULT_STACK_SIZE * sizeof(uint64));

    __asm__ volatile ("mv a1, %0" : : "r" (handle));
    __asm__ volatile ("mv a2, %0" : : "r" (start_routine));
    __asm__ volatile ("mv a3, %0" : : "r" (arg));
    __asm__ volatile ("mv a4, %0" : : "r" (stack));

    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    return result;
}

int thread_exit (){
    uint64 func_id=0x12;
    uint64 result;

    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    return result;
}

void thread_dispatch (){
    uint64 func_id=0x13;

    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
}

int thread_make (thread_t* handle, void(*start_routine)(void*),void* arg){
    uint64 func_id=0x14;
    uint64 result;

    if(handle==nullptr) return -4;
    void* stack=mem_alloc(DEFAULT_STACK_SIZE * sizeof(uint64));

    __asm__ volatile ("mv a1, %0" : : "r" (handle));
    __asm__ volatile ("mv a2, %0" : : "r" (start_routine));
    __asm__ volatile ("mv a3, %0" : : "r" (arg));
    __asm__ volatile ("mv a4, %0" : : "r" (stack));

    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    return result;
}

int thread_start (thread_t handle){
    uint64 func_id=0x15;
    uint64 result;

    if(handle==nullptr) return -8;

    move_regs();
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    return result;
}

//==========[SEMS]=============================================================
int sem_open (sem_t* handle, unsigned init){
    uint64 func_id=0x21;
    uint64 result;

    if(!handle) return -2;
    move_regs();
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    return result;
}

int sem_close (sem_t handle){
    uint64 func_id=0x22;
    uint64 result;

    if(handle==nullptr) return -16;
    move_regs();
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    return result;
}

int sem_wait (sem_t id){
    uint64 func_id=0x23;
    uint64 result;

    if(id==nullptr) return -16;
    move_regs();
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    return result;
}

int sem_signal (sem_t id) {
    uint64 func_id=0x24;
    uint64 result;

    if(id==nullptr) return -16;
    move_regs();
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    return result;
}

//==========[MISC]=============================================================

int time_sleep (time_t t){
    uint64 func_id=0x31;
    uint64 result;

    move_regs();
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    return result;
}

char getc(){
    uint64 func_id=0x41;
    uint64 result;

    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    return (char)result;
}

void putc(char c){
    uint64 func_id=0x42;

    move_regs();
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
}


int test_function_abi(int param1, int param2){
    uint64 func_id=0x69;
    uint64 result;

    move_regs();
    __asm__ volatile ("mv a0, %0" : : "r" (func_id));
    __asm__ volatile ("ecall");
    __asm__ volatile ("mv %0, a0" : "=r" (result));
    return result;
}