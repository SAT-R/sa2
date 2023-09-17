#ifndef GUARD_INPUT_RECORDER_H
#define GUARD_INPUT_RECORDER_H

#include "global.h"

#define RECORDER_DISABLED 0
#define RECORDER_RECORD   1

// Maybe `RECORDER_PLAY`
#define RECORDER_PLAYBACK 2

struct InputRecorder {
    /* 0x00 */ s32 playbackHead;
    /* 0x04 */ s32 recordHead;
    /* 0x08 */ u8 mode;
};

void InputRecorderResetRecordHead(void);
void InputRecorderResetPlaybackHead(void);
void InputRecorderLoadTape(void);
u16 InputRecorderRead(void);
void InputRecorderWrite(u16);

#endif // INPUT_RECORDER_H
