#include "global.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "game/entity.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 filler3C[4];
    /* 0x40 */ s8 unk40;
    /* 0x41 */ s8 unk41;
    /* 0x42 */ s8 unk42;
    /* 0x43 */ s8 unk43;
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

NONMATCH("asm/non_matching/Task_EnemySpinner.inc", void Task_EnemySpinner(void))
{
    s32 posX, posY;
    s32 someX, otherX;
    s32 someY, otherY;
    Sprite_Spinner *spinner = TaskGetStructPtr(gCurTask);
    Sprite *s = &spinner->s;
    MapEntity *me = spinner->base.me;

    posX = Q_24_8_TO_INT(spinner->posX);
    posY = Q_24_8_TO_INT(spinner->posY);
    s->x = posX - gCamera.x;
    s->y = posY - gCamera.y;

    if (!(gPlayer.moveState & (MOVESTATE_400000 | MOVESTATE_DEAD))) {
        struct UNK_3005A70 *u90 = gPlayer.unk90;
        if ((u90->s.unk28[0].unk0 == -1) && (u90->s.unk28[1].unk0 == -1)) {
            someX = spinner->unk40 + posX;
            otherX = Q_24_8_TO_INT(gPlayer.x) + u90->s.unk28->unk4;
            if ((someX > otherX)
                || (someX + (spinner->unk42 - spinner->unk40)) >= otherX) {
                // _080570C2
                int diff = (u90->s.unk28[0].unk6 - u90->s.unk28[0].unk4);
                if (otherX + diff >= someX) {
                _080570D4:
                    someY = s->unk28[1].unk5 + posY;
                    otherY = Q_24_8_TO_INT(gPlayer.y) + u90->s.unk28[0].unk5;
                    if ((someY <= otherY) || (someY >= otherY)) {

                    } else {
                    }
                }
            }

            // _0805711A
            if (!(gPlayer.unk37 & 0x2)) {
                sub_800CBA4(&gPlayer);
            }
        }
        //_0805712E
        if (sub_800C4FC(s, posX, posY, 0)) {
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
        sub_80122DC(Q_24_8(s->x), Q_24_8(s->y));
        sub_8004558(s);
        sub_80051E8(s);
    }
}
END_NONMATCH
