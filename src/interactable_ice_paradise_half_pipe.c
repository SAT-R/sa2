#include "global.h"
#include "main.h"
#include "game.h"
#include "task.h"
#include "interactable.h"
#include "interactable_ice_paradise_half_pipe.h"
#include "trig.h"

typedef struct {
    s32 x;
    s32 y;
    s32 basePlayerY;
    s16 offsetX;
    s16 offsetY;
    s16 width;
    s16 height;
    u16 direction;
    Interactable *ia;
    s8 spriteX;
    s8 spriteY;
} Sprite_IceParadiseHalfPipe;

static void Task_HalfPipeMain(void);
static void TaskDestructor_InteractableIceParadiseHalfPipe(struct Task *);
static bool32 sub_80789AC(Sprite_IceParadiseHalfPipe *);
static void UpdatePlayerPosOnHalfPipe(Sprite_IceParadiseHalfPipe *, u16);
static void EndHalfPipeSequence(Sprite_IceParadiseHalfPipe *);
static bool32 ShouldTriggerHalfPipe(Sprite_IceParadiseHalfPipe *);
static void StartHalfPipeSequence(Sprite_IceParadiseHalfPipe *);
static bool32 ShouldDespawn(Sprite_IceParadiseHalfPipe *);
static void DestroyHalfPipe(Sprite_IceParadiseHalfPipe *);

#define HALF_PIPE_DIRECTION_FORWARD 0
#define HALF_PIPE_DIRECTION_REVERSE 1

static void initSprite_Interactable_IceParadise_HalfPipe(Interactable *ia,
                                                         u16 spriteRegionX,
                                                         u16 spriteRegionY, u8 spriteY,
                                                         s32 direction)
{
    struct Task *t
        = TaskCreate(Task_HalfPipeMain, sizeof(Sprite_IceParadiseHalfPipe), 0x2010, 0,
                     TaskDestructor_InteractableIceParadiseHalfPipe);
    Sprite_IceParadiseHalfPipe *halfPipe = TaskGetStructPtr(t);
    halfPipe->direction = direction;
    halfPipe->x = Q_24_8(spriteRegionX) + ia->x * TILE_WIDTH;
    halfPipe->y = Q_24_8(spriteRegionY) + ia->y * TILE_WIDTH;
    halfPipe->offsetX = ia->d.sData[0] * TILE_WIDTH;
    halfPipe->offsetY = ia->d.sData[1] * TILE_WIDTH;
    halfPipe->width = ia->d.uData[2] * TILE_WIDTH + halfPipe->offsetX;
    halfPipe->height = ia->d.uData[3] * TILE_WIDTH + halfPipe->offsetY;
    halfPipe->ia = ia;
    halfPipe->spriteX = ia->x;
    halfPipe->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);
}

static void Task_HalfPipeSequenceMain(void)
{
    Sprite_IceParadiseHalfPipe *halfPipe = TaskGetStructPtr(gCurTask);
    if (!PlayerIsAlive) {
        gPlayer.moveState &= ~MOVESTATE_8000;
        EndHalfPipeSequence(halfPipe);
        return;
    }

    if (!sub_80789AC(halfPipe)) {
        gPlayer.moveState &= ~MOVESTATE_8000;
        if (gPlayer.unk64 >= 59 && gPlayer.unk64 < 62) {
            gPlayer.unk64 = 9;
        }
        EndHalfPipeSequence(halfPipe);
    } else {
        u16 posWithinHalfPipe;
        gPlayer.moveState |= MOVESTATE_8000;
        posWithinHalfPipe = halfPipe->direction == HALF_PIPE_DIRECTION_FORWARD
            ? Q_24_8_TO_INT(gPlayer.x) - (halfPipe->x + halfPipe->offsetX)
            : (halfPipe->x + halfPipe->width) - Q_24_8_TO_INT(gPlayer.x);
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
        register s16 temp asm("r0") = abs(gPlayer.speedAirX);
        temp = temp << 0x10 >> 0x10;
        airSpeed = temp;
        if (temp > Q_24_8(10)) {
            airSpeed = Q_24_8(10);
        }
    }

    temp2 = (airSpeed << 8) / Q_24_8(10);
    height = halfPipe->height;
    height -= halfPipe->offsetY;
    r3 = (height - 16) >> 1;

    sin = (r3 * SIN_24_8(temp4));
    sin += Q_24_8(r3);
    sin = Q_24_8_TO_INT(sin * temp2);

    gPlayer.y = halfPipe->basePlayerY - sin;
    gPlayer.speedAirY = 0;
    gPlayer.moveState &= ~MOVESTATE_IN_AIR;

    if (!(gPlayer.moveState & MOVESTATE_4)) {
        r3 = sin / (halfPipe->height - halfPipe->offsetY);

        if (r3 < 32) {
            gPlayer.unk64 = 9;
        } else if (r3 < 96) {
            gPlayer.unk64 = 59;
        } else if (r3 < 160) {
            gPlayer.unk64 = 60;
        } else {
            gPlayer.unk64 = 61;
        }
    }
}

