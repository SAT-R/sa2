#ifndef GUARD_STAGE_PALETTE_LOADER_H
#define GUARD_STAGE_PALETTE_LOADER_H

#include "global.h"
#include "task.h"

struct Task *CreatePaletteLoaderTask(s32 priority, s32 anim, s32 variant,
                                     TaskDestructor taskDestructor);

#endif
