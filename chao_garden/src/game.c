#include "global.h"
#include "m4a.h"
#include "save.h"
#include "input.h"

#include "constants/songs.h"

void sub_02001290(void);
extern u8 gUnknown_03000606;
extern u8 gUnknown_03000607;
extern u8 gUnknown_03000608;

extern u16 gUnknown_030013B0[8][2];
extern u8 gUnknown_030013D0;

typedef struct {
    u16 unk0;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    s8 unk5;
    s8 unk6;
    u8 unk7;
} UNK_30005C0_UNK10;

typedef struct {
    // TODO: should be CallbackFunc
    void *unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u16 unk8;
    u16 unkA;
    u16 unkC;
    s16 unkE;
    UNK_30005C0_UNK10 *unk10;
    u16 unk14;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;
    u8 unk1A;
    u8 unk1B;
    s8 unk1C;
    u32 unk20;
} UNK_30005C0;

typedef void (*CallbackFunc)(UNK_30005C0 *);

typedef struct {
    const u16 *unk0;
    u16 *unk4;
    u8 unk8;
    u8 unk9;
    u16 unkA;
} UNK_30013D8;

extern UNK_30005C0 gUnknown_03004400[72];
extern UNK_30005C0 gUnknown_03000610[72];

extern u8 gUnknown_03001076;
extern u8 gUnknown_03001077;
extern u8 gUnknown_03001078;

extern s8 gUnknown_03005270;

u8 gUnknown_03001030[0x45];
u8 gUnknown_030005C0[0x45];

extern s8 gUnknown_03001120[32];
extern u8 gUnknown_03001140;
extern u8 gUnknown_03001141;
extern u8 gUnknown_03001142;
extern u16 gUnknown_03001280[128];
extern s8 gUnknown_03001380[32];
extern u8 gUnknown_030013A0;
extern u8 gUnknown_030013A1;
extern u8 gUnknown_030013A2;

extern u16 gUnknown_03004E70[128][4];
extern u8 gUnknown_03001088[4][2];

extern u8 gUnknown_03001080[4];
extern u8 gUnknown_0300111C;
extern u8 gUnknown_03001148[10][2];
extern u8 gUnknown_030011D8[10];
extern u8 gUnknown_0300127A;
extern u8 gUnknown_03004E20[10];

extern u32 gRandomSeed;
extern UNK_30013D8 gUnknown_030013D8[10];
extern u8 gUnknown_030014F8;

void sub_020013DC(UNK_30005C0 *);
void DummyCallback(UNK_30005C0 *);

void sub_02000c90(void)
{
    s32 i;

    sub_02001290();
    gUnknown_03004400[0].unk0 = (void *)sub_020013DC;
    gUnknown_03004400[0].unk5 = 0;
    gUnknown_03004400[0].unk4 = 0;
    gUnknown_03004400[0].unk6 = 1;
    gUnknown_03004400[1].unk0 = (void *)DummyCallback;
    gUnknown_03004400[1].unk4 = 1;
    gUnknown_03004400[1].unk6 = 0;
    gUnknown_03004400[1].unk5 = 0;

    for (i = 0; i < 70; i++) {
        gUnknown_030005C0[i] = i + 2;
    }

    gUnknown_03000606 = gUnknown_03000607 = gUnknown_03000608 = gUnknown_03005270 = 0;
}

UNK_30005C0 *sub_02000d04(CallbackFunc arg0, UNK_30005C0 *arg1, u8 arg2)
{
    u8 idx;
    UNK_30005C0 *r2;

    if (gUnknown_03000606 > 69) {
        return NULL;
    }

    idx = gUnknown_030005C0[gUnknown_03000607++];
    if (gUnknown_03000607 > 69) {
        gUnknown_03000607 = 0;
    }
    r2 = &gUnknown_03004400[idx];
    r2->unk0 = arg0;
    r2->unk4 = idx;

    if (arg2 != 0) {
        r2->unk5 = arg1->unk5;
        r2->unk6 = arg1->unk4;
        gUnknown_03004400[arg1->unk5].unk6 = idx;
        arg1->unk5 = idx;
    } else {
        r2->unk5 = arg1->unk4;
        r2->unk6 = arg1->unk6;
        gUnknown_03004400[arg1->unk6].unk5 = idx;
        arg1->unk6 = idx;
    }

    r2->unk19 = 0;
    r2->unk18 = 0;
    r2->unk17 = 0;
    r2->unk16 = 0;
    r2->unkC = 0;
    r2->unk8 = 0;
    r2->unk7 = 0;
    r2->unk1C = -1;
    gUnknown_03000606++;
    return r2;
}

void sub_02000f34(void);

void sub_02000db0(void)
{
    s16 i;

    sub_02000f34();
    CpuCopy32(&gUnknown_03004400, &gUnknown_03000610, sizeof(gUnknown_03004400));

    for (i = 0; i < 70; i++) {
        gUnknown_03001030[i] = gUnknown_030005C0[i];
    }
    gUnknown_03001076 = gUnknown_03000606;
    gUnknown_03001077 = gUnknown_03000607;
    gUnknown_03001078 = gUnknown_03000608;
}

void sub_02000fd4(void);

