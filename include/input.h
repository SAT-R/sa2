#ifndef GUARD_INPUT_H
#define GUARD_INPUT_H

#include "global.h"

// RecordInput
extern void sub_8007DBC(u16);

// ReadPlaybackInput
extern u16 sub_8007D8C(void);

# define RECORDER_DISABLED 0
# define RECORDER_RECORD 1
# define RECORDER_PLAYBACK 2

struct InputRecorder {
    u32 playbackHead;
    u32 recordHead;
    u8 mode;
};

const u16* gInputPlaybackBuffer;
struct InputRecorder gInputRecorder;

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
