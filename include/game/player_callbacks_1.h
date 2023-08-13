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

extern void PlayerCB_8025318(Player *p);
extern void PlayerCB_80261D8(Player *p);
extern void sub_8027EF0(Player *p);
extern void sub_8028204(Player *p);
extern void sub_80282EC(Player *p);
extern void sub_80283C4(Player *p);
extern void sub_8029C84(Player *p);
extern void sub_8029FA4(Player *p);

void sub_802A018(void);

#endif // GUARD_PLAYER_CALLBACKS_1_H
