#include "global.h"
#include "core.h"
#include "sprite.h"
#include "task.h"

#include "game/entity.h"
#include "game/sa1_sa2_shared/interactables/ceiling_slope.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/player_transitions.h"
#include "constants/interactables.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_CeilingSlope;

#define sLeft   (screenX + me->d.sData[0] * TILE_WIDTH)
#define sRight  ((sLeft) + me->d.uData[2] * TILE_WIDTH)
#define sTop    (screenY + me->d.sData[1] * TILE_WIDTH)
#define sBottom ((sTop) + me->d.uData[3] * TILE_WIDTH)
void Task_Interactable_CeilingSlope(void)
{
    Sprite_CeilingSlope *ceilingSlope = TASK_DATA(gCurTask);
    SpriteBase *base = &ceilingSlope->base;
    MapEntity *me = base->me;
    s32 screenX, screenY;
    u32 regionY, regionX;
    s32 left, top;
    s32 playerX, playerY;
    s32 spriteX;

    spriteX = base->meX;
    regionX = base->regionX;
    regionY = base->regionY;
    screenX = TO_WORLD_POS(spriteX, regionX);
    screenY = TO_WORLD_POS(me->y, regionY);

    left = sLeft;
    playerX = I(gPlayer.qWorldX);

    if ((left <= playerX) && sRight >= playerX) {
        top = sTop;
        playerY = I(gPlayer.qWorldY);

        if ((top <= playerY) && sBottom >= playerY) {
            u32 moveState = gPlayer.moveState;
            if (((moveState & (MOVESTATE_40000 | MOVESTATE_IN_AIR)) == MOVESTATE_IN_AIR) && (gPlayer.qSpeedAirY < 0)) {
                if (moveState & MOVESTATE_10000000) {
                    base->id = 1;
                }

                if ((!(moveState & MOVESTATE_10000000) || !(gPlayer.moveState & MOVESTATE_10000000)) && base->id == 0) {
                    gPlayer.transition = PLTRANS_PT23;
                    gPlayer.unk6E = 0;

                    if (me->index != IA__CEILING_SLOPE__A) {
                        // me->index == IA__CEILING_SLOPE__B
                        gPlayer.unk6E = 1;
                    }
                }
            }
        } else {
            base->id = 0;
        }
    } else {
        base->id = 0;
    }

    screenX -= gCamera.x;
    screenY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
        return;
    }
}
#undef sBottom
#undef sTop
#undef sRight
#undef sLeft

void CreateEntity_CeilingSlope(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_CeilingSlope, sizeof(Sprite_CeilingSlope), 0x2010, 0, NULL);
    Sprite_CeilingSlope *ceilingSlope = TASK_DATA(t);

    ceilingSlope->base.regionX = spriteRegionX;
    ceilingSlope->base.regionY = spriteRegionY;
    ceilingSlope->base.me = me;
    ceilingSlope->base.meX = me->x;
    ceilingSlope->base.id = 0;
    SET_MAP_ENTITY_INITIALIZED(me);
}
