#ifndef GUARD_MATH_H
#define GUARD_MATH_H

#include "global.h"

// Might be equivalent to UNK_8085D14?
struct UNK_8085F1C_1 {
    s16 unk0;
    s16 unk2[9];
    s32 unk14;
    s32 unk18;
    s32 unk1C;
};

struct UNK_8085F1C {
    struct UNK_8085F1C *unk0;
    u8 unk4[8];
    u32 unkC;
    s32 unk10;
    struct UNK_8085F1C_1 unk14;
    struct UNK_8085F1C_1 unk34;

    s16 unk54;
    s16 unk56;
    s16 unk58;
    u8 unk59[2];

    s16 unk5C;
    s16 unk5E;
    s16 unk60;
    u8 unk62[2];

    s32 unk64;
    s32 unk68;
    s32 unk6C;

    u8 unk70[4];
};

// Returns a 16-bit pseudorandom number
u16 Random(void);

// Returns a 32-bit pseudorandom number
#define Random32() ((Random() << 16) | Random())

#define ShuffleRngSeed()                                                                                                                   \
    ({                                                                                                                                     \
        u32 rand1, rand2, rand3;                                                                                                           \
        rand1 ^= (Random() << 16);                                                                                                         \
        rand1 ^= Random();                                                                                                                 \
        rand3 ^= rand1;                                                                                                                    \
        SeedRng(rand2, rand3);                                                                                                             \
        rand1 ^= (Random() << 16);                                                                                                         \
        rand1 ^= Random();                                                                                                                 \
        rand2 ^= rand1;                                                                                                                    \
        SeedRng(rand2, rand3);                                                                                                             \
    })

// Sets the initial seed values of the pseudorandom number generator
void SeedRng(u32 a, u32 b);

struct UNK_8085F1C_1 *sub_80853F8(struct UNK_8085F1C *p1);

u32 AbsMax(s32 a, s32 b);
// AbsSumMul
u32 sub_8085530(s32 a, s32 b);
s16 sub_808558C(u16 a, u16 b, u8 c);
u32 sub_80855C0(s32 a, s32 b, s32 c, u8 d);
s32 sub_8085698(s32 a, s32 b, s32 c, u8 d, u8 e);
s32 sub_8085654(s32, s32, s32, u8, u8);
s16 sub_8085968(s16 *unk28, u16 param1);

// used by boss 7
u16 sub_80859F4(s16 *, u16);

#endif // GUARD_MATH_H