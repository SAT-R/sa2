#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a.h"
#include "trig.h"

#include "game/game.h"
#include "task.h"

#include "game/interactable.h"
#include "game/interactables_2/dash_ring.h"
#include "sprite.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

#define IA_DASH_RING_ACCELERATION 8

static void DashRing_SetPlayerSpeedAndDir(Sprite_DashRing *ring);
static bool32 DashRing_PlayerIsColliding(Sprite_DashRing *ring);
static void Task_Interactable_DashRing(void);
static void Task_Interactable_DashRing_AfterAcceleration(void);
static void TaskDestructor_Interactable_DashRing(struct Task *);
static void DashRing_UpdateScreenPos(Sprite_DashRing *);
static bool32 DashRing_ShouldDespawn(Sprite_DashRing *);
static void DashRing_Despawn(Sprite_DashRing *);

// type: UnkDashRingStruct
static const u16 sAnimInfoDashRing[DASH_RING__NUM_TYPES][DASH_RING__NUM_ORIENTATIONS][2]
                                  [6]
    = {
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

void initSprite_Interactable_DashRing(Interactable *ia, u16 spriteRegionX,
                                      u16 spriteRegionY, u8 spriteY)
{
    u32 ringType = DASH_RING__TYPE_REGULAR;

    struct Task *t = TaskCreate(Task_Interactable_DashRing, 0x80, 0x2010, 0,
                                TaskDestructor_Interactable_DashRing);

    Sprite_DashRing *ring = TaskGetStructPtr(t);
    ring->orientation = ia->d.sData[0];
    ring->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    ring->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    ring->spriteX = ia->x;
    ring->spriteY = spriteY;
    ring->ia = ia;

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6)
        ringType = DASH_RING__TYPE_TECHNO_BASE;

    {
        Sprite *spriteA = &ring->spriteA;
        spriteA->unk1A = 0x180;
        spriteA->graphics.size = 0;
        spriteA->unk14 = 0;
        spriteA->unk1C = 0;

        spriteA->unk21 = 0xFF;
        spriteA->unk22 = 0x10;
        spriteA->focused = 0;
        spriteA->unk28->unk0 = -1;
        spriteA->unk10 = 0x2000;
        spriteA->graphics.anim = sAnimInfoDashRing[ringType][ring->orientation][0][0];
        spriteA->variant = sAnimInfoDashRing[ringType][ring->orientation][0][1];
        spriteA->graphics.dest
            = VramMalloc(sAnimInfoDashRing[ringType][ring->orientation][0][2]);
        spriteA->unk10 |= sAnimInfoDashRing[ringType][ring->orientation][0][3];
    }
    {
        Sprite *spriteB = &ring->spriteB;
        spriteB->unk1A = 0x480;
        spriteB->graphics.size = 0;
        spriteB->unk14 = 0;
        spriteB->unk1C = 0;

        spriteB->unk21 = 0xFF;
        spriteB->unk22 = 0x10;
        spriteB->focused = 0;
        spriteB->unk28->unk0 = -1;
        spriteB->unk10 = 0x2000;
        spriteB->graphics.anim = sAnimInfoDashRing[ringType][ring->orientation][1][0];
        spriteB->variant = sAnimInfoDashRing[ringType][ring->orientation][1][1];
        spriteB->graphics.dest
            = VramMalloc(sAnimInfoDashRing[ringType][ring->orientation][1][2]);
        spriteB->unk10 |= sAnimInfoDashRing[ringType][ring->orientation][1][3];

        DashRing_UpdateScreenPos(ring);
        sub_8004558(&ring->spriteA);
        sub_8004558(&ring->spriteB);
    }

    SET_SPRITE_INITIALIZED(ia);

    ring->positions[0].x = sUnknown_080DFB90[ring->orientation][0];
    ring->positions[0].y = sUnknown_080DFB90[ring->orientation][1];
    ring->positions[1].x = sUnknown_080DFB90[ring->orientation][2];
    ring->positions[1].y = sUnknown_080DFB90[ring->orientation][3];
    ring->positions[2].x = sUnknown_080DFB90[ring->orientation][4];
    ring->positions[2].y = sUnknown_080DFB90[ring->orientation][5];
}

