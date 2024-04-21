#ifndef GUARD_STAGE_H
#define GUARD_STAGE_H

#include "global.h"
#include "core.h"
#include "constants/zones.h"

void ApplyGameStageSettings(void);
void GameStageStart(void);
void CreateGameStage(void);

// Both death related
void sub_801B6B4(void);
void sub_801AE48(void);

extern struct Task *gGameStageTask;

#endif // GUARD_STAGE_H