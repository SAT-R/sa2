#include "global.h"
#include "random.h"

// Only used in here
u32 gRngPrevValue = 0;
u32 gRngValue = 0;

#define RAND_CONST 0x37119371;

u16 Random(void) {
    u32 new;
    // These need to be loaded
    // and referenced as pointers to
    // match asm
    u32* pPrev = &gRngPrevValue;
    u32* pCurrent = &gRngValue;

    u32 prev = *pPrev;
    gRngPrevValue = *pCurrent;
    
    // This calculation has to be done
    // in 2 stages to match asm
    new = prev + RAND_CONST;
    new += *pCurrent;

    // Could use the pointer here
    // but it's more clear when we assign
    gRngValue = new;

    // Take the top 16 bits
    return ((u16*)&gRngValue)[1];
}

void SeedRng(u32 a, u32 b) {
    gRngPrevValue = a;
    gRngValue = b;
}
