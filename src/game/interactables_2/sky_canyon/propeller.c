#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"

#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/entity.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/interactables_2/sky_canyon/propeller.h"
#include "game/interactables_2/sky_canyon_init.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite sprite; // unused
    s32 x;
    s32 y;
    s16 unk44;
    s16 unk46;
    u8 unk48;
} Sprite_Propeller;

#define PROPELLER_HITBOX_WIDTH  148
#define PROPELLER_HITBOX_HEIGHT 128

static void sub_807B8FC(Sprite_Propeller *);
static void sub_807B74C(Sprite_Propeller *);
static void Task_GiantPropellerIdle(void);
static bool32 IsPlayerInAirCurrent(Sprite_Propeller *);
static void sub_807B7BC(Sprite_Propeller *);
static void sub_807BA70(void);
static void Render(Sprite_Propeller *);
static void StartPlayerFloatingTask(Sprite_Propeller *);
static bool32 ShouldDespawn(Sprite_Propeller *);
static void DestroyPropeller(Sprite_Propeller *);
Sprite_OnInit_SkyCanyon *sub_807BA54(void);
static void TaskDestructor_GiantPropeller(struct Task *);
static bool32 sub_807B9F0(Sprite_Propeller *);

static void Task_PlayerFloating(void)
{
    Sprite_Propeller *propeller = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_GiantPropellerIdle;
    } else {
        s32 temp;
        sub_807B8FC(propeller);
        gPlayer.qWorldY -= Q(4);
        if (I(gPlayer.qWorldY) <= propeller->y - 48) {
            gPlayer.qWorldY = Q(propeller->y - 48);
            sub_807B74C(propeller);
        }

        if (gPlayer.heldInput & DPAD_RIGHT) {
            gPlayer.qWorldX += Q(0.5);
        }

        if (gPlayer.heldInput & DPAD_LEFT) {
            gPlayer.qWorldX -= Q(0.5);
        }

        temp = sub_801F100(({ I(gPlayer.qWorldX) + 2; }) + gPlayer.spriteOffsetX, I(gPlayer.qWorldY), gPlayer.layer, +8, sub_801EB44);
        if (temp < 0) {
            gPlayer.qWorldX += Q(temp);
        }
        temp = sub_801F100(({ I(gPlayer.qWorldX) - 2; }) - gPlayer.spriteOffsetX, I(gPlayer.qWorldY), gPlayer.layer, -8, sub_801EB44);
        if (temp < 0) {
            gPlayer.qWorldX -= Q(temp);
        }

        temp = sub_801F100(I(gPlayer.qWorldY) + gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, 8, sub_801EC3C);
        if (temp < 0) {
            gPlayer.qWorldY += Q(temp);
        }
        temp = sub_801F100(I(gPlayer.qWorldY) - gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, -8, sub_801EC3C);
        if (temp < 0) {
            gPlayer.qWorldY -= Q(temp);
        }
    }

    if (!IsPlayerInAirCurrent(propeller)) {
        sub_807B7BC(propeller);
    }

    sub_807BA70();
    Render(propeller);
}

static void sub_807B530(void)
{
    Sprite_Propeller *propeller = TASK_DATA(gCurTask);
    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_GiantPropellerIdle;
    } else {
        s32 temp;
        sub_807B8FC(propeller);
        if (gPlayer.heldInput & 0x10) {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
            propeller->unk44 += 16;

            if (propeller->unk44 > 512) {
                propeller->unk44 = 512;
            } else if (propeller->unk44 > -32 && propeller->unk44 < 32) {
                propeller->unk44 = 32;
            }
        }

        if (gPlayer.heldInput & 0x20) {
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
            propeller->unk44 -= 16;
            if (propeller->unk44 < -512) {
                propeller->unk44 = -512;
            } else if (propeller->unk44 > -32 && propeller->unk44 < 32) {
                propeller->unk44 = -32;
            }
        }

        gPlayer.qWorldX += propeller->unk44;
        gPlayer.qWorldY -= propeller->unk46;

        propeller->unk46 = SIN_24_8(propeller->unk48 * 4) * 16;
        gPlayer.qWorldY += propeller->unk46;
        propeller->unk48 -= 4;

        temp = sub_801F100(({ I(gPlayer.qWorldX) + 2; }) + gPlayer.spriteOffsetX, I(gPlayer.qWorldY), gPlayer.layer, 8, sub_801EB44);
        if (temp < 0) {
            gPlayer.qWorldX += Q(temp);
            propeller->unk44 = 32;
        }
        temp = sub_801F100(({ I(gPlayer.qWorldX) - 2; }) - gPlayer.spriteOffsetX, I(gPlayer.qWorldY), gPlayer.layer, -8, sub_801EB44);
        if (temp < 0) {
            gPlayer.qWorldX -= Q(temp);
            propeller->unk44 = -32;
        }

        temp = sub_801F100(I(gPlayer.qWorldY) + gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, 8, sub_801EC3C);
        if (temp < 0) {
            gPlayer.qWorldY += Q(temp);
        }
        temp = sub_801F100(I(gPlayer.qWorldY) - gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, -8, sub_801EC3C);
        if (temp < 0) {
            gPlayer.qWorldY -= Q(temp);
        }

        if (!IsPlayerInAirCurrent(propeller)) {
            sub_807B7BC(propeller);
        } else if (!sub_807B9F0(propeller)) {
            sub_807B7BC(propeller);
        }
    }
    sub_807BA70();
    Render(propeller);
}

