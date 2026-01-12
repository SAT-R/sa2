#include <string.h>
#include "game/math.h"

#include "trig.h"

// TODO: This is just UNK_8085F1C_1
typedef struct {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    u16 unk8;
    u16 unkA;
    u16 unkC;
    u16 unkE;
    u16 unk10;
    u16 unk12;
    u32 unk14;
    u32 unk18;
    u32 unk1C;
} UNK_8085D14;

// Something different?
typedef struct {
    u16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s32 unk8;
    s32 unkC;
    u16 unk10;
    u16 unk12;
    u32 unk14;
    u32 unk18;
    u32 unk1C;
} UNK_8085D14_2;

typedef struct {
    void *unk0;
    void *start;
    void *next;
    void *unkC;
} UNK_8085DEC;

// Only used in here
u32 gRngPrevValue = 0;
u32 gRngValue = 0;

struct UNK_8085F1C_1 *sub_8085EC4(struct UNK_8085F1C *p1);
static bool8 sub_8085D98(UNK_8085DEC *thing, UNK_8085DEC *target);
void sub_8084B54(struct UNK_8085F1C_1 *, u16, u16, u16);

const u16 gUnknown_080E0290[] = { 0x0AAA, 0x02AA };

#define RAND_CONST 0x37119371;

#define Q_6_10_MUL(qValA, qValB) ((qValA * qValB) >> 10)

NONMATCH("asm/non_matching/game/math/unused_sub_80832FC.inc", void sub_80832FC()) { }
END_NONMATCH

NONMATCH("asm/non_matching/game/math/unused_sub_808343C.inc", void sub_808343C()) { }
END_NONMATCH

void sub_8083504(UNK_8085D14_2 *arg0, UNK_8085D14_2 *arg1, UNK_8085D14_2 *arg2)
{
    s32 var_r3, var_r4;

    if (arg1->unk2 != 0x400) {
        var_r3 = (arg1->unk2 * arg0->unk8) >> 0xA;
        arg2->unk2 = ((arg1->unk2 * arg0->unk2) >> 0xA);
    } else {
        var_r3 = arg0->unk8;
    }
    if (arg1->unk4 != 0x400) {
        var_r4 = (arg1->unk4 * arg0->unkC) >> 0xA;
        arg2->unk4 = ((arg1->unk4 * arg0->unk4) >> 0xA);
    } else {
        var_r4 = arg0->unkC;
    }

    if (arg1->unk0 != 0) {
        arg2->unk8 = (arg1->unk8 + (((var_r3 * (COS(arg1->unk0) >> 6)) >> 8) - ((var_r4 * (SIN(arg1->unk0) >> 6)) >> 8)));
        arg2->unkC = arg1->unkC + (((var_r3 * (SIN(arg1->unk0) >> 6)) >> 8) + ((var_r4 * (COS(arg1->unk0) >> 6)) >> 8));
    } else {
        arg2->unk8 = (arg1->unk8 + var_r3);
        arg2->unkC = arg1->unkC + var_r4;
    }
    arg2->unk0 = ((arg0->unk0 + arg1->unk0) & (SIN_PERIOD - 1));
}

// This is used in this file, but it's not used by the game
void sub_80835E0(UNK_8085D14_2 *arg0, UNK_8085D14_2 *arg1)
{
    s32 var_r3, var_r4;

    if (arg1->unk2 != 0x400) {
        var_r3 = (s32)(arg1->unk2 * arg0->unk8) >> 0xA;
        arg0->unk2 = (s16)((s32)(arg1->unk2 * arg0->unk2) >> 0xA);
    } else {
        var_r3 = arg0->unk8;
    }
    if (arg1->unk4 != 0x400) {
        var_r4 = (s32)(arg1->unk4 * arg0->unkC) >> 0xA;
        arg0->unk4 = (s16)((s32)(arg1->unk4 * arg0->unk4) >> 0xA);
    } else {
        var_r4 = arg0->unkC;
    }
    if (arg1->unk0 != 0) {
        arg0->unk8 = (arg1->unk8 + (((var_r3 * (COS(arg1->unk0) >> 6)) >> 8) - ((var_r4 * (SIN(arg1->unk0) >> 6)) >> 8)));
        arg0->unkC = arg1->unkC + (((var_r3 * (SIN(arg1->unk0) >> 6)) >> 8) + ((var_r4 * (COS(arg1->unk0) >> 6)) >> 8));
    } else {
        arg0->unk8 = (s32)(arg1->unk8 + var_r3);
        arg0->unkC = arg1->unkC + var_r4;
    }
    arg0->unk0 = ((arg0->unk0 + arg1->unk0) & (SIN_PERIOD - 1));
}

