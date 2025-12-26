#ifndef GUARD_TCG_INPUT_H
#define GUARD_TCG_INPUT_H

#include "global.h"

typedef struct {
    // input
    u16 unk0;
    u16 unk2;
    // pressedKeys ?
    u16 unk4;
    // releasedKeys ?
    u16 unk6;
    u8 unk8;
    u8 unk9;
    u8 unkA;
} UNK_30043F0;

extern UNK_30043F0 gInput;

void GetInput(void);
void InputInit(void);

#endif // GUARD_TCG_INPUT_H
