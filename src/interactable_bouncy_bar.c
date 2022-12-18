#include "global.h"
#include "main.h"
#include "task.h"
#include "sprite.h"
#include "interactable.h"
#include "malloc_vram.h"
#include "game.h"
#include "m4a.h"
#include "constants/songs.h"
#include "constants/move_states.h"
#include "constants/animations.h"

typedef struct {
    /* 0x0 */ SpriteBase base;
    /* 0xC */ Sprite displayed;
    /* 0x3C */ u8 unk3C;
    /* 0x3D */ u8 unk3D;
    /* 0x3E */ u16 unk3E;
    /* 0x40 */ u16 unk40;
} BouncyBar;

void sub_806160C(void);

void TaskDestructor_80095E8(struct Task *);
void initSprite_Interactable_BouncyBar(Interactable *ia, u16 spriteRegionX,
                                       u16 spriteRegionY, u8 spriteY)
{
    Sprite *displayed;
    struct Task *t = TaskCreate(sub_806160C, 0x44, 0x2010, 0, TaskDestructor_80095E8);
    BouncyBar *bar = TaskGetStructPtr(t);

    displayed = &bar->displayed;

    bar->base.regionX = spriteRegionX;
    bar->base.regionY = spriteRegionY;
    bar->base.ia = ia;
    bar->base.spriteX = ia->x;
    bar->base.spriteY = spriteY;

    bar->unk3C = 0;
    bar->unk3D = 0;
    bar->unk3E = 0;
    bar->unk40 = 0;

    displayed->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    displayed->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    displayed->vram = VramMalloc(0x18);
    displayed->anim = 0x21A;
    displayed->variant = 0;

    displayed->unk1A = 0x480;
    displayed->unk8 = 0;
    displayed->unk14 = 0;
    displayed->unk1C = 0;
    displayed->unk21 = 0xFF;
    displayed->unk22 = 0x10;
    displayed->focused = 0;
    displayed->unk28[0].unk0 = -1;
    displayed->unk10 = 0x2000;

    if (ia->d.sData[0] != 0) {
        displayed->unk10 |= 0x400;
    }
}

extern const u16 gUnknown_080D94E8[];

void sub_80617A4(void);

void sub_806160C(void)
{
    BouncyBar *bar = TaskGetStructPtr(gCurTask);
    Sprite *displayed = &bar->displayed;
    Interactable *ia = bar->base.ia;

    s32 screenX, screenY;

    screenX = SpriteGetScreenPos(bar->base.spriteX, bar->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, bar->base.regionY);
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
        displayed->anim = 538;
        displayed->variant = bar->unk3C + 1;
        displayed->unk21 = 0xFF;
        bar->unk3C = 2 - bar->unk3C;
        m4aSongNumStart(SE_279);
    } else if ((u16)(displayed->x + 128) > 496 || ((s16)displayed->y + 128) < 0
               || ((s16)displayed->y) > 288) {
        ia->x = bar->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    sub_8004558(displayed);
    sub_80051E8(displayed);
}
