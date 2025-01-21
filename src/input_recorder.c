#include "global.h"
#include "core.h"
#include "task.h"
#include "malloc_ewram.h"
#include "input_recorder.h"

#if TAS_TESTING
#if PORTABLE
#include <stdio.h>
#endif
// This is the size of any any% speed run TAS run
#define TAPE_LENGTH 0x20000
#else
#define TAPE_LENGTH 0x800
#endif

struct InputRecorder gInputRecorder ALIGNED(8) = { 0 };
u16 *gInputRecorderTapeBuffer = NULL;

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
#if !TAS_TESTING
    TaskCreate(Task_InputRecorder, 0, 0x2000, 0, InputRecorderEject);
#endif
    gInputRecorder.recordHead = 0;
    gInputRecorder.playbackHead = 0;
}

u16 InputRecorderRead(void)
{
    if (gInputRecorder.playbackHead < TAPE_LENGTH) {
        u16 val = gInputRecorderTapeBuffer[gInputRecorder.playbackHead++];
#if TAS_TESTING
        if (val != 0) {
#if PORTABLE
            printf("Frame %d, 0x%X\n", gInputRecorder.playbackHead - 1, (u32)val);
            if (val & A_BUTTON) {
                printf("A ");
            }
            if (val & B_BUTTON) {
                printf("B ");
            }
            if (val & DPAD_LEFT) {
                printf("D_LEFT ");
            }
            if (val & DPAD_RIGHT) {
                printf("DPAD_RIGHT ");
            }
            if (val & DPAD_UP) {
                printf("DPAD_UP ");
            }
            if (val & DPAD_DOWN) {
                printf("DPAD_DOWN ");
            }
            printf("\n");
#endif
        }
        if (val == (A_BUTTON | B_BUTTON | START_BUTTON | SELECT_BUTTON)) {
            return 0;
        }
#endif
        return val;
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
