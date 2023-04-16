#ifndef GUARD_PLAYER_CALLBACKS_1_H
#define GUARD_PLAYER_CALLBACKS_1_H

/* TODO: Cleanup! Make sure all the types are accurate! */

// Actual type of 'type8029A28' currently unknown, rename once it is
typedef s32 type8029A28;

extern type8029A28 sub_802195C(Player *player, u8 *p1, type8029A28 *out);
extern type8029A28 sub_8021A34(Player *player, u8 *p1, type8029A28 *out);
extern type8029A28 sub_8021B08(Player *player, u8 *p1, type8029A28 *out);

type8029A28 sub_8029A28(Player *player, u8 *p1, type8029A28 *out);
type8029A28 sub_8029A74(Player *player, u8 *p1, type8029A28 *out);

typedef s32 (*Func_801EE64)(s32, s32, u32, void *);
s32 sub_801EE64(s32, s32, u32, void *);
s32 sub_801E4E4(s32, s32, u32, s32, void *, Func_801EE64);

s32 sub_801E6D4(s32, s32, u32, void *);

#endif // GUARD_PLAYER_CALLBACKS_1_H
