#include "global.h"
#include "gba/types.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"

#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_InclineRamp;

static void Task_InclineRamp(void)
{
    Sprite_InclineRamp *ramp = TaskGetStructPtr(gCurTask);
    MapEntity *me = ramp->base.me;
    u32 moveState;
    s16 screenX, screenY;

    screenX = TO_WORLD_POS(ramp->base.spriteX, ramp->base.regionY);

    // @BUG - Same as inside initSprite func (regionX used instead of regionY)
    screenY = TO_WORLD_POS(me->y, ramp->base.regionX);

    moveState = gPlayer.moveState;
    if (!(moveState & MOVESTATE_DEAD) && (screenX <= Q_24_8_TO_INT(gPlayer.x))
        && ((screenX + me->d.uData[2] * TILE_WIDTH) >= Q_24_8_TO_INT(gPlayer.x))
        && (screenY <= Q_24_8_TO_INT(gPlayer.y))
        && ((screenY + me->d.uData[3] * TILE_WIDTH) >= Q_24_8_TO_INT(gPlayer.y))
        && (!(moveState & MOVESTATE_IN_AIR))) {
        //  spriteY == me->d.uData[0]; (set in initSprite, below)
        if (((s8)ramp->base.spriteY) == 0) {
            if (gPlayer.speedAirX > Q_24_8(4)) {
                moveState &= ~MOVESTATE_8;
                moveState |= MOVESTATE_IN_AIR;
                moveState &= ~MOVESTATE_100;
                moveState &= ~MOVESTATE_4;
                gPlayer.moveState = moveState;

                sub_8023B5C(&gPlayer, 14);
                gPlayer.unk16 = 6;
                gPlayer.unk17 = 14;
                gPlayer.speedAirY = Q_8_8(-3);
                gPlayer.speedGroundX = Q_8_8(17);
                gPlayer.speedAirX += Q_8_8(17);

                sub_8023260(&gPlayer);
                sub_80218E4(&gPlayer);
                sub_8023B5C(&gPlayer, 14);
                gPlayer.unk16 = 6;
                gPlayer.unk17 = 14;

                gPlayer.unk64 = 39;
                gPlayer.transition = PLTRANS_PT7;
                m4aSongNumStart(SE_SPRING);
            }
        } else {
            // _0805DC20
            if (gPlayer.speedAirX < Q_8_8(-4)) {
                moveState &= ~MOVESTATE_8;
                moveState |= MOVESTATE_IN_AIR;
                moveState &= ~MOVESTATE_100;
                moveState &= ~MOVESTATE_4;
                gPlayer.moveState = moveState;

                sub_8023B5C(&gPlayer, 14);
                gPlayer.unk16 = 6;
                gPlayer.unk17 = 14;
                gPlayer.speedAirY = Q_8_8(-3);
                gPlayer.speedGroundX = Q_8_8(-17);
                gPlayer.speedAirX += Q_8_8(-17);

                sub_8023260(&gPlayer);
                sub_80218E4(&gPlayer);
                sub_8023B5C(&gPlayer, 14);
                gPlayer.unk16 = 6;
                gPlayer.unk17 = 14;

                gPlayer.unk64 = 11;
                gPlayer.transition = PLTRANS_PT7;
                m4aSongNumStart(SE_SPRING);
            }
        }
    }
    // _8085DC8A

    screenX -= gCamera.x;
    screenY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        me->x = ramp->base.spriteX;
        TaskDestroy(gCurTask);
    }
}

void CreateEntity_InclineRamp(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                              u8 param3)
{
    struct Task *t
        = TaskCreate(Task_InclineRamp, sizeof(Sprite_InclineRamp), 0x2000, 0, NULL);
    Sprite_InclineRamp *ramp = TaskGetStructPtr(t);

    // @BUG? (regionY gets set to regionX and vice versa)
    ramp->base.regionY = spriteRegionX;
    ramp->base.regionX = spriteRegionY;
    ramp->base.me = me;

    ramp->base.spriteY = me->d.uData[0];
    ramp->base.spriteX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);
}