void sub_80836BC(UNK_8085D14_2 *arg0, UNK_8085D14_2 *arg1)
{
    s32 var_r3, var_r4;

    if (arg1->unk2 != 0x400) {
        var_r3 = (s32)(arg1->unk2 * arg0->unk8) >> 0xA;
        arg1->unk2 = (s16)((s32)(arg1->unk2 * arg0->unk2) >> 0xA);
    } else {
        var_r3 = arg0->unk8;
    }
    if (arg1->unk4 != 0x400) {
        var_r4 = (s32)(arg1->unk4 * arg0->unkC) >> 0xA;
        arg1->unk4 = (s16)((s32)(arg1->unk4 * arg0->unk4) >> 0xA);
    } else {
        var_r4 = arg0->unkC;
    }
    if (arg1->unk0 != 0) {
        arg1->unk8 = (arg1->unk8 + (((var_r3 * (COS(arg1->unk0) >> 6)) >> 8) - ((var_r4 * (SIN(arg1->unk0) >> 6)) >> 8)));
        arg1->unkC = arg1->unkC + (((var_r3 * (SIN(arg1->unk0) >> 6)) >> 8) + ((var_r4 * (COS(arg1->unk0) >> 6)) >> 8));
    } else {
        arg1->unk8 = (s32)(arg1->unk8 + var_r3);
        arg1->unkC = arg1->unkC + var_r4;
    }
    arg1->unk0 = ((arg0->unk0 + arg1->unk0) & (SIN_PERIOD - 1));
}

void sub_8083798(UNK_8085D14_2 *arg0)
{
    u16 temp_r0;

    if (arg0->unk2 != 0x400) {
        arg0->unk2 = Div(0x100000, arg0->unk2);
        arg0->unk8 = (arg0->unk2 * arg0->unk8) >> 0xA;
    }
    if (arg0->unk4 != 0x400) {
        arg0->unk4 = Div(0x100000, arg0->unk4);
        arg0->unkC = (arg0->unk4 * arg0->unkC) >> 0xA;
    }
    temp_r0 = (0x400 - arg0->unk0) & 0x3FF;
    arg0->unk0 = temp_r0;
    if (temp_r0 != 0) {
        s32 unk8, unkC;
        unk8 = ((-arg0->unk8 * (COS(arg0->unk0) >> 6)) >> 8) - ((-arg0->unkC * (SIN(arg0->unk0) >> 6)) >> 8);
        unkC = ((-arg0->unk8 * (SIN(arg0->unk0) >> 6)) >> 8) + ((-arg0->unkC * (COS(arg0->unk0) >> 6)) >> 8);

        arg0->unkC = unkC;
        arg0->unk8 = unk8;
        return;
    }
    arg0->unk8 = (0 - arg0->unk8);
    arg0->unkC = (0 - arg0->unkC);
}

NONMATCH("asm/non_matching/game/math/unused_sub_8083858.inc", void sub_8083858()) { }
END_NONMATCH

void sub_80838CC(UNK_8085D14 *arg0, UNK_8085D14 *arg1, UNK_8085D14 *arg2)
{
    arg2->unk0 = (((arg0->unk6 * arg1->unk0) + (arg0->unk0 * arg1->unk6) + (arg0->unk2 * arg1->unk4)) - (arg0->unk4 * arg1->unk2)) >> 0xA;
    arg2->unk2 = (((arg0->unk6 * arg1->unk2) - (arg0->unk0 * arg1->unk4)) + (arg0->unk2 * arg1->unk6) + (arg0->unk4 * arg1->unk0)) >> 0xA;
    arg2->unk4 = ((((arg0->unk6 * arg1->unk4) + (arg0->unk0 * arg1->unk2)) - (arg0->unk2 * arg1->unk0)) + (arg0->unk4 * arg1->unk6)) >> 0xA;
    arg2->unk6 = ((((arg0->unk6 * arg1->unk6) - (arg0->unk0 * arg1->unk0)) - (arg0->unk2 * arg1->unk2)) - (arg0->unk4 * arg1->unk4)) >> 0xA;
}

