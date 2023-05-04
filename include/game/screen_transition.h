#ifndef GUARD_SCREEN_TRANSITION_H
#define GUARD_SCREEN_TRANSITION_H

#include "global.h"

#define SCREEN_TRANSITION_INCOMPLETE 0
#define SCREEN_TRANSITION_COMPLETE   1

// Possibly transition configuration?
struct TransitionState {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 speed;
    s16 unk8;
    s16 unkA;
};

// Some sort of fade transition function?
extern u8 NextTransitionFrame(struct TransitionState *);
void sub_802D5A0(struct TransitionState *transition);

#endif // GUARD_SCREEN_TRANSITION_H
