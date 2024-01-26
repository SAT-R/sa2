#ifndef GUARD_PLAYER_ACTIONS_H
#define GUARD_PLAYER_ACTIONS_H

#include "game/game.h"

void sub_801561C(void);
void sub_8015750(void);
void GetPreviousPlayerPos(Vec2_32 *pos, u8 pastFrameDelta);
void sub_801583C(void);

extern const AnimId sCharacterPalettesBoostEffect[NUM_CHARACTERS];

#endif // GUARD_PLAYER_ACTIONS_H
