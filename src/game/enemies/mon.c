#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/entity.h"
#include "game/enemies/mon.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/animations.h"

// TODO: Name the tasks accordingly

static void Task_MonMain(void);
static void Task_Mon_2(void);
static void Task_Mon_3(void);
static void Task_Mon_4(void);

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 x;
    /* 0x40 */ s32 y;
    /* 0x44 */ s32 offsetY;
    /* 0x48 */ s32 speedY;
} Sprite_Mon; /* 0x4C */

void CreateEntity_Mon(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    u32 r2;
    struct Task *t = TaskCreate(Task_MonMain, sizeof(Sprite_Mon), 0x4010, 0, TaskDestructor_80095E8);
    Sprite_Mon *mon = TASK_DATA(t);
    Sprite *s = &mon->s;
    mon->base.regionX = spriteRegionX;
    mon->base.regionY = spriteRegionY;
    mon->base.me = me;
    mon->base.spriteX = me->x;
    mon->base.id = spriteY;

    // TODO: Isn't this always -1?
    r2 = (-me->d.sData[0] | me->d.sData[0]);

    mon->x = Q(TO_WORLD_POS(me->x, spriteRegionX));
    mon->y = Q(TO_WORLD_POS(me->y, spriteRegionY));

    mon->y += Q(sub_801F07C(I(mon->y), I(mon->x), r2 >> 31, 8, NULL, sub_801EE64));

    s->x = 0;
    s->y = 0;
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(25);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    mon->speedY = -Q(5.5);
    mon->offsetY = +Q(0);
    s->graphics.anim = SA2_ANIM_MON;
    s->variant = 0;
    s->prevVariant = -1;
}

static void Task_MonMain(void)
{
    Sprite_Mon *mon = TASK_DATA(gCurTask);
    Sprite *s = &mon->s;
    MapEntity *me = mon->base.me;

    s->x = I(mon->x) - gCamera.x;
    s->y = I(mon->y) - gCamera.y;

    if (Enemy_PlayerAttackCollision(s, I(mon->x), I(mon->y), 0)) {
        TaskDestroy(gCurTask);
        return;
    } else if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mon->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    } else {
        if ((gPlayer.qWorldX > mon->x - Q(DISPLAY_WIDTH / 2)) && (gPlayer.qWorldX < mon->x + Q(DISPLAY_WIDTH / 2))
            && (gPlayer.qWorldY > mon->y - Q(50)) && (gPlayer.qWorldY < mon->y + Q(50))) {
            gCurTask->main = Task_Mon_2;
            s->graphics.anim = SA2_ANIM_MON;
            s->variant = 2;
            s->prevVariant = -1;
        }

        ENEMY_TURN_TO_PLAYER(mon->x, s);

        ENEMY_UPDATE_EX_RAW(s, mon->x, mon->y, {});
    }
}

static void Task_Mon_2(void)
{
    Sprite_Mon *mon = TASK_DATA(gCurTask);
    Sprite *s = &mon->s;
    MapEntity *me = mon->base.me;

    s->x = I(mon->x) - gCamera.x;
    s->y = I(mon->y) - gCamera.y;

    if (Enemy_PlayerAttackCollision(s, I(mon->x), I(mon->y), 0)) {
        TaskDestroy(gCurTask);
        return;
    } else if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mon->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    } else {
        Player_UpdateHomingPosition(mon->x, mon->y);
        if (UpdateSpriteAnimation(s) == 0) {
            mon->speedY = -Q(5.5);
            mon->offsetY = +Q(0.0);
            s->graphics.anim = SA2_ANIM_MON;
            s->variant = 1;
            s->prevVariant = -1;

            gCurTask->main = Task_Mon_3;
        }
        DisplaySprite(s);
    }
}

static void Task_Mon_3(void)
{
    Sprite_Mon *mon = TASK_DATA(gCurTask);
    Sprite *s = &mon->s;
    MapEntity *me = mon->base.me;

    mon->speedY += Q(52. / 256.);
    mon->offsetY += mon->speedY;

    s->x = I(mon->x) - gCamera.x;
    s->y = I(mon->y + mon->offsetY) - gCamera.y;

    if (Enemy_PlayerAttackCollision(s, I(mon->x), I(mon->y + mon->offsetY), 0)) {
        TaskDestroy(gCurTask);
        return;
    } else if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mon->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    } else {
        if (mon->offsetY >= 0) {
            s->graphics.anim = SA2_ANIM_MON;
            s->variant = 3;
            s->prevVariant = -1;

            gCurTask->main = Task_Mon_4;
        }

        ENEMY_UPDATE_EX_RAW(s, mon->x, mon->y + mon->offsetY, {});
    }
}

static void Task_Mon_4(void)
{
    Sprite_Mon *mon = TASK_DATA(gCurTask);
    Sprite *s = &mon->s;
    MapEntity *me = mon->base.me;

    s->x = I(mon->x) - gCamera.x;
    s->y = I(mon->y) - gCamera.y;

    if (Enemy_PlayerAttackCollision(s, I(mon->x), I(mon->y), 0)) {
        TaskDestroy(gCurTask);
        return;
    } else if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mon->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    } else {
        Player_UpdateHomingPosition(mon->x, mon->y);

        if (UpdateSpriteAnimation(s) == 0) {
            if ((gPlayer.qWorldX > mon->x - Q(DISPLAY_WIDTH / 2)) && (gPlayer.qWorldX < mon->x + Q(DISPLAY_WIDTH / 2))
                && (gPlayer.qWorldY > mon->y - Q(50)) && (gPlayer.qWorldY < mon->y + Q(50))) {

                ENEMY_TURN_TO_PLAYER(mon->x, s);

                s->graphics.anim = SA2_ANIM_MON;
                s->variant = 2;
                s->prevVariant = -1;

                gCurTask->main = Task_Mon_2;
            } else {
                s->graphics.anim = SA2_ANIM_MON;
                s->variant = 0;
                s->prevVariant = -1;

                gCurTask->main = Task_MonMain;
            }
        }
        DisplaySprite(s);
    }
}
