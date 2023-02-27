#include "core.h"
#include "game/special_stage/main.h"
#include "game/special_stage/player.h"
#include "game/special_stage/utils.h"
#include "game/special_stage/tables.h"
#include "game/special_stage/data.h"
#include "player.h"

#include "constants/animations.h"

void sub_806D788(void);
void sub_806D2C8(void);
void sub_806D548(Sprite *element, void *, s16, u8, const struct UNK_80DF670 *);
void sub_806D7D0(Sprite *element, s16, s16, const struct UNK_80DF670 *);
void sub_806D830(Sprite *element, s16, s16, const struct UNK_80DF670 *);

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
    .anim = SA2_ANIM_SP_STAGE_HOLE,
    .variant = 0,
    .unk4 = 2,
    .unk6 = 16,
    .unk7 = 0,
};

// character sprites
static const struct UNK_80DF670 *const gUnknown_080DF670[5] = {
    [CHARACTER_SONIC] = &gUnknown_080DF2F8[0],
    [CHARACTER_CREAM] = &gUnknown_080DF2F8[22],
    [CHARACTER_TAILS] = &gUnknown_080DF2F8[44],
    [CHARACTER_KNUCKLES] = &gUnknown_080DF2F8[66],
    [CHARACTER_AMY] = &gUnknown_080DF2F8[88],
};

typedef void (*PlayerStateHandler)(void);

static PlayerStateHandler const sPlayerStateHandlers[] = {
    sub_806D5CC, sub_806D388, sub_806D424, sub_806D484, sub_806D4E4, sub_806D5D0,
    sub_806D5D0, sub_806D634, sub_806D698, sub_806D388, sub_806D5D0, sub_806D5D0,
    sub_806D5D0, sub_806D4E4, sub_806D388, sub_806D6DC, sub_806D5CC, sub_806D740,
};

struct Task *CreateSpecialStagePlayer(struct SpecialStage *stage)
{
    const struct UNK_80DF670 *characterSprites[5];
    u8 lang;
    s16 result;
    u32 unk5B5C;
    void *ram;
    u32 variant;

    struct Task *t;
    struct SpecialStagePlayer *player;

    memcpy(&characterSprites, &gUnknown_080DF670, 0x14);
    lang = stage->zone;

    t = TaskCreate(sub_806D2C8, sizeof(struct SpecialStagePlayer), 0x9000, 0, NULL);
    player = TaskGetStructPtr(t);
    player->unk0 = stage;
    player->unk4 = NULL;
    player->x = Q_16_16(gUnknown_080DF9D8[lang][0]);
    player->y = Q_16_16(gUnknown_080DF9D8[lang][1]);

    player->unkB0 = 0;
    player->bearing = gUnknown_080DF9D8[lang][2];
    player->state = 0;
    player->unkB6 = 0x96;
    player->unkBC = 0;
    player->unkBE = 0;
    player->multiplier = 1;

    player->sprites = characterSprites[stage->character];
    result = MaxSpriteSize(player->sprites);
    player->unk98 = gUnknown_03005B5C;
    gUnknown_03005B5C += (result * TILE_SIZE_4BPP);
    player->unk9C = gUnknown_03005B5C;
    player->unkA0 = gUnknown_03005B5C + (TILE_SIZE_4BPP * 2);

    // required for match
    variant = SA2_ANIM_VARIANT_SP_STAGE_ARROW_RED;

    gUnknown_03005B5C += 0xC0;

    sub_806D548(&player->unk8, player->unk98, stage->unk5CC, 9, player->sprites);
    sub_806D548(&player->unk38, player->unk9C, stage->unk5CC, 10, &gUnknown_080DF668);

    {
        Sprite *element = &player->roboArrow;
        u16 *affine = &gOamBuffer[120].all.affineParam;

        element->graphics.dest = player->unkA0;
        element->graphics.size = 0;
        element->graphics.anim = SA2_ANIM_SP_STAGE_ARROW;
        element->unk10 = 0x107E;
        element->x = (DISPLAY_WIDTH / 2);
        element->y = (DISPLAY_HEIGHT / 2);
        element->unk1A = 0;
        element->unk1C = 0;
        element->unk1E = -1;

        element->variant = variant;
        element->unk21 = -1;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk28[0].unk0 = -1;

        if (stage->paused == FALSE) {
            sub_8004558(element);
        }

        *affine = 0x100;
        affine += 4;
        *affine = 0;
        affine += 4;
        *affine = 0;
        affine += 4;
        *affine = 0x100;
    }

