#ifndef GUARD_INPUT_H
#define GUARD_INPUT_H

#include "global.h"

extern void sub_8007DBC(u16);
extern u16 sub_8007D8C(void);

extern u16 gInput;
extern u16 gPressedKeys;
extern u16 gReleasedKeys;
extern u16 gPrevInput;
// TODO: Potentially better name
extern u16 gRepeatPressedKeys;

// Something to do with storing the repeat
// key states
extern u8 gUnknown_030022A0[];
extern u8 gUnknown_03002700[];
extern u8 gUnknown_03002850[];

#endif
