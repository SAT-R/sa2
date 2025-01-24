#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "trig.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "task.h"

#include "game/entity.h"
#include "game/interactables_2/hot_crater/dash_ring.h"
#include "sprite.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/zones.h"

#define IA_DASH_RING_ACCELERATION 8

static void DashRing_SetPlayerSpeedAndDir(Sprite_DashRing *ring);
static bool32 DashRing_PlayerIsColliding(Sprite_DashRing *ring);
static void Task_Interactable_DashRing(void);
static void Task_Interactable_DashRing_AfterAcceleration(void);
static void TaskDestructor_Interactable_DashRing(struct Task *);
static void DashRing_UpdateScreenPos(Sprite_DashRing *);
bool32 DashRing_ShouldDespawn(Sprite_DashRing *);
static void DashRing_Despawn(Sprite_DashRing *);

// type: UnkDashRingStruct
static const u16 sAnimInfoDashRing[DASH_RING__NUM_TYPES][DASH_RING__NUM_ORIENTATIONS][2][6] = {
    {
        {
            { SA2_ANIM_DASH_RING, 0x0002, 12, 0x0000, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING, 0x0003, 6, 0x0000, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING, 0x0004, 36, 0x0400, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING, 0x0005, 25, 0x0400, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING, 0x0000, 12, 0x0000, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING, 0x0001, 6, 0x0000, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING, 0x0004, 36, 0x0C00, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING, 0x0005, 25, 0x0C00, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING, 0x0002, 12, 0x0800, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING, 0x0003, 6, 0x0800, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING, 0x0004, 36, 0x0800, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING, 0x0005, 25, 0x0800, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING, 0x0000, 12, 0x0400, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING, 0x0001, 6, 0x0400, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING, 0x0004, 36, 0x0000, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING, 0x0005, 25, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        {
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0002, 12, 0x0000, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0003, 6, 0x0000, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0004, 36, 0x0400, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0005, 25, 0x0400, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0000, 12, 0x0000, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0001, 6, 0x0000, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0004, 36, 0x0C00, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0005, 25, 0x0C00, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0002, 12, 0x0800, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0003, 6, 0x0800, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0004, 36, 0x0800, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0005, 25, 0x0800, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0000, 12, 0x0400, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0001, 6, 0x0400, 0x0000, 0x0000 },
        },
        {
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0004, 36, 0x0000, 0x0000, 0x0000 },
            { SA2_ANIM_DASH_RING_TEC_BAS, 0x0005, 25, 0x0000, 0x0000, 0x0000 },
        },
    },
};

// NOTE(Jace): Maybe these are UnkDashRingStruct[8]?
static const u16 sUnknown_080DFB90[DASH_RING__NUM_ORIENTATIONS][6] = {
    { 0 }, { 0 }, { 0 }, { 0 }, { 0 }, { 0 }, { 0 }, { 0 },
};

