#include "global.h"
#include "malloc_vram.h"
#include "task.h"
#include "game/enemies/hammerhead.h"
#include "game/entity.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ u8 filler40[4];
    /* 0x48 */ s16 unk44;
    /* 0x46 */ s16 unk46;
    /* 0x48 */ s32 unk48;
    /* 0x4C */ s16 unk4C;
    /* 0x4E */ s16 unk4E;
    /* 0x50 */ s32 unk50[3];
} Enemy_Hammerhead;

void Task_Hammerhead(void);
void sub_8056EDC(Enemy_Hammerhead *hammerhead);
void TaskDestructor_Hammerhead(struct Task *);

void CreateEntity_Hammerhead(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                             u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Hammerhead, sizeof(Enemy_Hammerhead), 0x4040, 0,
                                TaskDestructor_Hammerhead);
    Enemy_Hammerhead *hammerhead = TaskGetStructPtr(t);
    Sprite *s = &hammerhead->s;
    hammerhead->base.regionX = spriteRegionX;
    hammerhead->base.regionY = spriteRegionY;
    hammerhead->base.me = me;
    hammerhead->base.spriteX = me->x;
    hammerhead->base.spriteY = spriteY;

    hammerhead->unk48 = 0;
    sub_8056EDC(hammerhead);

    hammerhead->unk4C = 4;
    hammerhead->unk44 = me->d.uData[3];

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(36);
    s->graphics.anim = SA2_ANIM_HAMMERHEAD;
    s->variant = 0;
    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28->unk0 = -1;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);
}

asm(".end");

void sub_8056EDC(Enemy_Hammerhead *hammerhead)
{
    hammerhead->unk50[2] = hammerhead->unk50[1];
    hammerhead->unk50[1] = hammerhead->unk50[0];
    hammerhead->unk50[0] = hammerhead->unk48;
}