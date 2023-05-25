#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "game/entity.h"
#include "game/enemies/mon.h"
#include "game/stage_entities_manager.h"

#include "constants/animations.h"

// TODO: Name the tasks accordingly

static void Task_Enemy_Mon_Main(void);
static void Task_Enemy_Mon_2(void);
static void Task_Enemy_Mon_3(void);
static void Task_Enemy_Mon_4(void);

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 x;
    /* 0x40 */ s32 y;
    /* 0x44 */ s32 deltaY;
    /* 0x48 */ s32 speedY;
} Sprite_Mon; /* 0x4C */

void CreateEntity_Mon(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Enemy_Mon_Main, sizeof(Sprite_Mon), 0x4010, 0,
                                TaskDestructor_80095E8);
    Sprite_Mon *mon = TaskGetStructPtr(t);
    Sprite *s = &mon->s;
    u32 r2;

    mon->base.regionX = spriteRegionX;
    mon->base.regionY = spriteRegionY;
    mon->base.me = me;
    mon->base.spriteX = me->x;
    mon->base.spriteY = spriteY;

    // TODO: Isn't this always -1?
    r2 = (-me->d.sData[0] | me->d.sData[0]);

    mon->x = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
    mon->y = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));

    mon->y += Q_24_8(sub_801F07C(Q_24_8_TO_INT(mon->y), Q_24_8_TO_INT(mon->x), r2 >> 31,
                                 8, NULL, sub_801EE64));

    s->x = 0;
    s->y = 0;
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(25);
    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = SPRITE_FLAG_PRIORITY(2);

    mon->speedY = -Q_24_8(5.5);
    mon->deltaY = +Q_24_8(0);
    s->graphics.anim = SA2_ANIM_MON;
    s->variant = 0;
    s->unk21 = 0xFF;
}

static void Task_Enemy_Mon_Main(void)
{
    Sprite_Mon *mon = TaskGetStructPtr(gCurTask);
    Sprite *s = &mon->s;
    MapEntity *me = mon->base.me;

    s->x = Q_24_8_TO_INT(mon->x) - gCamera.x;
    s->y = Q_24_8_TO_INT(mon->y) - gCamera.y;

    if (sub_800C4FC(s, Q_24_8_TO_INT(mon->x), Q_24_8_TO_INT(mon->y), 0)) {
        TaskDestroy(gCurTask);
    } else if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mon->base.spriteX);
        TaskDestroy(gCurTask);
    } else {
        if ((gPlayer.x > mon->x - Q_24_8(DISPLAY_WIDTH / 2))
            && (gPlayer.x < mon->x + Q_24_8(DISPLAY_WIDTH / 2))
            && (gPlayer.y > mon->y - Q_24_8(50)) && (gPlayer.y < mon->y + Q_24_8(50))) {
            gCurTask->main = Task_Enemy_Mon_2;
            s->graphics.anim = SA2_ANIM_MON;
            s->variant = 2;
            s->unk21 = 0xFF;
        }

        if (gPlayer.x < mon->x) {
            s->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;
        } else {
            s->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
        }

        sub_80122DC(mon->x, mon->y);
        sub_8004558(s);
        sub_80051E8(s);
    }
}

static void Task_Enemy_Mon_2(void)
{
    Sprite_Mon *mon = TaskGetStructPtr(gCurTask);
    Sprite *s = &mon->s;
    MapEntity *me = mon->base.me;

    s->x = Q_24_8_TO_INT(mon->x) - gCamera.x;
    s->y = Q_24_8_TO_INT(mon->y) - gCamera.y;

    if (sub_800C4FC(s, Q_24_8_TO_INT(mon->x), Q_24_8_TO_INT(mon->y), 0)) {
        TaskDestroy(gCurTask);
    } else if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mon->base.spriteX);
        TaskDestroy(gCurTask);
    } else {
        sub_80122DC(mon->x, mon->y);
        if (sub_8004558(s) == 0) {
            mon->speedY = -Q_24_8(5.5);
            mon->deltaY = +Q_24_8(0.0);
            s->graphics.anim = SA2_ANIM_MON;
            s->variant = 1;
            s->unk21 = 0xFF;

            gCurTask->main = Task_Enemy_Mon_3;
        }
        sub_80051E8(s);
    }
}

static void Task_Enemy_Mon_3(void)
{
    Sprite_Mon *mon = TaskGetStructPtr(gCurTask);
    Sprite *s = &mon->s;
    MapEntity *me = mon->base.me;

    mon->speedY += Q_24_8(52. / 256.);
    mon->deltaY += mon->speedY;

    s->x = Q_24_8_TO_INT(mon->x) - gCamera.x;
    s->y = Q_24_8_TO_INT(mon->y + mon->deltaY) - gCamera.y;

    if (sub_800C4FC(s, Q_24_8_TO_INT(mon->x), Q_24_8_TO_INT(mon->y + mon->deltaY), 0)) {
        TaskDestroy(gCurTask);
    } else if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mon->base.spriteX);
        TaskDestroy(gCurTask);
    } else {
        if (mon->deltaY >= 0) {
            s->graphics.anim = SA2_ANIM_MON;
            s->variant = 3;
            s->unk21 = 0xFF;

            gCurTask->main = Task_Enemy_Mon_4;
        }

        sub_80122DC(mon->x, mon->y + mon->deltaY);
        sub_8004558(s);
        sub_80051E8(s);
    }
}

static void Task_Enemy_Mon_4(void)
{
    Sprite_Mon *mon = TaskGetStructPtr(gCurTask);
    Sprite *s = &mon->s;
    MapEntity *me = mon->base.me;

    s->x = Q_24_8_TO_INT(mon->x) - gCamera.x;
    s->y = Q_24_8_TO_INT(mon->y) - gCamera.y;

    if (sub_800C4FC(s, Q_24_8_TO_INT(mon->x), Q_24_8_TO_INT(mon->y), 0)) {
        TaskDestroy(gCurTask);
    } else if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mon->base.spriteX);
        TaskDestroy(gCurTask);
    } else {
        sub_80122DC(mon->x, mon->y);

        if (sub_8004558(s) == 0) {

            if ((gPlayer.x > mon->x - Q_24_8(DISPLAY_WIDTH / 2))
                && (gPlayer.x < mon->x + Q_24_8(DISPLAY_WIDTH / 2))
                && (gPlayer.y > mon->y - Q_24_8(50))
                && (gPlayer.y < mon->y + Q_24_8(50))) {

                if (gPlayer.x < mon->x) {
                    s->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;
                } else {
                    s->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
                }

                s->graphics.anim = SA2_ANIM_MON;
                s->variant = 2;
                s->unk21 = 0xFF;

                gCurTask->main = Task_Enemy_Mon_2;
            } else {
                s->graphics.anim = SA2_ANIM_MON;
                s->variant = 0;
                s->unk21 = 0xFF;

                gCurTask->main = Task_Enemy_Mon_Main;
            }
        }
        sub_80051E8(s);
    }
}
