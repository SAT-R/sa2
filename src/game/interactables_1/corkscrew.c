#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "task.h"
#include "core.h"
#include "sprite.h"
#include "trig.h"
#include "game/entity.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    SpriteBase base;
    s32 unkC;
    s32 unk10;
} Sprite_Corkscrew;

void sub_8060ED0(void);

void Task_8060D34(void)
{
    Sprite_Corkscrew *corkscrew = TaskGetStructPtr(gCurTask);
    MapEntity *me = corkscrew->base.me;

    u16 regionX = corkscrew->base.regionX;
    u16 regionY = corkscrew->base.regionY;
    s32 x = SpriteGetScreenPos(corkscrew->base.spriteX, regionX);
    s32 y = SpriteGetScreenPos(corkscrew->base.me->y, regionY);

    if (PlayerIsAlive) {
        if ((x + (me->d.sData[0] * 8) <= Q_24_8_TO_INT(gPlayer.x)
             && (x + (me->d.sData[0] * 8) + (me->d.uData[2] * 8)
                 >= Q_24_8_TO_INT(gPlayer.x)))
            && (y + (me->d.sData[1] * 8) <= Q_24_8_TO_INT(gPlayer.y)
                && y + (me->d.sData[1] * 8) + (me->d.uData[3] * 8)
                    >= Q_24_8_TO_INT(gPlayer.y))) {
            if (x < Q_24_8_TO_INT(gPlayer.x) && (corkscrew->base.spriteY & 1)) {
                s32 idx;
                s32 yVal;
                gPlayer.unk6D = 27;

                idx = ((((Q_24_8_TO_INT(gPlayer.x) - x) * 930) >> 8) + 256) & ONE_CYCLE;
                gPlayer.x += gPlayer.speedGroundX;
                yVal = (y * 0x100);
                gPlayer.y = SIN_24_8(idx) * 0x18 + yVal - 7168;

                gPlayer.speedAirY = 0;
                gCurTask->main = sub_8060ED0;
            } else if ((x >= Q_24_8_TO_INT(gPlayer.x)) && gPlayer.speedGroundX > 0x400
                       && !(gPlayer.moveState & 2)
                       && !(gPlayer.unk5E & gPlayerControls.jump)) {
                corkscrew->base.spriteY |= 1;
            } else {
                corkscrew->base.spriteY &= ~1;
            }
        } else {
            corkscrew->base.spriteY &= ~1;
        }
    }

    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, x, y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, corkscrew->base.spriteX);
        TaskDestroy(gCurTask);
    }
}
