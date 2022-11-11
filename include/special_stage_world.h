#ifndef GUARD_SPECIAL_WORLD_H
#define GUARD_SPECIAL_WORLD_H

#include "global.h"
#include "special_stage.h"

struct SpecialStageWorld {
    struct SpecialStage *stage;
    void *unk4; // size 0xA00
    void *unk8; // size 0x280
    s32 *unkC; // size 0x280
    struct Unk_03002400 unk10;
    struct Unk_03002400 unk50;
    struct UNK_0808B3FC_UNK240 unk90[11];
}; /* size 0x2A0 */

struct Task *CreateSpecialStageWorld(struct SpecialStage *);

#endif
