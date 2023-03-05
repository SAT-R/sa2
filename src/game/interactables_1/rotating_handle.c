#include "global.h"
#include "gba/types.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_1/rotating_handle.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    Sprite sprite;
    s16 unk3C;
    s16 unk3E;
    u8 unk40;
} Sprite_RotatingHandle;

void sub_805EA94(void);
void TaskDestructor_80095E8(struct Task *);

void initSprite_Interactable_RotatingHandle(MapEntity *me, u16 spriteRegionX,
                                            u16 spriteRegionY, u8 spriteY)
{
    if (me->d.sData[0] >= 0) {
        struct Task *t
            = TaskCreate(sub_805EA94, 0x44, 0x2010, 0, TaskDestructor_80095E8);
        Sprite_RotatingHandle *rotatingHandle = TaskGetStructPtr(t);
        Sprite *sprite = &rotatingHandle->sprite;
        rotatingHandle->base.regionX = spriteRegionX;
        rotatingHandle->base.regionY = spriteRegionY;
        rotatingHandle->base.me = me;
        rotatingHandle->base.spriteX = me->x;
        rotatingHandle->base.spriteY = spriteY;
        rotatingHandle->unk3C = 0;
        rotatingHandle->unk3E = 0;
        rotatingHandle->unk40 = 0;

        sprite->x = SpriteGetScreenPos(me->x, spriteRegionX);
        sprite->y = SpriteGetScreenPos(me->y, spriteRegionY);
        SET_SPRITE_INITIALIZED(me);

        sprite->graphics.dest = VramMalloc(9);
        sprite->graphics.anim = 546;
        sprite->variant = 0;

        sprite->unk1A = 0x480;
        sprite->graphics.size = 0;
        sprite->unk14 = 0;
        sprite->unk1C = 0;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        sprite->focused = 0;
        sprite->unk28[0].unk0 = -1;
        sprite->unk10 = 0x2000;
    }
}

void sub_805ECA0(void);

