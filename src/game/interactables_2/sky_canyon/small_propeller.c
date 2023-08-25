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
    /* 0x48 */ s16 left;
    /* 0x4A */ s16 top;
    /* 0x4C */ s16 right;
    /* 0x4E */ s16 bottom;
    /* 0x50 */ u16 width;
    /* 0x52 */ s16 fanSpeed;
    /* 0x54 */ s16 playerDeltaX;
} Sprite_SmallPropeller; /* size: 0x58 */

// Durations for each of the "stages" of the propellers with periodic fan speed

#define PERIOD_END__OFF             (ZONE_TIME_TO_INT(0, 1)) /* 1s */
#define PERIOD_END__ACCEL           (PERIOD_END__OFF + ZONE_TIME_TO_INT(0, 1)) /* 1s */
#define PERIOD_END__MAX_SPEED       (PERIOD_END__ACCEL + ZONE_TIME_TO_INT(0, 4)) /* 4s */
#define PERIOD_END__DECEL           (PERIOD_END__MAX_SPEED + ZONE_TIME_TO_INT(0, 1)) /* 1s */
#define PERIODIC_PROP_FULL_DURATION (PERIOD_END__DECEL) /* 7s */

// Used to clamp the player's max speed
#define PROP_PLAYER_CLAMP_SPEED       Q_24_8(9.0)
#define PROP_PLAYER_CLAMP_SPEED_BOOST Q_24_8(15.0)

// The min/max fan prop->fanSpeed values.
#define PROP_SPEED_MIN Q_24_8(0.0)
#define PROP_SPEED_MAX Q_24_8(1.0)

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

static void Task_IA_SmallPropeller_UpdateRegular(void);
static void TaskDestructor_IA_SmallPropeller_UpdateRegular(struct Task *);

static void SetTaskMain_807D978(Sprite_SmallPropeller *unused);
static void sub_807D468(Sprite_SmallPropeller *);
static void UpdateFanSpeed(Sprite_SmallPropeller *);
static void UpdateFanSpritePosition(Sprite_SmallPropeller *);
static bool32 IsPlayerInFanRegion(Sprite_SmallPropeller *);
static s16 ClampPlayerSpeed(s16);
static bool32 IsPropellerOffScreen(Sprite_SmallPropeller *);

void Task_IA_SmallPropeller_UpdateInFanRegion(void);
void SetTaskMain_UpdateRegular(Sprite_SmallPropeller *unused);
void DestroyTask_Interactable087(Sprite_SmallPropeller *);

