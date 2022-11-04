
#ifndef GUARD_SPECIAL_UNK_8071438_H
#define GUARD_SPECIAL_UNK_8071438_H

#include "global.h"
#include "task.h"
#include "special_stage.h"

struct UNK_8071438 {
    struct SpecialStage* unk0;
    u8 filletemp_r4[56];
    u16 unk3C;
    u8 filler3E[2];
    s32 unk40;
    s32 unk44;
    u8 unk48[0x10];
}; /* size 0x58 */

struct Task* sub_8071438(struct SpecialStage*);

#endif
