#include "main.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_utils.h"

// character sprites
extern const struct UNK_80DF670* const gUnknown_080DF670[5];

extern const s16 gUnknown_080DF9D8[7][3];

extern const struct UNK_80DF670 gUnknown_080DF668;

void sub_806D2C8(void);

void sub_806D548(struct UNK_0808B3FC_UNK240* element, void*, s16, u8, const struct UNK_80DF670*);
struct Task* sub_806CF78(struct SpecialStage* stage) {
    const struct UNK_80DF670* unkF670[5];
    u8 lang;
    s16 result;
    u32 unk5B5C;
    void* ram;
    u32 temp;

    struct Task* t;
    struct UNK_806CF78* unkCF78;

    memcpy(&unkF670, &gUnknown_080DF670, 0x14);
    lang = stage->unk5B8;

    t = TaskCreate(sub_806D2C8, 0x108, 0x9000, 0, NULL);
    unkCF78 = TaskGetStructPtr(t);
    unkCF78->unk0 = stage;
    unkCF78->unk4 = NULL;
    unkCF78->unkA8 = gUnknown_080DF9D8[lang][0] << 0x10;
    unkCF78->unkAC = gUnknown_080DF9D8[lang][1] << 0x10;

    unkCF78->unkB0 = 0;
    unkCF78->unkB2 = gUnknown_080DF9D8[lang][2];
    unkCF78->unkB4 = 0;
    unkCF78->unkB6 = 0x96;
    unkCF78->unkBC = 0;
    unkCF78->unkBE = 0;
    unkCF78->unkC0 = 1;

    unkCF78->unkC4 = unkF670[stage->unk5B6];
    result = sub_806CF44(unkCF78->unkC4);
    unkCF78->unk98 = gUnknown_03005B5C;
    gUnknown_03005B5C += (result * TILE_SIZE_4BPP);
    unkCF78->unk9C = gUnknown_03005B5C;
    unkCF78->unkA0 = gUnknown_03005B5C + 0x40;

    // required for match
    temp = 2;

    gUnknown_03005B5C += 0xC0;

    sub_806D548(&unkCF78->unk8, unkCF78->unk98, stage->unk5CC, 9, unkCF78->unkC4);
    sub_806D548(&unkCF78->unk38, unkCF78->unk9C, stage->unk5CC, 10, &gUnknown_080DF668);

    {
        struct UNK_0808B3FC_UNK240* element = &unkCF78->unk68;
        u16* affine = &gOamBuffer[120].all.affineParam;

        element->unk4 = unkCF78->unkA0;
        element->unk8 = 0;
        element->unkA = 0x37A;
        element->unk10 = 0x107E;
        element->unk16 = 0x78;
        element->unk18 = 0x50;
        element->unk1A = 0;
        element->unk1C = 0;
        element->unk1E = -1;
        
        element->unk20 = temp;
        element->unk21 = -1;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk28 = -1;
        
        if (stage->unk5BA == 0) {
            sub_8004558(element);
        }

        *affine = 0x100;
        affine+=4;
        *affine = 0;
        affine+=4;
        *affine = 0;
        affine+=4;
        *affine= 0x100;
    }

    if (stage->unk5B7 == 0) {
        unkCF78->unkC8 = 0;
        unkCF78->unkCC = 6;
        unkCF78->unkD0 = 0x10000;
        unkCF78->unkD4 = 0x10000;
        unkCF78->unkD8 = 0x28;
        unkCF78->unkDC = -0x2B;
        unkCF78->unkE0 = -0x15E;
        unkCF78->unkE4 = 0x2C80;
        unkCF78->unkE8 = 0x3F80;
        unkCF78->unkEC = 0x502;
        unkCF78->unkEE = 0x8C0;
        unkCF78->unkF0 = 0x14;
        unkCF78->unkF2 = -0x28;
        unkCF78->unkF4 = -0x36;
        unkCF78->unkF6 = -0x48;
        unkCF78->unk100 = -0x10;
        unkCF78->unk104 = -8;
        unkCF78->unkF8 = 0x800;
        unkCF78->unkFA = -0x80;
        unkCF78->unkFC = 0x600;
        unkCF78->unkFE = -0x40;
    } else {
        unkCF78->unkC8 = 0;
        unkCF78->unkCC = 0;
        unkCF78->unkD0 = 0xC00;
        unkCF78->unkD4 = 0x7FFF;
        unkCF78->unkD8 = 0x100;
        unkCF78->unkDC = 0x800;
    }

