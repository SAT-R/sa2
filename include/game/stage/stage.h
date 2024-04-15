#ifndef GUARD_STAGE_H
#define GUARD_STAGE_H

#include "global.h"
#include "core.h"
#include "constants/zones.h"

extern const s16 gSpawnPositions[NUM_LEVEL_IDS][2];
extern const u32 gUnknown_080D63FC[NUM_LEVEL_IDS][2];
extern const u16 sAnimData_StageGoalScoreBonus[5][3];

void ApplyGameStageSettings(void);
void GameStageStart(void);
void CreateGameStage(void);

// Both death related
void sub_801B6B4(void);
void sub_801AE48(void);

extern struct Task *gGameStageTask;

#endif // GUARD_STAGE_H