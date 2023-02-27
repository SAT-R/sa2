#include "global.h"
#include "engine/core.h"
#include "engine/task.h"
#include "engine/malloc_ewram.h"
#include "engine/input_recorder.h"

#define TAPE_LENGTH 0x800

static void Task_InputRecorder(void);
static void InputRecorderEject(struct Task *);

void InputRecorderResetRecordHead(void) { gInputRecorder.recordHead = 0; }

void InputRecorderResetPlaybackHead(void) { gInputRecorder.playbackHead = 0; }

void InputRecorderLoadTape(void)
{
    gInputRecorder.mode = RECORDER_DISABLED;
    gInputRecorderTapeBuffer = EwramMalloc(TAPE_LENGTH * sizeof(u16));

    // Load the playback tape into the recorder
    LZ77UnCompWram(gInputPlaybackData, gInputRecorderTapeBuffer);

    TaskCreate(Task_InputRecorder, 0, 0x2000, 0, InputRecorderEject);

    gInputRecorder.recordHead = 0;
    gInputRecorder.playbackHead = 0;
}

u16 InputRecorderRead(void)
{
    if (gInputRecorder.playbackHead < TAPE_LENGTH) {
        return gInputRecorderTapeBuffer[gInputRecorder.playbackHead++];
    }

    return 0;
}

void InputRecorderWrite(u16 input)
{
    if (gInputRecorder.recordHead < TAPE_LENGTH) {
        gInputRecorderTapeBuffer[gInputRecorder.recordHead++] = input;
    }
}

static void Task_InputRecorder(void)
{
    // Potentially generate input ??
}

static void InputRecorderEject(struct Task *_)
{
    EwramFree(gInputRecorderTapeBuffer);

    gInputRecorder.mode = RECORDER_DISABLED;
    gInputRecorder.recordHead = 0;
    gInputRecorder.playbackHead = 0;
}
