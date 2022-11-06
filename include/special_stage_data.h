#ifndef GUARD_SPECIAL_STAGE_DATA_H
#define GUARD_SPECIAL_STAGE_DATA_H

#include "global.h"

struct UNK_8C878E8 {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s8 unk6;
    s8 unk7;
}; /* size 0x8 */

struct UNK_8C87904 { 
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    s16 unkA;
} /* size 0xC */;


/* This is at the end of the rom */
extern const struct UNK_8C878E8** const gUnknown_08C878E8[7];
extern const struct UNK_8C87904* const gUnknown_08C87904[7];

#endif
