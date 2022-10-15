//
// Created by DjordjeS on 8.8.2022.
//
#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"

void* __mem_alloc(size_t size){
    return MemoryAllocator::allocate(size);
}

int __mem_free(void *ptr){
    return MemoryAllocator::free_memory(ptr);
}
