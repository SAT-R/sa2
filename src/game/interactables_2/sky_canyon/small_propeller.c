#include "global.h"
#include "gba/types.h"

#include "game/game.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "malloc_vram.h"

#include "constants/animations.h"
#include "constants/move_states.h"

/* This is the small propellers appearing in Sky Canyon,
   which you can run at while keeping a distance from them and increasing your speed.
   Propellers of the "periodic" kind turn themselves on-and-off periodically. */

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
    /* 0x52 */ s16 unk52; // normalized anim-speed?
    /* 0x54 */ s16 unk54;
    /* 0x54 */ u8 filler54[0x4];
} Sprite_SmallPropeller; /* size: 0x58 */

#define PROP_DIR_LEFT                          0
#define PROP_DIR_RIGHT                         1
#define PROP_MASK_PERIODIC                     2
#define SKYCAN_PROPELLER_KIND(dir, isPeriodic) (((isPeriodic) << 1) | (dir))
#define IS_PROPELLER_DIR_LEFT(kind)                                                     \
    (((kind) == SKYCAN_PROPELLER_KIND(PROP_DIR_LEFT, FALSE))                            \
     || ((kind) == SKYCAN_PROPELLER_KIND(PROP_DIR_LEFT, TRUE)))

#define IS_PROPELLER_PERIODIC(kind)                                                     \
    (((kind) == SKYCAN_PROPELLER_KIND(PROP_DIR_LEFT, TRUE))                             \
     || ((kind) == SKYCAN_PROPELLER_KIND(PROP_DIR_RIGHT, TRUE)))

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

#if 001
// https://decomp.me/scratch/H0A8X
void sub_807D468(Sprite_SmallPropeller *prop)
{
    s32 temp;
    s32 r3;
    if (IS_PROPELLER_DIR_LEFT(prop->kind)) {
        r3 = Q_24_8(prop->posX + prop->unk4C) - gPlayer.x;
    } else {
        r3 = gPlayer.x - Q_24_8(prop->posX + prop->unk48);
    }

    temp = (Q_24_8(prop->unk50) - r3) / prop->unk50;

    {
        register s32 another asm("r3") = temp;
        if (another >= 0) {
            if (another > Q_24_8(1.0))
                temp = Q_24_8(1.0);
        } else {
            temp = Q_24_8(0.0);
        }
        prop->unk54 = temp << 4;
    }

    prop->unk54 = Q_24_8_TO_INT(prop->unk54 * prop->unk52);

    if (IS_PROPELLER_DIR_LEFT(prop->kind)) {
        // _0807D4FA
        if (gPlayer.speedAirX < 0) {
            gPlayer.speedGroundX = ClampGroundSpeed(gPlayer.speedGroundX - Q_24_8(0.25));
            gPlayer.speedAirX = ClampGroundSpeed(gPlayer.speedAirX - Q_24_8(0.25));
        } else {
            // _0807D516
            s32 newPlayerX = gPlayer.x - prop->unk54;
            s32 someX;
            gPlayer.x = newPlayerX;

            someX = Q_24_8(prop->posX + prop->unk4C) - Q_24_8(48);

            if ((prop->kind != SKYCAN_PROPELLER_KIND(PROP_DIR_LEFT, TRUE))
                && newPlayerX > someX) {
                gPlayer.x = someX;
            }

            if (gPlayer.unk5E & 0x20) {
                gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                gPlayer.speedGroundX = -gPlayer.speedGroundX;
            }
        }
    } else {
        // _0807D558
        if (gPlayer.speedAirX > 0) {
            gPlayer.speedGroundX = ClampGroundSpeed(gPlayer.speedGroundX + Q_24_8(0.25));
            gPlayer.speedAirX = ClampGroundSpeed(gPlayer.speedAirX + Q_24_8(0.25));
        } else {
            // _0807D57E
            s32 newPlayerX = gPlayer.x + prop->unk54;
            s32 someX;
            gPlayer.x = newPlayerX;

            someX = Q_24_8(prop->posX + prop->unk48) + Q_24_8(48);

            if ((prop->kind != SKYCAN_PROPELLER_KIND(PROP_DIR_RIGHT, TRUE))
                && newPlayerX < someX) {
                gPlayer.x = someX;
            }

            if (gPlayer.unk5E & 0x10) {
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.speedGroundX = -gPlayer.speedGroundX;
            }
        }
    }
}
#endif

void sub_807D5CC(Sprite_SmallPropeller *prop)
{
    Sprite *s = &prop->s;

    if (IS_PROPELLER_PERIODIC(prop->kind)) {
        u32 res = gUnknown_03005590 % 420;
        if (res < 60) {
            prop->unk52 = Q_24_8(0.0);
        } else if (res < 120) {
            u32 another;
            s32 temp;
            s16 res2;

            res -= 60;

            temp = (res << 8) / 60;
            prop->unk52 = temp;
            res2 = temp;

            if (res2 >= 0) {
                another = temp;
                if (res2 > Q_24_8(1.0))
                    another = Q_24_8(1.0);
            } else {
                another = Q_24_8(0.0);
            }

            prop->unk52 = another;
        } else if (res < 360) {
            prop->unk52 = Q_24_8(1.0);
        } else {
            s32 temp;
            s16 res2;

            res -= 360;

            temp = (res << 8) / 60;
            prop->unk52 = temp;
            res2 = temp;

            if ((s16)res2 >= 0) {
                if (res2 > Q_24_8(1.0))
                    temp = Q_24_8(1.0);
            } else {
                temp = Q_24_8(0.0);
            }

            prop->unk52 = Q_24_8(1.0) - temp;
        }

        s->unk22 = prop->unk52 >> 4;
        s->graphics.anim = SA2_ANIM_SMALL_PROPELLOR;
        s->variant = 2;

    } else {
        prop->unk52 = Q_24_8(1.0);
    }
}

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