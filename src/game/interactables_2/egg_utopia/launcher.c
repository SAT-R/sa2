#include "global.h"
#include "gba/types.h"
#include "lib/m4a/m4a.h"

#include "malloc_vram.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/player_controls.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 posX;
    /* 0x40 */ s32 posY;
    /* 0x44 */ u16 kind;
    bool32 active;
    s16 boundsLeft;
    s16 boundsTop;
    s16 boundsRight;
    s16 boundsBottom;
    s32 kartX;
    s32 kartY;
    u16 timer;

    s32 spritePos[3][2];
} Sprite_EggUtopia_Launcher; /* size: 0x78 */

#define EGG_UTO_LAUNCHER_TILE_COUNT 15

#define LAUN_DIR_LEFT               0
#define LAUN_DIR_RIGHT              1
#define LAUN_GRAVITY_DOWN           0
#define LAUN_GRAVITY_UP             1
#define LAUNCHER_KIND(dir, gravity) (((gravity) << 1) | (dir))
#define IS_LAUNCHER_DIR_LEFT(kind)                                                                                                         \
    ((kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN)) || (kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP)))

#define IS_LAUNCHER_RIGHTSIDE_UP(kind)                                                                                                     \
    ((kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN)) || (kind == LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN)))

#define IS_LAUNCHER_UPSIDE_DOWN(kind)                                                                                                      \
    ((kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP)) || (kind == LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP)))

static void HandleActivate(Sprite_EggUtopia_Launcher *launcher);
static void HandleReachedEnd(Sprite_EggUtopia_Launcher *launcher);
static bool32 IsPlayerTouchingKart(Sprite_EggUtopia_Launcher *launcher);
static bool16 MoveKartToEnd(Sprite_EggUtopia_Launcher *launcher);
static void SetPlayerPos(Sprite_EggUtopia_Launcher *launcher);
static void Despawn(Sprite_EggUtopia_Launcher *launcher);
static bool32 ShouldDespawn(Sprite_EggUtopia_Launcher *launcher);
static void Task_Active(void);
static void RenderKart(Sprite_EggUtopia_Launcher *);
static void Task_Idle(void);

static void Task_WaitToReset(void);

// static
void TaskDestructor_807DF38(struct Task *t);

static void SetTaskMain_807E16C(Sprite_EggUtopia_Launcher *unused);
static void CycleKartSpritePos(Sprite_EggUtopia_Launcher *);
static void HandleSetIdle(Sprite_EggUtopia_Launcher *unused);
static void Task_807E16C(void);
static bool16 MoveKartToBase(Sprite_EggUtopia_Launcher *launcher);

