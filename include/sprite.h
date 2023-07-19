#ifndef GUARD_SPRITE_H
#define GUARD_SPRITE_H

#include "global.h"

typedef u16 AnimId;

struct GraphicsData {
    /* 0x00 */ const void *src;
    /* 0x04 */ void *dest;
    /* 0x08 */ u16 size;
    /* 0x0A */ AnimId anim;
};

// TODO: Put this somewhere else! (or is this already somewhere?)
#define TileMask_Index   (0x3FF)
#define TileMask_FlipX   (1 << 10)
#define TileMask_FlipY   (1 << 11)
#define TileMask_FlipXY  (TileMask_FlipX | TileMask_FlipY)
#define TileMask_Palette (TileMask_FlipX | TileMask_FlipY)

#define BACKGROUND_UPDATE_GRAPHICS   0x8
#define BACKGROUND_UPDATE_PALETTE    0x10
#define BACKGROUND_FLAG_IS_LEVEL_MAP 0x40
#define BACKGROUND_UPDATE_ANIMATIONS 0x200
typedef struct {
    /* 0x00 */ struct GraphicsData graphics;

    // 'tilesVram' points to tile-index array in VRAM, telling the GBA which tiles to
    // draw on this BG
    //
    // (!!! Data likely different depending on type of Background (Affine vs. Text). !!!)
    //
    // Data-Structure (16 bits): MSB > PPPPYXTTTTTTTTTT < LSB
    // P = Palette Index
    // Y = Y-Flip
    // X = X-Flip
    // T = Tile-Index
    //
    // NOTE: It does NOT point to the tileset!
    // NOTE/TODO (Jace): Should this also be const?
    //                   It's in VRAM, so it doesn't make much sense?
    /* 0x0C */ u16 *tilesVram;
    /* 0x10 */ const u16 *unk10;

    /* 0x14 */ u16 unk14;
    /* 0x16 */ u16 unk16;
    /* 0x18 */ u16 unk18;
    /* 0x1A */ u16 unk1A;
    /* 0x1C */ u16 tilemapId;
    /* 0x1E */ u16 unk1E;

    /* 0x20 */ u16 unk20;
    /* 0x22 */ u16 unk22;
    /* 0x24 */ u16 unk24;
    /* 0x26 */ u16 unk26;
    /* 0x28 */ u16 unk28;
    /* 0x2A */ u8 unk2A;
    /* 0x2B */ u8 animFrameCounter;
    /* 0x2C */ u8 animDelayCounter;

    u8 unk2D;

    // Flags
    // 0x200 = something about updating animations (sub_8003638)
    u16 unk2E; // TODO: rename to "flags"

    // apparently NOT signed?
    /* 0x30 */ u16 scrollX;
    /* 0x32 */ u16 scrollY;
    /* 0x34 */ u16 prevScrollX;
    /* 0x36 */ u16 prevScrollY;
    /* 0x38 */ const u16 *metatileMap;
    /* 0x3C */ u16 mapWidth;
    /* 0x3E */ u16 mapHeight;
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
                          // bit 10 X-Flip
                          // bit 11 Y-Flip
                          // bit 12-13: priority
                          // bit 14
                          // bit 15-16: Background ID
                          // bit 17
                          // bit 18-25(?)
                          // bit 26
                          // bit 27-29(?)
                          // bit 30
                          // bit 31

    /* 0x14 */ u16 unk14; // animation cursor

    /* 0x16 */ s16 x;
    /* 0x18 */ s16 y;

    /* 0x1A */ u16 unk1A; // might be a bitfield?

    /* 0x1C */ s16 unk1C;
    /* 0x1E */ u16 unk1E; // prevAnimId?

    /* 0x20 */ u8 variant;

    /* 0x21 */ u8 unk21; // prevVariant?

    // something to do with animation speed
    /* 0x22 */ u8 unk22;

    /* 0x23 */ u8 oamBaseIndex;
    /* 0x24 */ u8 numSubFrames;
    /* 0x25 */ u8 palId;

    /* 0x26 */ u8 filler26[2];
    /* 0x28 */ Sprite_UNK28 unk28[1];
} Sprite /* size = 0x30 */;

