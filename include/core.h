#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

#include "global.h"
#include "task.h"
#include "sprite.h"
#include "tilemap.h"
#include "input_recorder.h"

struct MultiSioData_0_0 {
    // id
    u16 unk0;
    // value
    u8 unk2;

    u8 unk3;
    u32 unk4;
    u16 unk8[3];
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

    u8 filler3[0x9];
    u8 numRings;
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
}; /* size = MULTI_SIO_BLOCK_SIZE */

// TODO: Have we defined this somewhere else already?
#define MAP_LAYER_COUNT 2

// Thanks @MainMemory_ for figuring out how collision works!
typedef struct {
    /* 0x00 */ const s8 *height_map;
    /* 0x04 */ const u8 *tile_rotation;
    /* 0x08 */ const u16 *metatiles;
    /* 0x0C */ const u16 *map[MAP_LAYER_COUNT];
    /* 0x14 */ const u16 *flags;
    /* 0x18 */ u16 levelX, levelY;
    /* 0x1C */ u32 pxWidth; // u16 in SA1!
    /* 0x20 */ u32 pxHeight; // u16 in SA1!
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

// No idea why this exists when there is a
// better random number generator in the math
// module
#define PseudoRandom32()                                                                \
    ({                                                                                  \
        gPseudoRandom = (gPseudoRandom * 0x196225) + 0x3C6EF35F;                        \
        gPseudoRandom;                                                                  \
    })

#define MultiplayerPseudoRandom32()                                                     \
    ({                                                                                  \
        gMultiplayerPseudoRandom = (gMultiplayerPseudoRandom * 0x196225) + 0x3C6EF35F;  \
        gMultiplayerPseudoRandom;                                                       \
    })
#define PseudoRandBetween(min, max) ((PseudoRandom32() & ((-min) + (max))) + (min))

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

extern struct Task *gCurTask;
extern struct Task gTasks[MAX_TASK_NUM];
extern struct Task *gTaskPtrs[MAX_TASK_NUM];
extern struct Task *gNextTask;
extern struct Task gEmptyTask;
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

extern HBlankFunc gHBlankIntrs[4];
extern HBlankFunc gHBlankCallbacks[4];
extern u8 gNumHBlankCallbacks;
extern u8 gNumHBlankIntrs;

extern u8 gIwramHeap[0x2204];
extern u8 gEwramHeap[0x20080];

extern u32 gVramHeapStartAddr;
extern u16 gVramHeapMaxTileSlots;
extern u16 gVramHeapState[256];

extern bool8 gExecSoundMain;

extern u16 gDispCnt;

#define WINREG_WIN0H  0
#define WINREG_WIN1H  1
#define WINREG_WIN0V  2
#define WINREG_WIN1V  3
#define WINREG_WININ  4
#define WINREG_WINOUT 5
extern u16 gWinRegs[6];
extern struct BlendRegs gBldRegs;
extern BgAffineReg gBgAffineRegs[NUM_AFFINE_BACKGROUNDS];
extern u16 gObjPalette[OBJ_PLTT_SIZE / sizeof(u16)];
extern u16 gBgPalette[BG_PLTT_SIZE / sizeof(u16)];
extern u16 gBgCntRegs[4];

extern s16 gUnknown_03000408;

// TODO: Turn this into a struct-array:
//       [4]{s16 x, s16 y}
//       Should we introduce a
//       "#define NUM_BACKGROUNDS 4" in gba/defines.h?
extern s16 gBgScrollRegs[4][2];

extern OamData gUnknown_030022C8;
extern OamData gOamBuffer2[OAM_ENTRY_COUNT];
extern OamData gOamBuffer[OAM_ENTRY_COUNT];

// NOTE(Jace): This could be u16[2][DISPLAY_HEIGHT][2] (or unsigned Vec2_16?)
extern u32 gBgOffsetsBuffer[2][DISPLAY_HEIGHT];
extern Background *gUnknown_03001800[16];

// This is used to buffer the xy-shift for each background scanline
extern void *gBgOffsetsHBlank;

extern u16 gUnknown_030017F0;
extern s16 gUnknown_030017F4[2];
extern u8 gUnknown_03001850[32];
extern FuncType_030053A0 gUnknown_03001870[4];

extern u8 gOamFreeIndex;
extern u16 gUnknown_03001944;
extern u8 gUnknown_03001948;
extern u16 gUnknown_0300194C;

struct MapHeader **gTilemapsRef; // TODO: make this an array and add size
extern u8 gUnknown_03002280[4][4];
extern u8 gUnknown_03004D80[16];

extern u16 *gUnknown_030022AC;
extern void *gUnknown_030022C0;
extern s16 gMosaicReg;
extern u8 gUnknown_030026F4;
extern struct GraphicsData *gVramGraphicsCopyQueue[32];
extern u16 gUnknown_03002820;
extern u8 gUnknown_03002874;
extern void *gUnknown_03002878;
extern u8 gUnknown_0300287C;
extern u8 gUnknown_03002A80;
extern u8 gVramGraphicsCopyQueueIndex;
extern u16 gUnknown_03002A8C;
// When paused, the previously-active OAM elements get moved to the end
// of the OAM. This is the index of the first currently-inactive element
extern u8 gOamFirstPausedIndex;
extern u8 gUnknown_03002AE4;
extern Sprite *gUnknown_03004D10[16];
extern u8 gUnknown_03004D50;
extern void *gUnknown_03004D54;
extern u16 gUnknown_03004D58;
extern u8 gVramGraphicsCopyCursor;
extern u8 gUnknown_03004D60[0x20];
extern u8 gUnknown_03005390;
extern u16 gUnknown_03005394;
extern u16 gUnknown_03005398;
extern FuncType_030053A0 gUnknown_030053A0[4];
extern s32 gPseudoRandom;
extern u8 gUnknown_03002710[128];
extern struct MultiBootParam gMultiBootParam;

void GameInit(void);
void GameLoop(void);

#endif
