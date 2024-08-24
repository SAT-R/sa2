#include "global.h"
#include "rect.h"
#include "sprite.h"

#include "lib/m4a.h"

#include "sakit/globals.h"
#include "sakit/collision.h"
#include "sakit/player.h"

#include "game/multiplayer/player_unk_1.h"
#include "game/multiplayer/mp_player.h"

#include "game/stage/rings_scatter.h"
#include "game/stage/player.h"

#include "constants/animations.h"
#include "constants/songs.h"

// TODO: Maybe wrap sub_800DD54 and sub_800DE44 in a macro(?)
u32 sub_800DA4C(Sprite *opponent, s16 oppX, s16 oppY, UNUSED s32 param3, UNUSED s32 param4, u8 layer)
{
    MultiplayerPlayer *mpp;
    Sprite *mpPlayerSprite;
    u32 res2;
    u32 result = COLL_NONE;

    Player *p = &gPlayer;
    if (!IS_ALIVE(p)) {
        return COLL_NONE;
    }

    if (p->moveState & MOVESTATE_GOAL_REACHED) {
        return COLL_NONE;
    }

    mpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
    mpPlayerSprite = &mpp->s;

    if (layer != p->layer) {
        return COLL_NONE;
    }
    // _0800DABC

    if ((p->speedAirX == 0 && p->speedAirY == 0) && HITBOX_IS_ACTIVE(opponent->hitboxes[1])) {
        if (HB_COLLISION(oppX, oppY, opponent->hitboxes[1], mpp->pos.x, mpp->pos.y, mpPlayerSprite->hitboxes[0])) {
            // _0800DB68
            result |= COLL_FLAG_2;
        }
    }
    // _0800DB70
    if (HITBOX_IS_ACTIVE(mpPlayerSprite->hitboxes[1]) && HITBOX_IS_ACTIVE(opponent->hitboxes[0])
        && HB_COLLISION(oppX, oppY, opponent->hitboxes[0], mpp->pos.x, mpp->pos.y, mpPlayerSprite->hitboxes[1])) {
        // _0800DC34
        if (mpp->pos.x > oppX) {
            result |= COLL_FLAG_40000;
        } else {
            result |= COLL_FLAG_20000;
        }
        // _0800DC66

        if (mpp->pos.y > oppY) {
            result |= COLL_FLAG_10000;
        } else {
            result |= COLL_FLAG_100000;
        }

        result |= COLL_FLAG_1;
    } else if (HITBOX_IS_ACTIVE(mpPlayerSprite->hitboxes[0]) && HITBOX_IS_ACTIVE(opponent->hitboxes[1])
               && HB_COLLISION(oppX, oppY, opponent->hitboxes[1], mpp->pos.x, mpp->pos.y, mpPlayerSprite->hitboxes[0])) {
        result |= COLL_FLAG_2;
    }

    return result;
}

bool32 sub_800DD54(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return FALSE;
    }

    p->timerInvulnerability = PLAYER_INVULNERABLE_DURATION;

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->speedAirX = +Q(1.5);
    } else {
        p->speedAirX = -Q(1.5);
    }

    p->speedAirY = -Q(3.0);

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

    p->charState = SA2_CHAR_ANIM_20;
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

        InitScatteringRings(I(p->x), I(p->y), rings);
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
        p->speedAirX = -Q(1.5);
    } else {
        p->speedAirX = +Q(1.5);
    }

    p->speedAirY = -Q(3.0);

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

    p->charState = SA2_CHAR_ANIM_20;
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

        InitScatteringRings(I(p->x), I(p->y), rings);
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
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    return CheckRectCollision_SpritePlayer(s, x, y, p, (struct Rect8 *)&rectPlayer);
}