typedef struct {
    /* 0x00 */ u16 unk0;
    /* 0x02 */ s16 width;
    /* 0x04 */ s16 height;
    /* 0x06 */ s16 x;
    /* 0x08 */ s16 y;
} SpriteTransform; /* size 0xA */

typedef struct {
    /* 0x00 */ u32 numTiles;
    /* 0x04 */ AnimId anim;
    /* 0x06 */ u8 variant;
} TileInfo;

typedef struct PACKED {
    /* 0x00 */ u16 numTiles;
    /* 0x02 */ AnimId anim;
    /* 0x04 */ u16 variant;
} TileInfo16;

s32 sub_8004558(Sprite *);

void sub_80051E8(Sprite *);
void sub_8002A3C(Background *);
u32 sub_8004010(void);
u32 sub_80039E4(void);
bool32 sub_8002B20(void);
void DrawToOamBuffer(void);
OamData *sub_80058B4(u8 size);

// TransformSprite
void sub_8004860(Sprite *, SpriteTransform *);
void sub_8004E14(Sprite *, SpriteTransform *);

void sub_8003EE4(u16 p0, s16 p1, s16 p2, s16 p3, s16 p4, s16 p5, s16 p6,
                 BgAffineReg *affine);
void sub_8006228(u8 p0, u8 p1, u8 p2, u8 p3, u8 p4, u8 p5);
void sub_80064A8(u8 p0, u8 p1, u8 p2, u8 p3, u8 p4, u8 p5);

// TODO: Find out type of p1!
void sub_800724C(u8 p0, void *p1);

s32 sub_80036E0(Sprite *);
void sub_8003914(Sprite *);
void sub_80047A0(u16, u16, u16, u16);

s32 sub_8004418(s16 x, s16 y);

void UpdateBgAnimationTiles(Background *);

#define SpriteShouldUpdate(sprite)                                                      \
    (((sprite)->unk21 != (sprite)->variant)                                             \
     || ((sprite)->unk1E != (sprite)->graphics.anim))

// TODO: Maybe rename this and move if out?
#define SPRITE_MAYBE_SWITCH_ANIM(_sprite)                                               \
    if (SpriteShouldUpdate(_sprite)) {                                                  \
        (_sprite)->graphics.size = 0;                                                   \
        (_sprite)->unk21 = (_sprite)->variant;                                          \
        (_sprite)->unk1E = (_sprite)->graphics.anim;                                    \
        (_sprite)->unk14 = 0;                                                           \
        (_sprite)->unk1C = 0;                                                           \
        (_sprite)->unk10 &= ~0x4000;                                                    \
    }

#define SPRITE_INIT_WITH_POS(_sprite, _numTiles, _anim, _variant, _UNK1A, _priority)    \
    _sprite->graphics.dest = VramMalloc(_numTiles);                                     \
    _sprite->graphics.anim = _anim;                                                     \
    _sprite->variant = _variant;                                                        \
    _sprite->unk1A = _UNK1A;                                                            \
    _sprite->graphics.size = 0;                                                         \
    _sprite->x = 0;                                                                     \
    _sprite->y = 0;                                                                     \
    _sprite->unk14 = 0;                                                                 \
    _sprite->unk1C = 0;                                                                 \
    _sprite->unk21 = 0xFF;                                                              \
    _sprite->unk22 = 0x10;                                                              \
    _sprite->palId = 0;                                                                 \
    _sprite->unk28[0].unk0 = -1;                                                        \
    _sprite->unk10 = SPRITE_FLAG(PRIORITY, _priority);

#define SPRITE_INIT_WITH_FLAGS(_sprite, _numTiles, _anim, _variant, _UNK1A, _priority,  \
                               _flags)                                                  \
    _sprite->graphics.dest = VramMalloc(_numTiles);                                     \
    _sprite->graphics.anim = _anim;                                                     \
    _sprite->variant = _variant;                                                        \
    _sprite->unk1A = _UNK1A;                                                            \
    _sprite->graphics.size = 0;                                                         \
    _sprite->unk14 = 0;                                                                 \
    _sprite->unk1C = 0;                                                                 \
    _sprite->unk21 = 0xFF;                                                              \
    _sprite->unk22 = 0x10;                                                              \
    _sprite->palId = 0;                                                                 \
    _sprite->unk28[0].unk0 = -1;                                                        \
    _sprite->unk10 = (SPRITE_FLAG(PRIORITY, _priority) | (_flags));

