#include "main.h"
#include "init.h"
#include "data.h"
#include "global.h"
#include "m4a.h"
#include "malloc_ewram.h"
#include "multi_sio.h"
#include "sprite.h"
#include "task.h"
#include "agb_flash.h"
#include "flags.h"
#include "input.h"
#include "input_recorder.h"

// TODO make static
u32 gFlagsPreVBlank;


static void UpdateScreenDma(void);
static void UpdateScreenCpuSet(void);
static void ClearOamBufferCpuSet(void);
static void ClearOamBufferDma(void);
static void GetInput(void);
static u32 sub_80021C4(void);

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
    sub_80021C4,
    sub_8004010,
    sub_80039E4,
    sub_8002B20,
};

static void GameInit(void) {
    s16 i;
    u16 errorIdentifying;

    REG_WAITCNT = WAITCNT_PREFETCH_ENABLE | WAITCNT_WS0_S_1 | WAITCNT_WS0_N_3;
    gFlags = 0;
    gFlagsPreVBlank = 0;

    if ((REG_RCNT & 0xc000) != 0x8000) {
        gFlags = 0x200;
        DmaSet(3, (void*)OBJ_VRAM0, &gUnknown_0203B000, 0x80002800);
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
    gUnknown_03004D5C = 0;
    gUnknown_03002A84 = 0;

    DmaFill32(3, 0, gUnknown_03002280, 0x10);

    // TODO: sort out this type
    *(u32*)gUnknown_03004D80 = 0;

    DmaFill32(3, 0, gBgScrollRegs, sizeof(gBgScrollRegs));

    gUnknown_030017F4[0] = 0;
    gUnknown_030017F4[1] = 0;

    gDispCnt = DISPCNT_FORCED_BLANK;

    DmaFill32(3, 0, gUnknown_030027A0, 0x80);

    gUnknown_030018F0 = 0;
    gUnknown_03002AE0 = 0;

    DmaFill16(3, 0x200, gOamBuffer, OAM_SIZE);
    DmaFill16(3, 0x200, gUnknown_030022D0, 0x400);
    DmaFill32(3, ~0, gUnknown_03001850, 0x20);
    DmaFill32(3, ~0, gUnknown_03004D60, 0x20);
    DmaFill32(3, 0, gObjPalette, OBJ_PLTT_SIZE);
    DmaFill32(3, 0, gBgPalette, BG_PLTT_SIZE);

    gBgAffineRegs.bg2pa = 0x100;
    gBgAffineRegs.bg2pb = 0;
    gBgAffineRegs.bg2pc = 0;
    gBgAffineRegs.bg2pd = 0x100;
    gBgAffineRegs.bg2x = 0;
    gBgAffineRegs.bg2y = 0;
    gBgAffineRegs.bg3pa = 0x100;
    gBgAffineRegs.bg3pb = 0;
    gBgAffineRegs.bg3pc = 0;
    gBgAffineRegs.bg3pd = 0x100;
    gBgAffineRegs.bg3x = 0;
    gBgAffineRegs.bg3y = 0;

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
    gUnknown_030053B8 = 0;

    for (i = 0; i < 10; i++) {
        gKeysFirstRepeatIntervals[i] = 20;
        gKeysContinuedRepeatIntervals[i] = 8;
    }

    gInputRecorder.mode = RECORDER_DISABLED;
    // This matches better when the params are inlined
    asm("" ::: "sb");
    gPhysicalInput = 0;
    gInputPlaybackData = NULL;
    asm("" ::: "sl");

    gFrameCount = 0;

    for (i = 0; i < 15; i++) {
        gIntrTable[i] = gIntrTableTemplate[i];
    }

    DmaFill32(3, 0, &gUnknown_03001B60, sizeof(gUnknown_03001B60));

    gUnknown_03001884 = gUnknown_03001B60[0];
    gUnknown_030022AC = gUnknown_03001B60[1];
    gUnknown_03002878 = NULL;
    gUnknown_03002A80 = 0;
    gHBlankCallbackIndex = 0;
    gHBlankFunctionsLength = 0;

    DmaFill32(3, 0, gHBlankCallbacks, 4 * sizeof(HBlankFunc));
    DmaFill32(3, 0, gHBlankFunctions, 4 * sizeof(HBlankFunc));

    gUnknown_03004D50 = 0;
    gUnknown_03001948 = 0;

    DmaFill32(3, 0, gUnknown_03001870, 4 * sizeof(FuncType_030053A0));
    DmaFill32(3, 0, gUnknown_030053A0, 4 * sizeof(FuncType_030053A0));

    m4aSoundInit();
    m4aSoundMode(DEFAULT_SOUND_MODE);

    gExecuteSoundMain = TRUE;

    TaskInit();
    EwramInitHeap();

    gUnknown_03001888 = 0x230;
    gUnknown_03001940 = BG_VRAM + BG_VRAM_SIZE + 0x3a00;
    sub_8007CC8();

    errorIdentifying = IdentifyFlash();
    if (errorIdentifying) {
        gFlags |= FLAGS_NO_FLASH_MEMORY;
    } else {
        SetFlashTimerIntr(1, &gIntrTable[5]);
    }

    // Setup interrupt table
    DmaCopy32(3, IntrMain, gIntrMainBuf, 0x200);
    INTR_VECTOR = gIntrMainBuf;

    REG_IME = INTR_FLAG_VBLANK;
    REG_IE = INTR_FLAG_VBLANK;
    REG_DISPSTAT = DISPSTAT_HBLANK_INTR | DISPSTAT_VBLANK_INTR;

    // Setup multi sio
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
    gMultiSioStatusFlags = 0;
    gUnknown_03001954 = 0;

    MultiSioInit(0);
}

static void GameLoop(void) {
    while (TRUE) {
        gExecuteSoundMain = FALSE;
        if (!(gFlags & 0x4000)) {
            m4aSoundMain();
        }

        if (gUnknown_030026F4 == 0xff) {
            GetInput();
            if (gUnknown_03001954 != 0) {
                gMultiSioStatusFlags =
                    MultiSioMain(&gMultiSioSend, gMultiSioRecv, 0);
            }
            TaskExecute();
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

static void UpdateScreenDma(void) {
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
    DmaCopy16(3, gBgScrollRegs, (void *)REG_ADDR_BG0HOFS,
              sizeof(gBgScrollRegs));
    DmaCopy32(3, &gBgAffineRegs, (void *)REG_ADDR_BG2PA, sizeof(gBgAffineRegs));

    if (gFlags & FLAGS_EXECUTE_HBLANK_CALLBACKS) {
        REG_IE |= INTR_FLAG_HBLANK;
        DmaFill32(3, 0, gHBlankFunctions, 4 * sizeof(HBlankFunc));
        if (gHBlankCallbackIndex != 0) {
            DmaCopy32(3, gHBlankCallbacks, gHBlankFunctions,
                      gHBlankCallbackIndex * sizeof(HBlankFunc));
        }
        gHBlankFunctionsLength = gHBlankCallbackIndex;
    } else {
        REG_IE &= ~INTR_FLAG_HBLANK;
        gHBlankFunctionsLength = 0;
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
        DmaFill32(3, 0, gUnknown_030053A0, 4 * sizeof(FuncType_030053A0));
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
    for (; j <= 3; j++) {
        if (spriteUpdateFuncs[j]() == 0) {
            gUnknown_030026F4 = j;
            break;
        }
    }
}

static void ClearOamBufferDma(void) {
    gHBlankCallbackIndex = 0;

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

static void UpdateScreenCpuSet(void) {
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
        CpuFastFill(0, gHBlankFunctions, 4 * sizeof(HBlankFunc));
        if (gHBlankCallbackIndex != 0) {
            CpuFastSet(gHBlankCallbacks, gHBlankFunctions, gHBlankCallbackIndex);
        }
        gHBlankFunctionsLength = gHBlankCallbackIndex;
    } else {
        REG_IE &= ~INTR_FLAG_HBLANK;
        gHBlankFunctionsLength = 0;
    }

    if (gUnknown_030026F4 == 0xff) {
        DrawToOamBuffer();
        CpuFastCopy(gOamBuffer, (void *)OAM, OAM_SIZE);
    }

    for (i = 0; i < gUnknown_03001948; i++) {
        gUnknown_030053A0[i]();
    }

    if (gFlags & 0x10) {
        CpuFastFill(0, gUnknown_030053A0, 0x10);
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

static void VBlankIntr(void) {
    u16 keys;
    DmaStop(0);
    m4aSoundVSync();
    INTR_CHECK |= 1;
    gExecuteSoundMain = TRUE;

    if (gFlagsPreVBlank & 4) {
        REG_IE |= INTR_FLAG_HBLANK;
        DmaWait(0);
        DmaCopy16(0, gUnknown_03001884, gUnknown_03002878, gUnknown_03002A80);
        // TODO: resolve this cast
        DmaSet(0, (vu8*)gUnknown_03001884 + gUnknown_03002A80, gUnknown_03002878,
               ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD)
                << 16) |
                   (gUnknown_03002A80 >> 1));
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
        keys = ~REG_KEYINPUT &
               (START_BUTTON | SELECT_BUTTON | B_BUTTON | A_BUTTON);
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

static u32 sub_80021C4(void) {
    u32 i;
    struct Unk_03002EC0 *current;

    while (gUnknown_03004D5C != gUnknown_03002A84) {
        current = gUnknown_030027A0[gUnknown_03004D5C];

        if (current->unk8) {
            for (i = 0; current->unk8 != 0; i += 0x400) {
                if (current->unk8 > 0x400) {
                    DmaCopy16(3, current->unk0 + i, current->unk4 + i, 0x400);
                    current->unk8 -= 0x400;
                } else {
                    DmaCopy16(3, current->unk0 + i, current->unk4 + i,
                              current->unk8);
                    current->unk8 = 0;
                }
            }
        }

        gUnknown_03004D5C++;
        gUnknown_03004D5C &= 0x1f;

        if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
            return 0;
        }
    }
    return 1;
}

static void GetInput(void) {
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

static void HBlankIntr(void) {
    u8 i;
    u8 vcount = *(vu8 *)REG_ADDR_VCOUNT;

    if (vcount < DISPLAY_HEIGHT) {
        for (i = 0; i < gHBlankFunctionsLength; i++) {
            gHBlankFunctions[i](vcount);
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

static void DummyFunc(void) { }

static void ClearOamBufferCpuSet(void) {
    gHBlankCallbackIndex = 0;

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
    CpuFastFill(0x200, gOamBuffer, OAM_SIZE);
    gUnknown_03004D50 = 0;
    gFlags &= ~16;
}

void AgbMain(void) {
    GameInit();
    GameStart();
    GameLoop();
}
