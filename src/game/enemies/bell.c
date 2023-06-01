#include "global.h"
#include "core.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "game/entity.h"
#include "game/enemies/bell.h"
#include "game/stage/entities_manager.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C[8]; // Extra space used by this somehow larger sprite?
    /* 0x44 */ s32 posX;
    /* 0x48 */ s32 posY;
    /* 0x4C */ s8 unk4C;
} Sprite_Bell; /* 0x50 */

static void sub_8054BF4(void);
static void sub_8054D20(void);

#define ANIM_BELL_TILES 20

void CreateEntity_Bell(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_8054BF4, sizeof(Sprite_Bell), 0x4080, 0,
                                TaskDestructor_80095E8);
    Sprite_Bell *bell = TaskGetStructPtr(t);
    Sprite *sprite = &bell->s;

    bell->unk4C = 0x78;

    bell->base.regionX = spriteRegionX;
    bell->base.regionY = spriteRegionY;
    bell->base.me = me;
    bell->base.spriteX = me->x;
    bell->base.spriteY = spriteY;

    bell->posX = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
    bell->posY = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));

    sprite->x = TO_WORLD_POS(me->x, spriteRegionX);
    sprite->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    sprite->graphics.dest = VramMalloc(ANIM_BELL_TILES);
    sprite->graphics.anim = SA2_ANIM_BELL;
    sprite->variant = 0;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
}

static void sub_8054BF4(void)
{
    Sprite_Bell *bell = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &bell->s;
    MapEntity *me = bell->base.me;

    Vec2_32 pos;

    pos.x = Q_24_8_TO_INT(bell->posX);
    pos.y = Q_24_8_TO_INT(bell->posY);
    sprite->x = pos.x - gCamera.x;
    sprite->y = pos.y - gCamera.y;
    if (sub_800C4FC(sprite, pos.x, pos.y, 0) != 0) {
        TaskDestroy(gCurTask);
        return;
    }

    if (IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bell->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    bell->unk4C--;

    if (bell->unk4C == 0) {
        if (PseudoRandom32() & 1) {
            bell->unk4C = 124;
        } else {
            bell->unk4C = -76;
        }

        gCurTask->main = sub_8054D20;
        sprite->unk28[0].unk0 = -1;
        sprite->graphics.anim = SA2_ANIM_BELL;
        sprite->variant = 1;
        sprite->unk21 = -1;
    }

    sub_80122DC(bell->posX, bell->posY);
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8054D20(void)
{
    Sprite_Bell *bell = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &bell->s;
    MapEntity *me = bell->base.me;
    Vec2_32 pos;

    pos.x = Q_24_8_TO_INT(bell->posX);
    pos.y = Q_24_8_TO_INT(bell->posY);
    sprite->x = pos.x - gCamera.x;
    sprite->y = pos.y - gCamera.y;
    sub_800C84C(sprite, pos.x, pos.y);
    if (IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bell->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    bell->unk4C--;

    {
#ifndef NON_MATCHING
        register s32 r2 asm("r2") = 0xFF;
#endif

        if (bell->unk4C == 0) {
            bell->unk4C = 120;

            sprite->graphics.anim = SA2_ANIM_BELL;
            sprite->variant = 0;
#ifndef NON_MATCHING
            sprite->unk21 |= r2;
#else
            sprite->unk21 = -1;
#endif

            // BUG: (?) Sprite is 0x30
            sprite->unk28[1].unk0 = -1;
            gCurTask->main = sub_8054BF4;
        }
    }

    sub_8004558(sprite);
    sub_80051E8(sprite);
}
