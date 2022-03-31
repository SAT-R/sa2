#include "global.h"

void sub_8001404(void);
void InitMain(void);

extern char gUnknown_0300188C;
extern s32 gUnknown_03001840;
extern s32 gUnknown_03001884;
extern s32 gUnknown_03004D54;
extern s32 gUnknown_030022C0;
extern s32 gUnknown_030022AC;

extern OamData gUnknown_03004D90[];
extern char gUnknown_03004D50;

extern u8 gUnknown_030018E0;
extern HBlankFunc gUnknown_03002AF0[0xa0];

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

static void HBlankIntr(void) {
    u8 i;
    u8 vcount = *(vu8*)REG_ADDR_VCOUNT;

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

void sub_8002450(void) {
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
    CpuFastFill(0x200, gUnknown_03004D90, OAM_SIZE);
    gUnknown_03004D50 = 0;
    gUnknown_03001840 &= ~16;
}

void AgbMain(void) {
    sub_8001404();
    // Some sort of init function
    InitMain();
    MainLoop();
}
