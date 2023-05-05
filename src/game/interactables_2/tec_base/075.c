#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/tec_base/075.h"
#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

// Probably arrow screen

typedef struct {
    SpriteBase base;
    Sprite sprite1;
    Sprite sprite2;
    s32 x;
    s32 y;
    s32 unk74;
    s32 unk78;
    s32 unk7C;
    s32 unk80;
    s16 width;
    s16 height;
    s16 offsetX;
    s16 offsetY;
    s32 unk8C;
    s32 unk90;
    u16 unk94;
    u16 unk96;
    s32 unk98[3][2];
} Sprite_IA75; /* 0xB0 */

#define BORDER_VRAM_ADDR OBJ_VRAM0 + 0x2C80

static void sub_807AB04(struct Task *);
static void sub_807AA68(void);
static void sub_807AB54(Sprite_IA75 *ia75);
static void sub_807AB6C(Sprite_IA75 *);
static void sub_807AB18(Sprite_IA75 *);
static void sub_807A73C(Sprite_IA75 *);
static void sub_807A7F4(Sprite_IA75 *);
static void sub_807AABC(void);

static void sub_807A33C(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY,
                        u8 param)
{
    s32 i;
    Sprite *sprite;
    struct Task *t
        = TaskCreate(sub_807AA68, sizeof(Sprite_IA75), 0x2010, 0, sub_807AB04);
    Sprite_IA75 *ia75 = TaskGetStructPtr(t);
    ia75->unk94 = param;
    ia75->unk8C = 0;
    ia75->unk90 = 0;
    ia75->width = me->d.sData[0] * TILE_WIDTH + 0x18;
    ia75->height = me->d.sData[1] * TILE_WIDTH + 0x18;
    ia75->offsetX = me->d.uData[2] * TILE_WIDTH + ia75->width - 0x18;
    ia75->offsetY = me->d.uData[3] * TILE_WIDTH + ia75->height - 0x18;

    ia75->base.me = me;
    ia75->base.regionX = spriteRegionX;
    ia75->base.regionY = spriteRegionY;
    ia75->base.spriteX = me->x;
    ia75->base.spriteY = spriteY;

    switch (ia75->unk94) {
        case 0:
            ia75->unk74 = Q_24_8(ia75->offsetX);
            ia75->unk78 = Q_24_8(ia75->height);
            break;
        case 1:
            ia75->unk74 = Q_24_8(ia75->width);
            ia75->unk78 = Q_24_8(ia75->height);
            break;
        case 2:
            ia75->unk74 = Q_24_8(ia75->width);
            ia75->unk78 = Q_24_8(ia75->offsetY);
            break;
    }

    for (i = 0; i < 3; i++) {
        ia75->unk98[i][0] = ia75->unk74;
        ia75->unk98[i][1] = ia75->unk78;
    }

    ia75->x = TO_WORLD_POS(me->x, spriteRegionX);
    ia75->y = TO_WORLD_POS(me->y, spriteRegionY);

    sprite = &ia75->sprite1;
    sprite->unk1A = 0x4C0;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = VramMalloc(8);
    sprite->graphics.anim = SA2_ANIM_ARROW_SCREEN;
    sprite->variant = 2;
    sub_8004558(sprite);

    sprite = &ia75->sprite2;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = (void *)BORDER_VRAM_ADDR;
    sprite->graphics.anim = SA2_ANIM_ARROW_SCREEN_BORDER;
    sprite->variant = 0;
    sub_8004558(sprite);

    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807A560(void)
{
    u8 someBool = FALSE;
    Sprite_IA75 *ia75 = TaskGetStructPtr(gCurTask);
    gPlayer.unk6D = 1;
    gPlayer.unk64 = 0;

    if (IS_MULTI_PLAYER) {
        sub_807AB6C(ia75);
    }

    switch (ia75->unk94) {
        case 0:
            ia75->unk74 -= Q_8_8(7.5);
            if (Q_24_8_TO_INT(ia75->unk74) <= ia75->width) {
                ia75->unk74 = Q_24_8(ia75->width);
                someBool = TRUE;
            }
            break;
        case 1:
            ia75->unk74 += Q_8_8(7.5);
            if (Q_24_8_TO_INT(ia75->unk74) >= ia75->offsetX) {
                ia75->unk74 = Q_24_8(ia75->offsetX);
                someBool = TRUE;
            }
            break;
        case 2:
            ia75->unk78 -= Q_8_8(7.5);
            if (Q_24_8_TO_INT(ia75->unk78) <= ia75->height) {
                ia75->unk78 = Q_24_8(ia75->height);
                someBool = TRUE;
            }

            break;
    }

    if (gPlayer.unk2C == 120 && ia75->unk90) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        ia75->unk90 = 0;
    }

    if (PLAYER_IS_ALIVE && ia75->unk90) {
        sub_807AB18(ia75);
    }

    if (someBool) {
        sub_807A73C(ia75);
    }

    sub_8004558(&ia75->sprite1);
    sub_807A7F4(ia75);
}

