#ifndef GUARD_SCREEN_TRANSITION_H
#define GUARD_SCREEN_TRANSITION_H

#include "global.h"

#define SCREEN_TRANSITION_COMPLETE 1

// Possibly transition configuration?
struct TransitionState {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
};

// Some sort of fade transition function?
extern u8 RunTransition(struct TransitionState *);

#endif // GUARD_SCREEN_TRANSITION_H
