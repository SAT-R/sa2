#include "core.h"
#include "global.h"
#include "malloc_ewram.h"
#include "malloc_vram.h"
#include "multi_sio.h"
#include "sprite.h"
#include "task.h"
#include "flags.h"
#include "input_recorder.h"
#include "lib/m4a/m4a.h"
#include "lib/agb_flash/agb_flash.h"

// TODO: Better name
#define VBLANK_FUNC_ID_NONE 0xFF

// TODO: the order of these vars has
// been shuffled due to compilation losses.
// It's possible to use `ramscrgen` to reorder
// these variables in here and provide
// the matching order separately
IntrFunc gIntrTable[] = {};
u32 gIntrMainBuf[] = {};
struct Task gTasks[] = {};
u16 gUnknown_030017F0 ALIGNED(4) = 0;
s16 gUnknown_030017F4[2] ALIGNED(4) = {};
Background *gBackgroundsCopyQueue[] ALIGNED(16) = {};
u32 gFlags = 0;
u8 gUnknown_03001850[] ALIGNED(16) = {};
FuncType_030053A0 gVBlankCallbacks[] = {};
u16 gPhysicalInput = 0;

void *gBgOffsetsHBlank = NULL;

u16 gVramHeapMaxTileSlots = 0;
u8 gNumHBlankCallbacks ALIGNED(4) = 0;
union MultiSioData gMultiSioRecv[4] = {};
u8 gNumHBlankIntrs = 0;
struct BlendRegs gBldRegs ALIGNED(8) = {};
u8 gOamFreeIndex = 0;
struct Task gEmptyTask ALIGNED(16) = {};

#if (ENGINE >= ENGINE_3)
// NOTE: gNextFreeAffineIndex introduced in SA3, unused before.
u8 gNextFreeAffineIndex = 0;
#endif
BgAffineReg gBgAffineRegs[NUM_AFFINE_BACKGROUNDS] ALIGNED(8) = {};
void *gVramHeapStartAddr = NULL;
u16 gUnknown_03001944 ALIGNED(4) = 0;
u8 gNumVBlankIntrs ALIGNED(4) = 0;
u16 gUnknown_0300194C ALIGNED(4) = 0;

u32 gMultiSioStatusFlags = 0;
bool8 gMultiSioEnabled = FALSE;

struct Task *gTaskPtrs[] ALIGNED(16) = {};
int_vcount gBgOffsetsBuffer[2][DISPLAY_HEIGHT][4] = {}; /* TODO: Find out how this is different from gBgOffsetsHBlank */
u16 gObjPalette[] = {};
Tilemap **gTilemapsRef = NULL;
u32 gFrameCount = 0;
winreg_t gWinRegs[6] ALIGNED(16) = {};
s32 gNumTasks = 0;
u8 gUnknown_03002280[4][4] = {};
u16 gInput = 0;
u8 gRepeatedKeysTestCounter[] ALIGNED(16) = {};
void *gUnknown_030022AC = NULL;
u16 gBgCntRegs[] = {};
u16 gRepeatedKeys ALIGNED(4) = 0;
struct Task *gNextTask = NULL;
void *gUnknown_030022C0 = NULL;

OamData gOamBuffer2[OAM_ENTRY_COUNT] ALIGNED(16) = {};

#if (GAME == GAME_SA2)
s16 gMosaicReg = 0;
#endif

HBlankFunc gHBlankCallbacks[4] ALIGNED(16) = {};
struct Task *gCurTask = NULL;
u8 sLastCalledVblankFuncId = 0;
u8 gKeysFirstRepeatIntervals[10] ALIGNED(16) = {};

u16 gReleasedKeys ALIGNED(4) = 0;
u8 gUnknown_03002710[] ALIGNED(16) = {};
u32 gFlagsPreVBlank = 0;
/* 0x03002794 */ const struct SpriteTables *gRefSpriteTables = NULL;

#if PORTABLE
struct GraphicsData gVramGraphicsCopyQueueBuffer[32] = {};
#endif
struct GraphicsData *gVramGraphicsCopyQueue[] ALIGNED(16) = {};

u16 gUnknown_03002820 = 0;
s16 gBgScrollRegs[][2] ALIGNED(16) = {};
u16 gDispCnt = 0;
u8 gKeysContinuedRepeatIntervals[10] ALIGNED(16) = {};
union MultiSioData gMultiSioSend ALIGNED(8) = {};
u8 gUnknown_03002874 = 0;

void *gHBlankCopyTarget ALIGNED(4) = NULL;

u8 gBackgroundsCopyQueueIndex = 0;
u16 gBgPalette[] ALIGNED(16) = {};

