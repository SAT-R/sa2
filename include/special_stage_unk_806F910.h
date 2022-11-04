#ifndef GUARD_SPECIAL_UNK_806F910_H
#define GUARD_SPECIAL_UNK_806F910_H

#include "global.h"
#include "special_stage.h"

struct UNK_806F910 {
    struct SpecialStage* unk0;
    s16 unk4;
    u16 unk6;
}; /* size 8 */

struct Task* sub_806F910(struct SpecialStage*);

#endif
