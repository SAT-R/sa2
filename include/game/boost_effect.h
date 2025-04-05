#ifndef GUARD_PLAYER_ACTIONS_H
#define GUARD_PLAYER_ACTIONS_H

#include "global.h"
#include "sprite.h"
#include "constants/characters.h"

void sub_801561C(void);
void sub_8015750(void);
void GetPreviousPlayerPos(Vec2_32 *pos, u8 pastFrameDelta);
void CreateBoostEffectTasks(void);
void BoostEffect_StorePlayerPos(void);
void BoostEffect_StorePlayerState(void);

extern const AnimId sCharacterPalettesBoostEffect[NUM_CHARACTERS];

#endif // GUARD_PLAYER_ACTIONS_H
