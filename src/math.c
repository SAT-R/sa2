#include "global.h"


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
