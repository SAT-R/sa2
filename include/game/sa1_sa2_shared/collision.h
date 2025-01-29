#ifndef GUARD_STAGE_ENTITIES_0_H
#define GUARD_STAGE_ENTITIES_0_H

#include "core.h"
#include "rect.h"
#include "game/sa1_sa2_shared/player.h"

#define COLL_NONE        0
#define COLL_FLAG_1      0x00000001
#define COLL_FLAG_2      0x00000002
#define COLL_FLAG_4      0x00000004
#define COLL_FLAG_8      0x00000008
#define COLL_FLAG_10000  0x00010000
#define COLL_FLAG_20000  0x00020000
#define COLL_FLAG_40000  0x00040000
#define COLL_FLAG_80000  0x00080000
#define COLL_FLAG_100000 0x00100000

u32 CheckRectCollision_SpritePlayer(Sprite *s, s32 sx, s32 sy, Player *p, Rect8 *rectPlayer);

// TODO: Include header this belongs to
u32 sub_800C944(Sprite *, s32, s32);

bool32 sub_800C204(Sprite *, s32, s32, s16, Player *, s16);
bool32 sub_800C320(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p);
bool32 sub_800CA20(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p);
bool32 IsColliding_Cheese(Sprite *sprTarget, s32 sx, s32 sy, s16 hbIndex, Player *p);
u32 sub_800DA4C(Sprite *opponent, s16 oppX, s16 oppY, UNUSED s32 param3, UNUSED s32 param4, u8 layer);

// Lose rings?
bool32 sub_800CBA4(Player *);
void Collision_AdjustPlayerSpeed(Player *);

u32 sub_800CCB8(Sprite *, s32 x, s32 y, Player *);

u32 sub_800CE94(Sprite *s, s32 sx, s32 sy, Rect8 *param3, Player *p);
bool32 sub_800DD54(Player *p);
bool32 sub_800DE44(Player *p);
u32 sub_800D0A0(Sprite *, s16, s16, s16, s16, u8, u32);

// HandlePlayerDestroy?
bool32 sub_800C4FC(Sprite *, s32, s32, u8);

// HandleHitPlayer
u32 sub_800C84C(Sprite *, s32, s32);

#endif // GUARD_STAGE_ENTITIES_0_H