static void sub_807B74C(Sprite_Propeller *propeller)
{
    propeller->unk48 = 0;
    propeller->unk46 = SIN_24_8(0) * 16;
    propeller->unk44 = gPlayer.qSpeedAirX;
    if (gPlayer.qSpeedAirX >= 1) {
        propeller->unk44 = 32;
    } else if (gPlayer.qSpeedAirX < 0) {
        propeller->unk44 = -32;
    } else {
        propeller->unk44 = gPlayer.moveState & MOVESTATE_FACING_LEFT ? -32 : 32;
    }
    gCurTask->main = sub_807B530;
}

static void sub_807B7BC(Sprite_Propeller *propeller)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    gPlayer.transition = PLTRANS_UNCURL;

    if (propeller->unk48 <= (PROPELLER_HITBOX_HEIGHT / 2) || propeller->unk48 >= 192) {
        propeller->unk48 += (PROPELLER_HITBOX_HEIGHT / 2);
        propeller->unk48 = PROPELLER_HITBOX_HEIGHT - propeller->unk48;
        gPlayer.qSpeedAirY = -(propeller->unk48 * 1024) >> 7;
        if (gPlayer.qSpeedAirY >= 1) {
            gPlayer.qSpeedAirY = 0;
        }
    } else {
        gPlayer.qSpeedAirY = 0;
    }

    gPlayer.qSpeedAirX = propeller->unk44 >> 1;
    gCurTask->main = Task_GiantPropellerIdle;
}

bool32 IsPlayerInteracting(Sprite_Propeller *propeller)
{
    s16 x, playerX, y, playerY;
    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    }

    x = propeller->x - gCamera.x;
    y = propeller->y - gCamera.y;
    playerX = I(gPlayer.qWorldX) - gCamera.x;
    playerY = I(gPlayer.qWorldY) - gCamera.y;
    if (x - (PROPELLER_HITBOX_WIDTH / 2) <= playerX && x + (PROPELLER_HITBOX_WIDTH / 2) >= playerX) {
        if (y - (PROPELLER_HITBOX_HEIGHT / 2) <= playerY && y + (PROPELLER_HITBOX_HEIGHT / 2) >= playerY) {
            return TRUE;
        }
    }

    return FALSE;
}

static void Task_GiantPropellerIdle(void)
{
    Sprite_Propeller *propeller = TASK_DATA(gCurTask);

    if (IsPlayerInteracting(propeller)) {
        StartPlayerFloatingTask(propeller);
    }

    if (ShouldDespawn(propeller)) {
        DestroyPropeller(propeller);
        return;
    }

    sub_807BA70();
    Render(propeller);
}

static void StartPlayerFloatingTask(Sprite_Propeller *propeller)
{
    sub_807B8FC(propeller);
    gCurTask->main = Task_PlayerFloating;
}

static void sub_807B8FC(Sprite_Propeller *propeller)
{

    Player_TransitionCancelFlyingAndBoost(&gPlayer);
    Player_SetSpriteOffsetY(&gPlayer, 14);
    gPlayer.spriteOffsetX = 6;
    gPlayer.spriteOffsetY = 14;
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_IN_WHIRLWIND;
}

static void Render(Sprite_Propeller *propeller)
{
    Sprite *sprite = &sub_807BA54()->propellor;
    sprite->x = propeller->x - gCamera.x;
    sprite->y = propeller->y - gCamera.y;
    DisplaySprite(sprite);
}

static bool32 ShouldDespawn(Sprite_Propeller *propeller)
{
    s16 x = propeller->x - gCamera.x;
    s16 y = propeller->y - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_2(x, y)) {
        return TRUE;
    }

    return FALSE;
}

static bool32 IsPlayerInAirCurrent(Sprite_Propeller *propeller)
{
    if (PLAYER_IS_ALIVE) {
        s16 x = propeller->x - gCamera.x;
        s16 playerX = I(gPlayer.qWorldX) - gCamera.x;

        if (x - (PROPELLER_HITBOX_WIDTH / 2) <= playerX && (x + (PROPELLER_HITBOX_WIDTH / 2) >= playerX)) {
            return TRUE;
        }
    }

    return FALSE;
}

static bool32 sub_807B9F0(Sprite_Propeller *propeller)
{
    if (PLAYER_IS_ALIVE) {
        s16 y = propeller->y - gCamera.y;
        s16 playerY = I(gPlayer.qWorldY) - gCamera.y;

        // TODO: A Metatile/Chunk is 96 pixels wide (12 * TILE_WIDTH)
        //       Is that the intended value here?
        if (y - 96 <= playerY && y + (PROPELLER_HITBOX_HEIGHT / 2) >= playerY) {
            return TRUE;
        }
    }

    return FALSE;
}

static void DestroyPropeller(Sprite_Propeller *propeller)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(propeller->base.me, propeller->base.spriteX);
    TaskDestroy(gCurTask);
}

Sprite_OnInit_SkyCanyon *sub_807BA54(void)
{
    EntitiesManager *em = TASK_DATA(TASK_PARENT(gCurTask));
    return TASK_DATA(em->preInit);
}

static void sub_807BA70(void)
{
    EntitiesManager *em = TASK_DATA(TASK_PARENT(gCurTask));
    Sprite_OnInit_SkyCanyon *level = TASK_DATA(em->preInit);

    level->unk62++;
}

void CreateEntity_Propeller(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_GiantPropellerIdle, sizeof(Sprite_Propeller), 0x2010, 0, TaskDestructor_GiantPropeller);

    Sprite_Propeller *propeller = TASK_DATA(t);
    propeller->x = TO_WORLD_POS(me->x, spriteRegionX);
    propeller->y = TO_WORLD_POS(me->y, spriteRegionY);
    propeller->base.regionX = spriteRegionX;
    propeller->base.regionY = spriteRegionY;
    propeller->base.me = me;
    propeller->base.spriteX = me->x;
    propeller->base.id = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void TaskDestructor_GiantPropeller(struct Task *t)
{
    // unused
}
