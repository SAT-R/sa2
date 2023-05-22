#include "core.h"
#include "global.h"
#include "data.h"
#include "lib/m4a.h"
#include "malloc_ewram.h"
#include "multi_sio.h"
#include "sprite.h"
#include "task.h"
#include "lib/agb_flash.h"
#include "flags.h"
#include "input_recorder.h"
#include "malloc_vram.h"

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
Background *gUnknown_03001800[] ALIGNED(16) = {};
u32 gFlags = 0;
u8 gUnknown_03001850[] ALIGNED(16) = {};
FuncType_030053A0 gUnknown_03001870[] = {};
u16 gPhysicalInput = 0;

// gComputedBgBuffer
void *gUnknown_03001884 = NULL;

u16 gVramHeapMaxTileSlots = 0;
u8 gNumHBlankCallbacks ALIGNED(4) = 0;
union MultiSioData gMultiSioRecv[4] = {};
u8 gNumHBlankIntrs = 0;
struct BlendRegs gBldRegs ALIGNED(8) = {};
u8 gUnknown_030018F0 = 0;
struct Task gEmptyTask ALIGNED(16) = {};
BgAffineReg gBgAffineRegs[NUM_AFFINE_BACKGROUNDS] ALIGNED(8) = {};
u32 gVramHeapStartAddr = 0;
u16 gUnknown_03001944 ALIGNED(4) = 0;
u8 gUnknown_03001948 ALIGNED(4) = 0;
u16 gUnknown_0300194C ALIGNED(4) = 0;

u32 gMultiSioStatusFlags = 0;
bool8 gMultiSioEnabled = FALSE;

struct Task *gTaskPtrs[] ALIGNED(16) = {};
u32 gUnknown_03001B60[][160] = {};
u16 gObjPalette[] = {};
union Unk_03002E60 *gUnknown_03002260 = NULL;
u32 gFrameCount = 0;
u16 gWinRegs[6] ALIGNED(16) = {};
s32 gNumTasks = 0;
u8 gUnknown_03002280[4][4] = {};
u16 gInput = 0;
u8 gRepeatedKeysTestCounter[] ALIGNED(16) = {};
void *gUnknown_030022AC = NULL;
u16 gBgCntRegs[] = {};
u16 gRepeatedKeys ALIGNED(4) = 0;
struct Task *gNextTask = NULL;
void *gUnknown_030022C0 = NULL;

OamData gUnknown_030022C8 ALIGNED(8) = {};
OamData gUnknown_030022D0[] = {};
s16 gUnknown_030026D0 = 0;

HBlankFunc gHBlankCallbacks[4] ALIGNED(16) = {};
struct Task *gCurTask = NULL;
u8 gUnknown_030026F4 = 0;
u8 gKeysFirstRepeatIntervals[10] ALIGNED(16) = {};

u16 gReleasedKeys ALIGNED(4) = 0;
u8 gUnknown_03002710[] ALIGNED(16) = {};
u32 gFlagsPreVBlank = 0;
/* 0x03002794 */ const struct SpriteTables *gUnknown_03002794 = NULL;
struct GraphicsData *gVramGraphicsCopyQueue[] ALIGNED(16) = {};
u16 gUnknown_03002820 = 0;
s16 gBgScrollRegs[][2] ALIGNED(16) = {};
u16 gDispCnt = 0;
u8 gKeysContinuedRepeatIntervals[10] ALIGNED(16) = {};
union MultiSioData gMultiSioSend ALIGNED(8) = {};
u8 gUnknown_03002874 = 0;

// gComputedBgTarget
void *gUnknown_03002878 ALIGNED(4) = NULL;

u8 gUnknown_0300287C = 0;
u16 gBgPalette[] ALIGNED(16) = {};

// gComputedBgSectorSize
u8 gUnknown_03002A80 ALIGNED(4) = 0;

u8 gVramGraphicsCopyQueueIndex ALIGNED(4) = 0;
u16 gPrevInput ALIGNED(4) = 0;
u16 gUnknown_03002A8C ALIGNED(4) = 0;

struct MultiBootParam gMultiBootParam ALIGNED(8) = {};

u16 gPressedKeys ALIGNED(4) = 0;
u8 gUnknown_03002AE0 ALIGNED(4) = 0;
u8 gUnknown_03002AE4 ALIGNED(4) = 0;
HBlankFunc gHBlankIntrs[4] ALIGNED(16) = {};

u8 gIwramHeap[] = {};
EWRAM_DATA u8 gEwramHeap[] = {};

