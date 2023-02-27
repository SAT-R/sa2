#ifndef GUARD_MATH_H
#define GUARD_MATH_H

#include "global.h"

// Returns a 16-bit pseudorandom number
u16 Random(void);

// Returns a 32-bit pseudorandom number
#define Random32() ((Random() << 16) | Random())

#define ShuffleRngSeed()                                                                \
    ({                                                                                  \
        u32 rand1, rand2, rand3;                                                        \
        rand1 ^= (Random() << 16);                                                      \
        rand1 ^= Random();                                                              \
        rand3 ^= rand1;                                                                 \
        SeedRng(rand2, rand3);                                                          \
        rand1 ^= (Random() << 16);                                                      \
        rand1 ^= Random();                                                              \
        rand2 ^= rand1;                                                                 \
        SeedRng(rand2, rand3);                                                          \
    })

// Sets the initial seed values of the pseudorandom number generator
void SeedRng(u32 a, u32 b);

u32 AbsMax(s32 a, s32 b);
// AbsSumMul
u32 sub_8085530(s32 a, s32 b);
s16 sub_808558C(u16 a, u16 b, u8 c);
u32 sub_80855C0(s32 a, s32 b, s32 c, u8 d);
s32 sub_8085698(s32 a, s32 b, s32 c, u8 d, u8 e);
s32 sub_8085654(s32, s32, s32, u8, u8);

#endif // GUARD_MATH_H