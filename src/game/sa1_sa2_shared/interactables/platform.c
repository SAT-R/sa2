#include "global.h"

#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "malloc_vram.h"

#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/interactables/platform.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"
#include "game/multiplayer/multiplayer_event_mgr.h"

#include "constants/animations.h"
#include "constants/interactables.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 timer;
    /* 0x40 */ s32 offsetX;
    /* 0x44 */ s32 offsetY;
    /* 0x48 */ s16 velocityX;
    /* 0x4A */ s16 velocityY;
    /* 0x4C */ u16 stoodOffset;
    /* 0x50 */ s32 prevOffsetY[2];
} Sprite_Platform; /* size: 0x58 */

static void Task_PlatformMain(void);
static void Task_FallingPlatformMain_Idle(void);
static void TaskDestructor_Platform(struct Task *);

void Task_FallingPlatformMain_FallDelay(void);
void Task_FallingPlatformMain_Falling(void);
void HandlePlatformOffsetYStorage(Sprite_Platform *);

const AnimId sPlatformLevelAnims[38] = {
    [LEVEL_INDEX(ZONE_1, ACT_1)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_1, ACT_2)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_1, ACT_BOSS)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_1, ACT_UNUSED)] = SA2_ANIM_PLATFORM_LEA_FOR,

    [LEVEL_INDEX(ZONE_2, ACT_1)] = SA2_ANIM_PLATFORM_HOT_CRA,
    [LEVEL_INDEX(ZONE_2, ACT_2)] = SA2_ANIM_PLATFORM_HOT_CRA,
    [LEVEL_INDEX(ZONE_2, ACT_BOSS)] = SA2_ANIM_PLATFORM_HOT_CRA,
    [LEVEL_INDEX(ZONE_2, ACT_UNUSED)] = SA2_ANIM_PLATFORM_HOT_CRA,

    [LEVEL_INDEX(ZONE_3, ACT_1)] = SA2_ANIM_PLATFORM_SQUARE_MUS_PLA,
    [LEVEL_INDEX(ZONE_3, ACT_2)] = SA2_ANIM_PLATFORM_SQUARE_MUS_PLA,
    [LEVEL_INDEX(ZONE_3, ACT_BOSS)] = SA2_ANIM_PLATFORM_SQUARE_MUS_PLA,
    [LEVEL_INDEX(ZONE_3, ACT_UNUSED)] = SA2_ANIM_PLATFORM_SQUARE_MUS_PLA,

    [LEVEL_INDEX(ZONE_4, ACT_1)] = SA2_ANIM_PLATFORM_ICE_PAR,
    [LEVEL_INDEX(ZONE_4, ACT_2)] = SA2_ANIM_PLATFORM_ICE_PAR,
    [LEVEL_INDEX(ZONE_4, ACT_BOSS)] = SA2_ANIM_PLATFORM_ICE_PAR,
    [LEVEL_INDEX(ZONE_4, ACT_UNUSED)] = SA2_ANIM_PLATFORM_ICE_PAR,

    [LEVEL_INDEX(ZONE_5, ACT_1)] = SA2_ANIM_PLATFORM_SKY_CAN_2,
    [LEVEL_INDEX(ZONE_5, ACT_2)] = SA2_ANIM_PLATFORM_SKY_CAN_2,
    [LEVEL_INDEX(ZONE_5, ACT_BOSS)] = SA2_ANIM_PLATFORM_SKY_CAN_2,
    [LEVEL_INDEX(ZONE_5, ACT_UNUSED)] = SA2_ANIM_PLATFORM_SKY_CAN_2,

    [LEVEL_INDEX(ZONE_6, ACT_1)] = SA2_ANIM_PLATFORM_TEC_BAS,
    [LEVEL_INDEX(ZONE_6, ACT_2)] = SA2_ANIM_PLATFORM_TEC_BAS,
    [LEVEL_INDEX(ZONE_6, ACT_BOSS)] = SA2_ANIM_PLATFORM_TEC_BAS,
    [LEVEL_INDEX(ZONE_6, ACT_UNUSED)] = SA2_ANIM_PLATFORM_TEC_BAS,

    [LEVEL_INDEX(ZONE_7, ACT_1)] = SA2_ANIM_PLATFORM_EGG_UTO,
    [LEVEL_INDEX(ZONE_7, ACT_2)] = SA2_ANIM_PLATFORM_EGG_UTO,
    [LEVEL_INDEX(ZONE_7, ACT_BOSS)] = SA2_ANIM_PLATFORM_EGG_UTO,
    [LEVEL_INDEX(ZONE_7, ACT_UNUSED)] = SA2_ANIM_PLATFORM_EGG_UTO,

    [LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_FINAL, 2)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_FINAL, 3)] = SA2_ANIM_PLATFORM_LEA_FOR,

    [LEVEL_INDEX(8, ACT_1)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(8, ACT_2)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(8, ACT_BOSS)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(8, ACT_UNUSED)] = SA2_ANIM_PLATFORM_LEA_FOR,

    [LEVEL_INDEX(9, ACT_1)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(9, ACT_2)] = SA2_ANIM_PLATFORM_LEA_FOR,
};

