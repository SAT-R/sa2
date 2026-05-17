#ifndef GUARD_SPECIAL_STAGE_DATA_H
#define GUARD_SPECIAL_STAGE_DATA_H

#include "global.h"
#include "sprite.h" // for the 'AnimId' type
#include "constants/zones.h"

#define SPRITE_ARRAY_END                                                                                                                   \
    {                                                                                                                                      \
        65535, 65535, 65535,                                                                                                               \
    }

struct UNK_8C878E8 {
    s16 id;
    s16 x;
    s16 y;
    s8 unk6;
    s8 unk7;
}; /* size 0x8 */

struct UNK_8C87904 {
    s16 type;
    s16 x;
    s16 y;

    // maybe need to confirm
    s16 width;
    s16 length;

    s16 unkA;
} /* size 0xC */;

struct UNK_80DF670 {
    /* 0x00 */ AnimId anim;
    /* 0x02 */ u16 variant;
    u16 size;
    u8 animSpeed;
    u8 unk7;
} /* size 0x8 */;

struct UNK_8C87920 {
    /* 0x00 */ AnimId anim;
    /* 0x02 */ u16 variant;
};

// They used a different struct with the same content..?
struct UNK_8C87920_SWAPPED {
    /* 0x00 */ u16 variant;
    /* 0x02 */ AnimId anim;
};

// sprites
extern const struct UNK_80DF670 gUnknown_080DF2F8[];

/* This is at the end of the rom */
extern const struct UNK_8C878E8 **const gUnknown_08C878E8[NUM_COURSE_ZONES];
extern const struct UNK_8C87904 *const gUnknown_08C87904[NUM_COURSE_ZONES];
extern const struct UNK_8C87920 *const gUnknown_08C87920[NUM_COURSE_ZONES];

#endif