Sprite *gUnknown_03004D10[] ALIGNED(16) = {};
u8 gUnknown_03004D50 ALIGNED(4) = 0;
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
FuncType_030053A0 gUnknown_030053A0[] ALIGNED(16) = {};
const u8 *gInputPlaybackData = NULL;
bool8 gExecSoundMain ALIGNED(4) = FALSE;
s32 gPseudoRandom = 0;
struct InputRecorder gInputRecorder ALIGNED(8) = {};
u16 *gInputRecorderTapeBuffer = NULL;

static void UpdateScreenDma(void);
static void UpdateScreenCpuSet(void);
static void ClearOamBufferCpuSet(void);
static void ClearOamBufferDma(void);
static void GetInput(void);
static u32 ProcessVramGraphicsCopyQueue(void);

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
    (void *)gMultiSioIntrFuncBuf,
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

static SpriteUpdateFunc const spriteUpdateFuncs[] = {
    ProcessVramGraphicsCopyQueue,
    sub_8004010,
    sub_80039E4,
    sub_8002B20,
};

void GameInit(void)
{
    s16 i;
    u16 errorIdentifying;

    REG_WAITCNT = WAITCNT_PREFETCH_ENABLE | WAITCNT_WS0_S_1 | WAITCNT_WS0_N_3;
    gFlags = 0;
    gFlagsPreVBlank = 0;

    if ((REG_RCNT & 0xc000) != 0x8000) {
        gFlags = 0x200;
        DmaSet(3, (void *)OBJ_VRAM0, EWRAM_START + 0x3B000, 0x80002800);
    }

    // Skip the intro if these
    // 4 buttons are pressed
    if (gInput == (START_BUTTON | SELECT_BUTTON | B_BUTTON | A_BUTTON)) {
        gFlags |= FLAGS_SKIP_INTRO;
    } else {
        gFlags &= ~FLAGS_SKIP_INTRO;
    }

    DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill32(3, 0, (void *)PLTT, PLTT_SIZE);

    gUnknown_030026F4 = 0xff;
    gUnknown_03002AE4 = 0;
    gUnknown_0300287C = 0;
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

    gUnknown_030018F0 = 0;
    gUnknown_03002AE0 = 0;

    DmaFill16(3, 0x200, gOamBuffer, sizeof(gOamBuffer));
    DmaFill16(3, 0x200, gUnknown_030022D0, sizeof(gUnknown_030022D0));
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

    gUnknown_03001944 = 0;
    gUnknown_030017F0 = 0x100;
    gUnknown_03005394 = 0x100;
    gUnknown_03002A8C = 0;
    gUnknown_03004D58 = 0;
    gUnknown_0300194C = 0;
    gUnknown_03002820 = 0;
    gUnknown_03005398 = 0x100;

    gWinRegs[0] = 0;
    gWinRegs[1] = 0;
    gWinRegs[2] = 0;
    gWinRegs[3] = 0;
    gWinRegs[4] = 0;
    gWinRegs[5] = 0;

    gBldRegs.bldCnt = 0;
    gBldRegs.bldAlpha = 0;
    gBldRegs.bldY = 0;

    gUnknown_030026D0 = 0;
    gPseudoRandom = 0;

    for (i = 0; i < 10; i++) {
        gKeysFirstRepeatIntervals[i] = 20;
        gKeysContinuedRepeatIntervals[i] = 8;
    }

    gInputRecorder.mode = RECORDER_DISABLED;
    gPhysicalInput = 0;
    gInputPlaybackData = NULL;
    gFrameCount = 0;

    for (i = 0; i < 15; i++) {
        gIntrTable[i] = gIntrTableTemplate[i];
    }

    DmaFill32(3, 0, &gUnknown_03001B60, sizeof(gUnknown_03001B60));

    gUnknown_03001884 = gUnknown_03001B60[0];
    gUnknown_030022AC = gUnknown_03001B60[1];
    gUnknown_03002878 = NULL;
    gUnknown_03002A80 = 0;
    gNumHBlankCallbacks = 0;
    gNumHBlankIntrs = 0;

    DmaFill32(3, 0, gHBlankCallbacks, sizeof(gHBlankCallbacks));
    DmaFill32(3, 0, gHBlankIntrs, sizeof(gHBlankCallbacks));

    gUnknown_03004D50 = 0;
    gUnknown_03001948 = 0;

    DmaFill32(3, 0, gUnknown_03001870, sizeof(gUnknown_03001870));
    DmaFill32(3, 0, gUnknown_030053A0, sizeof(gUnknown_030053A0));

    m4aSoundInit();
    m4aSoundMode(DEFAULT_SOUND_MODE);

    gExecSoundMain = TRUE;

    TasksInit();
    EwramInitHeap();

    // 140 / 256 max useable segments
    gVramHeapMaxTileSlots = 140 * VRAM_TILE_SLOTS_PER_SEGMENT;
    // Would be good to know where this number comes from
    gVramHeapStartAddr = OBJ_VRAM1 - (TILE_SIZE_4BPP * 48);

    VramResetHeapState();

    errorIdentifying = IdentifyFlash();
    if (errorIdentifying) {
        gFlags |= FLAGS_NO_FLASH_MEMORY;
    } else {
        SetFlashTimerIntr(1, &gIntrTable[5]);
    }

    // Setup interrupt table
    DmaCopy32(3, IntrMain, gIntrMainBuf, sizeof(gIntrMainBuf));
    INTR_VECTOR = gIntrMainBuf;

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

void GameLoop(void)
{
    while (TRUE) {
        gExecSoundMain = FALSE;
        if (!(gFlags & 0x4000)) {
            m4aSoundMain();
        }

        if (gUnknown_030026F4 == 0xff) {
            GetInput();
            if (gMultiSioEnabled) {
                gMultiSioStatusFlags = MultiSioMain(&gMultiSioSend, gMultiSioRecv, 0);
            }
            TasksExec();
        }

        gFlagsPreVBlank = gFlags;
        VBlankIntrWait();
        if (gFlags & 0x4000) {
            UpdateScreenCpuSet();
            if (!(gFlags & 0x400)) {
                ClearOamBufferCpuSet();
            }
        } else {
            UpdateScreenDma();
            if (!(gFlags & 0x400)) {
                ClearOamBufferDma();
            }
        }
        if ((gFlags & 0x400)) {
            gFlags |= 0x800;
        } else {
            gFlags &= ~0x800;
        }

        // Wait for vblank to finish
        while (REG_DISPSTAT & DISPSTAT_VBLANK)
            ;
    };
}

static void UpdateScreenDma(void)
{
    u8 i, j = 0;
    REG_DISPCNT = gDispCnt;
    DmaCopy32(3, gBgCntRegs, (void *)REG_ADDR_BG0CNT, 8);

    if (gFlags & 1) {
        DmaCopy32(3, gBgPalette, (void *)BG_PLTT, BG_PLTT_SIZE);
        gFlags ^= 1;
    }

    if (gFlags & 2) {
        DmaCopy32(3, gObjPalette, (void *)OBJ_PLTT, OBJ_PLTT_SIZE);
        gFlags ^= 2;
    }

    DmaCopy32(3, gWinRegs, (void *)REG_ADDR_WIN0H, sizeof(gWinRegs));
    DmaCopy16(3, &gBldRegs, (void *)REG_ADDR_BLDCNT, 6);
    DmaCopy16(3, &gUnknown_030026D0, (void *)REG_ADDR_MOSAIC, 4);
    DmaCopy16(3, gBgScrollRegs, (void *)REG_ADDR_BG0HOFS, sizeof(gBgScrollRegs));
    DmaCopy32(3, &gBgAffineRegs, (void *)REG_ADDR_BG2PA, sizeof(gBgAffineRegs));

    if (gFlags & FLAGS_EXECUTE_HBLANK_CALLBACKS) {
        REG_IE |= INTR_FLAG_HBLANK;
        DmaFill32(3, 0, gHBlankIntrs, sizeof(gHBlankIntrs));
        if (gNumHBlankCallbacks != 0) {
            DmaCopy32(3, gHBlankCallbacks, gHBlankIntrs,
                      gNumHBlankCallbacks * sizeof(HBlankFunc));
        }
        gNumHBlankIntrs = gNumHBlankCallbacks;
    } else {
        REG_IE &= ~INTR_FLAG_HBLANK;
        gNumHBlankIntrs = 0;
    }

    if (gFlags & 0x4) {
        DmaCopy16(3, gUnknown_03001884, gUnknown_03002878, gUnknown_03002A80);
    }

    if (gUnknown_030026F4 == 0xff) {
        DrawToOamBuffer();
        DmaCopy16(3, gOamBuffer, (void *)OAM, 0x100);
        DmaCopy16(3, gOamBuffer + 0x20, (void *)OAM + 0x100, 0x100);
        DmaCopy16(3, gOamBuffer + 0x40, (void *)OAM + 0x200, 0x100);
        DmaCopy16(3, gOamBuffer + 0x60, (void *)OAM + 0x300, 0x100);
    }

    for (i = 0; i < gUnknown_03001948; i++) {
        gUnknown_030053A0[i]();
    }

    if (gFlags & 0x10) {
        DmaFill32(3, 0, gUnknown_030053A0, sizeof(gUnknown_030053A0));
        if (gUnknown_03004D50 != 0) {
            DmaCopy32(3, gUnknown_03001870, gUnknown_030053A0,
                      gUnknown_03004D50 * sizeof(FuncType_030053A0));
        }
        gUnknown_03001948 = gUnknown_03004D50;
    } else {
        gUnknown_03001948 = 0;
    }

    j = gUnknown_030026F4;
    if (j == 0xff) {
        j = 0;
    }

    gUnknown_030026F4 = 0xff;
    for (; j < ARRAY_COUNT(spriteUpdateFuncs); j++) {
        if (spriteUpdateFuncs[j]() == 0) {
            gUnknown_030026F4 = j;
            break;
        }
    }
}

static void ClearOamBufferDma(void)
{
    gNumHBlankCallbacks = 0;

    gFlags &= ~FLAGS_EXECUTE_HBLANK_CALLBACKS;
    if (!(gFlags & 0x20)) {
        if (gUnknown_03001884 == gUnknown_03004D54) {
            gUnknown_03001884 = gUnknown_030022C0;
            gUnknown_030022AC = gUnknown_03004D54;
        } else {
            gUnknown_03001884 = gUnknown_03004D54;
            gUnknown_030022AC = gUnknown_030022C0;
        }
    }
    gFlags &= ~4;
    DmaFill16(3, 0x200, gOamBuffer, 0x100);
    DmaFill16(3, 0x200, gOamBuffer + 0x20, 0x100);
    DmaFill16(3, 0x200, gOamBuffer + 0x40, 0x100);
    DmaFill16(3, 0x200, gOamBuffer + 0x60, 0x100);

    gUnknown_03004D50 = 0;
    gFlags &= ~16;
}

static void UpdateScreenCpuSet(void)
{
    u8 i, j = 0;
    REG_DISPCNT = gDispCnt;
    CpuCopy32(gBgCntRegs, (void *)REG_ADDR_BG0CNT, sizeof(gBgCntRegs));

    if (gFlags & 1) {
        CpuFastCopy(gBgPalette, (void *)BG_PLTT, BG_PLTT_SIZE);
        gFlags ^= 1;
    }

    if (gFlags & 2) {
        CpuFastCopy(gObjPalette, (void *)OBJ_PLTT, OBJ_PLTT_SIZE);
        gFlags ^= 2;
    }

    CpuCopy32(gWinRegs, (void *)REG_ADDR_WIN0H, sizeof(gWinRegs));
    CpuCopy16(&gBldRegs, (void *)REG_ADDR_BLDCNT, 6);
    CpuCopy16(&gUnknown_030026D0, (void *)REG_ADDR_MOSAIC, 4);
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

    if (gUnknown_030026F4 == 0xff) {
        DrawToOamBuffer();
        CpuFastCopy(gOamBuffer, (void *)OAM, OAM_SIZE);
    }

    for (i = 0; i < gUnknown_03001948; i++) {
        gUnknown_030053A0[i]();
    }

    if (gFlags & 0x10) {
        CpuFastFill(NULL, gUnknown_030053A0, sizeof(gUnknown_030053A0));
        if (gUnknown_03004D50 != 0) {
            CpuFastSet(gUnknown_03001870, gUnknown_030053A0, gUnknown_03004D50);
        }
        gUnknown_03001948 = gUnknown_03004D50;
    } else {
        gUnknown_03001948 = 0;
    }

    j = gUnknown_030026F4;
    if (j == 0xff) {
        j = 0;
    }

    gUnknown_030026F4 = 0xff;
    for (; j <= 3; j++) {
        if (spriteUpdateFuncs[j]() == 0) {
            gUnknown_030026F4 = j;
            break;
        }
    }
}

static void VBlankIntr(void)
{
    u16 keys;
    DmaStop(0);
    m4aSoundVSync();
    INTR_CHECK |= 1;
    gExecSoundMain = TRUE;

    if (gFlagsPreVBlank & 4) {
        REG_IE |= INTR_FLAG_HBLANK;
        DmaWait(0);
        DmaCopy16(0, gUnknown_03001884, gUnknown_03002878, gUnknown_03002A80);
        DmaSet(0, gUnknown_03001884 + gUnknown_03002A80, gUnknown_03002878,
               ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16)
                   | (gUnknown_03002A80 >> 1));
    } else if (gUnknown_03002878) {
        REG_IE &= ~INTR_FLAG_HBLANK;
        gUnknown_03002878 = NULL;
    }

    if (gFlagsPreVBlank & 0x40) {
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

    if (!(gFlagsPreVBlank & 0x8000)) {
        keys = ~REG_KEYINPUT & (START_BUTTON | SELECT_BUTTON | B_BUTTON | A_BUTTON);
        if (keys == (START_BUTTON | SELECT_BUTTON | B_BUTTON | A_BUTTON)) {
            gFlags |= 0x8000;
            REG_IE = 0;
            REG_IME = 0;
            REG_DISPSTAT = DISPCNT_MODE_0;
            m4aMPlayAllStop();
            m4aSoundVSyncOff();
            gFlags &= ~4;
            DmaStop(0);
            DmaStop(1);
            DmaStop(2);
            DmaStop(3);
            gInput = keys;
            SoftReset(0x20);
        }
    }

    gFrameCount++;
    REG_IF = INTR_FLAG_VBLANK;
}

// TODO: Fix ProcessVramGraphicsCopyQueue so no need to cast
struct GraphicsData_Hack {
    u32 src;
    u32 dest;
    u16 remainingBytes;
};

#define COPY_CHUNK_SIZE 1024

static u32 ProcessVramGraphicsCopyQueue(void)
{
    u32 offset;
    struct GraphicsData_Hack *graphics;

    while (gVramGraphicsCopyCursor != gVramGraphicsCopyQueueIndex) {
        graphics = (struct GraphicsData_Hack *)
            gVramGraphicsCopyQueue[gVramGraphicsCopyCursor];

        if (graphics->remainingBytes != 0) {
            for (offset = 0; graphics->remainingBytes > 0; offset += COPY_CHUNK_SIZE) {
                if (graphics->remainingBytes > COPY_CHUNK_SIZE) {
                    DmaCopy16(3, graphics->src + offset, graphics->dest + offset,
                              COPY_CHUNK_SIZE);
                    graphics->remainingBytes -= COPY_CHUNK_SIZE;
                } else {
                    DmaCopy16(3, graphics->src + offset, graphics->dest + offset,
                              graphics->remainingBytes);
                    graphics->remainingBytes = 0;
                }
            }
        }

        gVramGraphicsCopyCursor++;
        gVramGraphicsCopyCursor &= ARRAY_COUNT(gVramGraphicsCopyQueue) - 1;

        if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
            return 0;
        }
    }
    return 1;
}

