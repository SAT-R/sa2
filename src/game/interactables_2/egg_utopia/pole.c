#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"

#include "game/stage/player_controls.h"
#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/egg_utopia/pole.h"

#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    s32 worldX;
    s32 worldY;
    s16 left;
    s16 top;
    s16 right;
    s16 bottom;
    s16 width;
    s16 height;
    s32 middleX;
    s32 middleY;
    bool32 facingLeft;
    MapEntity *me;
    u8 spriteX;
    u8 spriteY;
} Sprite_Pole;

static void Task_Pole_NotTouching(void);
static void TaskDestructor_Interactable094(struct Task *);
static void Task_807EA8C(void);

void CreateEntity_Pole(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Pole_NotTouching, sizeof(Sprite_Pole), 0x2010, 0, TaskDestructor_Interactable094);
    Sprite_Pole *pole = TASK_DATA(t);
    pole->worldX = TO_WORLD_POS(me->x, spriteRegionX);
    pole->worldY = TO_WORLD_POS(me->y, spriteRegionY);

    pole->left = me->d.sData[0] * TILE_WIDTH;
    pole->top = me->d.sData[1] * TILE_WIDTH;
    pole->right = pole->left + me->d.uData[2] * TILE_WIDTH;
    pole->bottom = pole->top + me->d.uData[3] * TILE_WIDTH;

    pole->width = pole->right - pole->left;
    pole->height = pole->bottom - pole->top;

    pole->middleX = ((pole->left + pole->right) >> 1) + pole->worldX;
    pole->middleY = ((pole->top + pole->bottom) >> 1) + pole->worldY;
    pole->me = me;
    pole->spriteX = me->x;
    pole->spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807ED68(Sprite_Pole *);
static void sub_807ED88(Sprite_Pole *);
static bool32 PlayerTouchesPole(Sprite_Pole *);
static void sub_807ED00(Sprite_Pole *);
static bool32 PoleIsOffScreen(Sprite_Pole *);
static void DestroyPoleTrigger(Sprite_Pole *);
static void Pole_PlayerJumpsOff(Sprite_Pole *);

static void Task_807EA8C(void)
{
    Sprite_Pole *pole = TASK_DATA(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_807ED68(pole);
        return;
    }
    if (gPlayer.timerInvulnerability == ZONE_TIME_TO_INT(0, 2)) {
        sub_807ED88(pole);
        return;
    }

    if (GRAVITY_IS_INVERTED) {
        gPlayer.qWorldY -= Q(1);
    } else {
        gPlayer.qWorldY += Q(1);
    }

    if (gPlayer.frameInput & gPlayerControls.jump) {
        u16 leftPressed = gPlayer.heldInput & DPAD_LEFT;
        if (leftPressed != 0) {
            leftPressed = TRUE;
        }
        pole->facingLeft = leftPressed;
        Pole_PlayerJumpsOff(pole);
    } else if (!PlayerTouchesPole(pole)) {
        sub_807ED00(pole);
    }

    if (PoleIsOffScreen(pole)) {
        DestroyPoleTrigger(pole);
    }
}

static void Task_807EC70(void);

static void Pole_PlayerJumpsOff(Sprite_Pole *pole)
{
    if (PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        if (pole->facingLeft) {
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
        } else {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
        }
        gPlayer.charState = CHARSTATE_SPIN_ATTACK;
        gPlayer.transition = PLTRANS_UNCURL;

        if (pole->facingLeft) {
            gPlayer.qSpeedAirX = -Q(5);
        } else {
            gPlayer.qSpeedAirX = +Q(5);
        }
        m4aSongNumStop(SE_POLE_SLIDING);
    }
    gCurTask->main = Task_807EC70;
}

static bool32 PlayerTouchesPole(Sprite_Pole *pole)
{
    s16 poleScreenX, playerScreenX, poleScreenY, playerScreenY;

    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    }

    poleScreenX = (pole->worldX + pole->left) - gCamera.x;
    poleScreenY = (pole->worldY + pole->top) - gCamera.y;
    playerScreenX = I(gPlayer.qWorldX) - gCamera.x;
    playerScreenY = I(gPlayer.qWorldY) - gCamera.y;

    if (poleScreenX <= playerScreenX && poleScreenX + pole->width >= playerScreenX) {
        if (poleScreenY <= playerScreenY && poleScreenY + pole->height >= playerScreenY) {
            return TRUE;
        }
    }

    return FALSE;
}

static void Pole_TransitionPlayerSliding(Sprite_Pole *);

static void Task_Pole_NotTouching(void)
{
    Sprite_Pole *pole = TASK_DATA(gCurTask);

    if (PlayerTouchesPole(pole)) {
        Pole_TransitionPlayerSliding(pole);
    }

    if (PoleIsOffScreen(pole)) {
        DestroyPoleTrigger(pole);
    }
}

static void sub_807ED48(Sprite_Pole *pole);
static void Task_Pole_NotTouching(void);

static void Task_807EC70(void)
{
    Sprite_Pole *pole = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_Pole_NotTouching;
        return;
    }

    if (!PlayerTouchesPole(pole)) {
        sub_807ED48(pole);
    }
}

static void TaskDestructor_Interactable094(struct Task *t)
{
    // unused
}

static void Pole_TransitionPlayerSliding(Sprite_Pole *pole)
{
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_POLE;
    gPlayer.qWorldX = Q(pole->middleX);
    gPlayer.qSpeedGround = 0;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;

    m4aSongNumStart(SE_POLE_SLIDING);
    gCurTask->main = Task_807EA8C;
}

static void sub_807ED00(Sprite_Pole *pole)
{
    if (PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gPlayer.charState = CHARSTATE_FALLING_VULNERABLE_B;
        gPlayer.transition = PLTRANS_UNCURL;
        gPlayer.qSpeedAirY = Q(1);
        m4aSongNumStop(SE_POLE_SLIDING);
    }
    gCurTask->main = Task_Pole_NotTouching;
}

static void sub_807ED48(Sprite_Pole *pole)
{
    m4aSongNumStop(SE_POLE_SLIDING);
    gCurTask->main = Task_Pole_NotTouching;
}

static void sub_807ED68(Sprite_Pole *pole)
{
    m4aSongNumStop(SE_POLE_SLIDING);
    gCurTask->main = Task_Pole_NotTouching;
}

static void sub_807ED88(Sprite_Pole *pole)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    m4aSongNumStop(SE_POLE_SLIDING);
    gCurTask->main = Task_807EC70;
}

static bool32 PoleIsOffScreen(Sprite_Pole *pole)
{
    s16 screenX, screenY;

    screenX = pole->worldX - gCamera.x;
    screenY = pole->worldY - gCamera.y;
    if (screenX + pole->right < -((CAM_REGION_WIDTH) / 2) || screenX + pole->left > (DISPLAY_WIDTH + ((CAM_REGION_WIDTH) / 2))
        || screenY + pole->bottom < -((CAM_REGION_WIDTH) / 2) || screenY + pole->top > (DISPLAY_HEIGHT + ((CAM_REGION_WIDTH) / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void DestroyPoleTrigger(Sprite_Pole *pole)
{
    pole->me->x = pole->spriteX;
    TaskDestroy(gCurTask);
}