u8 gHBlankCopySize ALIGNED(4) = 0;

u8 gVramGraphicsCopyQueueIndex ALIGNED(4) = 0;
u16 gPrevInput ALIGNED(4) = 0;
u16 gUnknown_03002A8C ALIGNED(4) = 0;

struct MultiBootParam gMultiBootParam ALIGNED(8) = {};

u16 gPressedKeys ALIGNED(4) = 0;
u8 gOamFirstPausedIndex ALIGNED(4) = 0;
u8 gBackgroundsCopyQueueCursor ALIGNED(4) = 0;
HBlankFunc gHBlankIntrs[4] ALIGNED(16) = {};

u8 gIwramHeap[0x2204] = {};

Sprite *gUnknown_03004D10[] ALIGNED(16) = {};
u8 gNumVBlankCallbacks ALIGNED(4) = 0;
void *gUnknown_03004D54 = NULL;
u16 gUnknown_03004D58 ALIGNED(4) = 0;
u8 gVramGraphicsCopyCursor ALIGNED(4) = 0;
u8 gUnknown_03004D60[] ALIGNED(16) = {};
u8 gUnknown_03004D80[] = {};
OamData gOamBuffer[] ALIGNED(16) = {};
u16 gVramHeapState[] = {};
u8 gUnknown_03005390 ALIGNED(4) = 0;
u16 gUnknown_03005394 ALIGNED(4) = 0;
u16 gUnknown_03005398 ALIGNED(4) = 0;
FuncType_030053A0 gVBlankIntrs[] ALIGNED(16) = {};
const u8 *gInputPlaybackData = NULL;
bool8 gExecSoundMain ALIGNED(4) = FALSE;
s32 gPseudoRandom = 0;

extern void IntrMain(void);

static void UpdateScreenDma(void);
static void UpdateScreenCpuSet(void);
static void ClearOamBufferCpuSet(void);
static void ClearOamBufferDma(void);
static void GetInput(void);
static bool32 ProcessVramGraphicsCopyQueue(void);

static void VBlankIntr(void);
static void HBlankIntr(void);
static void VCountIntr(void);
static void Timer0Intr(void);
static void Timer1Intr(void);
static void Timer2Intr(void);
static void Dma0Intr(void);
static void Dma1Intr(void);
static void Dma2Intr(void);
static void Dma3Intr(void);
static void KeypadIntr(void);
static void GamepakIntr(void);

// Warning: array contains an empty slot which would have
// been used for a Timer3Intr function
IntrFunc const gIntrTableTemplate[] = {
#ifdef MULTI_SIO_DI_FUNC_FAST
    (void *)gMultiSioIntrFuncBuf,
#else
    MultiSioIntr,
#endif
    VBlankIntr,
    HBlankIntr,
    VCountIntr,
    Timer0Intr,
    Timer1Intr,
    Timer2Intr,
    Dma0Intr,
    Dma1Intr,
    Dma2Intr,
    Dma3Intr,
    KeypadIntr,
    GamepakIntr,
    NULL,
};

// Result of these:
// FALSE: Not currently in vblank
// TRUE:  Currently in VBlank /
static VBlankFunc const sVblankFuncs[] = {
    ProcessVramGraphicsCopyQueue,
    sub_8004010,
#ifndef COLLECT_RINGS_ROM
    sub_80039E4,
#endif
    sub_8002B20,
};

void EngineInit(void)
{
    s16 i;
    u16 errorIdentifying;

    REG_WAITCNT = WAITCNT_PREFETCH_ENABLE | WAITCNT_WS0_S_1 | WAITCNT_WS0_N_3;
    gFlags = 0;
    gFlagsPreVBlank = 0;
#ifndef COLLECT_RINGS_ROM
    if ((REG_RCNT & 0xC000) != 0x8000) {
        gFlags = FLAGS_200;
        DmaCopy16(3, (void *)OBJ_VRAM0, EWRAM_START + 0x3B000, 0x5000);
    }
#endif

    // Skip the intro if these
    // 4 buttons are pressed
    if (gInput == (START_BUTTON | SELECT_BUTTON | B_BUTTON | A_BUTTON)) {
        gFlags |= FLAGS_SKIP_INTRO;
    } else {
        gFlags &= ~FLAGS_SKIP_INTRO;
    }

#if COLLECT_RINGS_ROM
    DmaCopy16(3, (void *)OBJ_VRAM0, (void *)0x0203b000, 0x5000);
#else
    DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);
