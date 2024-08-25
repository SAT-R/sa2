#ifndef GUARD_player_callbacks_H
#define GUARD_player_callbacks_H

#include "core.h"
#include "sakit/player.h"

struct Task *Player_Sonic_InitAttackGfxTask(s32 x, s32 y, u16 p2);
void Player_Sonic_InitAttack(Player *);
void Player_SonicAmy_InitStopNSlam(Player *);
void Player_Sonic_InitHomingAttack(Player *);
bool32 Player_Sonic_TryForwardThrust(Player *);
void sub_8012644(Player *);
void Player_Cream_InitChaoRollingAttack(Player *);
void Player_Cream_InitMidAirChaoAttack(Player *);
void Player_Cream_InitChaoAttack(Player *);
void Player_Cream_InitStepAttack(Player *);
void sub_Tails_8012BC0(Player *);
void Player_InitAttack_Tails(Player *);
void Player_Knuckles_InitPunch(Player *);
void Player_Knuckles_InitSpiralAttack(Player *);
void Player_Knuckles_InitGlide(Player *);
void Player_Knuckles_InitDrillClaw(Player *);
void Player_InitAttack_Amy_HammerAttack(Player *);
void Player_801225C(Player *p);
void Player_UpdateHomingPosition(s32, s32);

#endif // GUARD_player_callbacks_H
