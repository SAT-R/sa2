#include "global.h"
#include "malloc_vram.h"
#include "game/entity.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 filler3C[0x8];
    /* 0x48 */ s32 x;
    /* 0x4C */ s32 y;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ s32 unk50;
    /* 0x54 */ u8 unk54;
    /* 0x56 */ u16 unk56;
} Sprite_PikoPiko; /* size: 0x58 */

void Task_PikoPiko(void);
void TaskDestructor_PikoPiko(struct Task *);

void CreateEntity_PikoPiko(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                           u8 spriteY)
{
    if ((gGameMode == GAME_MODE_TIME_ATTACK) || (gUnknown_030054EC != 1)) {
        struct Task *t = TaskCreate(Task_PikoPiko, sizeof(Sprite_PikoPiko), 0x4080, 0,
                                    TaskDestructor_PikoPiko);

        Sprite_PikoPiko *piko = TaskGetStructPtr(t);
        Sprite *s = &piko->s;

        piko->base.regionX = spriteRegionX;
        piko->base.regionY = spriteRegionY;
        piko->base.me = me;
        piko->base.spriteX = me->x;
        piko->base.spriteY = spriteY;

        if (me->d.sData[1] != 0) {
            piko->unk54 = 1;
        } else {
            piko->unk54 = 0;
        }

        piko->unk56 = -Q_24_8(1.0);

        piko->x = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
        piko->y = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));
        piko->unk4C = 0;

        piko->unk50 = Q_24_8(sub_801F07C(Q_24_8_TO_INT(piko->y), Q_24_8_TO_INT(piko->x),
                                         piko->unk54, 8, NULL, sub_801EE64));

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = VramMalloc(30);
        s->graphics.anim = SA2_ANIM_PIKOPIKO;
        s->variant = 0;
        s->unk1A = 0x480;
        s->graphics.size = 0;
        s->unk14 = 0;
        s->unk1C = 0;
        s->unk21 = -1;
        s->unk22 = 0x10;
        s->palId = 0;
        s->unk28->unk0 = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);
    }
}