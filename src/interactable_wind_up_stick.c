#include "global.h"
#include "game/game.h"
#include "interactable.h"
#include "interactable_wind_up_stick.h"
#include "engine/task.h"
#include "engine/sprite.h"
#include "engine/malloc_vram.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    s32 unk0;
    s32 unk4;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
    u8 unk10;
    u8 unk11;
    u8 unk12;

    Interactable *ia;
    s8 spriteX;
    s8 spriteY;
} Sprite_WindUpStick;

static void sub_8072998(void);
static void sub_80729D4(struct Task *);
static u32 sub_8072A28(Sprite_WindUpStick *);
static u32 sub_80729F4(Sprite_WindUpStick *);
static void sub_80727F4(Sprite_WindUpStick *);
static void sub_80729D8(Sprite_WindUpStick *);
static u32 sub_8072A5C(Sprite_WindUpStick *);
static void sub_8072AC0(Sprite_WindUpStick *);

void initSprite_Interactable_WindUpStick(Interactable *ia, u16 spriteRegionX,
                                         u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_8072998, 0x1C, 0x2010, 0, sub_80729D4);
    Sprite_WindUpStick *windUpStick = TaskGetStructPtr(t);
    windUpStick->unk11 = 0;
    windUpStick->unk0 = SpriteGetScreenPos(ia->x, spriteRegionX);
    windUpStick->unk4 = SpriteGetScreenPos(ia->y, spriteRegionY);
    windUpStick->unk8 = ia->d.sData[0] * 8;
    windUpStick->unkA = ia->d.sData[1] * 8;
    windUpStick->unkC = ia->d.uData[2] * 8 + windUpStick->unk8;
    windUpStick->unkE = ia->d.uData[3] * 8 + windUpStick->unkA;
    windUpStick->ia = ia;
    windUpStick->spriteX = ia->x;
    windUpStick->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);
}

static void sub_8072650(void)
{
    Sprite_WindUpStick *windUpStick = TaskGetStructPtr(gCurTask);

    if (!PlayerIsAlive) {
        sub_80729D8(windUpStick);
        return;
    }

    if ((u8)(windUpStick->unk10 - 1) < 2) {
        if (gPlayer.unk5C & 0x10) {
            if (sub_8072A28(windUpStick)) {
                gPlayer.x += 0x80;
            }
        }

        if (gPlayer.unk5C & 0x20) {
            if (sub_80729F4(windUpStick)) {
                gPlayer.x -= 0x80;
            }
        }
    }

    if (gPlayer.unk90->unk1C & 0x4000) {
        sub_80727F4(windUpStick);
    }
}

static void sub_80726E8(Sprite_WindUpStick *windUpStick)
{
    sub_80218E4(&gPlayer);
    sub_8023B5C(&gPlayer, 0xE);
    gPlayer.unk16 = 6;
    gPlayer.unk17 = 14;
    Player_SetMovestate_IsInScriptedSequence();
    gPlayer.moveState |= MOVESTATE_400000;
    windUpStick->unk12 = (gUnknown_03005AF0.unk1C & 0x3000) >> 0xC;
    gUnknown_03005AF0.unk1C &= ~(0x3000);
    gUnknown_03005AF0.unk1C |= 0x1000;
    gPlayer.y = Q_24_8(windUpStick->unk4 + 3);

    switch (windUpStick->unk10) {
        case 1:
            gPlayer.unk64 = 0x33;
            gPlayer.speedAirX = 0;
            gPlayer.speedAirY -= Q_24_8(6.5);
            break;
        case 2:
#ifndef NON_MATCHING
        {
            register s16 *unk64 asm("r0") = &gPlayer.unk64;
            *unk64 = 0x34;
        }
#else
            gPlayer.unk64 = 0x34;
#endif
            gPlayer.speedAirX = 0;
            break;
        case 3:
            gPlayer.unk64 = 0x35;
            if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
                gPlayer.speedGroundX -= Q_24_8(2.5);
            } else {
                gPlayer.speedGroundX += Q_24_8(2.5);
            }
            break;
        case 4:
            gPlayer.unk64 = 0x36;
            if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
                gPlayer.speedGroundX -= Q_24_8(1.25);
            } else {
                gPlayer.speedGroundX += Q_24_8(1.25);
            }
            gPlayer.moveState ^= 1;
            break;
    }
    gCurTask->main = sub_8072650;
}