void sub_808399C(UNK_8085D14 *arg0, UNK_8085D14 *arg1)
{
    s16 r6 = arg0->unk0;
    s16 r5 = arg0->unk2;
    s16 r4 = arg0->unk4;
    arg0->unk0 = (((arg0->unk6 * arg1->unk0) + (r6 * arg1->unk6) + (r5 * arg1->unk4)) - (r4 * arg1->unk2)) >> 10;
    arg0->unk2 = (((arg0->unk6 * arg1->unk2) - (r6 * arg1->unk4)) + (r5 * arg1->unk6) + (r4 * arg1->unk0)) >> 10;
    arg0->unk4 = ((((arg0->unk6 * arg1->unk4) + (r6 * arg1->unk2)) - (r5 * arg1->unk0)) + (r4 * arg1->unk6)) >> 10;
    arg0->unk6 = ((((arg0->unk6 * arg1->unk6) - (r6 * arg1->unk0)) - (r5 * arg1->unk2)) - (r4 * arg1->unk4)) >> 10;
}

NONMATCH("asm/non_matching/game/math/unused_sub_8083A48.inc", void sub_8083A48()) { }
END_NONMATCH

NONMATCH("asm/non_matching/game/math/unused_sub_8083B10.inc", void sub_8083B10()) { }
END_NONMATCH

// This is used in this file, but it's not used by the game
NONMATCH("asm/non_matching/game/math/unused_sub_8083B88.inc",
         void sub_8083B88(struct UNK_8085F1C_1 *a, struct UNK_8085F1C_1 *b, struct UNK_8085F1C_1 *c))
{
}
END_NONMATCH

NONMATCH("asm/non_matching/game/math/unused_sub_8083E44.inc", void sub_8083E44()) { }
END_NONMATCH

NONMATCH("asm/non_matching/game/math/unused_sub_8084090.inc", void sub_8084090()) { }
END_NONMATCH

NONMATCH("asm/non_matching/game/math/unused_sub_80842E4.inc", void sub_80842E4()) { }
END_NONMATCH

NONMATCH("asm/non_matching/game/math/unused_sub_808442C.inc", void sub_808442C()) { }
END_NONMATCH

NONMATCH("asm/non_matching/game/math/unused_sub_808458C.inc", void sub_808458C()) { }
END_NONMATCH

NONMATCH("asm/non_matching/game/math/unused_sub_808477C.inc", void sub_808477C()) { }
END_NONMATCH

void sub_8084904(UNK_8085D14 *arg0, u16 arg1)
{
    u32 *r1;
    s16 temp_r0;
    s16 temp_r1;
    u8 i;

    r1 = (u32 *)arg0;
    for (i = 0; i < sizeof(UNK_8085D14); i += 4) {
        *r1++ = 0;
    };
    ((UNK_8085D14 *)r1)->unk12 = 0x400;
    ((UNK_8085D14 *)r1)->unkA = 0x400;
    ((UNK_8085D14 *)r1)->unk2 = 0x400;
    temp_r1 = SIN(arg1) >> 4;
    temp_r0 = COS(arg1) >> 4;
    arg0->unkA = temp_r0;
    arg0->unkC = temp_r1;
    arg0->unk10 = -temp_r1;
    arg0->unk12 = temp_r0;
}

void sub_8084964(UNK_8085D14 *arg0, u16 arg1)
{
    u32 *r1;
    s16 temp_r0;
    s16 temp_r1;
    u8 i;

    r1 = (u32 *)arg0;
    for (i = 0; i < sizeof(UNK_8085D14); i += 4) {
        *r1++ = 0;
    };
    ((UNK_8085D14 *)r1)->unk12 = 0x400;
    ((UNK_8085D14 *)r1)->unkA = 0x400;
    ((UNK_8085D14 *)r1)->unk2 = 0x400;
    temp_r1 = SIN(arg1) >> 4;
    temp_r0 = COS(arg1) >> 4;
    arg0->unk2 = temp_r0;
    arg0->unk6 = -temp_r1;
    arg0->unkE = temp_r1;
    arg0->unk12 = temp_r0;
}

