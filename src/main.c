#include "main.h"

#include "global.h"
#include "m4a.h"
#include "malloc_ewram.h"
#include "multi_sio.h"

#define GetBit(x, y) ((x) >> (y)&1)

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

// To be filled once we have all the functions needed
// IntrFunc const gIntrTableTemplate[] = {
//     (void*)gMultiSioIntrFuncBuf,
//     VBlankIntr,
//     HBlankIntr,
//     VCountIntr,
//     Timer0Intr,
//     Timer1Intr,
//     Timer2Intr,
//     Timer3Intr,
//     Dma0Intr,
//     Dma1Intr,
//     Dma2Intr,
//     Dma3Intr,
//     KeypadIntr,
//     GamepakIntr,
// };

void GameInit(void) {
    s16 i;

    REG_WAITCNT = WAITCNT_PREFETCH_ENABLE | WAITCNT_WS0_S_1 | WAITCNT_WS0_N_3;
    gUnknown_03001840 = 0;
    gUnknown_03002790 = 0;

    if ((REG_RCNT & 0xc000) != 0x8000) {
        gUnknown_03001840 = 0x200;
        DmaSet(3, OBJ_VRAM0, &gUnknown_0203B000, 0x80002800);
    }

    if (gInput == (START_BUTTON | SELECT_BUTTON | B_BUTTON | A_BUTTON)) {
        gUnknown_03001840 = gUnknown_03001840 | 0x1000;
    } else {
        gUnknown_03001840 &= 0xffffefff;
    }

    DmaFill32(3, 0, (void *)VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill32(3, 0, (void *)PLTT, PLTT_SIZE)

        gUnknown_030026F4 = 0xff;
    gUnknown_03002AE4 = 0;
    gUnknown_0300287C = 0;
    gUnknown_03005390 = 0;
    gUnknown_03004D5C = 0;
    gUnknown_03002A84 = 0;

    DmaFill32(3, 0, gUnknown_03002280, 0x10);
    gUnknown_03004D80 = 0;

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
        gUnknown_03002700[i] = 0x14;
        gUnknown_03002850[i] = 8;
    }

    gUnknown_030053C0.unk8 = 0;
    // This matches better when the params are inlined
    asm("" ::: "sb");
    gUnknown_03001880 = 0;
    gUnknown_030053B0 = 0;
    asm("" ::: "sl");

    gUnknown_03002264 = 0;

    for (i = 0; i < 15; i++) {
        gIntrTable[i] = gIntrTableTemplate[i];
    }

    DmaFill32(3, 0, &gUnknown_03001B60, 0x500);

    gUnknown_03001884 = gUnknown_03001B60[0];
    gUnknown_030022AC = gUnknown_03001B60[1];
    gUnknown_03002878 = 0;
    gUnknown_03002A80 = 0;
    gUnknown_0300188C = 0;
    gUnknown_030018E0 = 0;

    DmaFill32(3, 0, gUnknown_030026E0, 0x10);
    DmaFill32(3, 0, gUnknown_03002AF0, 0x10);

    gUnknown_03004D50 = 0;
    gUnknown_03001948 = 0;

    DmaFill32(3, 0, gUnknown_03001870, 0x10);
    DmaFill32(3, 0, gUnknown_030053A0, 0x10);

    m4aSoundInit();
    m4aSoundMode(0x93f500);

    gUnknown_030053B4 = 1;

    TaskInit();
    EwramInitHeap();

    gUnknown_03001888 = 0x230;
    gUnknown_03001940 = BG_VRAM + BG_VRAM_SIZE + 0x3a00;
    sub_8007CC8();

    if (sub_8096C9C() != 0) {
        gUnknown_03001840 = gUnknown_03001840 | 0x100;
    } else {
        sub_8096884(1, &gUnknown_030007C4);
    }

    // Setup interrupt table
    DmaCopy32(3, IntrMain, &gUnknown_030007F0, 0x200);
    INTR_VECTOR = &gUnknown_030007F0;

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

void GameLoop(void) {
    while (TRUE) {
        gUnknown_030053B4 = 0;
        if (!(gUnknown_03001840 & 0x4000)) {
            m4aSoundMain();
        }

        if (gUnknown_030026F4 == 0xff) {
            GetInput();
            if (gUnknown_03001954 != 0) {
                gMultiSioStatusFlags =
                    MultiSioMain(&gMultiSioSend, gMultiSioRecv, 0);
            }
            sub_8002724();
        }

        gUnknown_03002790 = gUnknown_03001840;
        VBlankIntrWait();
        if (gUnknown_03001840 & 0x4000) {
            UpdateScreenCpuSet();
            if (!(gUnknown_03001840 & 0x400)) {
                ClearOamBufferCpuSet();
            }
        } else {
            UpdateScreenDma();
            if (!(gUnknown_03001840 & 0x400)) {
                ClearOamBufferDma();
            }
        }
        if ((gUnknown_03001840 & 0x400)) {
            gUnknown_03001840 |= 0x800;
        } else {
            gUnknown_03001840 &= ~0x800;
        }

        // Wait for vblank
        while (REG_DISPSTAT & DISPSTAT_VBLANK)
            ;
    };
}

ASM_FUNC("asm/non_matching/main/UpdateScreenDma.inc",
         void UpdateScreenDma(void));

void ClearOamBufferDma(void) {
    gUnknown_0300188C = 0;

    gUnknown_03001840 &= ~8;
    if ((gUnknown_03001840 & (0x20)) == 0) {
        if (gUnknown_03001884 == gUnknown_03004D54) {
            gUnknown_03001884 = gUnknown_030022C0;
            gUnknown_030022AC = gUnknown_03004D54;
        } else {
            gUnknown_03001884 = gUnknown_03004D54;
            gUnknown_030022AC = gUnknown_030022C0;
        }
    }
    gUnknown_03001840 &= ~4;
    DmaFill16(3, 0x200, gOamBuffer, 0x100);
    DmaFill16(3, 0x200, gOamBuffer + 0x20, 0x100);
    DmaFill16(3, 0x200, gOamBuffer + 0x40, 0x100);
    DmaFill16(3, 0x200, gOamBuffer + 0x60, 0x100);

    gUnknown_03004D50 = 0;
    gUnknown_03001840 &= ~16;
}

ASM_FUNC("asm/non_matching/main/UpdateScreenCpuSet.inc",
         void UpdateScreenCpuSet(void));

ASM_FUNC("asm/non_matching/main/sub_8001F9C.inc", void sub_8001F9C(void));

u32 sub_80021c4(void) {
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

void GetInput(void) {
    s8 i;
    u8 *r7 = gUnknown_030022A0, *sb = gUnknown_03002700,
       *r8 = gUnknown_03002850;
    gInput = (~REG_KEYINPUT & KEYS_MASK);
    gUnknown_03001880 = gInput;

    if (gUnknown_030053C0.unk8 == 1) {
        sub_8007DBC(gInput);
    } else if (gUnknown_030053C0.unk8 == 2) {
        gInput = sub_8007D8C();
    }

    gPressedKeys = (gInput ^ gPrevInput) & gInput;
    gReleasedKeys = (gInput ^ gPrevInput) & gPrevInput;
    gPrevInput = gInput;
    gUnknown_030022B8 = gPressedKeys;

    for (i = 0; i < 10; i++) {
        if (!GetBit(gInput, i)) {
            r7[i] = sb[i];
        } else if (r7[i] != 0) {
            r7[i]--;
        } else {
            gUnknown_030022B8 |= 1 << i;
            r7[i] = r8[i];
        }
    }
}

static void HBlankIntr(void) {
    u8 i;
    u8 vcount = *(vu8 *)REG_ADDR_VCOUNT;

    if (vcount <= 0x9f) {
        for (i = 0; i < gUnknown_030018E0; i++) {
            gUnknown_03002AF0[i](vcount);
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

void DummyFunc(void) { return; }

void ClearOamBufferCpuSet(void) {
    gUnknown_0300188C = 0;

    gUnknown_03001840 &= ~8;
    if ((gUnknown_03001840 & (0x20)) == 0) {
        if (gUnknown_03001884 == gUnknown_03004D54) {
            gUnknown_03001884 = gUnknown_030022C0;
            gUnknown_030022AC = gUnknown_03004D54;
        } else {
            gUnknown_03001884 = gUnknown_03004D54;
            gUnknown_030022AC = gUnknown_030022C0;
        }
    }
    gUnknown_03001840 &= ~4;
    CpuFastFill(0x200, gOamBuffer, OAM_SIZE);
    gUnknown_03004D50 = 0;
    gUnknown_03001840 &= ~16;
}

void AgbMain(void) {
    GameInit();
    // Some sort of init function
    InitMain();
    GameLoop();
}
