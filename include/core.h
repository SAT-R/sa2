#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

#if !GEN_CTX
#include <string.h> // memcpy
#endif

#include "global.h"
#include "rect.h"
#include "task.h"
#include "flags.h"
#include "tilemap.h"
#include "input_recorder.h"

#define VRAM_HEAP_TILE_SIZE         TILE_SIZE_4BPP
#define VRAM_HEAP_SEGMENT_SIZE      (4 * VRAM_HEAP_TILE_SIZE)
#define VRAM_TILE_SLOTS_PER_SEGMENT (VRAM_HEAP_SEGMENT_SIZE / VRAM_HEAP_TILE_SIZE)

// TODO: Find out where these numbers come from
#if (ENGINE == ENGINE_1)
#define VRAM_TILE_SEGMENTS   156
#define VRAM_HEAP_TILE_COUNT 112
#elif (ENGINE == ENGINE_2)
#if COLLECT_RINGS_ROM
#define VRAM_TILE_SEGMENTS   128
#define VRAM_HEAP_TILE_COUNT 0
#else
#define VRAM_TILE_SEGMENTS   140
#define VRAM_HEAP_TILE_COUNT 48
#endif
#endif

struct MultiSioData_0_0 {
    // id
    u16 unk0;
    // value
    u8 unk2;

    u8 unk3;
    u32 unk4;
    u16 unk8[3];

    // TODO: all values from unkE onwards appear to be 'RoomEvent' types?
    // This seems to apply to all 'MultiSioData_X_X' types?
    u8 unkE;
    u8 unkF;
    u32 unk10;
};

struct MultiSioData_0_1 {
    // id
    u16 unk0;
    // value
    u8 unk2;

    u8 unk3;

    u16 unk4;
    u16 unk6;

    u16 unk8[3];

    // TODO: all values from unkE onwards appear to be 'RoomEvent' types?
    // This seems to apply to all 'MultiSioData_X_X' types?
    u8 unkE;
    u8 unkF;
    u32 unk10;
};
struct MultiSioData_0_2 {
    // id
    u8 unk0;
    u8 filler1;
    // value
    u8 unk2;

    u8 unk3;

    u16 unk4;
    u16 unk6;

    u16 unk8[3];

    // TODO: all values from unkE onwards appear to be 'RoomEvent' types?
    // This seems to apply to all 'MultiSioData_X_X' types?
    u8 unkE;
    u8 unkF;
    u32 unk10;
};

struct MultiSioData_0_3 {
    // id
    u16 unk0;
    // value
    u8 unk2;

    u8 unk3;

    u16 unk4;
    u16 unk6;

    u32 unk8;
    u16 unkC;

    // TODO: all values from unkE onwards appear to be 'RoomEvent' types?
    // This seems to apply to all 'MultiSioData_X_X' types?
    u8 unkE;
    u8 unkF;
    u32 unk10;
};

struct MultiSioData_0_4 {
    // id
    u16 unk0;
    // value
    s16 x;
    s16 y;
    u16 unk6;
    u16 unk8;
    u8 unkA;
    u8 unkB;
    u8 unkC;
    u8 unkD;

    // TODO: all values from unkE onwards appear to be 'RoomEvent' types?
    // This seems to apply to all 'MultiSioData_X_X' types?
    u8 unkE;
    u8 numRings;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
};

struct MultiSioData_0_5 {
    // id
    u16 unk0;
    // value
    s16 x;
    s16 y;

    u8 filler3[0x9];
    u8 sioId;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
};

union MultiSioData {
    struct MultiSioData_0_0 pat0;
    struct MultiSioData_0_1 pat1;
    struct MultiSioData_0_2 pat2;
    struct MultiSioData_0_3 pat3;
    struct MultiSioData_0_4 pat4;
    struct MultiSioData_0_5 pat5;
}; /* size = MULTI_SIO_BLOCK_SIZE */

// TODO: Have we defined this somewhere else already?
#define MAP_LAYER_COUNT 2

#if (GAME == GAME_SA1)
typedef u16 collPxDim_t;
#else
typedef u32 collPxDim_t;
#endif

typedef struct {
    u16 bldCnt;
    u16 bldAlpha;
    u16 bldY;
} BlendRegs;

