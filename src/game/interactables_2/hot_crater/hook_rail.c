#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"
#include "lib/m4a.h"
#include "game/entity.h"
#include "game/interactables_2/hot_crater/hook_rail.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    s32 x;
    s32 y;
    s16 width; /* 0x8*/
    s16 height; /* 0xA */
    s16 offsetX; /* 0xC */
    s16 offsetY; /* 0xE */
    u8 unk10;
    s32 unk14;
    s32 unk18;
    s32 unk1C;
    MapEntity *me; /* 0x20 */
    u8 spriteX;
    u8 spriteY;

} Sprite_HookRail;

void sub_8072F38(void);
void sub_8072FD4(struct Task *);
void sub_8072F8C(void);

void initSprite_Interactable_HookRail(u32 p1, MapEntity *me, u16 spriteRegionX,
                                      u16 spriteRegionY, u8 spriteY)
{
    struct Task *t;
    Sprite_HookRail *hookRail;
    switch (p1) {
        case 0:
            t = TaskCreate(sub_8072F38, 0x28, 0x2010, 0, sub_8072FD4);
            break;
        case 1:
            t = TaskCreate(sub_8072F38, 0x28, 0x2010, 0, sub_8072FD4);
            break;
        case 2:
            t = TaskCreate(sub_8072F8C, 0x28, 0x2010, 0, sub_8072FD4);
            break;
        default:
            SET_MAP_ENTITY_INITIALIZED(me);
            return;
    }

    hookRail = TaskGetStructPtr(t);
    hookRail->unk10 = p1;
    hookRail->x = TO_WORLD_POS(me->x, spriteRegionX);
    hookRail->y = TO_WORLD_POS(me->y, spriteRegionY);

    hookRail->width = me->d.sData[0] * TILE_WIDTH;
    hookRail->height = me->d.sData[1] * TILE_WIDTH;
    hookRail->offsetX = me->d.uData[2] * TILE_WIDTH + hookRail->width;
    hookRail->offsetY = me->d.uData[3] * TILE_WIDTH + hookRail->height;

    hookRail->me = me;
    hookRail->spriteX = me->x;
    hookRail->spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

void sub_8073088(Sprite_HookRail *);
void sub_8073048(Sprite_HookRail *);
void sub_807321C(void);
void sub_80731D4(void);
void sub_8072FD8(Sprite_HookRail *);
void sub_8073068(Sprite_HookRail *);
s16 sub_807319C(s16);

void sub_8072BB8(void)
{
    Sprite_HookRail *hookRail = TaskGetStructPtr(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        sub_8073068(hookRail);
        return;
    }

    if (gPlayer.unk2C == 120) {
        sub_8073088(hookRail);
    } else if (gPlayer.unk5E & gPlayerControls.jump) {
        sub_807321C();
        sub_8073048(hookRail);
    } else {
        s16 x, playerX;
        sub_80731D4();
        gPlayer.x += gPlayer.speedAirX;
        gPlayer.y += gPlayer.speedAirY;
        gPlayer.speedGroundX = sub_807319C(gPlayer.speedGroundX);

        x = hookRail->x - gCamera.x;
        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;

        if (hookRail->unk10 == 0) {
            if (playerX < x + hookRail->width) {
                sub_8072FD8(hookRail);
            }
        } else if (playerX > x + hookRail->offsetX) {
            sub_8072FD8(hookRail);
        }
    }
}

void sub_8073034(Sprite_HookRail *);

void sub_8072C90(void)
{
    Sprite_HookRail *hookRail = TaskGetStructPtr(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        sub_8073068(hookRail);
        return;
    }

    if (gPlayer.unk2C == 120) {
        sub_8073088(hookRail);
    } else if (gPlayer.unk5E & gPlayerControls.jump) {
        sub_807321C();
        sub_8073048(hookRail);
    } else if (gPlayer.rotation != 109 && gPlayer.rotation != 19) {
        sub_8073034(hookRail);
    } else {
        sub_80731D4();
        hookRail->unk1C += gPlayer.speedAirX;
        gPlayer.x = hookRail->unk14 + hookRail->unk1C;
        gPlayer.y = hookRail->unk18 + (ABS(hookRail->unk1C) >> 1);
        gPlayer.speedGroundX = sub_807319C(gPlayer.speedGroundX + 0x15);
    }
}

u32 sub_8072E84(Sprite_HookRail *);
void sub_80730F0(Sprite_HookRail *);
void sub_8073148(Sprite_HookRail *);
void sub_8073168(Sprite_HookRail *);

void sub_8072D40(void)
{
    Sprite_HookRail *hookRail = TaskGetStructPtr(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        sub_8073148(hookRail);
        return;
    }

    if (gPlayer.unk2C == 120) {
        sub_8073168(hookRail);
    } else if (gPlayer.unk5E & gPlayerControls.jump) {
        sub_807321C();
        sub_8073148(hookRail);
    } else {
        s16 x, playerX;
        sub_80731D4();
        gPlayer.x += gPlayer.speedAirX;
        gPlayer.y += gPlayer.speedAirY;
        gPlayer.speedGroundX = sub_807319C(gPlayer.speedGroundX);

        if (sub_8072E84(hookRail) == 0) {
            sub_80730F0(hookRail);
        }
    }
}

void sub_8072BB8(void);

void sub_8072DCC(Sprite_HookRail *hookRail)
{
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 0x37;
    sub_80218E4(&gPlayer);
    sub_8023B5C(&gPlayer, 14);
    gPlayer.unk16 = 6;
    gPlayer.unk17 = 14;
    gPlayer.moveState &= ~MOVESTATE_4;
    gPlayer.y = Q_24_8(hookRail->y + 0x14);
    hookRail->unk1C = 0;
    if (hookRail->unk10 == 0) {
        gPlayer.moveState |= MOVESTATE_FACING_LEFT;
        gPlayer.speedGroundX = gPlayer.speedAirX;

        if (gPlayer.speedGroundX > -Q_24_8(1)) {
            gPlayer.speedGroundX = -Q_24_8(1);
        }
        gPlayer.rotation = 128;
    } else {
        gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
        gPlayer.speedGroundX = gPlayer.speedAirX;
        if (gPlayer.speedGroundX < Q_24_8(1)) {
            gPlayer.speedGroundX = Q_24_8(1);
        }

        gPlayer.rotation = 0;
    }

    m4aSongNumStart(SE_283);
    gCurTask->main = sub_8072BB8;
}

u32 sub_8072E84(Sprite_HookRail *hookRail)
{
    s16 x, y, playerX, playerY;
    if (!PLAYER_IS_ALIVE) {
        return 0;
    }

    x = hookRail->x - gCamera.x;
    y = hookRail->y - gCamera.y;
    playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

    if (x + hookRail->width <= playerX
        && (x + hookRail->width) + (hookRail->offsetX - hookRail->width) >= playerX) {
        if (y + hookRail->height <= playerY
            && (y + hookRail->height) + (hookRail->offsetY - hookRail->height)
                >= playerY) {
            s16 temp = x + ((hookRail->offsetX + hookRail->width) >> 1);
            if (playerX < temp) {
                return 1;
            } else {
                return 2;
            }
        }
    }

    return 0;
}

u32 sub_8073238(Sprite_HookRail *);
void sub_8073280(Sprite_HookRail *);

void sub_8072F38(void)
{
    Sprite_HookRail *hookRail = TaskGetStructPtr(gCurTask);
    u16 temp = sub_8072E84(hookRail);
    if (temp != 0) {
        if (!hookRail->unk10) {
            if (temp == 1) {
                sub_8072DCC(hookRail);
            }
        } else if (temp == 2) {
            sub_8072DCC(hookRail);
        }
    }

    if (sub_8073238(hookRail) != 0) {
        sub_8073280(hookRail);
    }
}

void sub_80730BC(Sprite_HookRail *);

void sub_8072F8C(void)
{
    Sprite_HookRail *hookRail = TaskGetStructPtr(gCurTask);

    if (sub_8072E84(hookRail) && gPlayer.unk64 == 55) {
        sub_80730BC(hookRail);
    }

    if (sub_8073238(hookRail)) {
        sub_8073280(hookRail);
    }
}

void sub_8072FD4(struct Task *unused)
{
    // unused
}

void sub_8072FD8(Sprite_HookRail *hookRail)
{
    if (hookRail->unk10 == 0) {
        gPlayer.x = Q_24_8(hookRail->x + hookRail->width);
        hookRail->unk14 = gPlayer.x;
        hookRail->unk18 = gPlayer.y;
        gPlayer.rotation = 109;
    } else {
        gPlayer.x = Q_24_8(hookRail->x + hookRail->offsetX);
        hookRail->unk14 = gPlayer.x;
        hookRail->unk18 = gPlayer.y;
        gPlayer.rotation = 19;
    }
    gCurTask->main = sub_8072C90;
}

void sub_8073034(UNUSED Sprite_HookRail *hookRail) { gCurTask->main = sub_8072F38; }

void sub_8073320(void);

void sub_8073048(UNUSED Sprite_HookRail *hookRail)
{
    m4aSongNumStop(SE_283);
    gCurTask->main = sub_8073320;
}

void sub_8073068(UNUSED Sprite_HookRail *hookRail)
{
    m4aSongNumStop(SE_283);
    gCurTask->main = sub_8072F38;
}

void sub_8073088(UNUSED Sprite_HookRail *hookRail)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    m4aSongNumStop(SE_283);
    gCurTask->main = sub_8073320;
}