void CreateEntity_Launcher(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY, u32 kind)
{
    struct Task *t = TaskCreate(Task_Idle, sizeof(Sprite_EggUtopia_Launcher), 0x2010, 0, TaskDestructor_807DF38);
    Sprite_EggUtopia_Launcher *launcher = TASK_DATA(t);

    launcher->kind = kind;
    launcher->posX = TO_WORLD_POS(me->x, spriteRegionX);
    launcher->posY = TO_WORLD_POS(me->y, spriteRegionY);

    launcher->boundsLeft = me->d.sData[0] * TILE_WIDTH;
    launcher->boundsTop = me->d.sData[1] * TILE_WIDTH;
    launcher->boundsRight = launcher->boundsLeft + me->d.uData[2] * TILE_WIDTH;
    launcher->boundsBottom = launcher->boundsTop + me->d.uData[3] * TILE_WIDTH;

    launcher->base.regionX = spriteRegionX;
    launcher->base.regionY = spriteRegionY;
    launcher->base.me = me;
    launcher->base.meX = me->x;
    launcher->base.id = spriteY;

    switch (launcher->kind) {
        case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN): {
            launcher->kartX = Q(launcher->posX + launcher->boundsRight);
            launcher->kartY = Q(launcher->posY + launcher->boundsBottom);
        } break;

        case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN): {
            launcher->kartX = Q(launcher->posX + launcher->boundsLeft);
            launcher->kartY = Q(launcher->posY + launcher->boundsBottom);
        } break;

        case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP): {
            launcher->kartX = Q(launcher->posX + launcher->boundsRight);
            launcher->kartY = Q(launcher->posY + launcher->boundsTop);
        } break;

        case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP): {
            launcher->kartX = Q(launcher->posX + launcher->boundsLeft);
            launcher->kartY = Q(launcher->posY + launcher->boundsTop);
        } break;
    }

    {
        s32 *xs, *ys;
        s32 i = 0;
#ifndef NON_MATCHING
        register void *s2 asm("r4") = &launcher->s;
#endif
        for (; i < ARRAY_COUNT(launcher->spritePos); i++) {
            launcher->spritePos[i][0] = launcher->kartX;
            launcher->spritePos[i][1] = launcher->kartY;
        }

        {
#ifndef NON_MATCHING
            register Sprite *s asm("r5") = s2;
#else
            Sprite *s = &launcher->s;
#endif
            s->oamFlags = SPRITE_OAM_ORDER(6);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;

            launcher->s.prevVariant = -1;
            launcher->s.animSpeed = SPRITE_ANIM_SPEED(1.0);
            launcher->s.palId = 0;

            s->hitboxes[0].index = -1;
            s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
            s->graphics.dest = VramMalloc(EGG_UTO_LAUNCHER_TILE_COUNT);
            s->graphics.anim = SA2_ANIM_LAUNCHER;
            launcher->s.variant = 0;

#ifndef NON_MATCHING
            // This is completely redundant because of the switch below.
            if (kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN)) {
                s->frameFlags |= (SPRITE_FLAG(X_FLIP, 1) | SPRITE_FLAG(Y_FLIP, 0));
            }
#endif
            switch (launcher->kind) {
                case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN): {
                    s->frameFlags |= (SPRITE_FLAG(X_FLIP, 1) | SPRITE_FLAG(Y_FLIP, 0));
                } break;

                case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN): {
                    s->frameFlags |= (SPRITE_FLAG(X_FLIP, 0) | SPRITE_FLAG(Y_FLIP, 0));
                } break;

                case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP): {
                    s->frameFlags |= (SPRITE_FLAG(X_FLIP, 1) | SPRITE_FLAG(Y_FLIP, 1));
                } break;

                case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP): {
                    s->frameFlags |= (SPRITE_FLAG(X_FLIP, 0) | SPRITE_FLAG(Y_FLIP, 1));
                } break;
            }

            UpdateSpriteAnimation(s);
        }
        SET_MAP_ENTITY_INITIALIZED(me);
    }
}

static void Task_Active(void)
{
    Sprite_EggUtopia_Launcher *launcher = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER)
        CycleKartSpritePos(launcher);

    if (MoveKartToEnd(launcher))
        HandleReachedEnd(launcher);

    SetPlayerPos(launcher);

    if (!PLAYER_IS_ALIVE) {
        launcher->active = FALSE;
    } else if (gPlayer.timerInvulnerability != 120) {
        if (gPlayer.frameInput & gPlayerControls.jump) {
            gPlayer.transition = PLTRANS_INIT_JUMP;

            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
            launcher->active = FALSE;
        }
    } else {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        launcher->active = FALSE;
    }

    RenderKart(launcher);
}

static void HandleActivate(Sprite_EggUtopia_Launcher *launcher)
{
    m4aSongNumStart(SE_286);

    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_LAUNCHER_IN_CART;
    gPlayer.qSpeedGround = 0;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;

    Player_TransitionCancelFlyingAndBoost(&gPlayer);
    PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
    gPlayer.moveState &= ~MOVESTATE_SPIN_ATTACK;

    if (IS_LAUNCHER_DIR_LEFT(launcher->kind)) {
        gPlayer.moveState |= MOVESTATE_FACING_LEFT;
    } else {
        gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
    }

    launcher->active = TRUE;

    gCurTask->main = Task_Active;
}