void CreateEntity_Platform(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_PlatformMain, sizeof(Sprite_Platform), 0x2010, 0, TaskDestructor_Platform);
    Sprite_Platform *platform = TASK_DATA(t);
    Sprite *s = &platform->s;

    platform->base.regionX = spriteRegionX;
    platform->base.regionY = spriteRegionY;
    platform->base.me = me;
    platform->base.meX = me->x;
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
        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = VramMalloc(18);

        s->graphics.anim = sPlatformLevelAnims[gCurrentLevel];
        s->variant = 0;

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

void Task_PlatformMain(void)
{
    Player *p = &gPlayer;
    s16 posX;
    s16 posY;
    MapEntity *me;
    u32 result;
    s32 deltaX = 0, deltaY = 0;

    Sprite_Platform *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    me = platform->base.me;

    if (platform->velocityX != 0) {
#ifdef NON_MATCHING
        s32 r5 = platform->offsetX;
#else
        register s32 r5 asm("r5") = platform->offsetX;
#endif
        s32 meUdata2 = (me->d.uData[2] << 11);

        platform->offsetX = (SIN((platform->velocityX * ((gStageTime + platform->timer) & 0xFF)) & ONE_CYCLE) * meUdata2) >> 14;
        r5 = platform->offsetX - r5;
#ifndef NON_MATCHING
        asm("" ::"r"(r5));
#endif
        deltaX = r5;
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

    posX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    posY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = posX - gCamera.x + I(platform->offsetX);
    s->y = posY - gCamera.y + I(platform->offsetY);

    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        p->qWorldX += deltaX;

        if (!GRAVITY_IS_INVERTED) {
            p->qWorldY += deltaY + Q(1.0);
        } else {
            p->qWorldY += deltaY - Q(2.0);
        }
    }

    if (!(p->moveState & MOVESTATE_IA_OVERRIDE)) {
        s32 x = (posX + I(platform->offsetX));
        s32 y = (posY + I(platform->offsetY));

        result = Coll_Player_Platform(s, x, y, p);

        if (result & COLL_FLAG_10000) {
            p->qWorldY += Q_8_8(result);
        }
    }

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, posX - gCamera.x, posY - gCamera.y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.meX);
        TaskDestroy(gCurTask);
    } else {
        if (!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE)) {
            if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
                if (platform->stoodOffset != 0x100) {
                    platform->stoodOffset += 0x10;
                }
            } else {
                if (platform->stoodOffset != 0) {
                    platform->stoodOffset -= 0x10;
                }
            }

            if (!GRAVITY_IS_INVERTED) {
                s->y += SIN_24_8(platform->stoodOffset) >> 6;
            } else {
                s->y -= SIN_24_8(platform->stoodOffset) >> 6;
            }
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void CreateEntity_FallingPlatform(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_FallingPlatformMain_Idle, sizeof(Sprite_Platform), 0x2010, 0, TaskDestructor_Platform);
    Sprite_Platform *platform = TASK_DATA(t);
    Sprite *s = &platform->s;

    platform->base.regionX = spriteRegionX;
    platform->base.regionY = spriteRegionY;
    platform->base.me = me;
    platform->base.meX = me->x;
    platform->base.id = spriteY;
    platform->offsetX = 0;
    platform->offsetY = 0;
    platform->stoodOffset = 0;

    platform->velocityX = 0;
    platform->velocityY = 0;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);

    platform->prevOffsetY[0] = platform->offsetY;
    platform->prevOffsetY[1] = platform->offsetY;

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(18);

    s->variant = 0;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        s->graphics.anim = sPlatformLevelAnims[gCurrentLevel];
    } else {
        s->graphics.anim = SA2_ANIM_PLATFORM_LEA_FOR;
    }

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

