#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/sky_canyon/small_windmill.h"
#include "lib/m4a.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    u8 type;
    u8 initialTouchAngle;
    u8 rotationTarget;
    u8 rotation;
    s32 x;
    s32 y;
} Sprite_SmallWindmill;

#define WINDMILL_DIAMETER    32
#define WINDMILL_NUM_TILES   32
#define PLAYER_SPIN_DIAMETER 24
#define ROTATE_SPEED         8

static void Task_Interactable_SkyCanyon_SmallSpinnyWindmill(void);
static void TaskDestructor_Interactable_SkyCanyon_SmallSpinnyWindmill(struct Task *);
static void SlowWindmillToStop(void);
static void Task_RotateSequence(void);
static bool32 ShouldDespawn(Sprite_SmallWindmill *);
static void RenderWindmill(Sprite_SmallWindmill *);
static void Despawn(Sprite_SmallWindmill *);
static void ResetWindmill(Sprite_SmallWindmill *);

void initSprite_Interactable_SkyCanyon_SmallSpinnyWindmill(MapEntity *me,
                                                           u16 spriteRegionX,
                                                           u16 spriteRegionY, u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_Interactable_SkyCanyon_SmallSpinnyWindmill, 0x48, 0x2010, 0,
                     TaskDestructor_Interactable_SkyCanyon_SmallSpinnyWindmill);
    Sprite_SmallWindmill *windmill = TaskGetStructPtr(t);
    Sprite *sprite;
    windmill->type = me->d.uData[0];

    windmill->x = TO_WORLD_POS(me->x, spriteRegionX);
    windmill->y = TO_WORLD_POS(me->y, spriteRegionY);

    windmill->base.regionX = spriteRegionX;
    windmill->base.regionY = spriteRegionY;
    windmill->base.me = me;
    windmill->base.spriteX = me->x;
    windmill->base.spriteY = spriteY;

    sprite = &windmill->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 16;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = VramMalloc(WINDMILL_NUM_TILES);
    sprite->graphics.anim = SA2_ANIM_CROSS_SKY_CAN;
    sprite->variant = 2;
    sub_8004558(sprite);

    SET_MAP_ENTITY_INITIALIZED(me);
}

static void StartSpinSequence(Sprite_SmallWindmill *windmill)
{
    Sprite *sprite = &windmill->sprite;
    s8 spriteX;
    Player_SetMovestate_IsInScriptedSequence();
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 4;
    m4aSongNumStart(SE_SPIN_ATTACK);
    switch (windmill->initialTouchAngle) {
        case 1:
        case 2:
            windmill->rotationTarget = 160;
            break;
        case 3:
        case 4:
            windmill->rotationTarget = 224;
            break;
        case 5:
        case 6:
            windmill->rotationTarget = 96;
            break;
        case 7:
        case 8:
            windmill->rotationTarget = 32;
            break;
    }

    windmill->rotation = windmill->rotationTarget;
    gPlayer.x = COS_24_8(windmill->rotationTarget * 4) * PLAYER_SPIN_DIAMETER
        + Q_24_8(windmill->x);
    gPlayer.y = SIN_24_8(windmill->rotationTarget * 4) * PLAYER_SPIN_DIAMETER
        + Q_24_8(windmill->y);

    switch (windmill->initialTouchAngle) {
        case 1:
        case 3:
        case 5:
        case 7:
            sprite->graphics.anim = SA2_ANIM_CROSS_SKY_CAN;
            sprite->variant = 0;
            break;
        case 2:
        case 4:
        case 6:
        case 8:
            sprite->graphics.anim = SA2_ANIM_CROSS_SKY_CAN;
            sprite->variant = 1;
            break;
    }
    sprite->unk22 = 32;

    sub_8004558(&windmill->sprite);
    gCurTask->main = Task_RotateSequence;
}

static void HandleRotationComplete(Sprite_SmallWindmill *windmill)
{
    Player_ClearMovestate_IsInScriptedSequence();

    if (PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        gPlayer.unk6D = 5;

        switch (windmill->initialTouchAngle) {
            case 2:
                gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                gPlayer.speedAirX = -Q_24_8(8);
                gPlayer.speedAirY = 0;
                break;
            case 1:
            case 4:
                gPlayer.speedAirX = 0;
                gPlayer.speedAirY = -Q_24_8(8);
                break;
            case 5:
                gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                gPlayer.speedAirX = -Q_24_8(8);
                gPlayer.speedAirY = 0;
                break;
            case 6:
            case 7:
                gPlayer.speedAirX = 0;
                gPlayer.speedAirY = Q_24_8(8);
                break;
            case 3:
            case 8:
                gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                gPlayer.speedAirX = Q_24_8(8);
                gPlayer.speedAirY = 0;
                break;
        }
    }
    windmill->rotation = 0;
    gCurTask->main = SlowWindmillToStop;
}

