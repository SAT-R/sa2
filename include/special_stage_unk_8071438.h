
#ifndef GUARD_SPECIAL_UNK_8071438_H
#define GUARD_SPECIAL_UNK_8071438_H

#include "global.h"
#include "task.h"
#include "special_stage.h"

struct UNK_8071438 {
    struct SpecialStage* unk0;
    struct UNK_0808B3FC_UNK240 unk4;
    void* unk34;
    const struct UNK_80DF670* unk38;
    s16 unk3C;
    u8 filler3E[2];
    s32 unk40;
    s32 unk44;
    u16 unk48;
    s16 unk4A;
    s16 unk4C;
    s16 unk4E;
    s16 unk50;
    s16 unk52;
    s16 unk54;
    s16 filler56;
} /* 0x58 */;

struct Task* sub_8071438(struct SpecialStage*);

#endif
