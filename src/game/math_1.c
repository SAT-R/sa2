#include "global.h"
#include "game/math.h"

struct UNK_8085F1C_1 {
    u8 filler0[2];
    s16 unk2[9];
    s32 unk14;
    s32 unk18;
    s32 unk1C;
};

struct UNK_8085F1C {
    struct UNK_8085F1C *unk0;
    u8 unk4[8];
    u32 unkC;
    s32 unk10;
    struct UNK_8085F1C_1 unk14;
    struct UNK_8085F1C_1 unk34;

    s16 unk54;
    s16 unk56;
    s16 unk58;
    u8 unk59[2];

    s16 unk5C;
    s16 unk5E;
    s16 unk60;
    u8 unk62[2];

    s32 unk64;
    s32 unk68;
    s32 unk6C;

    u8 unk70[4];
};

struct UNK_8085F1C_1 *sub_8085EC4(struct UNK_8085F1C *p1);

void sub_80853F8(struct UNK_8085F1C *p1);

void sub_8083B88(struct UNK_8085F1C_1 *, struct UNK_8085F1C_1 *, struct UNK_8085F1C_1 *);

void sub_80835E0(struct UNK_8085F1C *p2, s32 *);

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
    struct UNK_8085F1C_1 *unk34;
    p1->unk10 = 0;

    // memset 0
    unk34 = &p1->unk34;
    for (i = 0; i < 0x20; i += 4) {
        *((u32 *)unk34)++ = 0;
    }

    unk34->unk2[8] = 0x400;
    unk34->unk2[4] = 0x400;
    unk34->unk2[0] = 0x400;
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