static void CreateEntity_SmallPropeller(MapEntity *me, u16 spriteRegionX,
                                        u16 spriteRegionY, u8 spriteY, u32 kind)
{
    struct Task *t
        = TaskCreate(Task_IA_SmallPropeller_UpdateRegular, sizeof(Sprite_SmallPropeller),
                     0x2010, 0, TaskDestructor_IA_SmallPropeller_UpdateRegular);
    Sprite_SmallPropeller *prop = TaskGetStructPtr(t);
    Sprite *s;

    prop->kind = kind;
    prop->fanSpeed = Q_24_8(1.0);
    prop->posX = TO_WORLD_POS(me->x, spriteRegionX);
    prop->posY = TO_WORLD_POS(me->y, spriteRegionY);
    prop->left = me->d.sData[0] * TILE_WIDTH;
    prop->top = me->d.sData[1] * TILE_WIDTH;
    prop->right = me->d.uData[2] * TILE_WIDTH + prop->left;
    prop->bottom = me->d.uData[3] * TILE_WIDTH + prop->top;
    prop->width = prop->right - prop->left;

    prop->base.regionX = spriteRegionX;
    prop->base.regionY = spriteRegionY;
    prop->base.me = me;
    prop->base.spriteX = me->x;
    prop->base.spriteY = spriteY;

    s = &prop->s;
    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;

    s->unk10 = 0x2000;
    s->graphics.dest = VramMalloc(12);
    s->graphics.anim = SA2_ANIM_SMALL_PROPELLOR;
    s->variant = 2;

    if (IS_PROPELLER_DIR_LEFT(kind)) {
        s->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
    }

    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807D468(Sprite_SmallPropeller *prop)
{
    s32 temp;
    s32 r3;
    if (IS_PROPELLER_DIR_LEFT(prop->kind)) {
        r3 = Q_24_8(prop->posX + prop->right) - gPlayer.x;
    } else {
        r3 = gPlayer.x - Q_24_8(prop->posX + prop->left);
    }

    r3 = (Q_24_8(prop->width) - r3) / prop->width;

    if (r3 >= 0) {
        temp = r3;
        if (r3 > Q_24_8(1.0))
            temp = Q_24_8(1.0);
    } else {
        temp = Q_24_8(0.0);
    }
    prop->playerDeltaX = temp << 4;
    prop->playerDeltaX = Q_24_8_TO_INT(prop->playerDeltaX * prop->fanSpeed);

    if (IS_PROPELLER_DIR_LEFT(prop->kind)) {
        if (gPlayer.speedAirX < 0) {
            gPlayer.speedGroundX = ClampPlayerSpeed(gPlayer.speedGroundX - Q_24_8(0.25));
            gPlayer.speedAirX = ClampPlayerSpeed(gPlayer.speedAirX - Q_24_8(0.25));
        } else {
            s32 newPlayerX = gPlayer.x - prop->playerDeltaX;
            gPlayer.x = newPlayerX;

            r3 = Q_24_8(prop->posX + prop->right) - Q_24_8(48);

            if ((prop->kind != SKYCAN_PROPELLER_KIND(PROP_DIR_LEFT, TRUE))
                && newPlayerX > r3) {
                gPlayer.x = r3;
            }

            if (gPlayer.unk5E & 0x20) {
                gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                gPlayer.speedGroundX = -gPlayer.speedGroundX;
            }
        }
    } else {
        if (gPlayer.speedAirX > 0) {
            gPlayer.speedGroundX = ClampPlayerSpeed(gPlayer.speedGroundX + Q_24_8(0.25));
            gPlayer.speedAirX = ClampPlayerSpeed(gPlayer.speedAirX + Q_24_8(0.25));
        } else {
            s32 newPlayerX = gPlayer.x + prop->playerDeltaX;
            gPlayer.x = newPlayerX;

            r3 = Q_24_8(prop->posX + prop->left) + Q_24_8(48);

            if ((prop->kind != SKYCAN_PROPELLER_KIND(PROP_DIR_RIGHT, TRUE))
                && newPlayerX < r3) {
                gPlayer.x = r3;
            }

            if (gPlayer.unk5E & 0x10) {
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.speedGroundX = -gPlayer.speedGroundX;
            }
        }
    }
}

static void UpdateFanSpeed(Sprite_SmallPropeller *prop)
{
    Sprite *s = &prop->s;

    if (IS_PROPELLER_PERIODIC(prop->kind)) {
        u32 fanSpeed = gUnknown_03005590 % PERIODIC_PROP_FULL_DURATION;
        if (fanSpeed < PERIOD_END__OFF) {
            prop->fanSpeed = PROP_SPEED_MIN;
        } else if (fanSpeed < PERIOD_END__ACCEL) {
            u32 another;
            s32 temp;
            s16 res2;

            fanSpeed -= PERIOD_END__OFF;

            temp = (fanSpeed << 8) / GBA_FRAMES_PER_SECOND;
            prop->fanSpeed = temp;
            res2 = temp;

            // @TODO: Variant of CLAMP_16?
            if (res2 >= PROP_SPEED_MIN) {
                another = temp;
                if (res2 > PROP_SPEED_MAX)
                    another = PROP_SPEED_MAX;
            } else {
                another = PROP_SPEED_MIN;
            }

            prop->fanSpeed = another;
        } else if (fanSpeed < PERIOD_END__MAX_SPEED) {
            prop->fanSpeed = PROP_SPEED_MAX;
        } else /* PERIOD_END__DECEL */ {
            s32 temp;
            s16 res2;

            fanSpeed -= PERIOD_END__MAX_SPEED;

            temp = (fanSpeed << 8) / GBA_FRAMES_PER_SECOND;
            prop->fanSpeed = temp;
            res2 = temp;

            if ((s16)res2 >= 0) {
                if (res2 > PROP_SPEED_MAX)
                    temp = PROP_SPEED_MAX;
            } else {
                temp = PROP_SPEED_MIN;
            }

            prop->fanSpeed = PROP_SPEED_MAX - temp;
        }

        s->animSpeed = prop->fanSpeed >> 4;
        s->graphics.anim = SA2_ANIM_SMALL_PROPELLOR;
        s->variant = 2;

    } else {
        prop->fanSpeed = PROP_SPEED_MAX;
    }
}

static void UpdateFanSpritePosition(Sprite_SmallPropeller *prop)
{
    Sprite *s = &prop->s;

    if (IS_PROPELLER_DIR_LEFT(prop->kind)) {
        s->x = prop->posX + prop->right - gCamera.x;
    } else {
        s->x = prop->posX + prop->left - gCamera.x;
    }

    s->y = prop->posY + prop->bottom - gCamera.y;

    sub_8004558(s);
    sub_80051E8(s);
}

static bool32 IsPlayerInFanRegion(Sprite_SmallPropeller *prop)
{
    if (PLAYER_IS_ALIVE) {
        s16 propX = prop->posX - gCamera.x;
        s16 propY = prop->posY - gCamera.y;

        s16 playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        s16 playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        u16 width = prop->right - prop->left;
        u16 height = prop->bottom - prop->top;

        if (((propX + prop->left) <= playerX)
            && ((propX + prop->left + width) >= playerX)
            && ((propY + prop->top) <= playerY)
            && ((propY + prop->top + height) >= playerY))
            return TRUE;
    }

    return FALSE;
}

static void Task_IA_SmallPropeller_UpdateRegular(void)
{
    Sprite_SmallPropeller *prop = TaskGetStructPtr(gCurTask);

    if (IsPlayerInFanRegion(prop)) {
        SetTaskMain_807D978(prop);
    }

    if (IsPropellerOffScreen(prop)) {
        DestroyTask_Interactable087(prop);
    } else {
        UpdateFanSpeed(prop);
        UpdateFanSpritePosition(prop);
    }
}

static void TaskDestructor_IA_SmallPropeller_UpdateRegular(struct Task *t)
{
    Sprite_SmallPropeller *prop = TaskGetStructPtr(t);
    VramFree(prop->s.graphics.dest);
}

static void SetTaskMain_807D978(Sprite_SmallPropeller *unused)
{
    gCurTask->main = Task_IA_SmallPropeller_UpdateInFanRegion;
}

static s16 ClampPlayerSpeed(s16 speed)
{
    if (gPlayer.unk5A) {
        CLAMP_INLINE2(speed, -PROP_PLAYER_CLAMP_SPEED_BOOST,
                      PROP_PLAYER_CLAMP_SPEED_BOOST);
    } else {
        // @BUG: Seems like a copy-paste error?
#ifdef BUGFIX
        CLAMP_INLINE2(speed, -PROP_PLAYER_CLAMP_SPEED, +PROP_PLAYER_CLAMP_SPEED);
#else
        CLAMP_INLINE2(speed, -PROP_PLAYER_CLAMP_SPEED_BOOST, +PROP_PLAYER_CLAMP_SPEED);
#endif
    }

    return speed;
}

static bool32 IsPropellerOffScreen(Sprite_SmallPropeller *prop)
{
    s16 posX, posY;

    posX = prop->posX - gCamera.x;
    posY = prop->posY - gCamera.y;

    if (((posX + prop->right) < -128) || ((posX + prop->left) > DISPLAY_WIDTH + 128)
        || ((posY + prop->bottom) < -128) || ((posY + prop->top) > DISPLAY_HEIGHT + 128))
        return TRUE;

    return FALSE;
}

void DestroyTask_Interactable087(Sprite_SmallPropeller *prop)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(prop->base.me, prop->base.spriteX);
    TaskDestroy(gCurTask);
}

