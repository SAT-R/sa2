#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/interactables.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
    /* 0x40 */ s32 unk40; // Q
    /* 0x44 */ s32 unk44; // Q
    /* 0x48 */ s16 unk48;
    /* 0x4A */ s16 unk4A;
    /* 0x4C */ s16 unk4C;
    /* 0x4E */ u8 unk4E;
} BumperA;

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
    /* 0x40 */ s32 unk40; // Q
    /* 0x44 */ s32 unk44; // Q
    /* 0x48 */ s16 unk48;
    /* 0x4A */ s16 unk4A;
    /* 0x4C */ u16 unk4C;
    /* 0x4E */ u8 unk4E;
    /* 0x4F */ u8 unk4F;
    /* 0x50 */ u8 unk50;
    /* 0x51 */ u8 unk51;
} BumperB;

// Triangular Bumpers
// TODO: Might be equivalent to BumperA?
typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
    /* 0x40 */ s32 unk40; // Q
    /* 0x44 */ s32 unk44; // Q
    /* 0x48 */ s16 unk48;
    /* 0x4A */ s16 unk4A;
    /* 0x4C */ u8 unk4C;
    /* 0x4D */ u8 unk4D;
    /* 0x4E */ u8 unk4E;
} BumperC;

void Task_BumperHexagon(void);
void Task_BumperHexagon2(void);
void TaskDestructor_BumperHexagon(Task *t);
void Task_BumperRound_LinearMov2(void);
void Task_BumperRound_LinearMov(void);
void Task_BumperRound_CircularMov(void);
void Task_BumperRound_CircularMov2(void);
void Task_BumperTriHorizontal(void);
void Task_BumperTriHorizontal2(void);
void Task_BumperTriVertical(void);
void Task_BumperTriVertical2(void);
void Task_BumperTriBig(void);
void Task_BumperTriBig2(void);

bool32 BumperCheckCollAndPosA1(BumperA *bumper, Sprite *s, s32 worldX, s32 worldY);
bool32 BumperCheckCollAndPosA2(BumperA *bumper, Sprite *s, s32 worldX, s32 worldY);
bool32 BumperCheckCollAndPosB(BumperB *bumper, Sprite *s, s32 worldX, s32 worldY);
bool32 BumperCheckCollAndPosC1(BumperC *bumper, Sprite *s, s32 worldX, s32 worldY);
bool32 BumperCheckCollAndPosC2(BumperC *bumper, Sprite *s, s32 worldX, s32 worldY);
bool32 BumperCheckCollAndPosC3(BumperC *bumper, Sprite *s, s32 worldX, s32 worldY);

void CreateEntity_BumperHexagon(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_BumperHexagon, sizeof(BumperA), 0x2000, 0, TaskDestructor_BumperHexagon);
    BumperA *bumper = TASK_DATA(t);
    Sprite *s = &bumper->s;

    bumper->base.regionX = regionX;
    bumper->base.regionY = regionY;
    bumper->base.me = me;
    bumper->base.meX = me->x;
    bumper->base.id = id;

    bumper->unk40 = 0;
    bumper->unk44 = 0;
    bumper->unk4C = 0;
    bumper->unk4E = 0;

    if (me->d.sData[0] >= 0) {
        bumper->unk48 = 4;
        bumper->unk3C = 0;
        bumper->unk4A = 0;
    } else {
        bumper->unk48 = 4;
        bumper->unk3C = 0x80;
        bumper->unk4A = 0;
    }

#ifndef NON_MATCHING
    // TODO:
    if (!(*((u32 *)&me->d.uData[1]) & 0x00FFFF00))
#else
    if (!me->d.uData[2] && !me->d.uData[3])
#endif
    {
        bumper->unk48 = 0;
    }

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BUMPER_BIG);
    s->graphics.anim = SA1_ANIM_BUMPER_BIG;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