// Values to be passed top the affine registers
// (used by BG2/BG3 in affine screen modes)
typedef struct {
    /* 0x00 */ u16 pa, pb, pc, pd;
    /* 0x08 */ u32 x, y;
} BgAffineReg;

// Thanks @MainMemory_ for figuring out how collision is stored!
typedef struct {
    /* 0x00 */ const s8 *height_map;
    /* 0x04 */ const u8 *tile_rotation;
    /* 0x08 */ const u16 *metatiles;
    /* 0x0C */ const MetatileIndexType *map[MAP_LAYER_COUNT];
    /* 0x14 */ const u16 *flags;
    /* 0x18 */ u16 levelX, levelY;
    /* 0x1C */ collPxDim_t pxWidth, pxHeight;

    // unk20/unk22 are not in SA1
} Collision;

struct Unk_03003674_1_Sub {
    u16 unk0, unk2, unk4, unk6;
    s16 unk8, unkA;
}; /* size = 0xC */

struct Unk_03003674_1_Full {
    struct Unk_03003674_1_Sub sub;
    u32 unkC;
}; /* size = 0x10 */

union Unk_03003674_1 {
    const struct Unk_03003674_1_Sub *sub;
    const struct Unk_03003674_1_Full *full;
};

struct Unk_03003674 {
    const union Unk_03003674_0 *const *unk0;
    const union Unk_03003674_1 *unk4;
    const u16 *const *unk8;
    const void *unkC;
    const void *unk10;
    const void *unk14;
    const s32 *unk18;
}; /* size = 0x1C */

typedef u16 AnimId;

typedef struct {
    /* 0x00 */ const void *src;
    /* 0x04 */ void *dest;
    /* 0x08 */ u16 size;
    /* 0x0A */ AnimId anim;
} GraphicsData;