#define SPRITE_INIT(_sprite, _numTiles, _anim, _variant, _UNK1A, _priority)             \
    SPRITE_INIT_WITH_FLAGS(_sprite, _numTiles, _anim, _variant, _UNK1A, _priority, 0)

#define SF_SHIFT(name) (SPRITE_FLAG_SHIFT_##name)

#define SPRITE_FLAG(flagName, value) ((value) << SF_SHIFT(flagName))

#define SPRITE_FLAG_GET(sprite, flagName)                                               \
    (((sprite)->unk10 & (SPRITE_FLAG_MASK_##flagName)) >> (SF_SHIFT(flagName)))

#define SPRITE_FLAG_CLEAR(sprite, flagName)                                             \
    (sprite)->unk10 &= ~(SPRITE_FLAG_MASK_##flagName)

#define SPRITE_FLAG_SET(sprite, flagName)                                               \
    (sprite)->unk10 |= (SPRITE_FLAG_MASK_##flagName)

#define SPRITE_FLAG_FLIP(sprite, flagName)                                              \
    (sprite)->unk10 ^= (SPRITE_FLAG_MASK_##flagName)

#define SPRITE_FLAG_SET_VALUE(sprite, flagName, value)                                  \
    (sprite)->unk10 |= SPRITE_FLAG(flagName, value)

#define SPRITE_FLAG_SHIFT_ROT_SCALE             0
#define SPRITE_FLAG_SHIFT_ROT_SCALE_ENABLE      5
#define SPRITE_FLAG_SHIFT_ROT_SCALE_DOUBLE_SIZE 6
#define SPRITE_FLAG_SHIFT_OBJ_MODE              7
#define SPRITE_FLAG_SHIFT_MOSAIC                9
#define SPRITE_FLAG_SHIFT_X_FLIP                10
#define SPRITE_FLAG_SHIFT_Y_FLIP                11
#define SPRITE_FLAG_SHIFT_PRIORITY              12
#define SPRITE_FLAG_SHIFT_ANIM_OVER             14
#define SPRITE_FLAG_SHIFT_BG_ID                 15
#define SPRITE_FLAG_SHIFT_17                    17
#define SPRITE_FLAG_SHIFT_18                    18
#define SPRITE_FLAG_SHIFT_19                    19
#define SPRITE_FLAG_SHIFT_26                    26
#define SPRITE_FLAG_SHIFT_30                    30
#define SPRITE_FLAG_SHIFT_31                    31

#define SPRITE_FLAG_MASK_ROT_SCALE             SPRITE_FLAG(ROT_SCALE, 0x1F)
#define SPRITE_FLAG_MASK_ROT_SCALE_ENABLE      SPRITE_FLAG(ROT_SCALE_ENABLE, 1)
#define SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1)
#define SPRITE_FLAG_MASK_OBJ_MODE              SPRITE_FLAG(OBJ_MODE, 3)
#define SPRITE_FLAG_MASK_MOSAIC                SPRITE_FLAG(MOSAIC, 1)
#define SPRITE_FLAG_MASK_X_FLIP                SPRITE_FLAG(X_FLIP, 1)
#define SPRITE_FLAG_MASK_Y_FLIP                SPRITE_FLAG(Y_FLIP, 1)
#define SPRITE_FLAG_MASK_PRIORITY              SPRITE_FLAG(PRIORITY, 3)
#define SPRITE_FLAG_MASK_ANIM_OVER             SPRITE_FLAG(ANIM_OVER, 1)
#define SPRITE_FLAG_MASK_BG_ID                 SPRITE_FLAG(BG_ID, 3)
#define SPRITE_FLAG_MASK_17                    SPRITE_FLAG(17, 1)
#define SPRITE_FLAG_MASK_18                    SPRITE_FLAG(18, 1)
#define SPRITE_FLAG_MASK_19                    SPRITE_FLAG(19, 1)
#define SPRITE_FLAG_MASK_26                    SPRITE_FLAG(26, 1)
#define SPRITE_FLAG_MASK_30                    SPRITE_FLAG(30, 1)
#define SPRITE_FLAG_MASK_31                    SPRITE_FLAG(31, 1)

#endif
