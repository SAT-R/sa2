#ifndef GUARD_SPECIAL_COLLECTABLES_H
#define GUARD_SPECIAL_COLLECTABLES_H

#include "global.h"
#include "task.h"
#include "special_stage.h"

#define MAX_RING_PARTICLES 8
#define MAX_OBJECTS        323

// There is probably one of these which has different types
struct SpecialStageCollectables_UNK874 {
    u32 unk0;
    u32 unk4;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    u8 unk12;
    u8 unk13;
}; /* size 0x14 */

struct SpecialStageCollectables {
    struct SpecialStage *stage;
    struct UNK_0808B3FC_UNK240 unk4;
    struct UNK_0808B3FC_UNK240 unk34;
    struct UNK_0808B3FC_UNK240 unk64;
    struct UNK_0808B3FC_UNK240 unk94;
    struct UNK_0808B3FC_UNK240 unkC4;
    struct UNK_0808B3FC_UNK240 unkF4[4];

    struct UNK_0808B3FC_UNK240 unk1B4[16];
    struct UNK_0808B3FC_UNK240 unk4B4[16];

    struct UNK_0808B3FC_UNK240 unk7B4[4];
    struct SpecialStageCollectables_UNK874 unk874[MAX_RING_PARTICLES];
    s8 objStates[MAX_OBJECTS];
    u16 unkA58;
    s16 animFrame;
}; /* size 0xA5C */

struct Task *CreateSpecialStageCollectables(struct SpecialStage *);
void SpecialStageHandleLoseRings(struct SpecialStage *stage, s16 num);

#endif
