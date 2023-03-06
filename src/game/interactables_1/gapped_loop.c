#include "global.h"
#include "core.h"
#include "task.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_1/gapped_loop.h"
#include "constants/move_states.h"
#include "sprite.h"
#include "trig.h"

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
    MapEntity *me = gappedLoop->base.me;
    u16 spriteX = gappedLoop->base.spriteX;
    u16 regionX = gappedLoop->base.regionX;
    u16 regionY = gappedLoop->base.regionY;
    s32 x = SpriteGetScreenPos(spriteX, regionX);
    s32 y = SpriteGetScreenPos(me->y, regionY);

    if (PlayerIsAlive) {
        if (x <= Q_24_8_TO_INT(gPlayer.x)
            && (x + me->d.uData[2] * 8) >= Q_24_8_TO_INT(gPlayer.x)) {
            if (y <= Q_24_8_TO_INT(gPlayer.y)
                && (y + me->d.uData[3] * 8) >= Q_24_8_TO_INT(gPlayer.y)) {
                if (y <= Q_24_8_TO_INT(gPlayer.y)
                    && (y + me->d.uData[3] * 8) >= Q_24_8_TO_INT(gPlayer.y)) {
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
        me->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

static void Task_JumpSequenceForwards(void)
{
    Sprite_GappedLoop *gappedLoop = TaskGetStructPtr(gCurTask);
    MapEntity *me = gappedLoop->base.me;
    u16 spriteX = gappedLoop->base.spriteX;
    u16 regionX = gappedLoop->base.regionX;
    u16 regionY = gappedLoop->base.regionY;
    s32 x, y;
    s8 r3;

    if (!PlayerIsAlive) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    x = SpriteGetScreenPos(spriteX, regionX);
    y = SpriteGetScreenPos(me->y, regionY);
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
        me->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

static void Task_GappedLoopReverseMain(void)
{
    Sprite_GappedLoop *gappedLoop = TaskGetStructPtr(gCurTask);
    MapEntity *me = gappedLoop->base.me;
    u16 spriteX = gappedLoop->base.spriteX;
    u16 regionX = gappedLoop->base.regionX;
    u16 regionY = gappedLoop->base.regionY;
    s32 x = SpriteGetScreenPos(spriteX, regionX);
    s32 y = SpriteGetScreenPos(me->y, regionY);
    if (PlayerIsAlive) {
        s32 base = (x + me->d.sData[0] * 8);
        if (base <= Q_24_8_TO_INT(gPlayer.x)
            && (base + me->d.uData[2] * 8) >= Q_24_8_TO_INT(gPlayer.x)) {
            if (y <= Q_24_8_TO_INT(gPlayer.y)
                && (y + me->d.uData[3] * 8) >= Q_24_8_TO_INT(gPlayer.y)) {
                if (y <= Q_24_8_TO_INT(gPlayer.y)
                    && (y + me->d.uData[3] * 8) >= Q_24_8_TO_INT(gPlayer.y)) {
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
        me->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

static void Task_JumpSequenceReverse(void)
{
    Sprite_GappedLoop *gappedLoop = TaskGetStructPtr(gCurTask);
    MapEntity *me = gappedLoop->base.me;
    u16 spriteX = gappedLoop->base.spriteX;
    u16 regionX = gappedLoop->base.regionX;
    u16 regionY = gappedLoop->base.regionY;
    s32 x, y;
    s8 r3;

    if (!PlayerIsAlive) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    x = SpriteGetScreenPos(spriteX, regionX);
    y = SpriteGetScreenPos(me->y, regionY);
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
        me->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

void initSprite_Interactable_gappedLoop_Start(MapEntity *me, u16 spriteRegionX,
                                              u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_GappedLoopForwardsMain, sizeof(Sprite_GappedLoop),
                                0x2000, 0, NULL);
    Sprite_GappedLoop *gappedLoop = TaskGetStructPtr(t);
    gappedLoop->base.regionX = spriteRegionX;
    gappedLoop->base.regionY = spriteRegionY;
    gappedLoop->base.me = me;
    gappedLoop->base.spriteX = me->x;
    SET_SPRITE_INITIALIZED(me);

    gappedLoop->unkC
        = Q_24_8(SpriteGetScreenPos(gappedLoop->base.spriteX, spriteRegionX) - 96);
    gappedLoop->unk10 = Q_24_8(SpriteGetScreenPos(me->y, spriteRegionY) + 96);
}

void initSprite_Interactable_gappedLoop_End(MapEntity *me, u16 spriteRegionX,
                                            u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_GappedLoopReverseMain, sizeof(Sprite_GappedLoop),
                                0x2000, 0, NULL);
    Sprite_GappedLoop *gappedLoop = TaskGetStructPtr(t);
    gappedLoop->base.regionX = spriteRegionX;
    gappedLoop->base.regionY = spriteRegionY;
    gappedLoop->base.me = me;
    gappedLoop->base.spriteX = me->x;
    SET_SPRITE_INITIALIZED(me);

    // BUG: not sure if these offset values are correct for the reverse
    gappedLoop->unkC
        = Q_24_8(SpriteGetScreenPos(gappedLoop->base.spriteX, spriteRegionX) + 96);
    gappedLoop->unk10 = Q_24_8(SpriteGetScreenPos(me->y, spriteRegionY) + 96);
}
