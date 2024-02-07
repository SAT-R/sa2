#include "global.h"
#include "rect.h"
#include "sprite.h"
#include "lib/m4a.h"
#include "sakit/collision.h"
#include "sakit/player.h"
#include "game/game.h"
#include "game/multiplayer/unknown_1.h"
#include "game/parameters/characters.h"
#include "game/playerfn_cmds.h"
#include "game/rings_scatter.h"
#include "game/stage/player.h"

#include "constants/animations.h"
#include "constants/songs.h"

bool32 sub_800DD54(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return FALSE;
    }

    p->timerInvulnerability = PLAYER_INVULNERABLE_DURATION;

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->speedAirX = +Q_24_8(1.5);
    } else {
        p->speedAirX = -Q_24_8(1.5);
    }

    p->speedAirY = -Q_24_8(3.0);

    if (p->moveState & MOVESTATE_40) {
        HALVE(p->speedAirY);
        HALVE(p->speedAirX);
    }

    p->moveState &= ~MOVESTATE_8;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_4;
    p->moveState &= ~MOVESTATE_10;
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~MOVESTATE_400;
    p->moveState &= ~MOVESTATE_100;

    p->unk64 = SA2_CHAR_ANIM_20;
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk61 = 0;
    p->unk62 = 0;

    p->transition = 9;

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        struct UNK_3005510 *unk;
#ifndef NON_MATCHING
        register u32 rings asm("r4") = gRingCount;
#else
        u32 rings = gRingCount;
#endif

        if (rings > 10) {
            rings = 10;
        }

        InitScatteringRings(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y), rings);
        gRingCount -= rings;

        unk = sub_8019224();
        unk->unk0 = 4;
        unk->unk1 = rings;
    }

    m4aSongNumStart(SE_LIFE_LOST);

    return TRUE;
}

bool32 sub_800DE44(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return FALSE;
    }

    p->timerInvulnerability = PLAYER_INVULNERABLE_DURATION;

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->speedAirX = -Q_24_8(1.5);
    } else {
        p->speedAirX = +Q_24_8(1.5);
    }

    p->speedAirY = -Q_24_8(3.0);

    if (p->moveState & MOVESTATE_40) {
        HALVE(p->speedAirY);
        HALVE(p->speedAirX);
    }

    p->moveState &= ~MOVESTATE_8;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_4;
    p->moveState &= ~MOVESTATE_10;
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~MOVESTATE_400;
    p->moveState &= ~MOVESTATE_100;

    p->unk64 = SA2_CHAR_ANIM_20;
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk61 = 0;
    p->unk62 = 0;

    p->transition = 9;

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        struct UNK_3005510 *unk;
#ifndef NON_MATCHING
        register u32 rings asm("r4") = gRingCount;
#else
        u32 rings = gRingCount;
#endif

        if (rings > 5) {
            rings = 5;
        }

        InitScatteringRings(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y), rings);
        gRingCount -= rings;

        unk = sub_8019224();
        unk->unk0 = 4;
        unk->unk1 = rings;
    }

    m4aSongNumStart(SE_LIFE_LOST);

    return TRUE;
}

// TODO: This might be an inline.
//       Code identical to beginning of sub_800C060
u32 sub_800DF38(Sprite *s, s32 x, s32 y, Player *p)
{
    // TODO: Could this match with a 'struct Rect8' instead of s8[4]?
    s8 rectPlayer[4] = { -p->unk16, -p->unk17, +p->unk16, +p->unk17 };

    return CheckRectCollision_SpritePlayer(s, x, y, p, (struct Rect8 *)&rectPlayer);
}