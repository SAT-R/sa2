#include "global.h"
#include "malloc_vram.h"
#include "game/entity.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 filler3C[0x8];
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;
    /* 0x4C */ s32 offsetX;
    /* 0x50 */ s32 offsetY;
    /* 0x54 */ u8 unk54;
    /* 0x56 */ s16 unk56;
} Sprite_PikoPiko; /* size: 0x58 */

void Task_PikoPiko(void);
void TaskDestructor_PikoPiko(struct Task *);

// TODO: header
bool32 sub_800CA20(Sprite *s, s32 x, s32 y, u16 p3, Player *p);

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

        piko->spawnX = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
        piko->spawnY = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));
        piko->offsetX = 0;

        piko->offsetY = Q_24_8(sub_801F07C(Q_24_8_TO_INT(piko->spawnY),
                                           Q_24_8_TO_INT(piko->spawnX), piko->unk54, 8,
                                           NULL, sub_801EE64));

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

void Task_PikoPiko(void)
{
    Sprite_PikoPiko *piko = TaskGetStructPtr(gCurTask);
    Sprite *s = &piko->s;
    MapEntity *me = piko->base.me;
    Vec2_32 pos;
    s32 delta;

    piko->offsetX += piko->unk56;

    delta = sub_801F07C(Q_24_8_TO_INT(piko->spawnY + piko->offsetY),
                        Q_24_8_TO_INT(piko->spawnX + piko->offsetX), piko->unk54, 8,
                        NULL, sub_801EE64);

    if (delta < 0) {
        piko->offsetY += Q_24_8(delta);

        delta = sub_801F100(Q_24_8_TO_INT(piko->spawnY + piko->offsetY),
                            Q_24_8_TO_INT(piko->spawnX + piko->offsetX), piko->unk54, 8,
                            sub_801EC3C);
    }

    if (delta > 0) {
        piko->offsetY += Q_24_8(delta);
    }

    pos.x = Q_24_8_TO_INT(piko->spawnX + piko->offsetX);
    pos.y = Q_24_8_TO_INT(piko->spawnY + piko->offsetY);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (!(sub_800CA20(s, pos.x, pos.y, 1, &gPlayer) == TRUE)) {
        if (sub_800C4FC(s, pos.x, pos.y, 0) == TRUE) {
            TaskDestroy(gCurTask);
            return;
        }
    }

    if (IS_OUT_OF_DISPLAY_RANGE(Q_24_8_TO_INT(piko->spawnX), Q_24_8_TO_INT(piko->spawnY))
        && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, piko->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if ((Q_24_8_TO_INT(piko->offsetX) <= me->d.sData[0] * TILE_WIDTH)
        && (piko->unk56 < 0)) {
        NEGATE(piko->unk56);
    } else if ((Q_24_8_TO_INT(piko->offsetX)
                >= (me->d.sData[0] * TILE_WIDTH + me->d.uData[2] * TILE_WIDTH))
               && (piko->unk56 > 0)) {
        NEGATE(piko->unk56);
    }

    sub_80122DC(Q_24_8(pos.x), Q_24_8(pos.y));
    sub_8004558(s);
    sub_80051E8(s);
}

void TaskDestructor_PikoPiko(struct Task *t)
{
    Sprite_PikoPiko *piko = TaskGetStructPtr(t);
    VramFree(piko->s.graphics.dest);
}