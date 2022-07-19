#ifndef GUARD_GAME_H
#define GUARD_GAME_H

#define GAME_MODE_SINGLE_PLAYER 0
#define GAME_MODE_TIME_ATTACK 1

// May be multiplayer time attack
#define GAME_MODE_MULTI_PLAYER 3

#include "global.h"

extern u8 gDemoPlayCounter;
extern u8 gGameMode;

extern u8 gCurrentLevel;
extern u8 gSelectedCharacter;

// Possibly CreateGameStageAtSelectedCourse
void sub_801A770(void);

#endif // GUARD_GAME_H
