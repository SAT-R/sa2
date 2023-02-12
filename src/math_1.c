#include "global.h"

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
};

struct UNK_8085F1C_1 *sub_8085EC4(struct UNK_8085F1C *p1);

void sub_80853F8(struct UNK_8085F1C *p1);

void sub_8083B88(struct UNK_8085F1C_1 *, struct UNK_8085F1C_1 *, struct UNK_8085F1C_1 *);

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
