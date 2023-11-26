#ifndef GUARD_CHEESE_H
#define GUARD_CHEESE_H

#include "global.h"
#include "core.h"

#include "sakit/globals.h"

#include "game/stage/player.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;

    /* 0x08 */ s8 unk8;
    /* 0x09 */ s8 unk9;
    /* 0x0C */ s16 unkA;
    /* 0x0C */ s16 unkC;
    /* 0x0E */ s16 unkE;
    /* 0x10 */ u16 unk10;
    /* 0x12 */ s16 unk12;
    /* 0x14 */ s32 filler14;
    /* 0x18 */ s32 filler18;

    // Following here might be a Sprite (incl. unk4C-unk53)?
    /* 0x1C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
    /* 0x44 */ u8 filler44[24];
    /* 0x6C */ struct MultiplayerPlayer *unk6C;
} Cheese; /* size: 0x70 */

extern Cheese *gCheese;

void CreateCheese(Player *);

#endif // GUARD_CHEESE_H
