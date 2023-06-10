#ifndef GUARD_TIME_H
#define GUARD_TIME_H

#include "global.h"

#define DELIMINATOR_DIGIT 10

#define TENS_DIGIT(number)  ((number) / 10)
#define UNITS_DIGIT(number) ((number) % 10)

extern const u8 gSecondsTable[60][2];
extern const u8 gMillisUnpackTable[60][2];

extern struct Task *gStageUITask;

#endif // GUARD_TIME_H