static void HandleReachedEnd(Sprite_EggUtopia_Launcher *launcher)
{
    if (PLAYER_IS_ALIVE && launcher->active) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gPlayer.charState = CHARSTATE_LAUNCHER_IN_AIR;
        gPlayer.transition = PLTRANS_PT7;

        switch (launcher->kind) {
            case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN):
            case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP): {
                gPlayer.qSpeedAirX = -Q(15.0);
                gPlayer.qSpeedAirY = -Q(3.0);
            } break;

            case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN):
            case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP): {
                gPlayer.qSpeedAirX = +Q(15.0);
                gPlayer.qSpeedAirY = -Q(3.0);
            } break;
        }

        launcher->active = FALSE;

        m4aSongNumStart(SE_287);
    } else {
        m4aSongNumStop(SE_286);
    }

    launcher->timer = 0;
    gCurTask->main = Task_WaitToReset;
}

static void RenderKart(Sprite_EggUtopia_Launcher *launcher)
{
    Sprite *s = &launcher->s;

    if (IS_MULTI_PLAYER) {
        s->x = I(launcher->spritePos[1][0]) - gCamera.x;
        s->y = I(launcher->spritePos[1][1]) - gCamera.y;
    } else {
        s->x = I(launcher->kartX) - gCamera.x;
        s->y = I(launcher->kartY) - gCamera.y;
    }

    DisplaySprite(s);
}

static bool32 IsPlayerTouchingKart(Sprite_EggUtopia_Launcher *launcher)
{
    if (PLAYER_IS_ALIVE) {
        s16 someX, someY;
        s16 playerX, playerY;

        // Launcher should only activate if it's the correct gravity
        if (GRAVITY_IS_INVERTED) {
            if (IS_LAUNCHER_RIGHTSIDE_UP(launcher->kind))
                return FALSE;
        } else {
            if (IS_LAUNCHER_UPSIDE_DOWN(launcher->kind))
                return FALSE;
        }

        someX = I(launcher->kartX) - gCamera.x;
        someY = I(launcher->kartY) - gCamera.y;

        playerX = I(gPlayer.qWorldX) - gCamera.x;
        playerY = I(gPlayer.qWorldY) - gCamera.y;

        if ((someX - 2 * TILE_WIDTH <= playerX) && (someX + 2 * TILE_WIDTH >= playerX) && (someY - 2 * TILE_WIDTH <= playerY)
            && (someY + 2 * TILE_WIDTH >= playerY))
            return TRUE;
    }

    return FALSE;
}

static void Task_Idle(void)
{
    Sprite_EggUtopia_Launcher *launcher = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        CycleKartSpritePos(launcher);
    }

    if (IsPlayerTouchingKart(launcher)) {
        HandleActivate(launcher);
    }

    if (ShouldDespawn(launcher)) {
        Despawn(launcher);
    } else {
        RenderKart(launcher);
    }
}

static void Task_WaitToReset(void)
{
    Sprite_EggUtopia_Launcher *launcher = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        CycleKartSpritePos(launcher);
    }

    if (++launcher->timer > 60) {
        SetTaskMain_807E16C(launcher);
    }

    RenderKart(launcher);
}

// static
void TaskDestructor_807DF38(struct Task *t)
{
    Sprite_EggUtopia_Launcher *launcher = TASK_DATA(t);
    VramFree(launcher->s.graphics.dest);
}

static void SetTaskMain_807E16C(Sprite_EggUtopia_Launcher *unused) { gCurTask->main = Task_807E16C; }

static bool16 MoveKartToEnd(Sprite_EggUtopia_Launcher *launcher)
{
    bool32 result = FALSE;

    if (IS_LAUNCHER_DIR_LEFT(launcher->kind)) {
        s32 someX;
        launcher->kartX -= Q(15);
        someX = Q(launcher->posX + launcher->boundsLeft);
        if (launcher->kartX <= someX) {
            launcher->kartX = someX;
            result = TRUE;
        }
    } else {
        s32 someX;
        launcher->kartX += Q(15);
        someX = Q(launcher->posX + launcher->boundsRight);
        if (launcher->kartX >= someX) {
            launcher->kartX = someX;
            result = TRUE;
        }
    }

    return result;
}

