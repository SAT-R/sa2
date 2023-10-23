#ifndef GUARD_SCREEN_TRANSITION_H
#define GUARD_SCREEN_TRANSITION_H

#include "global.h"

#define SCREEN_TRANSITION_RUNNING  0
#define SCREEN_TRANSITION_COMPLETE 1

#define SCREEN_FADE_FLAG_DARKEN  (0 << 0)
#define SCREEN_FADE_FLAG_LIGHTEN (1 << 0)
#define SCREEN_FADE_FLAG_2       (1 << 1)

#define SCREEN_FADE_USE_WINDOW_0 0
#define SCREEN_FADE_USE_WINDOW_1 1

// NOTE: The GBA's internal brightness coefficient (BLDY)
//       only has a range of 0 to 16,
//       representing 0/16 to 16/16 of brightness.
//       Any value above 16 will just cap out at 16/16.
#define SCREEN_FADE_BLEND_MAX 32

// Possibly transition configuration?
struct TransitionState {
    // TODO: Is this a bool16?
    /* 0x00 */ s16 window;
    /* 0x02 */ s16 flags;

    // ((flags & 0x1) == TRANSITION_LIGHTEN) =>
    //    0 = Dark
    //   32 = Light
    //
    // ((flags & 0x1) TRANSITION_DARKEN) =>
    //    0 = Light
    //   32 = Dark
    /* 0x04 */ s16 brightness;
    /* 0x06 */ s16 speed;
    /* 0x08 */ s16 bldCnt;
    /* 0x0A */ s16 bldAlpha;
};

// Some sort of fade transition function?
extern u8 NextTransitionFrame(struct TransitionState *);
void sub_802D5A0(struct TransitionState *transition);

#endif // GUARD_SCREEN_TRANSITION_H
