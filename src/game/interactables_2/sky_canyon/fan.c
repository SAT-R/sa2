#include "global.h"
#include "gba/types.h"

#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "malloc_vram.h"

#include "constants/animations.h"
#include "constants/zones.h"

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
} Sprite_Fan; /* size: 0x58 */

// Durations for each of the "stages" of the propellers with periodic fan speed

#define PERIOD_END__OFF             (ZONE_TIME_TO_INT(0, 1)) /* 1s */
#define PERIOD_END__ACCEL           (PERIOD_END__OFF + ZONE_TIME_TO_INT(0, 1)) /* 1s */
#define PERIOD_END__MAX_SPEED       (PERIOD_END__ACCEL + ZONE_TIME_TO_INT(0, 4)) /* 4s */
#define PERIOD_END__DECEL           (PERIOD_END__MAX_SPEED + ZONE_TIME_TO_INT(0, 1)) /* 1s */
#define PERIODIC_PROP_FULL_DURATION (PERIOD_END__DECEL) /* 7s */

// Used to clamp the player's max speed
#define PROP_PLAYER_CLAMP_SPEED       Q(9.0)
#define PROP_PLAYER_CLAMP_SPEED_BOOST Q(15.0)

// The min/max fan prop->fanSpeed values.
#define PROP_SPEED_MIN Q(0.0)
#define PROP_SPEED_MAX Q(1.0)

#define FAN_DIR_LEFT                     0
#define FAN_DIR_RIGHT                    1
#define FAN_MASK_PERIODIC                2
#define SKYCAN_FAN_KIND(dir, isPeriodic) (((isPeriodic) << 1) | (dir))
#define IS_PROPELLER_DIR_LEFT(kind)      (((kind) == SKYCAN_FAN_KIND(FAN_DIR_LEFT, FALSE)) || ((kind) == SKYCAN_FAN_KIND(FAN_DIR_LEFT, TRUE)))

#define IS_FAN_PERIODIC(kind) (((kind) == SKYCAN_FAN_KIND(FAN_DIR_LEFT, TRUE)) || ((kind) == SKYCAN_FAN_KIND(FAN_DIR_RIGHT, TRUE)))

static void Task_IA_Fan_UpdateRegular(void);
static void TaskDestructor_IA_Fan_UpdateRegular(struct Task *);

static void SetTaskMain_807D978(Sprite_Fan *unused);
static void sub_807D468(Sprite_Fan *);
static void UpdateFanSpeed(Sprite_Fan *);
static void UpdateFanSpritePosition(Sprite_Fan *);
static bool32 IsPlayerInFanRegion(Sprite_Fan *);
static s16 ClampPlayerSpeed(s16);
static bool32 IsPropellerOffScreen(Sprite_Fan *);

void Task_IA_SmallPropeller_UpdateInFanRegion(void);
void SetTaskMain_UpdateRegular(Sprite_Fan *unused);
void DestroyTask_Interactable087(Sprite_Fan *);

