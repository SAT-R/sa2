#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/078.h"
#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

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
    s16 unk84;
    s16 unk86;
    s16 unk88;
    s16 unk8A;
    s32 unk8C;
    s32 unk90;
    u16 unk94;
    u16 unk96;
    s32 unk98[3][2];
} Sprite_IA75; /* 0xB0 */

void sub_807AB04(struct Task *);
void sub_807AA68(void);

void sub_807A33C(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY,
                 u8 param)
{
    s32 i;
    Sprite *sprite;
    struct Task *t = TaskCreate(sub_807AA68, 0xB0, 0x2010, 0, sub_807AB04);
    Sprite_IA75 *ia75 = TaskGetStructPtr(t);
    ia75->unk94 = param;
    ia75->unk8C = 0;
    ia75->unk90 = 0;
    ia75->unk84 = me->d.sData[0] * TILE_WIDTH + 0x18;
    ia75->unk86 = me->d.sData[1] * TILE_WIDTH + 0x18;
    ia75->unk88 = me->d.uData[2] * TILE_WIDTH + ia75->unk84 - 0x18;
    ia75->unk8A = me->d.uData[3] * TILE_WIDTH + ia75->unk86 - 0x18;

    ia75->base.me = me;
    ia75->base.regionX = spriteRegionX;
    ia75->base.regionY = spriteRegionY;
    ia75->base.spriteX = me->x;
    ia75->base.spriteY = spriteY;

    switch (ia75->unk94) {
        case 0:
            ia75->unk74 = Q_24_8(ia75->unk88);
            ia75->unk78 = Q_24_8(ia75->unk86);
            break;
        case 1:
            ia75->unk74 = Q_24_8(ia75->unk84);
            ia75->unk78 = Q_24_8(ia75->unk86);
            break;
        case 2:
            ia75->unk74 = Q_24_8(ia75->unk84);
            ia75->unk78 = Q_24_8(ia75->unk8A);
            break;
    }

    for (i = 0; i < 3; i++) {
        ia75->unk98[i][0] = ia75->unk74;
        ia75->unk98[i][1] = ia75->unk78;
    }

    ia75->x = SpriteGetScreenPos(me->x, spriteRegionX);
    ia75->y = SpriteGetScreenPos(me->y, spriteRegionY);

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
    sprite->graphics.anim = 595;
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
    sprite->graphics.dest = (void *)0x6012C80;
    sprite->graphics.anim = 599;
    sprite->variant = 0;
    sub_8004558(sprite);

    SET_MAP_ENTITY_INITIALIZED(me);
}

void sub_807AB6C(Sprite_IA75 *);
void sub_807AB18(Sprite_IA75 *);
void sub_807A73C(Sprite_IA75 *);
void sub_807A7F4(Sprite_IA75 *);

void sub_807A560(void)
{
    u8 someBool = FALSE;
    Sprite_IA75 *ia75 = TaskGetStructPtr(gCurTask);
    gPlayer.unk6D = 1;
    gPlayer.unk64 = 0;

    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        sub_807AB6C(ia75);
    }

    switch (ia75->unk94) {
        case 0:
            ia75->unk74 -= 0x780;
            if (Q_24_8_TO_INT(ia75->unk74) <= ia75->unk84) {
                ia75->unk74 = Q_24_8(ia75->unk84);
                someBool = TRUE;
            }
            break;
        case 1:
            ia75->unk74 += 0x780;
            if (Q_24_8_TO_INT(ia75->unk74) >= ia75->unk88) {
                ia75->unk74 = Q_24_8(ia75->unk88);
                someBool = TRUE;
            }
            break;
        case 2:
            ia75->unk78 -= 0x780;
            if (Q_24_8_TO_INT(ia75->unk78) <= ia75->unk86) {
                ia75->unk78 = Q_24_8(ia75->unk86);
                someBool = TRUE;
            }

            break;
    }

    if (gPlayer.unk2C == 0x78 && ia75->unk90) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        ia75->unk90 = 0;
    }

    if (PlayerIsAlive && ia75->unk90) {
        sub_807AB18(ia75);
    }

    if (someBool) {
        sub_807A73C(ia75);
    }

    sub_8004558(&ia75->sprite1);
    sub_807A7F4(ia75);
}

void sub_807A688(Sprite_IA75 *ia75)
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
            sprite->graphics.anim = 595;
            sprite->variant = 0;
            break;
        case 1:
            sprite->graphics.anim = 595;
            sprite->variant = 0;
            break;
        case 2:
            sprite->graphics.anim = 595;
            sprite->variant = 1;
            break;
    }
    ia75->unk8C = 1;
    m4aSongNumStart(SE_296);
    gCurTask->main = sub_807A560;
}

void sub_807AABC(void);

void sub_807A73C(Sprite_IA75 *ia75)
{
    Sprite *sprite = &ia75->sprite1;
    sprite->graphics.anim = 595;
    sprite->variant = 2;
    sub_8004558(sprite);

    if (PlayerIsAlive && ia75->unk90) {
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

void sub_807A7F4(Sprite_IA75 *ia75)
{
    Sprite *sprite = &ia75->sprite1;
    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        sprite->x = ia75->x + Q_24_8_TO_INT(ia75->unk98[1][0]) - gCamera.x;
        sprite->y = ia75->y + Q_24_8_TO_INT(ia75->unk98[1][1]) - gCamera.y;
    } else {
        sprite->x = ia75->x + Q_24_8_TO_INT(ia75->unk74) - gCamera.x;
        sprite->y = ia75->y + Q_24_8_TO_INT(ia75->unk78) - gCamera.y;
    }

    if (ia75->unk8C != 0) {
        switch (ia75->unk94) {
            case 0:
                sprite->unk10 &= ~(MOVESTATE_800 | MOVESTATE_400);
                sub_80051E8(&ia75->sprite1);
                sprite->unk10 |= MOVESTATE_800;
                sub_80051E8(&ia75->sprite1);
                break;
            case 1:
                sprite->unk10 &= ~MOVESTATE_800;
                sprite->unk10 |= MOVESTATE_400;
                sub_80051E8(&ia75->sprite1);
                sprite->unk10 |= MOVESTATE_800;
                sub_80051E8(&ia75->sprite1);
                break;
            case 2:
                sprite->unk10 &= ~(MOVESTATE_800 | MOVESTATE_400);
                sub_80051E8(&ia75->sprite1);
                sprite->unk10 |= MOVESTATE_400;
                sub_80051E8(&ia75->sprite1);
                break;
        }
    } else {
        sprite->unk10 &= ~(MOVESTATE_800 | MOVESTATE_400);
        sub_80051E8(&ia75->sprite1);
        sprite->unk10 |= MOVESTATE_800;
        sub_80051E8(&ia75->sprite1);
    }

    ia75->sprite2.x = sprite->x;
    ia75->sprite2.y = sprite->y;
    sub_80051E8(&ia75->sprite2);
}
