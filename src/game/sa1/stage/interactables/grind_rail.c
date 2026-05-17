#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/parameters/characters.h"
#include "game/shared/stage/grind_effect_1.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"

#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"

typedef struct {
    u16 frameCount;
} GrindRailUnk;

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 meX;
} GrindRail;

#ifndef NON_MATCHING
#define GRINDRAIL_SIZE     9
#define GRINDRAIL_UNK_SIZE 2
#else
#define GRINDRAIL_SIZE     sizeof(GrindRail)
#define GRINDRAIL_UNK_SIZE sizeof(GrindRailUnk)
#endif

void Task_GrindRailStart(void);
void Task_GrindRailEnd(void);
void Task_8023EFC(void);

// (96.59%) https://decomp.me/scratch/oIXga
NONMATCH("asm/non_matching/game/sa1/stage/interactables/grind_rail__Task_GrindRailStart.inc", void Task_GrindRailStart(void))
{
    Task *grindTask;
    GrindRail *rail;
    MapEntity *me;
    u8 meX;
    u16 regionX, regionY;
    s16 worldX, worldY;
    s16 screenX, screenY;

    if (gPlayer.character == CHARACTER_TAILS || //
        gPlayer.character == CHARACTER_KNUCKLES) {
        return;
    }

    rail = TASK_DATA(gCurTask);

    me = rail->me;
    meX = TASK_GET_MEMBER(GrindRail, gCurTask, u8, meX);
    regionX = TASK_GET_MEMBER(GrindRail, gCurTask, u16, regionX);
    regionY = TASK_GET_MEMBER(GrindRail, gCurTask, u16, regionY);

    worldX = TO_WORLD_POS(meX, regionX);
    worldY = TO_WORLD_POS(me->y, regionY);

    if (PLAYER_IS_ALIVE) {
        // NOTE: The collision check does not take left/top (data[0] | data[1]) into account,
        //       because they are always placed on the left side of a rail ending.
        if ((worldX <= I(gPlayer.qWorldX)) //
            && (worldX + me->d.uData[2] * TILE_WIDTH >= I(gPlayer.qWorldX)) //
            && (worldY <= I(gPlayer.qWorldY)) //
            && (worldY + me->d.uData[3] * TILE_WIDTH >= I(gPlayer.qWorldY)) //
            && !(gPlayer.moveState & MOVESTATE_1000000) && (gPlayer.qSpeedAirY >= Q(0)) && (gPlayer.qSpeedAirX > Q(0))) //
        {
            gPlayer.qSpeedAirX = MAX(Q(0.5), gPlayer.qSpeedAirX);

            gPlayer.moveState |= MOVESTATE_1000000;
            gPlayer.layer ^= 1;
            gPlayerBodyPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            gPlayerBodyPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
            gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__80;

            if (gPlayer.character == CHARACTER_AMY) {
                m4aSongNumStart(SE_AMY_GRINDING);
            } else {
                m4aSongNumStart(SE_GRINDING);
            }

            grindTask = CreateGrindEffect();
        }

        screenX = worldX - gCamera.x;
        screenY = worldY - gCamera.y;

        if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, meX);
            TaskDestroy(gCurTask);
            return;
        }
    }
}
END_NONMATCH