void sub_80849C4(UNK_8085D14 *arg0, u16 arg1)
{
    u32 *r1;
    s16 temp_r0;
    s16 temp_r1;
    u8 i;

    r1 = (u32 *)arg0;
    for (i = 0; i < sizeof(UNK_8085D14); i += 4) {
        *r1++ = 0;
    };
    ((UNK_8085D14 *)r1)->unk12 = 0x400;
    ((UNK_8085D14 *)r1)->unkA = 0x400;
    ((UNK_8085D14 *)r1)->unk2 = 0x400;
    temp_r1 = SIN(arg1) >> 4;
    temp_r0 = COS(arg1) >> 4;
    arg0->unk2 = temp_r0;
    arg0->unk4 = temp_r1;
    arg0->unk8 = -temp_r1;
    arg0->unkA = temp_r0;
}

// https://decomp.me/scratch/hG6JM
NONMATCH("asm/non_matching/game/math/unused_sub_8084A24.inc", void sub_8084A24()) { }
END_NONMATCH

// This is used in this file, but it's not used by the game
void sub_8084B54(struct UNK_8085F1C_1 *matrix, u16 anglez, u16 angley, u16 anglex)
{
    s16 sy = SIN(angley) >> 4;
    s16 cy = COS(angley) >> 4;
    s16 sz = SIN(anglez) >> 4;
    s16 cz = COS(anglez) >> 4;
    s16 sx = SIN(anglex) >> 4;
    s16 cx = COS(anglex) >> 4;

    matrix->unk2[0] = Q_6_10_MUL(cx, cz) + Q_6_10_MUL(Q_6_10_MUL(sx, sy), sz);
    matrix->unk2[1] = Q_6_10_MUL(sx, cy);
    matrix->unk2[2] = Q_6_10_MUL(-cx, sz) + Q_6_10_MUL(Q_6_10_MUL(sx, sy), cz);
    matrix->unk2[3] = Q_6_10_MUL(-sx, cz) + Q_6_10_MUL(sz, Q_6_10_MUL(sy, cx));
    matrix->unk2[4] = Q_6_10_MUL(cx, cy);
    matrix->unk2[5] = Q_6_10_MUL(sz, sx) + Q_6_10_MUL(cz, Q_6_10_MUL(sy, cx));
    matrix->unk2[6] = Q_6_10_MUL(cy, sz);
    matrix->unk2[7] = -sy;
    matrix->unk2[8] = Q_6_10_MUL(cy, cz);

    matrix->unk1C = 0;
    matrix->unk18 = 0;
    matrix->unk14 = 0;
}

// https://decomp.me/scratch/ROe1T
NONMATCH("asm/non_matching/game/math/unused_sub_8084C70.inc", void sub_8084C70()) { }
END_NONMATCH

// https://decomp.me/scratch/zRCAD
NONMATCH("asm/non_matching/game/math/unused_sub_8084EAC.inc", void sub_8084EAC()) { }
END_NONMATCH

NONMATCH("asm/non_matching/game/math/unused_sub_8084EE0.inc", void sub_8084EE0()) { }
END_NONMATCH

NONMATCH("asm/non_matching/game/math/unused_sub_80851E0.inc", void sub_80851E0()) { }
END_NONMATCH

