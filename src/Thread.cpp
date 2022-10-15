//
// Created by DjordjeS on 1.8.2022.
//

#include "../h/syscall_cpp.hpp"

Thread::Thread(void (*body)(void *), void *arg) {
    thread_make(&myHandle, body, arg);
}

Thread::~Thread() {
    delete myHandle;
}

int Thread::start() {
    return thread_start(myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t t) {
    return time_sleep(t);
}

void Thread::threadWrapper(void* t) {
    if(t){
        ((Thread*)t)->run();
    }
}

Thread::Thread() {
    thread_make(&myHandle, threadWrapper, this);
}