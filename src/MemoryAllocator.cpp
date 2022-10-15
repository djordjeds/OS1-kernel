//
// Created by DjordjeS on 6.8.2022.
//
#include "../h/MemoryAllocator.hpp"

MemFragment* MemoryAllocator::free_mem_head = nullptr;

MemFragment* MemoryAllocator::allocated_head = nullptr;

void MemoryAllocator::initMemory(){
    free_mem_head = (MemFragment*)HEAP_START_ADDR;

    free_mem_head->next = nullptr;
    free_mem_head->prev = nullptr;
    free_mem_head->free = true;
    free_mem_head->size = (size_t)( (char*)HEAP_END_ADDR - sizeof(size_t) - (char*)HEAP_START_ADDR - MEM_BLOCK_SIZE);
}

void* MemoryAllocator::allocate(size_t size){
    if(size<=0) return nullptr;

    size_t my_size=size/MEM_BLOCK_SIZE;
    if(size % MEM_BLOCK_SIZE > 0){
        my_size++;
    }
    my_size = my_size * MEM_BLOCK_SIZE;

    MemFragment* tren = free_mem_head;

    while(tren!=nullptr){
        if(tren->size == my_size){
            discard_from_fl(tren);
            add_to_al(tren);
            return (void*)( (char*)tren + MEM_BLOCK_SIZE);
        }
        else if(tren->size > my_size){
            discard_from_fl(tren);

            MemFragment* new_free_frag=(MemFragment*)( (char*)tren + MEM_BLOCK_SIZE + my_size);
            new_free_frag->size=(tren->size - MEM_BLOCK_SIZE - my_size);
            new_free_frag->next= nullptr;
            new_free_frag->prev= nullptr;
            add_to_fl(new_free_frag);

            tren->size=my_size;
            add_to_al(tren);
            return (void*)((char*)tren + MEM_BLOCK_SIZE);
        }

        tren=tren->next;
    }

    return nullptr;
}

int MemoryAllocator::free_memory(void* ptr) {
    if(ptr==nullptr) return -2;

    MemFragment* fragment=(MemFragment*)( (char*)(ptr) - MEM_BLOCK_SIZE);
    if(!fragment->free){
        discard_from_al(fragment);
        add_to_fl(fragment);
        return 0;
    }
    return -4;
}

void MemoryAllocator::add_to_fl(MemFragment* fragment) {
    if(fragment==nullptr) return;

    fragment->free=true;

    if(free_mem_head==nullptr){
        free_mem_head=fragment;
        return;
    }

    //fragment postaje nova glava
    if(fragment < free_mem_head){
        fragment->next = free_mem_head;
        fragment->prev = nullptr;
        free_mem_head->prev = fragment;
        free_mem_head = fragment;

        MemFragment* tren = free_mem_head->next;
        //potencijalno spajanje sa sledecim (koji je pre ovoga bio glava)
        if( ( (char*)free_mem_head + free_mem_head->size + MEM_BLOCK_SIZE) >= ((char*)tren) ){
            free_mem_head->size = free_mem_head->size + tren->size + MEM_BLOCK_SIZE;
            free_mem_head->next=tren->next;
            if(tren->next!=nullptr) tren->next->prev=free_mem_head;
            tren->next=nullptr;
            tren->prev=nullptr;
        }
        return;
    }

    MemFragment* tren = free_mem_head->next;
    MemFragment* prev = free_mem_head;
    while(tren!=nullptr){
        //stavljamo u sred liste
        if(fragment<tren){
            prev->next=fragment;
            tren->prev=fragment;
            fragment->prev=prev;
            fragment->next=tren;

            //potencijalno spajanje sa sledecim
            if( ( (char*)fragment + fragment->size + MEM_BLOCK_SIZE) >= ((char*)tren) ){
                fragment->size = fragment->size + tren->size + MEM_BLOCK_SIZE;
                fragment->next=tren->next;
                if(tren->next!=nullptr) tren->next->prev=fragment;
                tren->next=nullptr;
                tren->prev=nullptr;
            }
            return;
        }

        prev=tren;
        tren=tren->next;
    }
    //na kraju liste stavljamo fragment
    prev->next=fragment;
    fragment->prev=prev;
    fragment->next=nullptr;
    return;
}

void MemoryAllocator::discard_from_fl(MemFragment* fragment) {
    if(fragment==nullptr || free_mem_head==nullptr) return;

    //ako je glava
    if(fragment==free_mem_head){
        free_mem_head=free_mem_head->next;
        if(free_mem_head) {
            free_mem_head->prev = nullptr;
        }
        fragment->next=nullptr;
        fragment->prev=nullptr;
        return;
    }

    MemFragment* levi = fragment->prev;
    MemFragment* desni = fragment->next;

    levi->next=desni;
    if(desni != nullptr) desni->prev=levi;
    fragment->next=nullptr;
    fragment->prev=nullptr;
    return;
}

void MemoryAllocator::add_to_al(MemFragment* fragment) {
    if(fragment==nullptr) return;
    fragment->free=false;

    if(allocated_head==nullptr){
        allocated_head=fragment;
        return;
    }
    if(fragment < allocated_head){
        fragment->next = allocated_head;
        fragment->prev = nullptr;
        allocated_head->prev = fragment;
        allocated_head = fragment;
        return;
    }

    MemFragment* tren = allocated_head->next;
    MemFragment* prev = allocated_head;
    while(tren!=nullptr){
        if(fragment<tren){
            prev->next=fragment;
            tren->prev=fragment;
            fragment->prev=prev;
            fragment->next=tren;
            return;
        }

        prev=tren;
        tren=tren->next;
    }
    prev->next=fragment;
    fragment->prev=prev;
    fragment->next=nullptr;
    return;
}

void MemoryAllocator::discard_from_al(MemFragment* fragment) {
    if(fragment==nullptr || allocated_head==nullptr) return;

    if(fragment==allocated_head){
        allocated_head=allocated_head->next;
        if(allocated_head!=nullptr)allocated_head->prev=nullptr;
        fragment->next=nullptr;
        fragment->prev=nullptr;
        return;
    }

    MemFragment* levi = fragment->prev;
    MemFragment* desni = fragment->next;

    levi->next=desni;
    if(desni != nullptr) desni->prev=levi;
    fragment->next=nullptr;
    fragment->prev=nullptr;
    return;
}

