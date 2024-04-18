#include "global.h"
#include "game/math.h"

// Only used in here
u32 gRngPrevValue = 0;
u32 gRngValue = 0;

#define RAND_CONST 0x37119371;

// void sub_8085314(struct UNK_8085F1C_1 *p1, struct UNK_8085F1C_1 *p2)
// {
//     s32 unk0 = p2->unk0 * 2;
//     s32 unk2 = p2->unk2[0] * 2;
//     s32 unk4 = p2->unk2[1] * 2;
//     s32 temp0 = (p2->unk2[0] * unk2 * 0x40) >> 0x10;
//     s32 temp1 = (p2->unk2[1] * unk4 * 0x40) >> 0x10;

//     s16 temp2, temp3, temp4, temp5, temp6;

//     p1->unk14 = 0;
//     p1->unk2[0] = 0x400 - (temp0 + temp1);

//     temp2 = (p2->unk2[2] * unk4 * 0x40) >> 0x10;
//     temp3 = (p2->unk0 * unk2 * 0x40) >> 0x10;

//     p1->unk2[1] = temp3 - temp2;

//     temp4 = (p2->unk0 * unk4 * 0x40) >> 0x10;
//     temp5 = (p2->unk2[2] * unk2 * 0x40) >> 0x10;

//     p1->unk2[2] = temp4 + temp5;
//     p1->unk2[3] = temp3 + temp2;

//     temp3 = (p2->unk0 * unk0 * 0x40) >> 0x10;
//     p1->unk2[4] = 0x400 - (temp1 + temp3);

//     temp1 = (p2->unk2[2] * unk0 * 0x40) >> 0x10;
//     temp6 = (p2->unk2[0] * unk4 * 0x40) >> 0x10;

//     p1->unk2[5] = temp6 - temp1;
//     p1->unk2[6] = temp4 - temp5;
//     p1->unk2[7] = temp6 + temp1;
//     p1->unk2[8] = 0x400 - (temp3 + temp0);
//     p1->unk1C = p1->unk14;
//     p1->unk18 = p1->unk14;
// }

void sub_8084B54(struct UNK_8085F1C_1 *, u16, u16, u16);

struct UNK_8085F1C_1 *sub_80853F8(struct UNK_8085F1C *p1)
{
    if (!(p1->unkC & 1)) {
        if (p1->unk10 == 1) {
            sub_8084B54(&p1->unk34, p1->unk54, p1->unk56, p1->unk58);
            p1->unk34.unk2[0] = (p1->unk5C * p1->unk34.unk2[0]) >> 10;
            p1->unk34.unk2[1] = (p1->unk5C * p1->unk34.unk2[1]) >> 10;
            p1->unk34.unk2[2] = (p1->unk5C * p1->unk34.unk2[2]) >> 10;

            p1->unk34.unk2[3] = (p1->unk5E * p1->unk34.unk2[3]) >> 10;
            p1->unk34.unk2[4] = (p1->unk5E * p1->unk34.unk2[4]) >> 10;
            p1->unk34.unk2[5] = (p1->unk5E * p1->unk34.unk2[5]) >> 10;

            p1->unk34.unk2[6] = (p1->unk60 * p1->unk34.unk2[6]) >> 10;
            p1->unk34.unk2[7] = (p1->unk60 * p1->unk34.unk2[7]) >> 10;
            p1->unk34.unk2[8] = (p1->unk60 * p1->unk34.unk2[8]) >> 10;

            p1->unk34.unk14 = p1->unk64;
            p1->unk34.unk18 = p1->unk68;
            p1->unk34.unk1C = p1->unk6C;
        }
        p1->unkC |= 1;
    }

    return &p1->unk34;
}

u16 Random(void)
{
    u32 new;
    // These need to be loaded
    // and referenced as pointers to
    // match asm
    u32 *pPrev = &gRngPrevValue;
    u32 *pCurrent = &gRngValue;

    u32 prev = *pPrev;
    gRngPrevValue = *pCurrent;

    // This calculation has to be done
    // in 2 stages to match asm
    new = prev + RAND_CONST;
    new += *pCurrent;

    // Could use the pointer here
    // but it's more clear when we assign
    gRngValue = new;

    // Take the top 16 bits
    return ((u16 *)&gRngValue)[1];
}

void SeedRng(u32 a, u32 b)
{
    gRngPrevValue = a;
    gRngValue = b;
}

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
