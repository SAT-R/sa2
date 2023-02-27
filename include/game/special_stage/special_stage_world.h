#ifndef GUARD_SPECIAL_WORLD_H
#define GUARD_SPECIAL_WORLD_H

#include "global.h"
#include "game/special_stage/special_stage.h"

struct SpecialStageWorld {
    struct SpecialStage *stage;
    void *unk4; // size 0xA00
    void *unk8; // size 0x280
    s32 *unkC; // size 0x280
    Background unk10;
    Background unk50;
    Sprite unk90[11];
}; /* size 0x2A0 */

struct Task *CreateSpecialStageWorld(struct SpecialStage *);

#endif