#endif
    DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill32(3, 0, (void *)PLTT, PLTT_SIZE);

    sLastCalledVblankFuncId = VBLANK_FUNC_ID_NONE;
    gBackgroundsCopyQueueCursor = 0;
    gBackgroundsCopyQueueIndex = 0;
    gUnknown_03005390 = 0;
    gVramGraphicsCopyCursor = 0;
    gVramGraphicsCopyQueueIndex = 0;

    DmaFill32(3, 0, gUnknown_03002280, sizeof(gUnknown_03002280));

    // TODO: sort out this type
    *(u32 *)gUnknown_03004D80 = 0;

    DmaFill32(3, 0, gBgScrollRegs, sizeof(gBgScrollRegs));

    gUnknown_030017F4[0] = 0;
    gUnknown_030017F4[1] = 0;

    gDispCnt = DISPCNT_FORCED_BLANK;

    DmaFill32(3, 0, gVramGraphicsCopyQueue, sizeof(gVramGraphicsCopyQueue));

    gOamFreeIndex = 0;
    gOamFirstPausedIndex = 0;

    DmaFill16(3, 0x200, gOamBuffer, sizeof(gOamBuffer));
    DmaFill16(3, 0x200, gOamBuffer2, sizeof(gOamBuffer2));
    DmaFill32(3, ~0, gUnknown_03001850, sizeof(gUnknown_03001850));
    DmaFill32(3, ~0, gUnknown_03004D60, sizeof(gUnknown_03004D60));
    DmaFill32(3, 0, gObjPalette, sizeof(gObjPalette));
    DmaFill32(3, 0, gBgPalette, sizeof(gBgPalette));

    // BG2
    gBgAffineRegs[0].pa = 0x100;
    gBgAffineRegs[0].pb = 0;
    gBgAffineRegs[0].pc = 0;
    gBgAffineRegs[0].pd = 0x100;
    gBgAffineRegs[0].x = 0;
    gBgAffineRegs[0].y = 0;

    // BG3
    gBgAffineRegs[1].pa = 0x100;
    gBgAffineRegs[1].pb = 0;
    gBgAffineRegs[1].pc = 0;
    gBgAffineRegs[1].pd = 0x100;
    gBgAffineRegs[1].x = 0;
    gBgAffineRegs[1].y = 0;

#if (ENGINE >= ENGINE_3)
    gNextFreeAffineIndex = 0;
#endif
    gUnknown_03001944 = 0;
    gUnknown_030017F0 = 0x100;
    gUnknown_03005394 = 0x100;
    gUnknown_03002A8C = 0;
    gUnknown_03004D58 = 0;
    gUnknown_0300194C = 0;
    gUnknown_03002820 = 0;
    gUnknown_03005398 = 0x100;

    gWinRegs[WINREG_WIN0H] = 0;
    gWinRegs[WINREG_WIN1H] = 0;
    gWinRegs[WINREG_WIN0V] = 0;
    gWinRegs[WINREG_WIN1V] = 0;
    gWinRegs[WINREG_WININ] = 0;
    gWinRegs[WINREG_WINOUT] = 0;

    gBldRegs.bldCnt = 0;
    gBldRegs.bldAlpha = 0;
    gBldRegs.bldY = 0;

#if (GAME == GAME_SA2)
    gMosaicReg = 0;
#endif

    gPseudoRandom = 0;

    for (i = 0; i < 10; i++) {
        gKeysFirstRepeatIntervals[i] = 20;
        gKeysContinuedRepeatIntervals[i] = 8;
    }

#ifndef COLLECT_RINGS_ROM
    gInputRecorder.mode = RECORDER_DISABLED;
    gPhysicalInput = 0;
    gInputPlaybackData = NULL;
#endif
    gFrameCount = 0;

#ifdef BUG_FIX
    for (i = 0; i < ARRAY_COUNT(gIntrTableTemplate); i++)
#else
    for (i = 0; i < 15; i++)
#endif
    {
        gIntrTable[i] = (IntrFunc)gIntrTableTemplate[i];
    }

    DmaFill32(3, 0, &gBgOffsetsBuffer, sizeof(gBgOffsetsBuffer));

    gBgOffsetsHBlank = gBgOffsetsBuffer[0];
    gUnknown_030022AC = gBgOffsetsBuffer[1];
    gHBlankCopyTarget = NULL;
    gHBlankCopySize = 0;
    gNumHBlankCallbacks = 0;
    gNumHBlankIntrs = 0;

    DmaFill32(3, 0, gHBlankCallbacks, sizeof(gHBlankCallbacks));
    DmaFill32(3, 0, gHBlankIntrs, sizeof(gHBlankCallbacks));

    gNumVBlankCallbacks = 0;
    gNumVBlankIntrs = 0;

    DmaFill32(3, 0, gVBlankCallbacks, sizeof(gVBlankCallbacks));
    DmaFill32(3, 0, gVBlankIntrs, sizeof(gVBlankIntrs));

    m4aSoundInit();
    m4aSoundMode(DEFAULT_SOUND_MODE);

    gExecSoundMain = TRUE;

    TasksInit();
