#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/sky_canyon/giant_propeller.h"
#include "lib/m4a.h"

#include "constants/move_states.h"
#include "constants/animations.h"
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

void sub_807B8FC(Sprite_GiantPropeller *);
void sub_807B74C(Sprite_GiantPropeller *);
void Task_Interactable_SkyCanyon_GiantPropeller(void);
bool32 sub_807B9A4(Sprite_GiantPropeller *);
void sub_807B7BC(Sprite_GiantPropeller *);
void sub_807BA70(void);
void sub_807B930(Sprite_GiantPropeller *);
void sub_807B8E0(Sprite_GiantPropeller *);
bool32 sub_807B95C(Sprite_GiantPropeller *);
void sub_807BA3C(Sprite_GiantPropeller *);
UNK_807C5F8 *sub_807BA54(void);
void TaskDestructor_Interactable_SkyCanyon_GiantPropeller(struct Task *);
bool32 sub_807B9F0(Sprite_GiantPropeller *);

void sub_807B3E4(void)
{
    Sprite_GiantPropeller *propeller = TaskGetStructPtr(gCurTask);

    if (!PlayerIsAlive) {
        gCurTask->main = Task_Interactable_SkyCanyon_GiantPropeller;
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

    if (!sub_807B9A4(propeller)) {
        sub_807B7BC(propeller);
    }

    sub_807BA70();
    sub_807B930(propeller);
}

void sub_807B530(void)
{
    Sprite_GiantPropeller *propeller = TaskGetStructPtr(gCurTask);
    if (!PlayerIsAlive) {
        gCurTask->main = Task_Interactable_SkyCanyon_GiantPropeller;
    } else {
        s32 temp;
        sub_807B8FC(propeller);
        if (gPlayer.unk5C & 0x10) {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
            propeller->unk44 += 0x10;

            if (propeller->unk44 > 0x200) {
                propeller->unk44 = 0x200;
            } else if ((u16)(propeller->unk44 + 0x1F) < 0x3F) {
                propeller->unk44 = 0x20;
            }
        }

        if (gPlayer.unk5C & 0x20) {
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
            propeller->unk44 -= 0x10;
            if (propeller->unk44 < -0x200) {
                propeller->unk44 = -0x200;
            } else if ((u16)(propeller->unk44 + 31) < 0x3F) {
                propeller->unk44 = -0x20;
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
            propeller->unk44 = 0x20;
        }
        temp = sub_801F100(({ Q_24_8_TO_INT(gPlayer.x) - 2; }) - gPlayer.unk16,
                           Q_24_8_TO_INT(gPlayer.y), gPlayer.unk38, -8, sub_801EB44);
        if (temp < 0) {
            gPlayer.x -= Q_24_8(temp);
            propeller->unk44 = -0x20;
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

        if (!sub_807B9A4(propeller)) {
            sub_807B7BC(propeller);
        } else if (!sub_807B9F0(propeller)) {
            sub_807B7BC(propeller);
        }
    }
    sub_807BA70();
    sub_807B930(propeller);
}

void sub_807B74C(Sprite_GiantPropeller *propeller)
{
    propeller->unk48 = 0;
    propeller->unk46 = SIN_24_8(0) * 16;
    propeller->unk44 = gPlayer.speedAirX;
    if (gPlayer.speedAirX >= 1) {
        propeller->unk44 = 0x20;
    } else if (gPlayer.speedAirX < 0) {
        propeller->unk44 = -0x20;
    } else {
        propeller->unk44 = gPlayer.moveState & MOVESTATE_FACING_LEFT ? -0x20 : 0x20;
    }
    gCurTask->main = sub_807B530;
}

void sub_807B7BC(Sprite_GiantPropeller *propeller)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    gPlayer.unk6D = 5;

    if ((u8)(propeller->unk48 - 0x41) > 0x7E) {
        propeller->unk48 += 0x40;
        propeller->unk48 = 0x80 - propeller->unk48;
        gPlayer.speedAirY = -(propeller->unk48 * 1024) >> 7;
        if (gPlayer.speedAirY >= 1) {
            gPlayer.speedAirY = 0;
        }
    } else {
        gPlayer.speedAirY = 0;
    }

    gPlayer.speedAirX = propeller->unk44 >> 1;
    gCurTask->main = Task_Interactable_SkyCanyon_GiantPropeller;
}

bool32 sub_807B828(Sprite_GiantPropeller *propeller)
{
    s16 temp, temp2, temp3, temp4;
    if (!PlayerIsAlive) {
        return 0;
    }

    temp = propeller->x - gCamera.x;
    temp3 = propeller->y - gCamera.y;
    temp2 = (gPlayer.x >> 8) - gCamera.x;
    temp4 = (gPlayer.y >> 8) - gCamera.y;
    if (temp - 0x4A <= temp2 && temp + 0x4A >= temp2) {
        if (temp3 - 0x40 <= temp4 && temp3 + 0x40 >= temp4) {
            return TRUE;
        }
    }

    return FALSE;
}

void Task_Interactable_SkyCanyon_GiantPropeller(void)
{
    Sprite_GiantPropeller *propeller = TaskGetStructPtr(gCurTask);

    if (sub_807B828(propeller)) {
        sub_807B8E0(propeller);
    }

    if (sub_807B95C(propeller)) {
        sub_807BA3C(propeller);
    } else {
        sub_807BA70();
        sub_807B930(propeller);
    }
}

void sub_807B8E0(Sprite_GiantPropeller *propeller)
{
    sub_807B8FC(propeller);
    gCurTask->main = sub_807B3E4;
}

void sub_807B8FC(Sprite_GiantPropeller *propeller)
{

    sub_80218E4(&gPlayer);
    sub_8023B5C(&gPlayer, 14);
    gPlayer.unk16 = 6;
    gPlayer.unk17 = 14;
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 44;
}

void sub_807B930(Sprite_GiantPropeller *propeller)
{
    Sprite *sprite = &sub_807BA54()->sprite2;
    sprite->x = propeller->x - gCamera.x;
    sprite->y = propeller->y - gCamera.y;
    sub_80051E8(sprite);
}

bool32 sub_807B95C(Sprite_GiantPropeller *propeller)
{
    s16 x = propeller->x - gCamera.x;
    s16 y = propeller->y - gCamera.y;

    if (IS_OUT_OF_GRAV_TRIGGER_RANGE(x, y)) {
        return TRUE;
    }

    return FALSE;
}

bool32 sub_807B9A4(Sprite_GiantPropeller *propeller)
{
    if (PlayerIsAlive) {
        s16 x = propeller->x - gCamera.x;
        s16 playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;

        if (x - 0x4A <= playerX && (x + 0x4A >= playerX)) {
            return TRUE;
        }
    }

    return FALSE;
}

bool32 sub_807B9F0(Sprite_GiantPropeller *propeller)
{
    if (PlayerIsAlive) {
        s16 y = propeller->y - gCamera.y;
        s16 playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        if (y - 0x60 <= playerY && y + 0x40 >= playerY) {
            return TRUE;
        }
    }

    return FALSE;
}

void sub_807BA3C(Sprite_GiantPropeller *propeller)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(propeller->base.me, propeller->base.spriteX);
    TaskDestroy(gCurTask);
}

UNK_807C5F8 *sub_807BA54(void)
{
    UNK_807C5F8_Parent *parent = TaskGetStructPtr(TaskGetParent(gCurTask));
    return TaskGetStructPtr(parent->unk18);
}

void sub_807BA70(void)
{
    UNK_807C5F8_Parent *parent = TaskGetStructPtr(TaskGetParent(gCurTask));
    UNK_807C5F8 *unk807 = TaskGetStructPtr(parent->unk18);

    unk807->unk62++;
}

void initSprite_Interactable_SkyCanyon_GiantPropeller(MapEntity *me, u16 spriteRegionX,
                                                      u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_SkyCanyon_GiantPropeller,
                                sizeof(Sprite_GiantPropeller), 0x2010, 0,
                                TaskDestructor_Interactable_SkyCanyon_GiantPropeller);

    Sprite_GiantPropeller *propeller = TaskGetStructPtr(t);
    propeller->x = SpriteGetScreenPos(me->x, spriteRegionX);
    propeller->y = SpriteGetScreenPos(me->y, spriteRegionY);
    propeller->base.regionX = spriteRegionX;
    propeller->base.regionY = spriteRegionY;
    propeller->base.me = me;
    propeller->base.spriteX = me->x;
    propeller->base.spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

void TaskDestructor_Interactable_SkyCanyon_GiantPropeller(struct Task *t)
{
    // unused
}
