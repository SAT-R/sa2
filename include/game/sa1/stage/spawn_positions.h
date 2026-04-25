#ifndef GUARD_STAGE_DATA_H
#define GUARD_STAGE_DATA_H

#include "global.h"
#include "constants/sa1/zones.h"

extern const s16 gSpawnPositions[NUM_LEVEL_IDS_SP][2];
extern const s16 gSpawnPositions_Modes_4_and_5[NUM_LEVEL_IDS_MP][MULTI_SIO_PLAYERS_MAX][2];
extern const Vec2_32 gCheckpointPositions[];

#if (GAME == GAME_SA1)
extern s16 SA2_LABEL(gUnknown_080D650C)[][2];
extern s16 SA2_LABEL(gUnknown_080D661C)[][2];
#elif (GAME == GAME_SA2)
extern const s32 SA2_LABEL(gUnknown_080D650C)[][2];
extern const s32 SA2_LABEL(gUnknown_080D661C)[][2];
#endif
#endif