#ifndef COLLECT_RINGS_ROM
    EwramInitHeap();
#endif

    // VRAM_TILE_SEGMENTS / 256 max useable segments
    gVramHeapMaxTileSlots = VRAM_TILE_SEGMENTS * VRAM_TILE_SLOTS_PER_SEGMENT;
    gVramHeapStartAddr = OBJ_VRAM1 - (VRAM_HEAP_TILE_COUNT * TILE_SIZE_4BPP);

    VramResetHeapState();

#if COLLECT_RINGS_ROM
    gFlags |= FLAGS_NO_FLASH_MEMORY;
#else
    errorIdentifying = IdentifyFlash();
    if (errorIdentifying) {
        gFlags |= FLAGS_NO_FLASH_MEMORY;
    } else {
        SetFlashTimerIntr(1, &gIntrTable[5]);
    }
#endif

    // Setup interrupt vector
#if PLATFORM_GBA
    // On GBA the function gets pushed into IWRAM because executing it there is very,
    // very fast
    DmaCopy32(3, IntrMain, gIntrMainBuf, sizeof(gIntrMainBuf));
    INTR_VECTOR = (void *)gIntrMainBuf;
#else
    // On platforms where the whole program is in main RAM anyway, that is not necessary
    INTR_VECTOR = IntrMain;
#endif

    REG_IME = INTR_FLAG_VBLANK;
    REG_IE = INTR_FLAG_VBLANK;
    REG_DISPSTAT = DISPSTAT_HBLANK_INTR | DISPSTAT_VBLANK_INTR;

    // Setup multi sio
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
    gMultiSioStatusFlags = 0;
    gMultiSioEnabled = FALSE;

    MultiSioInit(0);
}

void EngineMainLoop(void)
{
#if !PLATFORM_WIN32
    while (TRUE)
#endif
    {
        gExecSoundMain = FALSE;
        if (!(gFlags & FLAGS_4000)) {
            m4aSoundMain();
        }

        if (sLastCalledVblankFuncId == VBLANK_FUNC_ID_NONE) {
            GetInput();

            if (gMultiSioEnabled) {
                gMultiSioStatusFlags = MultiSioMain(&gMultiSioSend, gMultiSioRecv, 0);
            }

            TasksExec();
        }

        gFlagsPreVBlank = gFlags;
        VBlankIntrWait();

#if (ENGINE >= ENGINE_3)
        gNextFreeAffineIndex = 0;
#endif
#ifndef COLLECT_RINGS_ROM
        if (gFlags & FLAGS_4000) {
            UpdateScreenCpuSet();

            if (!(gFlags & FLAGS_PAUSE_GAME)) {
                ClearOamBufferCpuSet();
            }
        } else
#endif
        {
            UpdateScreenDma();
            if (!(gFlags & FLAGS_PAUSE_GAME)) {
                ClearOamBufferDma();
            }
        }
        if (gFlags & FLAGS_PAUSE_GAME) {
            gFlags |= FLAGS_800;
        } else {
            gFlags &= ~FLAGS_800;
        }

        // Wait for vblank to finish
        while (REG_DISPSTAT & DISPSTAT_VBLANK)
            ;
    };
}

