#ifndef GUARD_WATER_EFFECT_H
#define GUARD_WATER_EFFECT_H

#include "core.h"

#if (GAME == GAME_SA1)
#define HAS_RUN_ON_WATER FALSE
#elif (GAME >= GAME_SA2)
#define HAS_RUN_ON_WATER TRUE
#endif

#ifdef M2C
// M2C: Empty structs are not supported.
#else
// Additional "palette memory". Statically alloced in SA1!
typedef struct WaterData {
#if (GAME >= GAME_SA2)
    ColorRaw pal[32][16];
#endif
} WaterData;
#endif

typedef struct {
#if (GAME == GAME_SA1)
#ifdef BUG_FIX
    /* 0x00 */ bool8 isActive;
#endif
    /* 0x00 */ int_vcount SA2_LABEL(unk1);
    /* 0x01 */ int_vcount SA2_LABEL(unk2);
#elif (GAME >= GAME_SA2)
    /* 0x00 */ bool8 isActive;
    /* 0x00 */ int_vcount SA2_LABEL(unk1);
    /* 0x01 */ int_vcount SA2_LABEL(unk2);
    /* 0x03 */ int_vcount SA2_LABEL(unk3);
#endif
    /* 0x02|0x04 */ s16 currentWaterLevel;
    /* 0x04|0x06 */ s16 targetWaterLevel;
    /* 0x08|0x08 */ u32 flags;
    /* 0x0C|0x0C */ u32 blendColors;
    /* 0x10 */ struct Task *t; /* -> WaterData |  size: SA1: 0x00, SA2: 0x400, SA3: *unused* */
    /* 0x14 */ Sprite s;
#if (GAME == GAME_SA3)
    /* 0x3C */ WaterData wd;
#endif
} Water;

extern Water gWater;

#if (GAME == GAME_SA2)
void InitWaterPalettes(void);
#endif

#if (HAS_RUN_ON_WATER)
void CreateRunOnWaterEffect(void);
#endif // HAS_RUN_ON_WATER

struct Task *CreateWaterfallSurfaceHitEffect(s32 x, s32 y);
void LoadPalette423Anim(void);

#endif // GUARD_WATER_EFFECT_H
