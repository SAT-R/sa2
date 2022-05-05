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