static void GetInput(void)
{
    s8 i;
    u8 *repeatKeyCounters = gRepeatedKeysTestCounter,
       *firstIntervals = gKeysFirstRepeatIntervals,
       *continuedHoldIntervals = gKeysContinuedRepeatIntervals;

    gInput = (~REG_KEYINPUT & KEYS_MASK);

    // My guess is that whilst the input recorder
    // is running we still want to know the actual
    // input. For example; to be able to know when
    // to exit the demo
    gPhysicalInput = gInput;

    if (gInputRecorder.mode == RECORDER_RECORD) {
        InputRecorderWrite(gInput);
    } else if (gInputRecorder.mode == RECORDER_PLAYBACK) {
        gInput = InputRecorderRead();
    }

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
    u8 vcount = *(vu8 *)REG_ADDR_VCOUNT;

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

static void ClearOamBufferCpuSet(void)
{
    gNumHBlankCallbacks = 0;

    gFlags &= ~FLAGS_EXECUTE_HBLANK_CALLBACKS;
    if (!(gFlags & 0x20)) {
        if (gUnknown_03001884 == gUnknown_03004D54) {
            gUnknown_03001884 = gUnknown_030022C0;
            gUnknown_030022AC = gUnknown_03004D54;
        } else {
            gUnknown_03001884 = gUnknown_03004D54;
            gUnknown_030022AC = gUnknown_030022C0;
        }
    }
    gFlags &= ~4;
    CpuFastFill(0x200, gOamBuffer, sizeof(gOamBuffer));
    gUnknown_03004D50 = 0;
    gFlags &= ~16;
}
