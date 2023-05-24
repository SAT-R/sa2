#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "game/entity.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 posX;
    /* 0x40 */ s32 posY;
    /* 0x44 */ s32 speedX;
    /* 0x48 */ s32 speedY;
} Sprite_Mon; /* 0x4C */

void Task_Enemy_Mon(void);

void CreateEntity_Mon(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Enemy_Mon, sizeof(Sprite_Mon), 0x4010, 0, TaskDestructor_80095E8);
    Sprite_Mon *mon = TaskGetStructPtr(t);
    Sprite *s = &mon->s;
    u32 r2;

    mon->base.regionX = spriteRegionX;
    mon->base.regionY = spriteRegionY;
    mon->base.me = me;
    mon->base.spriteX = me->x;
    mon->base.spriteY = spriteY;

    r2 = (-me->d.sData[0] | me->d.sData[0]);

    mon->posX = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
    mon->posY = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));

    mon->posY += Q_24_8(sub_801F07C(Q_24_8_TO_INT(mon->posY),
                             Q_24_8_TO_INT(mon->posX),
                             r2 >> 31,
                             8,
                             NULL,
                             sub_801EE64));

    s->x = 0;
    s->y = 0;
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(25);
    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = SPRITE_FLAG_PRIORITY(2);

    mon->speedY = -Q_24_8(5.5);
    mon->speedX = +Q_24_8(0);

    s->graphics.anim = SA2_ANIM_MON;
    s->variant = 0;
    s->unk21 = 0xFF;
}