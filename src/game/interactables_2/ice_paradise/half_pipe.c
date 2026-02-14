#include <stdlib.h> // abs

#include "global.h"
#include "core.h"
#include "task.h"
#include "trig.h"
#include "game/entity.h"
#include "game/stage/player_controls.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/ice_paradise/half_pipe.h"

#include "constants/char_states.h"
#include "constants/player_transitions.h"

typedef struct {
    s32 x;
    s32 y;
    s32 basePlayerY;
    s16 offsetX;
    s16 offsetY;
    s16 width;
    s16 height;
    u16 direction;
    MapEntity *me;
    s8 spriteX;
    s8 spriteY;
} Sprite_IceParadiseHalfPipe;

static void Task_HalfPipeMain(void);
static void TaskDestructor_HalfPipe(struct Task *);
static bool32 sub_80789AC(Sprite_IceParadiseHalfPipe *);
static void UpdatePlayerPosOnHalfPipe(Sprite_IceParadiseHalfPipe *, u16);
static void EndHalfPipeSequence(Sprite_IceParadiseHalfPipe *);
static bool32 ShouldTriggerHalfPipe(Sprite_IceParadiseHalfPipe *);
static void StartHalfPipeSequence(Sprite_IceParadiseHalfPipe *);
static bool32 ShouldDespawn(Sprite_IceParadiseHalfPipe *);
static void DestroyHalfPipe(Sprite_IceParadiseHalfPipe *);

#define HALF_PIPE_DIRECTION_FORWARD 0
#define HALF_PIPE_DIRECTION_REVERSE 1