void sub_02000e28(void)
{
    s16 i;

    sub_02000fd4();
    CpuCopy32(&gUnknown_03000610, &gUnknown_03004400, sizeof(gUnknown_03004400));

    for (i = 0; i < 70; i++) {
        gUnknown_030005C0[i] = gUnknown_03001030[i];
    }
    gUnknown_03000606 = gUnknown_03001076;
    gUnknown_03000607 = gUnknown_03001077;
    gUnknown_03000608 = gUnknown_03001078;
    gUnknown_03005270 = 0;
}

void sub_02000eac(void)
{
    u8 i = 0;
    do {
        ((CallbackFunc)gUnknown_03004400[i].unk0)(&gUnknown_03004400[i]);
        i = gUnknown_03004400[i].unk6;
    } while (i != 0);
}

void sub_02000ed4(UNK_30005C0 *arg0)
{
    gUnknown_03004400[arg0->unk5].unk6 = arg0->unk6;
    gUnknown_03004400[arg0->unk6].unk5 = arg0->unk5;

    gUnknown_030005C0[gUnknown_03000608++] = arg0->unk4;

    if (gUnknown_03000608 > 69) {
        gUnknown_03000608 = 0;
    }
    gUnknown_03000606--;
}

void DummyCallback(UNK_30005C0 *arg0) { }

void sub_02000f34(void)
{
    s16 i = 0;
#ifndef NON_MATCHING
    u8 *ip = &gUnknown_030013A0;
    u8 *r5 = &gUnknown_03001140;
    u8 *r8 = &gUnknown_030013A1;
#endif

    for (; i < 128; i++) {
        gUnknown_03001280[i] = gUnknown_03004E70[i][3];
    }

    for (i = 0; i < 32; i++) {
        gUnknown_03001380[i] = gUnknown_03001120[i];
    };

#ifndef NON_MATCHING
    *ip = *r5;
    *r8 = gUnknown_03001141;
#else
    gUnknown_030013A0 = gUnknown_03001140;
    gUnknown_030013A1 = gUnknown_03001141;
#endif
    gUnknown_030013A2 = gUnknown_03001142;
}

// 89%: https://decomp.me/scratch/INK5D
// Functional match but needs the permuter on it. Possibly some lost logging side effects here
NONMATCH("asm/non_matching/sub_02000fd4.inc", void sub_02000fd4())
{
    s16 i;
    for (i = 0; i < 128; i++) {
        gUnknown_03004E70[i][0] = 512;
        gUnknown_03004E70[i][3] = gUnknown_03001280[i];
    };

    for (i = 0; i < 32; i++) {
        gUnknown_03001120[i] = gUnknown_03001380[i];
    };

    gUnknown_03001140 = gUnknown_030013A0;
    gUnknown_03001141 = gUnknown_030013A1;
    gUnknown_03001142 = gUnknown_030013A2;
}
END_NONMATCH

void sub_02001088(void)
{
    u16 *r5;
    s32 ip;
    u8 r0, r6;
    UNK_30005C0 *r4;
    UNK_30005C0_UNK10 *r3;

    r5 = gUnknown_03004E70[0];
    r6 = 0x80;
    ip = 0;
    while (ip < 4) {
        r0 = gUnknown_03001088[ip][0];
        while (r0 != 0) {
            r4 = &gUnknown_03004400[gUnknown_03001088[r0][1]];
            r3 = r4->unk10;
            while (TRUE) {
                *r5 = ((r3->unk2 | r4->unk16) << 8) | ((r3->unk6 + r4->unkE) & 0xFF);
                r5++;
                *r5 = (((r3->unk3 | r4->unk17) << 8) | ((r3->unk5 + r4->unkA) & 0x1FF));
                r5++;
                *r5 = (((r3->unk4 | r4->unk18) << 8) | (r3->unk0 + r4->unk14));
                r6 -= 1;

                if (r6 == 0) {
                    return;
                }

                r5 += 2;

                if (r3->unk7 == 0) {
                    break;
                }
                r3++;
            }
            r0 = gUnknown_03001088[r0][0];
        }
        ip += 1;
    }

    while (--r6 != (u8)-1) {
        *r5 = 512;
        r5 += 4;
    }
}

void sub_0200117c(void)
{
    s32 i;

    gUnknown_03005270 = gUnknown_0300127A;
    if (gUnknown_0300127A != 0) {
        for (i = 0; i < gUnknown_0300127A; i++) {
            gUnknown_030011D8[gUnknown_03001148[i][0]]++;
        }

        for (i = 0; i <= DISPLAY_HEIGHT; i++) {
            u8 *p = &gUnknown_030011D8[i];
            p[1] += p[0];
        }

        for (i = gUnknown_0300127A - 1; i >= 0; i--) {
            gUnknown_03004E20[--gUnknown_030011D8[gUnknown_03001148[i][0]]] = gUnknown_03001148[i][1];
        }

        for (i = gUnknown_0300127A - 1; i >= 0; i--) {
            u8 val = gUnknown_03004E20[i];
            gUnknown_03001088[gUnknown_03001080[3]][0] = gUnknown_0300111C;
            gUnknown_03001088[gUnknown_0300111C][1] = val;
            gUnknown_03001080[3] = gUnknown_0300111C++;
        }
    }
}

void sub_02001254(s8 p0, u8 p1)
{
    gUnknown_03001088[gUnknown_03001080[p1]][0] = gUnknown_0300111C;
    gUnknown_03001088[gUnknown_0300111C][1] = p0;
    gUnknown_03001080[p1] = gUnknown_0300111C++;
}