void Task_GrindRailEnd(void)
{
    GrindRail *rail;
    MapEntity *me;
    u8 meX;
    u16 regionX, regionY;
    s16 worldX, worldY;
    s16 screenX, screenY;

    if (gPlayer.character == CHARACTER_TAILS || //
        gPlayer.character == CHARACTER_KNUCKLES) {
        return;
    }

    rail = TASK_DATA(gCurTask);

    me = rail->me;
    meX = TASK_GET_MEMBER(GrindRail, gCurTask, u8, meX);
    regionX = TASK_GET_MEMBER(GrindRail, gCurTask, u16, regionX);
    regionY = TASK_GET_MEMBER(GrindRail, gCurTask, u16, regionY);

    worldX = TO_WORLD_POS(meX, regionX);
    worldY = TO_WORLD_POS(me->y, regionY);

    if (PLAYER_IS_ALIVE) {
        // NOTE: The collision check does not take left/top (data[0] | data[1]) into account,
        //       because they are always placed on the left side of a rail ending.
        if ((worldX <= I(gPlayer.qWorldX)) //
            && (worldX + me->d.uData[2] * TILE_WIDTH >= I(gPlayer.qWorldX)) //
            && (worldY <= I(gPlayer.qWorldY)) //
            && (worldY + me->d.uData[3] * TILE_WIDTH >= I(gPlayer.qWorldY)) //
            && (gPlayer.moveState & MOVESTATE_1000000)) //
        {
            if (I(gPlayer.qWorldX) > worldX + ((me->d.uData[2] * TILE_WIDTH) >> 1)) {
                /* Jump off of the rail */

                gPlayer.qSpeedAirY = -Q(PLAYER_RAIL_JUMP_HEIGHT);

                if (gPlayer.character == CHARACTER_AMY) {
                    m4aSongNumStop(SE_AMY_GRINDING);
                } else {
                    m4aSongNumStop(SE_GRINDING);
                }

                m4aSongNumStart(SE_JUMP);
                Player_TransitionCancelFlyingAndBoost(&gPlayer);
                gPlayer.charState = CHARSTATE_17;
                gPlayer.moveState |= MOVESTATE_IN_AIR;
                gPlayer.moveState &= ~MOVESTATE_1000000;
                gPlayer.layer ^= 1;
                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__80;
                gPlayerBodyPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
                gPlayerBodyPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
            } else if (gInput & gPlayerControls.jump) {
                gPlayer.qSpeedAirY = -Q(PLAYER_RAIL_EXTRA_JUMP_HEIGHT);

                if (gPlayer.character == CHARACTER_AMY) {
                    m4aSongNumStop(SE_AMY_GRINDING);
                } else {
                    m4aSongNumStop(SE_GRINDING);
                }

                m4aSongNumStart(SE_JUMP);
                Player_TransitionCancelFlyingAndBoost(&gPlayer);
                gPlayer.charState = CHARSTATE_RAIL_EXTRA_JUMP;
                gPlayerBodyPSI.s.variant = 0;
                gPlayer.moveState |= MOVESTATE_IN_AIR;
                gPlayer.moveState &= ~MOVESTATE_1000000;
                gPlayer.layer ^= 1;
                gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__80;
                gPlayerBodyPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
                gPlayerBodyPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
            }
        }

        // _08023E5E
        screenX = worldX - gCamera.x;
        screenY = worldY - gCamera.y;

        if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, meX);
            TaskDestroy(gCurTask);
            return;
        }
    }
}

// Unused?
void sub_8023ED0(void)
{
    Task *t = TaskCreate(Task_8023EFC, GRINDRAIL_UNK_SIZE, 0x2000, 0, NULL);
    TASK_SET_MEMBER(GrindRailUnk, t, u16, frameCount, 0);
}

void Task_8023EFC(void)
{
    GrindRailUnk *unk = TASK_DATA(gCurTask);

    if (++unk->frameCount > 60) {
        m4aSongNumStart(SE_GRINDING);
        TaskDestroy(gCurTask);
    }
}

void CreateEntity_GrindRail_Start(MapEntity *me, u16 regionX, u16 regionY, u8 spriteY)
{
    Task *t = TaskCreate(Task_GrindRailStart, GRINDRAIL_SIZE, 0x2000, 0, NULL);

    TASK_SET_MEMBER(GrindRail, t, u16, regionX, regionX);
    TASK_SET_MEMBER(GrindRail, t, u16, regionY, regionY);
    TASK_SET_MEMBER(GrindRail, t, MapEntity *, me, me);
    TASK_SET_MEMBER(GrindRail, t, u8, meX, me->x);

    SET_MAP_ENTITY_INITIALIZED(me);
}

void CreateEntity_GrindRail_End(MapEntity *me, u16 regionX, u16 regionY, u8 spriteY)
{
    Task *t = TaskCreate(Task_GrindRailEnd, GRINDRAIL_SIZE, 0x900, 0, NULL);

    TASK_SET_MEMBER(GrindRail, t, u16, regionX, regionX);
    TASK_SET_MEMBER(GrindRail, t, u16, regionY, regionY);
    TASK_SET_MEMBER(GrindRail, t, MapEntity *, me, me);
    TASK_SET_MEMBER(GrindRail, t, u8, meX, me->x);

    SET_MAP_ENTITY_INITIALIZED(me);
}