static void CreateEntity_HalfPipe(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY, s32 direction)
{
    struct Task *t = TaskCreate(Task_HalfPipeMain, sizeof(Sprite_IceParadiseHalfPipe), 0x2010, 0, TaskDestructor_HalfPipe);
    Sprite_IceParadiseHalfPipe *halfPipe = TASK_DATA(t);
    halfPipe->direction = direction;
    halfPipe->x = Q(spriteRegionX) + me->x * TILE_WIDTH;
    halfPipe->y = Q(spriteRegionY) + me->y * TILE_WIDTH;
    halfPipe->offsetX = me->d.sData[0] * TILE_WIDTH;
    halfPipe->offsetY = me->d.sData[1] * TILE_WIDTH;
    halfPipe->width = me->d.uData[2] * TILE_WIDTH + halfPipe->offsetX;
    halfPipe->height = me->d.uData[3] * TILE_WIDTH + halfPipe->offsetY;
    halfPipe->me = me;
    halfPipe->spriteX = me->x;
    halfPipe->spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void Task_HalfPipeSequenceMain(void)
{
    Sprite_IceParadiseHalfPipe *halfPipe = TASK_DATA(gCurTask);
    if (!PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_8000;
        EndHalfPipeSequence(halfPipe);
        return;
    }

    if (!sub_80789AC(halfPipe)) {
        gPlayer.moveState &= ~MOVESTATE_8000;
        if (gPlayer.charState == CHARSTATE_WALLRUN_INIT || gPlayer.charState == CHARSTATE_WALLRUN_TO_WALL
            || gPlayer.charState == CHARSTATE_WALLRUN_ON_WALL) {
            gPlayer.charState = CHARSTATE_WALK_A;
        }
        EndHalfPipeSequence(halfPipe);
    } else {
        u16 posWithinHalfPipe;
        gPlayer.moveState |= MOVESTATE_8000;
        posWithinHalfPipe = halfPipe->direction == HALF_PIPE_DIRECTION_FORWARD ? I(gPlayer.qWorldX) - (halfPipe->x + halfPipe->offsetX)
                                                                               : (halfPipe->x + halfPipe->width) - I(gPlayer.qWorldX);
        UpdatePlayerPosOnHalfPipe(halfPipe, posWithinHalfPipe);
    }
}

static void UpdatePlayerPosOnHalfPipe(Sprite_IceParadiseHalfPipe *halfPipe, u16 playerX)
{
    s32 height, r3, sin;
    s16 airSpeed, temp2, temp4;

    temp4 = (playerX * (ONE_CYCLE + 1)) / (halfPipe->width - halfPipe->offsetX);
    temp4 = (CLAMP_16(temp4, 0, ONE_CYCLE + 1) + 768) & ONE_CYCLE;

    {
#ifndef NON_MATCHING
        register s16 temp asm("r0") = abs(gPlayer.qSpeedAirX);
#else
        s16 temp = abs(gPlayer.qSpeedAirX);
#endif
        temp = temp << 0x10 >> 0x10;
        airSpeed = temp;
        if (temp > Q(10)) {
            airSpeed = Q(10);
        }
    }

    temp2 = (airSpeed << 8) / Q(10);
    height = halfPipe->height;
    height -= halfPipe->offsetY;
    r3 = (height - 16) >> 1;

    sin = (r3 * SIN_24_8(temp4));
    sin += Q(r3);
    sin = I(sin * temp2);

    gPlayer.qWorldY = halfPipe->basePlayerY - sin;
    gPlayer.qSpeedAirY = 0;
    gPlayer.moveState &= ~MOVESTATE_IN_AIR;

    if (!(gPlayer.moveState & MOVESTATE_SPIN_ATTACK)) {
        r3 = sin / (halfPipe->height - halfPipe->offsetY);

        if (r3 < 32) {
            gPlayer.charState = CHARSTATE_WALK_A;
        } else if (r3 < 96) {
            gPlayer.charState = CHARSTATE_WALLRUN_INIT;
        } else if (r3 < 160) {
            gPlayer.charState = CHARSTATE_WALLRUN_TO_WALL;
        } else {
            gPlayer.charState = CHARSTATE_WALLRUN_ON_WALL;
        }
    }
}

static bool32 PlayerWithinHalfPipe(Sprite_IceParadiseHalfPipe *halfPipe)
{
    s16 posX = halfPipe->x - gCamera.x;
    s16 posY = halfPipe->y - gCamera.y;
    s16 playerX = I(gPlayer.qWorldX) - gCamera.x;
    s16 playerY = I(gPlayer.qWorldY) - gCamera.y;

    if ((posX + halfPipe->offsetX) <= playerX && (posX + halfPipe->offsetX) + (halfPipe->width - halfPipe->offsetX) >= playerX) {
        if (posY + halfPipe->offsetY <= playerY && (posY + halfPipe->offsetY) + (halfPipe->height - halfPipe->offsetY) >= playerY) {
            return TRUE;
        }
    }

    return FALSE;
}

static void Task_HalfPipeMain(void)
{
    Sprite_IceParadiseHalfPipe *halfPipe = TASK_DATA(gCurTask);

    if (ShouldTriggerHalfPipe(halfPipe)) {
        StartHalfPipeSequence(halfPipe);
    }

    if (ShouldDespawn(halfPipe)) {
        DestroyHalfPipe(halfPipe);
    }
}

static void TaskDestructor_HalfPipe(struct Task *t)
{
    // unused
}

static void StartHalfPipeSequence(Sprite_IceParadiseHalfPipe *halfPipe)
{
    halfPipe->basePlayerY = gPlayer.qWorldY;
    gCurTask->main = Task_HalfPipeSequenceMain;
}

static void EndHalfPipeSequence(Sprite_IceParadiseHalfPipe *halfPipe) { gCurTask->main = Task_HalfPipeMain; }

static bool32 sub_80789AC(Sprite_IceParadiseHalfPipe *halfPipe)
{
    if (gPlayer.qSpeedAirX <= -Q(2) || gPlayer.qSpeedAirX >= Q(2.25)) {
        if (gPlayer.frameInput & gPlayerControls.jump) {
            gPlayer.transition = PLTRANS_INIT_JUMP;
        } else {
            return PlayerWithinHalfPipe(halfPipe);
        }
    }
    return FALSE;
}

static bool32 ShouldDespawn(Sprite_IceParadiseHalfPipe *halfPipe)
{
    s16 x = halfPipe->x - gCamera.x;
    s16 y = halfPipe->y - gCamera.y;

    if (x + halfPipe->width < -128 || x + halfPipe->offsetX > (DISPLAY_WIDTH + 128) || y + halfPipe->height < -128
        || y + halfPipe->offsetY > (DISPLAY_HEIGHT + 128)) {
        return TRUE;
    }
    return FALSE;
}

static bool32 ShouldTriggerHalfPipe(Sprite_IceParadiseHalfPipe *halfPipe)
{
    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    }

    if (gPlayer.moveState & MOVESTATE_IN_AIR) {
        return FALSE;
    }

    if (gPlayer.charState != CHARSTATE_SPIN_ATTACK && gPlayer.charState != CHARSTATE_WALK_A) {
        return FALSE;
    }

    switch (halfPipe->direction) {
        case HALF_PIPE_DIRECTION_FORWARD:
            if (gPlayer.qSpeedAirX < Q(2.25)) {
                return FALSE;
            }
            break;
        case HALF_PIPE_DIRECTION_REVERSE:
            if (gPlayer.qSpeedAirX > -Q(2.25)) {
                return FALSE;
            }
            break;
    }

    return PlayerWithinHalfPipe(halfPipe);
}

static void DestroyHalfPipe(Sprite_IceParadiseHalfPipe *halfPipe)
{
    halfPipe->me->x = halfPipe->spriteX;
    TaskDestroy(gCurTask);
}

void CreateEntity_HalfPipe_End(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_HalfPipe(me, spriteRegionX, spriteRegionY, spriteY, HALF_PIPE_DIRECTION_REVERSE);
}

void CreateEntity_HalfPipe_Start(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_HalfPipe(me, spriteRegionX, spriteRegionY, spriteY, HALF_PIPE_DIRECTION_FORWARD);
}
