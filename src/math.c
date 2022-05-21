#include "global.h"
#include "math.h"

u32 AbsMax(s32 a, s32 b) {
    if (a < 0) {
        a = -a;
    }

    if (b < 0) {
        b = -b;
    }

    if (b < a) {
        return a;
    }
    return b;
}

// AbsSumMul
u32 sub_8085530(s32 a, s32 b) {
    if (a < 0) {
        a = -a;
    }

    if (b < 0) {
        b = -b;
    }

    if (a > b) {
        return (((u64)a * 246) + ((u64)b * 102)) >> 8;
    } else {
        return (((u64)b * 246) + ((u64)a * 102)) >> 8;
    }
}

s16 sub_808558C(u16 a, u16 b, u8 c) {
    u32 c1 = (1 << c);
    u16 c2 = c1 - 1;
    
    b -= a;
    b &= c2;

    if (b <= (c1 / 2)) {
        return b;
    } else {
        return (b - c1);
    }
}

u32 sub_80855C0(s32 a, s32 b, s32 c, u8 d) {
    s64 e = (s64)c * (a - b);

    return a - (e >> d);
}

#ifndef NON_MATCHING
ASM_FUNC("asm/non_matching/sub_80855F8.inc", u16 sub_80855F8(s16 a, u16 b, u8 c, u16 d, s16 e))
#else
// Something like this, unused anyway
// https://decomp.me/scratch/ZZB3I
u16 sub_80855F8(s16 a, u16 b, u8 c, u16 d, s16 e) {
    s16 val;
    u16 b1;
    u32 c1 = (1 << c);
    val = ((c1) - 1) & (a - b);

    if ((c1 >> 1) > val) {
        val = (val - c1);
    } else {
        val = val; 
    }

    val *= -(d >> e);
    return val & ((1 << c) - 1);
}
#endif

s32 sub_8085654(s32 a, s32 b, s32 c, u8 d, u8 e) {
    do {
        a -= (((s64)c * (s64)(a - b))) >> d;
        e -= 1;
    } while (e != 0xFF);

    return a;
}