void UpdateScreenDma(void)
{
    u8 i, j = 0;
    REG_DISPCNT = gDispCnt;
    DmaCopy32(3, gBgCntRegs, (void *)REG_ADDR_BG0CNT, sizeof(gBgCntRegs));

    if (gFlags & FLAGS_UPDATE_BACKGROUND_PALETTES) {
        DmaCopy32(3, gBgPalette, (void *)BG_PLTT, BG_PLTT_SIZE);
        gFlags ^= FLAGS_UPDATE_BACKGROUND_PALETTES;
    }

    if (gFlags & FLAGS_UPDATE_SPRITE_PALETTES) {
        DmaCopy32(3, gObjPalette, (void *)OBJ_PLTT, OBJ_PLTT_SIZE);
        gFlags ^= FLAGS_UPDATE_SPRITE_PALETTES;
    }

    DmaCopy32(3, gWinRegs, (void *)REG_ADDR_WIN0H, sizeof(gWinRegs));
    DmaCopy16(3, &gBldRegs, (void *)REG_ADDR_BLDCNT, 6);
#if (GAME == GAME_SA2)
#ifdef BUG_FIX
    DmaCopy16(3, &gMosaicReg, (void *)REG_ADDR_MOSAIC, sizeof(gMosaicReg));
#else
    // BUG: For some reason, even though the var
    // is only 2 they chose to copy 4 bytes, oops
    DmaCopy16(3, &gMosaicReg, (void *)REG_ADDR_MOSAIC, 4);
#endif
#endif
    DmaCopy16(3, gBgScrollRegs, (void *)REG_ADDR_BG0HOFS, sizeof(gBgScrollRegs));
    DmaCopy32(3, &gBgAffineRegs, (void *)REG_ADDR_BG2PA, sizeof(gBgAffineRegs));

    if (gFlags & FLAGS_EXECUTE_HBLANK_CALLBACKS) {
        REG_IE |= INTR_FLAG_HBLANK;
        DmaFill32(3, 0, gHBlankIntrs, sizeof(gHBlankIntrs));
        if (gNumHBlankCallbacks != 0) {
            DmaCopy32(3, gHBlankCallbacks, gHBlankIntrs, gNumHBlankCallbacks * sizeof(HBlankFunc));
        }
        gNumHBlankIntrs = gNumHBlankCallbacks;
    } else {
        REG_IE &= ~INTR_FLAG_HBLANK;
        gNumHBlankIntrs = 0;
    }

    if (gFlags & FLAGS_EXECUTE_HBLANK_COPY) {

        DmaCopy16(3, gBgOffsetsHBlank, gHBlankCopyTarget, gHBlankCopySize);
    }

    if (sLastCalledVblankFuncId == VBLANK_FUNC_ID_NONE) {
        CopyOamBufferToOam();
        DmaCopy16(3, gOamBuffer + 0x00, (void *)OAM + 0x000, 0x100);
        DmaCopy16(3, gOamBuffer + 0x20, (void *)OAM + 0x100, 0x100);
        DmaCopy16(3, gOamBuffer + 0x40, (void *)OAM + 0x200, 0x100);
        DmaCopy16(3, gOamBuffer + 0x60, (void *)OAM + 0x300, 0x100);
    }

    for (i = 0; i < gNumVBlankIntrs; i++) {
#ifdef BUG_FIX
        if (gVBlankIntrs[i] != NULL)
#endif
        {
            gVBlankIntrs[i]();
        }
    }

    if (gFlags & FLAGS_10) {
        DmaFill32(3, 0, gVBlankIntrs, sizeof(gVBlankIntrs));
        if (gNumVBlankCallbacks != 0) {
            DmaCopy32(3, gVBlankCallbacks, gVBlankIntrs, gNumVBlankCallbacks * sizeof(FuncType_030053A0));
        }
        gNumVBlankIntrs = gNumVBlankCallbacks;
    } else {
        gNumVBlankIntrs = 0;
    }

    j = sLastCalledVblankFuncId;
    if (j == VBLANK_FUNC_ID_NONE) {
        j = 0;
    }

    sLastCalledVblankFuncId = VBLANK_FUNC_ID_NONE;

#if PORTABLE
    // TEMP/HACK: Always call all funcs
    //            Remove #if when all sVblankFuncs match
    j = 0;
#endif

    for (; j < ARRAY_COUNT(sVblankFuncs); j++) {
#if PORTABLE
        // TEMP/HACK
        sVblankFuncs[j]();
#else
        if (sVblankFuncs[j]() == 0) {
            sLastCalledVblankFuncId = j;
            break;
        }
#endif
    }
}

void ClearOamBufferDma(void)
{
    gNumHBlankCallbacks = 0;

    gFlags &= ~FLAGS_EXECUTE_HBLANK_CALLBACKS;
    if (!(gFlags & FLAGS_20)) {
#if (GAME == GAME_SA1)
        if (gBgOffsetsHBlank == gBgOffsetsBuffer[0]) {
            gBgOffsetsHBlank = gBgOffsetsBuffer[1];
            gUnknown_030022AC = gBgOffsetsBuffer[0];
        } else {
            gBgOffsetsHBlank = gBgOffsetsBuffer[0];
            gUnknown_030022AC = gBgOffsetsBuffer[1];
        }
#else
        if (gBgOffsetsHBlank == gUnknown_03004D54) {
            gBgOffsetsHBlank = gUnknown_030022C0;

            gUnknown_030022AC = gUnknown_03004D54;
        } else {

            gBgOffsetsHBlank = gUnknown_03004D54;

            gUnknown_030022AC = gUnknown_030022C0;
        }
#endif
    }
    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
    DmaFill16(3, 0x200, gOamBuffer + 0x00, 0x100);
    DmaFill16(3, 0x200, gOamBuffer + 0x20, 0x100);
    DmaFill16(3, 0x200, gOamBuffer + 0x40, 0x100);
    DmaFill16(3, 0x200, gOamBuffer + 0x60, 0x100);

    gNumVBlankCallbacks = 0;
    gFlags &= ~FLAGS_10;
}

