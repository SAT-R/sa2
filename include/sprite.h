#ifndef GUARD_SPRITE_H
#define GUARD_SPRITE_H

#include "global.h"
#include "malloc_vram.h"

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

#define BACKGROUND_FLAGS_BG_ID(id)        (id)
#define BACKGROUND_FLAGS_MASK_BG_ID       0x3
#define BACKGROUND_FLAG_4                 0x4
#define BACKGROUND_DISABLE_TILESET_UPDATE 0x8
#define BACKGROUND_DISABLE_PALETTE_UPDATE 0x10
#define BACKGROUND_FLAG_20                0x20
#define BACKGROUND_FLAG_IS_LEVEL_MAP      0x40
#define BACKGROUND_FLAG_80                0x80
#define BACKGROUND_FLAG_100               0x100
#define BACKGROUND_UPDATE_ANIMATIONS      0x200
#define BACKGROUND_FLAG_400               0x400
#define BACKGROUND_FLAG_800               0x800

// TODO: potentially rename these. For now, all we know is
// that they are used in the same functions which handles
// bg sprites
#define INIT_BG_SPRITES_LAYER_32(index)                                                                                                    \
    ({                                                                                                                                     \
        gBgSprites_Unknown1[(index)] = 0;                                                                                                  \
        gBgSprites_Unknown2[(index)][0] = 0;                                                                                               \
        gBgSprites_Unknown2[(index)][1] = 0;                                                                                               \
        gBgSprites_Unknown2[(index)][2] = 255;                                                                                             \
        gBgSprites_Unknown2[(index)][3] = 32;                                                                                              \
    });

#define INIT_BG_SPRITES_LAYER_64(index)                                                                                                    \
    ({                                                                                                                                     \
        gBgSprites_Unknown1[(index)] = 0;                                                                                                  \
        gBgSprites_Unknown2[(index)][0] = 0;                                                                                               \
        gBgSprites_Unknown2[(index)][1] = 0;                                                                                               \
        gBgSprites_Unknown2[(index)][2] = 255;                                                                                             \
        gBgSprites_Unknown2[(index)][3] = 64;                                                                                              \
    })

#define INIT_BG_SPRITES_LAYER_128(index)                                                                                                   \
    ({                                                                                                                                     \
        gBgSprites_Unknown1[(index)] = 0;                                                                                                  \
        gBgSprites_Unknown2[(index)][0] = 0;                                                                                               \
        gBgSprites_Unknown2[(index)][1] = 0;                                                                                               \
        gBgSprites_Unknown2[(index)][2] = 255;                                                                                             \
        gBgSprites_Unknown2[(index)][3] = 128;                                                                                             \
    })

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
    /* 0x0C */ u16 *layoutVram;

    // Stage-Map: Metatiles
    // Common Tilemaps: Tilemap-Tiles
    /* 0x10 */ const u16 *layout;

    // Tile-count on each axis
    // - Stage maps: should be 12 (# per metatile)
    // - Common Tilemaps: should be .targetTilesX/Y
    /* 0x14 */ u16 xTiles;
    /* 0x16 */ u16 yTiles;

    /* 0x18 */ u16 unk18;
    /* 0x1A */ u16 unk1A;
    /* 0x1C */ u16 tilemapId;
    /* 0x1E */ u16 unk1E;

    /* 0x20 */ u16 unk20;
    /* 0x22 */ u16 unk22;
    /* 0x24 */ u16 unk24;

    /* Tile-Dimensions for the rendering target */
    /* - Stage maps: DISPLAY_WIDTH/_HEIGHT + 1*TILE_WIDTH */
    /* - Common Tilemaps: full image dimensions */
    /* 0x26 */ u16 targetTilesX;
    /* 0x28 */ u16 targetTilesY;

    /* 0x2A */ u8 paletteOffset;
    /* 0x2B */ u8 animFrameCounter;
    /* 0x2C */ u8 animDelayCounter;

    /* 0x2E */ u16 flags;

    // apparently NOT signed?
    /* 0x30 */ u16 scrollX;
    /* 0x32 */ u16 scrollY;
    /* 0x34 */ u16 prevScrollX;
    /* 0x36 */ u16 prevScrollY;

    /* Only used by stage maps (they are encoded as Tilemaps) */
    /* 0x38 */ const MetatileIndexType *metatileMap;
    /* 0x3C */ u16 mapWidth;
    /* 0x3E */ u16 mapHeight;
} Background; /* size = 0x40 */

