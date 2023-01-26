#include "global.h"
#include "malloc_vram.h"
#include "m4a.h"
#include "trig.h"

#include "game.h"
#include "task.h"

#include "interactable.h"
#include "interactable_dash_ring.h"
#include "sprite.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ u16 anim;
    /* 0x02 */ u16 variant;
    /* 0x04 */ u16 tileCount;
    /* 0x06 */ u16 unk6;
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u16 unkA;
} UnkDashRingStruct;

typedef struct {
    /* 0x00 */ Sprite spriteA;
    /* 0x30 */ Sprite spriteB;

    /* 0x60 */ UnkDashRingStruct unk60;

    // Maybe a struct starts here?
    /* 0x6C */ u16 orientation;
    /* 0x70 */ s32 posX;
    /* 0x74 */ s32 posY;
    /* 0x78 */ Interactable *ia;
    /* 0x7C */ u8 spriteX;
    /* 0x7D */ u8 spriteY;
} Sprite_DashRing; /* size: 0x80 */

#define IA_DASH_RING_ACCELERATION 8

// make static!
extern void Task_Interactable_DashRing(void);
extern void TaskDestructor_Interactable_DashRing(struct Task *);
extern void sub_8074C20(Sprite_DashRing *);
extern void Task_8074BBC(void);

static const UnkDashRingStruct sAnimInfoDashRing[DASH_RING__NUM_TYPES]
                                                [DASH_RING__NUM_ORIENTATIONS][2]
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
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0002, 0x000C, 0x0000, 0x0000, 0x0000 },
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0003, 0x0006, 0x0000, 0x0000, 0x0000 },
              },
              {
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0004, 0x0024, 0x0400, 0x0000, 0x0000 },
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0005, 0x0019, 0x0400, 0x0000, 0x0000 },
              },
              {
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0000, 0x000C, 0x0000, 0x0000, 0x0000 },
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0001, 0x0006, 0x0000, 0x0000, 0x0000 },
              },
              {
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0004, 0x0024, 0x0C00, 0x0000, 0x0000 },
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0005, 0x0019, 0x0C00, 0x0000, 0x0000 },
              },
              {
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0002, 0x000C, 0x0800, 0x0000, 0x0000 },
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0003, 0x0006, 0x0800, 0x0000, 0x0000 },
              },
              {
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0004, 0x0024, 0x0800, 0x0000, 0x0000 },
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0005, 0x0019, 0x0800, 0x0000, 0x0000 },
              },
              {
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0000, 0x000C, 0x0400, 0x0000, 0x0000 },
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0001, 0x0006, 0x0400, 0x0000, 0x0000 },
              },
              {
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0004, 0x0024, 0x0000, 0x0000, 0x0000 },
                  { SA2_ANIM_DASH_RING_TEC_BAS, 0x0005, 0x0019, 0x0000, 0x0000, 0x0000 },
              },
          },
      };

// NOTE(Jace): Maybe these are UnkDashRingStruct[8]?
static const u16 sUnknown_080DFB90[DASH_RING__NUM_ORIENTATIONS][6] = {
    { 0 }, { 0 }, { 0 }, { 0 }, { 0 }, { 0 }, { 0 }, { 0 },
};

NONMATCH("asm/non_matching/initSprite_Interactable_DashRing.inc",
         void initSprite_Interactable_DashRing(Interactable *ia, u16 spriteRegionX,
                                               u16 spriteRegionY, u8 spriteY))
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

    ring->spriteA.unk1A = 0x180;
    ring->spriteA.graphics.size = 0;
    ring->spriteA.unk14 = 0;
    ring->spriteA.unk1C = 0;
    ring->spriteA.unk21 = 0xFF;
    ring->spriteA.unk22 = 0x10;
    ring->spriteA.focused = 0;
    ring->spriteA.unk28->unk0 = -1;
    ring->spriteA.unk10 = 0x2000;
    ring->spriteA.graphics.anim = sAnimInfoDashRing[ringType][ring->orientation][0].anim;
    ring->spriteA.variant = sAnimInfoDashRing[ringType][ring->orientation][0].variant;
    ring->spriteA.graphics.dest
        = VramMalloc(sAnimInfoDashRing[ringType][ring->orientation][0].tileCount);
    ring->spriteA.unk10 |= sAnimInfoDashRing[ringType][ring->orientation][0].unk6;

    ring->spriteA.unk1A = 0x480;
    ring->spriteA.graphics.size = 0;
    ring->spriteA.unk14 = 0;
    ring->spriteA.unk1C = 0;

    ring->spriteB.unk21 = -1;
    ring->spriteB.unk22 = 0x10;
    ring->spriteB.focused = 0;
    ring->spriteB.unk28->unk0 = -1;
    ring->spriteB.unk10 = 0x2000;
    ring->spriteB.graphics.anim = sAnimInfoDashRing[ringType][ring->orientation][1].anim;
    ring->spriteB.variant = sAnimInfoDashRing[ringType][ring->orientation][1].variant;
    ring->spriteB.graphics.dest
        = VramMalloc(sAnimInfoDashRing[ringType][ring->orientation][1].tileCount);
    ring->spriteB.unk10 |= sAnimInfoDashRing[ringType][ring->orientation][1].unk6;

    sub_8074C20(ring);
    sub_8004558(&ring->spriteA);
    sub_8004558(&ring->spriteB);

    SET_SPRITE_INITIALIZED(ia);

    ring->unk60.anim = sUnknown_080DFB90[ring->orientation][0];
    ring->unk60.variant = sUnknown_080DFB90[ring->orientation][1];
    ring->unk60.tileCount = sUnknown_080DFB90[ring->orientation][2];
    ring->unk60.unk6 = sUnknown_080DFB90[ring->orientation][3];
    ring->unk60.unk8 = sUnknown_080DFB90[ring->orientation][4];
    ring->unk60.unkA = sUnknown_080DFB90[ring->orientation][5];
}
END_NONMATCH

void DR_SetPlayerSpeedAndDir(Sprite_DashRing *ring)
{
    gPlayer.unk6D = 0x18;

    // NOTE: This doesn't take the sprite offset, is it a bug?
    gPlayer.x = SpriteGetScreenPos(0, ring->posX);
    gPlayer.y = SpriteGetScreenPos(0, ring->posY);
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
    gCurTask->main = Task_8074BBC;
}

#if 0
bool32 sub_8074AC8(Sprite_DashRing *ring) {
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        return TRUE;
    }

    // _08074AE4
}
#endif
