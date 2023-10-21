#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/sky_canyon/giant_propeller.h"
#include "lib/m4a.h"

#include "constants/animations.h"
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
} Sprite_GiantPropeller;

#define PROPELLER_HITBOX_WIDTH  148
#define PROPELLER_HITBOX_HEIGHT 128

static void sub_807B8FC(Sprite_GiantPropeller *);
static void sub_807B74C(Sprite_GiantPropeller *);
static void Task_GiantPropellerIdle(void);
static bool32 IsPlayerInAirCurrent(Sprite_GiantPropeller *);
static void sub_807B7BC(Sprite_GiantPropeller *);
static void sub_807BA70(void);
static void Render(Sprite_GiantPropeller *);
static void StartPlayerFloatingTask(Sprite_GiantPropeller *);
static bool32 ShouldDespawn(Sprite_GiantPropeller *);
static void DestroyPropeller(Sprite_GiantPropeller *);
UNK_807C5F8 *sub_807BA54(void);
static void TaskDestructor_GiantPropeller(struct Task *);
static bool32 sub_807B9F0(Sprite_GiantPropeller *);

static void Task_PlayerFloating(void)
{
    Sprite_GiantPropeller *propeller = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_GiantPropellerIdle;
    } else {
        s32 temp;
        sub_807B8FC(propeller);
        gPlayer.y -= Q_24_8(4);
        if (Q_24_8_TO_INT(gPlayer.y) <= propeller->y - 48) {
            gPlayer.y = Q_24_8(propeller->y - 48);
            sub_807B74C(propeller);
        }

        if (gPlayer.unk5C & 0x10) {
            gPlayer.x += Q_24_8(0.5);
        }

        if (gPlayer.unk5C & 0x20) {
            gPlayer.x -= Q_24_8(0.5);
        }

        temp = sub_801F100(({ Q_24_8_TO_INT(gPlayer.x) + 2; }) + gPlayer.unk16,
                           Q_24_8_TO_INT(gPlayer.y), gPlayer.unk38, 8, sub_801EB44);
        if (temp < 0) {
            gPlayer.x += Q_24_8(temp);
        }
        temp = sub_801F100(({ Q_24_8_TO_INT(gPlayer.x) - 2; }) - gPlayer.unk16,
                           Q_24_8_TO_INT(gPlayer.y), gPlayer.unk38, -8, sub_801EB44);
        if (temp < 0) {
            gPlayer.x -= Q_24_8(temp);
        }

        temp = sub_801F100(Q_24_8_TO_INT(gPlayer.y) + gPlayer.unk17,
                           Q_24_8_TO_INT(gPlayer.x), gPlayer.unk38, 8, sub_801EC3C);
        if (temp < 0) {
            gPlayer.y += Q_24_8(temp);
        }
        temp = sub_801F100(Q_24_8_TO_INT(gPlayer.y) - gPlayer.unk17,
                           Q_24_8_TO_INT(gPlayer.x), gPlayer.unk38, -8, sub_801EC3C);
        if (temp < 0) {
            gPlayer.y -= Q_24_8(temp);
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
    Sprite_GiantPropeller *propeller = TASK_DATA(gCurTask);
    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_GiantPropellerIdle;
    } else {
        s32 temp;
        sub_807B8FC(propeller);
        if (gPlayer.unk5C & 0x10) {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
            propeller->unk44 += 16;

            if (propeller->unk44 > 512) {
                propeller->unk44 = 512;
            } else if (propeller->unk44 > -32 && propeller->unk44 < 32) {
                propeller->unk44 = 32;
            }
        }

        if (gPlayer.unk5C & 0x20) {
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
            propeller->unk44 -= 16;
            if (propeller->unk44 < -512) {
                propeller->unk44 = -512;
            } else if (propeller->unk44 > -32 && propeller->unk44 < 32) {
                propeller->unk44 = -32;
            }
        }

        gPlayer.x += propeller->unk44;
        gPlayer.y -= propeller->unk46;

        propeller->unk46 = SIN_24_8(propeller->unk48 * 4) * 16;
        gPlayer.y += propeller->unk46;
        propeller->unk48 -= 4;

        temp = sub_801F100(({ Q_24_8_TO_INT(gPlayer.x) + 2; }) + gPlayer.unk16,
                           Q_24_8_TO_INT(gPlayer.y), gPlayer.unk38, 8, sub_801EB44);
        if (temp < 0) {
            gPlayer.x += Q_24_8(temp);
            propeller->unk44 = 32;
        }
        temp = sub_801F100(({ Q_24_8_TO_INT(gPlayer.x) - 2; }) - gPlayer.unk16,
                           Q_24_8_TO_INT(gPlayer.y), gPlayer.unk38, -8, sub_801EB44);
        if (temp < 0) {
            gPlayer.x -= Q_24_8(temp);
            propeller->unk44 = -32;
        }

        temp = sub_801F100(Q_24_8_TO_INT(gPlayer.y) + gPlayer.unk17,
                           Q_24_8_TO_INT(gPlayer.x), gPlayer.unk38, 8, sub_801EC3C);
        if (temp < 0) {
            gPlayer.y += Q_24_8(temp);
        }
        temp = sub_801F100(Q_24_8_TO_INT(gPlayer.y) - gPlayer.unk17,
                           Q_24_8_TO_INT(gPlayer.x), gPlayer.unk38, -8, sub_801EC3C);
        if (temp < 0) {
            gPlayer.y -= Q_24_8(temp);
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

static void sub_807B74C(Sprite_GiantPropeller *propeller)
{
    propeller->unk48 = 0;
    propeller->unk46 = SIN_24_8(0) * 16;
    propeller->unk44 = gPlayer.speedAirX;
    if (gPlayer.speedAirX >= 1) {
        propeller->unk44 = 32;
    } else if (gPlayer.speedAirX < 0) {
        propeller->unk44 = -32;
    } else {
        propeller->unk44 = gPlayer.moveState & MOVESTATE_FACING_LEFT ? -32 : 32;
    }
    gCurTask->main = sub_807B530;
}

static void sub_807B7BC(Sprite_GiantPropeller *propeller)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    gPlayer.transition = PLTRANS_PT5;

    if (propeller->unk48 <= (PROPELLER_HITBOX_HEIGHT / 2) || propeller->unk48 >= 192) {
        propeller->unk48 += (PROPELLER_HITBOX_HEIGHT / 2);
        propeller->unk48 = PROPELLER_HITBOX_HEIGHT - propeller->unk48;
        gPlayer.speedAirY = -(propeller->unk48 * 1024) >> 7;
        if (gPlayer.speedAirY >= 1) {
            gPlayer.speedAirY = 0;
        }
    } else {
        gPlayer.speedAirY = 0;
    }

    gPlayer.speedAirX = propeller->unk44 >> 1;
    gCurTask->main = Task_GiantPropellerIdle;
}

bool32 IsPlayerInteracting(Sprite_GiantPropeller *propeller)
{
    s16 x, playerX, y, playerY;
    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    }

    x = propeller->x - gCamera.x;
    y = propeller->y - gCamera.y;
    playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;
    if (x - (PROPELLER_HITBOX_WIDTH / 2) <= playerX
        && x + (PROPELLER_HITBOX_WIDTH / 2) >= playerX) {
        if (y - (PROPELLER_HITBOX_HEIGHT / 2) <= playerY
            && y + (PROPELLER_HITBOX_HEIGHT / 2) >= playerY) {
            return TRUE;
        }
    }

    return FALSE;
}

static void Task_GiantPropellerIdle(void)
{
    Sprite_GiantPropeller *propeller = TASK_DATA(gCurTask);

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

static void StartPlayerFloatingTask(Sprite_GiantPropeller *propeller)
{
    sub_807B8FC(propeller);
    gCurTask->main = Task_PlayerFloating;
}

static void sub_807B8FC(Sprite_GiantPropeller *propeller)
{

    sub_80218E4(&gPlayer);
    sub_8023B5C(&gPlayer, 14);
    gPlayer.unk16 = 6;
    gPlayer.unk17 = 14;
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 44;
}

static void Render(Sprite_GiantPropeller *propeller)
{
    Sprite *sprite = &sub_807BA54()->sprite2;
    sprite->x = propeller->x - gCamera.x;
    sprite->y = propeller->y - gCamera.y;
    DisplaySprite(sprite);
}

static bool32 ShouldDespawn(Sprite_GiantPropeller *propeller)
{
    s16 x = propeller->x - gCamera.x;
    s16 y = propeller->y - gCamera.y;

    if (IS_OUT_OF_GRAV_TRIGGER_RANGE(x, y)) {
        return TRUE;
    }

    return FALSE;
}

static bool32 IsPlayerInAirCurrent(Sprite_GiantPropeller *propeller)
{
    if (PLAYER_IS_ALIVE) {
        s16 x = propeller->x - gCamera.x;
        s16 playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;

        if (x - (PROPELLER_HITBOX_WIDTH / 2) <= playerX
            && (x + (PROPELLER_HITBOX_WIDTH / 2) >= playerX)) {
            return TRUE;
        }
    }

    return FALSE;
}

static bool32 sub_807B9F0(Sprite_GiantPropeller *propeller)
{
    if (PLAYER_IS_ALIVE) {
        s16 y = propeller->y - gCamera.y;
        s16 playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        if (y - 96 <= playerY && y + (PROPELLER_HITBOX_HEIGHT / 2) >= playerY) {
            return TRUE;
        }
    }

    return FALSE;
}

static void DestroyPropeller(Sprite_GiantPropeller *propeller)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(propeller->base.me, propeller->base.spriteX);
    TaskDestroy(gCurTask);
}

UNK_807C5F8 *sub_807BA54(void)
{
    UNK_807C5F8_Parent *parent = TASK_DATA(TASK_PARENT(gCurTask));
    return TASK_DATA(parent->unk18);
}

static void sub_807BA70(void)
{
    UNK_807C5F8_Parent *parent = TASK_DATA(TASK_PARENT(gCurTask));
    UNK_807C5F8 *unk807 = TASK_DATA(parent->unk18);

    unk807->unk62++;
}

void CreateEntity_GiantPropeller(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                 u8 spriteY)
{
    struct Task *t = TaskCreate(Task_GiantPropellerIdle, sizeof(Sprite_GiantPropeller),
                                0x2010, 0, TaskDestructor_GiantPropeller);

    Sprite_GiantPropeller *propeller = TASK_DATA(t);
    propeller->x = TO_WORLD_POS(me->x, spriteRegionX);
    propeller->y = TO_WORLD_POS(me->y, spriteRegionY);
    propeller->base.regionX = spriteRegionX;
    propeller->base.regionY = spriteRegionY;
    propeller->base.me = me;
    propeller->base.spriteX = me->x;
    propeller->base.spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void TaskDestructor_GiantPropeller(struct Task *t)
{
    // unused
}
