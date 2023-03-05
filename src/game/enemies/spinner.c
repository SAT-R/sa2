#include "global.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "game/entity.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 filler3C[8];
    /* 0x44 */ s32 posX;
    /* 0x48 */ s32 posY;
} Sprite_Spinner;

#define GFX_TILE_COUNT_SPINNER 24

void Task_EnemySpinner(void);
void TaskDestructor_80095E8(struct Task *);

void initSprite_Enemy_Spinner(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                              u8 spriteY)
{
    struct Task *t = TaskCreate(Task_EnemySpinner, sizeof(Sprite_Spinner), 0x4040, 0,
                                TaskDestructor_80095E8);
    Sprite_Spinner *spinner = TaskGetStructPtr(t);
    Sprite *s = &spinner->s;

    spinner->base.regionX = spriteRegionX;
    spinner->base.regionY = spriteRegionY;
    spinner->base.me = me;
    spinner->base.spriteX = me->x;
    spinner->base.spriteY = spriteY;

    spinner->posX = Q_24_8(SpriteGetScreenPos(me->x, spriteRegionX));
    spinner->posY = Q_24_8(SpriteGetScreenPos(me->y, spriteRegionY));

    s->x = SpriteGetScreenPos(me->x, spriteRegionX);
    s->y = SpriteGetScreenPos(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(GFX_TILE_COUNT_SPINNER);
    s->graphics.anim = SA2_ANIM_SPINNER;
    s->variant = 0;
    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28[0].unk0 = -1;
    s->unk28[1].unk0 = -1;
    s->unk10 = 0x2000;
}
