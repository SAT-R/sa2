#include "global.h"
#include "core.h"
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

typedef bool32 (*VBlankProcessFunc)(void);

IntrFunc gIntrTable[] = {};
u32 gIntrMainBuf[] = {};
struct Task gTasks[] = {};
u16 SA2_LABEL(gUnknown_030017F0) ALIGNED(4) = 0;
Vec2_16 gSpriteOffset ALIGNED(4) = {};
Background *gBackgroundsCopyQueue[] ALIGNED(16) = {};
u32 gFlags = 0;
u8 gOamMallocOrders_StartIndex[] ALIGNED(16) = {};
IntrFunc gVBlankCallbacks[] = {};
u16 gPhysicalInput = 0;

void *gBgOffsetsHBlankPrimary = NULL;

u16 gVramHeapMaxTileSlots = 0;
u8 gNumHBlankCallbacks ALIGNED(4) = 0;
union MultiSioData gMultiSioRecv[4] = {};
#if (ENGINE == ENGINE_3)
u32 gUnknown_03002BF0 = 0;
#endif
u8 gNumHBlankIntrs = 0;
struct BlendRegs gBldRegs ALIGNED(8) = {};
u8 gOamFreeIndex = 0;
struct Task gEmptyTask ALIGNED(16) = {};

#if (ENGINE >= ENGINE_3)
// NOTE: gNextFreeAffineIndex introduced in SA3, unused before.
u8 gNextFreeAffineIndex = 0;
#endif
BgAffineReg gBgAffineRegs[NUM_AFFINE_BACKGROUNDS] ALIGNED(16) = {};
void *gVramHeapStartAddr = NULL;
u16 SA2_LABEL(gUnknown_03001944) ALIGNED(4) = 0;
u8 gNumVBlankIntrs ALIGNED(4) = 0;
s16 SA2_LABEL(gUnknown_0300194C) ALIGNED(4) = 0;

#if (ENGINE >= ENGINE_3)
u8 gUnknown_03002C60 ALIGNED(4) = 0;
#endif
u32 gMultiSioStatusFlags = 0;
bool8 gMultiSioEnabled = FALSE;

struct Task *gTaskPtrs[] ALIGNED(16) = {};
int_vcount gBgOffsetsBuffer[2][DISPLAY_HEIGHT][4] = {}; /* TODO: Find out how this is different from gBgOffsetsHBlankPrimary */
u16 gObjPalette[] = {};
Tilemap **gTilemapsRef = NULL;
u32 gFrameCount = 0;
winreg_t gWinRegs[6] ALIGNED(16) = {};
s32 gNumTasks = 0;
u8 gBgSprites_Unknown2[4][4] = {};
u16 gInput = 0;
#if (ENGINE >= ENGINE_3)
s32 gUnknown_030035A4 = 0;
struct Task *gNextTaskToCheckForDestruction = NULL;
#endif // (ENGINE >= ENGINE_3)
u8 gRepeatedKeysTestCounter[] ALIGNED(16) = {};
void *gBgOffsetsHBlankSecondary = NULL;
u16 gBgCntRegs[] = {};
u16 gRepeatedKeys ALIGNED(4) = 0;
struct Task *gNextTask = NULL;
#if ((ENGINE == ENGINE_1) || (ENGINE == ENGINE_2))
// Only here in SA3
// struct GraphicsData *gVramGraphicsCopyQueue[];
#else
struct GraphicsData gVramGraphicsCopyQueue[] = {};
#endif
#if (ENGINE == ENGINE_2)
void *gBgOffsetsSecondary = NULL;
#endif

OamData gOamMallocBuffer[OAM_ENTRY_COUNT] ALIGNED(16) = {};

#if (GAME == GAME_SA2)
s16 gMosaicReg = 0;
#endif

HBlankIntrFunc gHBlankCallbacks[4] ALIGNED(16) = {};
struct Task *gCurTask = NULL;
u8 sLastCalledVblankFuncId = 0;
u8 gKeysFirstRepeatIntervals[10] ALIGNED(16) = {};

