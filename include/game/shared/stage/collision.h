#ifndef GUARD_STAGE_ENTITIES_0_H
#define GUARD_STAGE_ENTITIES_0_H

#include "core.h"
#include "rect.h"
#include "game/shared/stage/camera.h" // for CamCoord
#include "game/shared/stage/player.h"

#define COLL_NONE        0
#define COLL_FLAG_1      0x00000001
#define COLL_FLAG_2      0x00000002
#define COLL_FLAG_4      0x00000004
#define COLL_FLAG_8      0x00000008
#define COLL_FLAG_10     0x00000010
#define COLL_FLAG_20     0x00000020
#define COLL_FLAG_40     0x00000040
#define COLL_FLAG_80     0x00000080
#define COLL_FLAG_10000  0x00010000
#define COLL_FLAG_20000  0x00020000
#define COLL_FLAG_40000  0x00040000
#define COLL_FLAG_80000  0x00080000
#define COLL_FLAG_100000 0x00100000

// TODO: Ensure these are correct!
typedef enum EHit {
    HIT_NONE = 0,
    HIT_ENEMY = 1,
    HIT_PLAYER = 2,
} EHit;

u32 Coll_Player_Entity_RectIntersection(Sprite *s, CamCoord sx, CamCoord sy, Player *p, Rect8 *rectPlayer);

// TODO: Include header this belongs to
#if (GAME == GAME_SA1)
u32 Coll_Player_Itembox(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p);
#else
u32 Coll_Player_ItemBox(Sprite *, s32, s32);
#endif

#if (GAME == GAME_SA2)
bool32 Coll_Player_Entity_HitboxN(Sprite *, s32, s32, s16, Player *, s16);
bool32 Coll_Player_Boss_Attack(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p);
bool32 Coll_Player_Enemy(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p);
bool32 Coll_Cheese_Enemy_Attack(Sprite *sprTarget, s32 sx, s32 sy, s16 hbIndex, Player *p);
u32 sub_800CDBC(Sprite *, s32, s32, Player *);
#endif

u32 SA2_LABEL(sub_800DA4C)(Sprite *opponent, s16 oppX, s16 oppY, UNUSED s32 param3, UNUSED s32 param4, u8 layer);

#if (GAME == GAME_SA1)
u32 Coll_Player_SkatingStone(Sprite *, CamCoord x, CamCoord y, Player *);
u32 Coll_Player_Gate(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p, u32 param4);
u32 sub_800C394(Sprite *s, CamCoord screenX, CamCoord screenY, Player *p);
u32 Coll_Player_Spring_Sideways(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p);
u32 Coll_Player_PlatformCrumbling(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p);
u32 sub_800C1E8(Sprite *inSprite, Rect8 rectB, s16 sx, s16 sy, Player *p);
EHit sub_800C2B8(Sprite *s, s16 sx, s16 sy, Player *p);
bool32 sub_800C934(Sprite *s, s32 x, s32 y, Rect8 *rectPlayer, u32 UNUSED param4, Player *p, u32 *moveState);
bool32 sub_800CBBC(Sprite *s, s32 x, s32 y, Rect8 *rectPlayer, u32 UNUSED param4, Player *p, u32 *param6);
u32 sub_800CCB8(Sprite *, s32 x, s32 y, Player *);
EHit Coll_Player_Enemy(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p);
EHit Coll_Player_Boss_1(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p);
EHit Coll_Player_Bosses_2_6(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p);
EHit sub_800BF10(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p);
EHit sub_800BFEC(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p);
u32 sub_800C0E0(Sprite *s, CamCoord screenX, CamCoord screenY, Player *p);
#endif

u32 Coll_Player_Entity_Intersection(Sprite *s, CamCoord x, CamCoord y, Player *p);
u32 Coll_Player_Interactable(Sprite *s, CamCoord sx, CamCoord sy, Player *p);

bool32 Coll_DamagePlayer(Player *);
void Coll_Player_Enemy_AdjustSpeed(Player *);

u32 Coll_Player_Platform(Sprite *, CamCoord x, CamCoord y, Player *);

#if (GAME == GAME_SA1)
bool32 Coll_AmyHammer_Spring(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p);
#endif

bool32 SA2_LABEL(sub_800DD54)(Player *p);
bool32 SA2_LABEL(sub_800DE44)(Player *p);
u32 SA2_LABEL(sub_800D0A0)(Sprite *s, s16 worldX, s16 worldY, s16 qSpeedX, s16 qSpeedY, u8 layer, u32 arg6);

#if (GAME == GAME_SA1)
bool32 Coll_Player_Enemy_Attack(Sprite *s, CamCoord worldX, CamCoord worldY);
#elif (GAME == GAME_SA2)
bool32 Coll_Player_Enemy_Attack(Sprite *s, CamCoord worldX, CamCoord worldY, u8 hbIndex);
#endif

bool32 Coll_Player_Projectile(Sprite *, CamCoord, CamCoord);

#if (GAME == GAME_SA1)
s32 sub_80097E4(Sprite *s, CamCoord x, CamCoord y, s16 qSpeedX, s16 qSpeedY, u8 layer, u8 arg6);
#endif

#endif // GUARD_STAGE_ENTITIES_0_H