void sub_80730BC(Sprite_HookRail *hookRail)
{
    gPlayer.y = Q_24_8(hookRail->y + 0x14);
    if (gPlayer.rotation == 109) {
        gPlayer.rotation = 128;
    } else {
        gPlayer.rotation = 0;
    }

    gCurTask->main = sub_8072D40;
}

void sub_80730F0(UNUSED Sprite_HookRail *hookRail)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    gPlayer.unk64 = 14;
    gPlayer.unk6D = 5;
    if (gPlayer.rotation == 128) {
        gPlayer.rotation = 109;
    } else {
        gPlayer.rotation = 19;
    }

    sub_80731D4();
    m4aSongNumStop(SE_283);
    gCurTask->main = sub_8072F8C;
}

void sub_8073148(UNUSED Sprite_HookRail *hookRail)
{
    m4aSongNumStop(SE_283);
    gCurTask->main = sub_8072F8C;
}

void sub_8073168(UNUSED Sprite_HookRail *hookRail)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    m4aSongNumStop(SE_283);
    gCurTask->main = sub_8072F8C;
}

// s16 sub_807319C(s16 groundSpeedX)
// {
//     s32 temp;
//     s16 out;
//     if (gPlayer.unk5A == 0) {
//         temp = 2304;
//     } else {
//         temp = 3840;
//     }

//     out = groundSpeedX;

//     if (temp < groundSpeedX) {
//         out = temp;
//     }

//     return out;
// }
