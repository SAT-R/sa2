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

typedef struct {
    SpriteBase base;
    Sprite s;
    s32 x;
    s32 y;
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s32 unk50;
    s16 offsetX;
    s16 offsetY;
    s16 width;
    s16 height;
    s16 unk5C;
    s16 unk5E;
    s32 unk60;
    u32 unk64;
    u8 unk68;
    u8 unk69;
    s32 unk6C[3][2];
} Sprite_FlyingHandle;

static void Task_FlyingHandle(void);
static void TaskDestructor_FlyingHandle(struct Task *);
static void sub_807F8B4(Sprite_FlyingHandle *);
static void sub_807F484(Sprite_FlyingHandle *);
static void sub_807F798(Sprite_FlyingHandle *);
static void sub_807F818(Sprite_FlyingHandle *);
static void sub_807F770(Sprite_FlyingHandle *);
static void sub_807F4F0(Sprite_FlyingHandle *);
static void sub_807F7D0(Sprite_FlyingHandle *);
static void sub_807F5C0(Sprite_FlyingHandle *);
static void Task_ActiveMain(void);
static void sub_807F6F0(void);
static bool32 ShouldDespawn(Sprite_FlyingHandle *);
static void Despawn(Sprite_FlyingHandle *);
static void sub_807F784(Sprite_FlyingHandle *);

#define FLYING_HANDLE_VRAM_TILES 25

void CreateEntity_FlyingHandle(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    u32 i;
    Sprite *s;
    struct Task *t = TaskCreate(Task_FlyingHandle, sizeof(Sprite_FlyingHandle), 0x2010, 0, TaskDestructor_FlyingHandle);
    Sprite_FlyingHandle *flyingHandle = TASK_DATA(t);
    flyingHandle->unk68 = 0;
    flyingHandle->unk5C = 0;
    flyingHandle->unk5E = 0;
    flyingHandle->unk60 = 0;
    flyingHandle->x = TO_WORLD_POS(me->x, spriteRegionX);
    flyingHandle->y = TO_WORLD_POS(me->y, spriteRegionY);
    flyingHandle->offsetX = me->d.sData[0] * 8;
    flyingHandle->offsetY = me->d.sData[1] * 8;
    flyingHandle->width = flyingHandle->offsetX + me->d.uData[2] * 8;
    flyingHandle->height = flyingHandle->offsetY + me->d.uData[3] * 8;

    flyingHandle->unk44 = Q(((flyingHandle->offsetX + flyingHandle->width) >> 1) + flyingHandle->x);
    flyingHandle->unk48 = Q(flyingHandle->y + flyingHandle->height);
    flyingHandle->unk4C = 0;
    flyingHandle->unk50 = 0;

    flyingHandle->base.regionX = spriteRegionX;
    flyingHandle->base.regionY = spriteRegionY;
    flyingHandle->base.me = me;
    flyingHandle->base.spriteX = me->x;
    flyingHandle->base.id = spriteY;

    for (i = 0; i < 3; i++) {
        flyingHandle->unk6C[i][0] = flyingHandle->unk44;
        flyingHandle->unk6C[i][1] = flyingHandle->unk48;
    }

    s = &flyingHandle->s;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
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
        sub_807F8B4(flyingHandle);
    }

    sub_807F818(flyingHandle);

    if (!PLAYER_IS_ALIVE) {
        sub_807F770(flyingHandle);
    } else if (gPlayer.timerInvulnerability == 120) {
        sub_807F798(flyingHandle);
    } else if (flyingHandle->unk69 == 0) {
        if (gPlayer.frameInput & gPlayerControls.jump) {
            if (gPlayer.heldInput & 0x20) {
                flyingHandle->unk64 = 1;
            } else {
                flyingHandle->unk64 = 0;
            }
            sub_807F484(flyingHandle);
        }
    }

    if (flyingHandle->unk69 != 0) {
        flyingHandle->unk69--;
    }

    sub_807F4F0(flyingHandle);
    sub_807F7D0(flyingHandle);
    sub_807F5C0(flyingHandle);
}

static void ActivatePlayerGrab(Sprite_FlyingHandle *flyingHandle)
{
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_HANGING;
    gPlayer.qSpeedGround = 0;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;
    sub_807F7D0(flyingHandle);

    flyingHandle->unk60 = 1;
    flyingHandle->unk5E = -384;
    flyingHandle->unk44 += flyingHandle->unk4C;
    flyingHandle->unk48 += flyingHandle->unk50;
    flyingHandle->unk4C = 0;
    flyingHandle->unk50 = 0;
    flyingHandle->unk69 = 30;
    m4aSongNumStart(SE_291);
    gCurTask->main = Task_ActiveMain;
}

static void sub_807F484(Sprite_FlyingHandle *flyingHandle)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    Player_TransitionCancelFlyingAndBoost(&gPlayer);
    Player_SetSpriteOffsetY(&gPlayer, 14);

    gPlayer.spriteOffsetX = 6;
    gPlayer.spriteOffsetY = 14;
    gPlayer.moveState &= ~MOVESTATE_4;
    gPlayer.transition = PLTRANS_INIT_JUMP;
    gPlayer.qSpeedGround = 0;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;
    flyingHandle->unk69 = 30;
    m4aSongNumStop(SE_291);
    gCurTask->main = sub_807F6F0;
}

