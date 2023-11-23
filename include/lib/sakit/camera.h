#ifndef GUARD_SAKIT_CAMERA_H
#define GUARD_SAKIT_CAMERA_H

#include "core.h"

#define TILE_WIDTH       8
#define CAM_REGION_WIDTH 256

typedef void (*CameraMain)(s32, s32);

#define CAM_MODE_SPECTATOR 4

struct Camera {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s32 unk8;
    /* 0x0C */ s32 unkC;
    /* 0x10 */ s32 unk10;
    /* 0x14 */ s32 unk14;
    /* 0x18 */ s32 shiftX;
    /* 0x1C */ s32 shiftY;
    /* 0x20 */ s32 unk20;
    /* 0x24 */ s32 unk24;
    /* 0x28 */ s32 unk28;
    /* 0x2c */ s32 unk2C;
    /* 0x30 */ s32 unk30;
    /* 0x34 */ s32 unk34;
    /* 0x38 */ s32 unk38;
    /* 0x3c */ s32 unk3C;
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
    /* 0x58 */ CameraMain unk58;
    /* 0x5C */ struct Task *movementTask;
    /* 0x60 */ s16 unk60;
    /* 0x62 */ s16 unk62;
    /* 0x64 */ s16 unk64;
    /* 0x66 */ u8 spectatorTarget;
}; /* size 0x80 */

extern struct Camera gCamera;

#endif // GUARD_SAKIT_CAMERA_H
