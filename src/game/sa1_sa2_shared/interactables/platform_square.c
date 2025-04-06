#include "global.h"

#include "core.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "malloc_vram.h"

#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/interactables/platform_square.h"
#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/animations.h"
#include "constants/interactables.h"
#include "constants/player_transitions.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 timer;
    /* 0x40 */ s32 offsetX;
    /* 0x44 */ s32 offsetY;
    /* 0x48 */ s16 velocityX;
    /* 0x4A */ s16 velocityY;
    /* 0x4C */ s16 stoodOffset; // used in "Platform" but unused in this object.
    /* 0x50 */ s32 prevOffset[3][2];
} Sprite_PlatformSquare; /* size: 0x68 */

static void Task_Platform_Square(void);
static void TaskDestructor_Platform_Square(struct Task *);
static void Platform_Square_KillPlayer(void);
static void HandleSquarePlatformOffsetStorage(Sprite_PlatformSquare *);

static const u16 sAnimsPlatformSquare[9][3] = {
    { 36, SA2_ANIM_PLATFORM_SQUARE_COMMON, 0 }, { 36, SA2_ANIM_PLATFORM_SQUARE_COMMON, 0 },  { 36, SA2_ANIM_PLATFORM_SQUARE_MUS_PLA, 1 },
    { 36, SA2_ANIM_PLATFORM_ICE_PAR, 2 },       { 36, SA2_ANIM_PLATFORM_SQUARE_SKY_CAN, 0 }, { 36, SA2_ANIM_PLATFORM_TEC_BAS, 2 },
    { 36, SA2_ANIM_PLATFORM_SQUARE_COMMON, 0 }, { 36, SA2_ANIM_PLATFORM_SQUARE_COMMON, 0 },  { 36, SA2_ANIM_PLATFORM_SQUARE_COMMON, 0 },
};

void CreateEntity_Platform_Square(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Platform_Square, sizeof(Sprite_PlatformSquare), 0x2010, 0, TaskDestructor_Platform_Square);
    Sprite_PlatformSquare *platform = TASK_DATA(t);
    Sprite *s = &platform->s;

    platform->base.regionX = spriteRegionX;
    platform->base.regionY = spriteRegionY;
    platform->base.me = me;
    platform->base.spriteX = me->x;
    platform->base.id = spriteY;
    platform->offsetX = 0;
    platform->offsetY = 0;
    platform->stoodOffset = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            platform->velocityX = 0x4;
            platform->timer = 0;
            platform->velocityY = 0;
        } else {
            platform->velocityX = 0x4;
            platform->timer = 0x80;
            platform->velocityY = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            platform->velocityX = 0;
            platform->velocityY = 0x4;
            platform->timer = 0;
        } else {
            platform->velocityX = 0;
            platform->velocityY = 0x4;
            platform->timer = 0x80;
        }
    }

    {
        s32 i;
        s32 tileCount, anim, variant;

        for (i = 0; i < ARRAY_COUNT(platform->prevOffset); i++) {
            platform->prevOffset[i][0] = platform->offsetX;
            platform->prevOffset[i][1] = platform->offsetY;
        }

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        tileCount = sAnimsPlatformSquare[LEVEL_TO_ZONE(gCurrentLevel)][0];
        s->graphics.dest = VramMalloc(tileCount);

        anim = sAnimsPlatformSquare[LEVEL_TO_ZONE(gCurrentLevel)][1];
        s->graphics.anim = anim;

        variant = sAnimsPlatformSquare[LEVEL_TO_ZONE(gCurrentLevel)][2];
        s->variant = variant;

        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
        UpdateSpriteAnimation(s);
    }
}

