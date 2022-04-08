#include "global.h"
#include "gba/flash_internal.h"

u16 ProgramFlashSector_LE(u16 sectorNum, u8 *src)
{
    u16 result;
    u8 *dest;
    u16 readFlash1Buffer[0x20];

        
    if (sectorNum >= gFlash->sector.count)
        return 0x80FF;

    //TODO: erase verify routine transmit

    result = EraseFlashSector_MX(sectorNum);

    //TODO: erase retry

    if (result != 0)
        return result;

    SetReadFlash1(readFlash1Buffer);

    REG_WAITCNT = (REG_WAITCNT & ~WAITCNT_SRAM_MASK) | gFlash->wait[0];

    gFlashNumRemainingBytes = gFlash->sector.size;
    dest = FLASH_BASE + (sectorNum << gFlash->sector.shift);

    while (gFlashNumRemainingBytes > 0)
    {
        result = ProgramByte(src, dest);

        if (result != 0)
            break;

        gFlashNumRemainingBytes--;
        src++;
        dest++;
    }
    REG_WAITCNT = (REG_WAITCNT & ~WAITCNT_SRAM_MASK) | 3;

    return result;
}
