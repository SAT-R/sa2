#ifndef GUARD_SPECIAL_WORLD_H
#define GUARD_SPECIAL_WORLD_H

#include "global.h"
#include "game/special_stage/main.h"

struct SpecialStageWorld {
    struct SpecialStage *stage;
    void *bgTransforms; // size 0xA00

    // unused
    void *unk8; // size 0x280

    s32 *qPerspectiveTable; // size 0x280
    Background background;
    Background floor;
    Sprite unk90[11];
}; /* size 0x2A0 */

struct Task *CreateSpecialStageWorld(struct SpecialStage *);

#endif
