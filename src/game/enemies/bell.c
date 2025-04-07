#include "global.h"
#include "core.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"

#include "game/entity.h"
#include "game/enemies/bell.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C[8]; // Extra space used by this somehow larger sprite?
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;
    /* 0x4C */ u8 unk4C;
} Sprite_Bell; /* 0x50 */

static void Task_BellMain(void);
static void sub_8054D20(void);

#define ANIM_BELL_TILES 20

void CreateEntity_Bell(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_BellMain, sizeof(Sprite_Bell), 0x4080, 0, TaskDestructor_80095E8);
    Sprite_Bell *bell = TASK_DATA(t);
    Sprite *s = &bell->s;
    bell->unk4C = 120;
    bell->base.regionX = spriteRegionX;
    bell->base.regionY = spriteRegionY;
    bell->base.me = me;
    bell->base.spriteX = me->x;
    bell->base.id = spriteY;

    bell->spawnX = Q(TO_WORLD_POS(me->x, spriteRegionX));
    bell->spawnY = Q(TO_WORLD_POS(me->y, spriteRegionY));

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT(s, ANIM_BELL_TILES, SA2_ANIM_BELL, 0, 18, 2);
}

static void Task_BellMain(void)
{
    Sprite_Bell *bell = TASK_DATA(gCurTask);
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
            bell->unk4C = 180;
        }

        gCurTask->main = sub_8054D20;
        s->hitboxes[0].index = -1;
        s->graphics.anim = SA2_ANIM_BELL;
        s->variant = 1;
        s->prevVariant = -1;
    }

    ENEMY_UPDATE_EX_RAW(s, bell->spawnX, bell->spawnY, {});
}

void sub_8054D20(void)
{
    Sprite_Bell *bell = TASK_DATA(gCurTask);
    Sprite *s = &bell->s;
    MapEntity *me = bell->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(bell, s, pos.x, pos.y);

    Coll_Player_Projectile(s, pos.x, pos.y);

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
            s->prevVariant |= r2;
#else
            s->prevVariant = -1;
#endif

            s->hitboxes[1].index = -1;
            gCurTask->main = Task_BellMain;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