static void sub_807A688(Sprite_IA75 *ia75)
{
    Sprite *sprite;
    ia75->unk7C = gPlayer.x - (Q_24_8(ia75->x) + ia75->unk74);
    ia75->unk80 = gPlayer.y - (Q_24_8(ia75->y) + ia75->unk78);

    gPlayer.unk6D = 1;
    gPlayer.unk64 = 0;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;
    gPlayer.speedGroundX = 0;
    gPlayer.rotation = 0;
    ia75->unk90 = 1;

    sprite = &ia75->sprite1;

    switch (ia75->unk94) {
        case 0:
            sprite->graphics.anim = SA2_ANIM_ARROW_SCREEN;
            sprite->variant = 0;
            break;
        case 1:
            sprite->graphics.anim = SA2_ANIM_ARROW_SCREEN;
            sprite->variant = 0;
            break;
        case 2:
            sprite->graphics.anim = SA2_ANIM_ARROW_SCREEN;
            sprite->variant = 1;
            break;
    }
    ia75->unk8C = 1;
    m4aSongNumStart(SE_296);
    gCurTask->main = sub_807A560;
}

static void sub_807A73C(Sprite_IA75 *ia75)
{
    Sprite *sprite = &ia75->sprite1;
    sprite->graphics.anim = SA2_ANIM_ARROW_SCREEN;
    sprite->variant = 2;
    sub_8004558(sprite);

    if (PLAYER_IS_ALIVE && ia75->unk90) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        ia75->unk90 = 0;
        switch (ia75->unk94) {
            case 0:
                gPlayer.speedGroundX = -Q_8_8(7.5);
                gPlayer.moveState |= 1;
                gPlayer.unk6D = 1;
                break;
            case 1:
                gPlayer.speedGroundX = Q_8_8(7.5);
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.unk6D = 1;
                break;
            case 2:
                gPlayer.unk6D = 14;
                gPlayer.unk6E = 0;
                break;
        }
    }

    ia75->unk8C = 0;
    m4aSongNumStop(SE_296);
    gCurTask->main = sub_807AABC;
}

static void sub_807A7F4(Sprite_IA75 *ia75)
{
    Sprite *sprite = &ia75->sprite1;
    if (IS_MULTI_PLAYER) {
        sprite->x = ia75->x + Q_24_8_TO_INT(ia75->unk98[1][0]) - gCamera.x;
        sprite->y = ia75->y + Q_24_8_TO_INT(ia75->unk98[1][1]) - gCamera.y;
    } else {
        sprite->x = ia75->x + Q_24_8_TO_INT(ia75->unk74) - gCamera.x;
        sprite->y = ia75->y + Q_24_8_TO_INT(ia75->unk78) - gCamera.y;
    }

    if (ia75->unk8C != 0) {
        switch (ia75->unk94) {
            case 0:
                sprite->unk10 &= ~(0x800 | 0x400);
                sub_80051E8(&ia75->sprite1);
                sprite->unk10 |= 0x800;
                sub_80051E8(&ia75->sprite1);
                break;
            case 1:
                sprite->unk10 &= ~0x800;
                sprite->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
                sub_80051E8(&ia75->sprite1);
                sprite->unk10 |= 0x800;
                sub_80051E8(&ia75->sprite1);
                break;
            case 2:
                sprite->unk10 &= ~(0x800 | 0x400);
                sub_80051E8(&ia75->sprite1);
                sprite->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
                sub_80051E8(&ia75->sprite1);
                break;
        }
    } else {
        sprite->unk10 &= ~(0x800 | 0x400);
        sub_80051E8(&ia75->sprite1);
        sprite->unk10 |= 0x800;
        sub_80051E8(&ia75->sprite1);
    }

    ia75->sprite2.x = sprite->x;
    ia75->sprite2.y = sprite->y;
    sub_80051E8(&ia75->sprite2);
}

