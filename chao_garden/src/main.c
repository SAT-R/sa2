#include "global.h"
#include "save.h"
#include "joy_bus.h"
#include "input.h"
#include "m4a.h"

#define ROM_MAKER_CODE_ADDR ((vu8 *)(ROM_BASE + 0xB2))
#define DIMPS_MAKER_CODE    0x96

static void SetupInterrupts(void);

static void GameInit(void)
{
    switch (gUnknown_02000008.unk4) {
        default:
        case 0:
            gUnknown_03003330.unk10 = 0;
            break;
        case 1:
            gUnknown_03003330.unk10 = 1;
            break;
        case 2:
            gUnknown_03003330.unk10 = 2;
            break;
        case 3:
            gUnknown_03003330.unk10 = 3;
            break;
        case 4:
            gUnknown_03003330.unk10 = 4;
            break;
    }

    sub_02001528(gUnknown_02000008.unk8);
    SetupInterrupts();
    LoadGameState();
    JoyBusInit();
    InputInit();
    sub_020018a0();
    sub_0200be24();
    sub_0200d27c();
    gUnknown_03003330.unkF = 0;
    gUnknown_03003330.unkC = 0;
    gUnknown_03003330.unk8 = 0;
    gUnknown_03003330.unkE = 0;
}

void AgbMain()
{
    GameInit();
    gUnknown_03003330.unk0 = InitGarden;
    while (TRUE) {
        VBlankIntrWait();
        GetInput();
        gUnknown_03003330.unk0();
        m4aSoundMain();
        gUnknown_03003330.unk8++;
        gUnknown_03003330.unkE = 1;
    }
}

static void SetupInterrupts(void)
{
    IntrFunc *base, *table, dummy;

    // Init IntrMain_RAM
    CpuCopy32(IntrMain, IntrMain_RAM, sizeof(IntrMain_RAM));
    INTR_VECTOR = IntrMain_RAM;

    // Init IntrTable
    base = gIntrTable;
    dummy = &IntrDummy;
    table = &base[3];
    do {
        *table = dummy;
    } while ((s32)--table >= (s32)base);

    REG_IE = INTR_FLAG_VBLANK;

    if (*ROM_MAKER_CODE_ADDR == DIMPS_MAKER_CODE) {
        REG_IE |= INTR_FLAG_GAMEPAK;
        gUnknown_03003B70 = INTR_FLAG_GAMEPAK;
    } else {
        gUnknown_03003B70 = 0;
    }

    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_IME = INTR_FLAG_VBLANK;
}

void SetVBlankIntr(IntrFunc func)
{
    IntrFunc toInsert;

    if (func == NULL)
        toInsert = &IntrDummy;
    else
        toInsert = func;

    gIntrTable[1] = toInsert;
}

void IntrDummy(void) { }