void Task_BumperHexagon(void)
{
    BumperA *bumper = TASK_DATA(gCurTask);
    Sprite *s = &bumper->s;
    MapEntity *me = bumper->base.me;
    CamCoord worldX, worldY;

    if (bumper->unk48 != 0) {
        s32 r2 = Q(me->d.uData[2] * TILE_WIDTH);

        bumper->unk40 = (r2 * SIN(((bumper->unk48 * ((gStageTime + bumper->unk3C) & 0xFF)) & ONE_CYCLE))) >> 14;
    }

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    s->x = worldX - gCamera.x + I(bumper->unk40);
    s->y = worldY - gCamera.y + I(bumper->unk44);

    if (BumperCheckCollAndPosA1(bumper, s, worldX, worldY)) {
        gCurTask->main = Task_BumperHexagon2;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_BumperHexagon2(void)
{
    BumperA *bumper = TASK_DATA(gCurTask);
    Sprite *s = &bumper->s;
    MapEntity *me = bumper->base.me;
    CamCoord worldX, worldY;

    if (++bumper->unk4E > 8) {
        gCurTask->main = Task_BumperHexagon;
    }

    if (bumper->unk48 != 0) {
        s32 r2 = Q(me->d.uData[2] * TILE_WIDTH);

        bumper->unk40 = (r2 * SIN(((bumper->unk48 * ((gStageTime + bumper->unk3C) & 0xFF)) & ONE_CYCLE))) >> 14;
    }

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    BumperCheckCollAndPosA1(bumper, s, worldX, worldY);

    s->x = worldX - gCamera.x + I(bumper->unk40) - (COS(bumper->unk4E * 128) >> 12);
    s->y = worldY - gCamera.y + I(bumper->unk44) + (SIN(bumper->unk4E * 128) >> 12);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

bool32 BumperCheckCollAndPosA1(BumperA *bumper, Sprite *s, s32 worldX, s32 worldY)
{
    s32 i;
    bool32 result = FALSE;
    s32 rot;

    i = 0;
    do {
        s32 qTempPlayerX = PLAYER(i).qWorldX;

        if (Coll_Player_Entity_Intersection(s, worldX + I(bumper->unk40), worldY + I(bumper->unk44), &PLAYER(i))
            && !(PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE)) {
            if (((PLAYER(i).character == CHARACTER_TAILS) || (PLAYER(i).character == CHARACTER_KNUCKLES))
                && (PLAYER(i).SA2_LABEL(unk61) != 0)) {
                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                PLAYER(i).charState = CHARSTATE_SPINATTACK;
            }

            PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            PLAYER(i).moveState |= MOVESTATE_IN_AIR;
            PLAYER(i).moveState &= ~MOVESTATE_100;
            PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
            PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

            PLAYERFN_SET_SHIFT_OFFSETS(&PLAYER(i), 6, 9);

            rot = SA2_LABEL(sub_8004418)(I(PLAYER(i).qWorldY) - worldY - I(bumper->unk44),
                                         I(PLAYER(i).qWorldX) - worldX - I(bumper->unk40));

            if ((u32)(rot - 0x40) > (s32)(0.875 * SIN_PERIOD)) {
                PLAYER(i).qSpeedAirX = +Q(6.3984375);
            } else if ((u32)(rot - (s32)(0.4375 * SIN_PERIOD) - 1) <= (s32)(0.1328125 * SIN_PERIOD)) {
                PLAYER(i).qSpeedAirX = -Q(6.3984375);
            } else {
                if ((u32)rot > 0x249) {
                    if ((u32)rot > (s32)(0.75 * SIN_PERIOD)) {
                        PLAYER(i).qSpeedAirX = +0x297;
                        PLAYER(i).qSpeedAirY = -0x5D9;
                    } else {
                        PLAYER(i).qSpeedAirX = -0x297;
                        PLAYER(i).qSpeedAirY = -0x5D9;
                    }
                } else if ((u32)rot > (s32)(0.25 * SIN_PERIOD)) {
                    PLAYER(i).qSpeedAirX = -0x297;
                    PLAYER(i).qSpeedAirY = 0x5D9;
                } else {
                    PLAYER(i).qSpeedAirX = 0x297;
                    PLAYER(i).qSpeedAirY = 0x5D9;
                }
            }

            m4aSongNumStart(SE_BUMPER_A);

            bumper->unk4E = 0;
            result = TRUE;
        }

        PLAYER(i).qWorldX = qTempPlayerX;
    } while (++i < gNumSingleplayerCharacters);

    return result;
}

void TaskDestructor_BumperHexagon(Task *t)
{
    BumperA *bumper = TASK_DATA(t);
    VramFree(bumper->s.graphics.dest);
}

void CreateEntity_BumperRound_LinearMov(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_BumperRound_LinearMov, sizeof(BumperA), 0x2000, 0, NULL);
    BumperA *bumper = TASK_DATA(t);
    Sprite *s = &bumper->s;

    bumper->base.regionX = regionX;
    bumper->base.regionY = regionY;
    bumper->base.me = me;
    bumper->base.meX = me->x;
    bumper->base.id = id;

    bumper->unk40 = 0;
    bumper->unk44 = 0;
    bumper->unk4E = 0;
    bumper->unk4C = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            bumper->unk48 = 4;
            bumper->unk3C = 0;
            bumper->unk4A = 0;
        } else {
            bumper->unk48 = 4;
            bumper->unk3C = 0x80;
            bumper->unk4A = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            bumper->unk48 = 0;
            bumper->unk4A = 4;
            bumper->unk3C = 0;
        } else {
            bumper->unk48 = 0;
            bumper->unk4A = 4;
            bumper->unk3C = 0x80;
        }
    }

#ifndef NON_MATCHING
    // TODO:
    if (!(*((u32 *)&me->d.uData[1]) & 0x00FFFF00))
#else
    if (!me->d.uData[2] && !me->d.uData[3])
#endif
    {
        bumper->unk48 = 0;
    }

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VRAM_RESERVED_BUMPER;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BUMPER_ROUND;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

void Task_BumperRound_LinearMov(void)
{
    BumperA *bumper = TASK_DATA(gCurTask);
    Sprite *s = &bumper->s;
    MapEntity *me = bumper->base.me;
    CamCoord worldX, worldY;

    if (bumper->unk48 != 0) {
        s32 r2 = Q(me->d.uData[2] * TILE_WIDTH);

        bumper->unk40 = (r2 * SIN(((bumper->unk48 * ((gStageTime + bumper->unk3C) & 0xFF)) & ONE_CYCLE))) >> 14;
    }

    if (bumper->unk4A != 0) {
        s32 r2 = Q(me->d.uData[3] * TILE_WIDTH);

        bumper->unk44 = (r2 * SIN(((bumper->unk4A * ((gStageTime + bumper->unk3C) & 0xFF)) & ONE_CYCLE))) >> 14;
    }

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    s->x = worldX - gCamera.x + I(bumper->unk40);
    s->y = worldY - gCamera.y + I(bumper->unk44);

    if (BumperCheckCollAndPosA2(bumper, s, worldX, worldY)) {
        gCurTask->main = Task_BumperRound_LinearMov2;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_BumperRound_LinearMov2(void)
{
    BumperA *bumper = TASK_DATA(gCurTask);
    Sprite *s = &bumper->s;
    MapEntity *me = bumper->base.me;
    CamCoord worldX, worldY;

    if (++bumper->unk4E > 8) {
        gCurTask->main = Task_BumperRound_LinearMov;
    }

    if (bumper->unk48 != 0) {
        s32 r2 = Q(me->d.uData[2] * TILE_WIDTH);

        bumper->unk40 = (r2 * SIN(((bumper->unk48 * ((gStageTime + bumper->unk3C) & 0xFF)) & ONE_CYCLE))) >> 14;
    }

    if (bumper->unk4A != 0) {
        s32 r2 = Q(me->d.uData[3] * TILE_WIDTH);

        bumper->unk44 = (r2 * SIN(((bumper->unk4A * ((gStageTime + bumper->unk3C) & 0xFF)) & ONE_CYCLE))) >> 14;
    }

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    BumperCheckCollAndPosA2(bumper, s, worldX, worldY);

    s->x = worldX - gCamera.x + I(bumper->unk40) - (COS(bumper->unk4E * 128) >> 12);
    s->y = worldY - gCamera.y + I(bumper->unk44) + (SIN(bumper->unk4E * 128) >> 12);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

bool32 BumperCheckCollAndPosA2(BumperA *bumper, Sprite *s, s32 worldX, s32 worldY)
{
    s32 i;
    bool32 result = FALSE;
    s32 rot;

    i = 0;
    do {
        s32 qTempPlayerX = PLAYER(i).qWorldX;

        if (Coll_Player_Entity_Intersection(s, worldX + I(bumper->unk40), worldY + I(bumper->unk44), &PLAYER(i))
            && !(PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE)) {
            if (((PLAYER(i).character == CHARACTER_TAILS) || (PLAYER(i).character == CHARACTER_KNUCKLES))
                && (PLAYER(i).SA2_LABEL(unk61) != 0)) {
                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                PLAYER(i).charState = CHARSTATE_SPINATTACK;
            }

            PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            PLAYER(i).moveState |= MOVESTATE_IN_AIR;
            PLAYER(i).moveState &= ~MOVESTATE_100;
            PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
            PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

            (&PLAYER(i))->spriteOffsetX = 6;
            (&PLAYER(i))->spriteOffsetY = 9;

            rot = SA2_LABEL(sub_8004418)( //
                I(PLAYER(i).qWorldY) - worldY - I(bumper->unk44), //
                I(PLAYER(i).qWorldX) - worldX - I(bumper->unk40));

            PLAYER(i).qSpeedAirX = Div(COS(rot), 15);
            PLAYER(i).qSpeedGround = Div(COS(rot), 15);
            PLAYER(i).qSpeedAirY = Div(SIN(rot), 15);

            if (PLAYER(i).qSpeedAirX == Q(0)) {
                PLAYER(i).qSpeedAirX = +Q(8. / 256.);
            }

            INCREMENT_SCORE(10);

            m4aSongNumStart(SE_BUMPER_A);

            bumper->unk4E = 0;
            result = TRUE;
        }

        PLAYER(i).qWorldX = qTempPlayerX;
    } while (++i < gNumSingleplayerCharacters);

    return result;
}

void CreateEntity_BumperRound_CircularMov(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_BumperRound_CircularMov, sizeof(BumperB), 0x2000, 0, NULL);
    BumperB *bumper = TASK_DATA(t);
    Sprite *s = &bumper->s;

    bumper->base.regionX = regionX;
    bumper->base.regionY = regionY;
    bumper->base.me = me;
    bumper->base.meX = me->x;
    bumper->base.id = id;

    bumper->unk40 = 0;
    bumper->unk44 = 0;
    bumper->unk48 = 0;
    bumper->unk4A = 0;

    { // Circ
        bumper->unk3C = Q(me->d.sData[0] & 0x7);
        bumper->unk50 = me->d.sData[1];
        bumper->unk51 = 0;
        bumper->unk4C = 0;

        if (me->d.uData[2] > me->d.uData[3]) {
            bumper->unk4F = me->d.uData[2];
            bumper->unk4E = 1;
        } else {
            bumper->unk4F = me->d.uData[3];
            bumper->unk4E = 0;
        }

        if (me->d.sData[0] == 0) {
            bumper->unk48 = 0;
        }
    }

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VRAM_RESERVED_BUMPER;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BUMPER_ROUND;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

void Task_BumperRound_CircularMov(void)
{
    BumperB *bumper = TASK_DATA(gCurTask);
    Sprite *s = &bumper->s;
    MapEntity *me = bumper->base.me;
    CamCoord worldX, worldY;

    if (bumper->unk4E != 0) {
        bumper->unk40 = (SIN((((+me->d.sData[1] * gStageTime) + bumper->unk3C) & 0x7FF) >> 1)) * bumper->unk4F;
        bumper->unk44 = (COS((((+(me->d.sData[1]) * gStageTime) + bumper->unk3C) & 0x7FF) >> 1)) * bumper->unk4F;
    } else {
        bumper->unk40 = (SIN((((-me->d.sData[1] * gStageTime) + bumper->unk3C) & 0x7FF) >> 1)) * bumper->unk4F;
        bumper->unk44 = (COS((((-(me->d.sData[1]) * gStageTime) + bumper->unk3C) & 0x7FF) >> 1)) * bumper->unk4F;
    }

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    s->x = worldX - gCamera.x + (I(bumper->unk40) >> 3);
    s->y = worldY - gCamera.y + (I(bumper->unk44) >> 3);

    if (BumperCheckCollAndPosB(bumper, s, worldX, worldY)) {
        gCurTask->main = Task_BumperRound_CircularMov2;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    s->y += SIN(bumper->unk4C) >> 12;

    DisplaySprite(s);
}

void Task_BumperRound_CircularMov2(void)
{
    BumperB *bumper = TASK_DATA(gCurTask);
    Sprite *s = &bumper->s;
    MapEntity *me = bumper->base.me;
    CamCoord worldX, worldY;

    if (++bumper->unk51 > 8) {
        gCurTask->main = Task_BumperRound_CircularMov;
    }

    if (bumper->unk4E != 0) {
        bumper->unk40 = (SIN((((+me->d.sData[1] * gStageTime) + bumper->unk3C) & 0x7FF) >> 1)) * bumper->unk4F;
        bumper->unk44 = (COS((((+(me->d.sData[1]) * gStageTime) + bumper->unk3C) & 0x7FF) >> 1)) * bumper->unk4F;
    } else {
        bumper->unk40 = (SIN((((-me->d.sData[1] * gStageTime) + bumper->unk3C) & 0x7FF) >> 1)) * bumper->unk4F;
        bumper->unk44 = (COS((((-(me->d.sData[1]) * gStageTime) + bumper->unk3C) & 0x7FF) >> 1)) * bumper->unk4F;
    }

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    s->x = worldX - gCamera.x + I(bumper->unk40 >> 3) - (COS(bumper->unk51 * 128) >> 12);
    s->y = worldY - gCamera.y + I(bumper->unk44 >> 3) + (SIN(bumper->unk51 * 128) >> 12);

    BumperCheckCollAndPosB(bumper, s, worldX, worldY);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    s->y += SIN(bumper->unk4C) >> 12;

    DisplaySprite(s);
}

bool32 BumperCheckCollAndPosB(BumperB *bumper, Sprite *s, s32 worldX, s32 worldY)
{
    s32 i;
    bool32 result = FALSE;
    s32 rot;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (Coll_Player_Entity_Intersection(s, worldX + I(bumper->unk40 >> 3), worldY + I(bumper->unk44 >> 3), &PLAYER(i))) {
                if (((PLAYER(i).character == CHARACTER_TAILS) || (PLAYER(i).character == CHARACTER_KNUCKLES))
                    && (PLAYER(i).SA2_LABEL(unk61) != 0)) {
                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).charState = CHARSTATE_SPINATTACK;
                }

                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                PLAYER(i).moveState &= ~MOVESTATE_100;
                PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

                (&PLAYER(i))->spriteOffsetX = 6;
                (&PLAYER(i))->spriteOffsetY = 9;

                rot = SA2_LABEL(sub_8004418)( //
                    I(PLAYER(i).qWorldY) - worldY - I(bumper->unk44), //
                    I(PLAYER(i).qWorldX) - worldX - I(bumper->unk40));

                PLAYER(i).qSpeedAirX = Div(COS(rot), 15);
                PLAYER(i).qSpeedGround = Div(COS(rot), 15);
                PLAYER(i).qSpeedAirY = Div(SIN(rot), 15);

                if (PLAYER(i).qSpeedAirX == Q(0)) {
                    PLAYER(i).qSpeedAirX = +Q(8. / 256.);
                }

                INCREMENT_SCORE(10);

                m4aSongNumStart(SE_BUMPER_A);

                bumper->unk51 = 0;
                result = TRUE;
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    return result;
}

void CreateEntity_BumperTriHorizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Sprite *s = NULL; // for matching
    Task *t = TaskCreate(Task_BumperTriHorizontal, sizeof(BumperC), 0x2000, 0, NULL);
    BumperC *bumper = TASK_DATA(t);
    s = &bumper->s;

    bumper->base.regionX = regionX;
    bumper->base.regionY = regionY;
    bumper->base.me = me;
    bumper->base.meX = me->x;
    bumper->base.id = id;

    bumper->unk40 = 0;
    bumper->unk44 = 0;
    bumper->unk4A = 0;
    bumper->unk48 = 0;
    bumper->unk4C = 0;
    bumper->unk4D = 1;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VRAM_RESERVED_BUMPER_TRI;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BUMPER_TRI_H;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (me->d.sData[0] == 0) {
        SPRITE_FLAG_SET(s, Y_FLIP);
    }

    UpdateSpriteAnimation(s);
}

void CreateEntity_BumperTriVertical(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Sprite *s = NULL; // for matching
    Task *t = TaskCreate(Task_BumperTriVertical, sizeof(BumperC), 0x2000, 0, NULL);
    BumperC *bumper = TASK_DATA(t);
    s = &bumper->s;

    bumper->base.regionX = regionX;
    bumper->base.regionY = regionY;
    bumper->base.me = me;
    bumper->base.meX = me->x;
    bumper->base.id = id;

    bumper->unk40 = 0;
    bumper->unk44 = 0;
    bumper->unk4A = 0;
    bumper->unk48 = 0;
    bumper->unk4C = 0;
    bumper->unk4D = 2;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VRAM_RESERVED_BUMPER_TRI_2;
    s->graphics.anim = SA1_ANIM_BUMPER_TRI_V;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (me->d.sData[0] == 0) {
        SPRITE_FLAG_SET(s, X_FLIP);
    }

    UpdateSpriteAnimation(s);
}

void CreateEntity_BumperTriBig(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Sprite *s = NULL; // for matching
    Task *t = TaskCreate(Task_BumperTriBig, sizeof(BumperC), 0x2000, 0, NULL);
    BumperC *bumper = TASK_DATA(t);
    s = &bumper->s;

    bumper->base.regionX = regionX;
    bumper->base.regionY = regionY;
    bumper->base.me = me;
    bumper->base.meX = me->x;
    bumper->base.id = id;

    bumper->unk40 = 0;
    bumper->unk44 = 0;
    bumper->unk4A = 0;
    bumper->unk48 = 0;
    bumper->unk4C = 0;
    bumper->unk4D = 4;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VRAM_RESERVED_BUMPER_TRI_BIG;
    s->graphics.anim = SA1_ANIM_BUMPER_RIGHTANG;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (me->d.sData[0] == 0) {
        SPRITE_FLAG_SET(s, X_FLIP);
    }

    if (me->d.sData[1] == 0) {
        SPRITE_FLAG_SET(s, Y_FLIP);
    }

    UpdateSpriteAnimation(s);
}

void Task_BumperTriHorizontal(void)
{
    BumperC *bumper = TASK_DATA(gCurTask);
    Sprite *s = &bumper->s;
    MapEntity *me = bumper->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    s->x = worldX - gCamera.x + (I(bumper->unk40));
    s->y = worldY - gCamera.y + (I(bumper->unk44));

    if (BumperCheckCollAndPosC1(bumper, s, worldX, worldY)) {
        gCurTask->main = Task_BumperTriHorizontal2;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_BumperTriHorizontal2(void)
{
    BumperC *bumper = TASK_DATA(gCurTask);
    Sprite *s = &bumper->s;
    MapEntity *me = bumper->base.me;
    CamCoord worldX, worldY;

    if (++bumper->unk4C > 8) {
        gCurTask->main = Task_BumperTriHorizontal;
    }

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        s->x = worldX - gCamera.x + (COS(bumper->unk4C * 128) >> 12);
    } else {
        s->x = worldX - gCamera.x - (COS(bumper->unk4C * 128) >> 12);
    }

    s->y = worldY - gCamera.y + (SIN(bumper->unk4C * 128) >> 12);

    BumperCheckCollAndPosC1(bumper, s, worldX, worldY);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_BumperTriVertical(void)
{
    BumperC *bumper = TASK_DATA(gCurTask);
    Sprite *s = &bumper->s;
    MapEntity *me = bumper->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    s->x = worldX - gCamera.x + I(bumper->unk40);
    s->y = worldY - gCamera.y + I(bumper->unk44);

    if (BumperCheckCollAndPosC2(bumper, s, worldX, worldY) != 0) {
        gCurTask->main = Task_BumperTriVertical2;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_BumperTriVertical2(void)
{
    BumperC *bumper = TASK_DATA(gCurTask);
    Sprite *s = &bumper->s;
    MapEntity *me = bumper->base.me;
    CamCoord worldX, worldY;

    if (++bumper->unk4C > 8) {
        gCurTask->main = Task_BumperTriVertical;
    }

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    BumperCheckCollAndPosC2(bumper, s, worldX, worldY);

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        s->x = worldX - gCamera.x + (COS(bumper->unk4C * 128) >> 12);
    } else {
        s->x = worldX - gCamera.x - (COS(bumper->unk4C * 128) >> 12);
    }

    s->y = worldY - gCamera.y + (SIN(bumper->unk4C * 128) >> 12);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_BumperTriBig(void)
{
    BumperC *bumper = TASK_DATA(gCurTask);
    Sprite *s = &bumper->s;
    MapEntity *me = bumper->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (BumperCheckCollAndPosC3(bumper, s, worldX, worldY)) {
        gCurTask->main = Task_BumperTriBig2;
    }
    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_BumperTriBig2(void)
{
    BumperC *bumper = TASK_DATA(gCurTask);
    Sprite *s = &bumper->s;
    MapEntity *me = bumper->base.me;
    CamCoord worldX, worldY;

    if (++bumper->unk4C > 8) {
        gCurTask->main = Task_BumperTriBig;
    }

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        s->x = worldX - gCamera.x + (COS(bumper->unk4C * 128) >> 12);
    } else {
        s->x = worldX - gCamera.x - (COS(bumper->unk4C * 128) >> 12);
    }

    s->y = worldY - gCamera.y + (SIN(bumper->unk4C * 128) >> 12);

    BumperCheckCollAndPosC3(bumper, s, worldX, worldY);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

// (94.48%) https://decomp.me/scratch/LOH2M
NONMATCH("asm/non_matching/game/sa1/stage/interactables/bumpers__BumperCheckCollAndPosC1.inc",
         bool32 BumperCheckCollAndPosC1(BumperC *bumper, Sprite *s, s32 worldX, s32 worldY))
{
    s32 i;
    bool32 result = FALSE;
    bool32 sp10 = FALSE;
    s32 rot;

    i = 0;
    do {
        s32 qTempPlayerX = PLAYER(i).qWorldX;

        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if ((gGameMode == 3 || gGameMode == 5)) {
                u8 j;
                for (j = 0; j < 4 && gMultiplayerPlayerTasks[j]; j++) {
                    if (j != SIO_MULTI_CNT->id) {
                        MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[j]);
                        if (mpp->unk5C & 0x4) {
                            sp10 = TRUE;
                        }
                    }
                }
            }

            if (!(PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE) || sp10) {
                if (Coll_Player_Entity_Intersection(s, worldX + I(bumper->unk40), worldY + I(bumper->unk44), &PLAYER(i))) {
                    if (((PLAYER(i).character == CHARACTER_TAILS) || (PLAYER(i).character == CHARACTER_KNUCKLES))
                        && (PLAYER(i).SA2_LABEL(unk61) != 0)) {
                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                        PLAYER(i).charState = CHARSTATE_SPINATTACK;
                    }

                    if (gGameMode == 3 || gGameMode == 5) {
                        PLAYER(i).timerInvulnerability = 30;
                    }

                    PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                    PLAYER(i).moveState &= ~MOVESTATE_100;
                    PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                    PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

                    (&PLAYER(i))->spriteOffsetX = 6;
                    (&PLAYER(i))->spriteOffsetY = 9;

                    rot = SA2_LABEL(sub_8004418)( //
                        I(PLAYER(i).qWorldY) - worldY - I(bumper->unk44), //
                        I(PLAYER(i).qWorldX) - worldX - I(bumper->unk40));

                    if (s->frameFlags & SPRITE_FLAG_MASK_Y_FLIP) {
                        if ((u32)rot >= 0x200) {
                            PLAYER(i).qSpeedAirY = -Q(6.3984375);
                        } else if ((u32)rot < 0x100) {
                            PLAYER(i).qSpeedAirX = +0x297;
                            PLAYER(i).qSpeedAirY = +0x5D9;
                        } else {
                            PLAYER(i).qSpeedAirX = -0x297;
                            PLAYER(i).qSpeedAirY = +0x5D9;
                        }
                    } else {
                        if ((u32)rot > (s32)(0.482421875 * SIN_PERIOD)) {
                            if ((u32)rot > (s32)(0.75 * SIN_PERIOD)) {
                                PLAYER(i).qSpeedAirX = +0x297;
                                PLAYER(i).qSpeedAirY = -0x5D9;
                            } else {
                                PLAYER(i).qSpeedAirX = -0x297;
                                PLAYER(i).qSpeedAirY = -0x5D9;
                            }
                        } else {
                            if ((u32)rot < 0x15) {
                                PLAYER(i).qSpeedAirX = +0x297;
                                PLAYER(i).qSpeedAirY = -0x5D9;
                            } else {
                                PLAYER(i).qSpeedAirY = +Q(6.3984375);
                            }
                        }
                    }

                    m4aSongNumStart(SE_BUMPER_B);

                    bumper->unk4C = 0;
                    result = TRUE;
                }
            }
        }

        PLAYER(i).qWorldX = qTempPlayerX;
    } while (++i < gNumSingleplayerCharacters);

    return result;
}
END_NONMATCH

bool32 BumperCheckCollAndPosC2(BumperC *bumper, Sprite *s, s32 worldX, s32 worldY)
{
    s32 i;
    bool32 result = FALSE;
    s32 rot;

    i = 0;
    do {
        s32 qTempPlayerX = PLAYER(i).qWorldX;

        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {

            if (Coll_Player_Entity_Intersection(s, worldX + I(bumper->unk40), worldY + I(bumper->unk44), &PLAYER(i))) {
                if (!(PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE)) {
                    if (((PLAYER(i).character == CHARACTER_TAILS) || (PLAYER(i).character == CHARACTER_KNUCKLES))
                        && (PLAYER(i).SA2_LABEL(unk61) != 0)) {
                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                        PLAYER(i).charState = CHARSTATE_SPINATTACK;
                    }

                    PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                    PLAYER(i).moveState &= ~MOVESTATE_100;
                    PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                    PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

                    (&PLAYER(i))->spriteOffsetX = 6;
                    (&PLAYER(i))->spriteOffsetY = 9;

                    rot = SA2_LABEL(sub_8004418)( //
                        I(PLAYER(i).qWorldY) - worldY - I(bumper->unk44), //
                        I(PLAYER(i).qWorldX) - worldX - I(bumper->unk40));

                    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                        if ((u32)rot - 0xFD >= 0x207) {
                            PLAYER(i).qSpeedAirX = +Q(6.3984375);
                        } else if ((u32)rot > 0x200) {
                            PLAYER(i).qSpeedAirX = -0x5D9;
                            PLAYER(i).qSpeedAirY = -0x297;
                        } else {
                            PLAYER(i).qSpeedAirX = -0x5D9;
                            PLAYER(i).qSpeedAirY = +0x297;
                        }
                    } else {
                        if ((u32)(rot - 0x104) <= (s32)(0.4921875 * SIN_PERIOD)) {
                            PLAYER(i).qSpeedAirX = -0x666;
                        } else {
                            if ((u32)rot > 0x200) {
                                PLAYER(i).qSpeedAirX = +0x5D9;
                                PLAYER(i).qSpeedAirY = -0x297;
                            } else {
                                PLAYER(i).qSpeedAirX = +0x5D9;
                                PLAYER(i).qSpeedAirY = +0x297;
                            }
                        }
                    }

                    m4aSongNumStart(SE_BUMPER_B);

                    bumper->unk4C = 0;
                    result = TRUE;
                }
            }
        }

        PLAYER(i).qWorldX = qTempPlayerX;
    } while (++i < gNumSingleplayerCharacters);

    return result;
}

// (90.80%) https://decomp.me/scratch/FTsLY
NONMATCH("asm/non_matching/game/sa1/stage/interactables/bumpers__BumperCheckCollAndPosC3.inc",
         bool32 BumperCheckCollAndPosC3(BumperC *bumper, Sprite *s, s32 worldX, s32 worldY))
{
    s32 i;
#ifndef NON_MATCHING
    register bool32 result asm("r9") = FALSE;
#else
    bool32 result = FALSE;
#endif
    bool32 sp0C = FALSE;
    s32 rot;

    i = 0;
    do {
        s32 qTempPlayerX = PLAYER(i).qWorldX;

        if (Coll_Player_Entity_Intersection(s, worldX, worldY, &PLAYER(i))) {
            if ((gGameMode == 3 || gGameMode == 5)) {
                u8 j;
                for (j = 0; j < 4 && gMultiplayerPlayerTasks[j]; j++) {
                    if (j != SIO_MULTI_CNT->id) {
                        MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[j]);
                        if (mpp->unk5C & 0x4) {
                            sp0C = TRUE;
                        }
                    }
                }
            }
            if (!(PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE) || sp0C) {
                if (s->frameFlags & SPRITE_FLAG_MASK_Y_FLIP) {
                    if ((s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)) {
                        if ((I(PLAYER(i).qWorldY) - worldY) < 65 - (worldX - I(qTempPlayerX))) {
                            if (((PLAYER(i).character == CHARACTER_TAILS) || (PLAYER(i).character == CHARACTER_KNUCKLES))
                                && (PLAYER(i).SA2_LABEL(unk61) != 0)) {
                                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                                PLAYER(i).charState = CHARSTATE_SPINATTACK;
                            }

                            if ((gGameMode == 3 || gGameMode == 5)) {
                                PLAYER(i).timerInvulnerability = 30;
                            }

                            PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                            PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                            PLAYER(i).moveState &= ~MOVESTATE_100;
                            PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                            PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

                            (&PLAYER(i))->spriteOffsetX = 6;
                            (&PLAYER(i))->spriteOffsetY = 9;

                            PLAYER(i).qSpeedAirX = -Q(4.6875);
                            PLAYER(i).qSpeedAirY = +Q(4.6875);

#if 01
                            goto lbl2;
#else
                            m4aSongNumStart(SE_BUMPER_B);

                            bumper->unk4C = 0;
                            result = TRUE;
#endif
                        }
                    } else {
                        if ((I(PLAYER(i).qWorldY) - worldY) < 65 - (I(qTempPlayerX) - worldX)) {
                            if (((PLAYER(i).character == CHARACTER_TAILS) || (PLAYER(i).character == CHARACTER_KNUCKLES))
                                && (PLAYER(i).SA2_LABEL(unk61) != 0)) {
                                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                                PLAYER(i).charState = CHARSTATE_SPINATTACK;
                            }

                            if ((gGameMode == 3 || gGameMode == 5)) {
                                PLAYER(i).timerInvulnerability = 30;
                            }

                            PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                            PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                            PLAYER(i).moveState &= ~MOVESTATE_100;
                            PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                            PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

                            (&PLAYER(i))->spriteOffsetX = 6;
                            (&PLAYER(i))->spriteOffsetY = 9;

                            PLAYER(i).qSpeedAirX = +Q(4.6875);
                            PLAYER(i).qSpeedAirY = +Q(4.6875);

#if 01
                            goto lbl;
#else
                            m4aSongNumStart(SE_BUMPER_B);

                            bumper->unk4C = 0;
                            result = TRUE;
#endif
                        }
                    }
                } else { // !Y_FLIP
                    if ((s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)) {
                        if ((I(PLAYER(i).qWorldY) - worldY) > worldX - I(qTempPlayerX) - 60) {
                            if (((PLAYER(i).character == CHARACTER_TAILS) || (PLAYER(i).character == CHARACTER_KNUCKLES))
                                && (PLAYER(i).SA2_LABEL(unk61) != 0)) {
                                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                                PLAYER(i).charState = CHARSTATE_SPINATTACK;
                            }

                            if ((gGameMode == 3 || gGameMode == 5)) {
                                PLAYER(i).timerInvulnerability = 30;
                            }

                            PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                            PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                            PLAYER(i).moveState &= ~MOVESTATE_100;
                            PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                            PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

                            (&PLAYER(i))->spriteOffsetX = 6;
                            (&PLAYER(i))->spriteOffsetY = 9;

                            PLAYER(i).qSpeedAirX = -Q(4.6875);
                            PLAYER(i).qSpeedAirY = -Q(4.6875);

                            asm("");
                        lbl:
                            m4aSongNumStart(SE_BUMPER_B);

                            bumper->unk4C = 0;
                            result = TRUE;
                            asm("");
                        }
                    } else {
                        if ((I(PLAYER(i).qWorldY) - worldY) > I(qTempPlayerX) - worldX - 60) {
                            if (((PLAYER(i).character == CHARACTER_TAILS) || (PLAYER(i).character == CHARACTER_KNUCKLES))
                                && (PLAYER(i).SA2_LABEL(unk61) != 0)) {
                                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                                PLAYER(i).charState = CHARSTATE_SPINATTACK;
                            }

                            if ((gGameMode == 3 || gGameMode == 5)) {
                                PLAYER(i).timerInvulnerability = 30;
                            }

                            PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                            PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                            PLAYER(i).moveState &= ~MOVESTATE_100;
                            PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                            PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

                            (&PLAYER(i))->spriteOffsetX = 6;
                            (&PLAYER(i))->spriteOffsetY = 9;

                            PLAYER(i).qSpeedAirX = +Q(4.6875);
                            PLAYER(i).qSpeedAirY = -Q(4.6875);

                        lbl2:
                            m4aSongNumStart(SE_BUMPER_B);

                            bumper->unk4C = 0;
                            result = TRUE;
                        }
                    }
                }
            }
        }

        PLAYER(i).qWorldX = qTempPlayerX;
    } while (++i < gNumSingleplayerCharacters);

    return result;
}
END_NONMATCH