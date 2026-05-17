#ifndef GUARD_SA2_RINGS_SCATTER_H
#define GUARD_SA2_RINGS_SCATTER_H

#include "core.h"

#if (GAME == GAME_SA1)
#define MAX_SCATTERING_RINGS_COUNT_SP 48
#define MAX_SCATTERING_RINGS_COUNT_MP 32
#elif (GAME == GAME_SA2)
#define MAX_SCATTERING_RINGS_COUNT_SP 32
#define MAX_SCATTERING_RINGS_COUNT_MP 16
#endif

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s16 velX;
    /* 0x0A */ s16 velY;
    /* 0x0C */ u16 unkC;
    /* 0x0E */ s16 unkE;
#if (GAME == GAME_SA2)
    /* 0x10 */ u16 unk10;
#endif
} ScatterRing; /* size: 0x14 */

typedef struct {
    /* 0x000|0x000 */ Sprite sprRing;
    /* 0x030|0x030 */ ScatterRing rings[MAX_SCATTERING_RINGS_COUNT_SP];
    /* 0x330|0x2B0 */ u32 SA2_LABEL(unk2B0);
    /* 0x334|0x2B4 */ u16 SA2_LABEL(unk2B4);
    /* 0x336|0x2B6 */ u16 SA2_LABEL(unk2B6);
} RingsScatter; /* size: 0x2B8 */

extern Task *gRingsScatterTask; // -> RingsScatter

void InitPlayerHitRingsScatter(void);
void DestroyRingsScatterTask(void);

void InitScatteringRings(s32 x, s32 y, s32 numRings);

#if (GAME == GAME_SA1)
void InitScatteringRings_ExtraBossCapsule(s32 x, s32 y, s32 numRings);
#endif

#endif // GUARD_SA2_RINGS_SCATTER_H
