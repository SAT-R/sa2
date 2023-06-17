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

void sub_8056964(void);

void CreateEntity_Straw(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (gGameMode == GAME_MODE_TIME_ATTACK || gUnknown_030054EC != 1) {
        s16 something;
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

        rand = something = PseudoRandom32() & ONE_CYCLE;

        straw->unk4C = COS(rand) >> 5;
        straw->unk50 = SIN(rand) >> 5;
        straw->unk54 = 100;
        straw->unk55 = 5;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = VramMalloc(0xC);
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