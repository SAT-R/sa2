#include "global.h"

void sub_02001290(void);
extern u8 gUnknown_03000606;
extern u8 gUnknown_03000607;
extern u8 gUnknown_03000608;

typedef void (*CallbackFunc)(void *);

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
    CallbackFunc unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u16 unk8;
    u16 unkA;
    u16 unkC;
    u16 unkE;
    UNK_30005C0_UNK10 *unk10;
    u16 unk14;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;
    u16 unk1A;
    s8 unk1C;
    u32 unk20;
} UNK_30005C0;

extern UNK_30005C0 gUnknown_03004400[72];
extern UNK_30005C0 gUnknown_03000610[72];

extern u8 gUnknown_03001076;
extern u8 gUnknown_03001077;
extern u8 gUnknown_03001078;

extern s8 gUnknown_03005270;

u8 gUnknown_03001030[0x45];
u8 gUnknown_030005C0[0x45];

extern u8 gUnknown_03001120[32];
extern u8 gUnknown_03001140;
extern u8 gUnknown_03001141;
extern u8 gUnknown_03001142;
extern u16 gUnknown_03001280[128];
extern u8 gUnknown_03001380[32];
extern u8 gUnknown_030013A0;
extern u8 gUnknown_030013A1;
extern u8 gUnknown_030013A2;

extern u16 gUnknown_03004E70[128][4];
extern u8 gUnknown_03001088[4][2];

void sub_020013DC(UNK_30005C0 *);
void DummyCallback(UNK_30005C0 *);

void sub_02000c90(void)
{
    s8 *p, *arr;
    u32 i, val;

    sub_02001290();
    gUnknown_03004400[0].unk0 = (void *)sub_020013DC;
    gUnknown_03004400[0].unk5 = 0;
    gUnknown_03004400[0].unk4 = 0;
    gUnknown_03004400[0].unk6 = 1;
    gUnknown_03004400[1].unk0 = (void *)DummyCallback;
    gUnknown_03004400[1].unk4 = 1;
    gUnknown_03004400[1].unk6 = 0;
    gUnknown_03004400[1].unk5 = 0;

    arr = gUnknown_030005C0;
    i = 71;
    p = arr + 69;
    do {
        *p = i;
        i -= 1;
        p -= 1;
    } while ((s32)p >= (s32)arr);

    val = 0;
    gUnknown_03000606 = gUnknown_03000607 = gUnknown_03000608 = gUnknown_03005270 = val;
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
        gUnknown_03004400[i].unk0(&gUnknown_03004400[i]);
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
