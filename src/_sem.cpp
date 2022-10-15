//
// Created by DjordjeS on 24.7.2022.
//

#include "../h/_sem.hpp"

_sem::~_sem() {
    this->close();
}

int _sem::wait (){
    if(active==false){
        return -4;
    }
    if(--val<0){
        blocked.addLast(TCB::running);
        TCB::block();
    }

    if(active==true){
        return 0;
    }
    else{
        //slucaj kada je semafor dealociran dok je pozivajuca nit na njemu cekala
        return -8;
    }
}

int _sem::signal (){
    if(active==false){
        return -4;
    }
    if(++val<=0){
        TCB* t=blocked.removeFirst();
        t->unblock();
    }

    return 0;
}

int _sem::close() {
    if(active==false){
        return -4;
    }

    val=0, active=false;

    while(blocked.get_length()>0){
        //Sve niti koje su se zatekle da cekaju na semaforu
        //se deblokiraju, pri cemu njihov wait vraca gresku
        TCB* t=blocked.removeFirst();
        t->unblock();
    }
    return 0;
}