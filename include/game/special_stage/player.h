#ifndef GUARD_SPECIAL_STAGE_PLAYER_H
#define GUARD_SPECIAL_STAGE_PLAYER_H

#include "global.h"
#include "game/special_stage/main.h"
#include "game/special_stage/data.h"

// Player
struct SpecialStagePlayer {
    struct SpecialStage *unk0;
    void *unk4;
    Sprite unk8;
    Sprite unk38;
    Sprite roboArrow;

    // vram stuff
    void *unk98;
    void *unk9C;
    void *unkA0;

    s16 animSpeed;
    u8 unkA6;

    // x and y may be flipped
    s32 q16WorldX;
    s32 q16WorldY;

    s16 unkB0;
    s16 bearing;

    u16 state;
    s16 unkB6;

    s16 unkB8;

    s16 unkBA;

    s16 unkBC;
    s16 unkBE;

    s16 multiplier;
    u16 unkC2;

    const struct UNK_80DF670 *sprites;

    s32 speed;
    u32 rotateSpeed;
    u32 q16SpeedX;
    u32 q16SpeedY;
    u32 acceleration;

    s32 coastResistence;
    s32 deceleration;
    s32 maxSpeed;
    u32 unkE8;

    u16 unkEC;
    u16 unkEE;
    s16 unkF0;
    s16 unkF2;
    s16 unkF4;
    s16 unkF6;
    s16 unkF8;
    s16 unkFA;
    s16 unkFC;
    s16 unkFE;
    s32 unk100;
    s32 unk104;
}; /* size 0x108 */

struct Task *CreateSpecialStagePlayer(struct SpecialStage *);

#endif
