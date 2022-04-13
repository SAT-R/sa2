#ifndef GUARD_RANDOM_H
#define GUARD_RANDOM_H

#include "global.h"

extern u32 gUnknown_03005B70;
extern u16 gUnknown_03005B74[];

// Returns a 16-bit pseudorandom number
u16 Random(void);

// Returns a 32-bit pseudorandom number
#define Random32() ((Random() << 16) | Random())

// Sets the initial seed values of the pseudorandom number generator
void SeedRng(u32 a, u32 b);

#endif // GUARD_RANDOM_H
