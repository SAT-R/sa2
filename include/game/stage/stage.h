#ifndef GUARD_STAGE_H
#define GUARD_STAGE_H

#include "global.h"
#include "core.h"
#include "constants/zones.h"

extern const s16 gSpawnPositions[NUM_LEVEL_IDS][2];
extern const u32 gUnknown_080D63FC[NUM_LEVEL_IDS][2];
extern const Collision *const gCollisionTable[];
extern const u16 sAnimData_StageGoalScoreBonus[5][3];

void ApplyGameStageSettings(void);
void GameStageStart(void);
void CreateGameStage(void);

struct Backgrounds {
    Background unk0;
    Background unk40;
    Background unk80;
    Background unkC0;
};

extern struct Task *gGameStageTask;
extern struct Backgrounds gStageBackgroundsRam;

#endif // GUARD_STAGE_H