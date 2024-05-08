#include <string.h>

#include "global.h"
#include "game/math.h"
#include "trig.h"

struct UNK_8085F1C_1 *sub_8085EC4(struct UNK_8085F1C *p1);

void sub_8083B88(struct UNK_8085F1C_1 *, struct UNK_8085F1C_1 *, struct UNK_8085F1C_1 *);

void sub_80835E0(struct UNK_8085F1C *p2, s32 *);

typedef struct {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    u16 unk6;
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

// // p1 is unknown
// void sub_80859F4(void *p1, u16 p2)
// {
//     UNK_8085D14 *thing = (p1 + ((p2 >> 0xC) * 2));

//     u16 unclamped = (p2 & 0xFFF);
//     u16 clamped = 0xFFF - unclamped;

//     s32 val1_old = SQUARE(clamped) >> 0xC;
//     s32 val1 = (unclamped * val1_old) >> 0xC;

//     s32 temp = SQUARE(clamped) >> 0xC;
//     s32 temp2 = (clamped * temp) >> 0xC;
//     s32 temp3 = (temp2 * thing->unk0 * 0xAB) >> 10;

//     s32 temp4 = (unclamped * val1_old) >> 0xD;
//     s32 temp5 = (temp4 - val1_old) + 0xAAA;

//     // part 1
//     s32 temp6 = (temp3 + temp5) * thing->unk2;

//     s32 temp7 = (unclamped + val1_old);
//     s32 temp8 = (temp8 - val1) >> 1;
//     s32 temp9 = thing->unk4 * (temp8 + 0x2AA);
//     s32 temp10 = (val1 * thing->unk6 * 0xAB) >> 10;

//     s32 temp11 = (temp6 + temp9 + temp10) * 0x400;

//     return temp11 >> 0x16;
// }

void sub_8085A88(UNK_8085D14 *p1)
{
    p1->unk0 = 0;
    p1->unk2 = 0x400;
    p1->unk4 = 0x400;
    // TODO: probably wrong type
    *(u32 *)&p1->unk8 = 0;
    *(u32 *)&p1->unkC = 0;
}

void sub_8085A9C(UNK_8085D14 *p1, u8 p2)
{
    u16 dist = Sqrt(SQUARE(p1->unk0) + SQUARE(p1->unk2) + SQUARE(p1->unk4));
    u32 thing = (p2 << 1);
    s32 div = (1 << thing) / dist;
    p1->unk0 = (div * p1->unk0) >> p2;
    p1->unk2 = (div * p1->unk2) >> p2;
    p1->unk4 = (div * p1->unk4) >> p2;
}

s32 sub_8085B00(UNK_8085D14 *p1, UNK_8085D14 *p2, u8 p4)
{
    u32 something = p4;
    return ((p1->unk0 * p2->unk0) + (p1->unk2 * p2->unk2) + (p1->unk4 * p2->unk4)) >> p4;
}

void sub_8085B34(UNK_8085D14 *p1, UNK_8085D14 *p2, UNK_8085D14 *p3, u8 p4)
{
    u32 something = p4;
    p3->unk0 = ((p1->unk2 * p2->unk4) - (p1->unk4 * p2->unk2)) >> something;
    p3->unk2 = ((p1->unk4 * p2->unk0) - (p1->unk0 * p2->unk4)) >> something;
    p3->unk4 = ((p1->unk0 * p2->unk2) - (p1->unk2 * p2->unk0)) >> something;
}

void sub_8085B90(UNK_8085D14 *p1)
{
    p1->unk4 = 0;
    p1->unk2 = 0;
    p1->unk0 = 0;

    p1->unk6 = 0x400;
}

void sub_8085BA0(UNK_8085D14 *p1)
{
    p1->unk0 = -p1->unk0;
    p1->unk2 = -p1->unk2;
    p1->unk4 = -p1->unk4;
}

void sub_8085BB4(UNK_8085D14 *p1, u16 rad)
{
    s32 sin;
    rad = rad >> 1;
    sin = SIN(rad) >> 4;
    p1->unk0 = sin;
    p1->unk2 = 0;
    p1->unk4 = 0;
    p1->unk6 = COS(rad) >> 4;
}

void sub_8085BEC(UNK_8085D14 *p1, u16 rad)
{
    s32 sin;
    rad = rad >> 1;
    sin = SIN(rad) >> 4;
    p1->unk0 = 0;
    p1->unk2 = sin;
    p1->unk4 = 0;
    p1->unk6 = COS(rad) >> 4;
}

void sub_8085C24(UNK_8085D14 *p1, u16 rad)
{
    s32 sin;
    rad = rad >> 1;
    sin = SIN(rad) >> 4;
    p1->unk0 = 0;
    p1->unk2 = 0;
    p1->unk4 = sin;
    p1->unk6 = COS(rad) >> 4;
}

void sub_8085C5C(UNK_8085D14 *p1, u16 rad, UNK_8085D14 *p3)
{
    s32 sin;
    rad = rad >> 1;
    sin = SIN(rad) >> 4;
    p1->unk0 = (sin * p3->unk0) >> 10;
    p1->unk2 = (sin * p3->unk2) >> 10;
    p1->unk4 = (sin * p3->unk4) >> 10;
    p1->unk6 = COS(rad) >> 4;
}

void sub_8085CA8(UNK_8085D14 *p1)
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

void sub_8085CC0(UNK_8085D14 *p1)
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

void sub_8085CE4(UNK_8085D14 *p1, u32 p2, u32 p3, u32 p4)
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

void sub_8085D14(UNK_8085D14 *p1, u32 p2, u32 p3, u32 p4)
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

typedef struct {
    void *unk0;
    void *start;
    void *next;
    void *unkC;
} UNK_8085DEC;

bool8 sub_8085D98(UNK_8085DEC *thing, UNK_8085DEC *target);

void sub_8085D44(UNK_8085DEC *thing)
{
    thing->unk0 = NULL;
    thing->start = NULL;
    thing->next = NULL;
    thing->unkC = NULL;
}

UNK_8085DEC *sub_8085D50(UNK_8085DEC *thing)
{
    while (thing->unk0 != NULL) {
        thing = thing->unk0;
    }

    return thing;
}

void sub_8085D64(UNK_8085DEC *thing)
{
    if (thing->unk0 != NULL) {
        sub_8085D98(thing->unk0, thing);
    }
}

void sub_8085D78(UNK_8085DEC *thing, UNK_8085DEC *target)
{
    if (target->unk0 != NULL) {
        sub_8085D98(target->unk0, target);
    }
    target->unk0 = thing;
    target->next = thing->start;
    thing->start = target;
}

bool8 sub_8085D98(UNK_8085DEC *thing, UNK_8085DEC *target)
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

u16 sub_8085DD0(UNK_8085DEC *thing)
{
    u16 num = 0;
    thing = thing->start;
    while (thing != NULL) {
        num++;
        thing = thing->next;
    }

    return num;
}

UNK_8085DEC *sub_8085DEC(UNK_8085DEC *thing, u16 num)
{
    thing = thing->start;
    while (thing != NULL && num != 0) {
        num--;
        thing = thing->next;
    }

    return thing;
}

void sub_8085E10(struct UNK_8085F1C *p1, struct UNK_8085F1C *p2)
{
    memcpy(p2, &p1->unk10, 0x10);
}

void sub_8085E24(struct UNK_8085F1C *p1, struct UNK_8085F1C *p2)
{
    memcpy(&p1->unk10, p2, 0x10);
}

void sub_8085E38(struct UNK_8085F1C *p1, struct UNK_8085F1C *p2)
{

    memcpy(p2, &p1->unk10, 0x10);

    while (p1 = p1->unk0, p1 != NULL) {
        sub_80835E0(p2, &p1->unk10);
    }
}

void sub_8085E64(struct UNK_8085F1C *p1)
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

void sub_8085E94(struct UNK_8085F1C *p1)
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

struct UNK_8085F1C_1 *sub_8085EC4(struct UNK_8085F1C *p1)
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

struct UNK_8085F1C_1 *sub_8085F1C(struct UNK_8085F1C *p1)
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

void sub_8085F84(void)
{
    // unused
}