void sub_02001290(void)
{
    s32 i;
#ifndef NON_MATCHING
    register u8 *r5 asm("r5") = &gUnknown_03001140;
    register u8 *r4 asm("r4") = &gUnknown_03001141;
#endif

    for (i = 0; i < 128; i++) {
        gUnknown_03004E70[i][0] = 0x200;
    }

    for (i = 0; i < 32; i++) {
        gUnknown_03001120[i] = i * 2;
    }

    gUnknown_03001142 = 0;
#ifndef NON_MATCHING
    *r4 = 0;
    *r5 = 0;
#else
    gUnknown_03001141 = 0;
    gUnknown_03001140 = 0;
#endif
}

void sub_020012e0(void) { CpuFastCopy(gUnknown_03004E70, (void *)OAM, sizeof(gUnknown_03004E70)); }

s8 sub_020012f8(void)
{
    s8 ret;

    if (gUnknown_03001140 > 0x1F) {
        return -1;
    }

    ret = gUnknown_03001120[gUnknown_03001141++];
    gUnknown_03001141 = gUnknown_03001141 & 0x1F;
    gUnknown_03001140 += 1;
    return ret;
}

void sub_0200133c(s8 arg0)
{
    gUnknown_03001120[gUnknown_03001142++] = arg0;
    gUnknown_03001142 &= 0x1F;
    gUnknown_03001140 -= 1;
}

void sub_02001374(void)
{
    s32 i;
    for (i = 0; i <= DISPLAY_HEIGHT + 1; i++) {
        gUnknown_030011D8[i] = 0;
    }
    gUnknown_0300127A = 0;
}

void sub_02001398(u8 arg0, u8 arg1)
{
    if (arg1 > DISPLAY_HEIGHT + 48) {
        arg1 = 0;
    } else if (arg1 > DISPLAY_HEIGHT + 1) {
        arg1 = DISPLAY_HEIGHT + 1;
    }
    gUnknown_03001148[gUnknown_0300127A][0] = arg1;
    gUnknown_03001148[gUnknown_0300127A++][1] = arg0;
}

void sub_020013DC(UNK_30005C0 *unused)
{
    s32 var_r2;

    for (var_r2 = 0; var_r2 < 4; var_r2++) {
        gUnknown_03001080[var_r2] = var_r2;
        gUnknown_03001088[var_r2][0] = 0;
    }

    gUnknown_0300111C = var_r2;

    for (; var_r2 <= 0x49; var_r2++) {
        gUnknown_03001088[var_r2][0] = 0;
    }
}

void sub_02001420(void)
{
    u16 *p;
    const u16 *unk0;
    s32 j;

    while (gUnknown_030014F8 != 0) {
        gUnknown_030014F8 -= 1;
        unk0 = gUnknown_030013D8[gUnknown_030014F8].unk0;
        if (unk0 == NULL) {
            if (gUnknown_030013D8[gUnknown_030014F8].unk8 != (u8)-1) {
                u16 *r2 = gUnknown_030013D8[gUnknown_030014F8].unk4;
                u8 r4 = gUnknown_030013D8[gUnknown_030014F8].unk8;
                u8 i = gUnknown_030013D8[gUnknown_030014F8].unk9;
                u16 r5 = gUnknown_030013D8[gUnknown_030014F8].unkA;
                while (--i != (u8)-1) {
                    p = r2;
                    for (j = 0; j < r4; j++) {
                        *p++ = r5;
                    }
                    r2 += 32;
                }
            } else {
                CpuFastFill(gUnknown_030013D8[gUnknown_030014F8].unkA, gUnknown_030013D8[gUnknown_030014F8].unk4, 0x800);
            }
        } else {
            u16 *r2 = gUnknown_030013D8[gUnknown_030014F8].unk4;
            u8 temp_r5 = gUnknown_030013D8[gUnknown_030014F8].unk8;
            u8 i = gUnknown_030013D8[gUnknown_030014F8].unk9;
            u16 r7 = gUnknown_030013D8[gUnknown_030014F8].unkA;
            while (--i != (u8)-1) {
                p = r2;
                for (j = 0; j < temp_r5; j++) {
                    *p++ = r7 + *unk0++;
                }
                r2 += 32;
            }
        }
    }
}

/* MATH? */

// Random?
u32 sub_0200151c(void) { return gRandomSeed; }

void sub_02001528(u32 val) { gRandomSeed = val; }

s16 sub_02001534(void)
{
    gRandomSeed = gRandomSeed * 0x41c64e6d + 0x3039;
    return (gRandomSeed * 2) >> 0x11;
}

s16 sub_02001554(u16 arg0)
{
    u32 temp_r0;
    gRandomSeed = (gRandomSeed * 0x41C64E6D) + 0x3039;
    temp_r0 = gRandomSeed * 2;
    return Mod(temp_r0 >> 0x11, arg0);
}

/** something new */

u8 sub_02001588(s32 p0, u8 *arg1, u8 arg2)
{
    s32 i;
    u8 r0;

    arg1 += arg2;
    i = arg2;
    while (i > 0) {
#if !PORTABLE
        register u32 rem asm("r1");
#endif
        if (p0 <= 9) {
            *--arg1 = p0;
            break;
        }
        p0 = Div(p0, 10);
#if PORTABLE
        *--arg1 = Mod(p0, 10);
#else
        *--arg1 = rem;
#endif
        i -= 1;
    }

    r0 = 0;
    while (i > 1) {
        *--arg1 = 0;
        r0++;
        i -= 1;
    }

    return r0;
}

