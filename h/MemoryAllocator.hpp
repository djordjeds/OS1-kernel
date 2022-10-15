//
// Created by DjordjeS on 6.8.2022.
//
#ifndef mem_alloc_hpp
#define mem_alloc_hpp

#include "../lib/hw.h"

typedef struct MemFragment {
    struct MemFragment* next;
    struct MemFragment* prev;
    size_t size;
    bool free;
} MemFragment;

class MemoryAllocator{
public:
    static MemFragment* free_mem_head;
    static MemFragment* allocated_head;

    static void initMemory();

    static void *allocate(size_t size);
    static int free_memory(void *ptr);

    static void add_to_fl(MemFragment* fragment);
    static void discard_from_fl(MemFragment* fragment);
    static void add_to_al(MemFragment* fragment);
    static void discard_from_al(MemFragment* fragment);
};

#endif //mem_alloc_hpp