#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"

#include "game/entity.h"
#include "game/enemies/straw.h"
#include "game/stage/entities_manager.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s32 unk48;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ s32 unk50;
    /* 0x54 */ u8 unk54;
    /* 0x55 */ u8 unk55;
} Sprite_Straw; /* 0x58 */

void sub_8056AF4(void);
void sub_8056964(void);

#define STRAW_VRAM_TILES 12

void CreateEntity_Straw(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (gGameMode == GAME_MODE_TIME_ATTACK || gUnknown_030054EC != 1) {
        s32 rand;
        struct Task *t = TaskCreate(sub_8056964, sizeof(Sprite_Straw), 0x4040, 0,
                                    TaskDestructor_80095E8);
        Sprite_Straw *straw = TaskGetStructPtr(t);
        Sprite *s = &straw->s;
        straw->base.regionX = spriteRegionX;
        straw->base.regionY = spriteRegionY;
        straw->base.me = me;
        straw->base.spriteX = me->x;
        straw->base.spriteY = spriteY;

        straw->unk3C = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
        straw->unk40 = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));
        straw->unk44 = 0;
        straw->unk48 = 0;

        rand = CLAMP_SIN_PERIOD(PseudoRandom32());

        straw->unk4C = COS(rand) >> 5;
        straw->unk50 = SIN(rand) >> 5;
        straw->unk54 = 100;
        straw->unk55 = 5;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = VramMalloc(STRAW_VRAM_TILES);
        s->graphics.anim = SA2_ANIM_STRAW;
        s->variant = 0;
        s->unk1A = 0x480;
        s->graphics.size = 0;
        s->unk14 = 0;
        s->unk1C = 0;
        s->unk21 = -1;
        s->unk22 = 0x10;
        s->palId = 0;
        s->unk28[0].unk0 = -1;
        s->unk10 = 0x1000;
    }
}

void sub_80567F8(void)
{
    Sprite_Straw *straw = TaskGetStructPtr(gCurTask);
    Sprite *s = &straw->s;
    MapEntity *me = straw->base.me;
    Vec2_32 pos = {
        .x = Q_24_8_TO_INT(straw->unk3C + straw->unk44),
        .y = Q_24_8_TO_INT(straw->unk40 + straw->unk48),
    };

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (sub_800C4FC(s, pos.x, pos.y, 0)) {
        TaskDestroy(gCurTask);
        return;
    }

    if ((Q_24_8_TO_INT(straw->unk3C) > gCamera.x + 368
         || Q_24_8_TO_INT(straw->unk3C) < gCamera.x - 128
         || Q_24_8_TO_INT(straw->unk40) > gCamera.y + 288
         || Q_24_8_TO_INT(straw->unk40) < gCamera.y - 128)
        && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, straw->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (--straw->unk54 == 0) {
        s32 rand = CLAMP_SIN_PERIOD(PseudoRandom32());
        straw->unk4C = COS(rand) >> 5;
        straw->unk50 = SIN(rand) >> 5;
        straw->unk54 = 100;
        gCurTask->main = sub_8056964;
    }

    sub_80122DC(Q_24_8(pos.x), Q_24_8(pos.y));
    sub_8004558(s);
    sub_80051E8(s);
}

void sub_8056964(void)
{
    Sprite_Straw *straw = TaskGetStructPtr(gCurTask);
    Sprite *s = &straw->s;
    MapEntity *me = straw->base.me;
    Vec2_32 pos;

    straw->unk44 += straw->unk4C;
    straw->unk48 += straw->unk50;

    pos.x = Q_24_8_TO_INT(straw->unk3C + straw->unk44);
    pos.y = Q_24_8_TO_INT(straw->unk40 + straw->unk48);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (gPlayer.x < Q_24_8_NEW(pos.x)) {
        straw->unk4C -= 0x10;
    } else {
        straw->unk4C += 0xB;
    }

    if (gPlayer.y < Q_24_8_NEW(pos.y)) {
        straw->unk50 -= 0x10;
    } else {
        straw->unk50 += 0xB;
    }

    if (sub_800C4FC(s, pos.x, pos.y, 0)) {
        TaskDestroy(gCurTask);
        return;
    }

    if ((Q_24_8_TO_INT(straw->unk3C) > gCamera.x + 368
         || Q_24_8_TO_INT(straw->unk3C) < gCamera.x - 128
         || Q_24_8_TO_INT(straw->unk40) > gCamera.y + 288
         || Q_24_8_TO_INT(straw->unk40) < gCamera.y - 128)
        && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, straw->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (--straw->unk54 == 0) {
        if ((--straw->unk55 % 256) == 0) {
            gCurTask->main = sub_8056AF4;
        } else {
            gCurTask->main = sub_80567F8;
        }
        straw->unk54 = 30;
    }

    sub_80122DC(Q_24_8_NEW(pos.x), Q_24_8_NEW(pos.y));

    if (gPlayer.x < Q_24_8_NEW(pos.x)) {
        s->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;
    } else {
        s->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
    }

    sub_8004558(s);
    sub_80051E8(s);
}

void sub_8056AF4(void)
{
    Sprite_Straw *straw = TaskGetStructPtr(gCurTask);
    Sprite *s = &straw->s;
    MapEntity *me = straw->base.me;
    Vec2_32 pos;

    straw->unk44 += straw->unk4C;
    straw->unk48 += straw->unk50;

    pos.x = Q_24_8_TO_INT(straw->unk3C + straw->unk44);
    pos.y = Q_24_8_TO_INT(straw->unk40 + straw->unk48);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (sub_800C4FC(s, pos.x, pos.y, 0)) {
        TaskDestroy(gCurTask);
        return;
    }

    if ((Q_24_8_TO_INT(straw->unk3C) > gCamera.x + 368
         || Q_24_8_TO_INT(straw->unk3C) < gCamera.x - 128
         || Q_24_8_TO_INT(straw->unk40) > gCamera.y + 288
         || Q_24_8_TO_INT(straw->unk40) < gCamera.y - 128)
        && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, straw->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    sub_80122DC(Q_24_8_NEW(pos.x), Q_24_8_NEW(pos.y));

    sub_8004558(s);
    sub_80051E8(s);
}