u16 gReleasedKeys ALIGNED(4) = 0;
u8 gOamMallocCopiedOrder[] ALIGNED(16) = {};
u32 gFlagsPreVBlank = 0;
/* 0x03002794 */ const struct SpriteTables *gRefSpriteTables = NULL;

#if PORTABLE
// TODO: Once SA3 works in PORTABLE, it can just use
// the regular gVramGraphicsCopyQueue[].
struct GraphicsData gVramGraphicsCopyQueueBuffer[] = {};
#endif // PORTABLE
#if ((ENGINE == ENGINE_1) || (ENGINE == ENGINE_2))
struct GraphicsData *gVramGraphicsCopyQueue[] ALIGNED(16) = {};
#else
// NOT here in SA3
// struct GraphicsData gVramGraphicsCopyQueue[32] = {};
#endif

#if (ENGINE == ENGINE_3)
VoidFn gUnknown_03003C08 = NULL;
#endif
s16 SA2_LABEL(gUnknown_03002820) = 0;
s16 gBgScrollRegs[][2] ALIGNED(16) = {};
u16 gDispCnt = 0;
u8 gKeysContinuedRepeatIntervals[10] ALIGNED(16) = {};
union MultiSioData gMultiSioSend ALIGNED(8) = {};
u8 SA2_LABEL(gVCountSetting) = 0;

void *gHBlankCopyTarget ALIGNED(4) = NULL;

#if (ENGINE == ENGINE_3)
// Name inferred from KATAM
u16 gRgbMap[3][2 * 16] __attribute__((aligned(4))) = {};
#endif // (ENGINE == ENGINE_3)

u8 gBackgroundsCopyQueueIndex = 0;
u16 gBgPalette[] ALIGNED(16) = {};

u8 gHBlankCopySize ALIGNED(4) = 0;

u8 gVramGraphicsCopyQueueIndex ALIGNED(4) = 0;
u16 gPrevInput ALIGNED(4) = 0;
u16 SA2_LABEL(gUnknown_03002A8C) ALIGNED(4) = 0;

struct MultiBootParam gMultiBootParam ALIGNED(8) = {};

u16 gPressedKeys ALIGNED(4) = 0;
u8 gOamFirstPausedIndex ALIGNED(4) = 0;
u8 gBackgroundsCopyQueueCursor ALIGNED(4) = 0;
HBlankIntrFunc gHBlankIntrs[4] ALIGNED(16) = {};

u8 gIwramHeap[TASK_HEAP_SIZE] = {};

Sprite *gBgSprites[] ALIGNED(16) = {};
u8 gNumVBlankCallbacks ALIGNED(4) = 0;
#if (ENGINE == ENGINE_2)
void *gBgOffsetsPrimary = NULL;
#endif
u16 SA2_LABEL(gUnknown_03004D58) ALIGNED(4) = 0;
u8 gVramGraphicsCopyCursor ALIGNED(4) = 0;
#if (ENGINE == ENGINE_3)
u8 gUnknown_0300620C ALIGNED(4) = 0;
#endif
u8 gOamMallocOrders_EndIndex[] ALIGNED(16) = {};
u8 gBgSprites_Unknown1[] = {};
OamData gOamBuffer[] ALIGNED(16) = {};
u16 gVramHeapState[] = {};
u8 gBgSpritesCount ALIGNED(4) = 0;
u16 SA2_LABEL(gUnknown_03005394) ALIGNED(4) = 0;
u16 SA2_LABEL(gUnknown_03005398) ALIGNED(4) = 0;
IntrFunc gVBlankIntrs[] ALIGNED(16) = {};
const u8 *gInputPlaybackData = NULL;
bool8 gExecSoundMain ALIGNED(4) = FALSE;
s32 gPseudoRandom = 0;

static void UpdateScreenDma(void);
static void UpdateScreenCpuSet(void);
static void ClearOamBufferCpuSet(void);
static void ClearOamBufferDma(void);
void GetInput(void);
bool32 ProcessVramGraphicsCopyQueue(void);

