#ifndef GUARD_PLAYER_ACTOR_H
#define GUARD_PLAYER_ACTOR_H

#include "global.h"
#include "game/game.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;

    /* 0x08 */ s32 filler8;
    /* 0x08 */ s32 fillerC;
    /* 0x08 */ s32 filler10;
    /* 0x08 */ s32 filler14;
    /* 0x08 */ s32 filler18;

    // Following here might be a Sprite (incl. unk4C-unk53)?
    /* 0x1C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
} PlayerActor; /* size: 0x70 */

extern PlayerActor *gPlayerActor;

void CreatePlayerActor(Player *);

#endif // GUARD_PLAYER_ACTOR_H