static void Task_Platform_Square(void)
{
    Player *p = &gPlayer;
    s16 posX;
    s16 posY;
    MapEntity *me;
    u32 result;
    s32 deltaX = 0, deltaY = 0;

    Sprite_PlatformSquare *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    me = platform->base.me;

    if (IS_MULTI_PLAYER) {
        HandleSquarePlatformOffsetStorage(platform);
    }

    if (platform->velocityX != 0) {
        s32 oldUnk40 = platform->offsetX;
        s32 meUdata2 = (me->d.uData[2] << 11);

        platform->offsetX = (SIN((platform->velocityX * ((gStageTime + platform->timer) & 0xFF)) & ONE_CYCLE) * meUdata2) >> 14;
        deltaX = platform->offsetX - oldUnk40;
    }

    if (platform->velocityY != 0) {
#ifdef NON_MATCHING
        s32 r5 = platform->offsetY;
#else
        register s32 r5 asm("r5") = platform->offsetY;
#endif
        s32 meUdata3 = (me->d.uData[3] << 11);
        platform->offsetY = (SIN(((platform->velocityY * ((gStageTime + platform->timer) & 0xFF))) & ONE_CYCLE) * meUdata3) >> 14;
        r5 = platform->offsetY - r5;
#ifndef NON_MATCHING
        asm("" ::"r"(r5));
#endif
        deltaY = r5;
    }

    posX = TO_WORLD_POS(platform->base.spriteX, platform->base.regionX);
    posY = TO_WORLD_POS(me->y, platform->base.regionY);

    if (IS_MULTI_PLAYER) {
        s->x = posX - gCamera.x + I(platform->prevOffset[1][0]);
        s->y = posY - gCamera.y + I(platform->prevOffset[1][1]);
    } else {
        s->x = posX - gCamera.x + I(platform->offsetX);
        s->y = posY - gCamera.y + I(platform->offsetY);
    }

    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        s32 res, temp, temp2;
        p->qWorldX += deltaX;

        if (!GRAVITY_IS_INVERTED) {
            p->qWorldY += deltaY + Q(1.0);
        } else {
            p->qWorldY += deltaY - Q(2.0);
        }

        res = sub_801F100(I(gPlayer.qWorldY) + gPlayer.spriteOffsetY, I(gPlayer.qWorldX) + gPlayer.spriteOffsetX, gPlayer.layer, +8,
                          sub_801EC3C);
        if (res < 0) {
            gPlayer.qWorldY += Q(res);

            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
            p->stoodObj = NULL;
        }

        temp = I(p->qWorldX) + 2;
        res = sub_801F100(temp + p->spriteOffsetX, I(p->qWorldY), p->layer, +8, sub_801EB44);

        if (res < 0) {
            p->qWorldX += Q(res);
        }

        temp2 = I(p->qWorldX) - 2;
        res = sub_801F100(temp2 - p->spriteOffsetX, I(p->qWorldY), p->layer, -8, sub_801EB44);

        if (res < 0) {
            p->qWorldX -= Q(res);
        }

        res = sub_801F100(I(p->qWorldY) + p->spriteOffsetY, I(p->qWorldX) - p->spriteOffsetX, p->layer, +8, sub_801EC3C);

        if (res < 0) {
            p->qWorldY += Q(res);

            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
            p->stoodObj = NULL;
        }
    }

    if (!(p->moveState & MOVESTATE_IA_OVERRIDE)) {
        s32 x, y;
        s32 res;
        u32 otherRes;
        s32 movStateCopy = p->moveState;

        s->hitboxes[0].top -= 3;
        x = (posX + I(platform->offsetX));
        y = (posY + I(platform->offsetY));
        result = Player_PlatformCollision(s, x, y, p);

        if (result & 0x30000) {
            if (gPlayer.character == CHARACTER_KNUCKLES && gPlayer.charState > 99 && gPlayer.charState <= 105) {
                p->transition = PLTRANS_PT4;
            }

            p->qWorldY += Q_8_8(result);

            if (result & 0x20000) {
                if (p->qSpeedAirY <= 0)
                    p->qSpeedAirY = 0;

                if (GRAVITY_IS_INVERTED) {
                    p->moveState |= MOVESTATE_STOOD_ON_OBJ;
                    p->moveState &= ~MOVESTATE_IN_AIR;
                    p->stoodObj = s;
                    p->qSpeedAirY = 0;
                }

                res = sub_801F100(I(p->qWorldY) + p->spriteOffsetY, I(p->qWorldX), p->layer, 8, sub_801EC3C);

                if ((res < 0) && (deltaY > 0)) {
                    Platform_Square_KillPlayer();
                }
            }

            if (result & 0x10000) {
                if (GRAVITY_IS_INVERTED) {
                    p->qWorldY -= Q_8_8(result);
                    s->hitboxes[0].left += 16;
                    s->hitboxes[0].right -= 16;

                    otherRes = Player_PlatformCollision(s, posX + I(platform->offsetX), posY + I(platform->offsetY), p);

                    s->hitboxes[0].left -= 16;
                    s->hitboxes[0].right += 16;

                    p->qWorldY += Q_8_8(result);
                    p->moveState = movStateCopy;

                    if (otherRes & 0xC0000) {
                        s32 tempXX = (s16)(otherRes & 0xFF00);
                        s16 value = tempXX;
                        if (value < 0) {
                            p->qWorldX += -Q(16.0) + value;
                        }

                        if (value > 0) {
                            p->qWorldX += +Q(16.0) + value;
                        }

                        p->qSpeedAirX = 0;
                        p->qSpeedGround = 0;
                    }

                    if (otherRes & 0x10000) {
                        s32 newRes = sub_801F100(I(p->qWorldY) - p->spriteOffsetY, I(p->qWorldX), p->layer, -8, sub_801EC3C);

                        if (newRes < 0) {
                            if (deltaY < 0) {
                                Platform_Square_KillPlayer();
                            } else {
                                p->qWorldY -= Q_8_8(result);
                                p->qSpeedGround = 0;
                            }
                        } else {
                            p->qWorldY -= Q_8_8(result);
                            p->qSpeedGround = 0;
                            p->qSpeedAirX = 0;
                            p->qSpeedAirY = 0;
                        }
                    } else {
                        p->qWorldY -= Q_8_8(result);
                    }
                } else {
                    s32 newRes;
                    p->qSpeedAirY = 0;
                    newRes = sub_801F100(I(p->qWorldY) - p->spriteOffsetY, I(p->qWorldX), p->layer, -8, sub_801EC3C);

                    if ((newRes < 0) && (deltaY < 0)) {
                        Platform_Square_KillPlayer();
                    }
                }
            }
        }

        if ((result & 0xC0000) && !(p->moveState & MOVESTATE_STOOD_ON_OBJ) && !(p->stoodObj == s)) {
            s32 tempXX = (s16)(result & 0xFF00);
            s16 tempX = tempXX;
            p->qWorldX += tempX;
            p->qSpeedAirX = 0;
            p->qSpeedGround = 0;

            if (result & 0x40000) {
                s32 tempXVal = I(p->qWorldX) + 2;
                if (sub_801F100(tempXVal + p->spriteOffsetX, I(p->qWorldY), p->layer, -8, sub_801EB44) < 0) {
                    Platform_Square_KillPlayer();
                }
            }

            if (result & 0x80000) {
                s32 tempXVal = I(p->qWorldX) - 2;
                if (sub_801F100(tempXVal - p->spriteOffsetX, I(p->qWorldY), p->layer, +8, sub_801EB44) < 0) {
                    Platform_Square_KillPlayer();
                }
            }
        }

        s->hitboxes[0].top += 3;
    }

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, posX - gCamera.x, posY - gCamera.y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.spriteX);
        TaskDestroy(gCurTask);
    } else {
        DisplaySprite(s);
    }
}