    if (stage->unk5B7 == FALSE) {
        player->speed = 0;
        player->rotateSpeed = 6;
        player->unkD0 = 0x10000;
        player->unkD4 = 0x10000;
        player->acceleration = 40;
        player->coastResistence = -43;
        player->deceleration = -350;
        player->maxSpeed = 0x2C80;
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
        player->speed = 0;
        player->rotateSpeed = 0;
        player->unkD0 = 0xC00;
        player->unkD4 = 0x7FFF;
        player->acceleration = 256;
        player->coastResistence = 0x800;
    }

    return t;
}

void sub_806D2C8(void)
{
    PlayerStateHandler stateHandlers[18];
    Sprite *unk8, *unk38;

    struct SpecialStagePlayer *player = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = player->unk0;

    memcpy(stateHandlers, sPlayerStateHandlers, sizeof(sPlayerStateHandlers));

    if (stage->paused == FALSE) {
        stateHandlers[player->state + 1]();
        sub_806D788();
    } else {
        stateHandlers[0]();
    }

    unk8 = &player->unk8;
    unk38 = &player->unk38;

    if (player->unkB6 != 0 && stage->paused == FALSE) {
        if ((--player->unkB6) & 2) {
            sub_80051E8(unk8);
            if (player->state < 14) {
                sub_80051E8(unk38);
            }
        }
    } else {
        sub_80051E8(unk8);
        if (player->state < 14) {
            sub_80051E8(unk38);
        }
    }
}

// Animations for different player speeds

// Stopped?
void sub_806D388(void)
{
    struct SpecialStagePlayer *player = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = player->unk0;
    const struct UNK_80DF670 *unkC4;
    Sprite *unk8;
    u32 index = 0;

    if (stage->state != 8) {
        if (gInput & DPAD_LEFT) {
            index = 1;
        } else if (gInput & DPAD_RIGHT) {
            index = 2;
        }
    }

    unkC4 = &player->sprites[index];
    unk8 = &player->unk8;

    sub_806D7D0(unk8, -1, stage->unk5CC, unkC4);

    if (stage->state == 8) {
        sub_80051E8(unk8);
        sub_806D830(unk8, -1, stage->unk5CC, unkC4);
    }
}

// Moving?
void sub_806D424(void)
{
    struct SpecialStagePlayer *player = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = player->unk0;

    const struct UNK_80DF670 *unkC4;
    Sprite *unk8;

    u32 index = 3;
    if (gInput & DPAD_LEFT) {
        index = 4;
    } else if (gInput & DPAD_RIGHT) {
        index = 5;
    }

    unkC4 = &player->sprites[index];
    unk8 = &player->unk8;
    sub_806D7D0(unk8, player->animSpeed, stage->unk5CC, unkC4);
}

// Running?
void sub_806D484(void)
{
    struct SpecialStagePlayer *player = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = player->unk0;

    const struct UNK_80DF670 *unkC4;
    Sprite *unk8;

    u32 index = 6;
    if (gInput & DPAD_LEFT) {
        index = 7;
    } else if (gInput & DPAD_RIGHT) {
        index = 8;
    }

    unkC4 = &player->sprites[index];
    unk8 = &player->unk8;
    sub_806D7D0(unk8, player->animSpeed, stage->unk5CC, unkC4);
}

// Sprinting?
void sub_806D4E4(void)
{
    struct SpecialStagePlayer *player = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = player->unk0;

    const struct UNK_80DF670 *unkC4;
    Sprite *unk8;

    u32 index = 9;
    if (gInput & DPAD_LEFT) {
        index = 10;
    } else if (gInput & DPAD_RIGHT) {
        index = 11;
    }

    unkC4 = &player->sprites[index];
    unk8 = &player->unk8;
    sub_806D7D0(unk8, player->animSpeed >> 1, stage->unk5CC, unkC4);
}

