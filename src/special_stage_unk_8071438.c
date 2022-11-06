#include "main.h"
#include "sprite.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_utils.h"
#include "special_stage_unk_8071438.h"
#include "special_stage_unk_806F910.h"
#include "special_stage_unk_806BD94.h"
#include "trig.h"
#include "m4a.h"
#include "constants/songs.h"

extern const struct UNK_80DF670 gUnknown_080DF914[9];

extern const u32 gUnknown_080DF9A0[7][2];
extern const u16 gUnknown_080DF968[7][4];

void sub_8071380(struct UNK_0808B3FC_UNK240* element, void* vram, s16 a1, s16 a, u8 b, const struct UNK_80DF670* c4);
void sub_8071530(struct UNK_0808B3FC_UNK240* element, s16 a1, s16 a, u8 b, const struct UNK_80DF670* c4);

void sub_8070EFC(struct UNK_8071438* unk1438) {
    u8 level = unk1438->unk0->unk5B8;
    const struct UNK_80DF670* unkF914 = &gUnknown_080DF914[0];
    s16 result = sub_806CF44(unkF914);
    void* vramOld = gUnknown_03005B5C;

    unk1438->unk34 = gUnknown_03005B5C;
    gUnknown_03005B5C += result << 5;

    sub_8071380(&unk1438->unk4, vramOld, 0x78, 0x3C, 7, unkF914);
    unk1438->unk38 = unkF914;
    unk1438->unk3C = 1;

    unk1438->unk40 = gUnknown_080DF9A0[level][0];
    unk1438->unk44 = gUnknown_080DF9A0[level][1];

    unk1438->unk48 = gUnknown_080DF968[level][0];
    unk1438->unk4A = 0;
    unk1438->unk4E = gUnknown_080DF968[level][1];
    unk1438->unk50 = gUnknown_080DF968[level][2];
    unk1438->unk52 = gUnknown_080DF968[level][3];
    unk1438->unk54 = 0x3C;
}

void sub_8071478(void);
void sub_8070FA0(void) {
    struct UNK_806BD94_UNK874_2 unk874;
    struct UNK_806CB84 unkCBB4;
    u8 temp;
    u16* oam;
    s32 result;
    

    struct UNK_8071438* unk1438 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk1438->unk0;
    oam = &gOamBuffer[124].all.affineParam;
    
    if (stage->unk5BA == 0) {
        sub_8071478();
    }

    unk874.unk0 = unk1438->unk40;
    unk874.unk4 = unk1438->unk44;
    unk874.unk8 = 0;

    unk874.unkC = 0x20;
    unk874.unkE = 0x20;
    unk874.unk10 = 0;
    unk874.unk12 = 0x1D;

    result = sub_806CB84(&unkCBB4, &unk874, unk1438->unk0);
    if (result != 0) {
        u16 temp3;
        s16 temp4;
        
        *oam = unkCBB4.unkC;
        oam+=4;
        *oam = unkCBB4.unkE;
        oam+=4;
        *oam = unkCBB4.unk10;
        oam+=4;
        *oam = unkCBB4.unk12;

        temp3 = ((unk1438->unk48 - stage->unk5A0) + 0x40) & 0x3FF;
        temp4 = unkCBB4.unk4;
        if (temp4 < (stage->unk5CC - 0x3C)) {
            temp = 0xC;
        } else {
             temp = 5;
        }

        if (stage->unk5BA == 0) {
            const struct UNK_80DF670* unk38;
            sub_8071530(&unk1438->unk4, unkCBB4.unk2, temp4, temp, &unk1438->unk38[temp3 >> 0x7]);
        }

        if (unk1438->unk3C != 2 || !(unk1438->unk4C & 2) || stage->unk5BA != 0) {
            sub_80051E8(&unk1438->unk4);
        }
    }
}

void sub_80714F4(struct UNK_8071438*);
void sub_807120C(struct UNK_8071438*);

void sub_80710B0(void) {
    struct UNK_8071438* unk1438 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unk1438->unk0->unkC);

    s32 sin3;
    s32 sin4;

    s32 temp3, temp4;

    u16 index = (-unk1438->unk48 & 0x3FF);
    s32 sin1 = gSineTable[index] * 4;
    s32 sin2 = gSineTable[index + 0x100];

    s32 temp1, temp2; 
    temp1 = player->unkA8 - unk1438->unk40;
    temp2 = player->unkAC - unk1438->unk44;

    temp4 = (sin1 >> 8) * (temp2 >> 8) + (sin2 >> 6) * (temp1 >> 8);
    // required for match, probably wrong
    sin4 = (temp1 >> 8);
    temp3 = (-sin1 >> 8) * sin4 + (sin2 >> 6) * (temp2 >> 8);

    if (temp4 > 0) {
        unk1438->unk48 = (unk1438->unk48 - unk1438->unk50) & 0x3FF;
    } else if (temp4 < 0) {
        unk1438->unk48 = (unk1438->unk48 + unk1438->unk50) & 0x3FF;
    } else if (temp3 < 0) {
        unk1438->unk48 = (unk1438->unk48 - unk1438->unk50) & 0x3FF;
    }

    index = unk1438->unk48;
    sin1 = gSineTable[index] * 4;
    sin4 = gSineTable[index + 0x100] * 4;

    unk1438->unk40 -= (sin1 * unk1438->unk4A) >> 8;
    unk1438->unk44 -= (sin4 * unk1438->unk4A) >> 8;

    sub_80714F4(unk1438);
    sub_807120C(unk1438);

    unk1438->unk4A += unk1438->unk52;

    if (unk1438->unk4A > unk1438->unk52) {
        unk1438->unk4A = unk1438->unk52;
    }
}