NONMATCH("asm/non_matching/game/math/unused_sub_8085314.inc", void sub_8085314(struct UNK_8085F1C_1 *p1, struct UNK_8085F1C_1 *p2))
{
    // Incomplete
    s32 unk0 = p2->unk0 * 2;
    s32 unk2 = p2->unk2[0] * 2;
    s32 unk4 = p2->unk2[1] * 2;
    s32 temp0 = (p2->unk2[0] * unk2 * 0x40) >> 0x10;
    s32 temp1 = (p2->unk2[1] * unk4 * 0x40) >> 0x10;

    s16 temp2, temp3, temp4, temp5, temp6;

    p1->unk14 = 0;
    p1->unk2[0] = 0x400 - (temp0 + temp1);

    temp2 = (p2->unk2[2] * unk4 * 0x40) >> 0x10;
    temp3 = (p2->unk0 * unk2 * 0x40) >> 0x10;

    p1->unk2[1] = temp3 - temp2;

    temp4 = (p2->unk0 * unk4 * 0x40) >> 0x10;
    temp5 = (p2->unk2[2] * unk2 * 0x40) >> 0x10;

    p1->unk2[2] = temp4 + temp5;
    p1->unk2[3] = temp3 + temp2;

    temp3 = (p2->unk0 * unk0 * 0x40) >> 0x10;
    p1->unk2[4] = 0x400 - (temp1 + temp3);

    temp1 = (p2->unk2[2] * unk0 * 0x40) >> 0x10;
    temp6 = (p2->unk2[0] * unk4 * 0x40) >> 0x10;

    p1->unk2[5] = temp6 - temp1;
    p1->unk2[6] = temp4 - temp5;
    p1->unk2[7] = temp6 + temp1;
    p1->unk2[8] = 0x400 - (temp3 + temp0);
    p1->unk1C = p1->unk14;
    p1->unk18 = p1->unk14;
}
END_NONMATCH

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
        return (((u64)a * Q(0.9609375)) + ((u64)b * Q(0.3984375))) >> 8;
    } else {
        return (((u64)b * Q(0.9609375)) + ((u64)a * Q(0.3984375))) >> 8;
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

UNUSED u16 sub_80855F8(u16 r7, u16 r2, u8 r6, s16 r5, u8 r4)
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

UNUSED s32 sub_80856DC(s32 a, s32 b, s32 c) { return (a * 7 + b * 6 - c) / 12; }

UNUSED s32 sub_80856F8(s32 a, s32 b, s32 c) { return ((b * 6 - a) + c * 7) / 12; }

UNUSED s32 sub_8085714(s32 a, s32 b, s32 c) { return ((a + b * 8) - c) >> 3; }

UNUSED s32 sub_8085720(s32 a, s32 b, s32 c) { return ((b * 8 - a) + c) >> 3; }

UNUSED s32 sub_808572C(s32 a, s32 b, s32 c, s32 d, u32 e, u8 f) { return ((s64)(b - a) * (s64)((1 << f) - c)) >> f; }

UNUSED s32 sub_8085758(s32 a, s32 b) { return b - a; }

UNUSED s32 sub_808575C(s32 a, s32 b, s32 c, s32 d, s32 e, s32 f, u8 g)
{
    a = c - a;
    a += a >> 1;
    a -= (b >> 1);
    return ((s64)(a) * ((1 << g) - d)) >> g;
}

UNUSED s32 sub_8085798(s32 a, s32 b, s32 c) { return ((c - a) + ((c - a) >> 1)) - (b >> 1); }

// same as sub_808575C
UNUSED s32 sub_80857A4(s32 a, s32 b, s32 c, s32 d, s32 e, s32 f, u8 g)
{
    a = c - a;
    a += a >> 1;
    a -= (b >> 1);
    return ((s64)(a) * ((1 << g) - d)) >> g;
}

UNUSED s32 sub_80857E0(s32 a, s32 b, s32 c) { return ((c - a) + ((c - a) >> 1)) - (b >> 1); }

UNUSED s32 sub_80857EC(s32 a, s32 b, s32 c, s32 d, s32 e, s32 f, u8 g)
{
    s32 h = ((s64)(b - a) * (s64)(f + (1 << g))) >> g;
    s64 i = ((s64)(c - b) * (s64)((1 << g) - f)) >> g;
    s64 h64 = h;
    s64 j = ((s32)(i - h) * (s64)((1 << (g - 1)) + (e >> 1))) >> g;
    return ((s64)(j + h64) * (s64)((1 << g) - d)) >> g;
}

UNUSED s32 sub_80858A4(s32 a, s32 b, s32 c, s32 d, s32 e, s32 f, u8 g)
{
    s32 h = ((s64)(b - a) * (s64)(f + (1 << g))) >> g;
    s64 i = ((s64)(c - b) * (s64)((1 << g) - f)) >> g;
    s64 h64 = h;
    s64 j = ((s32)(i - h) * (s64)((1 << (g - 1)) - (e >> 1))) >> g;
    return ((s64)(j + h64) * (s64)((1 << g) - d)) >> g;
}

UNUSED s32 sub_808595C(s32 a, s32 b, s32 c)
{
    s32 e = (b - a);
    s32 f = (c - b);
    f -= e;
    f >>= 1;
    return e + f;
}

s16 sub_8085968(s16 *unk28, u16 param1)
{
    s32 r7, r3, r5;
    u32 r0;
    r7 = (4095 - param1);

    r7 = (r7 * (SQUARE(r7) >> 12)) >> 12; // (r7 * ((r7 * r7) / 4096)) / 4096
    r0 = (r7 * unk28[0] * 171) >> 10; // / 1024
    unk28++;

    r3 = SQUARE(param1) >> 12; // (r1 * r1) / 1024
    r7 = (r3 * param1) >> 12; // (r3 * r1) / 1024
    r0 += (unk28[0] * (((((r3 * param1) >> 13) - r3) + gUnknown_080E0290[0])));
    unk28++;

    r0 += (unk28[0] * (((((param1 + r3)) - r7) >> 1) + gUnknown_080E0290[1]));
    r0 += ((r7 * unk28[1] * 171) >> 10);

    return r0 / 4096;
}

u16 sub_80859F4(s16 *unk28, u16 unk5C)
{
    s32 r7, r3, r5;
    u32 r0;

    s16 *r4 = &unk28[unk5C / 4096];
    u16 r1 = unk5C % 4096;
    r7 = (4095 - r1);

    r7 = (r7 * (SQUARE(r7) >> 12)) >> 12; // (r7 * ((r7 * r7) / 4096)) / 4096
    r0 = (r7 * r4[0] * 171) >> 10; // / 1024

    r3 = SQUARE(r1) >> 12; // (r1 * r1) / 1024
    r7 = (r3 * r1) >> 12; // (r3 * r1) / 1024

    r0 += (r4[1] * (((((r3 * r1) >> 13) - r3) + gUnknown_080E0290[0])));

    r4 += 2;

    r0 += (r4[0] * (((((r1 + r3)) - r7) >> 1) + gUnknown_080E0290[1]));
    r0 += ((r7 * r4[1] * 171) >> 10);

    r0 *= 1024;
    r0 /= 1024;
    return r0 / 4096;
}

#if 0
// Found here in SA3
// Almost identical to sub_80859F4, maybe just signed equivalent?
s16 sub_80B1560(s16 *param0, u16 param1)
{

}
#endif

UNUSED void sub_8085A88(UNK_8085D14 *p1)
{
    p1->unk0 = 0;
    p1->unk2 = 0x400;
    p1->unk4 = 0x400;
    // TODO: probably wrong type
    *(u32 *)&p1->unk8 = 0;
    *(u32 *)&p1->unkC = 0;
}

UNUSED void sub_8085A9C(UNK_8085D14 *p1, u8 p2)
{
    u16 dist = Sqrt(SQUARE(p1->unk0) + SQUARE(p1->unk2) + SQUARE(p1->unk4));
    u32 thing = (p2 << 1);
    s32 div = (1 << thing) / dist;
    p1->unk0 = (div * p1->unk0) >> p2;
    p1->unk2 = (div * p1->unk2) >> p2;
    p1->unk4 = (div * p1->unk4) >> p2;
}

UNUSED s32 sub_8085B00(UNK_8085D14 *p1, UNK_8085D14 *p2, u8 p4)
{
    u32 something = p4;
    return ((p1->unk0 * p2->unk0) + (p1->unk2 * p2->unk2) + (p1->unk4 * p2->unk4)) >> p4;
}

UNUSED void sub_8085B34(UNK_8085D14 *p1, UNK_8085D14 *p2, UNK_8085D14 *p3, u8 p4)
{
    u32 something = p4;
    p3->unk0 = ((p1->unk2 * p2->unk4) - (p1->unk4 * p2->unk2)) >> something;
    p3->unk2 = ((p1->unk4 * p2->unk0) - (p1->unk0 * p2->unk4)) >> something;
    p3->unk4 = ((p1->unk0 * p2->unk2) - (p1->unk2 * p2->unk0)) >> something;
}

UNUSED void sub_8085B90(UNK_8085D14 *p1)
{
    p1->unk4 = 0;
    p1->unk2 = 0;
    p1->unk0 = 0;

    p1->unk6 = 0x400;
}

UNUSED void sub_8085BA0(UNK_8085D14 *p1)
{
    p1->unk0 = -p1->unk0;
    p1->unk2 = -p1->unk2;
    p1->unk4 = -p1->unk4;
}

UNUSED void sub_8085BB4(UNK_8085D14 *p1, u16 rad)
{
    s32 sin;
    rad = rad >> 1;
    sin = SIN(rad) >> 4;
    p1->unk0 = sin;
    p1->unk2 = 0;
    p1->unk4 = 0;
    p1->unk6 = COS(rad) >> 4;
}

UNUSED void sub_8085BEC(UNK_8085D14 *p1, u16 rad)
{
    s32 sin;
    rad = rad >> 1;
    sin = SIN(rad) >> 4;
    p1->unk0 = 0;
    p1->unk2 = sin;
    p1->unk4 = 0;
    p1->unk6 = COS(rad) >> 4;
}

UNUSED void sub_8085C24(UNK_8085D14 *p1, u16 rad)
{
    s32 sin;
    rad = rad >> 1;
    sin = SIN(rad) >> 4;
    p1->unk0 = 0;
    p1->unk2 = 0;
    p1->unk4 = sin;
    p1->unk6 = COS(rad) >> 4;
}

UNUSED void sub_8085C5C(UNK_8085D14 *p1, u16 rad, UNK_8085D14 *p3)
{
    s32 sin;
    rad = rad >> 1;
    sin = SIN(rad) >> 4;
    p1->unk0 = (sin * p3->unk0) >> 10;
    p1->unk2 = (sin * p3->unk2) >> 10;
    p1->unk4 = (sin * p3->unk4) >> 10;
    p1->unk6 = COS(rad) >> 4;
}

UNUSED void sub_8085CA8(UNK_8085D14 *p1)
{
    u8 i;
    UNK_8085D14 *curr = p1;
    // memset
    for (i = 0; i < 32; i += 4) {
#ifndef NON_MATCHING
        *((u32 *)curr)++ = 0;
#else
        u32 *p = (u32 *)curr;
        *p = 0;
        p++;
        curr = (UNK_8085D14 *)p;
#endif
    }
}

UNUSED void sub_8085CC0(UNK_8085D14 *p1)
{
    u8 i;
    UNK_8085D14 *curr = p1;
    // memset
    for (i = 0; i < 32; i += 4) {
#ifndef NON_MATCHING
        *((u32 *)curr)++ = 0;
#else
        u32 *p = (u32 *)curr;
        *p = 0;
        p++;
        curr = (UNK_8085D14 *)p;
#endif
    }
    curr->unk12 = 0x400;
    curr->unkA = 0x400;
    curr->unk2 = 0x400;
}

UNUSED void sub_8085CE4(UNK_8085D14 *p1, u32 p2, u32 p3, u32 p4)
{
    u8 i;
    UNK_8085D14 *curr = p1;
    // memset
    for (i = 0; i < 32; i += 4) {
#ifndef NON_MATCHING
        *((u32 *)curr)++ = 0;
#else
        u32 *p = (u32 *)curr;
        *p = 0;
        p++;
        curr = (UNK_8085D14 *)p;
#endif
    }
    curr->unk12 = 0x400;
    curr->unkA = 0x400;
    curr->unk2 = 0x400;

    p1->unk14 = p2;
    p1->unk18 = p3;
    p1->unk1C = p4;
}

UNUSED void sub_8085D14(UNK_8085D14 *p1, u32 p2, u32 p3, u32 p4)
{
    u8 i;
    UNK_8085D14 *curr = p1;
    // memset
    for (i = 0; i < 32; i += 4) {
#ifndef NON_MATCHING
        *((u32 *)curr)++ = 0;
#else
        u32 *p = (u32 *)curr;
        *p = 0;
        p++;
        curr = (UNK_8085D14 *)p;
#endif
    }
    curr->unk12 = 0x400;
    curr->unkA = 0x400;
    curr->unk2 = 0x400;

    p1->unk2 = p2;
    p1->unkA = p3;
    p1->unk12 = p4;
}

UNUSED void sub_8085D44(UNK_8085DEC *thing)
{
    thing->unk0 = NULL;
    thing->start = NULL;
    thing->next = NULL;
    thing->unkC = NULL;
}

UNUSED UNK_8085DEC *sub_8085D50(UNK_8085DEC *thing)
{
    while (thing->unk0 != NULL) {
        thing = thing->unk0;
    }

    return thing;
}

UNUSED void sub_8085D64(UNK_8085DEC *thing)
{
    if (thing->unk0 != NULL) {
        sub_8085D98(thing->unk0, thing);
    }
}

UNUSED void sub_8085D78(UNK_8085DEC *thing, UNK_8085DEC *target)
{
    if (target->unk0 != NULL) {
        sub_8085D98(target->unk0, target);
    }
    target->unk0 = thing;
    target->next = thing->start;
    thing->start = target;
}

static bool8 sub_8085D98(UNK_8085DEC *thing, UNK_8085DEC *target)
{
    UNK_8085DEC *curr = thing->start;
    UNK_8085DEC *prev = NULL;

    while (curr != NULL) {
        if (curr == target) {
            if (prev == NULL) {
                thing->start = curr->next;
            } else {
                prev->next = curr->next;
            }
            target->unk0 = NULL;
            target->next = NULL;

            return TRUE;
        }
        prev = curr;
        curr = curr->next;
    }

    return FALSE;
}

UNUSED u16 sub_8085DD0(UNK_8085DEC *thing)
{
    u16 num = 0;
    thing = thing->start;
    while (thing != NULL) {
        num++;
        thing = thing->next;
    }

    return num;
}

UNUSED UNK_8085DEC *sub_8085DEC(UNK_8085DEC *thing, u16 num)
{
    thing = thing->start;
    while (thing != NULL && num != 0) {
        num--;
        thing = thing->next;
    }

    return thing;
}

UNUSED void sub_8085E10(struct UNK_8085F1C *p1, struct UNK_8085F1C *p2) { memcpy(p2, &p1->unk10, 0x10); }

UNUSED void sub_8085E24(struct UNK_8085F1C *p1, struct UNK_8085F1C *p2) { memcpy(&p1->unk10, p2, 0x10); }

UNUSED void sub_8085E38(struct UNK_8085F1C *p1, struct UNK_8085F1C *p2)
{
    memcpy(p2, &p1->unk10, 0x10);

    while (p1 = p1->unk0, p1 != NULL) {
        // TODO: fix all these types
        sub_80835E0((UNK_8085D14_2 *)p2, (UNK_8085D14_2 *)&p1->unk10);
    }
}

UNUSED void sub_8085E64(struct UNK_8085F1C *p1)
{
    u8 i;
    struct UNK_8085F1C_1 *curr;
    p1->unk10 = 0;

    // memset 0
    curr = &p1->unk34;
    for (i = 0; i < 0x20; i += 4) {
#ifndef NON_MATCHING
        *((u32 *)curr)++ = 0;
#else
        u32 *p = (u32 *)curr;
        *p = 0;
        p++;
        curr = (struct UNK_8085F1C_1 *)p;
#endif
    }

    curr->unk2[8] = 0x400;
    curr->unk2[4] = 0x400;
    curr->unk2[0] = 0x400;
    p1->unkC |= 1;
}

UNUSED void sub_8085E94(struct UNK_8085F1C *p1)
{
    p1->unk10 = 1;
    p1->unk58 = 0;
    p1->unk56 = 0;
    p1->unk54 = 0;
    p1->unk6C = 0;
    p1->unk68 = 0;
    p1->unk64 = 0;
    p1->unk60 = 0x400;
    p1->unk5E = 0x400;
    p1->unk5C = 0x400;
}

UNUSED struct UNK_8085F1C_1 *sub_8085EC4(struct UNK_8085F1C *p1)
{
    struct UNK_8085F1C_1 *sub = NULL;

    if (p1->unk0 != NULL) {
        sub = sub_8085EC4(p1);
    }

    if ((p1->unkC & 3) == 3) {
        if (sub == NULL) {
            return NULL;
        }
    } else {
        if (!(p1->unkC & 1)) {
            sub_80853F8(p1);

            p1->unkC |= 0x1;
            p1->unkC &= ~0x2;
        }
    }
    sub_8083B88(&p1->unk34, sub, &p1->unk14);
    return &p1->unk14;
}

UNUSED struct UNK_8085F1C_1 *sub_8085F1C(struct UNK_8085F1C *p1)
{
    struct UNK_8085F1C_1 *sub = NULL;

    if (p1->unk0 != NULL) {
        sub = sub_8085EC4(p1);
    }

    if ((p1->unkC & 3) == 3) {
        if (sub != NULL) {
            sub_8083B88(&p1->unk34, sub, &p1->unk14);
        }
    } else {
        if (!(p1->unkC & 1)) {
            sub_80853F8(p1);

            p1->unkC |= 0x1;
            p1->unkC &= ~0x2;
        }

        sub_8083B88(&p1->unk34, sub, &p1->unk14);
    }

    return &p1->unk14;
}

UNUSED void sub_8085F84(void)
{
    // unused
}
