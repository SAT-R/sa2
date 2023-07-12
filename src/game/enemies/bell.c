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
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;
    /* 0x4C */ s8 unk4C;
} Sprite_Bell; /* 0x50 */

static void sub_8054BF4(void);
static void sub_8054D20(void);

#define ANIM_BELL_TILES 20

void CreateEntity_Bell(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    ENTITY_INIT_2(Sprite_Bell, bell, sub_8054BF4, 0x4080, 0, TaskDestructor_80095E8,
                  120);

    bell->spawnX = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
    bell->spawnY = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT_EXCEPT_POS(s, ANIM_BELL_TILES, SA2_ANIM_BELL, 0, 0x480, 2);
}

static void sub_8054BF4(void)
{
    Sprite_Bell *bell = TaskGetStructPtr(gCurTask);
    Sprite *s = &bell->s;
    MapEntity *me = bell->base.me;

    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(bell, s, pos.x, pos.y);

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
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
        s->unk28[0].unk0 = -1;
        s->graphics.anim = SA2_ANIM_BELL;
        s->variant = 1;
        s->unk21 = -1;
    }

    ENEMY_UPDATE_EX_RAW(s, bell->spawnX, bell->spawnY, {});
}

void sub_8054D20(void)
{
    Sprite_Bell *bell = TaskGetStructPtr(gCurTask);
    Sprite *s = &bell->s;
    MapEntity *me = bell->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(bell, s, pos.x, pos.y);

    sub_800C84C(s, pos.x, pos.y);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
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

            s->graphics.anim = SA2_ANIM_BELL;
            s->variant = 0;
#ifndef NON_MATCHING
            s->unk21 |= r2;
#else
            s->unk21 = -1;
#endif

            s->unk28[1].unk0 = -1;
            gCurTask->main = sub_8054BF4;
        }
    }

    sub_8004558(s);
    sub_80051E8(s);
}
