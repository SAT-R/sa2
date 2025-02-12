#include "global.h"
#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/hot_crater/windup_stick.h"
#include "task.h"
#include "sprite.h"
#include "malloc_vram.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"

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

    MapEntity *me;
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

void CreateEntity_WindUpStick(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_8072998, sizeof(Sprite_WindUpStick), 0x2010, 0, sub_80729D4);
    Sprite_WindUpStick *windUpStick = TASK_DATA(t);
    windUpStick->unk11 = 0;
    windUpStick->unk0 = TO_WORLD_POS(me->x, spriteRegionX);
    windUpStick->unk4 = TO_WORLD_POS(me->y, spriteRegionY);
    windUpStick->unk8 = me->d.sData[0] * 8;
    windUpStick->unkA = me->d.sData[1] * 8;
    windUpStick->unkC = me->d.uData[2] * 8 + windUpStick->unk8;
    windUpStick->unkE = me->d.uData[3] * 8 + windUpStick->unkA;
    windUpStick->me = me;
    windUpStick->spriteX = me->x;
    windUpStick->spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_8072650(void)
{
    Sprite_WindUpStick *windUpStick = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        sub_80729D8(windUpStick);
        return;
    }

    if ((u8)(windUpStick->unk10 - 1) < 2) {
        if (gPlayer.heldInput & 0x10) {
            if (sub_8072A28(windUpStick)) {
                gPlayer.qWorldX += 0x80;
            }
        }

        if (gPlayer.heldInput & 0x20) {
            if (sub_80729F4(windUpStick)) {
                gPlayer.qWorldX -= 0x80;
            }
        }
    }

    if (gPlayer.spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        sub_80727F4(windUpStick);
    }
}

static void sub_80726E8(Sprite_WindUpStick *windUpStick)
{
    Player_TransitionCancelFlyingAndBoost(&gPlayer);
    sub_8023B5C(&gPlayer, 0xE);
    gPlayer.spriteOffsetX = 6;
    gPlayer.spriteOffsetY = 14;
    Player_SetMovestate_IsInScriptedSequence();
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    windUpStick->unk12 = (gPlayerBodyPSI.s.frameFlags & SPRITE_FLAG_MASK_PRIORITY) >> SPRITE_FLAG_SHIFT_PRIORITY;
    gPlayerBodyPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    gPlayerBodyPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
    gPlayer.qWorldY = Q(windUpStick->unk4 + 3);

    switch (windUpStick->unk10) {
        case 1:
            gPlayer.charState = CHARSTATE_WINDUP_STICK_UPWARDS;
            gPlayer.qSpeedAirX = 0;
            gPlayer.qSpeedAirY -= Q(6.5);
            break;
        case 2:
#ifndef NON_MATCHING
        {
            register s16 *unk64 asm("r0") = &gPlayer.charState;
            *unk64 = CHARSTATE_WINDUP_STICK_DOWNWARDS;
        }
#else
            gPlayer.charState = CHARSTATE_WINDUP_STICK_DOWNWARDS;
#endif
            gPlayer.qSpeedAirX = 0;
            break;
        case 3:
            gPlayer.charState = CHARSTATE_WINDUP_STICK_SINGLE_TURN_UP;
            if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
                gPlayer.qSpeedGround -= Q(2.5);
            } else {
                gPlayer.qSpeedGround += Q(2.5);
            }
            break;
        case 4:
            gPlayer.charState = CHARSTATE_WINDUP_STICK_SINGLE_TURN_DOWN;
            if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
                gPlayer.qSpeedGround -= Q(1.25);
            } else {
                gPlayer.qSpeedGround += Q(1.25);
            }
            gPlayer.moveState ^= 1;
            break;
    }
    gCurTask->main = sub_8072650;
}

static void sub_80727F4(Sprite_WindUpStick *windUpStick)
{
    Player_ClearMovestate_IsInScriptedSequence();
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;

    gPlayerBodyPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    gPlayerBodyPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, windUpStick->unk12);

    switch (windUpStick->unk10) {
        case 1:
        case 3:
            gPlayer.qWorldY = Q(windUpStick->unk4 + windUpStick->unkA);
            break;
        case 2:
        case 4:
            gPlayer.qWorldY = Q(windUpStick->unk4 + windUpStick->unkE);
            break;
    }

    switch (windUpStick->unk10) {
        case 1:
            gPlayer.charState = CHARSTATE_FALLING_VULNERABLE_B;
            gPlayer.transition = PLTRANS_PT7;
            break;
        case 2:
            gPlayer.charState = CHARSTATE_FALLING_VULNERABLE_B;
            gPlayer.transition = PLTRANS_PT7;
            break;
        case 3:
            gPlayer.transition = PLTRANS_TOUCH_GROUND;
            break;
        case 4:
            gPlayer.transition = PLTRANS_TOUCH_GROUND;
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
    if (PLAYER_IS_ALIVE) {
        s16 posX = windUpStick->unk0 - gCamera.x;
        s16 posY = windUpStick->unk4 - gCamera.y;
        s16 playerX = I(gPlayer.qWorldX) - gCamera.x;
        s16 playerY = I(gPlayer.qWorldY) - gCamera.y;

        if ((posX + windUpStick->unk8) <= playerX && (posX + windUpStick->unk8) + (windUpStick->unkC - windUpStick->unk8) >= playerX) {
            if (posY + windUpStick->unkA <= playerY && (posY + windUpStick->unkA) + (windUpStick->unkE - windUpStick->unkA) >= playerY) {
                if (gPlayer.moveState & MOVESTATE_IN_AIR) {
                    if (gPlayer.qSpeedAirY < 0) {
                        return 1;
                    } else {
                        return 2;
                    }
                } else {
                    if (gPlayer.qSpeedAirY < 0) {
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
    Sprite_WindUpStick *windUpStick = TASK_DATA(gCurTask);
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

    s16 r0 = I(gPlayer.qWorldX) - gCamera.x;
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

    s16 r0 = I(gPlayer.qWorldX) - gCamera.x;
    return r1 > r0;
}

bool32 sub_8072A5C(Sprite_WindUpStick *windUpStick)
{
    s16 x = windUpStick->unk0 - gCamera.x;
    s16 y = windUpStick->unk4 - gCamera.y;

    if (x + windUpStick->unkC < -128 || x + windUpStick->unk8 > (DISPLAY_WIDTH + 128) || y + windUpStick->unkE < -128
        || y + windUpStick->unkA > (DISPLAY_HEIGHT + 128)) {
        return TRUE;
    }
    return FALSE;
}

static void sub_8072AC0(Sprite_WindUpStick *windUpStick)
{
    windUpStick->me->x = windUpStick->spriteX;
    TaskDestroy(gCurTask);
}
