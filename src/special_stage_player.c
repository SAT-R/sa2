#include "main.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_utils.h"
#include "special_stage_tables.h"
#include "special_stage_data.h"
#include "player.h"

void sub_806D788(void);
void sub_806D2C8(void);
void sub_806D548(struct UNK_0808B3FC_UNK240* element, void*, s16, u8, const struct UNK_80DF670*);
void sub_806D7D0(struct UNK_0808B3FC_UNK240* element, s16, s16, const struct UNK_80DF670*);
void sub_806D830(struct UNK_0808B3FC_UNK240* element, s16, s16, const struct UNK_80DF670*);


void sub_806D5CC(void);
void sub_806D388(void);
void sub_806D424(void);
void sub_806D484(void);
void sub_806D4E4(void);
void sub_806D5D0(void);
void sub_806D5D0(void);
void sub_806D634(void);
void sub_806D698(void);
void sub_806D388(void);
void sub_806D5D0(void);
void sub_806D5D0(void);
void sub_806D5D0(void);
void sub_806D4E4(void);
void sub_806D388(void);
void sub_806D6DC(void);
void sub_806D5CC(void);
void sub_806D740(void);

static const struct UNK_80DF670 gUnknown_080DF668 = { 
    .unk0 = 884, 
    .unk2 = 0, 
    .unk4 = 2, 
    .unk6 = 16, 
    .unk7 = 0, 
};

// character sprites
static const struct UNK_80DF670* const gUnknown_080DF670[5] = {
    [CHARACTER_SONIC] = &gUnknown_080DF2F8[0],
    [CHARACTER_CREAM] = &gUnknown_080DF2F8[22],
    [CHARACTER_TAILS] = &gUnknown_080DF2F8[44],
    [CHARACTER_KNUCKLES] = &gUnknown_080DF2F8[66],
    [CHARACTER_AMY] = &gUnknown_080DF2F8[88],
};

typedef void (*PlayerStateHandler)(void);

// state handlers
static PlayerStateHandler const gUnknown_080DF684[] = {
    sub_806D5CC,
    sub_806D388,
    sub_806D424,
    sub_806D484,
    sub_806D4E4,
    sub_806D5D0,
    sub_806D5D0,
    sub_806D634,
    sub_806D698,
    sub_806D388,
    sub_806D5D0,
    sub_806D5D0,
    sub_806D5D0,
    sub_806D4E4,
    sub_806D388,
    sub_806D6DC,
    sub_806D5CC,
    sub_806D740,
};

struct Task* CreateSpecialStagePlayer(struct SpecialStage* stage) {
    const struct UNK_80DF670* characterSprites[5];
    u8 lang;
    s16 result;
    u32 unk5B5C;
    void* ram;
    u32 temp;

    struct Task* t;
    struct SpecialStagePlayer* player;

    memcpy(&characterSprites, &gUnknown_080DF670, 0x14);
    lang = stage->zone;

    t = TaskCreate(sub_806D2C8, sizeof(struct SpecialStagePlayer), 0x9000, 0, NULL);
    player = TaskGetStructPtr(t);
    player->unk0 = stage;
    player->unk4 = NULL;
    player->x = Q_16_16(gUnknown_080DF9D8[lang][0]);
    player->y = Q_16_16(gUnknown_080DF9D8[lang][1]);

    player->unkB0 = 0;
    player->unkB2 = gUnknown_080DF9D8[lang][2];
    player->unkB4 = 0;
    player->unkB6 = 0x96;
    player->unkBC = 0;
    player->unkBE = 0;
    player->unkC0 = 1;

    player->sprites = characterSprites[stage->character];
    result = sub_806CF44(player->sprites);
    player->unk98 = gUnknown_03005B5C;
    gUnknown_03005B5C += (result * TILE_SIZE_4BPP);
    player->unk9C = gUnknown_03005B5C;
    player->unkA0 = gUnknown_03005B5C + (TILE_SIZE_4BPP * 2);

    // required for match
    temp = 2;

    gUnknown_03005B5C += 0xC0;

    sub_806D548(&player->unk8, player->unk98, stage->unk5CC, 9, player->sprites);
    sub_806D548(&player->unk38, player->unk9C, stage->unk5CC, 10, &gUnknown_080DF668);

