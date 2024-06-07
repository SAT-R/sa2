#ifndef GUARD_CHEESE_H
#define GUARD_CHEESE_H

#include "global.h"
#include "core.h"

#include "game/multiplayer/mp_player.h"
#include "game/stage/player.h"

typedef struct {
    /* 0x54 */ s32 unk54;
    /* 0x58 */ s32 unk58;
    /* 0x5C */ s16 unk5C;
    /* 0x5E */ s16 unk5E;
    /* 0x60 */ s32 unk60;
    /* 0x64 */ u8 unk64;
    /* 0x68 */ Sprite *unk68;
} Cheese_UNK54;

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;

    /* 0x08 */ u8 unk8;
    /* 0x09 */ u8 unk9;
    /* 0x0C */ u8 unkA;
    /* 0x0C */ u16 unkC;
    /* 0x0E */ s16 unkE;
    /* 0x10 */ u16 unk10;
    /* 0x12 */ s16 unk12;
    /* 0x14 */ u32 unk14;
    /* 0x18 */ struct Task *unk18;

    // Following here might be a Sprite (incl. unk4C-unk53)?
    /* 0x1C */ Sprite s;
    /* 0x4C */ Hitbox reserved;
    /* 0x54 */ Cheese_UNK54 unk54;
    /* 0x6C */ MultiplayerPlayer *mpp;
} Cheese; /* size: 0x70 */

extern Cheese *gCheese;

void CreateCheese(Player *);

#endif // GUARD_CHEESE_H
