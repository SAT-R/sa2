#ifndef GUARD_GAME_OVER_H
#define GUARD_GAME_OVER_H

#include "global.h"

#define GAMEOVER_CAUSE_ZERO_LIVES 0x1
#define GAMEOVER_CAUSE_TIME_UP    0x2

void CreateGameOverOrTimeOverScreen(u8 lostLifeCause);

#endif