typedef struct {
#if (ENGINE >= ENGINE_3)
    // In SA3 flip-bits are integrated into the oamIndex.
    // X-Flip: Bit 14
    // Y-Flip: Bit 15
    /* 0x00 */ u16 oamIndex;
#else
    /* 0x00 */ u8 flip;

    // every animation has an associated oamData pointer, oamIndex starts at
    // 0 for every new animation and ends at variantCount-1
    /* 0x01 */ u8 oamIndex;
#endif

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

// TODO: Verify "(in)active" name
#define HITBOX_STATE_INACTIVE -1
#define HITBOX_IS_ACTIVE(hb)  ((hb).index != HITBOX_STATE_INACTIVE)

typedef struct {
    // index: -1 on init; lower 4 bits = index (in anim-cmds)
    /* 0x00 */ s32 index;

    // TODO: Make this a Rect8, like in SA1 and SA3!
    /* 0x04 */ s8 left;
    /* 0x05 */ s8 top;
    /* 0x06 */ s8 right;
    /* 0x07 */ s8 bottom;
} Hitbox;

#define SPRITE_ANIM_SPEED(speed) ((int)((float)(speed)*0x10))
#define SPRITE_OAM_ORDER(index)  ((index) << 6)
#define GET_SPRITE_OAM_ORDER(s)  ((((s)->oamFlags) & 0x7C0) >> 6)

typedef struct {
    /* 0x00 */ struct GraphicsData graphics;
    /* 0x0C */ const SpriteOffset *dimensions;

    // Bitfield description from KATAM decomp
    /* 0x10 */ u32 frameFlags; // bit 0-4: affine-index / rotscale param selection
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
                               // bit 18
                               // bit 19-25(?)
                               // bit 26
                               // bit 27-29(?)
                               // bit 30
                               // bit 31

    /* 0x14 */ u16 animCursor;

    /* 0x16 */ s16 x;
    /* 0x18 */ s16 y;

    /* 0x1A */ u16 oamFlags; // bit 6-10: OAM order index

    /* 0x1C */ s16 qAnimDelay; // Q_8_8, in frames
    /* 0x1E */ u16 prevAnim;
    /* 0x20 */ u8 variant;
    /* 0x21 */ u8 prevVariant;

    // 0x08 = 0.5x, 0x10 = 1.0x, 0x20 = 2.0x ...
    /* 0x22 */ u8 animSpeed;

    /* 0x23 */ u8 oamBaseIndex;
    /* 0x24 */ u8 numSubFrames;
    /* 0x25 */ u8 palId;
    /* 0x28 */ Hitbox hitboxes[1];
} Sprite /* size = 0x30 */;

// TODO: Unify Sprite with variable hitbox count through a macro
typedef struct {
    Sprite s;
    Hitbox hb1;
} Sprite2;

// TODO: Unify Sprite with variable hitbox count through a macro
typedef struct {
    Sprite s;
    Hitbox hb1;
    Hitbox hb2;
} Sprite3;

typedef struct {
    /* 0x00 */ u16 rotation;
    /* 0x02 */ s16 qScaleX;
    /* 0x04 */ s16 qScaleY;
    /* 0x06 */ s16 x;
    /* 0x08 */ s16 y;
} SpriteTransform; /* size 0xA */

typedef struct {
    /* 0x00 */ s16 unk0[4];
    /* 0x08 */ s16 qDirX;
    /* 0x0A */ s16 qDirY;

    /* 0x0C */ s16 unkC[2];

    /* 0x10 */ s32 posX;
    /* 0x14 */ s32 posY;

    /* 0x18 */ s16 unk18[2][2];
    /* 0x20 */ u16 affineIndex;
} UnkSpriteStruct;

typedef struct {
    /* 0x00 */ u32 numTiles;
    /* 0x04 */ AnimId anim;
    /* 0x06 */ u8 variant;
} TileInfo;

// NOTE: (Only?) used by by src/game/bosses/final_intro.c
typedef struct {
    /* 0x00 */ void *tiles;
    /* 0x04 */ AnimId anim;
    /* 0x06 */ u8 variant;
} TileInfoPtr;

PACKED(TileInfo16, {
    /* 0x00 */ u16 numTiles;
    /* 0x02 */ AnimId anim;
    /* 0x04 */ u16 variant;
});

extern const u8 gOamShapesSizes[12][2];

typedef enum {
    ACMD_RESULT__ANIM_CHANGED = -1,
    ACMD_RESULT__ENDED = 0,
    ACMD_RESULT__RUNNING = +1,
} AnimCmdResult;

AnimCmdResult UpdateSpriteAnimation(Sprite *);

void DisplaySprite(Sprite *);
void DrawBackground(Background *);
bool32 SA2_LABEL(sub_8002B20)(void);
bool32 SA2_LABEL(sub_80039E4)(void);
bool32 SA2_LABEL(sub_8004010)(void);
void ProcessOamBuffers(void);
OamData *OamMalloc(u8 order);

void TransformSprite(Sprite *, SpriteTransform *);
void UnusedTransform(Sprite *, SpriteTransform *);
void sub_8004E14(Sprite *, SpriteTransform *);

void sub_8003EE4(u16 p0, s16 p1, s16 p2, s16 p3, s16 p4, s16 p5, s16 p6, BgAffineReg *affine);
void sub_8006228(u8 p0, u8 p1, u8 p2, u8 p3, u8 p4, u8 p5);
void sub_80064A8(u8 p0, u8 p1, u8 p2, u8 p3, u8 p4, u8 p5);

s32 UpdateSpriteAnimation_BG(Sprite *);
void DisplaySprite_BG(Sprite *);
void sub_80047A0(u16, s16, s16, u16);

s16 sub_8004418(s16 x, s16 y);
void numToASCII(u8 digits[5], u16 number);

#if ((GAME == GAME_SA1) || (GAME == GAME_SA2))
#define GET_SPRITE_ANIM(s) ((s)->graphics.anim)
#else
#define GET_SPRITE_ANIM(s) ((s)->anim)
#endif

#define SpriteShouldUpdate(sprite) (((sprite)->prevVariant != (sprite)->variant) || ((sprite)->prevAnim != (sprite)->graphics.anim))

#define SPRITE_INIT_ANIM_IF_CHANGED(_sprite)                                                                                               \
    if (SpriteShouldUpdate(_sprite)) {                                                                                                     \
        (_sprite)->graphics.size = 0;                                                                                                      \
        (_sprite)->prevVariant = (_sprite)->variant;                                                                                       \
        (_sprite)->prevAnim = (_sprite)->graphics.anim;                                                                                    \
        (_sprite)->animCursor = 0;                                                                                                         \
        (_sprite)->qAnimDelay = 0;                                                                                                         \
        SPRITE_FLAG_CLEAR(_sprite, ANIM_OVER);                                                                                             \
    }

#define SPRITE_INIT_ANIM(_sprite, _anim, _variant, _order)                                                                                 \
    _sprite->graphics.anim = _anim;                                                                                                        \
    _sprite->variant = _variant;                                                                                                           \
    _sprite->oamFlags = SPRITE_OAM_ORDER(_order);                                                                                          \
    _sprite->graphics.size = 0;

#define SPRITE_INIT_SCRIPT(_sprite, _speed)                                                                                                \
    _sprite->animCursor = 0;                                                                                                               \
    _sprite->qAnimDelay = 0;                                                                                                               \
    _sprite->prevVariant = -1;                                                                                                             \
    _sprite->animSpeed = SPRITE_ANIM_SPEED(_speed);                                                                                        \
    _sprite->palId = 0;                                                                                                                    \
    _sprite->hitboxes[0].index = HITBOX_STATE_INACTIVE;

#define SPRITE_INIT_ANIM_AND_SCRIPT(_sprite, _anim, _variant, _order)                                                                      \
    SPRITE_INIT_ANIM(_sprite, _anim, _variant, _order);                                                                                    \
    SPRITE_INIT_SCRIPT(_sprite, 1.0);

#define SPRITE_INIT_WITH_POS(_sprite, _numTiles, _anim, _variant, _order, _priority)                                                       \
    _sprite->graphics.dest = VramMalloc(_numTiles);                                                                                        \
    SPRITE_INIT_ANIM(_sprite, _anim, _variant, _order);                                                                                    \
    _sprite->x = 0;                                                                                                                        \
    _sprite->y = 0;                                                                                                                        \
    SPRITE_INIT_SCRIPT(_sprite, 1.0)                                                                                                       \
    _sprite->frameFlags = SPRITE_FLAG(PRIORITY, _priority);

#define SPRITE_INIT_WITHOUT_VRAM(_sprite, _anim, _variant, _order, _priority, _flags)                                                      \
    SPRITE_INIT_ANIM_AND_SCRIPT(_sprite, _anim, _variant, _order);                                                                         \
    _sprite->frameFlags = (SPRITE_FLAG(PRIORITY, _priority) | (_flags));

#define SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(_sprite, _order, _priority, _flags)                                                               \
    _sprite->oamFlags = SPRITE_OAM_ORDER(_order);                                                                                          \
    _sprite->graphics.size = 0;                                                                                                            \
    SPRITE_INIT_SCRIPT(_sprite, 1.0);                                                                                                      \
    _sprite->frameFlags = (SPRITE_FLAG(PRIORITY, _priority) | (_flags));

#define SPRITE_INIT_FLAGS(_sprite, _numTiles, _anim, _variant, _order, _priority, _flags)                                                  \
    _sprite->graphics.dest = VramMalloc(_numTiles);                                                                                        \
    SPRITE_INIT_WITHOUT_VRAM(_sprite, _anim, _variant, _order, _priority, _flags);

#define SPRITE_INIT(_sprite, _numTiles, _anim, _variant, _order, _priority)                                                                \
    SPRITE_INIT_FLAGS(_sprite, _numTiles, _anim, _variant, _order, _priority, 0)

#define SF_SHIFT(name) (SPRITE_FLAG_SHIFT_##name)

#define SPRITE_FLAG(flagName, value) ((value) << SF_SHIFT(flagName))

#define SPRITE_FLAG_GET(sprite, flagName) (((sprite)->frameFlags & (SPRITE_FLAG_MASK_##flagName)) >> (SF_SHIFT(flagName)))

#define SPRITE_FLAG_CLEAR(sprite, flagName) (sprite)->frameFlags &= ~(SPRITE_FLAG_MASK_##flagName)

#define SPRITE_FLAG_SET(sprite, flagName) (sprite)->frameFlags |= (SPRITE_FLAG_MASK_##flagName)

#define SPRITE_FLAG_FLIP(sprite, flagName) (sprite)->frameFlags ^= (SPRITE_FLAG_MASK_##flagName)

#define SPRITE_FLAG_SET_VALUE(sprite, flagName, value) (sprite)->frameFlags |= SPRITE_FLAG(flagName, value)

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

#define SPRITE_FLAG_MASK_ROT_SCALE             SPRITE_FLAG(ROT_SCALE, 0x1F) // 0x1F
#define SPRITE_FLAG_MASK_ROT_SCALE_ENABLE      SPRITE_FLAG(ROT_SCALE_ENABLE, 1) // 0x20
#define SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) // 0x40

#define SPRITE_FLAG_MASK_OBJ_MODE  SPRITE_FLAG(OBJ_MODE, 3) // 0x180
#define SPRITE_FLAG_MASK_MOSAIC    SPRITE_FLAG(MOSAIC, 1) // 0x200
#define SPRITE_FLAG_MASK_X_FLIP    SPRITE_FLAG(X_FLIP, 1) // 0x400
#define SPRITE_FLAG_MASK_Y_FLIP    SPRITE_FLAG(Y_FLIP, 1) // 0x800
#define SPRITE_FLAG_MASK_PRIORITY  SPRITE_FLAG(PRIORITY, 3) // 0x3000
#define SPRITE_FLAG_MASK_ANIM_OVER SPRITE_FLAG(ANIM_OVER, 1)
#define SPRITE_FLAG_MASK_BG_ID     SPRITE_FLAG(BG_ID, 3)
#define SPRITE_FLAG_GLOBAL_OFFSET  SPRITE_FLAG(17, 1)
#define SPRITE_FLAG_MASK_18        SPRITE_FLAG(18, 1) // 0x40000
#define SPRITE_FLAG_MASK_19        SPRITE_FLAG(19, 1)
#define SPRITE_FLAG_MASK_26        SPRITE_FLAG(26, 1)
#define SPRITE_FLAG_MASK_30        SPRITE_FLAG(30, 1)
#define SPRITE_FLAG_MASK_31        SPRITE_FLAG(31, 1)

#endif
