#include "global.h"
#include "core.h"
#include "sprite.h"
#include "task.h"

#include "game/entity.h"
#include "game/sa1_sa2_shared/interactables/044.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/player_transitions.h"
#include "constants/interactables.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_IA044;

#define sLeft   (screenX + me->d.sData[0] * TILE_WIDTH)
#define sRight  ((sLeft) + me->d.uData[2] * TILE_WIDTH)
#define sTop    (screenY + me->d.sData[1] * TILE_WIDTH)
#define sBottom ((sTop) + me->d.uData[3] * TILE_WIDTH)
void Task_Interactable_044(void)
{
    Sprite_IA044 *ia044 = TASK_DATA(gCurTask);
    SpriteBase *base = &ia044->base;
    MapEntity *me = base->me;
    s32 screenX, screenY;
    u32 regionY, regionX;
    s32 left, top;
    s32 playerX, playerY;
    s32 spriteX;

    spriteX = base->spriteX;
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
            if (((moveState & (MOVESTATE_40000 | MOVESTATE_IN_AIR)) == MOVESTATE_IN_AIR) && (gPlayer.speedAirY < 0)) {
                if (moveState & MOVESTATE_10000000) {
                    base->id = 1;
                }

                if ((!(moveState & MOVESTATE_10000000) || !(gPlayer.moveState & MOVESTATE_10000000)) && base->id == 0) {
                    gPlayer.transition = PLTRANS_PT23;
                    gPlayer.unk6E = 0;

                    if (me->index != IA__IA044__A) {
                        // me->index == IA__IA044__B
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

void CreateEntity_044(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_044, sizeof(Sprite_IA044), 0x2010, 0, NULL);
    Sprite_IA044 *ia044 = TASK_DATA(t);

    ia044->base.regionX = spriteRegionX;
    ia044->base.regionY = spriteRegionY;
    ia044->base.me = me;
    ia044->base.spriteX = me->x;
    ia044->base.id = 0;
    SET_MAP_ENTITY_INITIALIZED(me);
}