static void TaskDestructor_Platform_Square(struct Task *t)
{
    Sprite_PlatformSquare *platform = TASK_DATA(t);
    VramFree(platform->s.graphics.dest);
}

static void Platform_Square_KillPlayer(void)
{
    gPlayer.qSpeedGround = 0;
    gPlayer.qSpeedAirX = 0;
    gPlayer.moveState |= MOVESTATE_DEAD;
}

static void HandleSquarePlatformOffsetStorage(Sprite_PlatformSquare *platform)
{
    platform->prevOffset[2][0] = platform->prevOffset[1][0];
    platform->prevOffset[2][1] = platform->prevOffset[1][1];
    platform->prevOffset[1][0] = platform->prevOffset[0][0];
    platform->prevOffset[1][1] = platform->prevOffset[0][1];
    platform->prevOffset[0][0] = platform->offsetX;
    platform->prevOffset[0][1] = platform->offsetY;
}

static u32 UNUSED HandleSquarePlatformCollision(Sprite *s, s32 x, s32 y, Player *p)
{
    u32 result;

    s->hitboxes[0].top++;
    s->hitboxes[0].bottom--;

    result = Player_PlatformCollision(s, x, y, p);

    s->hitboxes[0].top--;
    s->hitboxes[0].bottom++;

    return result;
}