#ifndef COLLECT_RINGS_ROM
static void UpdateScreenCpuSet(void)
{
    u8 i, j = 0;
    REG_DISPCNT = gDispCnt;
    CpuCopy32(gBgCntRegs, (void *)REG_ADDR_BG0CNT, sizeof(gBgCntRegs));

    if (gFlags & FLAGS_UPDATE_BACKGROUND_PALETTES) {
        CpuFastCopy(gBgPalette, (void *)BG_PLTT, BG_PLTT_SIZE);
        gFlags ^= FLAGS_UPDATE_BACKGROUND_PALETTES;
    }

    if (gFlags & FLAGS_UPDATE_SPRITE_PALETTES) {
        CpuFastCopy(gObjPalette, (void *)OBJ_PLTT, OBJ_PLTT_SIZE);
        gFlags ^= FLAGS_UPDATE_SPRITE_PALETTES;
    }

    CpuCopy32(gWinRegs, (void *)REG_ADDR_WIN0H, sizeof(gWinRegs));
    CpuCopy16(&gBldRegs, (void *)REG_ADDR_BLDCNT, 6);
#if (GAME == GAME_SA2)
#ifdef BUG_FIX
    CpuCopy16(&gMosaicReg, (void *)REG_ADDR_MOSAIC, sizeof(gMosaicReg));
#else
    // BUG: For some reason, even though the var
    // is only 2 they chose to copy 4 bytes, oops
    CpuCopy16(&gMosaicReg, (void *)REG_ADDR_MOSAIC, 4);
#endif
#endif
    CpuCopy16(gBgScrollRegs, (void *)REG_ADDR_BG0HOFS, sizeof(gBgScrollRegs));
    CpuCopy32(&gBgAffineRegs, (void *)REG_ADDR_BG2PA, sizeof(gBgAffineRegs));

    if (gFlags & FLAGS_EXECUTE_HBLANK_CALLBACKS) {
        REG_IE |= INTR_FLAG_HBLANK;
        CpuFastFill(NULL, gHBlankIntrs, sizeof(gHBlankIntrs));
        if (gNumHBlankCallbacks != 0) {
            CpuFastSet(gHBlankCallbacks, gHBlankIntrs, gNumHBlankCallbacks);
        }
        gNumHBlankIntrs = gNumHBlankCallbacks;
    } else {
        REG_IE &= ~INTR_FLAG_HBLANK;
        gNumHBlankIntrs = 0;
    }

    if (sLastCalledVblankFuncId == VBLANK_FUNC_ID_NONE) {
        CopyOamBufferToOam();
        CpuFastCopy(gOamBuffer, (void *)OAM, OAM_SIZE);
    }

    for (i = 0; i < gNumVBlankIntrs; i++) {
        gVBlankIntrs[i]();
    }

    if (gFlags & 0x10) {
        CpuFastFill(NULL, gVBlankIntrs, sizeof(gVBlankIntrs));
        if (gNumVBlankCallbacks != 0) {
            CpuFastSet(gVBlankCallbacks, gVBlankIntrs, gNumVBlankCallbacks);
        }
        gNumVBlankIntrs = gNumVBlankCallbacks;
    } else {
        gNumVBlankIntrs = 0;
    }

    j = sLastCalledVblankFuncId;
    if (j == VBLANK_FUNC_ID_NONE) {
        j = 0;
    }

    sLastCalledVblankFuncId = VBLANK_FUNC_ID_NONE;
    for (; j < ARRAY_COUNT(sVblankFuncs); j++) {
        if (sVblankFuncs[j]() == FALSE) {
            sLastCalledVblankFuncId = j;
            break;
        }
    }
}
#endif

