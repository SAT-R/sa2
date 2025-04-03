#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"
#include "lib/m4a/m4a.h"

#include "game/entity.h"
#include "game/stage/player_controls.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/hot_crater/hook_rail.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    s32 x;
    s32 y;
    s16 width;
    s16 height;
    s16 offsetX;
    s16 offsetY;
    u8 triggerType;
    s32 joinedX;
    s32 joinedY;
    s32 grindDistance;
    MapEntity *me;
    u8 spriteX;
    u8 spriteY;
} Sprite_HookRail;

static void sub_8072F38(void);
static void sub_8072FD4(struct Task *);
static void sub_8072F8C(void);
static void sub_8073088(Sprite_HookRail *);
static void sub_8073048(Sprite_HookRail *);
static void sub_807321C(void);
static void sub_80731D4(void);
static void sub_8072FD8(Sprite_HookRail *);
static void sub_8073068(Sprite_HookRail *);
static s16 ClampRailSpeed(s16);
static void sub_8073034(Sprite_HookRail *);
static u32 IsPlayerTouching(Sprite_HookRail *);
static void sub_80730F0(Sprite_HookRail *);
static void sub_8073148(Sprite_HookRail *);
static void sub_8073168(Sprite_HookRail *);
static void sub_8073320(void);
static void sub_80730BC(Sprite_HookRail *);
static bool32 sub_8073238(Sprite_HookRail *);
static void sub_8073280(Sprite_HookRail *);
static void sub_8072BB8(void);

#define HOOK_HEIGHT            20
#define MAX_RAIL_SPEED         9
#define BOOSTED_MAX_RAIL_SPEED 15

#define PLAYER_TOUCH_DIRECTION_NONE     0
#define PLAYER_TOUCH_DIRECTION_FORWARDS 1
#define PLAYER_TOUCH_DIRECTION_REVERSE  2

void CreateEntity_HookRail(u32 triggerType, MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t;
    Sprite_HookRail *hookRail;
    switch (triggerType) {
        case 0:
            t = TaskCreate(sub_8072F38, sizeof(Sprite_HookRail), 0x2010, 0, sub_8072FD4);
            break;
        case 1:
            t = TaskCreate(sub_8072F38, sizeof(Sprite_HookRail), 0x2010, 0, sub_8072FD4);
            break;
        case 2:
            t = TaskCreate(sub_8072F8C, sizeof(Sprite_HookRail), 0x2010, 0, sub_8072FD4);
            break;
        default:
            SET_MAP_ENTITY_INITIALIZED(me);
            return;
    }

    hookRail = TASK_DATA(t);
    hookRail->triggerType = triggerType;
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

static void sub_8072BB8(void)
{
    Sprite_HookRail *hookRail = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        sub_8073068(hookRail);
        return;
    }

    if (gPlayer.timerInvulnerability == 120) {
        sub_8073088(hookRail);
    } else if (gPlayer.frameInput & gPlayerControls.jump) {
        sub_807321C();
        sub_8073048(hookRail);
    } else {
        s16 x, playerX;
        sub_80731D4();
        gPlayer.qWorldX += gPlayer.qSpeedAirX;
        gPlayer.qWorldY += gPlayer.qSpeedAirY;
        gPlayer.qSpeedGround = ClampRailSpeed(gPlayer.qSpeedGround);

        x = hookRail->x - gCamera.x;
        playerX = I(gPlayer.qWorldX) - gCamera.x;

        if (hookRail->triggerType == 0) {
            if (playerX < x + hookRail->width) {
                sub_8072FD8(hookRail);
            }
        } else if (playerX > x + hookRail->offsetX) {
            sub_8072FD8(hookRail);
        }
    }
}

static void sub_8072C90(void)
{
    Sprite_HookRail *hookRail = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        sub_8073068(hookRail);
        return;
    }

    if (gPlayer.timerInvulnerability == 120) {
        sub_8073088(hookRail);
    } else if (gPlayer.frameInput & gPlayerControls.jump) {
        sub_807321C();
        sub_8073048(hookRail);
    } else if (gPlayer.rotation != 109 && gPlayer.rotation != 19) {
        sub_8073034(hookRail);
    } else {
        sub_80731D4();
        hookRail->grindDistance += gPlayer.qSpeedAirX;
        gPlayer.qWorldX = hookRail->joinedX + hookRail->grindDistance;
        // This sets the hook rail angle. It's always 1/2
        gPlayer.qWorldY = hookRail->joinedY + (ABS(hookRail->grindDistance) >> 1);
        gPlayer.qSpeedGround = ClampRailSpeed(gPlayer.qSpeedGround + 21);
    }
}

