#ifndef GUARD_SPECIAL_STAGE_H
#define GUARD_SPECIAL_STAGE_H

#include "global.h"
#include "sprite.h"
#include "transition.h"

#define SPECIAL_STAGE_ZONE_SIZE 8

#define MIN_SPECIAL_STAGE_X 48
#define MAX_SPECIAL_STAGE_X 976

#define MIN_SPECIAL_STAGE_Y 48
#define MAX_SPECIAL_STAGE_Y 976

struct SpecialStage {
    struct Task* unk0; // UNK_806F910
    struct Task* unk4; // UNK_806E6E8
    struct Task* unk8; // UNK_806BD94

    struct Task* playerTask;

    // uiTask?
    struct Task* unk10; // UNK_8070B90 or UNK_8070BF0

    struct Task* gammaTask;
    struct UNK_0808B3FC_UNK240 unk18;
    struct Unk_03002400 unk48;
    struct UNK_802D4CC_UNK270 unk88;
    s32 unk94[160][2];
    u32 unk594;
    u32 unk598;
    u32 unk59C;

    u16 unk5A0;
    s16 unk5A2;
    s16 unk5A4;

    // time
    s16 unk5A6;

    s32 unk5A8;
    s32 unk5AC;
    s32 unk5B0;

    u16 unk5B4;

    // character
    u8 unk5B6;
    
    u8 unk5B7;
    
    // level
    u8 unk5B8;

    u8 unk5B9;
    u8 unk5BA;

    s8 unk5BB;
    s8 unk5BC;
    s8 unk5BD;
    s8 unk5BE;

    s8 unk5BF;
    s8 unk5C0;
    s8 unk5C1;

    s8 unk5C2;
    s8 unk5C3;
    s8 unk5C4;

    s8 unk5C5;
    u8 unk5C6;

    s8 unk5C7;
    s8 unk5C8;

    u8 filler5C9;
    s16 unk5CA;
    s16 unk5CC;
    u16 unk5CE;
    u8 unk5D0;
    u8 unk5D1;
    u8 unk5D2;
    u8 unk5D3;
    void* unk5D4;
}; /* size 0x5D8 */

// There is probably one of these which has different types
struct UNK_806BD94_UNK874 {
    u32 unk0;
    u32 unk4;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    u8 unk12;
    u8 unk13;
}; /* size 0x14 */

struct UNK_806BD94_UNK874_2 {
    u32 unk0;
    u32 unk4;
    s32 unk8;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
}; /* size 0x14 */

struct UNK_806CB84 {
    u8 unk0[2];
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
};

struct UNK_80DF670 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u8 unk6;
    u8 unk7;
} /* size 0x8 */;

void sub_806BA84(s16, s16);

#endif
