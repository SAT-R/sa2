#include "global.h"
#include "core.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/interactables/platform_thin.h"
#include "game/entity.h"

#include "game/multiplayer/multiplayer_event_mgr.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 timer;
    /* 0x40 */ s32 offsetX;
    /* 0x44 */ s32 offsetY;

    // unused
    /* 0x48 */ s32 velocityX;
    /* 0x4C */ s32 velocityY;
} Sprite_CommonThinPlatform;

typedef struct {
    Sprite unk0;
    Sprite unk30;
    Sprite unk60;
    Sprite unk90;
    SpriteTransform unkC0;
    SpriteTransform unkCC;
    SpriteTransform unkD8;
    SpriteTransform unkE4;
    u16 timer;
    s16 qAccelerationY;
} PlatformBreakParticles /* size 0xF4*/;

static void Task_PlatformThinMain(void);
static void TaskDestructor_PlatformThin(struct Task *);

static void Task_PlatformBreakParticlesMain(void);
static void TaskDestructor_PlatformBreakParticles(struct Task *);

void CreatePlatformBreakParticles(s16, s16);
static u32 HandleThinPlatformCollision(Sprite *, s32, s32, Player *);

static const ALIGNED(4) u16 sPlatformThinAnimations[][3] = {
    { 24, SA2_ANIM_562, 0 },
    { 24, SA2_ANIM_PLATFORM_HOT_CRA, 1 },
    { 24, SA2_ANIM_PLATFORM_SQUARE_MUS_PLA, 2 },
    { 24, SA2_ANIM_PLATFORM_ICE_PAR, 1 },
    { 24, SA2_ANIM_PLATFORM_SKY_CAN, 0 },
    { 24, SA2_ANIM_PLATFORM_TEC_BAS, 1 },
    { 24, SA2_ANIM_610, 0 },
    { 24, SA2_ANIM_610, 0 },
    { 24, SA2_ANIM_610, 0 },
};

static const u16 sPlatformBreakAnimations[][6] = {
    { 4, SA2_ANIM_563, 0, 1, SA2_ANIM_563, 1 },
    { 2, SA2_ANIM_569, 0, 1, SA2_ANIM_569, 1 },
    { 2, SA2_ANIM_579, 0, 1, SA2_ANIM_579, 1 },
    { 2, SA2_ANIM_583, 0, 1, SA2_ANIM_583, 1 },
    { 4, SA2_ANIM_PLATFORM_587, 0, 1, SA2_ANIM_PLATFORM_587, 1 },
    { 2, SA2_ANIM_602, 0, 1, SA2_ANIM_602, 1 },
    { 4, SA2_ANIM_609, 0, 1, SA2_ANIM_609, 1 },
    { 4, SA2_ANIM_609, 0, 1, SA2_ANIM_609, 1 },
    { 4, SA2_ANIM_609, 0, 1, SA2_ANIM_609, 1 },
};
static const u16 unused = 0;

void CreateEntity_PlatformThin(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_PlatformThinMain, sizeof(Sprite_CommonThinPlatform), 0x2010, 0, TaskDestructor_PlatformThin);
    Sprite_CommonThinPlatform *platform = TASK_DATA(t);
    Sprite *s = &platform->s;

    platform->base.regionX = spriteRegionX;
    platform->base.regionY = spriteRegionY;
    platform->base.me = me;
    platform->base.spriteX = me->x;
    platform->base.id = spriteY;

    platform->offsetX = 0;
    platform->offsetY = 0;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(sPlatformThinAnimations[LEVEL_TO_ZONE(gCurrentLevel)][0]);
    s->graphics.anim = sPlatformThinAnimations[LEVEL_TO_ZONE(gCurrentLevel)][1];
    s->variant = sPlatformThinAnimations[LEVEL_TO_ZONE(gCurrentLevel)][2];

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    UpdateSpriteAnimation(s);
}

