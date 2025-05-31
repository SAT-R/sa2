#ifndef GUARD_MULTIPLAYER_MP_PLAYER_H
#define GUARD_MULTIPLAYER_MP_PLAYER_H

#include "global.h"
#include "sprite.h"

typedef struct {
    // TODO: Verify that this is Sprite!
    //       (Used in Task_Item_Invincibility @ 0x0802AC60)
    Sprite s;
    Hitbox reserved;

    SpriteTransform transform;
    s32 unk44;
    s32 unk48;
    u32 unk4C;
    Vec2_16 pos;
    u16 unk54;
    u8 unk56;
    u8 unk57;
    u8 unk58[4];
    u32 unk5C; // flags?
    u8 unk60;
    u8 unk61;
    u16 unk62;
    u8 unk64;
    s16 unk66;
    s16 unk68;
    u16 unk6A;
} MultiplayerPlayer; /* size: 0x6C */

void CreateMultiplayerPlayer(u8);

void sub_8018818(void);

extern bool8 gShouldSpawnMPAttack2Effect;

#if COLLECT_RINGS_ROM
extern const u16 gUnknown_02015B18[];
#endif

#endif