static bool32 PlayerWithinHalfPipe(Sprite_IceParadiseHalfPipe *halfPipe)
{
    s16 posX = halfPipe->x - gCamera.x;
    s16 posY = halfPipe->y - gCamera.y;
    s16 playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    s16 playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

    if ((posX + halfPipe->offsetX) <= playerX
        && (posX + halfPipe->offsetX) + (halfPipe->width - halfPipe->offsetX)
            >= playerX) {
        if (posY + halfPipe->offsetY <= playerY
            && (posY + halfPipe->offsetY) + (halfPipe->height - halfPipe->offsetY)
                >= playerY) {
            return TRUE;
        }
    }

    return FALSE;
}

static void Task_HalfPipeMain(void)
{
    Sprite_IceParadiseHalfPipe *halfPipe = TaskGetStructPtr(gCurTask);

    if (ShouldTriggerHalfPipe(halfPipe)) {
        StartHalfPipeSequence(halfPipe);
    }

    if (ShouldDespawn(halfPipe)) {
        DestroyHalfPipe(halfPipe);
    }
}

static void TaskDestructor_InteractableIceParadiseHalfPipe(struct Task *t)
{
    // unused
}

static void StartHalfPipeSequence(Sprite_IceParadiseHalfPipe *halfPipe)
{
    halfPipe->basePlayerY = gPlayer.y;
    gCurTask->main = Task_HalfPipeSequenceMain;
}

static void EndHalfPipeSequence(Sprite_IceParadiseHalfPipe *halfPipe)
{
    gCurTask->main = Task_HalfPipeMain;
}

static bool32 sub_80789AC(Sprite_IceParadiseHalfPipe *halfPipe)
{
    if (gPlayer.speedAirX <= -Q_24_8(2) || gPlayer.speedAirX >= Q_24_8(2.25)) {
        if (gPlayer.unk5E & gPlayerControls.jump) {
            gPlayer.unk6D = 3;
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

    if (x + halfPipe->width < -128 || x + halfPipe->offsetX > 368
        || y + halfPipe->height < -128 || y + halfPipe->offsetY > 288) {
        return TRUE;
    }
    return FALSE;
}

static bool32 ShouldTriggerHalfPipe(Sprite_IceParadiseHalfPipe *halfPipe)
{
    if (!PlayerIsAlive) {
        return FALSE;
    }

    if (gPlayer.moveState & MOVESTATE_IN_AIR) {
        return FALSE;
    }

    if (gPlayer.unk64 != 4 && gPlayer.unk64 != 9) {
        return FALSE;
    }

    switch (halfPipe->direction) {
        case HALF_PIPE_DIRECTION_FORWARD:
            if (gPlayer.speedAirX < Q_24_8(2.25)) {
                return FALSE;
            }
            break;
        case HALF_PIPE_DIRECTION_REVERSE:
            if (gPlayer.speedAirX > -Q_24_8(2.25)) {
                return FALSE;
            }
            break;
    }

    return PlayerWithinHalfPipe(halfPipe);
}

static void DestroyHalfPipe(Sprite_IceParadiseHalfPipe *halfPipe)
{
    halfPipe->ia->x = halfPipe->spriteX;
    TaskDestroy(gCurTask);
}

void initSprite_Interactable_IceParadise_HalfPipe_End(Interactable *ia,
                                                      u16 spriteRegionX,
                                                      u16 spriteRegionY, u8 spriteY)
{
    initSprite_Interactable_IceParadise_HalfPipe(ia, spriteRegionX, spriteRegionY,
                                                 spriteY, HALF_PIPE_DIRECTION_REVERSE);
}

void initSprite_Interactable_IceParadise_HalfPipe_Start(Interactable *ia,
                                                        u16 spriteRegionX,
                                                        u16 spriteRegionY, u8 spriteY)
{
    initSprite_Interactable_IceParadise_HalfPipe(ia, spriteRegionX, spriteRegionY,
                                                 spriteY, HALF_PIPE_DIRECTION_FORWARD);
}
