#include "global.h"
#include "agb_flash.h"
#include "m4a.h"

extern IntrFunc gIntrTable[4];
extern u16 gUnknown_03003B70;

// TCG = Tiny Chao Garden
struct TCG_SaveSectorHeader {
    u32 security, version;
};

struct TCG_SaveSectorData {
    struct TCG_SaveSectorHeader header;

    u8 padding_8[0x850];
}; /* size:0x858 according to sub_02000248 */

#define GBA_ROM_HEADER_FIXED_VALUE_ADDR ((vu8 *)(ROM_BASE + 0xB2))
#define FIXED_HEADER_VALUE              0x96

// TCG = Tiny Chao Garden
#define TCG_FIRST_SAVE_SECTOR 10
#define TCG_SAVE_SECTOR_COUNT 6

extern u8 IntrMain_RAM[0x80];

extern struct TCG_SaveSectorData gUnknown_03003B80;

void sub_0200019c(void)
{
    IntrFunc *base, *table, dummy;

    // Init IntrMain_RAM
    CPU_COPY(IntrMain, IntrMain_RAM, sizeof(IntrMain_RAM), 32);
    INTR_VECTOR = IntrMain_RAM;

    // Init IntrTable
    base = gIntrTable;
    dummy = &IntrDummy;
    table = base + 3;
    do {
        *table = dummy;
    } while ((signed)--table >= (signed)base);

    REG_IE = INTR_FLAG_VBLANK;

    if (*GBA_ROM_HEADER_FIXED_VALUE_ADDR == FIXED_HEADER_VALUE) {
        REG_IE |= INTR_FLAG_GAMEPAK;
        gUnknown_03003B70 = INTR_FLAG_GAMEPAK;
    } else {
        gUnknown_03003B70 = 0;
    }

    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_IME = INTR_FLAG_VBLANK;
}

void sub_02000228(IntrFunc func)
{
    IntrFunc toInsert;

    if (!func)
        toInsert = &IntrDummy;
    else
        toInsert = func;

    gIntrTable[1] = toInsert;
}

void IntrDummy(void) { }