static void sub_807F4F0(Sprite_FlyingHandle *flyingHandle)
{
    if (flyingHandle->unk60 != 0) {
        if (flyingHandle->unk48 <= Q(flyingHandle->y + flyingHandle->offsetY) && flyingHandle->unk5E > -1) {
            flyingHandle->unk50 = SIN_24_8(flyingHandle->unk68 * 4) * 8;
            flyingHandle->unk68 += 4;
            flyingHandle->unk5E = 0;
        } else {
            flyingHandle->unk5E += 16;
            flyingHandle->unk5E = MIN(flyingHandle->unk5E, 0x300);
            flyingHandle->unk48 -= flyingHandle->unk5E;
            if (flyingHandle->unk48 <= Q(flyingHandle->y + flyingHandle->offsetY)) {
                flyingHandle->unk5E = 0;
                flyingHandle->unk48 = Q(flyingHandle->y + flyingHandle->offsetY);
                flyingHandle->unk68 = -128;
            }
        }
    } else {
        flyingHandle->unk48 = Q(flyingHandle->y + flyingHandle->height);
        flyingHandle->unk50 = SIN_24_8(flyingHandle->unk68 * 4) * 8;
        flyingHandle->unk68 += 4;
    }
}

static void sub_807F5C0(Sprite_FlyingHandle *flyingHandle)
{
    Sprite *s = &flyingHandle->s;
    if (IS_MULTI_PLAYER) {
        s->x = I(flyingHandle->unk6C[1][0]) - gCamera.x;
        s->y = I(flyingHandle->unk6C[1][1]) - gCamera.y;
    } else {
        s->x = I(flyingHandle->unk44 + flyingHandle->unk4C) - gCamera.x;
        s->y = I(flyingHandle->unk48 + flyingHandle->unk50) - gCamera.y;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static bool32 IsPlayerTouching(Sprite_FlyingHandle *flyingHandle)
{
    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    } else {
        s16 x = I(flyingHandle->unk44 + flyingHandle->unk4C) - gCamera.x;
        s16 y = I(flyingHandle->unk48 + flyingHandle->unk50) - gCamera.y;
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

static void Task_FlyingHandle(void)
{
    Sprite_FlyingHandle *flyingHandle = TASK_DATA(gCurTask);
    if (IS_MULTI_PLAYER) {
        sub_807F8B4(flyingHandle);
    }

    if (IsPlayerTouching(flyingHandle)) {
        ActivatePlayerGrab(flyingHandle);
    }

    if (ShouldDespawn(flyingHandle)) {
        Despawn(flyingHandle);
    } else {
        sub_807F4F0(flyingHandle);
        sub_807F5C0(flyingHandle);
    }
}

static void sub_807F6F0(void)
{
    Sprite_FlyingHandle *flyingHandle = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        sub_807F8B4(flyingHandle);
    }

    if (flyingHandle->unk69 == 0) {
        if (!PLAYER_IS_ALIVE || IsPlayerTouching(flyingHandle) == 0) {
            sub_807F784(flyingHandle);
        }
    } else {
        flyingHandle->unk69 -= 1;
    }

    sub_807F4F0(flyingHandle);
    sub_807F5C0(flyingHandle);
}

static void TaskDestructor_FlyingHandle(struct Task *t)
{
    Sprite_FlyingHandle *flyingHandle = TASK_DATA(t);
    VramFree(flyingHandle->s.graphics.dest);
}

static void sub_807F770(UNUSED Sprite_FlyingHandle *flyingHandle) { gCurTask->main = Task_FlyingHandle; }

static void sub_807F784(UNUSED Sprite_FlyingHandle *flyingHandle) { gCurTask->main = Task_FlyingHandle; }

static void sub_807F798(Sprite_FlyingHandle *flyingHandle)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    flyingHandle->unk69 = 30;
    m4aSongNumStop(SE_291);
    gCurTask->main = sub_807F6F0;
}

static void sub_807F7D0(Sprite_FlyingHandle *flyingHandle)
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
        player->qWorldX = (flyingHandle->unk44 + flyingHandle->unk4C) + Q(4.0);
        player->qWorldY = (flyingHandle->unk48 + flyingHandle->unk50) + Q(20.0);
    } else {
        player->qWorldX = (flyingHandle->unk44 + flyingHandle->unk4C) - Q(4.0);
        player->qWorldY = (flyingHandle->unk48 + flyingHandle->unk50) + Q(20.0);
    }
}

static void sub_807F818(UNUSED Sprite_FlyingHandle *flyingHandle) { m4aSongNumStartOrContinue(SE_291); }

static bool32 ShouldDespawn(Sprite_FlyingHandle *flyingHandle)
{
    s16 x = flyingHandle->x - gCamera.x;
    s16 y = flyingHandle->y - gCamera.y;

    if (x + flyingHandle->width < -128 || x + flyingHandle->offsetX > (DISPLAY_WIDTH + 128) || y + flyingHandle->height < -128
        || y + flyingHandle->offsetY > (DISPLAY_HEIGHT + 128)) {
        return TRUE;
    }

    return FALSE;
}

static void Despawn(Sprite_FlyingHandle *flyingHandle)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(flyingHandle->base.me, flyingHandle->base.spriteX);
    TaskDestroy(gCurTask);
}

static void sub_807F8B4(Sprite_FlyingHandle *flyingHandle)
{
    flyingHandle->unk6C[2][0] = flyingHandle->unk6C[1][0];
    flyingHandle->unk6C[2][1] = flyingHandle->unk6C[1][1];

    flyingHandle->unk6C[1][0] = flyingHandle->unk6C[0][0];
    flyingHandle->unk6C[1][1] = flyingHandle->unk6C[0][1];

    flyingHandle->unk6C[0][0] = flyingHandle->unk44 + flyingHandle->unk4C;
    flyingHandle->unk6C[0][1] = flyingHandle->unk48 + flyingHandle->unk50;
}
