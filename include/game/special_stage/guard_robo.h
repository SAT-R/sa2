
#ifndef GUARD_SPECIAL_GUARD_ROBO_H
#define GUARD_SPECIAL_GUARD_ROBO_H

#include "global.h"
#include "task.h"
#include "game/special_stage/main.h"
#include "game/special_stage/data.h"

struct SpecialStageGuardRobo {
    struct SpecialStage *stage;
    Sprite sprite;
    void *vram;
    const struct UNK_80DF670 *sprites;
    s16 state;
    u8 filler3E[2];
    s32 x;
    s32 y;
    u16 bearing;
    u16 speed;
    s16 animFrame;
    s16 acceleration;
    s16 rotateSpeed;
    s16 maxSpeed;
    s16 unk54;
    s16 filler56;
}; /* 0x58 */

struct Task *CreateSpecialStageGuardRobo(struct SpecialStage *);

#endif
