#include "main.h"
#include "sprite.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_utils.h"
#include "special_stage_guard_robo.h"
#include "special_stage_physics.h"
#include "special_stage_collectables.h"
#include "special_stage_tables.h"
#include "special_stage_data.h"
#include "trig.h"
#include "m4a.h"
#include "constants/songs.h"

void sub_80714C4(void);
void sub_80710B0(void);
void sub_80714C8(void);
void sub_8071380(Sprite *element, void *vram, s16 a1, s16 a, u8 b,
                 const struct UNK_80DF670 *c4);
static void RenderGuardRobo(Sprite *element, s16 a1, s16 a, u8 b,
                            const struct UNK_80DF670 *c4);
void sub_8071478(void);
void sub_80714F4(struct SpecialStageGuardRobo *);
void sub_807120C(struct SpecialStageGuardRobo *);
static void SpecialStageGuardRoboOnDestroy(struct Task *);

static const struct UNK_80DF670 gUnknown_080DF914[9] = {
    { 883, 4, 64, 16, 0 }, { 883, 5, 64, 16, 0 }, { 883, 6, 64, 16, 0 },
    { 883, 7, 64, 16, 0 }, { 883, 0, 64, 16, 0 }, { 883, 1, 64, 16, 0 },
    { 883, 2, 64, 16, 0 }, { 883, 3, 64, 16, 0 }, SPRITE_ARRAY_END,
};

typedef void (*GuardRoboStateHandler)(void);

static const GuardRoboStateHandler sGuardRoboStateHandlers[3] = {
    sub_80714C4,
    sub_80710B0,
    sub_80714C8,
};

static void GuardRoboInit(struct SpecialStageGuardRobo *guardRobo)
{
    u8 level = guardRobo->stage->zone;
    const struct UNK_80DF670 *sprites = gUnknown_080DF914;
    s16 maxSize = MaxSpriteSize(sprites);
    void *vramOld = gUnknown_03005B5C;

    guardRobo->unk34 = gUnknown_03005B5C;
    gUnknown_03005B5C += maxSize * TILE_SIZE_4BPP;

    sub_8071380(&guardRobo->sprite, vramOld, 0x78, 0x3C, 7, sprites);
    guardRobo->sprites = sprites;
    guardRobo->state = 1;

    guardRobo->x = gSpecialStageGuardRoboStartPositions[level][0];
    guardRobo->y = gSpecialStageGuardRoboStartPositions[level][1];

    guardRobo->bearing = gUnknown_080DF968[level][0];
    guardRobo->speed = 0;
    guardRobo->acceleration = gUnknown_080DF968[level][1];
    guardRobo->rotateSpeed = gUnknown_080DF968[level][2];
    guardRobo->maxSpeed = gUnknown_080DF968[level][3];
    guardRobo->unk54 = 60;
}

void Task_GuardRoboMain(void)
{
    struct SpecialStageCollectables_UNK874_2 unk874;
    struct UNK_806CB84 unkCBB4;
    u8 temp;
    u16 *oam;
    bool16 visible;

    struct SpecialStageGuardRobo *guardRobo = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = guardRobo->stage;
    oam = &gOamBuffer[124].all.affineParam;

    if (stage->paused == FALSE) {
        sub_8071478();
    }

    unk874.unk0 = guardRobo->x;
    unk874.unk4 = guardRobo->y;
    unk874.unk8 = 0;

    unk874.unkC = 0x20;
    unk874.unkE = 0x20;
    unk874.unk10 = 0;
    unk874.unk12 = 0x1D;

    visible = sub_806CB84(&unkCBB4, &unk874, guardRobo->stage);
    if (visible) {
        u16 angle;

        *oam = unkCBB4.unkC;
        oam += 4;
        *oam = unkCBB4.unkE;
        oam += 4;
        *oam = unkCBB4.unk10;
        oam += 4;
        *oam = unkCBB4.unk12;

        angle = ((guardRobo->bearing - stage->cameraBearing) + 64) & 0x3FF;
        if (unkCBB4.screenY < (stage->unk5CC - 0x3C)) {
            temp = 0xC;
        } else {
            temp = 5;
        }

        if (stage->paused == FALSE) {
            RenderGuardRobo(&guardRobo->sprite, unkCBB4.screenX, unkCBB4.screenY, temp,
                            &guardRobo->sprites[angle >> 7]);
        }

        if (guardRobo->state != 2 || !(guardRobo->animFrame & 2) || stage->paused != 0) {
            sub_80051E8(&guardRobo->sprite);
        }
    }
}

void sub_80710B0(void)
{
    struct SpecialStageGuardRobo *guardRobo = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer *player = TaskGetStructPtr(guardRobo->stage->playerTask);

    s32 sin3;
    s32 sin4;

    s32 temp3, bearingToPlayer;

    u16 angle = (-guardRobo->bearing & 0x3FF);
    s32 sin = SIN(angle) * 4;
    s32 cos = COS(angle);

    s32 dX, dY;
    dX = player->x - guardRobo->x;
    dY = player->y - guardRobo->y;

    bearingToPlayer = (sin >> 8) * (dY >> 8) + (cos >> 6) * (dX >> 8);
    // required for match, probably wrong
    sin4 = (dX >> 8);
    temp3 = (-sin >> 8) * sin4 + (cos >> 6) * (dY >> 8);

    if (bearingToPlayer > 0) {
        guardRobo->bearing = (guardRobo->bearing - guardRobo->rotateSpeed) & 0x3FF;
    } else if (bearingToPlayer < 0) {
        guardRobo->bearing = (guardRobo->bearing + guardRobo->rotateSpeed) & 0x3FF;
    } else if (temp3 < 0) {
        guardRobo->bearing = (guardRobo->bearing - guardRobo->rotateSpeed) & 0x3FF;
    }

    angle = guardRobo->bearing;
    sin = SIN(angle) * 4;
    sin4 = COS(angle) * 4;

    guardRobo->x -= (sin * guardRobo->speed) >> 8;
    guardRobo->y -= (sin4 * guardRobo->speed) >> 8;

    sub_80714F4(guardRobo);
    sub_807120C(guardRobo);

    // BUG: I believe this should be += acceleration
    guardRobo->speed += guardRobo->maxSpeed;

    if (guardRobo->speed > guardRobo->maxSpeed) {
        guardRobo->speed = guardRobo->maxSpeed;
    }
}