void sub_020015cc(s32 p0, u8 *arg1, u8 arg2, u8 arg3)
{
    s32 i, j;
    u8 r0;
    u8 *arr;

    arr = arg1;
    arr += arg2;
    i = arg2;
    while (i > 0) {
#if !PORTABLE
        register u32 rem asm("r1");
#endif
        if (p0 <= 9) {
            *--arr = p0;
            break;
        }
        p0 = Div(p0, 10);
#if PORTABLE
        *--arr = Mod(p0, 10);
#else
        *--arr = rem;
#endif
        i -= 1;
    }

    r0 = 0;
    while (i > 1) {
        *--arr = 0;
        r0++;
        i -= 1;
    }

    arg1 += r0;
    for (j = 0; j < arg2 - r0; j++) {
        *arg1 += arg3;
        arg1 += 1;
    }
}

void sub_0200163c(u16 *arg0, u8 arg1)
{
    while (--arg1 != (u8)-1) {
        u16 idx = *arg0++;
        // TODO: for a port this is gonna require changes
        // since these registers can change size
        *(u16 *)(REG_BASE + idx) = *arg0;
        arg0++;
    }
}

void sub_02001670(void) { gUnknown_030013D0 = 0; }

bool32 sub_02001698(u16, u16);

void sub_0200167c(u16 p1, u16 p2)
{
    gUnknown_030013D0 = 0;
    sub_02001698(p1, p2);
}

bool32 sub_02001698(u16 arg0, u16 arg1)
{
    u8 temp_r0;

    if (gUnknown_030013D0 > 7) {
        return FALSE;
    }
    gUnknown_030013B0[gUnknown_030013D0][0] = arg0;
    gUnknown_030013B0[gUnknown_030013D0++][1] = arg1;
    return TRUE;
}

void sub_020016d8(void)
{
    while (gUnknown_030013D0 != 0) {
        gUnknown_030013D0--;
        *(u16 *)(REG_BASE + gUnknown_030013B0[gUnknown_030013D0][0]) = gUnknown_030013B0[gUnknown_030013D0][1];
    }
}

void sub_02001718(u16 *arg0, u16 *arg1, u8 arg2, u8 arg3, u16 arg4)
{
    u16 *p;
    s32 j;

    while (--arg3 != (u8)-1) {
        p = arg1;
        for (j = 0; j < arg2; j++) {
            *p = *arg0 + arg4;
            arg0++;
            p++;
        }
        arg1 += 32;
    }
}

void sub_02001760(u16 *arg0, u8 arg2, u8 arg3, u16 arg4)
{
    u16 *p;
    s32 j;

    while (--arg3 != (u8)-1) {
        p = arg0;
        for (j = 0; j < arg2; j++) {
            *p = arg4;
            p++;
        }
        arg0 += 32;
    }
}

void sub_020017a4(void) { gUnknown_030014F8 = 0; }

bool32 sub_020017b0(const u16 *arg0, u16 *arg1, u8 arg2, u8 arg3, u16 arg4)
{
    if (gUnknown_030014F8 > 0x17) {
        return 0;
    }

    gUnknown_030013D8[gUnknown_030014F8].unk0 = arg0;
    gUnknown_030013D8[gUnknown_030014F8].unk4 = arg1;
    gUnknown_030013D8[gUnknown_030014F8].unk8 = arg2;
    gUnknown_030013D8[gUnknown_030014F8].unk9 = arg3;
    gUnknown_030013D8[gUnknown_030014F8++].unkA = arg4;
    return 1;
}

extern const s16 gUnknown_0201FB74[];
extern const s16 gUnknown_0201FD74[];

s32 sub_0200182c(u8 p1) { return gUnknown_0201FB74[p1]; }

s32 sub_02001840(u8 index) { return gUnknown_0201FB74[(index + 0xC0) & 0xFF]; }

u16 sub_0200185c(u8 *arg0, s32 arg1)
{
    u16 result = 0xFFFF;

    while (--arg1 != -1) {
        u32 thing = (result >> 8);
        u8 idx = result ^ *arg0;
        result = gUnknown_0201FD74[idx] ^ thing;
        arg0 += 1;
    }
    return (u16)~result;
}

void sub_020018B4(void);
// TODO: include main.h
extern void SetVBlankIntr(IntrFunc func);
void sub_020018a0(void)

{
    m4aSoundInit();
    SetVBlankIntr(sub_020018B4);
}

void sub_020018B4(void)
{
    m4aSoundVSync();
    gUnknown_03003330.unkE = 0;
}

/* garden.c */

#include "joy_bus.h"

extern UNK_30005C0 *gUnknown_03001510;
extern UNK_30005C0 *gUnknown_0300150C;
extern UNK_30005C0 gUnknown_03004400[72];

extern void sub_020017a4(void);
extern void sub_02001c60(void);

