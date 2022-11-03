#ifndef GUARD_TIME_H
#define GUARD_TIME_H

#include "global.h"

#define ZONE_TIME_TO_INT(minutes, seconds) (((minutes * 60) + seconds) * GBA_FRAMES_PER_SECOND)
#define MAX_COURSE_TIME (ZONE_TIME_TO_INT(10, 0))

#define DELIMINATOR_DIGIT 10

#define TensDigit(number) ((number) / 10)
#define UnitsDigit(number) ((number) % 10)

extern const u8 gSecondsTable[60][2];
extern const u8 gMillisUnpackTable[60][2];

#endif // GUARD_TIME_H
