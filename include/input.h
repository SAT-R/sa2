#ifndef GUARD_INPUT_H
#define GUARD_INPUT_H

#include "global.h"

u16 gInput;
u16 gPressedKeys;
u16 gReleasedKeys;
u16 gPrevInput;

// Same as gPressedKeys but will
// automatically retrigger a key
// if held
u16 gRepeatedKeys;

// How many frames left for each key
// before it will be repeated
u8 gRepeatedKeysTestCounter[10];

// Settings for each key of how many frames we should
// wait after the key is pressed before repeating
// for the first time
u8 gKeysFirstRepeatIntervals[10];

// Setting for each key of how many frames we should
// wait after between repeating the key after the
// first repeat
u8 gKeysContinuedRepeatIntervals[10];

#endif
