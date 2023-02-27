#include "global.h"
#include "engine/core.h"
#include "engine/task.h"
#include "game/game.h"
#include "game/interactables/interactable.h"
#include "game/interactables/gapped_loop.h"
#include "constants/move_states.h"
#include "engine/sprite.h"
#include "engine/trig.h"

typedef struct {
    SpriteBase base;
    s32 unkC;
    s32 unk10;
    s16 playerAngle;
    s16 spinSpeed;
} Sprite_GappedLoop; /* 0x18 */

static void Task_JumpSequenceForwards(void);
static void Task_JumpSequenceReverse(void);

static void Task_GappedLoopForwardsMain(void)
{
    Sprite_GappedLoop *gappedLoop = TaskGetStructPtr(gCurTask);
    Interactable *ia = gappedLoop->base.ia;
    u16 spriteX = gappedLoop->base.spriteX;
    u16 regionX = gappedLoop->base.regionX;
    u16 regionY = gappedLoop->base.regionY;
    s32 x = SpriteGetScreenPos(spriteX, regionX);
    s32 y = SpriteGetScreenPos(ia->y, regionY);

    if (PlayerIsAlive) {
        if (x <= Q_24_8_TO_INT(gPlayer.x)
            && (x + ia->d.uData[2] * 8) >= Q_24_8_TO_INT(gPlayer.x)) {
            if (y <= Q_24_8_TO_INT(gPlayer.y)
                && (y + ia->d.uData[3] * 8) >= Q_24_8_TO_INT(gPlayer.y)) {
                if (y <= Q_24_8_TO_INT(gPlayer.y)
                    && (y + ia->d.uData[3] * 8) >= Q_24_8_TO_INT(gPlayer.y)) {
                    if (gPlayer.speedGroundX > Q_24_8(3)
                        && !(gPlayer.moveState
                             & (MOVESTATE_FACING_LEFT | MOVESTATE_IN_AIR))) {
                        gCurTask->main = Task_JumpSequenceForwards;
                        gPlayer.moveState |= MOVESTATE_400000;
                        gappedLoop->playerAngle
                            = sub_8004418(Q_24_8_TO_INT(gPlayer.y - gappedLoop->unk10),
                                          Q_24_8_TO_INT(gPlayer.x - gappedLoop->unkC));
                        gappedLoop->spinSpeed = -8;
                    }
                }
            }
        }
    }
    x -= gCamera.x;
    y -= gCamera.y;
    if (IS_OUT_OF_LOOP_TRIGGER_RANGE(x, y)) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

static void Task_JumpSequenceForwards(void)
{
    Sprite_GappedLoop *gappedLoop = TaskGetStructPtr(gCurTask);
    Interactable *ia = gappedLoop->base.ia;
    u16 spriteX = gappedLoop->base.spriteX;
    u16 regionX = gappedLoop->base.regionX;
    u16 regionY = gappedLoop->base.regionY;
    s32 x, y;
    s8 r3;

    if (!PlayerIsAlive) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    x = SpriteGetScreenPos(spriteX, regionX);
    y = SpriteGetScreenPos(ia->y, regionY);
    gappedLoop->playerAngle
        = (gappedLoop->playerAngle + gappedLoop->spinSpeed) & ONE_CYCLE;
    gPlayer.unk24 += gappedLoop->spinSpeed;

    r3 = ABS(Q_24_8(3) - gappedLoop->playerAngle) >> 4;
    gPlayer.y = gappedLoop->unk10
        + Q_2_14_TO_Q_24_8(SIN(gappedLoop->playerAngle) * (r3 + 135));
    gPlayer.x = gappedLoop->unkC + Q_2_14_TO_Q_24_8(COS(gappedLoop->playerAngle) * 135);

    x -= gCamera.x;
    y -= gCamera.y;

    // Landed
    if (gappedLoop->playerAngle < 587) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        gCurTask->main = Task_GappedLoopForwardsMain;
    }

    if (IS_OUT_OF_LOOP_TRIGGER_RANGE(x, y)) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

static void Task_GappedLoopReverseMain(void)
{
    Sprite_GappedLoop *gappedLoop = TaskGetStructPtr(gCurTask);
    Interactable *ia = gappedLoop->base.ia;
    u16 spriteX = gappedLoop->base.spriteX;
    u16 regionX = gappedLoop->base.regionX;
    u16 regionY = gappedLoop->base.regionY;
    s32 x = SpriteGetScreenPos(spriteX, regionX);
    s32 y = SpriteGetScreenPos(ia->y, regionY);
    if (PlayerIsAlive) {
        s32 base = (x + ia->d.sData[0] * 8);
        if (base <= Q_24_8_TO_INT(gPlayer.x)
            && (base + ia->d.uData[2] * 8) >= Q_24_8_TO_INT(gPlayer.x)) {
            if (y <= Q_24_8_TO_INT(gPlayer.y)
                && (y + ia->d.uData[3] * 8) >= Q_24_8_TO_INT(gPlayer.y)) {
                if (y <= Q_24_8_TO_INT(gPlayer.y)
                    && (y + ia->d.uData[3] * 8) >= Q_24_8_TO_INT(gPlayer.y)) {
                    if (gPlayer.speedGroundX < -Q_24_8(3)
                        && (gPlayer.moveState & MOVESTATE_FACING_LEFT)
                        && !(gPlayer.moveState & MOVESTATE_IN_AIR)) {
                        gCurTask->main = Task_JumpSequenceReverse;
                        gPlayer.moveState |= MOVESTATE_400000;
                        gappedLoop->playerAngle
                            = sub_8004418(Q_24_8_TO_INT(gPlayer.y - gappedLoop->unk10),
                                          Q_24_8_TO_INT(gPlayer.x - gappedLoop->unkC));
                        gappedLoop->spinSpeed = 8;
                    }
                }
            }
        }
    }
    x -= gCamera.x;
    y -= gCamera.y;
    if (IS_OUT_OF_LOOP_TRIGGER_RANGE(x, y)) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

static void Task_JumpSequenceReverse(void)
{
    Sprite_GappedLoop *gappedLoop = TaskGetStructPtr(gCurTask);
    Interactable *ia = gappedLoop->base.ia;
    u16 spriteX = gappedLoop->base.spriteX;
    u16 regionX = gappedLoop->base.regionX;
    u16 regionY = gappedLoop->base.regionY;
    s32 x, y;
    s8 r3;

    if (!PlayerIsAlive) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    x = SpriteGetScreenPos(spriteX, regionX);
    y = SpriteGetScreenPos(ia->y, regionY);
    gappedLoop->playerAngle
        = (gappedLoop->playerAngle + gappedLoop->spinSpeed) & ONE_CYCLE;
    gPlayer.unk24 += gappedLoop->spinSpeed;

    r3 = ABS(Q_24_8(3) - gappedLoop->playerAngle) >> 4;
    gPlayer.y = gappedLoop->unk10
        + Q_2_14_TO_Q_24_8(SIN(gappedLoop->playerAngle) * (r3 + 135));
    gPlayer.x = gappedLoop->unkC + Q_2_14_TO_Q_24_8(COS(gappedLoop->playerAngle) * 135);

    x -= gCamera.x;
    y -= gCamera.y;

    if (gappedLoop->playerAngle > 950) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        gCurTask->main = Task_GappedLoopReverseMain;
    }

    if (IS_OUT_OF_LOOP_TRIGGER_RANGE(x, y)) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

void initSprite_Interactable_gappedLoop_Start(Interactable *ia, u16 spriteRegionX,
                                              u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_GappedLoopForwardsMain, sizeof(Sprite_GappedLoop),
                                0x2000, 0, NULL);
    Sprite_GappedLoop *gappedLoop = TaskGetStructPtr(t);
    gappedLoop->base.regionX = spriteRegionX;
    gappedLoop->base.regionY = spriteRegionY;
    gappedLoop->base.ia = ia;
    gappedLoop->base.spriteX = ia->x;
    SET_SPRITE_INITIALIZED(ia);

    gappedLoop->unkC
        = Q_24_8(SpriteGetScreenPos(gappedLoop->base.spriteX, spriteRegionX) - 96);
    gappedLoop->unk10 = Q_24_8(SpriteGetScreenPos(ia->y, spriteRegionY) + 96);
}

void initSprite_Interactable_gappedLoop_End(Interactable *ia, u16 spriteRegionX,
                                            u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_GappedLoopReverseMain, sizeof(Sprite_GappedLoop),
                                0x2000, 0, NULL);
    Sprite_GappedLoop *gappedLoop = TaskGetStructPtr(t);
    gappedLoop->base.regionX = spriteRegionX;
    gappedLoop->base.regionY = spriteRegionY;
    gappedLoop->base.ia = ia;
    gappedLoop->base.spriteX = ia->x;
    SET_SPRITE_INITIALIZED(ia);

    // BUG: not sure if these offset values are correct for the reverse
    gappedLoop->unkC
        = Q_24_8(SpriteGetScreenPos(gappedLoop->base.spriteX, spriteRegionX) + 96);
    gappedLoop->unk10 = Q_24_8(SpriteGetScreenPos(ia->y, spriteRegionY) + 96);
}