void CreateEntity_DashRing(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    u32 ringType = DASH_RING__TYPE_REGULAR;

    struct Task *t = TaskCreate(Task_Interactable_DashRing, sizeof(Sprite_DashRing), 0x2010, 0, TaskDestructor_Interactable_DashRing);

    Sprite_DashRing *ring = TASK_DATA(t);
    ring->orientation = me->d.sData[0];
    ring->posX = TO_WORLD_POS(me->x, spriteRegionX);
    ring->posY = TO_WORLD_POS(me->y, spriteRegionY);
    ring->spriteX = me->x;
    ring->spriteY = spriteY;
    ring->me = me;

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6)
        ringType = DASH_RING__TYPE_TECHNO_BASE;

    {
        Sprite *s = &ring->s1;
        s->oamFlags = SPRITE_OAM_ORDER(6);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;

        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x2000;
        s->graphics.anim = sAnimInfoDashRing[ringType][ring->orientation][0][0];
        s->variant = sAnimInfoDashRing[ringType][ring->orientation][0][1];
        s->graphics.dest = VramMalloc(sAnimInfoDashRing[ringType][ring->orientation][0][2]);
        s->frameFlags |= sAnimInfoDashRing[ringType][ring->orientation][0][3];
    }
    {
        Sprite *s = &ring->s2;
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;

        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x2000;
        s->graphics.anim = sAnimInfoDashRing[ringType][ring->orientation][1][0];
        s->variant = sAnimInfoDashRing[ringType][ring->orientation][1][1];
        s->graphics.dest = VramMalloc(sAnimInfoDashRing[ringType][ring->orientation][1][2]);
        s->frameFlags |= sAnimInfoDashRing[ringType][ring->orientation][1][3];
    }
    DashRing_UpdateScreenPos(ring);
    UpdateSpriteAnimation(&ring->s1);
    UpdateSpriteAnimation(&ring->s2);

    SET_MAP_ENTITY_INITIALIZED(me);

    ring->positions[0].x = sUnknown_080DFB90[ring->orientation][0];
    ring->positions[0].y = sUnknown_080DFB90[ring->orientation][1];
    ring->positions[1].x = sUnknown_080DFB90[ring->orientation][2];
    ring->positions[1].y = sUnknown_080DFB90[ring->orientation][3];
    ring->positions[2].x = sUnknown_080DFB90[ring->orientation][4];
    ring->positions[2].y = sUnknown_080DFB90[ring->orientation][5];
}

