#ifndef GUARD_player_callbacks_H
#define GUARD_player_callbacks_H

#include "core.h"
#include "sakit/player.h"

struct Task *sub_8011B88(s32 x, s32 y, u16 p2);
void sub_8011D48(Player *);
void PlayerCB_8011F1C(Player *);
void sub_8012194(Player *);
bool32 sub_801251C(Player *);
void sub_8012644(Player *);
void sub_8012888(Player *);
void sub_80128E0(Player *);
void sub_8012548(Player *);
void sub_8012830(Player *);
void sub_8012BC0(Player *);
void sub_8012D3C(Player *);
void sub_8012EEC(Player *);
void sub_8013070(Player *);
void sub_8013AD8(Player *);
void PlayerCB_8013D18(Player *);
void sub_8013F04(Player *);
void PlayerCB_801225C(Player *p);
void Player_UpdateHomingPosition(s32, s32);

#endif // GUARD_player_callbacks_H
