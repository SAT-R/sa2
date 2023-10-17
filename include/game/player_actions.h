#ifndef GUARD_PLAYER_ACTIONS_H
#define GUARD_PLAYER_ACTIONS_H

void sub_801561C(void);
void sub_8015750(void);
void GetPreviousPlayerPos(Vec2_32 *pos, u8 pastFrameDelta);
void sub_801583C(void);

extern AnimId sCharacterPalettesBoostEffect[NUM_CHARACTERS];
extern bool8 gUnknown_030055BC;

#endif // GUARD_PLAYER_ACTIONS_H
