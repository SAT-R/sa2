#include "global.h"
#include "game/game.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"

#include "constants/animations.h"
#include "constants/interactables.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s16 unk48;
    /* 0x4A */ s16 unk4A;
    /* 0x4C */ s16 unk4C;
    /* 0x4E */ u8 filler4E[2];
    /* 0x50 */ s32 unk50[3][2];
} Sprite_IA081; /* size: 0x68 */

extern void Task_800F38C(void);
extern void TaskDestructor_800F964(struct Task *);

const u16 gUnknown_080D5430[9][3] = {
    { 36, SA2_ANIM_SQ_PLATFORM_613, 0 },         { 36, SA2_ANIM_SQ_PLATFORM_613, 0 },
    { 36, SA2_ANIM_PLATFORM_SQUARE_MUS_PLA, 1 }, { 36, SA2_ANIM_PLATFORM_ICE_PAR, 2 },
    { 36, SA2_ANIM_PLATFORM_SQUARE_SKY_CAN, 0 }, { 36, SA2_ANIM_PLATFORM_TEC_BAS, 2 },
    { 36, SA2_ANIM_SQ_PLATFORM_613, 0 },         { 36, SA2_ANIM_SQ_PLATFORM_613, 0 },
    { 36, SA2_ANIM_SQ_PLATFORM_613, 0 },
};

void initSprite_Interactable081(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_800F38C, sizeof(Sprite_IA081), 0x2010, 0,
                                TaskDestructor_800F964);
    Sprite_IA081 *ia081 = TaskGetStructPtr(t);
    Sprite *s = &ia081->s;

    ia081->base.regionX = spriteRegionX;
    ia081->base.regionY = spriteRegionY;
    ia081->base.me = me;
    ia081->base.spriteX = me->x;
    ia081->base.spriteY = spriteY;
    ia081->unk40 = 0;
    ia081->unk44 = 0;
    ia081->unk4C = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            ia081->unk48 = 0x4;
            ia081->unk3C = 0;
            ia081->unk4A = 0;
        } else {
            ia081->unk48 = 0x4;
            ia081->unk3C = 0x80;
            ia081->unk4A = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            ia081->unk48 = 0;
            ia081->unk4A = 0x4;
            ia081->unk3C = 0;
        } else {
            ia081->unk48 = 0;
            ia081->unk4A = 0x4;
            ia081->unk3C = 0x80;
        }
    }
    // _0800F296

    {
        s32 i;
        s32 tileCount, anim, variant;

        for (i = 0; i < ARRAY_COUNT(ia081->unk50); i++) {
            ia081->unk50[i][0] = ia081->unk40;
            ia081->unk50[i][1] = ia081->unk44;
        }

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        tileCount = gUnknown_080D5430[LEVEL_TO_ZONE(gCurrentLevel)][0];
        s->graphics.dest = VramMalloc(tileCount);

        anim = gUnknown_080D5430[LEVEL_TO_ZONE(gCurrentLevel)][1];
        s->graphics.anim = anim;

        variant = gUnknown_080D5430[LEVEL_TO_ZONE(gCurrentLevel)][2];
        s->variant = variant;

        s->unk1A = 0x480;
        s->graphics.size = 0;
        s->unk14 = 0;
        s->unk1C = 0;
        s->unk21 = 0xFF;
        s->unk22 = 0x10;
        s->focused = 0;
        s->unk28->unk0 = -1;
        s->unk10 = SPRITE_FLAG_PRIORITY(2);
        sub_8004558(s);
    }
}
