#ifndef GUARD_SPECIAL_STAGE_H
#define GUARD_SPECIAL_STAGE_H

#include "global.h"
#include "sprite.h"
#include "transition.h"

struct SpecialStage {
    struct Task* unk0; // UNK_806F910
    struct Task* unk4; // UNK_806E6E8
    struct Task* unk8; // UNK_806BD94

    // playerTask
    struct Task* unkC; // UNK_806CF78

    // uiTask?
    struct Task* unk10; // UNK_8070B90 or UNK_8070BF0

    struct Task* unk14; // UNK_8071438
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

struct UNK_806BD94 {
    struct SpecialStage* unk0;
    struct UNK_0808B3FC_UNK240 unk4;
    struct UNK_0808B3FC_UNK240 unk34;
    struct UNK_0808B3FC_UNK240 unk64;
    struct UNK_0808B3FC_UNK240 unk94;
    struct UNK_0808B3FC_UNK240 unkC4;
    struct UNK_0808B3FC_UNK240 unkF4[4];

    struct UNK_0808B3FC_UNK240 unk1B4[16];
    struct UNK_0808B3FC_UNK240 unk4B4[16];
    
    struct UNK_0808B3FC_UNK240 unk7B4[4];
    struct UNK_806BD94_UNK874 unk874[8];
    s8 unk914[324];
    u16 unkA58;
    s16 unkA5A;
}; /* size 0xA5C */

struct UNK_80DF670 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u8 unk6;
    u8 unk7;
} /* size 0x8 */;

// Player
struct UNK_806CF78 {
    struct SpecialStage* unk0;
    void* unk4;
    struct UNK_0808B3FC_UNK240 unk8;
    struct UNK_0808B3FC_UNK240 unk38;
    struct UNK_0808B3FC_UNK240 unk68;

    // vram stuff
    void* unk98;
    void* unk9C;
    void* unkA0;

    s16 unkA4;
    u8 unkA6;

    s32 unkA8;
    s32 unkAC;

    s16 unkB0;
    u16 unkB2;

    u16 unkB4;
    s16 unkB6;

    s16 unkB8;

    s16 unkBA;
  
    s16 unkBC;  
    s16 unkBE;

    s16 unkC0;
    u16 unkC2;

    // sprites
    const struct UNK_80DF670* unkC4;
    
    s32 unkC8;
    u32 unkCC;
    u32 unkD0;
    u32 unkD4;
    u32 unkD8;
    
    s32 unkDC;
    s32 unkE0;
    s32 unkE4;
    u32 unkE8;

    u16 unkEC;
    u16 unkEE;
    s16 unkF0;
    s16 unkF2;
    s16 unkF4;
    s16 unkF6;
    s16 unkF8;
    s16 unkFA;
    s16 unkFC;
    s16 unkFE;
    s32 unk100;
    s32 unk104;
}; /* size 0x108 */

struct UNK_8071438 {
    struct SpecialStage* unk0;
    u8 filletemp_r4[56];
    u16 unk3C;
    u8 filler3E[2];
    s32 unk40;
    s32 unk44;
    u8 unk48[0x10];
}; /* size 0x58 */

struct UNK_806E6E8 {
    struct SpecialStage* unk0;
    void* unk4; // size 0xA00
    void* unk8; // size 0x280
    s32* unkC; // size 0x280
    struct Unk_03002400 unk10;
    struct Unk_03002400 unk50;
    struct UNK_0808B3FC_UNK240 unk90[11];
}; /* size 0x2A0 */

struct UNK_806F910 {
    struct SpecialStage* unk0;
    s16 unk4;
    u16 unk6;
}; /* size 8 */

void sub_806BA84(s16, s16);

#endif