extern void sub_02001D68(void);
extern void sub_0200218c(UNK_30005C0 *);
extern void sub_02003424(UNK_30005C0 *);
extern void sub_020035CC(UNK_30005C0 *);
extern void sub_02003e04(UNK_30005C0 *);
extern void sub_020041E0(UNK_30005C0 *);
extern void sub_020074c0(UNK_30005C0 *);
extern void sub_02007500(UNK_30005C0 *);
extern void sub_02008324(UNK_30005C0 *);
extern void sub_020083e4(UNK_30005C0 *);
extern void sub_020088b0(UNK_30005C0 *);
extern void sub_020089B0(UNK_30005C0 *);
extern void sub_020089D4(UNK_30005C0 *);
extern void sub_02008A04(UNK_30005C0 *);
extern void sub_020088f8(UNK_30005C0 *);

extern const u16 gUnknown_02021BC4[];
extern const u8 gUnknown_02024618[];
extern s8 gUnknown_03001500;
extern u8 gUnknown_03001501;
extern s8 gUnknown_03001509;
extern u16 gUnknown_0300152A;
extern s8 gUnknown_0300152D;
extern u8 gUnknown_0300152F;
extern u8 gUnknown_03001530;
extern u8 gUnknown_0300159A;
extern u8 gUnknown_0300159B;
extern u8 gUnknown_030015A8[4][2];

extern u16 gUnknown_02020E9C[];
extern u16 gUnknown_02020EDC[];

u16 gUnknown_03001538[7];

#define WORK_RAM (void *)0x0203F800

void InitGarden(void)
{
    s32 i;
    UNK_30005C0 *temp_r0;

    sub_02001c60();
    sub_020017a4();
    CpuFastFill(0, (void *)BG_SCREEN_ADDR(28), 0x2000);
    LZ77UnCompWram(&gUnknown_02024618, WORK_RAM);

    if (gUnknown_03003330.unk10 == 0) {
        sub_02001718((u16 *)WORK_RAM, (u16 *)BG_SCREEN_ADDR(30), 9, 0x14, 0xE0);
    } else {
        sub_02001718((u16 *)(WORK_RAM + 0x168), (u16 *)BG_SCREEN_ADDR(30), 9, 0x14, 0xE0);
    }

    sub_02001718((u16 *)gUnknown_02021BC4, (u16 *)BG_SCREEN_ADDR(31), 0x16, 0x14, 0x200);

    gUnknown_030015A8[3][0] = 0;
    gUnknown_030015A8[1][0] = 0;
    gUnknown_030015A8[2][0] = 0;
    gUnknown_030015A8[0][0] = 0;
    sub_02000c90();
    sub_02000d04(&sub_02003424, &gUnknown_03004400[1], 1);
    gUnknown_0300159B = 0;

    for (i = 0; i < 16; i++) {
        if (gSaveGameState.unk36[i][1] != 0) {
            temp_r0 = sub_02000d04(&sub_020035CC, &gUnknown_03004400[1], 1);
            temp_r0->unk1A = i;
            gUnknown_0300159B += 1;
        }
    }

    gUnknown_0300152F = gSaveGameState.unk58;
    temp_r0 = sub_02000d04(&sub_020074c0, &gUnknown_03004400[0], 0);
    temp_r0->unk1A = 1;
    temp_r0 = sub_02000d04(&sub_020074c0, &gUnknown_03004400[0], 0);
    temp_r0->unk1A = 0;
    gUnknown_0300152D = 0;
    gUnknown_03001510 = sub_02000d04(&sub_020041E0, &gUnknown_03004400[0], 0);
    sub_02000d04(&sub_020089B0, &gUnknown_03004400[0], 0);

    for (i = 0; i < 3; i++) {
        if (gSaveGameState.unk30[i][1] != 0) {
            temp_r0 = sub_02000d04(&sub_020083e4, &gUnknown_03004400[0], 0);
            temp_r0->unk1A = i;
        }
    }

    gUnknown_0300159A = 0;
    for (i = 0; i < 8; i++) {
        if (gSaveGameState.unk5A[i] != 0xFF) {
            temp_r0 = sub_02000d04(&sub_02008324, &gUnknown_03004400[0], 0);
            temp_r0->unk19 = i;
            temp_r0->unk1A = gSaveGameState.unk5A[i];
            gUnknown_0300159A += 1;
        }
    }

    gUnknown_03001530 = 0xFF;
    if (gSaveGameState.unk59 != 0xFF) {
        temp_r0 = sub_02000d04(&sub_02003e04, &gUnknown_03004400[0], 0);
        temp_r0->unk1A = gSaveGameState.unk59;
    }

    sub_02000d04(&sub_02007500, &gUnknown_03004400[0], 0);
    gUnknown_0300150C = sub_02000d04(&sub_02008A04, &gUnknown_03004400[0], 0);
    sub_02000d04(&sub_0200218c, &gUnknown_03004400[0], 0);
    sub_02000d04(&sub_020089D4, &gUnknown_03004400[0], 0);
    temp_r0 = sub_02000d04(&sub_020088b0, &gUnknown_03004400[0], 0);
    temp_r0->unk1A = 16;
    gUnknown_03001509 = 0;
    gUnknown_0300152A = 0x1F40;
    sub_0200167c(0, gUnknown_0300152A);
    m4aSongNumStart(MUS_GARDEN);
    gUnknown_03003330.unkF = 1;
    gUnknown_03003330.unk0 = &sub_02001D68;
    gUnknown_03001500 = gUnknown_03001501 = 0;
}

