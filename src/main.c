#include "global.h"
#include "main.h"

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

ASM_FUNC("asm/non_matching/main/sub_80021c4.inc", void sub_80021c4(void));

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

    gPressedKeys =
        (gInput ^ gPrevInput) & gInput;
    gReleasedKeys =
        (gInput ^ gPrevInput) & gPrevInput;
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
    sub_8001404();
    // Some sort of init function
    InitMain();
    MainLoop();
}
