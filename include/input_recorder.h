#ifndef GUARD_INPUT_RECORDER_H
#define GUARD_INPUT_RECORDER_H

#include "global.h"

#define RECORDER_DISABLED 0
#define RECORDER_RECORD 1

// Maybe `RECORDER_PLAY`
#define RECORDER_PLAYBACK 2

struct InputRecorder {
    s32 playbackHead;
    s32 recordHead;

    u8 mode;
};

// TODO: move to data.h
const u8* gInputPlaybackData;

extern struct InputRecorder gInputRecorder;

void InputRecorderResetRecordHead(void);
void InputRecorderResetPlaybackHead(void);
void InputRecorderLoadTape(void);
u16 InputRecorderRead(void);
void InputRecorderWrite(u16);


#endif // INPUT_RECORDER_H
