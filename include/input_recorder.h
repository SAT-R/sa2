#ifndef GUARD_INPUT_RECORDER_H
#define GUARD_INPUT_RECORDER_H

// ReadPlaybackInput
extern u16 sub_8007D8C(void);

// RecordInput
extern void sub_8007DBC(u16);

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

#endif // INPUT_RECORDER_H