static void DashRing_SetPlayerSpeedAndDir(Sprite_DashRing *ring)
{
    gPlayer.transition = PLTRANS_DASHRING;

    // NOTE: This doesn't take the sprite offset, is it a bug?
    gPlayer.qWorldX = Q(ring->posX);
    gPlayer.qWorldY = Q(ring->posY);
    gPlayer.unk72 = 0x10;

    switch (ring->orientation) {
        case DASH_RING_DIR__UP: {
            gPlayer.charState = CHARSTATE_SPRING_B;
            gPlayer.qSpeedAirX = COS_DEG(270) * IA_DASH_RING_ACCELERATION;
            gPlayer.qSpeedAirY = SIN_DEG(270) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__UP_RIGHT: {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
            gPlayer.charState = CHARSTATE_SPRING_B;
            gPlayer.qSpeedAirX = COS_DEG(315) * IA_DASH_RING_ACCELERATION;
            gPlayer.qSpeedAirY = SIN_DEG(315) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__RIGHT: {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
            gPlayer.charState = CHARSTATE_RAMP_AND_DASHRING;
            gPlayer.qSpeedAirX = COS_DEG(0) * IA_DASH_RING_ACCELERATION;
            gPlayer.qSpeedAirY = SIN_DEG(0) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__DOWN_RIGHT: {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
            gPlayer.charState = CHARSTATE_FALLING_VULNERABLE_B;
            gPlayer.qSpeedAirX = COS_DEG(45) * IA_DASH_RING_ACCELERATION;
            gPlayer.qSpeedAirY = SIN_DEG(45) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__DOWN: {
            gPlayer.charState = CHARSTATE_FALLING_VULNERABLE_B;
            gPlayer.qSpeedAirX = COS_DEG(90) * IA_DASH_RING_ACCELERATION;
            gPlayer.qSpeedAirY = SIN_DEG(90) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__DOWN_LEFT: {
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
            gPlayer.charState = CHARSTATE_FALLING_VULNERABLE_B;
            gPlayer.qSpeedAirX = COS_DEG(135) * IA_DASH_RING_ACCELERATION;
            gPlayer.qSpeedAirY = SIN_DEG(135) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__LEFT: {
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
            gPlayer.charState = CHARSTATE_RAMP_AND_DASHRING;
            gPlayer.qSpeedAirX = COS_DEG(180) * IA_DASH_RING_ACCELERATION;
            gPlayer.qSpeedAirY = SIN_DEG(180) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__UP_LEFT: {
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
            gPlayer.charState = CHARSTATE_SPRING_B;
            gPlayer.qSpeedAirX = COS_DEG(225) * IA_DASH_RING_ACCELERATION;
            gPlayer.qSpeedAirY = SIN_DEG(225) * IA_DASH_RING_ACCELERATION;
        } break;
    }

    m4aSongNumStart(SE_DASH_RING);
    gCurTask->main = Task_Interactable_DashRing_AfterAcceleration;
}

static bool32 DashRing_PlayerIsColliding(Sprite_DashRing *ring)
{
    s32 ringScreenX, ringScreenY;
    s16 ringScreenX2, ringScreenY2;
    s16 playerScreenX, playerScreenY;
    u8 i;

    if (gPlayer.moveState & MOVESTATE_DEAD)
        return FALSE;

    ringScreenX = ring->posX;
    ringScreenX -= gCamera.x;
    ringScreenY = ring->posY;
    ringScreenY -= gCamera.y;

    playerScreenX = I(gPlayer.qWorldX) - gCamera.x;
    playerScreenY = I(gPlayer.qWorldY) - gCamera.y;

    for (i = 0; i < ARRAY_COUNT(ring->positions); i++) {
        ringScreenX2 = ringScreenX;
        ringScreenY2 = ringScreenY;
        ringScreenX2 = ringScreenX2 + ring->positions[i].x - 12;
        ringScreenY2 = ringScreenY2 + ring->positions[i].y - 12;

        if ((ringScreenX2 <= playerScreenX) && ((ringScreenX2 + 24) >= playerScreenX) && (ringScreenY2 <= playerScreenY)
            && (ringScreenY2 + 24) >= playerScreenY) {
#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
            // The TAS is designed to "skip" the dashring by being so far off screen
            // that the play does no trigger it
            if (gCurrentLevel == LEVEL_INDEX(ZONE_2, ACT_1)) {
                return FALSE;
            }
#endif
            return TRUE;
        }
    }

    return FALSE;
}

static void Task_Interactable_DashRing(void)
{
    Sprite_DashRing *ring = TASK_DATA(gCurTask);

    if (DashRing_PlayerIsColliding(ring)) {
        DashRing_SetPlayerSpeedAndDir(ring);
    }

    if (DashRing_ShouldDespawn(ring)) {
        DashRing_Despawn(ring);
    } else {
        DashRing_UpdateScreenPos(ring);
        DisplaySprite(&ring->s1);
        DisplaySprite(&ring->s2);
    }
}

static void Task_Interactable_DashRing_AfterAcceleration(void)
{
    Sprite_DashRing *ring = TASK_DATA(gCurTask);

    DashRing_UpdateScreenPos(ring);
    DisplaySprite(&ring->s1);
    DisplaySprite(&ring->s2);

    if (!DashRing_PlayerIsColliding(ring)) {
        gCurTask->main = Task_Interactable_DashRing;
    }
}

static void TaskDestructor_Interactable_DashRing(struct Task *t)
{
    Sprite_DashRing *ring = TASK_DATA(t);

    VramFree(ring->s1.graphics.dest);
    VramFree(ring->s2.graphics.dest);
}

static void DashRing_UpdateScreenPos(Sprite_DashRing *ring)
{
    ring->s1.x = ring->posX - gCamera.x;
    ring->s1.y = ring->posY - gCamera.y;
    ring->s2.x = ring->posX - gCamera.x;
    ring->s2.y = ring->posY - gCamera.y;
}

bool32 DashRing_ShouldDespawn(Sprite_DashRing *ring)
{
    s16 screenX, screenY;

    screenX = ring->posX - gCamera.x;
    screenY = ring->posY - gCamera.y;

    if ((screenX + 12) < -(CAM_REGION_WIDTH / 2) || (screenX - 12) > DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)
        || (screenY + 12) < -(CAM_REGION_WIDTH / 2) || ((screenY - 12) > DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void DashRing_Despawn(Sprite_DashRing *ring)
{
    ring->me->x = ring->spriteX;
    TaskDestroy(gCurTask);
}
