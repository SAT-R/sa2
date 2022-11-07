#include "main.h"
#include "sprite.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_utils.h"
#include "special_stage_guard_robo.h"
#include "special_stage_unk_806F910.h"
#include "special_stage_unk_806BD94.h"
#include "special_stage_tables.h"
#include "special_stage_data.h"
#include "trig.h"
#include "m4a.h"
#include "constants/songs.h"

void sub_80714C4(void);
void sub_80710B0(void);
void sub_80714C8(void);

static const struct UNK_80DF670 gUnknown_080DF914[9] = {
    { 883, 4, 64, 16, 0, },
    { 883, 5, 64, 16, 0, },
    { 883, 6, 64, 16, 0, },
    { 883, 7, 64, 16, 0, },
    { 883, 0, 64, 16, 0, },
    { 883, 1, 64, 16, 0, },
    { 883, 2, 64, 16, 0, },
    { 883, 3, 64, 16, 0, },
    SPRITE_ARRAY_END,
};

typedef void (*TaskFunc_8071478)(void);

static const TaskFunc_8071478 gUnknown_080DF95C[3] = {
    sub_80714C4,
    sub_80710B0,
    sub_80714C8,
};

void sub_8071380(struct UNK_0808B3FC_UNK240* element, void* vram, s16 a1, s16 a, u8 b, const struct UNK_80DF670* c4);
void sub_8071530(struct UNK_0808B3FC_UNK240* element, s16 a1, s16 a, u8 b, const struct UNK_80DF670* c4);

void GuardRoboInit(struct SpecialStageGuardRobo* guardRobo) {
    u8 level = guardRobo->stage->zone;
    const struct UNK_80DF670* unkF914 = &gUnknown_080DF914[0];
    s16 result = sub_806CF44(unkF914);
    void* vramOld = gUnknown_03005B5C;

    guardRobo->unk34 = gUnknown_03005B5C;
    gUnknown_03005B5C += result << 5;

    sub_8071380(&guardRobo->unk4, vramOld, 0x78, 0x3C, 7, unkF914);
    guardRobo->unk38 = unkF914;
    guardRobo->unk3C = 1;

    guardRobo->x = gUnknown_080DF9A0[level][0];
    guardRobo->y = gUnknown_080DF9A0[level][1];

    guardRobo->unk48 = gUnknown_080DF968[level][0];
    guardRobo->unk4A = 0;
    guardRobo->unk4E = gUnknown_080DF968[level][1];
    guardRobo->unk50 = gUnknown_080DF968[level][2];
    guardRobo->unk52 = gUnknown_080DF968[level][3];
    guardRobo->unk54 = 0x3C;
}

void sub_8071478(void);
void sub_8070FA0(void) {
    struct UNK_806BD94_UNK874_2 unk874;
    struct UNK_806CB84 unkCBB4;
    u8 temp;
    u16* oam;
    s32 result;
    

    struct SpecialStageGuardRobo* guardRobo = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = guardRobo->stage;
    oam = &gOamBuffer[124].all.affineParam;
    
    if (stage->unk5BA == 0) {
        sub_8071478();
    }

    unk874.unk0 = guardRobo->x;
    unk874.unk4 = guardRobo->y;
    unk874.unk8 = 0;

    unk874.unkC = 0x20;
    unk874.unkE = 0x20;
    unk874.unk10 = 0;
    unk874.unk12 = 0x1D;

    result = sub_806CB84(&unkCBB4, &unk874, guardRobo->stage);
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

        temp3 = ((guardRobo->unk48 - stage->unk5A0) + 0x40) & 0x3FF;
        temp4 = unkCBB4.unk4;
        if (temp4 < (stage->unk5CC - 0x3C)) {
            temp = 0xC;
        } else {
             temp = 5;
        }

        if (stage->unk5BA == 0) {
            const struct UNK_80DF670* unk38;
            sub_8071530(&guardRobo->unk4, unkCBB4.unk2, temp4, temp, &guardRobo->unk38[temp3 >> 0x7]);
        }

        if (guardRobo->unk3C != 2 || !(guardRobo->unk4C & 2) || stage->unk5BA != 0) {
            sub_80051E8(&guardRobo->unk4);
        }
    }
}

void sub_80714F4(struct SpecialStageGuardRobo*);
void sub_807120C(struct SpecialStageGuardRobo*);

