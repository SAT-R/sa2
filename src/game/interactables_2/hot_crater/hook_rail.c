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
s16 sub_807319C(s32);

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
        s16 temp;
        sub_80731D4();
        hookRail->unk1C += gPlayer.speedAirX;
        gPlayer.x = hookRail->unk14 + hookRail->unk1C;
        gPlayer.y = hookRail->unk18 + (ABS(hookRail->unk1C) >> 1);
        temp = gPlayer.speedGroundX + 0x15;
        gPlayer.speedGroundX = sub_807319C(temp);
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

        if (!sub_8072E84(hookRail)) {
            sub_80730F0(hookRail);
        }
    }
}
