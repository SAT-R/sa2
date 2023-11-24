#include "global.h"
#include "core.h"
#include "task.h"
#include "sprite.h"
#include "game/entity.h"
#include "malloc_vram.h"
#include "game/stage/camera.h"
#include "game/game.h"
#include "lib/m4a.h"
#include "game/stage/entities_manager.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x0 */ SpriteBase base;
    /* 0xA */ Sprite s;
    /* 0x3C */ u8 unk3C;
    /* 0x3D */ u8 unk3D;
    /* 0x3E */ s16 unk3E;
    /* 0x40 */ s16 unk40;
} BouncyBar;

void sub_806160C(void);
void sub_80617A4(void);

const u16 gUnknown_080D94E8[] = { 9, 9, 9 };

const s8 gUnknown_080D94EE[] = { -16, -18, -20 };

const s16 gUnknown_080D94F2[] = { -384, -384, -384 };

void CreateEntity_BouncyBar(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                            u8 spriteY)
{
    Sprite *s;
    struct Task *t = TaskCreate(sub_806160C, 0x44, 0x2010, 0, TaskDestructor_80095E8);
    BouncyBar *bar = TASK_DATA(t);

    s = &bar->s;

    bar->base.regionX = spriteRegionX;
    bar->base.regionY = spriteRegionY;
    bar->base.me = me;
    bar->base.spriteX = me->x;
    bar->base.spriteY = spriteY;

    bar->unk3C = 0;
    bar->unk3D = 0;
    bar->unk3E = 0;
    bar->unk40 = 0;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(0x18);
    s->graphics.anim = 0x21A;
    s->variant = 0;

    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x2000;

    if (me->d.sData[0] != 0) {
        s->unk10 |= 0x400;
    }
}

void sub_806160C(void)
{
    BouncyBar *bar = TASK_DATA(gCurTask);
    Sprite *s = &bar->s;
    MapEntity *me = bar->base.me;

    s32 screenX, screenY;

    screenX = TO_WORLD_POS(bar->base.spriteX, bar->base.regionX);
    screenY = TO_WORLD_POS(me->y, bar->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (!(gPlayer.moveState & MOVESTATE_DEAD)
        && (sub_800C204(s, screenX, screenY, 0, &gPlayer, 0) == 1)
        && (gPlayer.speedAirY > 0) && (Q_24_8_TO_INT(gPlayer.y) + 4) < screenY) {
        gPlayer.unk64 = 0x32;
        gPlayer.transition = PLTRANS_PT5;

        bar->unk3C = gPlayer.speedAirY >> 0xA;
        if (bar->unk3C > 2) {
            bar->unk3C = 2;
        }

        bar->unk3D = (bar->unk3C * 5) + 10;
        bar->unk3E = gUnknown_080D94E8[bar->unk3C];

        bar->unk40 = screenX - Q_24_8_TO_INT(gPlayer.x) >= 0
            ? screenX - Q_24_8_TO_INT(gPlayer.x)
            : Q_24_8_TO_INT(gPlayer.x) - screenX;

        gCurTask->main = sub_80617A4;
        gPlayer.moveState |= MOVESTATE_400000;

        bar->unk3C = 2 - bar->unk3C;
        s->graphics.anim = 538;
        s->variant = bar->unk3C + 1;
        s->prevVariant = -1;
        bar->unk3C = 2 - bar->unk3C;
        m4aSongNumStart(SE_279);
    } else if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = bar->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void sub_80617A4(void)
{
    BouncyBar *bar = TASK_DATA(gCurTask);
    Sprite *s = &bar->s;
    MapEntity *me = bar->base.me;

    s32 screenX, screenY;

    screenX = TO_WORLD_POS(bar->base.spriteX, bar->base.regionX);
    screenY = TO_WORLD_POS(me->y, bar->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (bar->unk3D != 0) {
        s8 temp;
        bar->unk3D--;
        gPlayer.y += bar->unk40 * bar->unk3E;
        gPlayer.speedAirY = 0;

        if (bar->unk3D == 0) {
            temp = (bar->unk40 >> 1) + (bar->unk40 >> 2);

            if (temp > 0x18) {
                temp = 0x18;
            }

            gPlayer.speedAirY = gUnknown_080D94F2[bar->unk3C];
            gPlayer.speedAirY
                += ((temp * bar->unk3E) * gUnknown_080D94EE[bar->unk3C]) >> 1;
            gPlayer.moveState &= ~MOVESTATE_400000;
            gPlayer.moveState &= ~MOVESTATE_100;
        }
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = bar->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    if (UpdateSpriteAnimation(s) == 0) {
        s->graphics.anim = 538;
        s->variant = 0;
        s->prevVariant = -1;
        gCurTask->main = sub_806160C;
    }
    DisplaySprite(s);
}
