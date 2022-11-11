#ifndef GUARD_TRANSITION_H
#define GUARD_TRANSITION_H

#include "global.h"

// Possibly transition configuration?
struct UNK_802D4CC_UNK270 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
};

// Some sort of fade transition function?
extern u8 sub_802D4CC(struct UNK_802D4CC_UNK270 *);

#endif // GUARD_TRANSITION_H
