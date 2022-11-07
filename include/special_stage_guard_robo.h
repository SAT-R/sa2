
#ifndef GUARD_SPECIAL_GUARD_ROBO_H
#define GUARD_SPECIAL_GUARD_ROBO_H

#include "global.h"
#include "task.h"
#include "special_stage.h"
#include "special_stage_data.h"

struct SpecialStageGuardRobo {
    struct SpecialStage* stage;
    struct UNK_0808B3FC_UNK240 unk4;
    void* unk34;
    const struct UNK_80DF670* unk38;
    s16 unk3C;
    u8 filler3E[2];
    s32 x;
    s32 y;
    u16 unk48;
    u16 unk4A;
    s16 unk4C;
    s16 unk4E;
    s16 unk50;
    s16 unk52;
    s16 unk54;
    s16 filler56;
}; /* 0x58 */

struct Task* CreateGuardRobo(struct SpecialStage*);

#endif
