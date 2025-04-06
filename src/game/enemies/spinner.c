#include "global.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"

#include "game/entity.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved; // may wanna use s->hitboxes[1] for code if it matches?
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;
} Sprite_Spinner;

#define GFX_TILE_COUNT_SPINNER 24

void Task_EnemySpinner(void);

void CreateEntity_Spinner(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_EnemySpinner, sizeof(Sprite_Spinner), 0x4040, 0, TaskDestructor_80095E8);
    Sprite_Spinner *spinner = TASK_DATA(t);
    Sprite *s = &spinner->s;
    spinner->base.regionX = spriteRegionX;
    spinner->base.regionY = spriteRegionY;
    spinner->base.me = me;
    spinner->base.spriteX = me->x;
    spinner->base.id = spriteY;

    spinner->spawnX = Q(TO_WORLD_POS(me->x, spriteRegionX));
    spinner->spawnY = Q(TO_WORLD_POS(me->y, spriteRegionY));

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(GFX_TILE_COUNT_SPINNER);
    s->graphics.anim = SA2_ANIM_SPINNER;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->hitboxes[1].index = -1;
    s->frameFlags = 0x2000;
}

void Task_EnemySpinner(void)
{
    Vec2_32 pos;
    // 'me' must be declared first for matching
    MapEntity *me;
    Sprite_Spinner *spinner = TASK_DATA(gCurTask);
    Sprite *s = &spinner->s;

    me = spinner->base.me;
    ENEMY_UPDATE_POSITION_STATIC(spinner, s, pos.x, pos.y);

    if (!(gPlayer.moveState & (MOVESTATE_IA_OVERRIDE | MOVESTATE_DEAD))) {
        Player *p = &gPlayer;
        Sprite *s2 = &p->spriteInfoBody->s;

        if ((s2->hitboxes[0].index != HITBOX_STATE_INACTIVE) && (s->hitboxes[1].index != HITBOX_STATE_INACTIVE)) {
            if (HB_COLLISION(pos.x, pos.y, s->hitboxes[1], I(p->qWorldX), I(p->qWorldY), s2->hitboxes[0])) {
                if ((p->itemEffect & 0x2) == PLAYER_ITEM_EFFECT__NONE) {
                    Player_CollisionDamage(p);
                }
            }
        }
        ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    }

    ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(spinner, me, s);
    ENEMY_UPDATE(s, pos.x, pos.y);
}
