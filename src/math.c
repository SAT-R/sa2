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

u16 sub_80855F8(u16 r7, u16 r2, u8 r6, s16 r5, u8 r4) {
    u16 r2_2 = r2;
    u32 r3 = (1 << r6);
    s32 r1 = r3 - 1;
    u32 r0 = r2_2 - r7;
    u16 val;
    s32 r1_2;
    r2_2 = (r0 & r1);
    if (r2_2 > r3 >> 1) {
        r1_2 = (s16)(r2_2 - r3);
    } else {
        r1_2 = (s16)r2_2;
    }
    val = -((r5 * -r1_2) >> r4);
    return (r7 + val) & ((1 << r6) - 1);
}

s32 sub_8085654(s32 a, s32 b, s32 c, u8 d, u8 e) {
    do {
        a -= (((s64)c * (s64)(a - b))) >> d;
        e -= 1;
    } while (e != 0xFF);

    return a;
}