void Task_FallingPlatformMain_Idle(void)
{
    Player *p;
    s16 posX;
    s16 posY;
    MapEntity *me;
    u32 result;

    Sprite_Platform *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    me = platform->base.me;

    if (IS_MULTI_PLAYER) {
        HandlePlatformOffsetYStorage(platform);
    }

    posX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    posY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = posX - gCamera.x;
    s->y = posY - gCamera.y;

    p = &gPlayer;
    result = Coll_Player_Platform(s, posX, posY, p);

    if (result & COLL_FLAG_10000) {
        p->qWorldY += Q_8_8(result);
        gCurTask->main = Task_FallingPlatformMain_FallDelay;
        platform->timer = 30;
    }

    if ((IS_MULTI_PLAYER) && ((s8)me->x == -3)) {
        platform->timer = 0;
        gCurTask->main = Task_FallingPlatformMain_Falling;
    }

    if (((posX > gCamera.x + (DISPLAY_WIDTH + 128)) || (posX < (gCamera.x - 128)) || (posY > (gCamera.y + (DISPLAY_HEIGHT + 128)))
         || ((posY < gCamera.y - 128)))
        && (IS_OUT_OF_CAM_RANGE(s->x, s->y))) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.meX);
        TaskDestroy(gCurTask);
    } else {
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            if (platform->stoodOffset != 0x100) {
                platform->stoodOffset += 0x10;
            }
        } else {
            if (platform->stoodOffset != 0) {
                platform->stoodOffset -= 0x10;
            }
        }

        s->y += SIN_24_8(platform->stoodOffset) >> 6;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_FallingPlatformMain_FallDelay(void)
{
    Player *p;
    s16 posX;
    s16 posY;
    MapEntity *me;
    u32 result;

    Sprite_Platform *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    me = platform->base.me;

    if (IS_MULTI_PLAYER) {
        HandlePlatformOffsetYStorage(platform);
    }

    posX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    posY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = posX - gCamera.x;
    s->y = posY - gCamera.y;

    p = &gPlayer;
    result = Coll_Player_Platform(s, posX, posY, p);

    if (result & 0x10000) {
        p->qWorldY += Q_8_8(result);
    }

    if ((IS_MULTI_PLAYER) && ((s8)me->x == -3)) {
        platform->timer = 0;
        gCurTask->main = Task_FallingPlatformMain_Falling;
    } else {
        if (--platform->timer == 0) {
            // NOTE: This must have been a macro
            platform->timer = 0;

            gCurTask->main = Task_FallingPlatformMain_Falling;

            if (IS_MULTI_PLAYER) {
                RoomEvent_PlatformChange *roomEvent = CreateRoomEvent();
                roomEvent->type = ROOMEVENT_TYPE_PLATFORM_CHANGE;
                roomEvent->x = platform->base.regionX;
                roomEvent->y = platform->base.regionY;
                roomEvent->id = platform->base.id;
                roomEvent->action = 1;
            }
        }
    }

    if (((posX > gCamera.x + (DISPLAY_WIDTH + 128)) || (posX < (gCamera.x - 128)) || (posY > (gCamera.y + (DISPLAY_HEIGHT + 128)))
         || ((posY < gCamera.y - 128)))
        && (IS_OUT_OF_CAM_RANGE(s->x, s->y))) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.meX);
        TaskDestroy(gCurTask);
    } else {
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            if (platform->stoodOffset != 0x100) {
                platform->stoodOffset += 0x10;
            }
        } else {
            if (platform->stoodOffset != 0) {
                platform->stoodOffset -= 0x10;
            }
        }

        s->y += SIN_24_8(platform->stoodOffset) >> 6;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_FallingPlatformMain_Falling(void)
{
    s16 posX;
    s16 posY;
    MapEntity *me;
    u32 result;

    Sprite_Platform *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    me = platform->base.me;

    if (IS_MULTI_PLAYER) {
        HandlePlatformOffsetYStorage(platform);
    }

    platform->velocityY += 0x2A;
    platform->offsetY += platform->velocityY;

    posX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    posY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = posX - gCamera.x;

    if (IS_MULTI_PLAYER) {
        s->y = (posY - gCamera.y) + I(platform->prevOffsetY[1]);
    } else {
        s->y = (posY - gCamera.y) + I(platform->offsetY);
    }

    platform->timer++;

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) {
        if (gPlayer.stoodObj == s) {
            if (platform->timer > 32) {
                gPlayer.moveState |= MOVESTATE_IN_AIR;
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                gPlayer.qSpeedAirY = platform->velocityY;
            } else {
                gPlayer.qWorldX += platform->velocityX;
                gPlayer.qWorldY += Q(1.0) + platform->velocityY;
            }
        }
    }

    if (platform->timer < 32) {
        result = Coll_Player_Platform(s, posX, posY + I(platform->offsetY), &gPlayer);
        if (result & 0x10000) {
            gPlayer.qWorldY += Q_8_8(result);
        }
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.meX);
        TaskDestroy(gCurTask);
    } else {
        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            if (platform->stoodOffset != 0x100) {
                platform->stoodOffset += 0x10;
            }
        } else {
            if (platform->stoodOffset != 0) {
                platform->stoodOffset -= 0x10;
            }
        }

        s->y += SIN_24_8(platform->stoodOffset) >> 6;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void TaskDestructor_Platform(struct Task *t)
{
    Sprite_Platform *platform = TASK_DATA(t);
    void *vramPtr = platform->s.graphics.dest;
    VramFree(vramPtr);
}

void HandlePlatformOffsetYStorage(Sprite_Platform *platform)
{
    platform->prevOffsetY[1] = platform->prevOffsetY[0];
    platform->prevOffsetY[0] = platform->offsetY;
}