#include "global.h"
#include "math.h"

u32 AbsMax(s32 a, s32 b)
{
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
// NOTE(Jace): Seems to approximate the length of a vector
// If so, 'NormalizeVector' might be a reasonable name?
u32 sub_8085530(s32 a, s32 b)
{
    if (a < 0) {
        a = -a;
    }

    if (b < 0) {
        b = -b;
    }

    if (a > b) {
        return (((u64)a * Q_24_8(0.9609375)) + ((u64)b * Q_24_8(0.3984375))) >> 8;
    } else {
        return (((u64)b * Q_24_8(0.9609375)) + ((u64)a * Q_24_8(0.3984375))) >> 8;
    }
}

s16 sub_808558C(u16 angleA, u16 angleB, u8 numDecimalBits)
{
    u32 c1 = (1 << numDecimalBits);
    u16 c2 = c1 - 1;

    angleB -= angleA;
    angleB &= c2;

    if (angleB <= (c1 / 2)) {
        return angleB;
    } else {
        return (angleB - c1);
    }
}

u32 sub_80855C0(s32 a, s32 b, s32 c, u8 d)
{
    s64 e = (s64)c * (a - b);

    return a - (e >> d);
}

u16 sub_80855F8(u16 r7, u16 r2, u8 r6, s16 r5, u8 r4)
{
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

s32 sub_8085654(s32 a, s32 b, s32 c, u8 d, u8 e)
{
    do {
        a -= (((s64)c * (s64)(a - b))) >> d;
        e -= 1;
    } while (e != 0xFF);

    return a;
}

s32 sub_8085698(s32 a, s32 b, s32 c, u8 d, u8 e)
{
    do {
        b = a - ((((s64)c * (s64)(a - b))) >> d);
        e -= 1;
    } while (e != 0xFF);

    return b;
}

s32 sub_80856DC(s32 a, s32 b, s32 c) { return (a * 7 + b * 6 - c) / 12; }

s32 sub_80856F8(s32 a, s32 b, s32 c) { return ((b * 6 - a) + c * 7) / 12; }

s32 sub_8085714(s32 a, s32 b, s32 c) { return ((a + b * 8) - c) >> 3; }

s32 sub_8085720(s32 a, s32 b, s32 c) { return ((b * 8 - a) + c) >> 3; }

s32 sub_808572C(s32 a, s32 b, s32 c, s32 d, u32 e, u8 f)
{
    return ((s64)(b - a) * (s64)((1 << f) - c)) >> f;
}

s32 sub_8085758(s32 a, s32 b) { return b - a; }

s32 sub_808575C(s32 a, s32 b, s32 c, s32 d, s32 e, s32 f, u8 g)
{
    a = c - a;
    a += a >> 1;
    a -= (b >> 1);
    return ((s64)(a) * ((1 << g) - d)) >> g;
}

s32 sub_8085798(s32 a, s32 b, s32 c) { return ((c - a) + ((c - a) >> 1)) - (b >> 1); }

// same as sub_808575C
s32 sub_80857A4(s32 a, s32 b, s32 c, s32 d, s32 e, s32 f, u8 g)
{
    a = c - a;
    a += a >> 1;
    a -= (b >> 1);
    return ((s64)(a) * ((1 << g) - d)) >> g;
}

s32 sub_80857E0(s32 a, s32 b, s32 c) { return ((c - a) + ((c - a) >> 1)) - (b >> 1); }

s32 sub_80857EC(s32 a, s32 b, s32 c, s32 d, s32 e, s32 f, u8 g)
{
    s32 h = ((s64)(b - a) * (s64)(f + (1 << g))) >> g;
    s64 i = ((s64)(c - b) * (s64)((1 << g) - f)) >> g;
    s64 h64 = h;
    s64 j = ((s32)(i - h) * (s64)((1 << (g - 1)) + (e >> 1))) >> g;
    return ((s64)(j + h64) * (s64)((1 << g) - d)) >> g;
}

s32 sub_80858A4(s32 a, s32 b, s32 c, s32 d, s32 e, s32 f, u8 g)
{
    s32 h = ((s64)(b - a) * (s64)(f + (1 << g))) >> g;
    s64 i = ((s64)(c - b) * (s64)((1 << g) - f)) >> g;
    s64 h64 = h;
    s64 j = ((s32)(i - h) * (s64)((1 << (g - 1)) - (e >> 1))) >> g;
    return ((s64)(j + h64) * (s64)((1 << g) - d)) >> g;
}

s32 sub_808595C(s32 a, s32 b, s32 c)
{
    s32 e = (b - a);
    s32 f = (c - b);
    f -= e;
    f >>= 1;
    return e + f;
}
