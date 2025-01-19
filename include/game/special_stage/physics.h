#ifndef GUARD_SPECIAL_PHYSICS_H
#define GUARD_SPECIAL_PHYSICS_H

#include "global.h"
#include "game/special_stage/main.h"

struct SpecialStagePhysics {
    struct SpecialStage *stage;
    s16 animFrame;
    u16 unk6;
}; /* size 8 */

struct Task *CreateSpecialStagePhysics(struct SpecialStage *);
void HandleRoboPlayerCollision(struct SpecialStage *stage);

#endif