static void CreateEntity_Fan(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY, u32 kind)
{
    struct Task *t = TaskCreate(Task_IA_Fan_UpdateRegular, sizeof(Sprite_Fan), 0x2010, 0, TaskDestructor_IA_Fan_UpdateRegular);
    Sprite_Fan *prop = TASK_DATA(t);
    Sprite *s;

    prop->kind = kind;
    prop->fanSpeed = Q(1.0);
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
    prop->base.meX = me->x;
    prop->base.id = spriteY;

    s = &prop->s;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;

    s->frameFlags = 0x2000;
    s->graphics.dest = VramMalloc(12);
    s->graphics.anim = SA2_ANIM_FAN;
    s->variant = 2;

    if (IS_PROPELLER_DIR_LEFT(kind)) {
        s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
    }

    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807D468(Sprite_Fan *prop)
{
    s32 temp;
    s32 r3;
    if (IS_PROPELLER_DIR_LEFT(prop->kind)) {
        r3 = Q(prop->posX + prop->right) - gPlayer.qWorldX;
    } else {
        r3 = gPlayer.qWorldX - Q(prop->posX + prop->left);
    }

    r3 = (Q(prop->width) - r3) / prop->width;

    if (r3 >= 0) {
        temp = r3;
        if (r3 > Q(1.0))
            temp = Q(1.0);
    } else {
        temp = Q(0.0);
    }
    prop->playerDeltaX = temp << 4;
    prop->playerDeltaX = I(prop->playerDeltaX * prop->fanSpeed);

    if (IS_PROPELLER_DIR_LEFT(prop->kind)) {
        if (gPlayer.qSpeedAirX < 0) {
            gPlayer.qSpeedGround = ClampPlayerSpeed(gPlayer.qSpeedGround - Q(0.25));
            gPlayer.qSpeedAirX = ClampPlayerSpeed(gPlayer.qSpeedAirX - Q(0.25));
        } else {
            s32 newPlayerX = gPlayer.qWorldX - prop->playerDeltaX;
            gPlayer.qWorldX = newPlayerX;

            r3 = Q(prop->posX + prop->right) - Q(48);

            if ((prop->kind != SKYCAN_FAN_KIND(FAN_DIR_LEFT, TRUE)) && newPlayerX > r3) {
                gPlayer.qWorldX = r3;
            }

            if (gPlayer.frameInput & 0x20) {
                gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
            }
        }
    } else {
        if (gPlayer.qSpeedAirX > 0) {
            gPlayer.qSpeedGround = ClampPlayerSpeed(gPlayer.qSpeedGround + Q(0.25));
            gPlayer.qSpeedAirX = ClampPlayerSpeed(gPlayer.qSpeedAirX + Q(0.25));
        } else {
            s32 newPlayerX = gPlayer.qWorldX + prop->playerDeltaX;
            gPlayer.qWorldX = newPlayerX;

            r3 = Q(prop->posX + prop->left) + Q(48);

            if ((prop->kind != SKYCAN_FAN_KIND(FAN_DIR_RIGHT, TRUE)) && newPlayerX < r3) {
                gPlayer.qWorldX = r3;
            }

            if (gPlayer.frameInput & 0x10) {
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.qSpeedGround = -gPlayer.qSpeedGround;
            }
        }
    }
}

static void UpdateFanSpeed(Sprite_Fan *prop)
{
    Sprite *s = &prop->s;

    if (IS_FAN_PERIODIC(prop->kind)) {
        u32 fanSpeed = gStageTime % PERIODIC_PROP_FULL_DURATION;
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
        s->graphics.anim = SA2_ANIM_FAN;
        s->variant = 2;

    } else {
        prop->fanSpeed = PROP_SPEED_MAX;
    }
}

static void UpdateFanSpritePosition(Sprite_Fan *prop)
{
    Sprite *s = &prop->s;

    if (IS_PROPELLER_DIR_LEFT(prop->kind)) {
        s->x = prop->posX + prop->right - gCamera.x;
    } else {
        s->x = prop->posX + prop->left - gCamera.x;
    }

    s->y = prop->posY + prop->bottom - gCamera.y;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static bool32 IsPlayerInFanRegion(Sprite_Fan *prop)
{
    if (PLAYER_IS_ALIVE) {
        s16 propX = prop->posX - gCamera.x;
        s16 propY = prop->posY - gCamera.y;

        s16 playerX = I(gPlayer.qWorldX) - gCamera.x;
        s16 playerY = I(gPlayer.qWorldY) - gCamera.y;

        u16 width = prop->right - prop->left;
        u16 height = prop->bottom - prop->top;

        if (((propX + prop->left) <= playerX) && ((propX + prop->left + width) >= playerX) && ((propY + prop->top) <= playerY)
            && ((propY + prop->top + height) >= playerY))
            return TRUE;
    }

    return FALSE;
}

static void Task_IA_Fan_UpdateRegular(void)
{
    Sprite_Fan *prop = TASK_DATA(gCurTask);

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

static void TaskDestructor_IA_Fan_UpdateRegular(struct Task *t)
{
    Sprite_Fan *prop = TASK_DATA(t);
    VramFree(prop->s.graphics.dest);
}

static void SetTaskMain_807D978(Sprite_Fan *unused) { gCurTask->main = Task_IA_SmallPropeller_UpdateInFanRegion; }

static s16 ClampPlayerSpeed(s16 speed)
{
    if (gPlayer.isBoosting) {
        CLAMP_INLINE2(speed, -PROP_PLAYER_CLAMP_SPEED_BOOST, PROP_PLAYER_CLAMP_SPEED_BOOST);
    } else {
        // @BUG: Seems like a copy-paste error?
#ifdef BUG_FIX
        CLAMP_INLINE2(speed, -PROP_PLAYER_CLAMP_SPEED, +PROP_PLAYER_CLAMP_SPEED);
#else
        CLAMP_INLINE2(speed, -PROP_PLAYER_CLAMP_SPEED_BOOST, +PROP_PLAYER_CLAMP_SPEED);
#endif
    }

    return speed;
}

static bool32 IsPropellerOffScreen(Sprite_Fan *prop)
{
    s16 posX, posY;

    posX = prop->posX - gCamera.x;
    posY = prop->posY - gCamera.y;

    if (((posX + prop->right) < -128) || ((posX + prop->left) > DISPLAY_WIDTH + 128) || ((posY + prop->bottom) < -128)
        || ((posY + prop->top) > DISPLAY_HEIGHT + 128))
        return TRUE;

    return FALSE;
}

void DestroyTask_Interactable087(Sprite_Fan *prop)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(prop->base.me, prop->base.meX);
    TaskDestroy(gCurTask);
}

void CreateEntity_Fan_Left(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Fan(me, spriteRegionX, spriteRegionY, spriteY, SKYCAN_FAN_KIND(FAN_DIR_LEFT, FALSE));
}

void CreateEntity_Fan_Right(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Fan(me, spriteRegionX, spriteRegionY, spriteY, SKYCAN_FAN_KIND(FAN_DIR_RIGHT, FALSE));
}

void CreateEntity_Fan_Left_Periodic(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Fan(me, spriteRegionX, spriteRegionY, spriteY, SKYCAN_FAN_KIND(FAN_DIR_LEFT, TRUE));
}

void CreateEntity_Fan_Right_Periodic(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Fan(me, spriteRegionX, spriteRegionY, spriteY, SKYCAN_FAN_KIND(FAN_DIR_RIGHT, TRUE));
}

void Task_IA_SmallPropeller_UpdateInFanRegion(void)
{
    Sprite_Fan *prop = TASK_DATA(gCurTask);

    sub_807D468(prop);

    if (!IsPlayerInFanRegion(prop)) {
        SetTaskMain_UpdateRegular(prop);
    }

    UpdateFanSpeed(prop);
    UpdateFanSpritePosition(prop);
}

void SetTaskMain_UpdateRegular(Sprite_Fan *unused) { gCurTask->main = Task_IA_Fan_UpdateRegular; }