    return t;
}

typedef void (*TaskFunc_80DF684)(void);

extern TaskFunc_80DF684 const gUnknown_080DF684[18];

void sub_806D788(void);

void sub_806D2C8(void) {
    TaskFunc_80DF684 funcs[18];
    struct UNK_0808B3FC_UNK240 *unk8, *unk38;
    
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkCF78->unk0;

    memcpy(funcs, gUnknown_080DF684, sizeof(gUnknown_080DF684));

    if (stage->unk5BA == 0) {
        funcs[unkCF78->unkB4 + 1]();
        sub_806D788();
    } else {
        funcs[0]();
    }

    unk8 = &unkCF78->unk8;
    unk38 = &unkCF78->unk38;
    
    if (unkCF78->unkB6 != 0 && stage->unk5BA == 0) {
        if ((--unkCF78->unkB6) & 2) {
            sub_80051E8(unk8);
            if (unkCF78->unkB4 < 0xE) {
                sub_80051E8(unk38);
            }
        }
    } else {
        sub_80051E8(unk8);
        if (unkCF78->unkB4 < 0xE) {
            sub_80051E8(unk38);
        }
    }
}

void sub_806D7D0(struct UNK_0808B3FC_UNK240* element, s16, s16, const struct UNK_80DF670*);
void sub_806D830(struct UNK_0808B3FC_UNK240* element, s16, s16, const struct UNK_80DF670*);

// Animations for different player speeds

// Stopped?
void sub_806D388(void) {
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkCF78->unk0;
    const struct UNK_80DF670* unkC4;
    struct UNK_0808B3FC_UNK240* unk8;
    u32 index = 0;
    
    if (stage->unk5B4 != 8) {
        if (gInput & DPAD_LEFT) {
            index = 1;
        } else if (gInput & DPAD_RIGHT) {
            index = 2;
        }
    }

    unkC4 = &unkCF78->unkC4[index];
    unk8 = &unkCF78->unk8;

    sub_806D7D0(unk8, -1, stage->unk5CC, unkC4);

    if (stage->unk5B4 == 8) {
        sub_80051E8(unk8);
        sub_806D830(unk8, -1, stage->unk5CC, unkC4);
    }
}

// Moving?
void sub_806D424(void) {
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkCF78->unk0;

    const struct UNK_80DF670* unkC4;
    struct UNK_0808B3FC_UNK240* unk8;

    u32 index = 3;
    if (gInput & DPAD_LEFT) {
        index = 4;
    } else if (gInput & DPAD_RIGHT) {
        index = 5;
    }

    unkC4 = &unkCF78->unkC4[index];
    unk8 = &unkCF78->unk8;
    sub_806D7D0(unk8, unkCF78->unkA4, stage->unk5CC, unkC4);
}

// Running?
void sub_806D484(void) {
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkCF78->unk0;

    const struct UNK_80DF670* unkC4;
    struct UNK_0808B3FC_UNK240* unk8;

    u32 index = 6;
    if (gInput & DPAD_LEFT) {
        index = 7;
    } else if (gInput & DPAD_RIGHT) {
        index = 8;
    }

    unkC4 = &unkCF78->unkC4[index];
    unk8 = &unkCF78->unk8;
    sub_806D7D0(unk8, unkCF78->unkA4, stage->unk5CC, unkC4);
}

// Sprinting?
void sub_806D4E4(void) {
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkCF78->unk0;

    const struct UNK_80DF670* unkC4;
    struct UNK_0808B3FC_UNK240* unk8;

    u32 index = 9;
    if (gInput & DPAD_LEFT) {
        index = 10;
    } else if (gInput & DPAD_RIGHT) {
        index = 11;
    }

    unkC4 = &unkCF78->unkC4[index];
    unk8 = &unkCF78->unk8;
    sub_806D7D0(unk8, unkCF78->unkA4 >> 1, stage->unk5CC, unkC4);
}