void CreateEntity_SmallPropeller_Left(MapEntity *me, u16 spriteRegionX,
                                      u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_SmallPropeller(me, spriteRegionX, spriteRegionY, spriteY,
                                SKYCAN_PROPELLER_KIND(PROP_DIR_LEFT, FALSE));
}

void CreateEntity_SmallPropeller_Right(MapEntity *me, u16 spriteRegionX,
                                       u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_SmallPropeller(me, spriteRegionX, spriteRegionY, spriteY,
                                SKYCAN_PROPELLER_KIND(PROP_DIR_RIGHT, FALSE));
}

void CreateEntity_SmallPropeller_Left_Periodic(MapEntity *me, u16 spriteRegionX,
                                               u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_SmallPropeller(me, spriteRegionX, spriteRegionY, spriteY,
                                SKYCAN_PROPELLER_KIND(PROP_DIR_LEFT, TRUE));
}

void CreateEntity_SmallPropeller_Right_Periodic(MapEntity *me, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_SmallPropeller(me, spriteRegionX, spriteRegionY, spriteY,
                                SKYCAN_PROPELLER_KIND(PROP_DIR_RIGHT, TRUE));
}

void Task_IA_SmallPropeller_UpdateInFanRegion(void)
{
    Sprite_SmallPropeller *prop = TaskGetStructPtr(gCurTask);

    sub_807D468(prop);

    if (!IsPlayerInFanRegion(prop)) {
        SetTaskMain_UpdateRegular(prop);
    }

    UpdateFanSpeed(prop);
    UpdateFanSpritePosition(prop);
}

void SetTaskMain_UpdateRegular(Sprite_SmallPropeller *unused)
{
    gCurTask->main = Task_IA_SmallPropeller_UpdateRegular;
}