static void Task_PlatformThinMain(void)
{
    // Have to be declared in this order to match
    Player *player;
    Sprite *s;
    MapEntity *me;
    Sprite_CommonThinPlatform *platform;
    s16 x, y;
    bool32 something;

    player = &gPlayer;
    something = FALSE;
    platform = TASK_DATA(gCurTask);
    s = &platform->s;
    me = platform->base.me;
    x = TO_WORLD_POS(platform->base.spriteX, platform->base.regionX);
    y = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (IS_MULTI_PLAYER && (s8)me->x == -3) {
        CreatePlatformBreakParticles(x, y);

        if (player->moveState & MOVESTATE_STOOD_ON_OBJ && player->stoodObj == s) {
            player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            player->moveState |= 2;
        }
        TaskDestroy(gCurTask);
        return;
    }

    if (!(player->moveState & (MOVESTATE_IA_OVERRIDE | MOVESTATE_DEAD))) {
        u32 temp2 = Coll_Player_Platform(s, x, y, player);
        if (temp2 & 0xC0000) {
            if (HandleThinPlatformCollision(s, x, y, player) & 0xC0000) {
                player->qWorldX += (s16)(temp2 & 0xFF00);
                player->qSpeedAirX = 0;
            }
        }

        if (temp2 & 0x30000) {
            s16 charState = player->charState;
            s16 anim = player->anim;
            s16 variant = player->variant;
            switch (player->character) {
                case CHARACTER_KNUCKLES:
                    if (charState == CHARSTATE_KNUCKLES_DRILL_CLAW_MAIN) {
                        player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                        player->moveState |= MOVESTATE_IN_AIR;
                        player->qSpeedAirY = player->qSpeedAirY >> 1;
                        CreatePlatformBreakParticles(x, y);
                        something = TRUE;
                        break;
                    }
                    player->qWorldY += (s16)(temp2 << 8);
                    player->qSpeedAirY = 0;
                    break;
                case CHARACTER_SONIC:
                case CHARACTER_AMY: {
                    anim -= gPlayerCharacterIdleAnims[player->character];
                    if (charState == CHARSTATE_TRICK_DOWN && anim == SA2_CHAR_ANIM_51 && variant == 1 && player->qSpeedAirY > 0) {
                        player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                        CreatePlatformBreakParticles(x, y);
                        something = TRUE;
                    }
                }
                default:
                    player->qWorldY += (s16)(temp2 << 8);
                    player->qSpeedAirY = 0;
                    break;
            }
        }
    }
    if (something) {
        if (IS_MULTI_PLAYER) {
            RoomEvent_PlatformChange *roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_PLATFORM_CHANGE;
            roomEvent->x = platform->base.regionX;
            roomEvent->y = platform->base.regionY;
            roomEvent->id = platform->base.id;
            roomEvent->action = 0;
        }
        TaskDestroy(gCurTask);
        return;
    }

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, x - gCamera.x, y - gCamera.y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
    return;
}

void CreatePlatformBreakParticles(s16 x, s16 y)
{
    struct Task *t
        = TaskCreate(Task_PlatformBreakParticlesMain, sizeof(PlatformBreakParticles), 0x2011, 0, TaskDestructor_PlatformBreakParticles);
    PlatformBreakParticles *particles = TASK_DATA(t);

    SpriteTransform *transform;
    Sprite *s;

    s = &particles->unk0;
    transform = &particles->unkC0;
    particles->timer = 0;
    particles->qAccelerationY = -Q(2);
    x -= 128;
    y -= 50;

    // Init base 1
    s->graphics.dest = VramMalloc(sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][0]);
    s->graphics.anim = sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][1];
    s->variant = sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][2];

    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x70;

    // Init transform
    transform->rotation = 0;
    transform->qScaleX = Q(1);
    transform->qScaleY = Q(1);
    transform->x = x;
    transform->y = y;

    UpdateSpriteAnimation(s);

    // copy base 1
    DmaCopy16(3, s, ++s, sizeof(Sprite));
    // copy transform
    DmaCopy16(3, transform, ++transform, sizeof(SpriteTransform));
    // Set the new params
    s->frameFlags = 0x71;
    transform->y = y - 16;

    s = &particles->unk60;
    // Copy the transform
    DmaCopy16(3, transform, ++transform, sizeof(SpriteTransform));

    s->graphics.dest = VramMalloc(sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][3]);
    s->graphics.anim = sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][4];
    s->variant = sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][5];
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x72;

    // Set the transform props
    transform->y = y;

    UpdateSpriteAnimation(s);

    // Copy base 2
    DmaCopy16(3, s, ++s, sizeof(Sprite));
    // Copy the transform
    DmaCopy16(3, transform, ++transform, sizeof(SpriteTransform));
    // Update props
    s->frameFlags = 0x73;
    transform->y = y - 16;

    m4aSongNumStart(SE_278);
}