static void VBlankIntr(void);
static void HBlankIntr(void);
static void VCountIntr(void);
static void Timer0Intr(void);
static void Timer1Intr(void);
static void Timer2Intr(void);
static void Dma0Intr(void);
static void Dma1Intr(void);
static void Dma2Intr(void);
#if (GAME == GAME_SA3)
void sub_80C66DC(void);
#endif
static void Dma3Intr(void);
static void KeypadIntr(void);
static void GamepakIntr(void);

extern void IntrMain(void);

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
#if (GAME == GAME_SA3)
    sub_80C66DC,
#endif
    Dma0Intr,
    Dma1Intr,
    Dma2Intr,
    Dma3Intr,
    KeypadIntr,
    GamepakIntr,
#if (GAME != GAME_SA3)
    NULL,
#endif
};

// Result of these:
// FALSE: Not currently in vblank
// TRUE:  Currently in VBlank /
VBlankProcessFunc const sVblankFuncs[] = {
    ProcessVramGraphicsCopyQueue,
    SA2_LABEL(sub_8004010),
#ifndef COLLECT_RINGS_ROM
    SA2_LABEL(sub_80039E4),
#endif
    SA2_LABEL(sub_8002B20),
};

#if (ENGINE == ENGINE_3)
// Multiboot area?
extern u8 gUnknown_02035000[0xA000];
extern void sub_80C4B48(void);
extern void sub_80C6908(void);
void sub_80BCB84(void); // inside core.c in SA3

