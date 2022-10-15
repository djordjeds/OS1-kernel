//
// Created by DjordjeS on 16.7.2022.
//

#ifndef ABI_T
#define ABI_T

#include "../lib/hw.h"
#include "../h/tcb.hpp"

void move_regs();

//----------[MEMORY]-------------------------------------------------------------
void* mem_alloc (size_t);
int mem_free (void*);

//----------[THREADS]-------------------------------------------------------------
class TCB;
typedef TCB* thread_t;
int thread_create (thread_t* handle, void(*start_routine)(void*),void* arg);
void thread_dispatch ();
int thread_exit ();
int thread_make (thread_t* handle, void(*start_routine)(void*),void* arg); // za Thread
int thread_start(thread_t handle); // za Thread

//----------[SEMS]-------------------------------------------------------------
class _sem;
typedef _sem* sem_t;
int sem_open (sem_t* handle, unsigned init);
int sem_close (sem_t handle);
int sem_wait (sem_t id);
int sem_signal (sem_t id);

//----------[MISC]-------------------------------------------------------------
int time_sleep (time_t t);

const int EOF = -1;
char getc ();
void putc (char);

int test_function_abi(int, int);

#endif //ABI_T