static void Task_PlatformBreakParticlesMain(void)
{
    s16 x, y;
    PlatformBreakParticles *platform = TASK_DATA(gCurTask);
    Sprite *s;
    s16 width;
    SpriteTransform *transform;
    if (platform->timer++ >= 0x3D) {
        TaskDestroy(gCurTask);
        return;
    }

    platform->qAccelerationY += 0x28;

    //
    s = &platform->unk0;
    transform = &platform->unkC0;

    transform->y += I(platform->qAccelerationY);

    x = transform->x;
    y = transform->y;

    transform->x -= gCamera.x;
    transform->y -= gCamera.y;

    transform->x -= platform->timer * 2;

    width = transform->qScaleX + 8;
    if (width > 0x200) {
        width = 0x200;
    }
    transform->qScaleX = width;
    transform->qScaleY = width;
    transform->rotation -= 0x2A;

    s->frameFlags &= ~0x1F;
    s->frameFlags |= gUnknown_030054B8++;
    sub_8004E14(s, transform);
    DisplaySprite(s);

    transform->x = x;
    transform->y = y;

    //
    s = &platform->unk30;
    transform = &platform->unkCC;

    transform->y += I(platform->qAccelerationY);

    x = transform->x;
    y = transform->y;

    transform->x -= gCamera.x;
    transform->y -= gCamera.y;

    transform->x += platform->timer;

    transform->qScaleX = width;
    transform->qScaleY = width;
    transform->rotation += 0x2A;

    s->frameFlags &= ~0x1F;
    s->frameFlags |= gUnknown_030054B8++;
    sub_8004E14(s, transform);
    DisplaySprite(s);

    transform->x = x;
    transform->y = y;

    //
    s = &platform->unk60;
    transform = &platform->unkD8;

    transform->y += I(platform->qAccelerationY);

    x = transform->x;
    y = transform->y;

    transform->x -= gCamera.x;
    transform->y -= gCamera.y;
    transform->x += platform->timer * 2;

    transform->qScaleX = width;
    transform->qScaleY = width;
    transform->rotation += 0xE;

    s->frameFlags &= ~0x1F;
    s->frameFlags |= gUnknown_030054B8++;
    sub_8004E14(s, transform);
    DisplaySprite(s);

    transform->x = x;
    transform->y = y;

    //
    s = &platform->unk90;
    transform = &platform->unkE4;

    transform->y += I(platform->qAccelerationY);

    x = transform->x;
    y = transform->y;

    transform->x -= gCamera.x;
    transform->y -= gCamera.y;
    transform->x -= platform->timer;

    transform->qScaleX = width;
    transform->qScaleY = width;
    transform->rotation -= 0xE;

    s->frameFlags &= ~0x1F;
    s->frameFlags |= gUnknown_030054B8++;
    sub_8004E14(s, transform);
    DisplaySprite(s);

    transform->x = x;
    transform->y = y;
}

static void TaskDestructor_PlatformThin(struct Task *t)
{
    Sprite_CommonThinPlatform *platform = TASK_DATA(t);

    VramFree(platform->s.graphics.dest);
}

static void TaskDestructor_PlatformBreakParticles(struct Task *t)
{
    PlatformBreakParticles *platform = TASK_DATA(t);
    VramFree(platform->unk0.graphics.dest);
    VramFree(platform->unk60.graphics.dest);
}

static u32 HandleThinPlatformCollision(Sprite *s, s32 x, s32 y, Player *player)
{
    u32 result;
    s->hitboxes[0].top += 1;
    s->hitboxes[0].bottom -= 1;

    result = Coll_Player_Platform(s, x, y, player);

    s->hitboxes[0].top -= 1;
    s->hitboxes[0].bottom += 1;
    return result;
}
