#include "global.h"
#include "core.h"
#include "task.h"
#include "game/interactables_2/egg_utopia/flying_handle.h"
#include "malloc_vram.h"
#include "trig.h"
#include "lib/m4a.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
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

void CreateEntity_FlyingHandle(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                               u8 spriteY)
{
    u32 i;
    Sprite *sprite;
    struct Task *t = TaskCreate(Task_FlyingHandle, sizeof(Sprite_FlyingHandle), 0x2010,
                                0, TaskDestructor_FlyingHandle);
    Sprite_FlyingHandle *flyingHandle = TaskGetStructPtr(t);
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

    flyingHandle->unk44
        = Q_24_8(((flyingHandle->offsetX + flyingHandle->width) >> 1) + flyingHandle->x);
    flyingHandle->unk48 = Q_24_8(flyingHandle->y + flyingHandle->height);
    flyingHandle->unk4C = 0;
    flyingHandle->unk50 = 0;

    flyingHandle->base.regionX = spriteRegionX;
    flyingHandle->base.regionY = spriteRegionY;
    flyingHandle->base.me = me;
    flyingHandle->base.spriteX = me->x;
    flyingHandle->base.spriteY = spriteY;

    for (i = 0; i < 3; i++) {
        flyingHandle->unk6C[i][0] = flyingHandle->unk44;
        flyingHandle->unk6C[i][1] = flyingHandle->unk48;
    }

    sprite = &flyingHandle->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->hitboxes[0].unk0 = -1;
    sprite->unk10 = SPRITE_FLAG(PRIORITY, 2);
    sprite->graphics.dest = VramMalloc(FLYING_HANDLE_VRAM_TILES);
    sprite->graphics.anim = SA2_ANIM_FLYING_HANDLE;
    sprite->variant = 0;
    sub_8004558(sprite);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void Task_ActiveMain(void)
{
    Sprite_FlyingHandle *flyingHandle = TaskGetStructPtr(gCurTask);
    if (IS_MULTI_PLAYER) {
        sub_807F8B4(flyingHandle);
    }

    sub_807F818(flyingHandle);

    if (!PLAYER_IS_ALIVE) {
        sub_807F770(flyingHandle);
    } else if (gPlayer.unk2C == 120) {
        sub_807F798(flyingHandle);
    } else if (flyingHandle->unk69 == 0) {
        if (gPlayer.unk5E & gPlayerControls.jump) {
            if (gPlayer.unk5C & 0x20) {
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
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 55;
    gPlayer.speedGroundX = 0;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;
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
    gPlayer.moveState &= ~MOVESTATE_400000;
    sub_80218E4(&gPlayer);
    sub_8023B5C(&gPlayer, 14);

    gPlayer.unk16 = 6;
    gPlayer.unk17 = 14;
    gPlayer.moveState &= ~MOVESTATE_4;
    gPlayer.transition = PLTRANS_PT3;
    gPlayer.speedGroundX = 0;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;
    flyingHandle->unk69 = 30;
    m4aSongNumStop(SE_291);
    gCurTask->main = sub_807F6F0;
}

static void sub_807F4F0(Sprite_FlyingHandle *flyingHandle)
{
    if (flyingHandle->unk60 != 0) {
        if (flyingHandle->unk48 <= Q_24_8(flyingHandle->y + flyingHandle->offsetY)
            && flyingHandle->unk5E > -1) {
            flyingHandle->unk50 = SIN_24_8(flyingHandle->unk68 * 4) * 8;
            flyingHandle->unk68 += 4;
            flyingHandle->unk5E = 0;
        } else {
            flyingHandle->unk5E += 16;
            flyingHandle->unk5E = MIN(flyingHandle->unk5E, 0x300);
            flyingHandle->unk48 -= flyingHandle->unk5E;
            if (flyingHandle->unk48 <= Q_24_8(flyingHandle->y + flyingHandle->offsetY)) {
                flyingHandle->unk5E = 0;
                flyingHandle->unk48 = Q_24_8(flyingHandle->y + flyingHandle->offsetY);
                flyingHandle->unk68 = -128;
            }
        }
    } else {
        flyingHandle->unk48 = Q_24_8(flyingHandle->y + flyingHandle->height);
        flyingHandle->unk50 = SIN_24_8(flyingHandle->unk68 * 4) * 8;
        flyingHandle->unk68 += 4;
    }
}

static void sub_807F5C0(Sprite_FlyingHandle *flyingHandle)
{
    Sprite *sprite = &flyingHandle->sprite;
    if (IS_MULTI_PLAYER) {
        sprite->x = Q_24_8_TO_INT(flyingHandle->unk6C[1][0]) - gCamera.x;
        sprite->y = Q_24_8_TO_INT(flyingHandle->unk6C[1][1]) - gCamera.y;
    } else {
        sprite->x = Q_24_8_TO_INT(flyingHandle->unk44 + flyingHandle->unk4C) - gCamera.x;
        sprite->y = Q_24_8_TO_INT(flyingHandle->unk48 + flyingHandle->unk50) - gCamera.y;
    }

    sub_8004558(sprite);
    sub_80051E8(sprite);
}

static bool32 IsPlayerTouching(Sprite_FlyingHandle *flyingHandle)
{
    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    } else {
        s16 x = Q_24_8_TO_INT(flyingHandle->unk44 + flyingHandle->unk4C) - gCamera.x;
        s16 y = Q_24_8_TO_INT(flyingHandle->unk48 + flyingHandle->unk50) - gCamera.y;
        s16 playerX = (Q_24_8_TO_INT(gPlayer.x) - gCamera.x);
        s16 playerY = (Q_24_8_TO_INT(gPlayer.y) - gCamera.y);
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
    Sprite_FlyingHandle *flyingHandle = TaskGetStructPtr(gCurTask);
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
    Sprite_FlyingHandle *flyingHandle = TaskGetStructPtr(gCurTask);

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
    Sprite_FlyingHandle *flyingHandle = TaskGetStructPtr(t);
    VramFree(flyingHandle->sprite.graphics.dest);
}

static void sub_807F770(UNUSED Sprite_FlyingHandle *flyingHandle)
{
    gCurTask->main = Task_FlyingHandle;
}

static void sub_807F784(UNUSED Sprite_FlyingHandle *flyingHandle)
{
    gCurTask->main = Task_FlyingHandle;
}

static void sub_807F798(Sprite_FlyingHandle *flyingHandle)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
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
        player->x = (flyingHandle->unk44 + flyingHandle->unk4C) + Q_24_8(4.0);
        player->y = (flyingHandle->unk48 + flyingHandle->unk50) + Q_24_8(20.0);
    } else {
        player->x = (flyingHandle->unk44 + flyingHandle->unk4C) - Q_24_8(4.0);
        player->y = (flyingHandle->unk48 + flyingHandle->unk50) + Q_24_8(20.0);
    }
}

static void sub_807F818(UNUSED Sprite_FlyingHandle *flyingHandle)
{
    m4aSongNumStartOrContinue(SE_291);
}

static bool32 ShouldDespawn(Sprite_FlyingHandle *flyingHandle)
{
    s16 x = flyingHandle->x - gCamera.x;
    s16 y = flyingHandle->y - gCamera.y;

    if (x + flyingHandle->width < -128 || x + flyingHandle->offsetX > 368
        || y + flyingHandle->height < -128 || y + flyingHandle->offsetY > 288) {
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
