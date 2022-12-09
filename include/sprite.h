#ifndef GUARD_SPRITE_H
#define GUARD_SPRITE_H

#include "global.h"

// After a sprite is initialized, its x-value in the layout-data gets set to -2.
#define SPRITE_STATE_POS_INITIALIZED (-2)
#define SPRITE_STATE_UNK_MINUS_THREE (-3)
#define SET_SPRITE_INITIALIZED(target)                                                  \
    {                                                                                   \
        s32 negativeTwo;                                                                \
        s16 forMatching;                                                                \
        negativeTwo = SPRITE_STATE_POS_INITIALIZED;                                     \
        forMatching = negativeTwo;                                                      \
        target->x = forMatching;                                                        \
    }

typedef u16 AnimId;

// TODO: move the struct declaration to a proper location
// Background
struct Unk_03002400 {
    u32 unk0;
    u32 unk4; // vram

    u16 unk8;
    u16 unkA;

    u32 unkC; // vram
    // Don't think this is right in sa2
    const u16 *unk10;

    u16 unk14;
    u16 unk16;
    u16 unk18;
    u16 unk1A;

    // assetId
    u16 unk1C;
    u16 unk1E;

    u16 unk20;
    u16 unk22;
    u16 unk24;
    u16 unk26;
    u16 unk28;
    u8 unk2A;
    u8 unk2B;
    u8 unk2C;

    u8 unk2D;
    u16 unk2E;
    u16 unk30;
    u16 unk32;
    u16 unk34;
    u16 unk36;
    const u16 *unk38;
    u16 unk3C;
    u16 unk3E;
}; /* size = 0x40 */

struct UNK_0808B3FC_UNK240_UNKC {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    s16 unk8;
    s16 unkA;
};

// TODO: work out what makes this struct different from the above
// Maybe `struct Sprite`
struct UNK_0808B3FC_UNK240 {
    // These values are part of some other struct
    /* 0x00 */ u32 unk0;

    /* 0x04 */ void *vram;

    /* 0x08 */ u16 unk8;

    /* 0x0A */ AnimId anim;

    /* 0x0C */ struct UNK_0808B3FC_UNK240_UNKC *unkC;
    /* 0x10 */ u32 unk10; // bitfield

    /* 0x14 */ u16 unk14; // animation cursor

    // TODO: should be signed
    /* 0x16 */ u16 x;
    /* 0x18 */ u16 y;

    /* 0x1A */ u16 unk1A; // might be a bitfield?

    /* 0x1C */ u16 unk1C;
    /* 0x1E */ u16 unk1E;

    /* 0x20 */ u8 variant;

    /* 0x21 */ u8 unk21;

    // something to do with animation speed
    /* 0x22 */ u8 unk22;

    // TODO: these values are only used within some
    // sort of menu functions. Split out the shared stuff
    /* 0x23 */ u8 unk23;
    /* 0x24 */ u8 unk24;
    /* 0x25 */ u8 focused;

    /* 0x26 */ u8 filler26[2];
    /* 0x28 */ s32 unk28;
    /* 0x2C */ u8 filler2C[4];
} /* size = 0x30 */;

struct Unk_03002EC0 {
    /* TODO: fixing types breaks sub_80021C4. */
    u32 unk0; // const void *
    u32 unk4; // void *
    u16 unk8;
    u8 fillerA[2];
};

// Transformer
struct UNK_808D124_UNK180 {
    u16 unk0;
    // width
    s16 unk2;
    // height
    s16 unk4;
    // pos
    s16 unk6[2];
    u8 unkA;
    u8 unkB;
}; /* size 0xC */

// used for defining element data
// TileInfo
struct UNK_080E0D64 {
    /* 0x00 */ u32 numTiles;
    /* 0x04 */ AnimId anim;
    /* 0x06 */ u8 variant;
};

// Register menu item
u32 sub_8004558(struct UNK_0808B3FC_UNK240 *);

void sub_80051E8(struct UNK_0808B3FC_UNK240 *);
void sub_8002A3C(struct Unk_03002400 *);
u32 sub_8004010(void);
u32 sub_80039E4(void);
u32 sub_8002B20(void);
void DrawToOamBuffer(void);
OamData *sub_80058B4(u8 size);

// TransformSprite
void sub_8004860(struct UNK_0808B3FC_UNK240 *, struct UNK_808D124_UNK180 *);

void sub_8003EE4(u32, u16, u16, u32, u32, u32, u32, struct BgAffineRegs *);

void sub_80036E0(struct UNK_0808B3FC_UNK240 *);
void sub_8003914(struct UNK_0808B3FC_UNK240 *);
void sub_80047A0(u16, u16, u16, u16);

void sub_8003638(struct Unk_03002400 *);

// Probably a list of sprites to draw to screen
extern struct Unk_03002EC0 *gUnknown_030027A0[];

#endif
