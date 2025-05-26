#include "core.h"

void sub_020048AC(u8 a, u8 b, u8 c, u16 d, u16 e)
{
    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    gHBlankCopyTarget = (void *)(REG_ADDR_BG0HOFS + a * 4);
    gHBlankCopySize = 4;
    if (b < c) {
        DmaFill32(3, ((d & 0x1FF) | ((e & 0x1FF) << 0x10)), gBgOffsetsHBlank + (b * 4), (c - b) * 4);
    }
}
