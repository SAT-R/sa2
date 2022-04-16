#include "global.h"
#include "random.h"

static u32 sPrevRngValue;
static u32 sRngValue;

#define RAND_CONST 0x37119371;

u16 Random(void) {
    u32 new;
    // These need to be loaded
    // and referenced as pointers to
    // match asm
    u32* pPrev = &sPrevRngValue;
    u32* pCurrent = &sRngValue;

    u32 prev = *pPrev;
    sPrevRngValue = *pCurrent;
    
    // This calculation has to be done
    // in 2 stages to match asm
    new = prev + RAND_CONST;
    new += *pCurrent;

    // Could use the pointer here
    // but it's more clear when we assign
    sRngValue = new;

    // Take the top 16 bits
    return ((u16*)&sRngValue)[1];
}

void SeedRng(u32 a, u32 b) {
    sPrevRngValue = a;
    sRngValue = b;
}
