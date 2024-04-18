#ifndef GUARD_PLAYER_ACTIONS_H
#define GUARD_PLAYER_ACTIONS_H

#include "global.h"
#include "sprite.h"
#include "constants/characters.h"

void sub_801561C(void);
void sub_8015750(void);
void GetPreviousPlayerPos(Vec2_32 *pos, u8 pastFrameDelta);
void sub_801583C(void);
void sub_8015790(void);
void sub_80156D0(void);

extern const AnimId sCharacterPalettesBoostEffect[NUM_CHARACTERS];

#endif // GUARD_PLAYER_ACTIONS_H
