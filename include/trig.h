#ifndef GUARD_TRIG_H
#define GUARD_TRIG_H

#include "global.h"

extern const s16 gSineTable[1280];

#define ONE_CYCLE (1024 - 1)

#define SIN(radAngle) (gSineTable[(radAngle)])
#define COS(radAngle) (gSineTable[(radAngle) + 256])

#define SIN_24_8(radAngle) Q_2_14_TO_Q_24_8(SIN(radAngle))
#define COS_24_8(radAngle) Q_2_14_TO_Q_24_8(COS(radAngle))

#define DEG_TO_SIN(deg) ((int)((((double)(deg)) / 360.0) * (ONE_CYCLE + 1)))

// NOTE: Returns a Q_24_8!
#define SIN_DEG(degrees) Q_2_14_TO_Q_24_8(gSineTable[DEG_TO_SIN(degrees)])
#define COS_DEG(degrees) Q_2_14_TO_Q_24_8(gSineTable[DEG_TO_SIN(degrees) + 256])

#define SQUARE(v) ((v) * (v))
#define CUBE(v)   ((v) * (v) * (v))

#endif // GUARD_TRIG_H
