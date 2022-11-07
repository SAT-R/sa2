#ifndef GUARD_SPECIAL_STAGE_DATA_H
#define GUARD_SPECIAL_STAGE_DATA_H

#include "global.h"
#include "zones.h"

#define SPRITE_ARRAY_END { 65535, 65535, 65535,}

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

struct UNK_80DF670 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u8 unk6;
    u8 unk7;
} /* size 0x8 */;

struct UNK_8C87920 {
    u16 unk0;
    u16 unk2;
};

// sprites
extern const struct UNK_80DF670 gUnknown_080DF2F8[];

/* This is at the end of the rom */
extern const struct UNK_8C878E8** const gUnknown_08C878E8[NUM_COURSE_ZONES];
extern const struct UNK_8C87904* const gUnknown_08C87904[NUM_COURSE_ZONES];
extern const struct UNK_8C87920* const gUnknown_08C87920[NUM_COURSE_ZONES];

#endif
