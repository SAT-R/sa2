#ifndef GUARD_TRIG_H
#define GUARD_TRIG_H

#include "global.h"

extern const s16 gSineTable[1280];

#define ONE_CYCLE (1024 - 1)

#define SIN(radAngle) (gSineTable[(radAngle)])
#define COS(radAngle) (gSineTable[(radAngle) + 256])

#endif // GUARD_TRIG_H
