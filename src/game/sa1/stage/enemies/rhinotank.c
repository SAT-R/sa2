#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ s16 unk3C;
    /* 0x40 */ s32 qUnk40;
    /* 0x44 */ s16 unk44;
    /* 0x46 */ s16 qSpeedX;
    /* 0x48 */ bool8 doTackle;
    /* 0x49 */ u8 unk49;
} Rhinotank;

void Task_RhinotankInit(void);
void Task_806CBD0(void);
void Task_806C9A0(void);

void CreateEntity_Rhinotank(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_RhinotankInit, sizeof(Rhinotank), 0x2000, 0, TaskDestructor_EntityShared);
    Rhinotank *rhinotank = TASK_DATA(t);
    Sprite *s = &rhinotank->shared.s;

    rhinotank->shared.base.regionX = regionX;
    rhinotank->shared.base.regionY = regionY;
    rhinotank->shared.base.me = me;
    rhinotank->shared.base.meX = me->x;
    rhinotank->shared.base.id = id;

    rhinotank->qSpeedX = -Q(0.625);
    rhinotank->qUnk40 = 0;
    rhinotank->unk3C = Q(0);
    rhinotank->unk44 = 0;
    rhinotank->doTackle = FALSE;
    rhinotank->unk49 = 0;

    // NOTE: x|y set to world- not screen-pos!
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_RHINOTANK);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_RHINOTANK;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

void Task_RhinotankInit(void)
{
    Rhinotank *rhinotank = TASK_DATA(gCurTask);
    Sprite *s = &rhinotank->shared.s;
    MapEntity *me = rhinotank->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    u8 sp08;

    worldX = TO_WORLD_POS(rhinotank->shared.base.meX, rhinotank->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, rhinotank->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    rhinotank->qUnk40 += rhinotank->qSpeedX;

    if (rhinotank->unk49 > 0) {
        rhinotank->unk49--;

        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            rhinotank->qUnk40 += rhinotank->unk49 * 13;
        } else {
            rhinotank->qUnk40 -= rhinotank->unk49 * 13;
        }
    }

    worldX += Div(rhinotank->qUnk40, 0x100);
    worldY += rhinotank->unk3C;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, rhinotank->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    } else if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        TaskDestroy(gCurTask);
        return;
    } else {
        rhinotank->unk3C += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, +8, &sp08, SA2_LABEL(sub_801EE64));

        if (I(rhinotank->qUnk40) <= (me->d.sData[0] + 1) * TILE_WIDTH) {
            if (~s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                if (rhinotank->doTackle) {
                    rhinotank->qUnk40 += Q(3);
                }

                rhinotank->unk44 = 0;
                rhinotank->qSpeedX = +Q(0.625);
                s->variant = 2;
                gCurTask->main = Task_806C9A0;
            }
        } else if (I(rhinotank->qUnk40) >= ((me->d.sData[0] + me->d.uData[2]) - 1) * TILE_WIDTH) {
            if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                if (rhinotank->doTackle) {
                    rhinotank->qUnk40 -= Q(3);
                }

                rhinotank->unk44 = 0;
                rhinotank->qSpeedX = -Q(0.625);
                s->variant = 2;
                gCurTask->main = Task_806C9A0;
            }
        } else if (!rhinotank->doTackle && I(gPlayer.qWorldY) <= (worldY + 8) && (worldY - 32 <= I(gPlayer.qWorldY))) {
            // Rev-up and tackle player
            if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                if ((I(gPlayer.qWorldX) >= worldX) && (worldX + 80 >= I(gPlayer.qWorldX))) {
                    rhinotank->doTackle = TRUE;
                    rhinotank->unk44 = 0;
                    rhinotank->qSpeedX = +Q(3);
                    s->variant = 1;
                    gCurTask->main = Task_806CBD0;
                }
            } else {
                if ((I(gPlayer.qWorldX) <= worldX) && (worldX - 80 <= I(gPlayer.qWorldX))) {
                    rhinotank->doTackle = TRUE;
                    rhinotank->unk44 = 0;
                    rhinotank->qSpeedX = -Q(3);
                    s->variant = 1;
                    gCurTask->main = Task_806CBD0;
                }
            }
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_806C9A0(void)
{
    Rhinotank *rhinotank = TASK_DATA(gCurTask);
    Sprite *s = &rhinotank->shared.s;
    MapEntity *me = rhinotank->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    u8 sp08;

    worldX = TO_WORLD_POS(rhinotank->shared.base.meX, rhinotank->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, rhinotank->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    worldX = worldX2 + I(rhinotank->qUnk40);
    worldY = worldY2 + rhinotank->unk3C;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, rhinotank->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    } else if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        TaskDestroy(gCurTask);
        return;
    } else {
        s32 divisor;
        rhinotank->unk3C += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, +8, &sp08, SA2_LABEL(sub_801EE64));

        if (rhinotank->doTackle) {
            divisor = 32;
        } else {
            divisor = 64;
        }

        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            rhinotank->qUnk40 += Div(COS(rhinotank->unk44 * 21), divisor);
        } else {
            rhinotank->qUnk40 -= Div(COS(rhinotank->unk44 * 21), divisor);
        }

        if (++rhinotank->unk44 == 24) {
            s->variant = 0;

            if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                rhinotank->qUnk40 += rhinotank->qSpeedX;
                rhinotank->qSpeedX = -Q(0.625);
                SPRITE_FLAG_CLEAR(s, X_FLIP);
            } else {
                rhinotank->qUnk40 += rhinotank->qSpeedX;
                rhinotank->qSpeedX = +Q(0.625);
                SPRITE_FLAG_SET(s, X_FLIP);
            }

            if (rhinotank->doTackle) {
                rhinotank->unk49 = 0;
            }

            rhinotank->doTackle = FALSE;
            gCurTask->main = Task_RhinotankInit;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_806CBD0(void)
{
    Rhinotank *rhinotank = TASK_DATA(gCurTask);
    Sprite *s = &rhinotank->shared.s;
    MapEntity *me = rhinotank->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    u8 sp08;

    worldX = TO_WORLD_POS(rhinotank->shared.base.meX, rhinotank->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, rhinotank->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    worldX = worldX2 + I(rhinotank->qUnk40);
    worldY = worldY2 + rhinotank->unk3C;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, rhinotank->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    } else if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        TaskDestroy(gCurTask);
        return;
    } else {
        u32 divisor;
        rhinotank->unk3C += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, +8, &sp08, SA2_LABEL(sub_801EE64));

        if (++rhinotank->unk44 == 25) {
            s->variant = 0;
            gCurTask->main = Task_RhinotankInit;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}