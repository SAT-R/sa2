#include "global.h"
#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/entity.h"
#include "game/enemies/kura_kura.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite s1;
    /* 0x6C */ Sprite s2;
    /* 0x9C */ Hitbox reserved; // "overflow" from Sprite
    /* 0xA4 */ s32 spawnX;
    /* 0xA8 */ s32 spawnY;
    /* 0xAC */ s32 unkAC;
    /* 0xB0 */ s32 unkB0;
} Sprite_KuraKura; /* 0xB4*/

void Task_8052024(void);
void TaskDestructor_8052264(struct Task *);

void CreateEntity_KuraKura(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_8052024, sizeof(Sprite_KuraKura), 0x4050, 0, TaskDestructor_8052264);
    Sprite_KuraKura *kk = TASK_DATA(t);
    Sprite *s = &kk->s;
    kk->unkB0 = 0;
    kk->unkAC = 0;
    kk->base.regionX = spriteRegionX;
    kk->base.regionY = spriteRegionY;
    kk->base.me = me;
    kk->base.spriteX = me->x;
    kk->base.id = spriteY;

    ENEMY_SET_SPAWN_POS_STATIC(kk, me);

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT(s, 8, SA2_ANIM_KURAKURA, 0, 18, 2);

    s = &kk->s1;
    s->x = 0;
    s->y = 0;

    SPRITE_INIT(s, 1, SA2_ANIM_KURAKURA_PROJ, 0, 17, 2);

    UpdateSpriteAnimation(s);

    s = &kk->s2;
    s->x = 0;
    s->y = 0;

    SPRITE_INIT(s, 4, SA2_ANIM_KURAKURA_PROJ_FIREBALL, 0, 16, 2);
}

void sub_805213C(Sprite_KuraKura *kk);

void Task_8052024(void)
{
    Sprite_KuraKura *kk = TASK_DATA(gCurTask);
    Sprite *s = &kk->s;
    MapEntity *me = kk->base.me;

    Vec2_32 pos;
    ENEMY_UPDATE_POSITION_STATIC(kk, s, pos.x, pos.y);

    SPRITE_FLAG_CLEAR(s, X_FLIP);

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN_RAW(kk, me, s, pos.x, pos.y);

    ENEMY_UPDATE_EX_RAW(s, kk->spawnX, kk->spawnY, {});

    SPRITE_FLAG_SET(s, X_FLIP);

    DisplaySprite(s);
    sub_805213C(kk);
}

void sub_805213C(Sprite_KuraKura *kk)
{
    u8 i;
    Vec2_32 pos;
    Sprite *s1 = &kk->s1;
    Sprite *s2 = &kk->s2;

    kk->unkAC = (SIN_24_8((gStageTime * 4) & ONE_CYCLE) >> 1) & ONE_CYCLE;

    for (i = 0; i < 2; i++) {
        s1->x = (I(kk->spawnX) + (SIN(kk->unkAC) >> (11 - i))) - gCamera.x;
        s1->y = (I(kk->spawnY) + (COS(kk->unkAC) >> (11 - i))) - gCamera.y;
        DisplaySprite(s1);
    }

    pos.x = (I(kk->spawnX) + (SIN(kk->unkAC) >> 9)) - (SIN(kk->unkAC) >> 11);
    pos.y = (I(kk->spawnY) + (COS(kk->unkAC) >> 9)) - (COS(kk->unkAC) >> 11);

    s2->x = pos.x - gCamera.x;
    s2->y = pos.y - gCamera.y;
    Player_EnemySpriteCollision(s2, pos.x, pos.y);

    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);
}

void TaskDestructor_8052264(struct Task *t)
{
    Sprite_KuraKura *kk = TASK_DATA(t);
    VramFree(kk->s.graphics.dest);
    VramFree(kk->s1.graphics.dest);
    VramFree(kk->s2.graphics.dest);
}