static void sub_80727F4(Sprite_WindUpStick *windUpStick)
{
    Player_ClearMovestate_IsInScriptedSequence();
    gPlayer.moveState &= ~MOVESTATE_400000;
    gUnknown_03005AF0.unk1C &= ~0x3000;
    gUnknown_03005AF0.unk1C |= (windUpStick->unk12) << 0xC;
    switch (windUpStick->unk10) {
        case 1:
        case 3:
            gPlayer.y = Q_24_8(windUpStick->unk4 + windUpStick->unkA);
            break;
        case 2:
        case 4:
            gPlayer.y = Q_24_8(windUpStick->unk4 + windUpStick->unkE);
            break;
    }

    switch (windUpStick->unk10) {
        case 1:
            gPlayer.unk64 = 0xE;
            gPlayer.unk6D = 7;
            break;
        case 2:
            gPlayer.unk64 = 0xE;
            gPlayer.unk6D = 7;
            break;
        case 3:
            gPlayer.unk6D = 1;
            break;
        case 4:
            gPlayer.unk6D = 1;
            gPlayer.moveState ^= 1;
            break;
    }
    windUpStick->unk11 = 0xF;
    gCurTask->main = sub_8072998;
}

static u8 sub_80728D4(Sprite_WindUpStick *windUpStick)
{
    if (windUpStick->unk11 != 0) {
        windUpStick->unk11--;
        return 0;
    }
    if (PlayerIsAlive) {
        s16 posX = windUpStick->unk0 - gCamera.x;
        s16 posY = windUpStick->unk4 - gCamera.y;
        s16 playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        s16 playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        if ((posX + windUpStick->unk8) <= playerX
            && (posX + windUpStick->unk8) + (windUpStick->unkC - windUpStick->unk8)
                >= playerX) {
            if (posY + windUpStick->unkA <= playerY
                && (posY + windUpStick->unkA) + (windUpStick->unkE - windUpStick->unkA)
                    >= playerY) {
                if (gPlayer.moveState & MOVESTATE_IN_AIR) {
                    if (gPlayer.speedAirY < 0) {
                        return 1;
                    } else {
                        return 2;
                    }
                } else {
                    if (gPlayer.speedAirY < 0) {
                        return 3;
                    } else {
                        return 4;
                    }
                }
            }
        }
    }
    return 0;
}

static void sub_8072998(void)
{
    Sprite_WindUpStick *windUpStick = TaskGetStructPtr(gCurTask);
    windUpStick->unk10 = sub_80728D4(windUpStick);
    if (windUpStick->unk10 != 0) {
        sub_80726E8(windUpStick);
    }

    if (sub_8072A5C(windUpStick)) {
        sub_8072AC0(windUpStick);
    }
}

static void sub_80729D4(struct Task *t)
{
    // unused
}

static void sub_80729D8(Sprite_WindUpStick *windUpStick)
{
    Player_ClearMovestate_IsInScriptedSequence();
    gCurTask->main = sub_8072998;
}

bool32 sub_80729F4(Sprite_WindUpStick *windUpStick)
{
    s16 r1 = ({
        s32 camX;
        s32 x = (windUpStick->unk0);
        x += (u16)windUpStick->unk8;
        camX = gCamera.x - 8;
        x -= camX;
    });

    s16 r0 = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    return r1 < r0;
}

bool32 sub_8072A28(Sprite_WindUpStick *windUpStick)
{
    s16 r1 = ({
        s32 camX;
        s32 x = (windUpStick->unk0);
        x += (u16)windUpStick->unkC;
        camX = gCamera.x + 8;
        x -= camX;
    });

    s16 r0 = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    return r1 > r0;
}

bool32 sub_8072A5C(Sprite_WindUpStick *windUpStick)
{
    s16 x = windUpStick->unk0 - gCamera.x;
    s16 y = windUpStick->unk4 - gCamera.y;

    if (x + windUpStick->unkC < -128 || x + windUpStick->unk8 > 368
        || y + windUpStick->unkE < -128 || y + windUpStick->unkA > 288) {
        return TRUE;
    }
    return FALSE;
}

static void sub_8072AC0(Sprite_WindUpStick *windUpStick)
{
    windUpStick->ia->x = windUpStick->spriteX;
    TaskDestroy(gCurTask);
}