void sub_807120C(struct UNK_8071438* unk1438) {
    struct SpecialStage* stage = unk1438->unk0;
    struct UNK_806CF78* player = TaskGetStructPtr(unk1438->unk0->unkC);

    s16 unk40 = (unk1438->unk40 >> 0x10);
    s16 unk44 = (unk1438->unk44 >> 0x10);
    s16 unkA8 = player->unkA8 >> 0x10;
    s16 unkAC = player->unkAC >> 0x10;
    s16 unkB0 = player->unkB0 >> 8;
    s16 unkB4 = player->unkB4;

    switch (unkB4) {
        case 6:
            return;
        case -1:
            return;
        case 10:
            return;
        case 0xE:
            return;
    }

    if ((unk40 - 5) < unkA8 && (unk40 + 5) > unkA8) {
        if (((unk44) - 5) < unkAC && (unk44 + 5) > unkAC) {
#ifndef NON_MATCHING
            s16 r1 = 0;
            asm(""::"r"(r1));
            if (r1 > unkB0 || unkB0 > 3) {
                return;
            }
#else
            if (unkB0 < 0 || unkB0 > 3) {
                return;
            }
#endif
            if ((unkB4 > 3 && unkB4 < 6) || unkB4 == 9) {
                unk1438->unk4C = unk1438->unk54;
                unk1438->unk3C = 2;
                sub_806F944(stage);
                player->unkB4 = 10;
                m4aSongNumStart(SE_275);
            } else if (stage->unk5A4 == 0) {
                if (player->unkB6 == 0) {
                    player->unkB8 = player->unkFC;
                    player->unkB4 = 0xE;
                    player->unkC8 = 0;
                    m4aSongNumStart(SE_146);
                }
            } else if (player->unkB6 == 0) {
                sub_806D924(stage, 10);
                player->unkB8 = player->unkF8;
                player->unkB4 = 6;
                player->unkC8 = 0;
                player->unkB6 = 0x96;
                m4aSongNumStart(SE_RINGS_LOST);
            }
        }
    }
}

void sub_8071380(struct UNK_0808B3FC_UNK240* element, void* vram, s16 a1, s16 a, u8 b, const struct UNK_80DF670* c4) {
    u16* oam = &gOamBuffer[124].all.affineParam;
    u32 unk10 = 0x107F;
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
    element->unk16 = a1;
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

    *oam = 0x100;
    oam += 4;
    *oam = 0;
    oam += 4;
    *oam = 0;
    oam += 4;
    *oam = 0x100;
}

void sub_8071474(struct Task*);

struct Task* sub_8071438(struct SpecialStage* stage) {
    struct Task* t = TaskCreate(sub_8070FA0, 0x58, 0xA000, 0, sub_8071474);
    struct UNK_8071438* unk1438 = TaskGetStructPtr(t);
    unk1438->unk0 = stage;
    sub_8070EFC(unk1438);
    return t;
}

void sub_8071474(struct Task* t) {
    // unused logic
}

typedef void (*TaskFunc_8071478)(void);

extern const TaskFunc_8071478 gUnknown_080DF95C[3];

void sub_8071478(void) {
    struct UNK_8071438* unk1438 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk1438->unk0;

    TaskFunc_8071478 funcs[3];
    memcpy(&funcs, gUnknown_080DF95C, 0xC);

    if (stage->unk5B4 > 3 && stage->unk5B4 < 6) {
        funcs[unk1438->unk3C]();
    }
}


void sub_80714C4(void) {
    // unused logic
}

void sub_80714C8(void) {
    struct UNK_8071438* unk1438 = TaskGetStructPtr(gCurTask);
    unk1438->unk4C--;

    if (unk1438->unk4C < 1) {
        unk1438->unk3C = 1;
    }
}

void sub_80714F4(struct UNK_8071438* unk1438) {
    if (unk1438->unk40 < 0x2A0000) {
        unk1438->unk40 = 0x2A0000;
    }

    if (unk1438->unk40 > 0x3D60000) {
        unk1438->unk40 = 0x3D60000;   
    }

    if (unk1438->unk44 < 0x2A0000) {
        unk1438->unk44 = 0x2A0000;
    }

    if (unk1438->unk44 > 0x3D60000) {
        unk1438->unk44 = 0x3D60000;
    }
}

void sub_8071530(struct UNK_0808B3FC_UNK240* element, s16 a1, s16 a, u8 b, const struct UNK_80DF670* c4) {
    u32 unk10 = 0x107F;
    if (c4->unk7 & 1) {
        unk10 |= 0x400;
    }

    if (c4->unk7 & 2) {
        unk10 |= 0x800;
    }

    element->unkA = c4->unk0;
    element->unk10 = unk10;
    element->unk16 = a1;
    element->unk18 = a;
    element->unk1A = b << 6;
    element->unk20 = c4->unk2;
    element->unk22 = c4->unk6;
    sub_8004558(element);
}
