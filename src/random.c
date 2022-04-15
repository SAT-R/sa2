#include "global.h"
#include "random.h"

// Stored as a 32 bit value
// but represented as an array to access
// the top 16 bits
// TODO: make static
extern u32 gPrevRngValue;
extern u16 gRngValue[];

#define RAND_CONST 0x37119371;

u16 Random(void) {
    u32 new;
    // These need to be loaded
    // and referenced as pointers to
    // match asm
    u32* pPrev = &gPrevRngValue;
    u32* pCurrent = (u32*)&gRngValue;

    u32 prev = *pPrev;
    gPrevRngValue = *pCurrent;
    
    // This calculation has to be done
    // in 2 stages to match asm
    new = prev + RAND_CONST;
    new += *pCurrent;

    // Could use the pointer here
    // but it's more clear when we assign
    *(u32*)&gRngValue = new;

    // Take the top 16 bits
    return gRngValue[1];
}

void SeedRng(u32 a, u32 b) {
    gPrevRngValue = a;
    *(u32*)gRngValue = b;
}
