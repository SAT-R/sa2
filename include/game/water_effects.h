#ifndef GUARD_WATER_EFFECT_H
#define GUARD_WATER_EFFECT_H

#include "core.h"

typedef struct {
    u16 pal[16 * 16];
} WaterData;

// Seems to be belonging to water effect
typedef struct {
    /* 0x00 */ bool8 isActive;
    /* 0x01 */ u8 unk1;
    /* 0x01 */ u8 unk2;
    /* 0x01 */ u8 unk3;
    /* 0x04 */ s16 currentWaterLevel;
    /* 0x06 */ s16 targetWaterLevel;
    /* 0x08 */ u32 unk8;
    /* 0x0C */ u32 mask;

    // t -> u16 palette[16*16] (additional "palette memory" for GUI stuff?)
    /* 0x10 */ struct Task *t; /* size: 0x400 */
    /* 0x14 */ Sprite s;
} Water;

extern Water gWater;

extern void sub_8011328(void);
extern void CreateRunOnWaterEffect(void);
extern struct Task *CreateWaterfallSurfaceHitEffect(s32 x, s32 y);

#endif // GUARD_WATER_EFFECT_H