void VBlankIntr(void)
{
    u16 keys;
    DmaStop(0);
    m4aSoundVSync();
    INTR_CHECK |= 1;
    gExecSoundMain = TRUE;

    if (gFlagsPreVBlank & FLAGS_EXECUTE_HBLANK_COPY) {
        REG_IE |= INTR_FLAG_HBLANK;
        DmaWait(0);

        DmaCopy16(0, gBgOffsetsHBlank, gHBlankCopyTarget, gHBlankCopySize);
        DmaSet(0, gBgOffsetsHBlank + gHBlankCopySize, gHBlankCopyTarget,
               ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | (gHBlankCopySize >> 1));

    } else if (gHBlankCopyTarget) {
        REG_IE &= ~INTR_FLAG_HBLANK;
        gHBlankCopyTarget = NULL;
    }

    if (gFlagsPreVBlank & FLAGS_EXECUTE_HBLANK_COPY0) {
        REG_DISPSTAT |= DISPSTAT_VCOUNT_INTR;
        REG_DISPSTAT &= 0xff;
        REG_DISPSTAT |= gUnknown_03002874 << 8;
        REG_DISPSTAT &= ~DISPSTAT_VCOUNT;
        REG_DISPSTAT |= DISPSTAT_VCOUNT_INTR;
        REG_IE |= INTR_FLAG_VCOUNT;
    } else {
        REG_DISPSTAT &= ~DISPSTAT_VCOUNT;
        REG_DISPSTAT &= ~DISPSTAT_VCOUNT_INTR;
        REG_IE &= ~INTR_FLAG_VCOUNT;
    }

#ifndef COLLECT_RINGS_ROM
    if (!(gFlagsPreVBlank & FLAGS_8000)) {
        keys = ~REG_KEYINPUT & (START_BUTTON | SELECT_BUTTON | B_BUTTON | A_BUTTON);
        if (keys == (START_BUTTON | SELECT_BUTTON | B_BUTTON | A_BUTTON)) {
            gFlags |= FLAGS_8000;
            REG_IE = 0;
            REG_IME = 0;
            REG_DISPSTAT = DISPCNT_MODE_0;
            m4aMPlayAllStop();
            m4aSoundVSyncOff();
            gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
            DmaStop(0);
            DmaStop(1);
            DmaStop(2);
            DmaStop(3);
            gInput = keys;
            SoftReset(0x20);
        }
    }
#endif

    gFrameCount++;
    REG_IF = INTR_FLAG_VBLANK;
}

// TODO: Fix ProcessVramGraphicsCopyQueue so no need to cast
struct GraphicsData_Hack {
    uintptr_t src;
    uintptr_t dest;
    u16 size;
};

#define COPY_CHUNK_SIZE 1024

static bool32 ProcessVramGraphicsCopyQueue(void)
{
    u32 offset;
#ifndef NON_MATCHING
    struct GraphicsData_Hack *graphics;
#else
    struct GraphicsData *graphics;
#endif

    while (gVramGraphicsCopyCursor != gVramGraphicsCopyQueueIndex) {
        graphics = (void *)gVramGraphicsCopyQueue[gVramGraphicsCopyCursor];

        if (graphics->size != 0) {
            for (offset = 0; graphics->size > 0; offset += COPY_CHUNK_SIZE) {
                if (graphics->size > COPY_CHUNK_SIZE) {
#ifdef BUG_FIX
                    if ((graphics->src != 0) && (graphics->dest != 0))
#endif
                    {
#if (RENDERER == RENDERER_SOFTWARE)
                        DmaCopy16(3, (void *)(graphics->src + offset), (void *)(graphics->dest + offset), COPY_CHUNK_SIZE);
#endif
                        graphics->size -= COPY_CHUNK_SIZE;
                    }
#ifdef BUG_FIX
                    else {
                        graphics->size = 0;
                    }
#endif
                } else {
#ifdef BUG_FIX
                    if ((graphics->src != 0) && (graphics->dest != 0))
#endif
                    {
#if (RENDERER == RENDERER_SOFTWARE)
                        DmaCopy16(3, (void *)(graphics->src + offset), (void *)(graphics->dest + offset), graphics->size);
#endif
                    }
                    graphics->size = 0;
                }
            }
        }
#ifdef BUG_FIX
        // NOTE: Technically not necessary, but it's a bit cleaner this way.
        if (graphics->size == 0) {
            gVramGraphicsCopyQueue[gVramGraphicsCopyCursor] = NULL;
        }
#endif

        INC_GRAPHICS_QUEUE_CURSOR(gVramGraphicsCopyCursor);

        // TODO: Once REG_DISPSTAT gets set correctly, and all graphics functions match, remove this #if.
        //       Otherwise graphics will not get copied properly.
#if !PORTABLE
        if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
            return FALSE;
        }
#endif
    }

    return TRUE;
}

