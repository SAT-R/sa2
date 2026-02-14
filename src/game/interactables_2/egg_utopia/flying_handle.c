#include "global.h"
#include "core.h"
#include "task.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/player_controls.h"
#include "game/interactables_2/egg_utopia/flying_handle.h"
#include "malloc_vram.h"
#include "trig.h"
#include "lib/m4a/m4a.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

#define FLYING_HANDLE_VRAM_TILES 25

typedef struct {
    SpriteBase base;
    Sprite s;
    s32 basePosX;
    s32 basePosY;
    s32 posX;
    s32 posY;
    s32 moveOffsetX;
    s32 moveOffsetY;
    s16 boundsLeft;
    s16 boundsTop;
    s16 boundsRight;
    s16 boundsBottom;
    s16 speedX;
    s16 speedY;
    bool32 activated;
    bool32 leftHeld;
    u8 qOscillationTurns;
    u8 cooldown;
    s32 mpPosQueue[3][2];
} Sprite_FlyingHandle;

static void Task_Idle(void);
static void TaskDestructor_FlyingHandle(struct Task *);
static void IncrementMpPosQueue(Sprite_FlyingHandle *);
static void HandlePlayerJumpOff(Sprite_FlyingHandle *);
static void HandlePlayerHit(Sprite_FlyingHandle *);
static void PlaySound(Sprite_FlyingHandle *);
static void HandlePlayerDied(Sprite_FlyingHandle *);
static void UpdatePosition(Sprite_FlyingHandle *);
static void UpdatePlayerPos(Sprite_FlyingHandle *);
static void Render(Sprite_FlyingHandle *);
static void Task_ActiveMain(void);
static void Task_Deactivate(void);
static bool32 ShouldDespawn(Sprite_FlyingHandle *);
static void Despawn(Sprite_FlyingHandle *);
static void HandlePlayerKnockedOff(Sprite_FlyingHandle *);

void CreateEntity_FlyingHandle(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    u32 i;
    Sprite *s;
    struct Task *t = TaskCreate(Task_Idle, sizeof(Sprite_FlyingHandle), 0x2010, 0, TaskDestructor_FlyingHandle);
    Sprite_FlyingHandle *flyingHandle = TASK_DATA(t);
    flyingHandle->qOscillationTurns = 0;
    flyingHandle->speedX = 0;
    flyingHandle->speedY = 0;
    flyingHandle->activated = FALSE;
    flyingHandle->basePosX = TO_WORLD_POS(me->x, spriteRegionX);
    flyingHandle->basePosY = TO_WORLD_POS(me->y, spriteRegionY);
    flyingHandle->boundsLeft = me->d.sData[0] * 8;
    flyingHandle->boundsTop = me->d.sData[1] * 8;
    flyingHandle->boundsRight = flyingHandle->boundsLeft + me->d.uData[2] * 8;
    flyingHandle->boundsBottom = flyingHandle->boundsTop + me->d.uData[3] * 8;

    flyingHandle->posX = Q(((flyingHandle->boundsLeft + flyingHandle->boundsRight) >> 1) + flyingHandle->basePosX);
    flyingHandle->posY = Q(flyingHandle->basePosY + flyingHandle->boundsBottom);
    flyingHandle->moveOffsetX = 0;
    flyingHandle->moveOffsetY = 0;

    flyingHandle->base.regionX = spriteRegionX;
    flyingHandle->base.regionY = spriteRegionY;
    flyingHandle->base.me = me;
    flyingHandle->base.meX = me->x;
    flyingHandle->base.id = spriteY;

    for (i = 0; i < 3; i++) {
        flyingHandle->mpPosQueue[i][0] = flyingHandle->posX;
        flyingHandle->mpPosQueue[i][1] = flyingHandle->posY;
    }

    s = &flyingHandle->s;
    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 18, 2, 0);

    s->graphics.dest = VramMalloc(FLYING_HANDLE_VRAM_TILES);
    s->graphics.anim = SA2_ANIM_FLYING_HANDLE;
    s->variant = 0;
    UpdateSpriteAnimation(s);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void Task_ActiveMain(void)
{
    Sprite_FlyingHandle *flyingHandle = TASK_DATA(gCurTask);
    if (IS_MULTI_PLAYER) {
        IncrementMpPosQueue(flyingHandle);
    }

    PlaySound(flyingHandle);

    if (!PLAYER_IS_ALIVE) {
        HandlePlayerDied(flyingHandle);
    } else if (gPlayer.timerInvulnerability == 120) {
        HandlePlayerHit(flyingHandle);
    } else if (flyingHandle->cooldown == 0) {
        if (gPlayer.frameInput & gPlayerControls.jump) {
            if (gPlayer.heldInput & DPAD_LEFT) {
                flyingHandle->leftHeld = TRUE;
            } else {
                flyingHandle->leftHeld = FALSE;
            }
            HandlePlayerJumpOff(flyingHandle);
        }
    }

    if (flyingHandle->cooldown != 0) {
        flyingHandle->cooldown--;
    }

    UpdatePosition(flyingHandle);
    UpdatePlayerPos(flyingHandle);
    Render(flyingHandle);
}

