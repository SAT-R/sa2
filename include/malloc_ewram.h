#ifndef GUARD_MALLOC_EWRAM_H
#define GUARD_MALLOC_EWRAM_H

#include "global.h"

struct EwramNode
{
    /* 0x0 */ struct EwramNode *next; // Heap is implemented as a forward list. 
    /* 0x4 */ s32 state;              // It records how much space is corresponding to this node. 
                                      // When you want to mark it as occupied/busy, negate it. 
    /* 0x8 */ u8 space[0];            // space for general purposes
};

extern struct EwramNode gEwramHeap;

void EwramInitHeap(void);
void *EwramMalloc(u32);
void EwramFree(void *);

#endif // GUARD_MALLOC_EWRAM_H