void sub_02001b58(void)
{
    s16 *var_r2;
    s32 i;

    sub_0200163c(gUnknown_02020E9C, 0xD);
    sub_0200163c(gUnknown_02020EDC, 3);
    i = 0;
    for (i = 0; i < 7; i++) {
        gUnknown_03001538[i] = gSaveGameState.unk6A[i] + 0x2AF;
    }
    sub_02001718(gUnknown_03001538, (void *)0x0600F042, 7, 1, 0xA000);
    sub_02000d04(sub_020088f8, gUnknown_03004400, 0)->unk1A = 0x10;
    gUnknown_0300152A = 0x1F40;
    sub_0200167c(0, gUnknown_0300152A);
    gUnknown_03003330.unkF = 1;
    gUnknown_03003330.unk0 = &sub_02001D68;
}

void sub_02001BF8(void)
{
    sub_02001c60();
    gUnknown_030015A8[0][0] = gUnknown_030015A8[1][0];
    gUnknown_030015A8[2][0] = gUnknown_030015A8[3][0];
    gUnknown_03001530 = 0xFF;
    sub_02000d04(&sub_020088b0, gUnknown_03004400, 0)->unk1A = 0x10;
    gUnknown_0300152A = 0x1F40;
    sub_0200167c(0, gUnknown_0300152A);
    m4aSongNumStart(MUS_GARDEN);
    gUnknown_03003330.unkF = 1;
    gUnknown_03003330.unk0 = &sub_02001D68;
}

extern u16 gUnknown_02020ED0[];
extern u8 gUnknown_020233FC[];
extern u8 gUnknown_020235FC[];
extern u8 gUnknown_020235FC[];
extern u8 gUnknown_02022C44[];
extern u8 gUnknown_020220EC[];
extern u8 gUnknown_020211C8[];
extern u8 gUnknown_020246E4[];
extern u8 gUnknown_02024C24[];
extern u8 gUnknown_020268B4[];
extern u16 gUnknown_030015B0[32];
extern u16 gUnknown_020248E4[][16];
extern u16 gUnknown_02024AA4[][16];

void sub_02001c60(void)
{
    s32 j, k, i;
    s32 *var_r3, *var_r6;

    sub_0200163c(gUnknown_02020E9C, 0xD);
    sub_0200163c(gUnknown_02020ED0, 3);
    CpuFastFill(0, (void *)BG_VRAM, 64);
    CpuFastCopy(&gUnknown_020233FC, (void *)BG_PLTT, BG_PLTT_SIZE);
    LZ77UnCompVram(&gUnknown_020235FC, (void *)BG_VRAM + 0x1C00);
    LZ77UnCompVram(&gUnknown_02022C44, (void *)BG_VRAM + 0x41E0);
    LZ77UnCompVram(&gUnknown_020220EC, (void *)BG_VRAM + 0x55E0);
    LZ77UnCompVram(&gUnknown_020211C8, (void *)BG_VRAM + 0x8000);
    var_r6 = (void *)BG_VRAM + 0xF80;
    for (i = 0; i < 10; i++) {
        CpuFastSet((void *)BG_VRAM + 0x2980, (void *)BG_VRAM + 0xF80 + (i * 0x140), 0x50);
        var_r3 = (void *)BG_VRAM + 0x2AC0 + (i * 32);
        for (j = 0; j < 10; j++) {
            for (k = 0; k < 8; k++) {
                *var_r6++ |= *var_r3++;
            }
            var_r3 -= 8;
        }
    };
    CpuFastSet(&gUnknown_020246E4, (void *)OBJ_PLTT, 0x80);
    LZ77UnCompVram(&gUnknown_02024C24, (void *)OBJ_VRAM0 + 0x2D80);
    LZ77UnCompVram(&gUnknown_020268B4, (void *)OBJ_VRAM0 + 0x1580);
}

void sub_02001D68(void)
{
    sub_020016d8();
    sub_020012e0();
    sub_02001420();

    if (gUnknown_030015A8[0][0] != 0) {
        gUnknown_030015A8[0][0] = 0;
        gUnknown_030015A8[1][0] = 1;
        if (gUnknown_030015A8[0][1] > 13) {
            CpuCopy16(gUnknown_030015B0, (void *)OBJ_PLTT, ARRAY_COUNT(gUnknown_030015B0));
        } else {
            CpuCopy16(gUnknown_020248E4[gUnknown_030015A8[0][1]], (void *)OBJ_PLTT, 32);
        }
    }

    if (gUnknown_030015A8[2][0] != 0) {
        gUnknown_030015A8[2][0] = 0;
        gUnknown_030015A8[3][0] = 1;
        CpuCopy16(gUnknown_02024AA4[gUnknown_030015A8[2][1]], (void *)OBJ_PLTT + 0x1C0, 32);
    }

    sub_02000590();
    sub_02001374();
    sub_02000eac();
    sub_0200117c();
    sub_02001088();
}

void sub_02001e00(void)
{
    REG_BLDCNT = 0x8BF;
    REG_BLDY = ++gUnknown_03003330.unkC;
    REG_BLDALPHA = (((0x10 - gUnknown_03003330.unkC) & 0xFE) << 7) | gUnknown_03003330.unkC;

    if (gUnknown_03003330.unkC > 0xF) {
        void *r4 = gUnknown_03003330.unk4;
        if (r4 == NULL) {
            m4aMPlayAllStop();
            m4aSoundMain();
            VBlankIntrWait();
            m4aSoundVSyncOff();
            REG_IME = 0;
            REG_IE = 0;
            SoftResetRom(0x20);
            return;
        }
        gUnknown_03003330.unk0 = r4;
    }
}