void sub_80710B0(void) {
    struct SpecialStageGuardRobo* guardRobo = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(guardRobo->stage->playerTask);

    s32 sin3;
    s32 sin4;

    s32 temp3, temp4;

    u16 index = (-guardRobo->unk48 & 0x3FF);
    s32 sin1 = gSineTable[index] * 4;
    s32 sin2 = gSineTable[index + 0x100];

    s32 temp1, temp2; 
    temp1 = player->x - guardRobo->x;
    temp2 = player->y - guardRobo->y;

    temp4 = (sin1 >> 8) * (temp2 >> 8) + (sin2 >> 6) * (temp1 >> 8);
    // required for match, probably wrong
    sin4 = (temp1 >> 8);
    temp3 = (-sin1 >> 8) * sin4 + (sin2 >> 6) * (temp2 >> 8);

    if (temp4 > 0) {
        guardRobo->unk48 = (guardRobo->unk48 - guardRobo->unk50) & 0x3FF;
    } else if (temp4 < 0) {
        guardRobo->unk48 = (guardRobo->unk48 + guardRobo->unk50) & 0x3FF;
    } else if (temp3 < 0) {
        guardRobo->unk48 = (guardRobo->unk48 - guardRobo->unk50) & 0x3FF;
    }

    index = guardRobo->unk48;
    sin1 = gSineTable[index] * 4;
    sin4 = gSineTable[index + 0x100] * 4;

    guardRobo->x -= (sin1 * guardRobo->unk4A) >> 8;
    guardRobo->y -= (sin4 * guardRobo->unk4A) >> 8;

    sub_80714F4(guardRobo);
    sub_807120C(guardRobo);

    guardRobo->unk4A += guardRobo->unk52;

    if (guardRobo->unk4A > guardRobo->unk52) {
        guardRobo->unk4A = guardRobo->unk52;
    }
}

void sub_807120C(struct SpecialStageGuardRobo* guardRobo) {
    struct SpecialStage* stage = guardRobo->stage;
    struct SpecialStagePlayer* player = TaskGetStructPtr(guardRobo->stage->playerTask);

    s16 unk40 = (guardRobo->x >> 0x10);
    s16 unk44 = (guardRobo->y >> 0x10);
    s16 playerX = player->x >> 0x10;
    s16 playerY = player->y >> 0x10;
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

    if ((unk40 - 5) < playerX && (unk40 + 5) > playerX) {
        if (((unk44) - 5) < playerY && (unk44 + 5) > playerY) {
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
                guardRobo->unk4C = guardRobo->unk54;
                guardRobo->unk3C = 2;
                sub_806F944(stage);
                player->unkB4 = 10;
                m4aSongNumStart(SE_275);
            } else if (stage->elapsedTime == 0) {
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

struct Task* CreateGuardRobo(struct SpecialStage* stage) {
    struct Task* t = TaskCreate(sub_8070FA0, 0x58, 0xA000, 0, sub_8071474);
    struct SpecialStageGuardRobo* guardRobo = TaskGetStructPtr(t);
    guardRobo->stage = stage;
    GuardRoboInit(guardRobo);
    return t;
}

void sub_8071474(struct Task* t) {
    // unused logic
}

void sub_8071478(void) {
    struct SpecialStageGuardRobo* guardRobo = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = guardRobo->stage;

    TaskFunc_8071478 funcs[3];
    memcpy(&funcs, gUnknown_080DF95C, 0xC);

    if (stage->unk5B4 > 3 && stage->unk5B4 < 6) {
        funcs[guardRobo->unk3C]();
    }
}


void sub_80714C4(void) {
    // unused logic
}

void sub_80714C8(void) {
    struct SpecialStageGuardRobo* guardRobo = TaskGetStructPtr(gCurTask);
    guardRobo->unk4C--;

    if (guardRobo->unk4C < 1) {
        guardRobo->unk3C = 1;
    }
}

void sub_80714F4(struct SpecialStageGuardRobo* guardRobo) {
    if (guardRobo->x < Q_16_16(MIN_SPECIAL_STAGE_GUARD_ROBO_X)) {
        guardRobo->x = Q_16_16(MIN_SPECIAL_STAGE_GUARD_ROBO_X);
    }

    if (guardRobo->x > Q_16_16(MAX_SPECIAL_STAGE_GUARD_ROBO_X)) {
        guardRobo->x = Q_16_16(MAX_SPECIAL_STAGE_GUARD_ROBO_X);   
    }

    if (guardRobo->y < Q_16_16(MIN_SPECIAL_STAGE_GUARD_ROBO_Y)) {
        guardRobo->y = Q_16_16(MIN_SPECIAL_STAGE_GUARD_ROBO_Y);
    }

    if (guardRobo->y > Q_16_16(MAX_SPECIAL_STAGE_GUARD_ROBO_Y)) {
        guardRobo->y = Q_16_16(MAX_SPECIAL_STAGE_GUARD_ROBO_Y);
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
