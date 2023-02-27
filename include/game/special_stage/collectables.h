#ifndef GUARD_SPECIAL_COLLECTABLES_H
#define GUARD_SPECIAL_COLLECTABLES_H

#include "global.h"
#include "engine/task.h"
#include "game/special_stage/main.h"

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
    Sprite unk4;
    Sprite unk34;
    Sprite unk64;
    Sprite unk94;
    Sprite unkC4;
    Sprite unkF4[4];

    Sprite unk1B4[16];
    Sprite unk4B4[16];

    Sprite unk7B4[4];
    struct SpecialStageCollectables_UNK874 unk874[MAX_RING_PARTICLES];
    s8 objStates[MAX_OBJECTS];
    u16 unkA58;
    s16 animFrame;
}; /* size 0xA5C */

struct Task *CreateSpecialStageCollectables(struct SpecialStage *);
void SpecialStageHandleLoseRings(struct SpecialStage *stage, s16 num);

#endif
