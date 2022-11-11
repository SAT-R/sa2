#ifndef GUARD_RANDOM_H
#define GUARD_RANDOM_H

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

#endif // GUARD_RANDOM_H
