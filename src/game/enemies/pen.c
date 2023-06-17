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
    /* 0x3C */ s32 spawnX;
    /* 0x40 */ s32 spawnY;
    /* 0x44 */ s32 offsetX;
    /* 0x48 */ s32 offsetY;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ u8 unk50;
    /* 0x51 */ bool8 boosting;
} Sprite_Pen; /* 0x54 */

static void Task_Move(void);
static void Task_Turn(void);

#define PEN_BOOST_SPEED Q_24_8(2.0)
#define PEN_MOVE_SPEED  Q_24_8(0.5)

void CreateEntity_Pen(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_Move, sizeof(Sprite_Pen), 0x4040, 0, TaskDestructor_80095E8);
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

    pen->spawnX = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
    pen->spawnY = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));
    pen->offsetX = 0;
    // Find the floor position
    pen->offsetY
        = Q_24_8(sub_801F07C(Q_24_8_TO_INT(pen->spawnY), Q_24_8_TO_INT(pen->spawnX),
                             pen->unk50, 8, NULL, sub_801EE64));

    pen->unk4C = 0;
    pen->boosting = FALSE;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(0xC);
    s->graphics.anim = SA2_ANIM_PEN;
    s->variant = SA2_ANIM_PEN_VARIANT_MOVE;
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

static void Task_Move(void)
{
    Sprite_Pen *pen = TaskGetStructPtr(gCurTask);
    Sprite *s = &pen->s;
    MapEntity *me = pen->base.me;
    Vec2_32 pos;
    s32 posX_24_8;
    s32 val;

    if ((s->unk10 & SPRITE_FLAG_MASK_X_FLIP)) {
        if (pen->boosting) {
            pen->offsetX += PEN_BOOST_SPEED;

        } else {
            pen->offsetX += PEN_MOVE_SPEED;
        }
    } else {
        if (pen->boosting) {
            pen->offsetX -= PEN_BOOST_SPEED;
        } else {
            pen->offsetX -= PEN_MOVE_SPEED;
        }
    }

    val = sub_801F07C(Q_24_8_TO_INT(pen->spawnY + pen->offsetY),
                      Q_24_8_TO_INT(pen->spawnX + pen->offsetX), pen->unk50, 8, NULL,
                      sub_801EE64);

    if (val < 0) {
        pen->offsetY += Q_24_8(val);
        val = sub_801F100(Q_24_8_TO_INT(pen->spawnY + pen->offsetY),
                          Q_24_8_TO_INT(pen->spawnX + pen->offsetX), pen->unk50, 8,
                          sub_801EC3C);
    }

    if (val > 0) {
        pen->offsetY += Q_24_8(val);
    }

    pos.x = Q_24_8_TO_INT(pen->spawnX + pen->offsetX);
    pos.y = Q_24_8_TO_INT(pen->spawnY + pen->offsetY);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (sub_800C4FC(s, pos.x, pos.y, 0)) {
        TaskDestroy(gCurTask);
        return;
    }

    if ((Q_24_8_TO_INT(pen->spawnX) > gCamera.x + 368
         || Q_24_8_TO_INT(pen->spawnX) < gCamera.x - 128
         || Q_24_8_TO_INT(pen->spawnY) > gCamera.y + 288
         || Q_24_8_TO_INT(pen->spawnY) < gCamera.y - 128)
        && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pen->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (s->unk10 & SPRITE_FLAG_MASK_X_FLIP) {
        s32 playerX = gPlayer.x;
        // Feels like a fake match, oh well
        posX_24_8 = Q_24_8(pos.x);
        if (playerX > posX_24_8 && playerX < Q_24_8(pos.x + 100)) {
            if (!pen->boosting) {
                s->graphics.anim = SA2_ANIM_PEN;
                s->variant = SA2_ANIM_PEN_VARIANT_BOOST;
                s->unk21 = -1;
            }
            pen->boosting = TRUE;
        }
    } else {
        s32 playerX = gPlayer.x;
        posX_24_8 = Q_24_8(pos.x);
        if (playerX < posX_24_8 && playerX > Q_24_8(pos.x - 100)) {
            if (!pen->boosting) {
                s->graphics.anim = SA2_ANIM_PEN;
                s->variant = SA2_ANIM_PEN_VARIANT_BOOST;
                s->unk21 = -1;
            }
            pen->boosting = TRUE;
        }
    }

    // Turn when end of range reached
    if ((Q_24_8_TO_INT(pen->offsetX) <= me->d.sData[0] * TILE_WIDTH
         && !(s->unk10 & SPRITE_FLAG_MASK_X_FLIP))) {
        gCurTask->main = Task_Turn;
        s->graphics.anim = SA2_ANIM_PEN;
        s->variant = SA2_ANIM_PEN_VARIANT_TURN;
        s->unk21 = -1;
    } else if ((Q_24_8_TO_INT(pen->offsetX)
                    >= (me->d.sData[0] * TILE_WIDTH) + (me->d.uData[2] * TILE_WIDTH)
                && s->unk10 & SPRITE_FLAG_MASK_X_FLIP)) {
        gCurTask->main = Task_Turn;
        s->graphics.anim = SA2_ANIM_PEN;
        s->variant = SA2_ANIM_PEN_VARIANT_TURN;
        s->unk21 = -1;
    }

    sub_80122DC(posX_24_8, Q_24_8(pos.y));
    sub_8004558(s);
    sub_80051E8(s);
}

static void Task_Turn(void)
{
    Sprite_Pen *pen = TaskGetStructPtr(gCurTask);
    Sprite *s = &pen->s;
    MapEntity *me = pen->base.me;
    Vec2_32 pos;

    s32 val = sub_801F07C(Q_24_8_TO_INT(pen->spawnY + pen->offsetY),
                          Q_24_8_TO_INT(pen->spawnX + pen->offsetX), pen->unk50, 8, NULL,
                          sub_801EE64);

    if (val < 0) {
        pen->offsetY += Q_24_8(val);
        val = sub_801F100(Q_24_8_TO_INT(pen->spawnY + pen->offsetY),
                          Q_24_8_TO_INT(pen->spawnX + pen->offsetX), pen->unk50, 8,
                          sub_801EC3C);
    }

    if (val > 0) {
        pen->offsetY += Q_24_8(val);
    }

    pos.x = Q_24_8_TO_INT(pen->spawnX + pen->offsetX);
    pos.y = Q_24_8_TO_INT(pen->spawnY + pen->offsetY);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (sub_800C4FC(s, pos.x, pos.y, 0)) {
        TaskDestroy(gCurTask);
        return;
    }

    if ((Q_24_8_TO_INT(pen->spawnX) > gCamera.x + 368
         || Q_24_8_TO_INT(pen->spawnX) < gCamera.x - 128
         || Q_24_8_TO_INT(pen->spawnY) > gCamera.y + 288
         || Q_24_8_TO_INT(pen->spawnY) < gCamera.y - 128)
        && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pen->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    sub_80122DC(Q_24_8(pos.x), Q_24_8(pos.y));
    if (sub_8004558(s) == 0) {
        pen->boosting = FALSE;
        if (s->unk10 & SPRITE_FLAG_MASK_X_FLIP) {
            s->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;
        } else {
            s->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
        }
        s->graphics.anim = SA2_ANIM_PEN;
        s->variant = SA2_ANIM_PEN_VARIANT_MOVE;
        s->unk21 = -1;
        gCurTask->main = Task_Move;
    }
    sub_80051E8(s);
}