static void ActivatePlayerGrab(Sprite_FlyingHandle *flyingHandle)
{
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_HANGING;
    gPlayer.qSpeedGround = 0;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;
    UpdatePlayerPos(flyingHandle);

    flyingHandle->activated = TRUE;
    flyingHandle->speedY = -Q(1.5);
    flyingHandle->posX += flyingHandle->moveOffsetX;
    flyingHandle->posY += flyingHandle->moveOffsetY;
    flyingHandle->moveOffsetX = 0;
    flyingHandle->moveOffsetY = 0;
    flyingHandle->cooldown = 30;
    m4aSongNumStart(SE_291);
    gCurTask->main = Task_ActiveMain;
}

static void HandlePlayerJumpOff(Sprite_FlyingHandle *flyingHandle)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    Player_TransitionCancelFlyingAndBoost(&gPlayer);
    PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
    gPlayer.moveState &= ~MOVESTATE_SPIN_ATTACK;
    gPlayer.transition = PLTRANS_INIT_JUMP;
    gPlayer.qSpeedGround = 0;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;
    flyingHandle->cooldown = 30;
    m4aSongNumStop(SE_291);
    gCurTask->main = Task_Deactivate;
}

static void UpdatePosition(Sprite_FlyingHandle *flyingHandle)
{
    if (flyingHandle->activated) {
        if (flyingHandle->posY <= Q(flyingHandle->basePosY + flyingHandle->boundsTop) && flyingHandle->speedY >= 0) {
            flyingHandle->moveOffsetY = SIN_24_8(TURNS_TO_SIN(flyingHandle->qOscillationTurns)) * 8;
            flyingHandle->qOscillationTurns += Q(0.015625);
            flyingHandle->speedY = 0;
        } else {
            flyingHandle->speedY += Q(0.0625);
            flyingHandle->speedY = MIN(flyingHandle->speedY, Q(3));
            flyingHandle->posY -= flyingHandle->speedY;
            if (flyingHandle->posY <= Q(flyingHandle->basePosY + flyingHandle->boundsTop)) {
                flyingHandle->speedY = 0;
                flyingHandle->posY = Q(flyingHandle->basePosY + flyingHandle->boundsTop);
                flyingHandle->qOscillationTurns = -Q(0.5);
            }
        }
    } else {
        flyingHandle->posY = Q(flyingHandle->basePosY + flyingHandle->boundsBottom);
        flyingHandle->moveOffsetY = SIN_24_8(TURNS_TO_SIN(flyingHandle->qOscillationTurns)) * 8;
        flyingHandle->qOscillationTurns += Q(0.015625);
    }
}

