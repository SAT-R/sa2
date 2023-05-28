#ifndef GUARD_STAGE_PALETTE_LOADER_H
#define GUARD_STAGE_PALETTE_LOADER_H

#include "global.h"
#include "task.h"

struct Task *CreatePaletteLoaderTask(u16 priority, AnimId anim, u8 variant,
                                     TaskDestructor dtor);

#endif