void sub_806D548(Sprite *element, void *vram, s16 a, u8 b, const struct UNK_80DF670 *c4)
{
    u32 unk10 = 0x1000;
    if (c4->unk7 & 1) {
        unk10 |= 0x400;
    }

    if (c4->unk7 & 2) {
        unk10 |= 0x800;
    }

    element->graphics.dest = vram;
    element->graphics.size = 0;
    element->graphics.anim = c4->anim;
    element->unk10 = unk10;
    element->x = (DISPLAY_WIDTH / 2);
    element->y = a;
    element->unk1A = b << 6;
    element->unk1C = 0;
    element->unk1E = 0xffff;
    element->variant = c4->variant;
    element->unk21 = 0xff;
    element->unk22 = c4->unk6;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    sub_8004558(element);
}

UNUSED void sub_806D5CC(void) { }

#define Macro_806D4E(val, val2) ({ ((val) >> 4) + (val2); })

void sub_806D5D0(void)
{
    struct SpecialStagePlayer *player = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = player->unk0;

    const struct UNK_80DF670 *unkC4 = &player->sprites[12];
    player->unkB0 += player->unkB8 >> 4;

    sub_806D7D0(&player->unk8, -1, stage->unk5CC - Macro_806D4E(player->unkB0, 0xF),
                unkC4);
}

void sub_806D634(void)
{
    struct SpecialStagePlayer *player = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = player->unk0;
    const struct UNK_80DF670 *unkC4 = &player->sprites[15];

    player->unkB0 += player->unkB8 >> 4;

    sub_806D7D0(&player->unk8, -1, stage->unk5CC - Macro_806D4E(player->unkB0, 10),
                unkC4);
}

void sub_806D698(void)
{
    struct SpecialStagePlayer *player = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = player->unk0;
    const struct UNK_80DF670 *unkC4 = &player->sprites[18];

    sub_806D7D0(&player->unk8, -1, stage->unk5CC, unkC4);
}

void sub_806D6DC(void)
{
    struct SpecialStagePlayer *player = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = player->unk0;
    const struct UNK_80DF670 *unkC4 = &player->sprites[19];

    player->unkB0 += player->unkB8 >> 4;

    sub_806D7D0(&player->unk8, -1, stage->unk5CC - Macro_806D4E(player->unkB0, 10),
                unkC4);
}

void sub_806D740(void)
{
    struct SpecialStagePlayer *player = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = player->unk0;
    const struct UNK_80DF670 *unkC4 = &player->sprites[20];

    sub_806D7D0(&player->unk8, -1, stage->unk5CC - 0xC, unkC4);
}

void sub_806D788(void)
{
    struct SpecialStagePlayer *player = TaskGetStructPtr(gCurTask);
    if (player->unkBC != 0) {
        s32 temp = --player->unkBC;
        if (temp == 0) {
            player->unkBE = temp;
            player->multiplier = 1;
        }
    }
}

void sub_806D7D0(Sprite *element, s16 animSpeed, s16 spriteY,
                 const struct UNK_80DF670 *anim)
{
    u32 unk10 = 0x1000;
    if (anim->unk7 & 1) {
        unk10 |= 0x400;
    }

    if (anim->unk7 & 2) {
        unk10 |= 0x800;
    }
    element->graphics.anim = anim->anim;
    element->unk10 = unk10;
    element->y = spriteY;
    element->variant = anim->variant;

    element->unk22 = animSpeed != -1 ? animSpeed : 0x10;
    sub_8004558(element);
}

void sub_806D830(Sprite *element, s16 a, s16 spriteY, const struct UNK_80DF670 *anim)
{
    u8 unk22;
    u32 unk10 = 0x1100;
    if (anim->unk7 & 1) {
        unk10 |= 0x400;
    }

    if (anim->unk7 & 2) {
        unk10 |= 0x800;
    }
    element->graphics.anim = anim->anim;
    element->unk10 = unk10;
    element->y = spriteY;
    element->variant = anim->variant;

    element->unk22 = a != -1 ? a : 0x10;
    sub_8004558(element);
}