static void DashRing_SetPlayerSpeedAndDir(Sprite_DashRing *ring)
{
    gPlayer.unk6D = 0x18;

    // NOTE: This doesn't take the sprite offset, is it a bug?
    gPlayer.x = Q_24_8(ring->posX);
    gPlayer.y = Q_24_8(ring->posY);
    gPlayer.unk72 = 0x10;

    switch (ring->orientation) {
        case DASH_RING_DIR__UP: {
            gPlayer.unk64 = 0x26;
            gPlayer.speedAirX = COS_DEG(270) * IA_DASH_RING_ACCELERATION;
            gPlayer.speedAirY = SIN_DEG(270) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__UP_RIGHT: {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
            gPlayer.unk64 = 0x26;
            gPlayer.speedAirX = COS_DEG(315) * IA_DASH_RING_ACCELERATION;
            gPlayer.speedAirY = SIN_DEG(315) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__RIGHT: {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
            gPlayer.unk64 = 0x28;
            gPlayer.speedAirX = COS_DEG(0) * IA_DASH_RING_ACCELERATION;
            gPlayer.speedAirY = SIN_DEG(0) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__DOWN_RIGHT: {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
            gPlayer.unk64 = 0xE;
            gPlayer.speedAirX = COS_DEG(45) * IA_DASH_RING_ACCELERATION;
            gPlayer.speedAirY = SIN_DEG(45) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__DOWN: {
            gPlayer.unk64 = 0xE;
            gPlayer.speedAirX = COS_DEG(90) * IA_DASH_RING_ACCELERATION;
            gPlayer.speedAirY = SIN_DEG(90) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__DOWN_LEFT: {
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
            gPlayer.unk64 = 0xE;
            gPlayer.speedAirX = COS_DEG(135) * IA_DASH_RING_ACCELERATION;
            gPlayer.speedAirY = SIN_DEG(135) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__LEFT: {
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
            gPlayer.unk64 = 0x28;
            gPlayer.speedAirX = COS_DEG(180) * IA_DASH_RING_ACCELERATION;
            gPlayer.speedAirY = SIN_DEG(180) * IA_DASH_RING_ACCELERATION;
        } break;

        case DASH_RING_DIR__UP_LEFT: {
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
            gPlayer.unk64 = 0x26;
            gPlayer.speedAirX = COS_DEG(225) * IA_DASH_RING_ACCELERATION;
            gPlayer.speedAirY = SIN_DEG(225) * IA_DASH_RING_ACCELERATION;
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

    playerScreenX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    playerScreenY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

    for (i = 0; i < ARRAY_COUNT(ring->positions); i++) {
        ringScreenX2 = ringScreenX;
        ringScreenY2 = ringScreenY;
        ringScreenX2 = ringScreenX2 + ring->positions[i].x - 12;
        ringScreenY2 = ringScreenY2 + ring->positions[i].y - 12;

        if ((ringScreenX2 <= playerScreenX) && ((ringScreenX2 + 24) >= playerScreenX)
            && (ringScreenY2 <= playerScreenY) && (ringScreenY2 + 24) >= playerScreenY) {
            return TRUE;
        }
    }

    return FALSE;
}

static void Task_Interactable_DashRing(void)
{
    Sprite_DashRing *ring = TaskGetStructPtr(gCurTask);

    if (DashRing_PlayerIsColliding(ring)) {
        DashRing_SetPlayerSpeedAndDir(ring);
    }

    if (DashRing_ShouldDespawn(ring)) {
        DashRing_Despawn(ring);
    } else {
        DashRing_UpdateScreenPos(ring);
        sub_80051E8(&ring->spriteA);
        sub_80051E8(&ring->spriteB);
    }
}

static void Task_Interactable_DashRing_AfterAcceleration(void)
{
    Sprite_DashRing *ring = TaskGetStructPtr(gCurTask);

    DashRing_UpdateScreenPos(ring);
    sub_80051E8(&ring->spriteA);
    sub_80051E8(&ring->spriteB);

    if (!DashRing_PlayerIsColliding(ring)) {
        gCurTask->main = Task_Interactable_DashRing;
    }
}

static void TaskDestructor_Interactable_DashRing(struct Task *t)
{
    Sprite_DashRing *ring = TaskGetStructPtr(t);

    VramFree(ring->spriteA.graphics.dest);
    VramFree(ring->spriteB.graphics.dest);
}

static void DashRing_UpdateScreenPos(Sprite_DashRing *ring)
{
    ring->spriteA.x = ring->posX - gCamera.x;
    ring->spriteA.y = ring->posY - gCamera.y;
    ring->spriteB.x = ring->posX - gCamera.x;
    ring->spriteB.y = ring->posY - gCamera.y;
}

static bool32 DashRing_ShouldDespawn(Sprite_DashRing *ring)
{
    s16 screenX, screenY;

    screenX = ring->posX - gCamera.x;
    screenY = ring->posY - gCamera.y;

    if (((u16)(screenX + 140) > 520) || ((screenY + 12) < -128)
        || ((screenY - 12) > 288)) {
        return TRUE;
    }

    return FALSE;
}

static void DashRing_Despawn(Sprite_DashRing *ring)
{
    ring->ia->x = ring->spriteX;
    TaskDestroy(gCurTask);
}
