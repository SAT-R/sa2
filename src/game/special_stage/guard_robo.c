#include "core.h"
#include "sprite.h"
#include "game/special_stage/main.h"
#include "game/special_stage/player.h"
#include "game/special_stage/utils.h"
#include "game/special_stage/guard_robo.h"
#include "game/special_stage/physics.h"
#include "game/special_stage/collectables.h"
#include "game/special_stage/tables.h"
#include "game/special_stage/data.h"
#include "trig.h"
#include "lib/m4a/m4a.h"
#include "constants/songs.h"

void sub_80714C4(void);
void sub_80710B0(void);
void sub_80714C8(void);
void sub_8071380(Sprite *s, void *vram, s16 a1, s16 a, u8 b, const struct UNK_80DF670 *c4);
static void RenderGuardRobo(Sprite *s, s16 a1, s16 a, u8 b, const struct UNK_80DF670 *c4);
void sub_8071478(void);
void sub_80714F4(struct SpecialStageGuardRobo *);
void sub_807120C(struct SpecialStageGuardRobo *);
static void SpecialStageGuardRoboOnDestroy(struct Task *);

static const struct UNK_80DF670 gUnknown_080DF914[9] = {
    { 883, 4, 64, 16, 0 }, { 883, 5, 64, 16, 0 }, { 883, 6, 64, 16, 0 }, { 883, 7, 64, 16, 0 }, { 883, 0, 64, 16, 0 },
    { 883, 1, 64, 16, 0 }, { 883, 2, 64, 16, 0 }, { 883, 3, 64, 16, 0 }, SPRITE_ARRAY_END,
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

    sub_8071380(&guardRobo->sprite, vramOld, DISPLAY_WIDTH / 2, (DISPLAY_HEIGHT / 2) - 20, 7, sprites);
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
    u8 order;
    u16 *oam;
    bool16 visible;

    struct SpecialStageGuardRobo *guardRobo = TASK_DATA(gCurTask);
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

    visible = SpecialStageCalcEntityScreenPosition(&unkCBB4, &unk874, guardRobo->stage);
    if (visible) {
        u16 angle;

        *oam = unkCBB4.unkC;
        oam += OAM_DATA_COUNT_AFFINE;
        *oam = unkCBB4.unkE;
        oam += OAM_DATA_COUNT_AFFINE;
        *oam = unkCBB4.unk10;
        oam += OAM_DATA_COUNT_AFFINE;
        *oam = unkCBB4.unk12;

        angle = ((guardRobo->bearing - stage->cameraRotX) + 64) & ONE_CYCLE;
        // Is behind player
        if (unkCBB4.screenY < (stage->cameraHeight - 60)) {
            order = 12;
        } else {
            order = 5;
        }

        if (stage->paused == FALSE) {
            RenderGuardRobo(&guardRobo->sprite, unkCBB4.screenX, unkCBB4.screenY, order, &guardRobo->sprites[angle >> 7]);
        }

        if (guardRobo->state != 2 || !(guardRobo->animFrame & 2) || stage->paused != 0) {
            DisplaySprite(&guardRobo->sprite);
        }
    }
}

void sub_80710B0(void)
{
    struct SpecialStageGuardRobo *guardRobo = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(guardRobo->stage->playerTask);

    s32 sin3;
    s32 sin4;

    s32 temp3, bearingToPlayer;

    u16 angle = (-guardRobo->bearing & ONE_CYCLE);
    s32 sin = SIN(angle) * 4;
    s32 cos = COS(angle);

    s32 dX, dY;
    dX = player->q16WorldX - guardRobo->x;
    dY = player->q16WorldY - guardRobo->y;

    bearingToPlayer = (sin >> 8) * (dY >> 8) + (cos >> 6) * (dX >> 8);
    // required for match
    sin4 = (dX >> 8);
    temp3 = (-sin >> 8) * sin4 + (cos >> 6) * (dY >> 8);

    if (bearingToPlayer > 0) {
        guardRobo->bearing = (guardRobo->bearing - guardRobo->rotateSpeed) & ONE_CYCLE;
    } else if (bearingToPlayer < 0) {
        guardRobo->bearing = (guardRobo->bearing + guardRobo->rotateSpeed) & ONE_CYCLE;
    } else if (temp3 < 0) {
        guardRobo->bearing = (guardRobo->bearing - guardRobo->rotateSpeed) & ONE_CYCLE;
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
    struct SpecialStagePlayer *player = TASK_DATA(guardRobo->stage->playerTask);

    s16 guardRoboX = Q_16_16_TO_INT(guardRobo->x);
    s16 guardRoboY = Q_16_16_TO_INT(guardRobo->y);
    s16 playerX = Q_16_16_TO_INT(player->q16WorldX);
    s16 playerY = Q_16_16_TO_INT(player->q16WorldY);
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
                HandleRoboPlayerCollision(stage);
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

void sub_8071380(Sprite *s, void *vram, s16 x, s16 y, u8 b, const struct UNK_80DF670 *c4)
{
    u16 *oam = &gOamBuffer[124].all.affineParam;
    u32 unk10 = 0x107F;
    if (c4->unk7 & 1) {
        unk10 |= 0x400;
    }

    if (c4->unk7 & 2) {
        unk10 |= 0x800;
    }

    s->graphics.dest = vram;
    s->graphics.size = 0;
    s->graphics.anim = c4->anim;
    s->frameFlags = unk10;
    s->x = x;
    s->y = y;
    s->oamFlags = SPRITE_OAM_ORDER(b);
    s->qAnimDelay = 0;
    s->prevAnim = 0xffff;
    s->variant = c4->variant;
    s->prevVariant = 0xff;
    s->animSpeed = c4->animSpeed;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    UpdateSpriteAnimation(s);

    *oam = 0x100;
    oam += OAM_DATA_COUNT_AFFINE;
    *oam = 0;
    oam += OAM_DATA_COUNT_AFFINE;
    *oam = 0;
    oam += OAM_DATA_COUNT_AFFINE;
    *oam = 0x100;
}

struct Task *CreateSpecialStageGuardRobo(struct SpecialStage *stage)
{
    struct Task *t = TaskCreate(Task_GuardRoboMain, sizeof(struct SpecialStageGuardRobo), 0xA000, 0, SpecialStageGuardRoboOnDestroy);
    struct SpecialStageGuardRobo *guardRobo = TASK_DATA(t);
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
    struct SpecialStageGuardRobo *guardRobo = TASK_DATA(gCurTask);
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
    struct SpecialStageGuardRobo *guardRobo = TASK_DATA(gCurTask);
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

static void RenderGuardRobo(Sprite *s, s16 x, s16 y, u8 order, const struct UNK_80DF670 *spriteConfig)
{
    u32 flags = 0x107F;
    if (spriteConfig->unk7 & 1) {
        flags |= 0x400;
    }

    if (spriteConfig->unk7 & 2) {
        flags |= 0x800;
    }

    s->graphics.anim = spriteConfig->anim;
    s->frameFlags = flags;
    s->x = x;
    s->y = y;
    s->oamFlags = SPRITE_OAM_ORDER(order);
    s->variant = spriteConfig->variant;
    s->animSpeed = spriteConfig->animSpeed;
    UpdateSpriteAnimation(s);
}
