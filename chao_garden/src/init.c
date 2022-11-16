#include "global.h"
#include "agb_flash.h"
#include "m4a.h"

extern IntrFunc gIntrTable[4];

// TCG = Tiny Chao Garden
struct TCG_SaveSectorHeader {
    u32 security, version;
};

struct TCG_SaveSectorData {
    struct TCG_SaveSectorHeader header;

    u8 padding_8[0x850];
}; /* size:0x858 according to sub_02000248 */

// TCG = Tiny Chao Garden
#define TCG_FIRST_SAVE_SECTOR 10
#define TCG_SAVE_SECTOR_COUNT 6

extern struct TCG_SaveSectorData gUnknown_03003B80;

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