void sub_807120C(struct SpecialStageGuardRobo *guardRobo)
{
    struct SpecialStage *stage = guardRobo->stage;
    struct SpecialStagePlayer *player = TaskGetStructPtr(guardRobo->stage->playerTask);

    s16 guardRoboX = Q_16_16_TO_INT(guardRobo->x);
    s16 guardRoboY = Q_16_16_TO_INT(guardRobo->y);
    s16 playerX = Q_16_16_TO_INT(player->x);
    s16 playerY = Q_16_16_TO_INT(player->y);
    s16 unkB0 = player->unkB0 >> 8;
    s16 state = player->state;

    switch (state) {
        case 6:
            return;
        case -1:
            return;
        case 10:
            return;
        case 0xE:
            return;
    }

    if ((guardRoboX - 5) < playerX && (guardRoboX + 5) > playerX) {
        if (((guardRoboY)-5) < playerY && (guardRoboY + 5) > playerY) {
#ifndef NON_MATCHING
            s16 r1 = 0;
            asm("" ::"r"(r1));
            if (r1 > unkB0 || unkB0 > 3) {
                return;
            }
#else
            if (unkB0 < 0 || unkB0 > 3) {
                return;
            }
#endif
            if ((state > 3 && state < 6) || state == 9) {
                guardRobo->animFrame = guardRobo->unk54;
                guardRobo->state = 2;
                sub_806F944(stage);
                player->state = 10;
                m4aSongNumStart(SE_275);
            } else if (stage->rings == 0 && player->unkB6 == 0) {
                player->unkB8 = player->unkFC;
                player->state = 0xE;
                player->speed = 0;
                m4aSongNumStart(SE_146);
            } else if (player->unkB6 == 0) {
                SpecialStageHandleLoseRings(stage, 10);
                player->unkB8 = player->unkF8;
                player->state = 6;
                player->speed = 0;
                player->unkB6 = 0x96;
                m4aSongNumStart(SE_RINGS_LOST);
            }
        }
    }
}

void sub_8071380(Sprite *element, void *vram, s16 x, s16 y, u8 b,
                 const struct UNK_80DF670 *c4)
{
    u16 *oam = &gOamBuffer[124].all.affineParam;
    u32 unk10 = 0x107F;
    if (c4->unk7 & 1) {
        unk10 |= 0x400;
    }

    if (c4->unk7 & 2) {
        unk10 |= 0x800;
    }

    element->vram = vram;
    element->unk8 = 0;
    element->anim = c4->anim;
    element->unk10 = unk10;
    element->x = x;
    element->y = y;
    element->unk1A = b << 6;
    element->unk1C = 0;
    element->unk1E = 0xffff;
    element->variant = c4->variant;
    element->unk21 = 0xff;
    element->unk22 = c4->unk6;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    sub_8004558(element);

    *oam = 0x100;
    oam += 4;
    *oam = 0;
    oam += 4;
    *oam = 0;
    oam += 4;
    *oam = 0x100;
}

struct Task *CreateSpecialStageGuardRobo(struct SpecialStage *stage)
{
    struct Task *t = TaskCreate(Task_GuardRoboMain, 0x58, 0xA000, 0,
                                SpecialStageGuardRoboOnDestroy);
    struct SpecialStageGuardRobo *guardRobo = TaskGetStructPtr(t);
    guardRobo->stage = stage;
    GuardRoboInit(guardRobo);
    return t;
}

void SpecialStageGuardRoboOnDestroy(UNUSED struct Task *t)
{
    // unused logic
}

void sub_8071478(void)
{
    struct SpecialStageGuardRobo *guardRobo = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = guardRobo->stage;

    GuardRoboStateHandler stateHandlers[ARRAY_COUNT(sGuardRoboStateHandlers)];
    memcpy(&stateHandlers, sGuardRoboStateHandlers, sizeof(sGuardRoboStateHandlers));

    if (stage->state > 3 && stage->state < 6) {
        stateHandlers[guardRobo->state]();
    }
}

void sub_80714C4(void)
{
    // unused logic
}

void sub_80714C8(void)
{
    struct SpecialStageGuardRobo *guardRobo = TaskGetStructPtr(gCurTask);
    guardRobo->animFrame--;

    if (guardRobo->animFrame < 1) {
        guardRobo->state = 1;
    }
}

void sub_80714F4(struct SpecialStageGuardRobo *guardRobo)
{
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

static void RenderGuardRobo(Sprite *element, s16 x, s16 y, u8 b,
                            const struct UNK_80DF670 *spriteConfig)
{
    u32 flags = 0x107F;
    if (spriteConfig->unk7 & 1) {
        flags |= 0x400;
    }

    if (spriteConfig->unk7 & 2) {
        flags |= 0x800;
    }

    element->anim = spriteConfig->anim;
    element->unk10 = flags;
    element->x = x;
    element->y = y;
    element->unk1A = b << 6;
    element->variant = spriteConfig->variant;
    element->unk22 = spriteConfig->unk6;
    sub_8004558(element);
}
