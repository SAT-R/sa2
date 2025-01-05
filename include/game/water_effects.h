#ifndef GUARD_WATER_EFFECT_H
#define GUARD_WATER_EFFECT_H

#include "core.h"

typedef struct {
    // TODO: this is a 2D array
    u16 pal[32][16];
} WaterData;

typedef struct {
#if (GAME == GAME_SA1)
    /* 0x00*/ u8 filler0[2];
#elif (GAME == GAME_SA2)
    /* 0x00 */ bool8 isActive;
    /* 0x01 */ u8 unk1;
    /* 0x02 */ u8 unk2;
    /* 0x03 */ u8 unk3;
#endif
    /* 0x04 */ s16 currentWaterLevel;
    /* 0x06 */ s16 targetWaterLevel;
    /* 0x08 */ u32 unk8;
    /* 0x0C */ u32 mask;

    // t -> u16 palette[16*16] (additional "palette memory" for GUI stuff?)
    /* 0x10 */ struct Task *t; /* size: 0x400 */
    /* 0x14 */ Sprite s;
} Water;

extern Water gWater;

void InitWaterPalettes(void);
void CreateRunOnWaterEffect(void);
struct Task *CreateWaterfallSurfaceHitEffect(s32 x, s32 y);

#endif // GUARD_WATER_EFFECT_H
