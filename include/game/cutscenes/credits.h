#ifndef GUARD_COURSE_CUT_SCENES_CREDITS_H
#define GUARD_COURSE_CUT_SCENES_CREDITS_H

#include "global.h"

#define CREDITS_VARIANT_EXTRA_ENDING 2
#define CREDITS_VARIANT_FINAL_ENDING 1
#define CREDITS_VARIANT_NONE         0

void CreateCreditsCutScene(u8 endingVariant, u8 b, u8 c);

#endif
