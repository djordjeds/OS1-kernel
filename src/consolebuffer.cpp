//
// Created by DjordjeS on 30.7.2022.
//
#include "../h/consolebuffer.hpp"

ConsoleBuffer::ConsoleBuffer(){
    capacity = N+1;
    new _sem(&mutexP, 1);
    new _sem(&mutexC, 1);
    new _sem(&empty, 0);
    new _sem(&full, N);
}

ConsoleBuffer::ConsoleBuffer(int cap){
    if(cap > N || cap<=0){
        capacity=N+1;
        new _sem(&full, N);
    }
    else{
        capacity=cap+1;
        new _sem(&full, cap);
    }
    new _sem(&mutexP, 1);
    new _sem(&mutexC, 1);
    new _sem(&empty, 0);
}

ConsoleBuffer::~ConsoleBuffer() {
    delete mutexP;
    delete mutexC;
    delete empty;
    delete full;
}

void ConsoleBuffer::put(char new_char) {
    sem_wait(full);
    sem_wait(mutexP);
    buffer[rear] = new_char;
    rear = (rear + 1) % capacity;
    size=size+1;
    sem_signal(mutexP);
    sem_signal(empty);
}

char ConsoleBuffer::take() {
    sem_wait(empty);
    sem_wait(mutexC);
    char c=buffer[front];
    front = (front + 1) % capacity;
    size=size-1;
    sem_signal(mutexC);
    sem_signal(full);
    return c;
}

void ConsoleBuffer::put_kernel(char new_char) {
    full->wait();
    mutexP->wait();
    buffer[rear] = new_char;
    rear = (rear + 1) % capacity;
    size=size+1;
    mutexP->signal();
    empty->signal();
}

char ConsoleBuffer::take_kernel() {
    empty->wait();
    mutexC->wait();
    char c=buffer[front];
    front = (front + 1) % capacity;
    size=size-1;
    mutexC->signal();
    full->signal();
    return c;
}

int ConsoleBuffer::getSize() const {
    return size;
}


