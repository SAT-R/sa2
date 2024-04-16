#ifndef GUARD_STAGE_PLAYER_H
#define GUARD_STAGE_PLAYER_H

#include "sakit/player.h"

void InitializePlayer(Player *p);
void sub_80218E4(Player *);
void sub_8023B5C(Player *, s8);
void sub_8023260(Player *);
s32 sub_802195C(Player *p, u8 *p1, s32 *out);
s32 sub_8021A34(Player *p, u8 *p1, s32 *out);
s32 sub_8021B08(Player *p, u8 *p1, s32 *out);

void Player_SetMovestate_IsInScriptedSequence(void);
void Player_ClearMovestate_IsInScriptedSequence(void);

extern const u16 gUnknown_080D6736[][2];

#endif // GUARD_STAGE_PLAYER_H