void sub_806D548(struct UNK_0808B3FC_UNK240* element, void* vram, s16 a, u8 b, const struct UNK_80DF670* c4) {
    u32 unk10 = 0x1000;
    if (c4->unk7 & 1) {
        unk10 |= 0x400;
    }

    if (c4->unk7 & 2) {
        unk10 |= 0x800;
    }

    element->unk4 = vram;
    element->unk8 = 0;
    element->unkA = c4->unk0;
    element->unk10 = unk10;
    element->unk16 = 0x78;
    element->unk18 = a;
    element->unk1A = b << 6;
    element->unk1C = 0;
    element->unk1E = 0xffff;
    element->unk20 = c4->unk2;
    element->unk21 = 0xff;
    element->unk22 = c4->unk6;
    element->unk25 = 0;
    element->unk28 = -1;
    sub_8004558(element);
}

UNUSED static void sub_806D5CC(void) {}

#define Macro_806D4E(val, val2) ({\
    ((val) >> 4) + (val2); \
})\

void sub_806D5D0(void) {
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkCF78->unk0;
    
    const struct UNK_80DF670* unkC4 = &unkCF78->unkC4[12];
    unkCF78->unkB0 += unkCF78->unkB8 >> 4;

    sub_806D7D0(&unkCF78->unk8, -1, stage->unk5CC - Macro_806D4E(unkCF78->unkB0, 0xF), unkC4);
}

void sub_806D634(void) {
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkCF78->unk0;
    const struct UNK_80DF670* unkC4 = &unkCF78->unkC4[15];

    unkCF78->unkB0 += unkCF78->unkB8 >> 4;

    sub_806D7D0(&unkCF78->unk8, -1, stage->unk5CC - Macro_806D4E(unkCF78->unkB0, 10), unkC4);
}

void sub_806D698(void) {
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkCF78->unk0;
    const struct UNK_80DF670* unkC4 = &unkCF78->unkC4[18];

    sub_806D7D0(&unkCF78->unk8, -1, stage->unk5CC, unkC4);
}

void sub_806D6DC(void) {
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkCF78->unk0;
    const struct UNK_80DF670* unkC4 = &unkCF78->unkC4[19];

    unkCF78->unkB0 += unkCF78->unkB8 >> 4;

    sub_806D7D0(&unkCF78->unk8, -1, stage->unk5CC - Macro_806D4E(unkCF78->unkB0, 10), unkC4);
}

void sub_806D740(void) {
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkCF78->unk0;
    const struct UNK_80DF670* unkC4 = &unkCF78->unkC4[20];

    sub_806D7D0(&unkCF78->unk8, -1, stage->unk5CC - 0xC, unkC4);
}

void sub_806D788(void) {
    struct UNK_806CF78* unkCF78 = TaskGetStructPtr(gCurTask);
    if (unkCF78->unkBC != 0) {
        s32 temp = --unkCF78->unkBC;
        if (temp == 0) {
            unkCF78->unkBE = temp;
            unkCF78->unkC0 = 1;
        }
    }
}

void sub_806D7D0(struct UNK_0808B3FC_UNK240* element, s16 a, s16 b, const struct UNK_80DF670* anim) {
    u32 unk10 = 0x1000;
    if (anim->unk7 & 1) {
        unk10 |= 0x400;
    }

    if (anim->unk7 & 2) {
        unk10 |= 0x800;
    }
    element->unkA = anim->unk0;
    element->unk10 = unk10;
    element->unk18 = b;
    element->unk20 = anim->unk2;

    element->unk22 = a != -1 ? a : 0x10;
    sub_8004558(element);
}

void sub_806D830(struct UNK_0808B3FC_UNK240* element, s16 a, s16 b, const struct UNK_80DF670* anim) {
    u8 unk22;
    u32 unk10 = 0x1100;
    if (anim->unk7 & 1) {
        unk10 |= 0x400;
    }

    if (anim->unk7 & 2) {
        unk10 |= 0x800;
    }
    element->unkA = anim->unk0;
    element->unk10 = unk10;
    element->unk18 = b;
    element->unk20 = anim->unk2;

    element->unk22 = a != -1 ? a : 0x10;
    sub_8004558(element);
}
