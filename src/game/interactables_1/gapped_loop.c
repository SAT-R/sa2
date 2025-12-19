#include "global.h"
#include "core.h"
#include "task.h"
#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_1/gapped_loop.h"
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
    Sprite_GappedLoop *gappedLoop = TASK_DATA(gCurTask);
    MapEntity *me = gappedLoop->base.me;
    u16 spriteX = gappedLoop->base.meX;
    u16 regionX = gappedLoop->base.regionX;
    u16 regionY = gappedLoop->base.regionY;
    s32 x = TO_WORLD_POS(spriteX, regionX);
    s32 y = TO_WORLD_POS(me->y, regionY);

    if (PLAYER_IS_ALIVE) {
        if (x <= I(gPlayer.qWorldX) && (x + me->d.uData[2] * 8) >= I(gPlayer.qWorldX)) {
            if (y <= I(gPlayer.qWorldY) && (y + me->d.uData[3] * 8) >= I(gPlayer.qWorldY)) {
                if (y <= I(gPlayer.qWorldY) && (y + me->d.uData[3] * 8) >= I(gPlayer.qWorldY)) {
                    if (gPlayer.qSpeedGround > Q(3) && !(gPlayer.moveState & (MOVESTATE_FACING_LEFT | MOVESTATE_IN_AIR))) {
                        gCurTask->main = Task_JumpSequenceForwards;
                        gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
                        gappedLoop->playerAngle
                            = sub_8004418(I(gPlayer.qWorldY - gappedLoop->unk10), I(gPlayer.qWorldX - gappedLoop->unkC));
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
    Sprite_GappedLoop *gappedLoop = TASK_DATA(gCurTask);
    MapEntity *me = gappedLoop->base.me;
    u16 spriteX = gappedLoop->base.meX;
    u16 regionX = gappedLoop->base.regionX;
    u16 regionY = gappedLoop->base.regionY;
    s32 x, y;
    s8 r3;

    if (!PLAYER_IS_ALIVE) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    x = TO_WORLD_POS(spriteX, regionX);
    y = TO_WORLD_POS(me->y, regionY);
    gappedLoop->playerAngle = (gappedLoop->playerAngle + gappedLoop->spinSpeed) & ONE_CYCLE;
    gPlayer.rotation += gappedLoop->spinSpeed;

    r3 = ABS(Q(3) - gappedLoop->playerAngle) >> 4;
    gPlayer.qWorldY = gappedLoop->unk10 + Q_2_14_TO_Q_24_8(SIN(gappedLoop->playerAngle) * (r3 + 135));
    gPlayer.qWorldX = gappedLoop->unkC + Q_2_14_TO_Q_24_8(COS(gappedLoop->playerAngle) * 135);

    x -= gCamera.x;
    y -= gCamera.y;

    // Landed
    if (gappedLoop->playerAngle < 587) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gCurTask->main = Task_GappedLoopForwardsMain;
    }

    if (IS_OUT_OF_LOOP_TRIGGER_RANGE(x, y)) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

static void Task_GappedLoopReverseMain(void)
{
    Sprite_GappedLoop *gappedLoop = TASK_DATA(gCurTask);
    MapEntity *me = gappedLoop->base.me;
    u16 spriteX = gappedLoop->base.meX;
    u16 regionX = gappedLoop->base.regionX;
    u16 regionY = gappedLoop->base.regionY;
    s32 x = TO_WORLD_POS(spriteX, regionX);
    s32 y = TO_WORLD_POS(me->y, regionY);
    if (PLAYER_IS_ALIVE) {
        s32 base = (x + me->d.sData[0] * 8);
        if (base <= I(gPlayer.qWorldX) && (base + me->d.uData[2] * 8) >= I(gPlayer.qWorldX)) {
            if (y <= I(gPlayer.qWorldY) && (y + me->d.uData[3] * 8) >= I(gPlayer.qWorldY)) {
                if (y <= I(gPlayer.qWorldY) && (y + me->d.uData[3] * 8) >= I(gPlayer.qWorldY)) {
                    if (gPlayer.qSpeedGround < -Q(3) && (gPlayer.moveState & MOVESTATE_FACING_LEFT)
                        && !(gPlayer.moveState & MOVESTATE_IN_AIR)) {
                        gCurTask->main = Task_JumpSequenceReverse;
                        gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
                        gappedLoop->playerAngle
                            = sub_8004418(I(gPlayer.qWorldY - gappedLoop->unk10), I(gPlayer.qWorldX - gappedLoop->unkC));
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
    Sprite_GappedLoop *gappedLoop = TASK_DATA(gCurTask);
    MapEntity *me = gappedLoop->base.me;
    u16 spriteX = gappedLoop->base.meX;
    u16 regionX = gappedLoop->base.regionX;
    u16 regionY = gappedLoop->base.regionY;
    s32 x, y;
    s8 r3;

    if (!PLAYER_IS_ALIVE) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    x = TO_WORLD_POS(spriteX, regionX);
    y = TO_WORLD_POS(me->y, regionY);
    gappedLoop->playerAngle = (gappedLoop->playerAngle + gappedLoop->spinSpeed) & ONE_CYCLE;
    gPlayer.rotation += gappedLoop->spinSpeed;

    r3 = ABS(Q(3) - gappedLoop->playerAngle) >> 4;
    gPlayer.qWorldY = gappedLoop->unk10 + Q_2_14_TO_Q_24_8(SIN(gappedLoop->playerAngle) * (r3 + 135));
    gPlayer.qWorldX = gappedLoop->unkC + Q_2_14_TO_Q_24_8(COS(gappedLoop->playerAngle) * 135);

    x -= gCamera.x;
    y -= gCamera.y;

    if (gappedLoop->playerAngle > 950) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gCurTask->main = Task_GappedLoopReverseMain;
    }

    if (IS_OUT_OF_LOOP_TRIGGER_RANGE(x, y)) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

void CreateEntity_GappedLoop_Start(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_GappedLoopForwardsMain, sizeof(Sprite_GappedLoop), 0x2000, 0, NULL);
    Sprite_GappedLoop *gappedLoop = TASK_DATA(t);
    gappedLoop->base.regionX = spriteRegionX;
    gappedLoop->base.regionY = spriteRegionY;
    gappedLoop->base.me = me;
    gappedLoop->base.meX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);

    gappedLoop->unkC = Q(TO_WORLD_POS(gappedLoop->base.meX, spriteRegionX) - 96);
    gappedLoop->unk10 = Q(TO_WORLD_POS(me->y, spriteRegionY) + 96);
}

void CreateEntity_GappedLoop_End(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_GappedLoopReverseMain, sizeof(Sprite_GappedLoop), 0x2000, 0, NULL);
    Sprite_GappedLoop *gappedLoop = TASK_DATA(t);
    gappedLoop->base.regionX = spriteRegionX;
    gappedLoop->base.regionY = spriteRegionY;
    gappedLoop->base.me = me;
    gappedLoop->base.meX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);

    // BUG: not sure if these offset values are correct for the reverse
    gappedLoop->unkC = Q(TO_WORLD_POS(gappedLoop->base.meX, spriteRegionX) + 96);
    gappedLoop->unk10 = Q(TO_WORLD_POS(me->y, spriteRegionY) + 96);
}
