#include "global.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "game/entity.h"
#include "sakit/collision.h"
#include "sakit/entities_manager.h"

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

void CreateEntity_Spinner(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                          u8 spriteY)
{
    struct Task *t = TaskCreate(Task_EnemySpinner, sizeof(Sprite_Spinner), 0x4040, 0,
                                TaskDestructor_80095E8);
    Sprite_Spinner *spinner = TASK_DATA(t);
    Sprite *s = &spinner->s;
    spinner->base.regionX = spriteRegionX;
    spinner->base.regionY = spriteRegionY;
    spinner->base.me = me;
    spinner->base.spriteX = me->x;
    spinner->base.spriteY = spriteY;

    spinner->spawnX = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
    spinner->spawnY = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(GFX_TILE_COUNT_SPINNER);
    s->graphics.anim = SA2_ANIM_SPINNER;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->hitboxes[1].index = -1;
    s->unk10 = 0x2000;
}

void Task_EnemySpinner(void)
{
    Vec2_32 pos;
    // Must be declared first (for match)
    MapEntity *me;
    Sprite_Spinner *spinner = TASK_DATA(gCurTask);
    Sprite *s = &spinner->s;

    me = spinner->base.me;
    ENEMY_UPDATE_POSITION_STATIC(spinner, s, pos.x, pos.y);

    if (!(gPlayer.moveState & (MOVESTATE_400000 | MOVESTATE_DEAD))) {
        Player *p = &gPlayer;
        Sprite *s2 = &p->unk90->s;
        if ((s2->hitboxes[0].index != -1) && s->hitboxes[1].index != -1) {
            s32 x1, x2;
            x1 = pos.x + s->hitboxes[1].left;
            x2 = Q_24_8_TO_INT(p->x) + s2->hitboxes[0].left;
            if ((x1 <= x2 && x1 + (s->hitboxes[1].right - s->hitboxes[1].left) >= x2)
                || (x1 >= x2
                    && x2 + (s2->hitboxes[0].right - s2->hitboxes[0].left) >= x1)) {
                s32 y1, y2;
                y1 = pos.y + s->hitboxes[1].top;
                y2 = Q_24_8_TO_INT(p->y) + s2->hitboxes[0].top;
                if ((y1 <= y2 && y1 + (s->hitboxes[1].bottom - s->hitboxes[1].top) >= y2)
                    || (y1 >= y2
                        && y2 + (s2->hitboxes[0].bottom - s2->hitboxes[0].top) >= y1)) {
                    if ((p->itemEffect & 0x2) == PLAYER_ITEM_EFFECT__NONE) {
                        sub_800CBA4(p);
                    }
                }
            }
        }
        ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    }

    ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(spinner, me, s);
    ENEMY_UPDATE(s, pos.x, pos.y);
}
