#ifndef GUARD_SAKIT_CAMERA_H
#define GUARD_SAKIT_CAMERA_H

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

#define TO_WORLD_POS(pos, region) ((pos)*TILE_WIDTH + (region)*CAM_REGION_WIDTH)

#define CAM_BOUND_X ((DISPLAY_WIDTH) + (CAM_REGION_WIDTH))
#define CAM_BOUND_Y ((DISPLAY_HEIGHT) + ((CAM_REGION_WIDTH) / 2))

typedef void (*BgUpdate)(s32, s32);

#define CAM_MODE_SPECTATOR 4

// NOTE: This was copy-pasted from SA2.
//       There are type differences for members
typedef struct Camera {
    /* 0x00|0x04 */ CamCoord x;
    /* 0x02|0x04 */ CamCoord y;
#if (GAME == GAME_SA1)
    u8 filler4[0x2C];
    /* 0x30 */ struct Task *movementTask;
    /* 0x34 */ s16 shakeOffsetX;
    /* 0x36 */ s16 shakeOffsetY;
#elif (GAME == GAME_SA2)
    /* 0x08 */ s32 unk8;
    /* 0x0C */ s32 unkC;
    /* 0x10 */ s32 unk10;
    /* 0x14 */ s32 unk14;
    /* 0x18 */ s32 shiftX;
    /* 0x1C */ s32 shiftY;
    /* 0x20 */ s32 unk20;
    /* 0x24 */ s32 unk24;

    // TODO: Why are X/Y swapped?
    //       Did they make this a matrix or sth.?
    //       (Used to calc min/max cam pos in UpdateCamera())
    /* 0x28 */ s32 minY;
    /* 0x2c */ s32 maxY;
    /* 0x30 */ s32 minX;
    /* 0x34 */ s32 maxX;

    /* 0x38 */ s32 dx;
    /* 0x3c */ s32 dy;
    /* 0x40 */ s16 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s32 unk48;
    /* 0x4c */ s32 unk4C;

    // 0x4 = spectator
    // mode
    /* 0x50 */ u16 unk50;

    /* 0x52 */ u16 unk52;
    /* 0x54 */ u16 unk54;
    /* 0x56 */ s16 unk56;
    /* 0x58 */ BgUpdate fnBgUpdate;
    /* 0x5C */ struct Task *movementTask;
    /* 0x60 */ s16 shakeOffsetX;
    /* 0x62 */ s16 shakeOffsetY;
    /* 0x64 */ s16 unk64;
    /* 0x66 */ u8 spectatorTarget;
#endif
} Camera; /* size 0x80(in SA2) */

extern struct Camera gCamera;

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

#endif // GUARD_SAKIT_CAMERA_H