static void SetPlayerPos(Sprite_EggUtopia_Launcher *launcher)
{
    if (PLAYER_IS_ALIVE && launcher->active) {
        switch (launcher->kind) {
            case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN): {
                gPlayer.qWorldX = launcher->kartX - Q(8);
                gPlayer.qWorldY = launcher->kartY - Q(16);
            } break;

            case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN): {
                gPlayer.qWorldX = launcher->kartX + Q(8);
                gPlayer.qWorldY = launcher->kartY - Q(16);
            } break;

            case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP): {
                gPlayer.qWorldX = launcher->kartX - Q(8);
                gPlayer.qWorldY = launcher->kartY + Q(16);
            } break;

            case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP): {
                gPlayer.qWorldX = launcher->kartX + Q(8);
                gPlayer.qWorldY = launcher->kartY + Q(16);
            } break;
        }
    }
}

static bool32 ShouldDespawn(Sprite_EggUtopia_Launcher *launcher)
{
    s16 posX, posY;

    posX = launcher->posX - gCamera.x;
    posY = launcher->posY - gCamera.y;

    if (((posX + launcher->boundsRight) < -(CAM_REGION_WIDTH / 2))
        || ((posX + launcher->boundsLeft) > DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2))
        || ((posY + launcher->boundsBottom) < -(CAM_REGION_WIDTH / 2))
        || ((posY + launcher->boundsTop) > DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2)))
        return TRUE;

    return FALSE;
}

static void Despawn(Sprite_EggUtopia_Launcher *launcher)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(launcher->base.me, launcher->base.meX);
    TaskDestroy(gCurTask);
}

static void CycleKartSpritePos(Sprite_EggUtopia_Launcher *launcher)
{
    launcher->spritePos[2][0] = launcher->spritePos[1][0];
    launcher->spritePos[2][1] = launcher->spritePos[1][1];
    launcher->spritePos[1][0] = launcher->spritePos[0][0];
    launcher->spritePos[1][1] = launcher->spritePos[0][1];
    launcher->spritePos[0][0] = launcher->kartX;
    launcher->spritePos[0][1] = launcher->kartY;
}

void CreateEntity_Launcher_Left_GDown(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Launcher(me, spriteRegionX, spriteRegionY, spriteY, LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN));
}

void CreateEntity_Launcher_Right_GDown(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Launcher(me, spriteRegionX, spriteRegionY, spriteY, LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN));
}

void CreateEntity_Launcher_Left_GUp(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Launcher(me, spriteRegionX, spriteRegionY, spriteY, LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP));
}

void CreateEntity_Launcher_Right_GUp(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Launcher(me, spriteRegionX, spriteRegionY, spriteY, LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP));
}

static void Task_807E16C(void)
{
    Sprite_EggUtopia_Launcher *launcher = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        CycleKartSpritePos(launcher);
    }

    if (MoveKartToBase(launcher)) {
        HandleSetIdle(launcher);
    }

    RenderKart(launcher);
}

static void HandleSetIdle(Sprite_EggUtopia_Launcher *unused) { gCurTask->main = Task_Idle; }

static bool16 MoveKartToBase(Sprite_EggUtopia_Launcher *launcher)
{
    bool32 result = FALSE;

    if (IS_LAUNCHER_DIR_LEFT(launcher->kind)) {
        s32 value;
        launcher->kartX += Q(1.0);
        value = Q(launcher->posX + launcher->boundsRight);
        if (launcher->kartX >= value) {
            launcher->kartX = value;
            result = TRUE;
        }
    } else {
        s32 value;
        launcher->kartX -= Q(1.0);
        value = Q(launcher->posX + launcher->boundsLeft);
        if (launcher->kartX <= value) {
            launcher->kartX = value;
            result = TRUE;
        }
    }

    return result;
}