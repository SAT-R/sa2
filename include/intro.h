#ifndef GUARD_INTRO_H
#define GUARD_INTRO_H

#include "global.h"
#include "sprite.h"

struct UNK_0808B3FC_UNK27C {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 filler3;

    u8* unk4;
    u8* unk8;

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

struct UNK_0808B3FC_UNK240 {
    u32 unk0;
    u32 unk4;
    u16 unk8;
    u16 unkA;
    u32 unkC;
    u32 unk10;
    u16 unk14;
    u16 unk16;
    u16 unk18;
    u16 unk1A;
    u16 unk1C;
    u16 unk1E;
    u8 unk20;
    u8 unk21;
    u8 unk22;
    u8 unk23;
    u8 unk24;
    u8 unk25;
    u8 filler26[10];
};

struct UNK_0808B3FC {
    // Possibly an array of ui elements?
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    struct Unk_03002400 unk80;
    struct Unk_03002400 unkC0;
    struct Unk_03002400 unk100;
    struct Unk_03002400 unk140;
    struct Unk_03002400 unk180;
    struct Unk_03002400 unk1C0;
    struct Unk_03002400 unk200;

    // Dunno what these are
    struct UNK_0808B3FC_UNK240 unk240;
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

#endif