extern u8 gUnknown_020202B6[][10][7];
extern u8 gUnknown_0202071C;

#define UNK_80(idx) (idx + gSaveGameState.unk80)

void sub_02001e74(void)
{
    s32 r3;
    s32 i;
    bool32 temp_r4;
    u32 r4;

    u8 *p, *var_r2_2;
    u8 sp0[5];

    CpuFill16(0, gSaveGameState.unk6A, 0x7EE);
    gSaveGameState.unk6A[8] = gSaveGameState.unk59;
    gUnknown_03001501 = gSaveGameState.unk59 = 0xFF;
    gUnknown_0300152F = gSaveGameState.unk62 = gSaveGameState.unk69 = 0;
    gSaveGameState.unk58 = 0;
    gUnknown_0300152D = 9;

    temp_r4 = gUnknown_03003330.unk10 != 0;
    r3 = sub_02001554(0xA);

    for (i = 0; i < 7; i++) {
        gSaveGameState.unk6A[i] = gUnknown_020202B6[temp_r4][r3][i];
    }

    gSaveGameState.unk74 = 0x64;
    gSaveGameState.unk73 = 0x64;

    switch (sub_02001554(3)) { /* irregular */
        case 0:
            for (i = 0; i < 5; i++) {
                sp0[i] = i;
            }
            for (i = 0; i < 4; i++) {
                r3 = sub_02001554((5 - i));
                *UNK_80(i) = sp0[r3];
                for (; r3 <= 3; r3++) {
                    sp0[r3] = sp0[r3 + 1];
                }
            }
            gSaveGameState.unk80[4] = sp0[0];
            break;
        case 1:
            for (i = 0; i < 5; i++) {
                *UNK_80(i) = sub_02001554(3) + 1;
            }
            break;
        case 2: {
            u8 r4_2;
            for (i = 0; i < 5; i++) {
                *UNK_80(i) = 0;
            }

            r4_2 = 12;
            while (TRUE) {
                // bool32 shouldContinue = FALSE;
                for (i = 0; i < 5; i++) {
                    if (*UNK_80(i) > 4) {
                        continue;
                    }

                    if (r4_2 > 4) {
                        r3 = sub_02001554(6);
                    } else {
                        r3 = sub_02001554(r4_2 + 1);
                    }

                    if (*UNK_80(i) + r3 > 5) {
                        continue;
                    }
                    *UNK_80(i) += r3;
                    r4_2 -= r3;

                    if (r4_2 == 0) {
                        // TODO: is this solvable without a goto?
                        goto brk;
                        // shouldContinue = FALSE;
                        // break;
                    }
                }
                // if (shouldContinue == FALSE) {
                //     break;
                // }
            }
        }
    }
brk:

    for (i = 0; i < 3; i++) {
        i[gSaveGameState.unk80 + 5] = 0xFF;
    }

    for (i = 0; i < 8; i++) {
        i[gSaveGameState.unk80 + 8] = 1;
    }

    var_r2_2 = &gUnknown_0202071C;
    p = gSaveGameState.unkD8;
    for (i = 0; i < 0x780; i++) {
        *p++ = *var_r2_2++;
    };

    r4 = (sub_02001534() << 0x10) + sub_02001534() + gUnknown_03003330.unk8;
    gSaveGameState.unkE8 = (s8)(r4 >> 0x18);
    gSaveGameState.unkE9 = (s8)(r4 >> 0x10);
    gSaveGameState.unkEA = (s8)(r4 >> 8);
    gSaveGameState.unkEB = r4;
    r4 = (sub_02001534() << 0x10) + sub_02001534() + gUnknown_03003330.unk8;
    gSaveGameState.unkEC = (s8)(r4 >> 0x18);
    gSaveGameState.unkED = (s8)(r4 >> 0x10);
    gSaveGameState.unkEE = (s8)(r4 >> 8);
    gSaveGameState.unkEF = r4;
    r4 = (sub_02001534() << 0x10) + sub_02001534() + gUnknown_03003330.unk8;
    gSaveGameState.unkF0 = (s8)(r4 >> 0x18);
    gSaveGameState.unkF1 = (s8)(r4 >> 0x10);
    gSaveGameState.unkF2 = (s8)(r4 >> 8);
    gSaveGameState.unkF3 = r4;
    r4 = (sub_02001534() << 0x10) + sub_02001534() + gUnknown_03003330.unk8;
    gSaveGameState.unkF4 = (s8)(r4 >> 0x18);
    gSaveGameState.unkF5 = (s8)(r4 >> 0x10);
    gSaveGameState.unkF6 = (s8)(r4 >> 8);
    gSaveGameState.unkF7 = r4;
    r4 = (sub_02001534() + gUnknown_03003330.unk8) << 0x10;
    gSaveGameState.unkF8 = (s8)(r4 >> 0x18);
    gSaveGameState.unkF9 = (s8)(r4 >> 0x10);
    gSaveGameState.unkFA = (s8)(r4 >> 8);
    gSaveGameState.unkFB = r4;
    gSaveGameState.unk132 = gSaveGameState.unk528 = gSaveGameState.unk529 = gSaveGameState.unk72;

    for (i = 0; i < 5; i++) {
        u8 *tmp = UNK_80(i);
        gSaveGameState.unk4EC[i][0] = gSaveGameState.unk4EC[i][1] = *tmp;
    }
}