void sub_805EA94(void)
{
    Sprite_RotatingHandle *rotatingHandle = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &rotatingHandle->sprite;
    MapEntity *me = rotatingHandle->base.me;
    s32 x
        = SpriteGetScreenPos(rotatingHandle->base.spriteX, rotatingHandle->base.regionX);
    s32 y = SpriteGetScreenPos(me->y, rotatingHandle->base.regionY);

    sprite->x = x - gCamera.x;
    sprite->y = y - gCamera.y;

    if (!(gPlayer.moveState & (MOVESTATE_400000 | MOVESTATE_DEAD))
        && sub_800C204(sprite, x, y, 0, &gPlayer, 0) == 1) {
#ifndef NON_MATCHING
        register s32 temp1 asm("r0"), temp2;
#else
        s32 temp1, temp2;
#endif
        sub_80218E4(&gPlayer);
        rotatingHandle->unk3C = 0;

        temp1 = abs(gPlayer.speedAirX);
        temp2 = abs(gPlayer.speedAirY);
        rotatingHandle->unk3E = temp1 + temp2;
        if (rotatingHandle->unk3E < 0xE0) {
            rotatingHandle->unk3E = 0xE0;
        }

        if (rotatingHandle->unk3E > 0x180) {
            rotatingHandle->unk3E = 0x180;
        }

        if (gPlayer.speedAirX > 0) {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
            if (Q_24_8_TO_INT(gPlayer.y) > y) {
                sprite->unk10 |= 0x400;
                gPlayer.unk64 = 0x2D;
                rotatingHandle->unk40 = 0;
            } else {
                sprite->unk10 &= ~0x400;
                gPlayer.unk64 = 0x2E;
                rotatingHandle->unk40 = 1;
            }
        } else {
            gPlayer.moveState |= 1;
            if (Q_24_8_TO_INT(gPlayer.y) > y) {
                sprite->unk10 &= ~0x400;
                gPlayer.unk64 = 0x2D;
                rotatingHandle->unk40 = 2;
            } else {
                sprite->unk10 |= 0x400;
                gPlayer.unk64 = 0x2E;
                rotatingHandle->unk40 = 3;
            }
        }

        gPlayer.x = Q_24_8(x);
        gPlayer.y = Q_24_8(y);
        gPlayer.unk6A = 0;
        gPlayer.unk6C = 1;
        m4aSongNumStart(SE_SPEED_BOOSTER);
        gPlayer.unk62 = 0;
        gPlayer.moveState |= MOVESTATE_400000;
        gCurTask->main = sub_805ECA0;
    } else {
        if (IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
            me->x = rotatingHandle->base.spriteX;
            TaskDestroy(gCurTask);
            return;
        }
    }

    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_805EF90(void);

// void sub_805ECA0(void)
// {
//     Sprite_RotatingHandle *rotatingHandle = TaskGetStructPtr(gCurTask);
//     SpriteBase *base = &rotatingHandle->base;
//     Sprite *sprite = &rotatingHandle->sprite;
//     MapEntity *me = base->me;
//     u32 temp;
//     u32 tempX;
//     register u32 cycle;
//     s32 x, y;
//     s32 sin, cos;
//     x = SpriteGetScreenPos(base->spriteX, base->regionX);
//     y = SpriteGetScreenPos(me->y, base->regionY);

//     temp = (rotatingHandle->unk3E + rotatingHandle->unk3C);
//     temp &= 0x3FF0;
//     tempX = temp;

//     rotatingHandle->unk3C = temp;
//     cycle = ONE_CYCLE;
//     temp = temp >> 4;

//     sprite->x = x - gCamera.x;
//     sprite->y = y - gCamera.y;

//     if (!PlayerIsAlive) {
//         gCurTask->main = sub_805EF90;
//         sub_80051E8(sprite);
//         return;
//     }

//     if (gPlayer.unk5E & gPlayerControls.jump) {
//         u32 temp2;
//         gPlayer.unk6D = 5;
//         me->x = base->spriteX;
//         sub_80218E4(&gPlayer);
//         sub_8023B5C(&gPlayer, 9);
//         gPlayer.unk16 = 6;
//         gPlayer.unk17 = 9;
//         gPlayer.moveState &= ~MOVESTATE_400000;
//         gCurTask->main = sub_805EF90;

//         switch (rotatingHandle->unk40) {
//             case 0:
//                 temp2 = (0x20 - temp) & cycle;
//                 sin = SIN(temp);
//                 gPlayer.x += sin >> 1;
//                 cos = COS(temp);
//                 gPlayer.y += cos >> 1;
//                 break;
//             case 1:
//                 temp2 = (temp + 0x20) & cycle;
//                 sin = SIN(temp);
//                 gPlayer.x += sin >> 1;
//                 cos = COS(temp);
//                 gPlayer.y -= cos >> 1;
//                 break;
//             case 2:
//                 temp2 = (temp + 0x1E0) & cycle;
//                 sin = SIN(temp);
//                 gPlayer.x -= sin >> 1;
//                 cos = COS(temp);
//                 gPlayer.y += cos >> 1;

//                 break;
//             case 3:
//                 temp2 = (0x220 - temp) & cycle;
//                 sin = SIN(temp);
//                 gPlayer.x -= sin >> 1;
//                 cos = COS(temp);
//                 gPlayer.y -= cos >> 1;
//                 break;
//             default:
//                 temp2 = 0;
//                 break;
//         }
//         gPlayer.speedAirX = Div(COS(temp2) << 1, 0x11);
//         gPlayer.speedAirY = Div(SIN(temp2) << 1, 0x11);
//         gPlayer.unk64 = 0x32;
//         gPlayer.unk6C = 1;
//     } else {
//         u8 temp3;
//         if (gPlayer.unk64 == 0x2D) {
//             temp3 = Div(temp, 0x56);
//             if (temp3 > 0xB) {
//                 goto lab;
//             }
//         } else {
//             temp3 = Div(temp, 0x56);
//             if (temp3 > 0xB) {
//             lab:
//                 temp3 = 0xB;
//             }
//         }

//         sprite->graphics.anim = 0x222;
//         rotatingHandle->sprite.variant = temp3;
//         rotatingHandle->sprite.unk21 = 0xFF;
//         gPlayer.unk6A = temp3;
//         gPlayer.unk6C = 1;
//         gPlayer.x = Q_24_8(x);
//         gPlayer.y = Q_24_8(y);
//         gPlayer.speedAirX = 0;
//         gPlayer.speedAirY = 0;
//     }

//     if (IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
//         me->x = base->spriteX;
//         TaskDestroy(gCurTask);
//         return;
//     }

//     sub_8004558(sprite);
//     sub_80051E8(sprite);
// }

// void sub_805EF90(void)
// {
//     Sprite_RotatingHandle *rotatingHandle = TaskGetStructPtr(gCurTask);
//     MapEntity *me = &rotatingHandle->base.me;
//     Sprite *sprite = &rotatingHandle->sprite;
//     u8 spriteX = rotatingHandle->base.spriteX;
//     u16 regionX = rotatingHandle->base.regionX;
//     u8 spriteY = me->y;
//     u16 regionY = rotatingHandle->base.regionY;

//     u32 temp, tempX;
//     u8 temp3;

//     rotatingHandle->unk3E--;

//     if (rotatingHandle->unk3E < 0xE0) {
//         rotatingHandle->unk3E = 0xE0;
//     }

//     temp = (rotatingHandle->unk3E + rotatingHandle->unk3C);
//     temp &= 0x3FF0;
//     tempX = temp;

//     rotatingHandle->unk3C = tempX;

//     temp3 = Div(tempX >> 4, 85);
//     if (temp3 > 0xB) {
//         temp3 = 0xB;
//     }

//     sprite->graphics.anim = 0x222;
//     sprite->variant = temp3;
//     sprite->unk21 = -1;
//     sprite->x = SpriteGetScreenPos(spriteX, regionX) - gCamera.x;
//     sprite->y = SpriteGetScreenPos(spriteY, regionY) - gCamera.y;

//     if (IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
//         me->x = rotatingHandle->base.spriteX;
//         TaskDestroy(gCurTask);
//         return;
//     }

//     if (temp3 == 0) {
//         rotatingHandle->unk3C = 0;
//         rotatingHandle->unk3E = 0;
//         gCurTask->main = sub_805EA94;
//     }
//     sub_8004558(sprite);
//     sub_80051E8(sprite);
// }
