#include "global.h"
#include "gba/types.h"

#include "game/game.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "malloc_vram.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 posX;
    /* 0x40 */ s32 posY;
    /* 0x44 */ u16 kind;
    /* 0x46 */ u8 filler46[0x2];
    /* 0x48 */ s16 unk48;
    /* 0x4A */ s16 unk4A;
    /* 0x4C */ s16 unk4C;
    /* 0x4E */ s16 unk4E;
    /* 0x50 */ u16 unk50;
    /* 0x52 */ u8 filler52[0x6];
} Sprite_SmallPropeller; /* size: 0x58 */

#define PROP_DIR_LEFT                          0
#define PROP_DIR_RIGHT                         1
#define PROP_MASK_PERIODIC                     2
#define SKYCAN_PROPELLER_KIND(dir, isPeriodic) (((isPeriodic) << 1) | (dir))

extern void initSprite_Interactable_SkyCanyon_SmallPropeller(MapEntity *me,
                                                             u16 spriteRegionX,
                                                             u16 spriteRegionY,
                                                             u8 spriteY, u8 kind);
extern void Task_Interactable_SkyCanyon_SmallPropeller(void);

void SetTaskMain_807D978(Sprite_SmallPropeller *unused);

void sub_807D468(Sprite_SmallPropeller *);
void sub_807D5CC(Sprite_SmallPropeller *);
void sub_807D6A8(Sprite_SmallPropeller *);
bool32 sub_807D6FC(Sprite_SmallPropeller *);
bool32 sub_807D86C(Sprite_SmallPropeller *);

// static
s16 ClampGroundSpeed(s16);

void Task_807D978(void);
void SetTaskMain_Interactable087(Sprite_SmallPropeller *unused);
void DestroyTask_Interactable087(Sprite_SmallPropeller *);

void sub_807D6A8(Sprite_SmallPropeller *prop)
{
    Sprite *s = &prop->s;

    if ((prop->kind == SKYCAN_PROPELLER_KIND(PROP_DIR_LEFT, FALSE))
        || (prop->kind == SKYCAN_PROPELLER_KIND(PROP_DIR_LEFT, TRUE))) {
        s->x = prop->posX + prop->unk4C - gCamera.x;
    } else {
        s->x = prop->posX + prop->unk48 - gCamera.x;
    }

    s->y = prop->posY + prop->unk4E - gCamera.y;

    sub_8004558(s);
    sub_80051E8(s);
}

bool32 sub_807D6FC(Sprite_SmallPropeller *prop)
{
    if (PLAYER_IS_ALIVE) {
        s16 screenX = prop->posX - gCamera.x;
        s16 screenY = prop->posY - gCamera.y;

        s16 playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        s16 playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        u16 r6 = prop->unk4C - prop->unk48;
        u16 r7 = prop->unk4E - prop->unk4A;

        if (((screenX + prop->unk48) <= playerX)
            && ((screenX + prop->unk48 + r6) >= playerX)
            && ((screenY + prop->unk4A) <= playerY)
            && ((screenY + prop->unk4A + r7) >= playerY))
            return TRUE;
    }

    return FALSE;
}

void Task_Interactable_SkyCanyon_SmallPropeller(void)
{
    Sprite_SmallPropeller *prop = TaskGetStructPtr(gCurTask);

    if (sub_807D6FC(prop)) {
        SetTaskMain_807D978(prop);
    }

    if (sub_807D86C(prop)) {
        DestroyTask_Interactable087(prop);
    } else {
        sub_807D5CC(prop);
        sub_807D6A8(prop);
    }
}

void TaskDestructor_Interactable_SkyCanyon_SmallPropeller(struct Task *t)
{
    Sprite_SmallPropeller *prop = TaskGetStructPtr(t);
    VramFree(prop->s.graphics.dest);
}

void SetTaskMain_807D978(Sprite_SmallPropeller *unused)
{
    gCurTask->main = Task_807D978;
}

// static
s16 ClampGroundSpeed(s16 speed)
{
    if (gPlayer.unk5A) {
        CLAMP_INLINE2(speed, -Q_24_8(15.0), +Q_24_8(15.0));
    } else {
        // @BUG: It seems like this should have -9.0 as min-value?
        CLAMP_INLINE2(speed, -Q_24_8(15.0), +Q_24_8(9.0));
    }

    return speed;
}

bool32 sub_807D86C(Sprite_SmallPropeller *prop)
{
    s16 posX, posY;

    posX = prop->posX - gCamera.x;
    posY = prop->posY - gCamera.y;

    if (((posX + prop->unk4C) < -128) || ((posX + prop->unk48) > 368)
        || ((posY + prop->unk4E) < -128) || ((posY + prop->unk4A) > 288))
        return TRUE;

    return FALSE;
}

void DestroyTask_Interactable087(Sprite_SmallPropeller *prop)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(prop->base.me, prop->base.spriteX);
    TaskDestroy(gCurTask);
}

void initSprite_Interactable_SkyCanyon_SmallPropeller_Left(MapEntity *me,
                                                           u16 spriteRegionX,
                                                           u16 spriteRegionY, u8 spriteY)
{
    initSprite_Interactable_SkyCanyon_SmallPropeller(
        me, spriteRegionX, spriteRegionY, spriteY,
        SKYCAN_PROPELLER_KIND(PROP_DIR_LEFT, FALSE));
}

void initSprite_Interactable_SkyCanyon_SmallPropeller_Right(MapEntity *me,
                                                            u16 spriteRegionX,
                                                            u16 spriteRegionY,
                                                            u8 spriteY)
{
    initSprite_Interactable_SkyCanyon_SmallPropeller(
        me, spriteRegionX, spriteRegionY, spriteY,
        SKYCAN_PROPELLER_KIND(PROP_DIR_RIGHT, FALSE));
}

void initSprite_Interactable_SkyCanyon_SmallPropeller_Left_Periodic(MapEntity *me,
                                                                    u16 spriteRegionX,
                                                                    u16 spriteRegionY,
                                                                    u8 spriteY)
{
    initSprite_Interactable_SkyCanyon_SmallPropeller(
        me, spriteRegionX, spriteRegionY, spriteY,
        SKYCAN_PROPELLER_KIND(PROP_DIR_LEFT, TRUE));
}

void initSprite_Interactable_SkyCanyon_SmallPropeller_Right_Periodic(MapEntity *me,
                                                                     u16 spriteRegionX,
                                                                     u16 spriteRegionY,
                                                                     u8 spriteY)
{
    initSprite_Interactable_SkyCanyon_SmallPropeller(
        me, spriteRegionX, spriteRegionY, spriteY,
        SKYCAN_PROPELLER_KIND(PROP_DIR_RIGHT, TRUE));
}

void Task_807D978(void)
{
    Sprite_SmallPropeller *prop = TaskGetStructPtr(gCurTask);

    sub_807D468(prop);

    if (!sub_807D6FC(prop)) {
        SetTaskMain_Interactable087(prop);
    }

    sub_807D5CC(prop);
    sub_807D6A8(prop);
}

void SetTaskMain_Interactable087(Sprite_SmallPropeller *unused)
{
    gCurTask->main = Task_Interactable_SkyCanyon_SmallPropeller;
}