#ifndef GUARD_player_callbacks_H
#define GUARD_player_callbacks_H

#include "core.h"
#include "sakit/player.h"

struct Task *sub_8011B88(s32 x, s32 y, u16 p2);
void Player_InitAttack_Sonic(Player *);
void Player_SonicAmy_InitStopNSlam(Player *);
void sub_8012194(Player *);
bool32 sub_801251C(Player *);
void sub_8012644(Player *);
void Player_Cream_InitChaoRollingAttack(Player *);
void Player_Cream_InitChaoAttack(Player *);
void Player_InitAttack_Cream_ChaoAttack(Player *);
void Player_InitAttack_Cream_StepAttack(Player *);
void sub_8012BC0(Player *);
void Player_InitAttack_Tails(Player *);
void Player_InitAttack_Knuckles_Punch(Player *);
void Player_InitAttack_Knuckles_SpiralAttack(Player *);
void sub_8013AD8(Player *);
void Player_Knuckles_InitDrillClaw(Player *);
void Player_InitAttack_Amy_HammerAttack(Player *);
void PlayerCB_801225C(Player *p);
void Player_UpdateHomingPosition(s32, s32);

#endif // GUARD_player_callbacks_H
