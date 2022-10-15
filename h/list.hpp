//
// Created by DjordjeS on 20.7.2022.
//

#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_LIST_HPP
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_LIST_HPP

#include "../lib/hw.h"
#include "../lib/mem.h"

template<typename T>
class List
{
protected:
    struct Elem{
        //---[NEW i DELETE]--------------------------------------------
        void *operator new(size_t n){return __mem_alloc(n);}
        void *operator new[](size_t n){return __mem_alloc(n);}
        void operator delete(void *p) {__mem_free(p);}
        void operator delete[](void *p) {__mem_free(p);}
        //-------------------------------------------------------------

        T *data;
        Elem *next;

        Elem(T *data, Elem *next) : data(data), next(next) {}
    };

    Elem *head, *tail;
    unsigned length;
    friend class TCB;
    friend class SleepingThread;

public:
    //---[NEW i DELETE]--------------------------------------------
    void *operator new(size_t n){return __mem_alloc(n);}
    void *operator new[](size_t n){return __mem_alloc(n);}
    void operator delete(void *p) {__mem_free(p);}
    void operator delete[](void *p) {__mem_free(p);}
    //-------------------------------------------------------------
    List() : head(0), tail(0), length(0) {}

    List(const List<T> &) = delete;

    List<T> &operator=(const List<T> &) = delete;

    unsigned get_length() const { return length;}

    void addFirst(T *data)
    {
        Elem *elem = new Elem(data, head);
        head = elem;
        if (!tail) { tail = head; }
        length++;
    }

    void addLast(T *data)
    {
        Elem *elem = new Elem(data, 0);
        if (tail)
        {
            tail->next = elem;
            tail = elem;
        } else
        {
            head = tail = elem;
        }
        length++;
    }

    T *removeFirst()
    {

        if (!head) { return 0; }
        length--;
        Elem *elem = head;
        head = head->next;
        if (!head) { tail = 0; }

        T *ret = elem->data;
        delete elem;
        return ret;
    }

    T *peekFirst()
    {
        if (!head) { return 0; }
        return head->data;
    }

    T *removeLast()
    {
        if (!head) { return 0; }
        length--;
        Elem *prev = 0;
        for (Elem *curr = head; curr && curr != tail; curr = curr->next)
        {
            prev = curr;
        }

        Elem *elem = tail;
        if (prev) { prev->next = 0; }
        else { head = 0; }
        tail = prev;

        T *ret = elem->data;
        delete elem;
        return ret;
    }

    T *peekLast()
    {
        if (!tail) { return 0; }
        return tail->data;
    }
};

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_2_INTERRUPT_LIST_HPP