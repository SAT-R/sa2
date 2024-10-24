#include "global.h"
#include "lib/agb_flash/flash_internal.h"

const u16 mx512kMaxTime[] = {
    10,   65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK, //
    10,   65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK, //
    2000, 65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK, //
    2000, 65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK, //
};

const u16 paMaxTime[] = {
    10,  65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK, //
    10,  65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK, //
    500, 65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK, //
    500, 65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK, //
};

const struct FlashSetupInfo MX29L512 = {
    ProgramFlashSector_MX,
    EraseFlashChip_LE,
    EraseFlashSector_LE,
    WaitForFlashWrite512K_Common,
    mx512kMaxTime,
    {
        65536, // ROM size
        {
            4096, // sector size
            12, // bit shift to multiply by sector size (4096 == 1 << 12)
            16, // number of sectors
            0 // appears to be unused
        },
        { 3, 1 }, // wait state setup data
        { { 0xC2, 0x1C } } // ID
    },
};

const struct FlashSetupInfo MN63F805MNP = {
    ProgramFlashSector_MX,
    EraseFlashChip_LE,
    EraseFlashSector_LE,
    WaitForFlashWrite512K_Common,
    paMaxTime,
    {
        65536, // ROM size
        {
            4096, // sector size
            12, // bit shift to multiply by sector size (4096 == 1 << 12)
            16, // number of sectors
            0 // appears to be unused
        },
        { 0, 2 }, // wait state setup data
        { { 0x32, 0x1B } } // ID
    },
};

u16 ProgramFlashSector_MX(u16 sectorNum, void *src)
{
    u16 result;
    u8 *dest;
    u16 readFlash1Buffer[0x20];

    if (sectorNum >= gFlash->sector.count)
        return 0x80FF;

    // TODO: erase verify routine transmit

    result = EraseFlashSector_LE(sectorNum);

    // TODO: erase retry

    if (result != 0)
        return result;

    SetReadFlash1(readFlash1Buffer);

    REG_WAITCNT = (REG_WAITCNT & ~WAITCNT_SRAM_MASK) | gFlash->wait[0];

    gFlashNumRemainingBytes = gFlash->sector.size;
    dest = FLASH_BASE + (sectorNum << gFlash->sector.shift);

    while (gFlashNumRemainingBytes > 0) {
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
