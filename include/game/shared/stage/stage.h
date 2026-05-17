#ifndef GUARD_STAGE_H
#define GUARD_STAGE_H

#include "global.h"
#include "core.h"

#if (GAME == GAME_SA1)
#include "constants/zones.h"
#elif (GAME == GAME_SA2)
#include "constants/zones.h"
#endif

#if (GAME == GAME_SA1)
void ApplyGameStageSettingsAndStart(void);
#elif (GAME == GAME_SA2)
void ApplyGameStageSettings(void);
void GameStageStart(void);
#endif
void CreateGameStage(void);
void GoToNextLevel(void);

void HandleLifeLost(void);
void HandleDeath(void);

extern Task *gGameStageTask;

#endif // GUARD_STAGE_H