void GetInput(void)
{
    s8 i;
    u8 *repeatKeyCounters = gRepeatedKeysTestCounter, *firstIntervals = gKeysFirstRepeatIntervals,
       *continuedHoldIntervals = gKeysContinuedRepeatIntervals;

    gInput = (~REG_KEYINPUT & KEYS_MASK);

    // My guess is that whilst the input recorder
    // is running we still want to know the actual
    // input. For example; to be able to know when
    // to exit the demo
    gPhysicalInput = gInput;

#ifndef COLLECT_RINGS_ROM
    if (gInputRecorder.mode == RECORDER_RECORD) {
        InputRecorderWrite(gInput);
    } else if (gInputRecorder.mode == RECORDER_PLAYBACK) {
        gInput = InputRecorderRead();
    }
#endif

    gPressedKeys = (gInput ^ gPrevInput) & gInput;
    gReleasedKeys = (gInput ^ gPrevInput) & gPrevInput;
    gPrevInput = gInput;

    // Repeated keys will be the currently pressed keys
    gRepeatedKeys = gPressedKeys;

    // Calculate the next repeated state for every key
    for (i = 0; i < 10; i++) {
        if (!GetBit(gInput, i)) {
            // If a key is not pressed, reset its counter
            // to the settings for that key's
            // first repeat interval
            repeatKeyCounters[i] = firstIntervals[i];
        } else if (repeatKeyCounters[i] > 0) {
            // If the key is not yet ready to be repeated
            // continue to wait
            repeatKeyCounters[i]--;
        } else {
            // If the key is ready to be repeated,
            // add the key to the repeated keys
            gRepeatedKeys |= 1 << i;
            // And reset its counter to the settings
            // for continued hold interval
            repeatKeyCounters[i] = continuedHoldIntervals[i];
        }
    }
}

static void HBlankIntr(void)
{
    u8 i;
    int_vcount vcount = *(volatile int_vcount *)&REG_VCOUNT;

    if (vcount < DISPLAY_HEIGHT) {
        for (i = 0; i < gNumHBlankIntrs; i++) {
            gHBlankIntrs[i](vcount);
        }
    }

    REG_IF = INTR_FLAG_HBLANK;
}

static void VCountIntr(void) { REG_IF = INTR_FLAG_VCOUNT; }

static void Dma0Intr(void) { REG_IF = INTR_FLAG_DMA0; }

static void Dma1Intr(void) { REG_IF = INTR_FLAG_DMA1; }

static void Dma2Intr(void) { REG_IF = INTR_FLAG_DMA2; }

static void Dma3Intr(void) { REG_IF = INTR_FLAG_DMA3; }

static void Timer0Intr(void) { REG_IF = INTR_FLAG_TIMER0; }

static void Timer1Intr(void) { REG_IF = INTR_FLAG_TIMER1; }

static void Timer2Intr(void) { REG_IF = INTR_FLAG_TIMER2; }

static void KeypadIntr(void) { REG_IF = INTR_FLAG_KEYPAD; }

static void GamepakIntr(void) { REG_IF = INTR_FLAG_GAMEPAK; }

void DummyFunc(void) { }

#if (GAME == GAME_SA1)
static void ClearOamBufferCpuSet(void)
{
    gNumHBlankCallbacks = 0;

    gFlags &= ~FLAGS_EXECUTE_HBLANK_CALLBACKS;
    if (!(gFlags & FLAGS_20)) {
        if (gBgOffsetsHBlank == gBgOffsetsBuffer) {
            gBgOffsetsHBlank = &gBgOffsetsBuffer[1];
            sa2__gUnknown_030022AC = &gBgOffsetsBuffer[0];
        } else {
            gBgOffsetsHBlank = &gBgOffsetsBuffer[0];
            sa2__gUnknown_030022AC = &gBgOffsetsBuffer[1];
        }
    }
    gFlags &= ~4;
    CpuFastFill(0x200, gOamBuffer, sizeof(gOamBuffer));
    gNumVBlankCallbacks = 0;
    gFlags &= ~FLAGS_10;
}
#else
#ifndef COLLECT_RINGS_ROM
static void ClearOamBufferCpuSet(void)
{
    gNumHBlankCallbacks = 0;

    gFlags &= ~FLAGS_EXECUTE_HBLANK_CALLBACKS;
    if (!(gFlags & FLAGS_20)) {
        if (gBgOffsetsHBlank == gUnknown_03004D54) {
            gBgOffsetsHBlank = gUnknown_030022C0;
            gUnknown_030022AC = gUnknown_03004D54;
        } else {
            gBgOffsetsHBlank = gUnknown_03004D54;
            gUnknown_030022AC = gUnknown_030022C0;
        }
    }
    gFlags &= ~4;
    CpuFastFill(0x200, gOamBuffer, sizeof(gOamBuffer));
    gNumVBlankCallbacks = 0;
    gFlags &= ~FLAGS_10;
}
#endif
#endif