static bool32 sub_807A920(Sprite_IA75 *ia75)
{
    s16 x = ia75->x - gCamera.x;
    s16 y = ia75->y - gCamera.y;

    if ((x + ia75->offsetX + 24) < -128 || (x + ia75->width - 24) > 368
        || (y + ia75->offsetY + 24) < -128 || (y + ia75->height - 24) > 288) {
        return TRUE;
    }
    return FALSE;
}

static u32 sub_807A99C(Sprite_IA75 *ia75)
{
    if (PLAYER_IS_ALIVE) {
        u32 temp = sub_800CCB8(&ia75->sprite2, ia75->x + Q_24_8_TO_INT(ia75->unk74),
                               ia75->y + Q_24_8_TO_INT(ia75->unk78), &gPlayer);
        if (temp != 0) {
            if (temp & 0x10000) {
                gPlayer.y += Q_8_8(temp);
                gPlayer.speedAirY = 0;
                return 2;
            }
            if (temp & 0x40000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                gPlayer.speedAirX = 0;
                gPlayer.speedGroundX = 0;
                gPlayer.moveState |= MOVESTATE_20;
                return 1;
            }
            if (temp & 0x80000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                gPlayer.speedAirX = 0;
                gPlayer.speedGroundX = 0;
                gPlayer.moveState |= MOVESTATE_20;
                return 3;
            }
            if (temp & 0x20000) {
                gPlayer.y += Q_8_8(temp);
                gPlayer.speedAirY = 0;
                return 4;
            }
        }
    }

    return 0;
}

static void sub_807AA68(void)
{
    Sprite_IA75 *ia75 = TaskGetStructPtr(gCurTask);

    if (IS_MULTI_PLAYER) {
        sub_807AB6C(ia75);
    }

    if (sub_807A99C(ia75) == 2) {
        sub_807A688(ia75);
    }

    if (sub_807A920(ia75) != 0) {
        sub_807AB54(ia75);
    } else {
        sub_807A7F4(ia75);
    }
}

static void sub_807AABC(void)
{
    Sprite_IA75 *ia75 = TaskGetStructPtr(gCurTask);

    if (IS_MULTI_PLAYER) {
        sub_807AB6C(ia75);
    }

    sub_807A99C(ia75);

    if (sub_807A920(ia75) != 0) {
        sub_807AB54(ia75);
    } else {
        sub_807A7F4(ia75);
    }
}

static void sub_807AB04(struct Task *t)
{
    Sprite_IA75 *ia75 = TaskGetStructPtr(t);
    VramFree(ia75->sprite1.graphics.dest);
}

static void sub_807AB18(Sprite_IA75 *ia75)
{
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.x = ia75->unk7C + Q_24_8(ia75->x) + ia75->unk74;
    gPlayer.y = ia75->unk80 + Q_24_8(ia75->y) + ia75->unk78;
    sub_807A99C(ia75);
}

static void sub_807AB54(Sprite_IA75 *ia75)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(ia75->base.me, ia75->base.spriteX);
    TaskDestroy(gCurTask);
}

static void sub_807AB6C(Sprite_IA75 *ia75)
{
    ia75->unk98[2][0] = ia75->unk98[1][0];
    ia75->unk98[2][1] = ia75->unk98[1][1];

    ia75->unk98[1][0] = ia75->unk98[0][0];
    ia75->unk98[1][1] = ia75->unk98[0][1];

    ia75->unk98[0][0] = ia75->unk74;
    ia75->unk98[0][1] = ia75->unk78;
}

void initSprite_Interactable075_0(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    sub_807A33C(me, spriteRegionX, spriteRegionY, spriteY, 0);
}

void initSprite_Interactable075_1(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    sub_807A33C(me, spriteRegionX, spriteRegionY, spriteY, 1);
}

void initSprite_Interactable075_2(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    sub_807A33C(me, spriteRegionX, spriteRegionY, spriteY, 2);
}