typedef struct {
    /* 0x00 */ GraphicsData graphics;

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

typedef struct {
    // index: -1 on init; lower 4 bits = index (in anim-cmds)
    /* 0x00 */ s32 index;
    /* 0x04 */ Rect8 b;
} Hitbox;

typedef struct {
    /* 0x00 */ GraphicsData graphics;
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

#define AnimCommandSizeInWords(_structType) ((sizeof(_structType)) / sizeof(s32))

typedef struct {
    /* 0x00 */ s32 cmdId; // -2

    // Note(Jace): This needs to be signed, since a
    //             negative value infers that it's using 8bit-colors
    /* 0x04 */ s32 tileIndex;

    /* 0x08 */ u32 numTilesToCopy;
} ACmd_GetTiles;

typedef struct {
    /* 0x00 */ s32 cmdId; // -2

    /* 0x04 */ s32 palId;
    /* 0x06 */ u16 numColors;
    /* 0x08 */ u16 insertOffset;
} ACmd_GetPalette;

typedef struct {
    /* 0x00 */ s32 cmdId; // -3

    /* 0x04 */ s32 offset;
} ACmd_JumpBack;

typedef struct {
    /* 0x00 */ s32 cmdId; // -4
} ACmd_4;

typedef struct {
    /* 0x00 */ s32 cmdId; // -5

    /* 0x04 */ u16 songId;
} ACmd_PlaySoundEffect;

// TODO: param types unknown
typedef struct {
    /* 0x00 */ s32 cmdId; // -6

    /* 0x04 */ Hitbox hitbox;
} ACmd_Hitbox;

typedef struct {
    /* 0x00 */ s32 cmdId; // -7

    /* 0x04 */ u16 x;
    /* 0x06 */ u16 y;
} ACmd_TranslateSprite;

typedef struct {
    /* 0x00 */ s32 cmdId; // -8

    /* 0x04 */ s32 unk4;
    /* 0x08 */ s32 unk8;
} ACmd_8;

typedef struct {
    /* 0x00 */ s32 cmdId; // -9

    /* 0x04 */ AnimId animId;
    /* 0x06 */ u16 variant;
} ACmd_SetIdAndVariant;

typedef struct {
    /* 0x00 */ s32 cmdId; // -10

    /* 0x04 */ s32 unk4;
    /* 0x08 */ s32 unk8;
    /* 0x0C */ s32 unkC;
} ACmd_10;

typedef struct {
    /* 0x00 */ s32 cmdId; // -11

    /* 0x04 */ s32 priority;
} ACmd_SetSpritePriority;

typedef struct {
    /* 0x00 */ s32 cmdId; // -12

    /* 0x04 */ s32 orderIndex;
} ACmd_SetOamOrder;

typedef struct {
    // number of frames this will be displayed
    s32 delay;

    // frameId of this animation that should be displayed
    s32 index;
} ACmd_ShowFrame;

typedef union {
    s32 id;

    ACmd_GetTiles tiles;
    ACmd_GetPalette pal;
    ACmd_JumpBack jump;
    ACmd_4 end;
    ACmd_PlaySoundEffect sfx;
    ACmd_Hitbox _6;
    ACmd_TranslateSprite translate;
    ACmd_8 _8;
    ACmd_SetIdAndVariant setAnimId;
    ACmd_10 _10;
    ACmd_SetSpritePriority _11;
    ACmd_SetOamOrder setOamOrder;

    ACmd_ShowFrame show;
} ACmd;

typedef enum {
    ACMD_RESULT__ANIM_CHANGED = -1,
    ACMD_RESULT__ENDED = 0,
    ACMD_RESULT__RUNNING = +1,
} AnimCmdResult;

typedef AnimCmdResult (*AnimationCommandFunc)(void *cursor, Sprite *sprite);

typedef struct {
    /* 0x00 */ const ACmd **const *animations;
    /* 0x04 */ const SpriteOffset *const *dimensions;
    /* 0x08 */ const u16 **const oamData;
    /* 0x0C */ const ColorRaw *const palettes;
    /* 0x10 */ const u8 *const tiles_4bpp;
    /* 0x14 */ const u8 *const tiles_8bpp;
} SpriteTables;

// No idea why this exists when there is a
// better random number generator in the math
// module
#define PSEUDO_RANDOM_32()                                                                                                                 \
    ({                                                                                                                                     \
        gPseudoRandom = (gPseudoRandom * 0x196225) + 0x3C6EF35F;                                                                           \
        gPseudoRandom;                                                                                                                     \
    })

#define MP_PSEUDO_RANDOM_32()                                                                                                              \
    ({                                                                                                                                     \
        gMultiplayerPseudoRandom = (gMultiplayerPseudoRandom * 0x196225) + 0x3C6EF35F;                                                     \
        gMultiplayerPseudoRandom;                                                                                                          \
    })

// TODO: align the usage of this between both games
#if (GAME == GAME_SA1)
#define PseudoRandBetween(min, max) ((PSEUDO_RANDOM_32() & ((-min) + (max))) + (min))
#else
#define PseudoRandBetween(min, max) ((PSEUDO_RANDOM_32() & ((-min) + (max - 1))) + (min))
#endif

extern u32 gFlags;
extern u32 gFlagsPreVBlank;

extern u32 gFrameCount;

#define INTR_INDEX_SIO     0
#define INTR_INDEX_VBLANK  1
#define INTR_INDEX_HBLANK  2
#define INTR_INDEX_VCOUNT  3
#define INTR_INDEX_TIMER0  4
#define INTR_INDEX_TIMER1  5
#define INTR_INDEX_TIMER2  6
#define INTR_INDEX_DMA0    7
#define INTR_INDEX_DMA1    8
#define INTR_INDEX_DMA2    9
#define INTR_INDEX_DMA3    10
#define INTR_INDEX_KEYPAD  11
#define INTR_INDEX_GAMEPAK 12
extern IntrFunc gIntrTable[16];
extern IntrFunc const gIntrTableTemplate[14];
extern u32 gIntrMainBuf[0x80];

extern Task *gCurTask;
extern Task gTasks[MAX_TASK_NUM];
extern Task *gTaskPtrs[MAX_TASK_NUM];
extern Task *gNextTask;
extern Task gEmptyTask;
extern s32 gNumTasks;

extern u16 gInput;
extern u16 gPrevInput;
extern u16 gPhysicalInput;
extern u16 gReleasedKeys;
extern u16 gRepeatedKeys;
extern u16 gPressedKeys;
extern u8 gKeysFirstRepeatIntervals[10];
extern u8 gRepeatedKeysTestCounter[10];
extern u8 gKeysContinuedRepeatIntervals[10];

extern const u8 *gInputPlaybackData;
extern struct InputRecorder gInputRecorder;
extern u16 *gInputRecorderTapeBuffer;

extern union MultiSioData gMultiSioSend;
extern union MultiSioData gMultiSioRecv[4];
extern u32 gMultiSioStatusFlags;
extern bool8 gMultiSioEnabled;

extern HBlankIntrFunc gHBlankIntrs[4];
extern HBlankIntrFunc gHBlankCallbacks[4];
extern u8 gNumHBlankCallbacks;
extern u8 gNumHBlankIntrs;

extern u8 gIwramHeap[TASK_HEAP_SIZE];

extern void *gVramHeapStartAddr;
extern u16 gVramHeapMaxTileSlots;
extern u16 gVramHeapState[OBJ_VRAM_TOTAL_SIZE / VRAM_HEAP_SEGMENT_SIZE];

extern bool8 gExecSoundMain;

extern u16 gDispCnt;

#define WINREG_WIN0H  0
#define WINREG_WIN1H  1
#define WINREG_WIN0V  2
#define WINREG_WIN1V  3
#define WINREG_WININ  4
#define WINREG_WINOUT 5

// TODO: Use these everywhere in SA1!
#define PALETTE_LEN_4BPP                                    16u
#define GET_PALETTE_COLOR_OBJ(_paletteId, _colorId)         gObjPalette[(_paletteId)*PALETTE_LEN_4BPP + (_colorId)]
#define GET_PALETTE_COLOR_BG(_paletteId, _colorId)          gBgPalette[(_paletteId)*PALETTE_LEN_4BPP + (_colorId)]
#define SET_PALETTE_COLOR_OBJ(_paletteId, _colorId, _color) GET_PALETTE_COLOR_OBJ(_paletteId, _colorId) = (_color);
#define SET_PALETTE_COLOR_BG(_paletteId, _colorId, _color)  GET_PALETTE_COLOR_BG(_paletteId, _colorId) = (_color);

extern winreg_t gWinRegs[6];
extern BlendRegs gBldRegs;
extern BgAffineReg gBgAffineRegs[NUM_AFFINE_BACKGROUNDS];
extern ColorRaw gObjPalette[16 * PALETTE_LEN_4BPP];
extern ColorRaw gBgPalette[16 * PALETTE_LEN_4BPP];
extern u16 gBgCntRegs[4];

// TODO: Turn this into a struct-array?
//       [4]{s16 x, s16 y}
extern s16 gBgScrollRegs[NUM_BACKGROUNDS][2];

extern OamData gOamMallocBuffer[OAM_ENTRY_COUNT];
extern OamData gOamBuffer[OAM_ENTRY_COUNT];

// NOTE(Jace): This could be u16[2][DISPLAY_HEIGHT][2] (or unsigned Vec2_16?)
extern int_vcount gBgOffsetsBuffer[2][DISPLAY_HEIGHT][4];
extern Background *gBackgroundsCopyQueue[16];

// This is used to buffer the xy-shift for each background scanline
extern void *gBgOffsetsHBlankPrimary;

extern u16 gSpriteTransformScaleX;
extern Vec2_16 gSpriteOffset;
extern u8 gOamMallocOrders_StartIndex[32];
extern IntrFunc gVBlankCallbacks[4];

extern u8 gOamFreeIndex;
extern u16 gSpriteTransformRotation;
extern u8 gNumVBlankIntrs;
extern s16 gSpriteTransformX;

extern Tilemap **gTilemapsRef;
extern u8 gBgSprites_Unknown2[4][4];
extern u8 gBgSprites_Unknown1[4];

#define LOG_GRAPHICS_QUEUE !TRUE
#if (!PLATFORM_GBA && LOG_GRAPHICS_QUEUE)
#define GFX_QUEUE_LOG_ADD(gfx)                                                                                                             \
    printf("GFX %d: src 0x%p, dst 0x%p, size 0x%04X\n", gVramGraphicsCopyQueueIndex, (gfx)->src,                                           \
           (void *)((intptr_t)(gfx)->dest - (intptr_t)VRAM), (gfx)->size);
#else
#define GFX_QUEUE_LOG_ADD(gfx)
#endif
extern GraphicsData *gVramGraphicsCopyQueue[32];
extern u8 gVramGraphicsCopyQueueIndex;
// Because the graphics in the queue only get copied if
// (gVramGraphicsCopyCursor != gVramGraphicsCopyQueueIndex),
// just making them equal will pause the queue.
#define PAUSE_GRAPHICS_QUEUE() gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;

#define INC_GRAPHICS_QUEUE_CURSOR(cursor) cursor = (cursor + 1) % ARRAY_COUNT(gVramGraphicsCopyQueue);

#if PORTABLE
// On the GBA we use a fixed heap to allocate memory
// but on other OS's we malloc and free memory which
// the graphics queue may be referring to. Instead we
// make a separate copy of the graphics queue with the
// pointers we need to copy so that a race condition
// happens where sprite has been freed but the copy
// has not happened we don't get invalid memory access
extern GraphicsData gVramGraphicsCopyQueueBuffer[32];
#define ADD_TO_GRAPHICS_QUEUE(gfx)                                                                                                         \
    memcpy(&gVramGraphicsCopyQueueBuffer[gVramGraphicsCopyQueueIndex], gfx, sizeof(GraphicsData));                                         \
    gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = &gVramGraphicsCopyQueueBuffer[gVramGraphicsCopyQueueIndex];                      \
    /* Log has to happen before gVramGraphicsCopyQueueIndex increment */                                                                   \
    GFX_QUEUE_LOG_ADD(gfx)                                                                                                                 \
    INC_GRAPHICS_QUEUE_CURSOR(gVramGraphicsCopyQueueIndex);
#else
#define ADD_TO_GRAPHICS_QUEUE(gfx)                                                                                                         \
    gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = gfx;                                                                             \
    /* Log has to happen before gVramGraphicsCopyQueueIndex increment */                                                                   \
    GFX_QUEUE_LOG_ADD(gfx)                                                                                                                 \
    INC_GRAPHICS_QUEUE_CURSOR(gVramGraphicsCopyQueueIndex);
#endif

#define PAUSE_BACKGROUNDS_QUEUE() gBackgroundsCopyQueueCursor = gBackgroundsCopyQueueIndex;

#define INC_BACKGROUNDS_QUEUE_CURSOR(cursor) cursor = (cursor + 1) % ARRAY_COUNT(gBackgroundsCopyQueue);

#define ADD_TO_BACKGROUNDS_QUEUE(_bg)                                                                                                      \
    gBackgroundsCopyQueue[gBackgroundsCopyQueueIndex] = _bg;                                                                               \
    INC_BACKGROUNDS_QUEUE_CURSOR(gBackgroundsCopyQueueIndex);

extern void *gBgOffsetsHBlankSecondary;
extern void *gBgOffsetsSecondary;
#if (GAME == GAME_SA2)
extern s16 gMosaicReg;
extern u8 gUnknown_030026F4;
#endif
extern s16 gSpriteTransformY;
extern u8 gVCountSetting;
extern void *gHBlankCopyTarget;
extern u8 gBackgroundsCopyQueueIndex;
extern u8 gHBlankCopySize;
extern u16 SA2_LABEL(gUnknown_03002A8C);
//// When paused, the previously-active OAM elements get moved to the end
//// of the OAM. This is the index of the first currently-inactive element
extern u8 gOamFirstPausedIndex;
extern u8 gBackgroundsCopyQueueCursor;
extern Sprite *gBgSprites[16];
extern u8 gNumVBlankCallbacks;
extern void *gBgOffsetsPrimary;
extern u16 SA2_LABEL(gUnknown_03004D58);
extern u8 gVramGraphicsCopyCursor;
extern u8 gOamMallocOrders_EndIndex[0x20];
extern u8 gBgSpritesCount;
extern u16 gSpriteTransformScaleY;
extern u16 gSpriteTransformScaleUnknown;
extern IntrFunc gVBlankIntrs[4];
extern s32 gPseudoRandom;
extern u8 gOamMallocCopiedOrder[128];
extern struct MultiBootParam gMultiBootParam;

extern const SpriteTables *gRefSpriteTables;

void EngineInit(void);
void EngineMainLoop(void);

#endif
