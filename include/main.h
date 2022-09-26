#ifndef GUARD_MAIN_H
#define GUARD_MAIN_H

#include "global.h"
#include "data.h"
#include "task.h"
#include "sprite.h"

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

struct MultiSioData_0_1{
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

union MultiSioData {
    struct MultiSioData_0_0 pat0;
    struct MultiSioData_0_1 pat1;
}; /* size = MULTI_SIO_BLOCK_SIZE */

// Used for the two background layers.
struct MapHeader {
    u16 X_Tiles; // Tiles inside Metatiles, usually 12 (0x0C)
    u16 Y_Tiles; // Tiles inside Metatiles, usually 12 (0x0C)
    u16 unk4;
    u8 unk6;
    u8 unk7;
    void * Tileset;
    u16 unkC;
    u16 unkD;
    u16 * Palette;
    u16 unk14;
    u16 unk16;
    const u16 * Metatiles;
    const u16 * Map;
}; /* size = 0x20 */

struct MapHeader_Full {
    struct MapHeader unk0;
    u16 Map_Width;  // in Metatiles
    u16 Map_Height; // in Metatiles
};

union __attribute__((transparent_union)) Unk_03002E60 {
    struct MapHeader *x;
    struct MapHeader_Full *y;
};

extern u32 gFlags;
extern u32 gFlagsPreVBlank;

extern u32 gFrameCount;

extern IntrFunc gIntrTable[16];
extern u32 gIntrMainBuf[0x80];

extern struct Task* gCurTask;
extern struct Task gTasks[MAX_TASK_NUM];
extern struct Task* gTaskPtrs[MAX_TASK_NUM];
extern struct Task* gNextTask;
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

extern const u8* gInputPlaybackData;
extern struct InputRecorder gInputRecorder;
extern u16* gInputRecorderTapeBuffer;

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
extern u16 gWinRegs[6];
extern struct BlendRegs gBldRegs;
extern struct BgAffineRegs gBgAffineRegs;
extern u16 gObjPalette[OBJ_PLTT_SIZE / sizeof(u16)];
extern u16 gBgPalette[BG_PLTT_SIZE / sizeof(u16)];
extern u16 gBgCntRegs[4];
extern s16 gBgScrollRegs[4][2];

extern OamData gUnknown_030022C8;
extern OamData gUnknown_030022D0[128];
extern OamData gOamBuffer[128];

extern u32 gUnknown_03001B60[2][160];
extern struct Unk_03002400* gUnknown_03001800[16];

extern void* gUnknown_03001884;

extern u16 gUnknown_030017F0;
extern u16 gUnknown_030017F4[2];
extern u8 gUnknown_03001850[32];
extern FuncType_030053A0 gUnknown_03001870[4];

extern u8 gUnknown_030018F0;
extern u16 gUnknown_03001944;
extern u8 gUnknown_03001948;
extern u16 gUnknown_0300194C;

union Unk_03002E60 *gUnknown_03002260;
extern u8 gUnknown_03002280[16];
extern u8 gUnknown_03004D80[16];
extern void* gUnknown_030022AC;
extern void* gUnknown_030022C0;
extern s16 gUnknown_030026D0;
extern u8 gUnknown_030026F4;
extern const struct SpriteTables* gUnknown_03002794;
extern struct Unk_03002EC0* gUnknown_030027A0[32];
extern u16 gUnknown_03002820;
extern u8 gUnknown_03002874;
extern void* gUnknown_03002878;
extern u8 gUnknown_0300287C;
extern u8 gUnknown_03002A80;
extern u8 gUnknown_03002A84;
extern u16 gUnknown_03002A8C;
extern u8 gUnknown_03002AE0;
extern u8 gUnknown_03002AE4;
extern u8 gUnknown_03004D10[0x40];
extern u8 gUnknown_03004D50;
extern void* gUnknown_03004D54;
extern u16 gUnknown_03004D58;
extern u8 gUnknown_03004D5C;
extern u8 gUnknown_03004D60[0x20];
extern u8 gUnknown_03005390;
extern u16 gUnknown_03005394;
extern u16 gUnknown_03005398;
extern FuncType_030053A0 gUnknown_030053A0[4];
extern u32 gUnknown_030053B8;
extern u8 gUnknown_03002710[128];
u8 gUnknown_03002A90[74];

#endif