// (99.97%) https://decomp.me/scratch/hVNLQ
NONMATCH("asm/non_matching/engine/EngineInit_sa3.inc", void EngineInit(void))
#else
// TODO: All DMAs are followed by a DmaWait(3) call in SA3... is this global and should be part of the macros?
void EngineInit(void)
#endif
{
    s16 i;
    u16 errorIdentifying;

#if (ENGINE == ENGINE_3)
    REG_IME = 0;
#endif
    REG_WAITCNT = WAITCNT_PREFETCH_ENABLE | WAITCNT_WS0_S_1 | WAITCNT_WS0_N_3;
    gFlags = 0;
    gFlagsPreVBlank = 0;
#if (ENGINE >= ENGINE_3)
    gUnknown_030035A4 = ~0;
#endif

#ifndef COLLECT_RINGS_ROM
    if ((REG_RCNT & 0xC000) != 0x8000) {
        gFlags = FLAGS_200;

#if (ENGINE != ENGINE_3)
        DmaCopy16(3, (void *)OBJ_VRAM0, EWRAM_START + 0x3B000, 0x5000);
#else
        DmaCopy16(3, (void *)BG_SCREEN_ADDR(24), gUnknown_02035000, sizeof(gUnknown_02035000));
        DmaWait(3);
#endif
    }
#endif

    // Skip the intro if these
    // 4 buttons are pressed
    if (gInput == (START_BUTTON | SELECT_BUTTON | B_BUTTON | A_BUTTON)) {
        gFlags |= FLAGS_SKIP_INTRO;
    } else {
#if (ENGINE != ENGINE_3)
        gFlags &= ~FLAGS_SKIP_INTRO;
#else
        gFlags = 0;
#endif
    }

#if COLLECT_RINGS_ROM
    DmaCopy16(3, (void *)OBJ_VRAM0, (void *)(EWRAM_START + 0x3b000), 0x5000);
#else
    DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif
#endif
    DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif
    DmaFill32(3, 0, (void *)PLTT, PLTT_SIZE);
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif

#if (ENGINE != ENGINE_3)
    sLastCalledVblankFuncId = VBLANK_FUNC_ID_NONE;
    gBackgroundsCopyQueueCursor = 0;
    gBackgroundsCopyQueueIndex = 0;
    gBgSpritesCount = 0;
    gVramGraphicsCopyCursor = 0;
    gVramGraphicsCopyQueueIndex = 0;
#else
    sLastCalledVblankFuncId = VBLANK_FUNC_ID_NONE;

    gBackgroundsCopyQueueIndex = gBackgroundsCopyQueueCursor = 0;
    gBgSpritesCount = 0;
    gVramGraphicsCopyCursor = 0;
    gVramGraphicsCopyQueueIndex = gVramGraphicsCopyCursor = 0;
#endif
    DmaFill32(3, 0, gBgSprites_Unknown2, sizeof(gBgSprites_Unknown2));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif

    // TODO: sort out this type
    *(u32 *)gBgSprites_Unknown1 = 0;

    DmaFill32(3, 0, gBgScrollRegs, sizeof(gBgScrollRegs));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif

    gSpriteOffset.x = 0;
    gSpriteOffset.y = 0;

    gDispCnt = DISPCNT_FORCED_BLANK;

    DmaFill32(3, 0, gVramGraphicsCopyQueue, sizeof(gVramGraphicsCopyQueue));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif

    gOamFreeIndex = 0;
    gOamFirstPausedIndex = 0;

    DmaFill16(3, 0x200, gOamBuffer, sizeof(gOamBuffer));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif
    DmaFill16(3, 0x200, gOamMallocBuffer, sizeof(gOamMallocBuffer));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif
    DmaFill32(3, ~0, gOamMallocOrders_StartIndex, sizeof(gOamMallocOrders_StartIndex));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif
    DmaFill32(3, ~0, gOamMallocOrders_EndIndex, sizeof(gOamMallocOrders_EndIndex));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif
    DmaFill32(3, 0, gObjPalette, sizeof(gObjPalette));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif
    DmaFill32(3, 0, gBgPalette, sizeof(gBgPalette));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
    sub_80C4B48();
#endif

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
    SA2_LABEL(gUnknown_03001944) = 0;
    SA2_LABEL(gUnknown_030017F0) = 0x100;
    SA2_LABEL(gUnknown_03005394) = 0x100;
    SA2_LABEL(gUnknown_03002A8C) = 0;
    SA2_LABEL(gUnknown_03004D58) = 0;
    SA2_LABEL(gUnknown_0300194C) = 0;
    SA2_LABEL(gUnknown_03002820) = 0;
    SA2_LABEL(gUnknown_03005398) = 0x100;

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
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif

    gBgOffsetsHBlankPrimary = gBgOffsetsBuffer[0];
    gBgOffsetsHBlankSecondary = gBgOffsetsBuffer[1];
    gHBlankCopyTarget = NULL;
    gHBlankCopySize = 0;
    gNumHBlankCallbacks = 0;
    gNumHBlankIntrs = 0;

    DmaFill32(3, 0, gHBlankCallbacks, sizeof(gHBlankCallbacks));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif
    DmaFill32(3, 0, gHBlankIntrs, sizeof(gHBlankCallbacks));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif

    gNumVBlankCallbacks = 0;
    gNumVBlankIntrs = 0;

    DmaFill32(3, 0, gVBlankCallbacks, sizeof(gVBlankCallbacks));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif
    DmaFill32(3, 0, gVBlankIntrs, sizeof(gVBlankIntrs));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif

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
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif
    INTR_VECTOR = (void *)gIntrMainBuf;
#else
    // On platforms where the whole program is in main RAM anyway, that is not necessary
    INTR_VECTOR = IntrMain;
#endif

#if (ENGINE != ENGINE_3)
    REG_IME = INTR_FLAG_VBLANK;
    REG_IE = INTR_FLAG_VBLANK;
    REG_DISPSTAT = DISPSTAT_HBLANK_INTR | DISPSTAT_VBLANK_INTR;
#else
    REG_IE = INTR_FLAG_VBLANK;
    REG_DISPSTAT = DISPSTAT_HBLANK_INTR | DISPSTAT_VBLANK_INTR;
    REG_IME = INTR_FLAG_VBLANK;
#endif

    // Setup multi sio
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
#if (ENGINE == ENGINE_3)
    DmaWait(3);
#endif
    gMultiSioStatusFlags = 0;
    gMultiSioEnabled = FALSE;

    MultiSioInit(0);

#if (ENGINE == ENGINE_3)
    gUnknown_0300620C = 0;
    gUnknown_03002BF0 = 0;
    gUnknown_03002C60 = 0;
#endif
}
#if (ENGINE == ENGINE_3)
END_NONMATCH
#endif

