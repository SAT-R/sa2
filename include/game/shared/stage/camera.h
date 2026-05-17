#ifndef GUARD_GAME_STAGE_CAMERA_H
#define GUARD_GAME_STAGE_CAMERA_H

#include "global.h"
#include "core.h"
#include "tilemap.h"

#if (GAME == GAME_SA1)
typedef s16 CamCoord;
#else
typedef s32 CamCoord;
#endif

#define TILE_WIDTH              8
#define CAM_REGION_WIDTH        256
#define TILES_PER_METATILE_AXIS 12
#define METATILE_DIM            (TILES_PER_METATILE_AXIS * TILE_WIDTH)

#define TO_WORLD_POS(pos, region)     ((pos)*TILE_WIDTH + (region)*CAM_REGION_WIDTH)
#define TO_WORLD_POS_INV(pos, region) ((region)*CAM_REGION_WIDTH + (pos)*TILE_WIDTH)

#define TO_REGION(pos) ((pos) >> 8)

#define CAM_BOUND_X ((DISPLAY_WIDTH) + (CAM_REGION_WIDTH))
#define CAM_BOUND_Y ((DISPLAY_HEIGHT) + ((CAM_REGION_WIDTH) / 2))

typedef void (*BgUpdate)(s32, s32);

#define CAM_MODE_SPECTATOR 4

// NOTE: This was copy-pasted from SA2.
//       There are type differences for members
typedef struct {
    /* 0x00|0x04 */ CamCoord x; // TODO: might this be unsigned actually?
    /* 0x02|0x04 */ CamCoord y; // TODO: might this be unsigned actually?
    /* 0x04 */ CamCoord SA2_LABEL(unk8);
    /* 0x06 */ CamCoord SA2_LABEL(unkC);
    /* 0x08 */ CamCoord SA2_LABEL(unk10);
    /* 0x0A */ CamCoord SA2_LABEL(unk14);
    /* 0x18 */ CamCoord shiftX;
    /* 0x1C */ CamCoord shiftY;
    /* 0x20 */ CamCoord SA2_LABEL(unk20);
    /* 0x12 */ CamCoord SA2_LABEL(unk24);
    // TODO: Why are X/Y swapped?
    //       Did they make this a matrix or sth.?
    //       (Used to calc min/max cam pos in UpdateCamera())
    /* 0x28 */ CamCoord minY;
    /* 0x2c */ CamCoord maxY;
    /* 0x30 */ CamCoord minX;
    /* 0x34 */ CamCoord maxX;
#if (GAME == GAME_SA2)
    /* 0x38 */ CamCoord dx;
    /* 0x3c */ CamCoord dy;
#endif
    /* 0x1C */ s16 SA2_LABEL(unk40);
    /* 0x1E */ CamCoord SA2_LABEL(unk44);
    /* 0x20 */ CamCoord SA2_LABEL(unk48);
    /* 0x22 */ CamCoord SA2_LABEL(unk4C);
#if (GAME == GAME_SA1)
    /* 0x24 */ u16 unk24;
#endif
    // 0x4 = spectator
    // mode
    /* 0x26 */ u16 SA2_LABEL(unk50);
    /* 0x28 */ u16 SA2_LABEL(unk52);
    /* 0x2A */ u16 SA2_LABEL(unk54);
#if (GAME == GAME_SA2)
    /* 0x56 */ s16 unk56;
#endif
    /* 0x2C */ BgUpdate fnBgUpdate;
    /* 0x30 */ struct Task *movementTask;
    /* 0x34 */ s16 shakeOffsetX;
    /* 0x36 */ s16 shakeOffsetY;
    /* 0x38 */ s16 SA2_LABEL(unk64);
    /* 0x3A */ u8 spectatorTarget;
} Camera; /* size 0x80(in SA2) */

extern Camera gCamera;

// TODO: Merge all these into one!
#define IS_OUT_OF_RANGE_2(x, y, radiusX, radiusY)                                                                                          \
    ((x < -(radiusX)) || (x > DISPLAY_WIDTH + (radiusX)) || (y < -(radiusY)) || (y > DISPLAY_HEIGHT + (radiusY)))