    {
        struct UNK_0808B3FC_UNK240* element = &player->unk68;
        u16* affine = &gOamBuffer[120].all.affineParam;

        element->unk4 = player->unkA0;
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

    if (stage->unk5B7 == FALSE) {
        player->unkC8 = 0;
        player->unkCC = 6;
        player->unkD0 = 0x10000;
        player->unkD4 = 0x10000;
        player->unkD8 = 0x28;
        player->unkDC = -0x2B;
        player->unkE0 = -0x15E;
        player->unkE4 = 0x2C80;
        player->unkE8 = 0x3F80;
        player->unkEC = 0x502;
        player->unkEE = 0x8C0;
        player->unkF0 = 0x14;
        player->unkF2 = -0x28;
        player->unkF4 = -0x36;
        player->unkF6 = -0x48;
        player->unk100 = -0x10;
        player->unk104 = -8;
        player->unkF8 = 0x800;
        player->unkFA = -0x80;
        player->unkFC = 0x600;
        player->unkFE = -0x40;
    } else {
        player->unkC8 = 0;
        player->unkCC = 0;
        player->unkD0 = 0xC00;
        player->unkD4 = 0x7FFF;
        player->unkD8 = 0x100;
        player->unkDC = 0x800;
    }

    return t;
}

void sub_806D2C8(void) {
    PlayerStateHandler stateHandlers[18];
    struct UNK_0808B3FC_UNK240 *unk8, *unk38;
    
    struct SpecialStagePlayer* player = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = player->unk0;

    memcpy(stateHandlers, gUnknown_080DF684, sizeof(gUnknown_080DF684));

    if (stage->unk5BA == 0) {
        stateHandlers[player->unkB4 + 1]();
        sub_806D788();
    } else {
        stateHandlers[0]();
    }

    unk8 = &player->unk8;
    unk38 = &player->unk38;
    
    if (player->unkB6 != 0 && stage->unk5BA == 0) {
        if ((--player->unkB6) & 2) {
            sub_80051E8(unk8);
            if (player->unkB4 < 14) {
                sub_80051E8(unk38);
            }
        }
    } else {
        sub_80051E8(unk8);
        if (player->unkB4 < 14) {
            sub_80051E8(unk38);
        }
    }
}

// Animations for different player speeds

// Stopped?
void sub_806D388(void) {
    struct SpecialStagePlayer* player = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = player->unk0;
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

    unkC4 = &player->sprites[index];
    unk8 = &player->unk8;

    sub_806D7D0(unk8, -1, stage->unk5CC, unkC4);

    if (stage->unk5B4 == 8) {
        sub_80051E8(unk8);
        sub_806D830(unk8, -1, stage->unk5CC, unkC4);
    }
}

// Moving?
void sub_806D424(void) {
    struct SpecialStagePlayer* player = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = player->unk0;

    const struct UNK_80DF670* unkC4;
    struct UNK_0808B3FC_UNK240* unk8;

    u32 index = 3;
    if (gInput & DPAD_LEFT) {
        index = 4;
    } else if (gInput & DPAD_RIGHT) {
        index = 5;
    }

    unkC4 = &player->sprites[index];
    unk8 = &player->unk8;
    sub_806D7D0(unk8, player->unkA4, stage->unk5CC, unkC4);
}

// Running?
void sub_806D484(void) {
    struct SpecialStagePlayer* player = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = player->unk0;

    const struct UNK_80DF670* unkC4;
    struct UNK_0808B3FC_UNK240* unk8;

    u32 index = 6;
    if (gInput & DPAD_LEFT) {
        index = 7;
    } else if (gInput & DPAD_RIGHT) {
        index = 8;
    }

    unkC4 = &player->sprites[index];
    unk8 = &player->unk8;
    sub_806D7D0(unk8, player->unkA4, stage->unk5CC, unkC4);
}

// Sprinting?
void sub_806D4E4(void) {
    struct SpecialStagePlayer* player = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = player->unk0;

    const struct UNK_80DF670* unkC4;
    struct UNK_0808B3FC_UNK240* unk8;

    u32 index = 9;
    if (gInput & DPAD_LEFT) {
        index = 10;
    } else if (gInput & DPAD_RIGHT) {
        index = 11;
    }

    unkC4 = &player->sprites[index];
    unk8 = &player->unk8;
    sub_806D7D0(unk8, player->unkA4 >> 1, stage->unk5CC, unkC4);
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

UNUSED void sub_806D5CC(void) {}

#define Macro_806D4E(val, val2) ({\
    ((val) >> 4) + (val2); \
})\

void sub_806D5D0(void) {
    struct SpecialStagePlayer* player = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = player->unk0;
    
    const struct UNK_80DF670* unkC4 = &player->sprites[12];
    player->unkB0 += player->unkB8 >> 4;

    sub_806D7D0(&player->unk8, -1, stage->unk5CC - Macro_806D4E(player->unkB0, 0xF), unkC4);
}

void sub_806D634(void) {
    struct SpecialStagePlayer* player = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = player->unk0;
    const struct UNK_80DF670* unkC4 = &player->sprites[15];

    player->unkB0 += player->unkB8 >> 4;

    sub_806D7D0(&player->unk8, -1, stage->unk5CC - Macro_806D4E(player->unkB0, 10), unkC4);
}

void sub_806D698(void) {
    struct SpecialStagePlayer* player = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = player->unk0;
    const struct UNK_80DF670* unkC4 = &player->sprites[18];

    sub_806D7D0(&player->unk8, -1, stage->unk5CC, unkC4);
}

void sub_806D6DC(void) {
    struct SpecialStagePlayer* player = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = player->unk0;
    const struct UNK_80DF670* unkC4 = &player->sprites[19];

    player->unkB0 += player->unkB8 >> 4;

    sub_806D7D0(&player->unk8, -1, stage->unk5CC - Macro_806D4E(player->unkB0, 10), unkC4);
}

void sub_806D740(void) {
    struct SpecialStagePlayer* player = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = player->unk0;
    const struct UNK_80DF670* unkC4 = &player->sprites[20];

    sub_806D7D0(&player->unk8, -1, stage->unk5CC - 0xC, unkC4);
}

void sub_806D788(void) {
    struct SpecialStagePlayer* player = TaskGetStructPtr(gCurTask);
    if (player->unkBC != 0) {
        s32 temp = --player->unkBC;
        if (temp == 0) {
            player->unkBE = temp;
            player->unkC0 = 1;
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
