#ifndef GUARD_SPECIAL_PHYSICS_H
#define GUARD_SPECIAL_PHYSICS_H

#include "global.h"
#include "special_stage.h"

struct SpecialStagePhysics {
    struct SpecialStage* stage;
    s16 animFrame;
    u16 unk6;
}; /* size 8 */

struct Task* CreateSpecialStagePhysics(struct SpecialStage*);
void sub_806F944(struct SpecialStage* stage);

#endif
