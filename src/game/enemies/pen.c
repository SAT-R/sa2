#include "global.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "game/entity.h"

#include "game/enemies/pen.h"
#include "game/stage/entities_manager.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 x;
    /* 0x40 */ s32 y;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s32 unk48;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ u8 unk50;
    /* 0x51 */ u8 unk51;
} Sprite_Pen; /* 0x54 */

static void sub_8057980(void);
static void sub_8057BD4(void);

void CreateEntity_Pen(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_8057980, 0x54, 0x4040, 0, TaskDestructor_80095E8);
    Sprite_Pen *pen = TaskGetStructPtr(t);
    Sprite *s = &pen->s;

    pen->base.regionX = spriteRegionX;
    pen->base.regionY = spriteRegionY;
    pen->base.me = me;
    pen->base.spriteX = me->x;
    pen->base.spriteY = spriteY;

    if (me->d.sData[1] != 0) {
        pen->unk50 = 1;
    } else {
        pen->unk50 = 0;
    }

    pen->x = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
    pen->y = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));
    pen->unk44 = 0;
    pen->unk48 = Q_24_8(sub_801F07C(Q_24_8_TO_INT(pen->y), Q_24_8_TO_INT(pen->x),
                                    pen->unk50, 8, NULL, sub_801EE64));

    pen->unk4C = 0;
    pen->unk51 = 0;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(0xC);
    s->graphics.anim = SA2_ANIM_PEN;
    s->variant = 0;
    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28[0].unk0 = -1;
    s->unk10 = 0x2000;
}

static void sub_8057980(void)
{
    Sprite_Pen *pen = TaskGetStructPtr(gCurTask);
    Sprite *s = &pen->s;
    MapEntity *me = pen->base.me;
    Vec2_32 pos;
    s32 posX_24_8;
    s32 val;

    if ((s->unk10 & 0x400)) {
        if (pen->unk51) {
            pen->unk44 += 0x200;

        } else {
            pen->unk44 += 0x80;
        }
    } else if (pen->unk51 != 0) {
        pen->unk44 -= 0x200;
    } else {
        pen->unk44 -= 0x80;
    }

    val = sub_801F07C(Q_24_8_TO_INT(pen->y + pen->unk48),
                      Q_24_8_TO_INT(pen->x + pen->unk44), pen->unk50, 8, NULL,
                      sub_801EE64);

    if (val < 0) {
        pen->unk48 += Q_24_8(val);
        val = sub_801F100(Q_24_8_TO_INT(pen->y + pen->unk48),
                          Q_24_8_TO_INT(pen->x + pen->unk44), pen->unk50, 8,
                          sub_801EC3C);
    }

    if (val > 0) {
        pen->unk48 += Q_24_8(val);
    }

    pos.x = Q_24_8_TO_INT(pen->x + pen->unk44);
    pos.y = Q_24_8_TO_INT(pen->y + pen->unk48);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (sub_800C4FC(s, pos.x, pos.y, 0)) {
        TaskDestroy(gCurTask);
        return;
    }

    if ((Q_24_8_TO_INT(pen->x) > gCamera.x + 0x170
         || Q_24_8_TO_INT(pen->x) < gCamera.x - 0x80
         || Q_24_8_TO_INT(pen->y) > gCamera.y + 0x120
         || Q_24_8_TO_INT(pen->y) < gCamera.y - 0x80)
        && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pen->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (s->unk10 & 0x400) {
        s32 playerX = gPlayer.x;
        // Feels like a fake match, oh well
        posX_24_8 = Q_24_8(pos.x);
        if (playerX > posX_24_8 && playerX < Q_24_8(pos.x + 100)) {
            if (pen->unk51 == 0) {
                s->graphics.anim = SA2_ANIM_PEN;
                s->variant = 1;
                s->unk21 = -1;
            }
            pen->unk51 = 1;
        }
    } else {
        s32 playerX = gPlayer.x;
        posX_24_8 = Q_24_8(pos.x);
        if (playerX < posX_24_8 && playerX > Q_24_8(pos.x - 100)) {
            if (pen->unk51 == 0) {
                s->graphics.anim = SA2_ANIM_PEN;
                s->variant = 1;
                s->unk21 = -1;
            }
            pen->unk51 = 1;
        }
    }

    if ((Q_24_8_TO_INT(pen->unk44) <= me->d.sData[0] * 8 && !(s->unk10 & 0x400))) {
        gCurTask->main = sub_8057BD4;
        s->graphics.anim = SA2_ANIM_PEN;
        s->variant = 2;
        s->unk21 = -1;
    } else if ((Q_24_8_TO_INT(pen->unk44) >= (me->d.sData[0] * 8) + (me->d.uData[2] * 8)
                && s->unk10 & 0x400)) {
        gCurTask->main = sub_8057BD4;
        s->graphics.anim = SA2_ANIM_PEN;
        s->variant = 2;
        s->unk21 = -1;
    }

    sub_80122DC(posX_24_8, Q_24_8(pos.y));
    sub_8004558(s);
    sub_80051E8(s);
}

static void sub_8057BD4(void)
{
    Sprite_Pen *pen = TaskGetStructPtr(gCurTask);
    Sprite *s = &pen->s;
    MapEntity *me = pen->base.me;
    Vec2_32 pos;

    s32 val = sub_801F07C(Q_24_8_TO_INT(pen->y + pen->unk48),
                          Q_24_8_TO_INT(pen->x + pen->unk44), pen->unk50, 8, NULL,
                          sub_801EE64);

    if (val < 0) {
        pen->unk48 += Q_24_8(val);
        val = sub_801F100(Q_24_8_TO_INT(pen->y + pen->unk48),
                          Q_24_8_TO_INT(pen->x + pen->unk44), pen->unk50, 8,
                          sub_801EC3C);
    }

    if (val > 0) {
        pen->unk48 += Q_24_8(val);
    }

    pos.x = Q_24_8_TO_INT(pen->x + pen->unk44);
    pos.y = Q_24_8_TO_INT(pen->y + pen->unk48);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (sub_800C4FC(s, pos.x, pos.y, 0)) {
        TaskDestroy(gCurTask);
        return;
    }

    if ((Q_24_8_TO_INT(pen->x) > gCamera.x + 0x170
         || Q_24_8_TO_INT(pen->x) < gCamera.x - 0x80
         || Q_24_8_TO_INT(pen->y) > gCamera.y + 0x120
         || Q_24_8_TO_INT(pen->y) < gCamera.y - 0x80)
        && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pen->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    sub_80122DC(Q_24_8(pos.x), Q_24_8(pos.y));
    if (sub_8004558(s) == 0) {
        pen->unk51 = 0;
        if (s->unk10 & 0x400) {
            s->unk10 &= ~0x400;
        } else {
            s->unk10 |= 0x400;
        }
        s->graphics.anim = SA2_ANIM_PEN;
        s->variant = 0;
        s->unk21 = -1;
        gCurTask->main = sub_8057980;
    }
    sub_80051E8(s);
}
