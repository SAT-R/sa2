#ifndef GUARD_GAME_OVER_H
#define GUARD_GAME_OVER_H

#include "global.h"

enum ELostLifeCause {
    OVER_CAUSE_ZERO_LIVES = 0x1,
    OVER_CAUSE_TIME_UP = 0x2,
};

#ifndef NON_MATCHING
typedef u8 LostLifeCause;
#else
typedef enum ELostLifeCause LostLifeCause;
#endif

void CreateGameOverScreen(LostLifeCause lostLifeCause);

#endif
