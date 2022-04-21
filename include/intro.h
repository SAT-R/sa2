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

struct UNK_0808B3FC {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    struct Unk_03002400 unk80;

    u8 fillerC0[0x1B0];

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
