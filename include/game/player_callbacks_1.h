#ifndef GUARD_PLAYER_CALLBACKS_1_H
#define GUARD_PLAYER_CALLBACKS_1_H

#include "game/game.h"

/* TODO: Cleanup! Make sure all the types are accurate! */

// Actual type of 'type8029A28' currently unknown, rename once it is
typedef s32 type8029A28;

extern type8029A28 sub_802195C(Player *player, u8 *p1, type8029A28 *out);
extern type8029A28 sub_8021A34(Player *player, u8 *p1, type8029A28 *out);
extern type8029A28 sub_8021B08(Player *player, u8 *p1, type8029A28 *out);

type8029A28 sub_8029A28(Player *player, u8 *p1, type8029A28 *out);
type8029A28 sub_8029A74(Player *player, u8 *p1, type8029A28 *out);

s32 sub_8029B88(Player *player, u8 *p1, int *out);
s32 sub_8029AC0(Player *player, u8 *p1, s32 *out);
s32 sub_8029B0C(Player *player, u8 *p1, s32 *out);

extern void PlayerCB_801225C(Player *p);
extern void PlayerCB_8025318(Player *p);
extern void PlayerCB_8025A0C(Player *p);
extern void PlayerCB_Jump(Player *p);
extern void PlayerCB_8025F84(Player *p);
extern void PlayerCB_8026060(Player *p);
extern void PlayerCB_802611C(Player *p);
extern void PlayerCB_80261D8(Player *p);
extern void PlayerCB_8026764(Player *p);
extern void PlayerCB_80269C0(Player *p);
extern void PlayerCB_8026A4C(Player *p);
extern void PlayerCB_8026E24(Player *p);
extern void PlayerCB_8026F10(Player *p);
extern void PlayerCB_8026FC8(Player *p);
extern void PlayerCB_8027114(Player *p);
extern void PlayerCB_8027250(Player *p);
extern void PlayerCB_80273D0(Player *p);
extern void sub_8027EF0(Player *p);
extern void sub_8028204(Player *p);
extern void sub_80282EC(Player *p);
extern void sub_80283C4(Player *p);
extern void PlayerCB_8028D74(Player *p);
extern void PlayerCB_TouchNormalSpring(Player *p);
extern void PlayerCB_8029158(Player *p);
extern void sub_8029C84(Player *p);
extern void sub_8029FA4(Player *p);
extern void PlayerCB_802A258(Player *p);
extern void PlayerCB_802A300(Player *p);

void sub_802A018(void);

#endif // GUARD_PLAYER_CALLBACKS_1_H