void sub_020021F4(UNK_30005C0 *);

void sub_0200218c(UNK_30005C0 *arg0)
{
    if (!(gUnknown_03003330.unkF & -(0x81))) {
        if (((arg0->unk19 == 0) || ((--arg0->unk19 == 0))) && (8 & gInput.unk4)) {
            m4aMPlayAllStop();
            m4aSongNumStart(0xE);
            arg0->unkE = 0;
            arg0->unk19 = 8U;
            arg0->unk0 = (void *)&sub_020021F4;
            gUnknown_03003330.unkF |= 0x80;
        } else {
            gUnknown_03003330.unkF &= ~0x80;
        }
    }
}

extern const u16 gUnknown_0202003E[][96];
extern const u16 gUnknown_020201BE[2][2][24];
extern const u16 gUnknown_0202027E[][4];

extern void sub_02008940(void);

void sub_020021F4(UNK_30005C0 *arg0)
{
    const u16 *var_r2;
    u32 temp_r0_5;

    if (((arg0->unk19 == 0) || (--arg0->unk19 == 0)) && (gInput.unk4 & (START_BUTTON | A_BUTTON | B_BUTTON))) {
        u16 song;
        if (gInput.unk0 & 2) {
            song = 0xD;
        } else if (arg0->unkE != 0) {
            m4aSongNumStart(0xC);
            arg0->unk19 = 0x2DU;
            arg0->unk0 = (void *)&sub_02008940;
            return;
        } else {
            song = 0xC;
        }
        m4aMPlayAllContinue();
        m4aSongNumStart(song);
        arg0->unk19 = 8U;
        arg0->unk0 = (void *)&sub_0200218c;
        sub_020017b0(NULL, (void *)VRAM + 0xE000, 0xFF, 0, 0);
        return;
    }

    if (gInput.unk4 & 0x80) {
        if (++arg0->unkE > 1) {
            arg0->unkE = 1;
        } else {
            m4aSongNumStart(0xB);
        }
    } else if (0x40 & gInput.unk4) {
        if (--arg0->unkE < 0) {
            arg0->unkE = 0;
        } else {
            m4aSongNumStart(0xB);
        }
    }
    temp_r0_5 = gUnknown_03003330.unk10 != 0;
    sub_020017b0(gUnknown_020201BE[temp_r0_5][arg0->unkE], (void *)VRAM + 0xE014 + ((arg0->unkE * 2) + 1) * 64, 0xC, 2, 0x416B);
    var_r2 = gUnknown_0202027E[0];
    if (!(gUnknown_03003330.unk8 & 0x10)) {
        var_r2 = gUnknown_0202027E[1];
    }
    sub_020017b0(var_r2, (void *)VRAM + 0xE010 + ((arg0->unkE * 2) + 1) * 64, 2, 2, 0x31E5);
    sub_020017b0(gUnknown_0202003E[temp_r0_5], (void *)VRAM + 0xE00E, 0x10, 6, 0x316B);
}

extern u8 gUnknown_020277C0[];
extern u8 *gUnknown_02027798[][2];
extern u8 *gUnknown_0202A2DC[][3];

void sub_02002364(u8 arg0, u8 *arg1, s8 *arg2)
{
    s32 j, i, k;

    u8 r5, r7;

    s16 r8;
    s32 r6;

    s16 *p2, *p3;
    u8 *p1;

    for (i = 0; i < 5; i++) {
        if (gUnknown_020277C0[i] == arg0) {
            break;
        }
    }

    if (i > 4) {
        // wtf
        while (TRUE) { }
    }

    if (gUnknown_03003330.unk10 <= 1) {
        p1 = gUnknown_02027798[i][gUnknown_03003330.unk10];
    } else {
        p1 = gUnknown_0202A2DC[i][gUnknown_03003330.unk10 - 2];
    }
    r5 = *p1++;
    r7 = *p1++;

    p2 = (s16 *)WORK_RAM;
    *p2++ = 0x1ED;
    for (i = 0; i < r5; i++) {
        *p2++ = 0x1EE;
    }
    *p2++ = 0x5ED;

    for (j = 0; j < r7; j++) {
        *p2++ = 0x1EF;
        for (i = 0; i < r5; i++) {
            *p2++ = 0x1F0;
        }
        *p2++ = 0x5EF;
    }

    *p2++ = 0x9ED;

    for (i = 0; i < r5; i++) {
        *p2++ = 0x9EE;
    }

    *p2 = 0xDED;

    r5 += 2;
    r8 = 0;
    r6 = 0;
    for (k = 0; k < r7; k++) {
        j = (k + 1) * r5;
        p3 = (s16 *)WORK_RAM + j + 1;

        while (TRUE) {
            u8 r3 = *p1++;
            if (r3 == 0x5F) {
                r3 = *p1++;
                if ((s8)r3 < 0) {
                    break;
                }
                r8 = r3 * 4096;
            } else if (r3 == 0xFF) {
                s32 j_2 = 0;
                if (r6 == 0) {
                    j_2 = 0x100;
                }
                r6 = j_2;
            } else {
                s32 temp = r6 + r3;
                temp += 0x2AF;
                *p3++ = temp + r8;
            }
        }
    }

    *arg1 = r5;
    *arg2 = r7 + 2;
}
