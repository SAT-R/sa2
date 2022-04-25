#ifndef GUARD_INTRO_H
#define GUARD_INTRO_H

#include "global.h"
#include "sprite.h"

struct UNK_0808B3FC_UNK27C {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 filler3;

    const u8* unk4;
    const u8* unk8;

    u8 fillerC[40];
    u16 unk34;
    u8 unk36;
};

struct UNK_0808B3FC_UNK270 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
};

struct UNK_0808B3FC {
    // Possibly an array of ui elements?
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    struct Unk_03002400 unk80;

    // Dunno what these are yet
    struct UNK_0808B3FC_UNK240 unkC0;
    struct UNK_0808B3FC_UNK240 unkF0;

    // Might be something else here, but this fits
    struct UNK_0808B3FC_UNK240 unk120[6];

    // Used
    struct UNK_0808B3FC_UNK240 unk240;

    // Some more configs
    struct UNK_0808B3FC_UNK270 unk270;
    struct UNK_0808B3FC_UNK27C unk27C;

    // Something to do with the wave effects
    u16 unk2B4[0xA0];

    u8 filler3F4[0xA00];

    u16 unkDF4[0xA0];

    u16 unkF34;
    u16 unkF36;
    u16 unkF38;

    u16 unkF3A;

    u8 unkF3C;
    u8 unkF3D;

    u16 unkF3E;

    u16 unkF40;
    u8 unkF42;

    u8 fillerF43[33];
}; /* size 0xF64 */

// Store the intro data objects
struct UNK_3005B80 {
    struct UNK_0808B3FC_UNK27C* unk0;
    struct UNK_0808B3FC* unk4;
};

struct UNK_080E0D64 {
    u32 unk0;
    u16 unk4;
    s8 unk6;
};



// These sit next to each other in the ROM
// but changing to a struct, or joining them 
// together doesn't match
extern const struct UNK_080E0D64 gUnknown_080E0D64[7];
extern const struct UNK_080E0D64 gUnknown_080E0D9C[43];

// Used outside of this module I think, so declared here
struct UNK_3005B80 gUnknown_03005B80;

void sub_808B3FC_CreateIntro(void);

#endif