static void sub_8072D40(void)
{
    Sprite_HookRail *hookRail = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        sub_8073148(hookRail);
        return;
    }

    if (gPlayer.timerInvulnerability == 120) {
        sub_8073168(hookRail);
    } else if (gPlayer.frameInput & gPlayerControls.jump) {
        sub_807321C();
        sub_8073148(hookRail);
    } else {
        sub_80731D4();
        gPlayer.qWorldX += gPlayer.qSpeedAirX;
        gPlayer.qWorldY += gPlayer.qSpeedAirY;
        gPlayer.qSpeedGround = ClampRailSpeed(gPlayer.qSpeedGround);

        if (IsPlayerTouching(hookRail) == PLAYER_TOUCH_DIRECTION_NONE) {
            sub_80730F0(hookRail);
        }
    }
}

static void sub_8072DCC(Sprite_HookRail *hookRail)
{
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_HANGING;
    Player_TransitionCancelFlyingAndBoost(&gPlayer);
    Player_SetSpriteOffsetY(&gPlayer, 14);
    gPlayer.spriteOffsetX = 6;
    gPlayer.spriteOffsetY = 14;
    gPlayer.moveState &= ~MOVESTATE_4;
    gPlayer.qWorldY = Q(hookRail->y + HOOK_HEIGHT);
    hookRail->grindDistance = 0;
    if (hookRail->triggerType == 0) {
        gPlayer.moveState |= MOVESTATE_FACING_LEFT;
        gPlayer.qSpeedGround = gPlayer.qSpeedAirX;

        if (gPlayer.qSpeedGround > -Q(1)) {
            gPlayer.qSpeedGround = -Q(1);
        }
        gPlayer.rotation = 128;
    } else {
        gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
        gPlayer.qSpeedGround = gPlayer.qSpeedAirX;
        if (gPlayer.qSpeedGround < Q(1)) {
            gPlayer.qSpeedGround = Q(1);
        }

        gPlayer.rotation = 0;
    }

    m4aSongNumStart(SE_283);
    gCurTask->main = sub_8072BB8;
}

static u32 IsPlayerTouching(Sprite_HookRail *hookRail)
{
    s16 x, y, playerX, playerY;
    if (!PLAYER_IS_ALIVE) {
        return PLAYER_TOUCH_DIRECTION_NONE;
    }

    x = hookRail->x - gCamera.x;
    y = hookRail->y - gCamera.y;
    playerX = I(gPlayer.qWorldX) - gCamera.x;
    playerY = I(gPlayer.qWorldY) - gCamera.y;

    if (x + hookRail->width <= playerX && (x + hookRail->width) + (hookRail->offsetX - hookRail->width) >= playerX) {
        if (y + hookRail->height <= playerY && (y + hookRail->height) + (hookRail->offsetY - hookRail->height) >= playerY) {
            s16 railEndX = x + ((hookRail->offsetX + hookRail->width) >> 1);
            if (playerX < railEndX) {
                return PLAYER_TOUCH_DIRECTION_FORWARDS;
            } else {
                return PLAYER_TOUCH_DIRECTION_REVERSE;
            }
        }
    }

    return PLAYER_TOUCH_DIRECTION_NONE;
}

static void sub_8072F38(void)
{
    Sprite_HookRail *hookRail = TASK_DATA(gCurTask);
    u16 touchDirection = IsPlayerTouching(hookRail);
    if (touchDirection != PLAYER_TOUCH_DIRECTION_NONE) {
        if (hookRail->triggerType == 0) {
            if (touchDirection == PLAYER_TOUCH_DIRECTION_FORWARDS) {
                sub_8072DCC(hookRail);
            }
        } else if (touchDirection == PLAYER_TOUCH_DIRECTION_REVERSE) {
            sub_8072DCC(hookRail);
        }
    }

    if (sub_8073238(hookRail) != 0) {
        sub_8073280(hookRail);
    }
}

static void sub_8072F8C(void)
{
    Sprite_HookRail *hookRail = TASK_DATA(gCurTask);

    if (IsPlayerTouching(hookRail) != PLAYER_TOUCH_DIRECTION_NONE && gPlayer.charState == CHARSTATE_HANGING) {
        sub_80730BC(hookRail);
    }

    if (sub_8073238(hookRail)) {
        sub_8073280(hookRail);
    }
}

static void sub_8072FD4(struct Task *unused)
{
    // unused
}

