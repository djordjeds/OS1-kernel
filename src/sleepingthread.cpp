//
// Created by DjordjeS on 26.7.2022.
//

#include "../h/sleepingthread.hpp"

List<TCB> SleepingThread::sleeping_threads; //ulancana lista uspavanih niti, head se najranije budi poslednji najkasnije

time_t SleepingThread::time_elapsed = 0;

void SleepingThread::go_sleep(TCB *thread, time_t time) {
    //SLEEPING state je postavljeno u TCB:sleep
    if(time<0 || thread==nullptr) return;

    thread->time_to_sleep = time + time_elapsed; //relativno vreme budjenja

    if(sleeping_threads.get_length() == 0){
        //prazna lista uspavanih - ova thread postaje prva i jedina
        sleeping_threads.addFirst(thread);
    }
    else{
        List<TCB>::Elem* tren=sleeping_threads.head;
        List<TCB>::Elem* prev=nullptr;
        bool added=false;

        while(tren!=nullptr){
            if(tren->data->time_to_sleep > thread->time_to_sleep){
                //nasli smo nit koja ima vreme duze(kasnije) od naseg
                if(prev==nullptr){
                    //nas thread postaje novi prvi u listi sa najmanjim vremenom - jer glava ima duze vreme
                    sleeping_threads.addFirst(thread);
                    added=true;
                }
                else{
                    //izmedju 2
                    List<TCB>::Elem* new_elem= new List<TCB>::Elem(thread, tren);
                    prev->next=new_elem;
                    sleeping_threads.length++;
                    added=true;
                }
            }
            prev=tren;
            tren=tren->next;
        }
        if(added==false){
            //ovaj thread je poslednji u listi - najduze vreme
            sleeping_threads.addLast(thread);
        }
    }
}

void SleepingThread::tick() {
    if(sleeping_threads.length==0){
        //ne merimo vreme - nema niti koje spavaju
        time_elapsed=0;
    }
    else{
        time_elapsed=time_elapsed+1;
    }

    while(sleeping_threads.length>0){

        if(time_elapsed >= sleeping_threads.peekFirst()->time_to_sleep){
            TCB* thr=sleeping_threads.removeFirst();
            if(thr->getState() == TCB::SLEEPING){
                thr->prepare();
            }
        }
        else{
            break;
        }
    }
}
