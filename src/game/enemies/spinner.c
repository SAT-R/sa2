#include "global.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "game/entity.h"
#include "game/stage/entities_manager.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite_UNK28
        reserved; // may wanna use s->unk28[1] for code if it matches?
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
    Sprite_Spinner *spinner = TaskGetStructPtr(t);
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
    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28[0].unk0 = -1;
    s->unk28[1].unk0 = -1;
    s->unk10 = 0x2000;
}

// https://decomp.me/scratch/M6ta6
NONMATCH("asm/non_matching/Task_EnemySpinner.inc", void Task_EnemySpinner(void))
{
    Vec2_32 pos;
    s32 someX, otherX;
    Sprite_Spinner *spinner = TaskGetStructPtr(gCurTask);
    Sprite *s = &spinner->s;
    MapEntity *me = spinner->base.me;

    pos.x = Q_24_8_TO_INT(spinner->spawnX);
    pos.y = Q_24_8_TO_INT(spinner->spawnY);
    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (!(gPlayer.moveState & (MOVESTATE_400000 | MOVESTATE_DEAD))) {
        UNK_3005A70 *u90 = gPlayer.unk90;
        if ((u90->s.unk28[0].unk0 == -1) && (u90->s.unk28[1].unk0 == -1)) {
            someX = s->unk28[1].unk4 + pos.x;
            otherX = Q_24_8_TO_INT(gPlayer.x) + u90->s.unk28[0].unk4;
            if ((someX > otherX)
                || someX + (u90->s.unk28[1].unk6 - u90->s.unk28[1].unk4)) {
                // _080570C2
                int diff = (u90->s.unk28[0].unk6 - u90->s.unk28[0].unk4);
                if (otherX > diff && otherX >= u90->s.unk28[0].unk5) {
                    if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                        sub_800CBA4(&gPlayer);
                    }
                }
            }
        }
        //_0805712E
        if (sub_800C4FC(s, pos.x, pos.y, 0)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, spinner->base.spriteX);
            TaskDestroy(gCurTask);
            return;
        }
    }
    // _0805713E
    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spinner->base.spriteX);
        TaskDestroy(gCurTask);
    } else {
        sub_80122DC(Q_24_8(pos.x), Q_24_8(pos.y));
        sub_8004558(s);
        sub_80051E8(s);
    }
}
END_NONMATCH
