#ifndef GUARD_INPUT_H
#define GUARD_INPUT_H

#include "global.h"

extern u16 gInput;
extern u16 gPressedKeys;
extern u16 gReleasedKeys;
extern u16 gPrevInput;

extern u16 gPhysicalInput;

// Same as gPressedKeys but will
// automatically retrigger a key
// if held
extern u16 gRepeatedKeys;

// How many frames left for each key
// before it will be repeated
extern u8 gRepeatedKeysTestCounter[10];

// Settings for each key of how many frames we should
// wait after the key is pressed before repeating
// for the first time
extern u8 gKeysFirstRepeatIntervals[10];

// Setting for each key of how many frames we should
// wait after between repeating the key after the
// first repeat
extern u8 gKeysContinuedRepeatIntervals[10];

#endif