static void sub_8072FD8(Sprite_HookRail *hookRail)
{
    if (hookRail->triggerType == 0) {
        gPlayer.qWorldX = Q(hookRail->x + hookRail->width);
        hookRail->joinedX = gPlayer.qWorldX;
        hookRail->joinedY = gPlayer.qWorldY;
        gPlayer.rotation = 109;
    } else {
        gPlayer.qWorldX = Q(hookRail->x + hookRail->offsetX);
        hookRail->joinedX = gPlayer.qWorldX;
        hookRail->joinedY = gPlayer.qWorldY;
        gPlayer.rotation = 19;
    }
    gCurTask->main = sub_8072C90;
}

static void sub_8073034(UNUSED Sprite_HookRail *hookRail) { gCurTask->main = sub_8072F38; }

static void sub_8073048(UNUSED Sprite_HookRail *hookRail)
{
    m4aSongNumStop(SE_283);
    gCurTask->main = sub_8073320;
}

static void sub_8073068(UNUSED Sprite_HookRail *hookRail)
{
    m4aSongNumStop(SE_283);
    gCurTask->main = sub_8072F38;
}

static void sub_8073088(UNUSED Sprite_HookRail *hookRail)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    m4aSongNumStop(SE_283);
    gCurTask->main = sub_8073320;
}

static void sub_80730BC(Sprite_HookRail *hookRail)
{
    gPlayer.qWorldY = Q(hookRail->y + HOOK_HEIGHT);
    if (gPlayer.rotation == 109) {
        gPlayer.rotation = 128;
    } else {
        gPlayer.rotation = 0;
    }

    gCurTask->main = sub_8072D40;
}

static void sub_80730F0(UNUSED Sprite_HookRail *hookRail)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_FALLING_VULNERABLE_B;
    gPlayer.transition = PLTRANS_UNCURL;
    if (gPlayer.rotation == 128) {
        gPlayer.rotation = 109;
    } else {
        gPlayer.rotation = 19;
    }

    sub_80731D4();
    m4aSongNumStop(SE_283);
    gCurTask->main = sub_8072F8C;
}

static void sub_8073148(UNUSED Sprite_HookRail *hookRail)
{
    m4aSongNumStop(SE_283);
    gCurTask->main = sub_8072F8C;
}

static void sub_8073168(UNUSED Sprite_HookRail *hookRail)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    m4aSongNumStop(SE_283);
    gCurTask->main = sub_8072F8C;
}

static s16 ClampRailSpeed(s16 groundSpeedX)
{
    s16 speed;

    if (gPlayer.isBoosting) {
        speed = groundSpeedX;
        if (speed > Q_8_8(BOOSTED_MAX_RAIL_SPEED)) {
            speed = Q_8_8(BOOSTED_MAX_RAIL_SPEED);
        }
    } else {
        speed = groundSpeedX;
        if (speed > Q_8_8(MAX_RAIL_SPEED)) {
            speed = Q_8_8(MAX_RAIL_SPEED);
        }
    }

    return speed;
}

static void sub_80731D4(void)
{
    gPlayer.qSpeedAirX = I(gPlayer.qSpeedGround * COS_24_8(gPlayer.rotation * 4));
    gPlayer.qSpeedAirY = I(gPlayer.qSpeedGround * SIN_24_8(gPlayer.rotation * 4));
}

static void sub_807321C(void)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    gPlayer.transition = PLTRANS_INIT_JUMP;
}

static bool32 sub_8073238(Sprite_HookRail *hookRail)
{
    s16 x = hookRail->x - gCamera.x;
    s16 y = hookRail->y - gCamera.y;

    if (x < -128 || x > (DISPLAY_WIDTH + 128) || y < -128 || y > (DISPLAY_HEIGHT + 128)) {
        return TRUE;
    }

    return FALSE;
}

static void sub_8073280(Sprite_HookRail *hookRail)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(hookRail->me, hookRail->spriteX);
    TaskDestroy(gCurTask);
}

void CreateEntity_HookRail_Unused(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_HookRail(0, me, spriteRegionX, spriteRegionY, spriteY);
}

void CreateEntity_HookRail_Start(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_HookRail(1, me, spriteRegionX, spriteRegionY, spriteY);
}

void CreateEntity_HookRail_End(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_HookRail(2, me, spriteRegionX, spriteRegionY, spriteY);
}

static void sub_8073320(void)
{
    Sprite_HookRail *hookRail = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        sub_8073068(hookRail);
        return;
    }

    if (IsPlayerTouching(hookRail) == PLAYER_TOUCH_DIRECTION_NONE) {
        sub_8073068(hookRail);
    }

    if (sub_8073238(hookRail) != 0) {
        sub_8073280(hookRail);
    }
}
