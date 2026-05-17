#include "global.h"
#include "core.h"
#include "game/shared/stage/entity.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ u8 fillerC[0x30];
    /* 0x3C */ s32 qWorld;
    /* 0x40 */ u8 unk40;
    /* 0x41 */ u8 kind;
} ToggleGravity;

void Task_ToggleGravity(void);

// (95.78%) https://decomp.me/scratch/YPlUl
NONMATCH("asm/non_matching/game/sa1/stage/interactables/toggle_gravity__Task_ToggleGravity.inc", void Task_ToggleGravity(void))
{
    ToggleGravity *ia = TASK_DATA(gCurTask);
    MapEntity *me = ia->base.me;
    CamCoord worldX, worldY;
    s16 screenX, screenY;
    s32 left;

    worldX = TO_WORLD_POS(ia->base.meX, ia->base.regionX);
    worldY = TO_WORLD_POS(me->y, ia->base.regionY);

    if (PLAYER_IS_ALIVE) {
        u8 kind = ia->kind;
        if (kind > 2) {
            left = worldX + me->d.sData[0] * TILE_WIDTH;

            if ((left <= I(gPlayer.qWorldX)) && ((left + me->d.uData[2] * TILE_WIDTH) >= I(gPlayer.qWorldX))) {
                if (ia->qWorld > Q(worldY)) {
                    if (gPlayer.qWorldY < Q(worldY)) {
                        if (kind == 3) {
                            goto k_3;
                        } else if (kind == 4) {
                            goto k_4;
                        } else {
                            gStageFlags |= STAGE_FLAG__GRAVITY_INVERTED;
                        }
                    }
                } else if (ia->qWorld < Q(worldY)) {
                    if (gPlayer.qWorldY > Q(worldY)) {
                        if (kind == 3) {
                        k_3:
                            if (!(gStageFlags & STAGE_FLAG__GRAVITY_INVERTED)) {
                                gStageFlags |= STAGE_FLAG__GRAVITY_INVERTED;
                            } else {
                                gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;
                            }
                        } else if (kind == 4) {
                        k_4:
                            gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;
                        } else {
                            gStageFlags |= STAGE_FLAG__GRAVITY_INVERTED;
                        }
                    }
                }
            }

            ia->qWorld = gPlayer.qWorldY;
        } else {
            // _0809558C
            s32 top = worldY + me->d.sData[1] * TILE_WIDTH;

            if ((top <= I(gPlayer.qWorldY)) && ((top + me->d.uData[3] * TILE_WIDTH) >= I(gPlayer.qWorldY))) {
                if (ia->qWorld > Q(worldX)) {
                    if (gPlayer.qWorldX < Q(worldX)) {
                        if (kind == 0) {
                            goto test;
                        } else if (kind == 1) {
                            gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;
                        } else {
                            gStageFlags |= STAGE_FLAG__GRAVITY_INVERTED;
                        }
                    }
                } else if (ia->qWorld < Q(worldX)) {
                    if (gPlayer.qWorldX > Q(worldX)) {
                        if (kind == 0) {
                        test:
                            if (!(gStageFlags & STAGE_FLAG__GRAVITY_INVERTED)) {
                                gStageFlags |= STAGE_FLAG__GRAVITY_INVERTED;
                            } else {
                                gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;
                            }
                        } else if (kind == 1) {
                            gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;
                        } else {
                            gStageFlags |= STAGE_FLAG__GRAVITY_INVERTED;
                        }
                    }
                }
            }

            ia->qWorld = gPlayer.qWorldX;
        }
    }
    // _08095616

    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, ia->base.meX);
        TaskDestroy(gCurTask);
        return;
    }
}
END_NONMATCH

void CreateEntity_ToggleGravity(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = NULL;
    ToggleGravity *ia;
    t = TaskCreate(Task_ToggleGravity, sizeof(ToggleGravity), 0x2000, 0, NULL);
    ia = TASK_DATA(t);

    ia->base.regionX = regionX;
    ia->base.regionY = regionY;
    ia->base.me = me;
    ia->base.meX = me->x;
    ia->base.id = id;
    ia->unk40 = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        ia->kind = me->d.uData[1];
        ia->qWorld = gPlayer.qWorldY;
    } else {
        ia->kind = me->d.uData[0];
        ia->qWorld = gPlayer.qWorldX;
    }

    SET_MAP_ENTITY_INITIALIZED(me);
}