// No idea on this one
#define IS_OUT_OF_RANGE_3(x, y, radiusX, radiusY)                                                                                          \
    ((x < -(radiusX)) || (x > DISPLAY_WIDTH + (radiusX)) || ((y) + (radiusY) < 0) || (y > DISPLAY_HEIGHT + (radiusY)))

// TODO: Merge all these into one!
#define IS_OUT_OF_RANGE_(UNUSED, x, y, radius) IS_OUT_OF_RANGE_2(x, y, radius, radius)

#define IS_OUT_OF_RANGE_OLD(castType, x, y, dim)                                                                                           \
    (((castType)(x + (dim / 2)) > DISPLAY_WIDTH + dim) || (y + (dim / 2) < 0) || (y > DISPLAY_HEIGHT + (dim / 2)))

#define IS_OUT_OF_RANGE IS_OUT_OF_RANGE_OLD

// @NOTE/INVESTIGATE: Some places match with u16, some with u32,
// but u16 is more common, so it's the default.
#define IS_OUT_OF_CAM_RANGE(_x, _y)                 IS_OUT_OF_RANGE(u16, _x, _y, CAM_REGION_WIDTH)
#define IS_OUT_OF_CAM_RANGE_TYPED(castType, _x, _y) IS_OUT_OF_RANGE(castType, _x, _y, CAM_REGION_WIDTH)

// TODO: Remove macro and replace calls of it with 'IS_OUT_OF_RANGE' once rewritten.
#define IS_OUT_OF_CAM_RANGE_2(x, y) IS_OUT_OF_RANGE_(u16, x, y, (CAM_REGION_WIDTH / 2))

#define IS_OUT_OF_DISPLAY_RANGE(_x, _y)                                                                                                    \
    ((_x) > gCamera.x + (DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)) || (_x) < gCamera.x - (CAM_REGION_WIDTH / 2)                              \
     || (_y) > gCamera.y + CAM_BOUND_Y || (_y) < gCamera.y - (CAM_REGION_WIDTH / 2))

#define IS_OUT_OF_LOOP_TRIGGER_RANGE(x, y) IS_OUT_OF_RANGE_3(x, y, (CAM_REGION_WIDTH / 2), (CAM_REGION_WIDTH / 2))

#define CAMBG_MAP_FRONT_LAYER 0
#define CAMBG_MAP_BACK_LAYER  1
#define CAMBG_BACK_A_LAYER    2
#define CAMBG_BACK_B_LAYER    3

#if !WIDESCREEN_HACK
#define CAM_SCREENBASE_BACK_A    28
#define CAM_SCREENBASE_BACK_B    29
#define CAM_SCREENBASE_BACK_C    26
#define CAM_SCREENBASE_MAP_FRONT 30
#define CAM_SCREENBASE_MAP_BACK  31
#else
#define CAM_SCREENBASE_BACK_A    48
#define CAM_SCREENBASE_BACK_B    50
#define CAM_SCREENBASE_BACK_C    58
#define CAM_SCREENBASE_MAP_FRONT 52
#define CAM_SCREENBASE_MAP_BACK  56
#endif

typedef struct {
    Background unk0;
    Background unk40;
    Background unk80;
    Background unkC0;
} StageBackgrounds;

extern const Background gStageCameraBgTemplates[4];

void InitCamera(u32);
void UpdateCamera(void);
void DestroyCameraMovementTask(void);

// TODO: move to camera_hblank_callbacks.c
#if (GAME == GAME_SA2)
void HBlankCB_801E454(int_vcount vcount);
void sub_801E3F0(void);
void HBlankCB_801E434(int_vcount vcount);
void nullsub_801E494(void);
void HBlankCB_BgUpdateZone5ActBoss(int_vcount vcount);
void HBlankCB_BgUpdateZoneFinalActXX(int_vcount vcount);
#endif

extern const u16 gBossCameraYClamps[][2];
extern StageBackgrounds gStageBackgroundsRam;

#endif // GUARD_GAME_STAGE_CAMERA_H