static void Render(Sprite_FlyingHandle *flyingHandle)
{
    Sprite *s = &flyingHandle->s;
    if (IS_MULTI_PLAYER) {
        s->x = I(flyingHandle->mpPosQueue[1][0]) - gCamera.x;
        s->y = I(flyingHandle->mpPosQueue[1][1]) - gCamera.y;
    } else {
        s->x = I(flyingHandle->posX + flyingHandle->moveOffsetX) - gCamera.x;
        s->y = I(flyingHandle->posY + flyingHandle->moveOffsetY) - gCamera.y;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static bool32 IsPlayerTouching(Sprite_FlyingHandle *flyingHandle)
{
    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    } else {
        s16 x = I(flyingHandle->posX + flyingHandle->moveOffsetX) - gCamera.x;
        s16 y = I(flyingHandle->posY + flyingHandle->moveOffsetY) - gCamera.y;
        s16 playerX = (I(gPlayer.qWorldX) - gCamera.x);
        s16 playerY = (I(gPlayer.qWorldY) - gCamera.y);
        s16 dX = x - playerX;
        s16 dY = y - playerY;
        if (dX * dX + dY * dY <= (16 * 16)) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Task_Idle(void)
{
    Sprite_FlyingHandle *flyingHandle = TASK_DATA(gCurTask);
    if (IS_MULTI_PLAYER) {
        IncrementMpPosQueue(flyingHandle);
    }

    if (IsPlayerTouching(flyingHandle)) {
        ActivatePlayerGrab(flyingHandle);
    }

    if (ShouldDespawn(flyingHandle)) {
        Despawn(flyingHandle);
        return;
    }

    UpdatePosition(flyingHandle);
    Render(flyingHandle);
}

static void Task_Deactivate(void)
{
    Sprite_FlyingHandle *flyingHandle = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        IncrementMpPosQueue(flyingHandle);
    }

    if (flyingHandle->cooldown == 0) {
        if (!PLAYER_IS_ALIVE || !IsPlayerTouching(flyingHandle)) {
            HandlePlayerKnockedOff(flyingHandle);
        }
    } else {
        flyingHandle->cooldown--;
    }

    UpdatePosition(flyingHandle);
    Render(flyingHandle);
}

static void TaskDestructor_FlyingHandle(struct Task *t)
{
    Sprite_FlyingHandle *flyingHandle = TASK_DATA(t);
    VramFree(flyingHandle->s.graphics.dest);
}

static void HandlePlayerDied(UNUSED Sprite_FlyingHandle *flyingHandle) { gCurTask->main = Task_Idle; }

static void HandlePlayerKnockedOff(UNUSED Sprite_FlyingHandle *flyingHandle) { gCurTask->main = Task_Idle; }

static void HandlePlayerHit(Sprite_FlyingHandle *flyingHandle)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    flyingHandle->cooldown = 30;
    m4aSongNumStop(SE_291);
    gCurTask->main = Task_Deactivate;
}

static void UpdatePlayerPos(Sprite_FlyingHandle *flyingHandle)
{
#ifndef NON_MATCHING
    register Player *p1 asm("r0") = &gPlayer;
    register u32 r1 asm("r1") = p1->moveState & MOVESTATE_FACING_LEFT;
    register Player *player asm("r2") = p1;
#else
    Player *player = &gPlayer;
    u32 r1 = player->moveState & MOVESTATE_FACING_LEFT;
#endif
    if (r1) {
        player->qWorldX = (flyingHandle->posX + flyingHandle->moveOffsetX) + Q(4.0);
        player->qWorldY = (flyingHandle->posY + flyingHandle->moveOffsetY) + Q(20.0);
    } else {
        player->qWorldX = (flyingHandle->posX + flyingHandle->moveOffsetX) - Q(4.0);
        player->qWorldY = (flyingHandle->posY + flyingHandle->moveOffsetY) + Q(20.0);
    }
}

static void PlaySound(UNUSED Sprite_FlyingHandle *flyingHandle) { m4aSongNumStartOrContinue(SE_291); }

static bool32 ShouldDespawn(Sprite_FlyingHandle *flyingHandle)
{
    s16 x = flyingHandle->basePosX - gCamera.x;
    s16 y = flyingHandle->basePosY - gCamera.y;

    if (x + flyingHandle->boundsRight < -(CAM_REGION_WIDTH / 2) || x + flyingHandle->boundsLeft > (DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2))
        || y + flyingHandle->boundsBottom < -(CAM_REGION_WIDTH / 2)
        || y + flyingHandle->boundsTop > (DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void Despawn(Sprite_FlyingHandle *flyingHandle)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(flyingHandle->base.me, flyingHandle->base.meX);
    TaskDestroy(gCurTask);
}

static void IncrementMpPosQueue(Sprite_FlyingHandle *flyingHandle)
{
    flyingHandle->mpPosQueue[2][0] = flyingHandle->mpPosQueue[1][0];
    flyingHandle->mpPosQueue[2][1] = flyingHandle->mpPosQueue[1][1];

    flyingHandle->mpPosQueue[1][0] = flyingHandle->mpPosQueue[0][0];
    flyingHandle->mpPosQueue[1][1] = flyingHandle->mpPosQueue[0][1];

    flyingHandle->mpPosQueue[0][0] = flyingHandle->posX + flyingHandle->moveOffsetX;
    flyingHandle->mpPosQueue[0][1] = flyingHandle->posY + flyingHandle->moveOffsetY;
}