static bool32 RotateWindmill(Sprite_SmallWindmill *windmill)
{
    switch (windmill->initialTouchAngle) {
        case 1:
        case 3:
        case 5:
        case 7:
            windmill->rotation += ROTATE_SPEED;
            break;
        case 2:
        case 4:
        case 6:
        case 8:
            windmill->rotation -= ROTATE_SPEED;
            break;
    }

    if (PLAYER_IS_ALIVE) {
        gPlayer.x = COS_24_8(windmill->rotation * 4) * PLAYER_SPIN_DIAMETER
            + Q_24_8(windmill->x);
        gPlayer.y = SIN_24_8(windmill->rotation * 4) * PLAYER_SPIN_DIAMETER
            + Q_24_8(windmill->y);
    }

    return windmill->rotation == windmill->rotationTarget;
}

static u32 GetPlayerTouchingAngle(Sprite_SmallWindmill *windmill)
{
    if (PLAYER_IS_ALIVE) {
        s16 x = windmill->x - gCamera.x;
        s16 y = windmill->y - gCamera.y;
        s16 playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        s16 playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        s16 dX = (x - playerX);
        s16 dY = (y - playerY);

        if (dX * dX + dY * dY <= (WINDMILL_DIAMETER * WINDMILL_DIAMETER)) {
            if (playerX <= x) {
                if (playerY <= y) {
                    if (windmill->type & 1) {
                        if (abs(gPlayer.speedAirX) <= abs(gPlayer.speedAirY)) {
                            return 2;
                        } else {
                            return 1;
                        }
                    }
                } else {
                    if (windmill->type & 4) {
                        if (abs(gPlayer.speedAirX) <= abs(gPlayer.speedAirY)) {
                            return 5;
                        } else {
                            return 6;
                        }
                    }
                }
            } else {
                if (playerY <= y) {
                    if (windmill->type & 2) {
                        if (abs(gPlayer.speedAirX) <= abs(gPlayer.speedAirY)) {
                            return 3;
                        } else {
                            return 4;
                        }
                    }
                } else {
                    if (windmill->type & 8) {
                        if (abs(gPlayer.speedAirX) <= abs(gPlayer.speedAirY)) {
                            return 8;
                        } else {
                            return 7;
                        }
                    }
                }
            }
        }
    }

    return 0;
}

static void Task_Interactable_SkyCanyon_SmallSpinnyWindmill(void)
{
    Sprite_SmallWindmill *windmill = TaskGetStructPtr(gCurTask);

    windmill->initialTouchAngle = GetPlayerTouchingAngle(windmill);
    if (windmill->initialTouchAngle != 0) {
        StartSpinSequence(windmill);
    }

    if (ShouldDespawn(windmill)) {
        Despawn(windmill);
        return;
    }

    RenderWindmill(windmill);
}

static void Task_RotateSequence(void)
{
    Sprite_SmallWindmill *windmill = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &windmill->sprite;
    bool32 finished = RotateWindmill(windmill);
    if (finished) {
        HandleRotationComplete(windmill);
    }

    if (sprite->unk10 & 0x4000) {
        sprite->unk10 &= ~0x4000;
        sprite->unk1E = -1;
        sprite->unk21 = -1;
    }
    RenderWindmill(windmill);
}

static void SlowWindmillToStop(void)
{
    Sprite_SmallWindmill *windmill = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &windmill->sprite;

    if (sprite->unk10 & 0x4000) {
        sprite->unk10 &= ~0x4000;
        sprite->unk1E = -1;
        sprite->unk21 = -1;

        sprite->unk22 -= 8;
        if (sprite->unk22 == 0) {
            ResetWindmill(windmill);
        }
    }
    RenderWindmill(windmill);
}

static void TaskDestructor_Interactable_SkyCanyon_SmallSpinnyWindmill(struct Task *t)
{
    Sprite_SmallWindmill *windmill = TaskGetStructPtr(t);
    VramFree(windmill->sprite.graphics.dest);
}

static void ResetWindmill(Sprite_SmallWindmill *windmill)
{
    Sprite *sprite = &windmill->sprite;
    sprite->graphics.anim = SA2_ANIM_CROSS_SKY_CAN;
    sprite->variant = 2;
    sprite->unk22 = 16;
    sub_8004558(sprite);
    gCurTask->main = Task_Interactable_SkyCanyon_SmallSpinnyWindmill;
}

static void RenderWindmill(Sprite_SmallWindmill *windmill)
{
    Sprite *sprite = &windmill->sprite;
    sub_8004558(sprite);
    sprite->x = windmill->x - gCamera.x;
    sprite->y = windmill->y - gCamera.y;
    sprite->unk10 &= ~0xC00;
    sub_80051E8(sprite);
    sprite->unk10 |= 0xC00;
    sub_80051E8(sprite);
}

static bool32 ShouldDespawn(Sprite_SmallWindmill *windmill)
{
    s16 x = windmill->x - gCamera.x;
    s16 y = windmill->y - gCamera.y;
    if (x < -160 || x > 400 || (y + 0x20) < -128 || (y - 0x20) > 288) {
        return TRUE;
    }

    return FALSE;
}

static void Despawn(Sprite_SmallWindmill *windmill)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(windmill->base.me, windmill->base.spriteX);
    TaskDestroy(gCurTask);
}
