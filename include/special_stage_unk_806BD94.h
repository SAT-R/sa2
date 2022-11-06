#ifndef GUARD_SPECIAL_UNK_806BD94_H
#define GUARD_SPECIAL_UNK_806BD94_H

#include "global.h"
#include "task.h"
#include "special_stage.h"

struct UNK_806BD94 {
    struct SpecialStage* unk0;
    struct UNK_0808B3FC_UNK240 unk4;
    struct UNK_0808B3FC_UNK240 unk34;
    struct UNK_0808B3FC_UNK240 unk64;
    struct UNK_0808B3FC_UNK240 unk94;
    struct UNK_0808B3FC_UNK240 unkC4;
    struct UNK_0808B3FC_UNK240 unkF4[4];

    struct UNK_0808B3FC_UNK240 unk1B4[16];
    struct UNK_0808B3FC_UNK240 unk4B4[16];
    
    struct UNK_0808B3FC_UNK240 unk7B4[4];
    struct UNK_806BD94_UNK874 unk874[8];
    s8 unk914[324];
    u16 unkA58;
    s16 unkA5A;
}; /* size 0xA5C */

struct Task* sub_806E684(struct SpecialStage*);
void sub_806D924(struct SpecialStage* stage, s16 num);

#endif
