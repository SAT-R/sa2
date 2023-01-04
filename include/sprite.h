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

struct GraphicsData {
    /* 0x00 */ const void *src;
    /* 0x04 */ void *dest;
    /* 0x08 */ u16 size;
    /* 0x0A */ AnimId anim;
};

typedef struct {
    // TODO: BgHeader unk0;
    // and remove the below 3 values
    /* 0x00 */ struct GraphicsData graphics;

    u32 unkC;
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
} Background; /* size = 0x40 */

typedef struct {
    /* 0x00 */ u8 flip;

    // every animation has an associated oamData pointer, oamIndex starts at
    // 0 for every new animation and ends at variantCount-1
    /* 0x01 */ u8 oamIndex;

    // some sprite frames consist of multiple images (of the same size
    // as GBA's Object Attribute Memory, e.g. 8x8, 8x32, 32x64, ...)
    /* 0x02 */ u16 numSubframes;

    // In pixels
    /* 0x04 */ u16 width;
    // In pixels
    /* 0x06 */ u16 height;

    /* 0x08 */ s16 offsetX;
    /* 0x0A */ s16 offsetY;
} SpriteOffset;

typedef struct {
    /* 0x28 */ s32 unk0;
    /* 0x2C */ s8 unk4;
    /* 0x2D */ s8 unk5;
    /* 0x2E */ s8 unk6;
    /* 0x2F */ s8 unk7;
} Sprite_UNK28;

// TODO: work out what makes this struct different from the above
typedef struct {
    /* 0x00 */ struct GraphicsData graphics;
    /* 0x0C */ SpriteOffset *dimensions;

    // Bitfield description from KATAM decomp
    /* 0x10 */ u32 unk10; // bit 0-4: rotscale param selection
                          // bit 5: rotscale enable
                          // bit 6: rotscale double-size
                          // bit 7-8: obj mode
                          // bit 9
                          // bit 10
                          // bit 11
                          // bit 12-13: priority
                          // bit 14
                          // bit 15-16: bg id (?)
                          // bit 17
                          // bit 18-25
                          // bit 26
                          // bit 27-31

    /* 0x14 */ u16 unk14; // animation cursor

    // TODO: should be signed
    /* 0x16 */ s16 x;
    /* 0x18 */ s16 y;

    /* 0x1A */ u16 unk1A; // might be a bitfield?

    /* 0x1C */ s16 unk1C;
    /* 0x1E */ u16 unk1E; // prevAnimId?

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
    /* 0x28 */ Sprite_UNK28 unk28[1];
} Sprite /* size = 0x30 */;

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

typedef struct {
    /* 0x00 */ u32 numTiles;
    /* 0x04 */ AnimId anim;
    /* 0x06 */ u8 variant;
} TileInfo;

// Register menu item
s32 sub_8004558(Sprite *);

void sub_80051E8(Sprite *);
void sub_8002A3C(Background *);
u32 sub_8004010(void);
u32 sub_80039E4(void);
u32 sub_8002B20(void);
void DrawToOamBuffer(void);
OamData *sub_80058B4(u8 size);

// TransformSprite
void sub_8004860(Sprite *, struct UNK_808D124_UNK180 *);

void sub_8003EE4(u16, u16, u16, u16, u16, u16, u16, struct BgAffineRegs *);

void sub_80036E0(Sprite *);
void sub_8003914(Sprite *);
void sub_80047A0(u16, u16, u16, u16);

void sub_8003638(Background *);

#endif
