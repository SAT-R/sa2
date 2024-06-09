#ifndef GUARD_SCREEN_SHAKE_H
#define GUARD_SCREEN_SHAKE_H

#include "global.h"
#include "task.h"

struct Task *CreateScreenShake(u32 p0, u32 p1, u32 p2, u32 p3, u32 flags);

#define SCREENSHAKE_FACTOR_POSITIVE 0x1
#define SCREENSHAKE_FACTOR_NEGATIVE 0x2
#define SCREENSHAKE_FACTOR_MASK     0x3
#define SCREENSHAKE_RANDOM_VALUE    0x10
#define SCREENSHAKE_HORIZONTAL      0x40
#define SCREENSHAKE_VERTICAL        0x80

#endif // GUARD_SCREEN_SHAKE_H