#ifndef GUARD_STAGE_PLAYER_H
#define GUARD_STAGE_PLAYER_H

#include "sakit/player.h"

void Player_SetMovestate_IsInScriptedSequence(void);
void Player_ClearMovestate_IsInScriptedSequence(void);

void InitializePlayer(Player *p);
void sub_80218E4(Player *);
void sub_8023B5C(Player *, s8);
void sub_8023260(Player *);
void sub_80232D0(Player *);
void sub_8023610(Player *);

extern const u16 gUnknown_080D6736[][2];

#endif // GUARD_STAGE_PLAYER_H