void EngineMainLoop(void)
{
#if !PLATFORM_WIN32
    while (TRUE)
#endif
    {
        gExecSoundMain = FALSE;
#if (ENGINE != ENGINE_3)
        if (!(gFlags & FLAGS_4000)) {
            m4aSoundMain();
        }
#else
        if (gFlags & FLAGS_40000) {
            sub_80BCB84();
        }
#endif

        if (sLastCalledVblankFuncId == VBLANK_FUNC_ID_NONE) {
            GetInput();

            if (gMultiSioEnabled) {
                gMultiSioStatusFlags = MultiSioMain(&gMultiSioSend, gMultiSioRecv, 0);
            }
#if (ENGINE == ENGINE_3)
            else if ((gFlags & (FLAGS_80000 | FLAGS_10000)) == FLAGS_80000) {
                sub_80C6908();
            }
#endif

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
#if (ENGINE == ENGINE_3)
        if (!(gFlags & FLAGS_4000)) {
            m4aSoundMain();
        }
#endif

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
        DmaCopy32(3, gBgPalette, (void *)BG_PLTT, sizeof(gBgPalette));
        gFlags ^= FLAGS_UPDATE_BACKGROUND_PALETTES;
    }

    if (gFlags & FLAGS_UPDATE_SPRITE_PALETTES) {
        DmaCopy32(3, gObjPalette, (void *)OBJ_PLTT, sizeof(gObjPalette));
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
            DmaCopy32(3, gHBlankCallbacks, gHBlankIntrs, gNumHBlankCallbacks * sizeof(HBlankIntrFunc));
        }
        gNumHBlankIntrs = gNumHBlankCallbacks;
    } else {
        REG_IE &= ~INTR_FLAG_HBLANK;
        gNumHBlankIntrs = 0;
    }

    if (gFlags & FLAGS_EXECUTE_HBLANK_COPY) {

        DmaCopy16(3, gBgOffsetsHBlankPrimary, gHBlankCopyTarget, gHBlankCopySize);
    }

    if (sLastCalledVblankFuncId == VBLANK_FUNC_ID_NONE) {
        ProcessOamBuffers();
        DmaCopy16(3, gOamBuffer + (OAM_ENTRY_COUNT / 4) * 0, (void *)OAM + (OAM_ENTRY_COUNT * (OAM_DATA_SIZE_AFFINE / 4) * 0),
                  OAM_SIZE / 4);
        DmaCopy16(3, gOamBuffer + (OAM_ENTRY_COUNT / 4) * 1, (void *)OAM + (OAM_ENTRY_COUNT * (OAM_DATA_SIZE_AFFINE / 4) * 1),
                  OAM_SIZE / 4);
        DmaCopy16(3, gOamBuffer + (OAM_ENTRY_COUNT / 4) * 2, (void *)OAM + (OAM_ENTRY_COUNT * (OAM_DATA_SIZE_AFFINE / 4) * 2),
                  OAM_SIZE / 4);
        DmaCopy16(3, gOamBuffer + (OAM_ENTRY_COUNT / 4) * 3, (void *)OAM + (OAM_ENTRY_COUNT * (OAM_DATA_SIZE_AFFINE / 4) * 3),
                  OAM_SIZE / 4);
    }

    for (i = 0; i < gNumVBlankIntrs; i++) {
#ifdef BUG_FIX
        if (gVBlankIntrs[i] != NULL)
#endif
        {
            gVBlankIntrs[i]();
        }
    }

    if (gFlags & FLAGS_EXECUTE_VBLANK_CALLBACKS) {
        DmaFill32(3, 0, gVBlankIntrs, sizeof(gVBlankIntrs));
        if (gNumVBlankCallbacks != 0) {
            DmaCopy32(3, gVBlankCallbacks, gVBlankIntrs, gNumVBlankCallbacks * sizeof(IntrFunc));
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
#if ((GAME == GAME_SA1) || (GAME == GAME_SA3))
        if (gBgOffsetsHBlankPrimary == gBgOffsetsBuffer[0]) {
            gBgOffsetsHBlankPrimary = gBgOffsetsBuffer[1];
            gBgOffsetsHBlankSecondary = gBgOffsetsBuffer[0];
        } else {
            gBgOffsetsHBlankPrimary = gBgOffsetsBuffer[0];
            gBgOffsetsHBlankSecondary = gBgOffsetsBuffer[1];
        }
#else
        if (gBgOffsetsHBlankPrimary == gBgOffsetsPrimary) {
            gBgOffsetsHBlankPrimary = gBgOffsetsSecondary;
            gBgOffsetsHBlankSecondary = gBgOffsetsPrimary;
        } else {
            gBgOffsetsHBlankPrimary = gBgOffsetsPrimary;
            gBgOffsetsHBlankSecondary = gBgOffsetsSecondary;
        }
#endif
    }
    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
    DmaFill16(3, 0x200, gOamBuffer + (OAM_ENTRY_COUNT / 4) * 0, OAM_SIZE / 4);
    DmaFill16(3, 0x200, gOamBuffer + (OAM_ENTRY_COUNT / 4) * 1, OAM_SIZE / 4);
    DmaFill16(3, 0x200, gOamBuffer + (OAM_ENTRY_COUNT / 4) * 2, OAM_SIZE / 4);
    DmaFill16(3, 0x200, gOamBuffer + (OAM_ENTRY_COUNT / 4) * 3, OAM_SIZE / 4);

    gNumVBlankCallbacks = 0;
    gFlags &= ~FLAGS_EXECUTE_VBLANK_CALLBACKS;
}

#ifndef COLLECT_RINGS_ROM
void UpdateScreenCpuSet(void)
{
    u8 i, j = 0;
    REG_DISPCNT = gDispCnt;
    CpuCopy32(gBgCntRegs, (void *)REG_ADDR_BG0CNT, sizeof(gBgCntRegs));

    if (gFlags & FLAGS_UPDATE_BACKGROUND_PALETTES) {
        CpuFastCopy(gBgPalette, (void *)BG_PLTT, sizeof(gBgPalette));
        gFlags ^= FLAGS_UPDATE_BACKGROUND_PALETTES;
    }

    if (gFlags & FLAGS_UPDATE_SPRITE_PALETTES) {
        CpuFastCopy(gObjPalette, (void *)OBJ_PLTT, sizeof(gObjPalette));
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
        ProcessOamBuffers();
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

        DmaCopy16(0, gBgOffsetsHBlankPrimary, gHBlankCopyTarget, gHBlankCopySize);
        DmaSet(0, gBgOffsetsHBlankPrimary + gHBlankCopySize, gHBlankCopyTarget,
               ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | (gHBlankCopySize >> 1));

    } else if (gHBlankCopyTarget) {
        REG_IE &= ~INTR_FLAG_HBLANK;
        gHBlankCopyTarget = NULL;
    }

    if (gFlagsPreVBlank & FLAGS_40) {
        REG_DISPSTAT |= DISPSTAT_VCOUNT_INTR;
        REG_DISPSTAT &= 0xff;
        REG_DISPSTAT |= SA2_LABEL(gVCountSetting) << 8; // V-Count Setting
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
#if (ENGINE != ENGINE_3)
            // TODO: Maybe BUG_FIX?
            m4aMPlayAllStop();
            m4aSoundVSyncOff();
#endif
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

bool32 ProcessVramGraphicsCopyQueue(void)
{
    u32 offset;
#ifndef NON_MATCHING
    struct GraphicsData_Hack *graphics;
#else
    struct GraphicsData *graphics;
#endif

    while (gVramGraphicsCopyCursor != gVramGraphicsCopyQueueIndex) {
#if (ENGINE != ENGINE_3)
        graphics = (void *)gVramGraphicsCopyQueue[gVramGraphicsCopyCursor];
#else
        graphics = (void *)&gVramGraphicsCopyQueue[gVramGraphicsCopyCursor];
#endif

        if (graphics->size != 0) {
            for (offset = 0; graphics->size > 0; offset += COPY_CHUNK_SIZE) {
                if (graphics->size > COPY_CHUNK_SIZE) {
#ifdef BUG_FIX
                    if ((graphics->src != 0) && (graphics->dest != 0))
#endif
                    {
#if (RENDERER != RENDERER_OPENGL)
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
#if (RENDERER != RENDERER_OPENGL)
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

#if (ENGINE == ENGINE_3)
void sub_80BCB84(void)
{
    volatile u16 sp0;
    volatile u16 sp2;
    volatile u32 sp4;
    volatile u16 sp8;

    m4aMPlayAllStop();
    m4aSoundVSyncOff();
    sp4 = gFlagsPreVBlank;
    gFlagsPreVBlank |= 0x8000;
    sp0 = REG_DISPCNT;
    sp8 = REG_DISPSTAT;
    REG_DISPCNT = 0x80U;
    REG_KEYCNT = 0x8304;
    REG_IME = 0;
    REG_DISPSTAT = 0;
    sp2 = REG_IE;
    REG_IE = 0x1000;
    REG_IE |= 0x2000;
    REG_IME = 1;
    SoundBiasReset();
    Stop();
    SoundBiasSet();
    REG_IME = 0;
    REG_IE = sp2;
    REG_IME = 1;
    REG_DISPSTAT = sp8;
    VBlankIntrWait();
    REG_DISPCNT = sp0;
    gFlagsPreVBlank = sp4;
    gFlags &= ~FLAGS_40000;
    m4aSoundVSyncOn();
}
#endif // (ENGINE == ENGINE_3)

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
#if (ENGINE == ENGINE_3)
static void Timer3Intr(void) { REG_IF = INTR_FLAG_TIMER3; }
#endif
static void KeypadIntr(void) { REG_IF = INTR_FLAG_KEYPAD; }
static void GamepakIntr(void) { REG_IF = INTR_FLAG_GAMEPAK; }
static void DummyFunc(void) { }

#if ((GAME == GAME_SA1) || (GAME == GAME_SA3))
static void ClearOamBufferCpuSet(void)
{
    gNumHBlankCallbacks = 0;

    gFlags &= ~FLAGS_EXECUTE_HBLANK_CALLBACKS;
    if (!(gFlags & FLAGS_20)) {
        if (gBgOffsetsHBlankPrimary == gBgOffsetsBuffer) {
            gBgOffsetsHBlankPrimary = &gBgOffsetsBuffer[1];
            gBgOffsetsHBlankSecondary = &gBgOffsetsBuffer[0];
        } else {
            gBgOffsetsHBlankPrimary = &gBgOffsetsBuffer[0];
            gBgOffsetsHBlankSecondary = &gBgOffsetsBuffer[1];
        }
    }
    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
    CpuFastFill(0x200, gOamBuffer, sizeof(gOamBuffer));
    gNumVBlankCallbacks = 0;
    gFlags &= ~FLAGS_EXECUTE_VBLANK_CALLBACKS;
}
#else
#ifndef COLLECT_RINGS_ROM
static void ClearOamBufferCpuSet(void)
{
    gNumHBlankCallbacks = 0;

    gFlags &= ~FLAGS_EXECUTE_HBLANK_CALLBACKS;
    if (!(gFlags & FLAGS_20)) {
        if (gBgOffsetsHBlankPrimary == gBgOffsetsPrimary) {
            gBgOffsetsHBlankPrimary = gBgOffsetsSecondary;
            gBgOffsetsHBlankSecondary = gBgOffsetsPrimary;
        } else {
            gBgOffsetsHBlankPrimary = gBgOffsetsPrimary;
            gBgOffsetsHBlankSecondary = gBgOffsetsSecondary;
        }
    }
    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
    CpuFastFill(0x200, gOamBuffer, sizeof(gOamBuffer));
    gNumVBlankCallbacks = 0;
    gFlags &= ~FLAGS_EXECUTE_VBLANK_CALLBACKS;
}
#endif
#endif
