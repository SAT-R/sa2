#include "global.h"
#include "core.h"
#include "task.h"
#include "sprite.h"
#include "game/entity.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "lib/m4a.h"
#include "game/stage_entities_manager.h"

#include "constants/songs.h"
#include "constants/animations.h"

typedef struct {
    /* 0x0 */ SpriteBase base;
    /* 0xA */ Sprite displayed;
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
    Sprite *displayed;
    struct Task *t = TaskCreate(sub_806160C, 0x44, 0x2010, 0, TaskDestructor_80095E8);
    BouncyBar *bar = TaskGetStructPtr(t);

    displayed = &bar->displayed;

    bar->base.regionX = spriteRegionX;
    bar->base.regionY = spriteRegionY;
    bar->base.me = me;
    bar->base.spriteX = me->x;
    bar->base.spriteY = spriteY;

    bar->unk3C = 0;
    bar->unk3D = 0;
    bar->unk3E = 0;
    bar->unk40 = 0;

    displayed->x = TO_WORLD_POS(me->x, spriteRegionX);
    displayed->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    displayed->graphics.dest = VramMalloc(0x18);
    displayed->graphics.anim = 0x21A;
    displayed->variant = 0;

    displayed->unk1A = 0x480;
    displayed->graphics.size = 0;
    displayed->unk14 = 0;
    displayed->unk1C = 0;
    displayed->unk21 = 0xFF;
    displayed->unk22 = 0x10;
    displayed->focused = 0;
    displayed->unk28[0].unk0 = -1;
    displayed->unk10 = 0x2000;

    if (me->d.sData[0] != 0) {
        displayed->unk10 |= 0x400;
    }
}

void sub_806160C(void)
{
    BouncyBar *bar = TaskGetStructPtr(gCurTask);
    Sprite *displayed = &bar->displayed;
    MapEntity *me = bar->base.me;

    s32 screenX, screenY;

    screenX = TO_WORLD_POS(bar->base.spriteX, bar->base.regionX);
    screenY = TO_WORLD_POS(me->y, bar->base.regionY);
    displayed->x = screenX - gCamera.x;
    displayed->y = screenY - gCamera.y;

    if (!(gPlayer.moveState & MOVESTATE_DEAD)
        && (sub_800C204(displayed, screenX, screenY, 0, &gPlayer, 0) == 1)
        && (gPlayer.speedAirY > 0) && (Q_24_8_TO_INT(gPlayer.y) + 4) < screenY) {
        gPlayer.unk64 = 0x32;
        gPlayer.unk6D = 5;

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
        displayed->graphics.anim = 538;
        displayed->variant = bar->unk3C + 1;
        displayed->unk21 = 0xFF;
        bar->unk3C = 2 - bar->unk3C;
        m4aSongNumStart(SE_279);
    } else if (IS_OUT_OF_CAM_RANGE(displayed->x, displayed->y)) {
        me->x = bar->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    sub_8004558(displayed);
    sub_80051E8(displayed);
}

void sub_80617A4(void)
{
    BouncyBar *bar = TaskGetStructPtr(gCurTask);
    Sprite *displayed = &bar->displayed;
    MapEntity *me = bar->base.me;

    s32 screenX, screenY;

    screenX = TO_WORLD_POS(bar->base.spriteX, bar->base.regionX);
    screenY = TO_WORLD_POS(me->y, bar->base.regionY);
    displayed->x = screenX - gCamera.x;
    displayed->y = screenY - gCamera.y;

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

    if (IS_OUT_OF_CAM_RANGE(displayed->x, displayed->y)) {
        me->x = bar->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    if (sub_8004558(displayed) == 0) {
        displayed->graphics.anim = 538;
        displayed->variant = 0;
        displayed->unk21 = 0xFF;
        gCurTask->main = sub_806160C;
    }
    sub_80051E8(displayed);
}
