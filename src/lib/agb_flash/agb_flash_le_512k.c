#include "global.h"
#include "lib/agb_flash/flash_internal.h"

const u16 le512kMaxTime[] = {
    10,  65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK, //
    10,  65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK, //
    40,  65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK, //
    200, 65469, TIMER_ENABLE | TIMER_INTR_ENABLE | TIMER_256CLK, //
};

const struct FlashSetupInfo DefaultFlash512K = {
    ProgramFlashSector_LE,
    EraseFlashChip_LE,
    EraseFlashSector_LE,
    WaitForFlashWrite512K_Common,
    le512kMaxTime,
    {
        65536, // ROM size
        {
            4096, // sector size
            12, // bit shift to multiply by sector size (4096 == 1 << 12)
            16, // number of sectors
            0 // appears to be unused
        },
        { 3, 3 }, // wait state setup data
        { { 0, 0 } } // ID
    },
};

const struct FlashSetupInfo LE39FW512 = {
    ProgramFlashSector_LE,
    EraseFlashChip_LE,
    EraseFlashSector_LE,
    WaitForFlashWrite512K_Common,
    le512kMaxTime,
    {
        65536, // ROM size
        {
            4096, // sector size
            12, // bit shift to multiply by sector size (4096 == 1 << 12)
            16, // number of sectors
            0 // appears to be unused
        },
        { 1, 2 }, // wait state setup data
        { { 0xBF, 0xD4 } } // ID
    },
};

u16 EraseFlashChip_LE(void)
{
    u16 result;
    u16 readFlash1Buffer[0x20];

    REG_WAITCNT = (REG_WAITCNT & ~WAITCNT_SRAM_MASK) | gFlash->wait[0];

    FLASH_WRITE(0x5555, 0xAA);
    FLASH_WRITE(0x2AAA, 0x55);
    FLASH_WRITE(0x5555, 0x80);
    FLASH_WRITE(0x5555, 0xAA);
    FLASH_WRITE(0x2AAA, 0x55);
    FLASH_WRITE(0x5555, 0x10);

    SetReadFlash1(readFlash1Buffer);

    result = WaitForFlashWrite(3, FLASH_BASE, 0xFF);

    REG_WAITCNT = (REG_WAITCNT & ~WAITCNT_SRAM_MASK) | WAITCNT_SRAM_8;

    return result;
}

u16 EraseFlashSector_LE(u16 sectorNum)
{
    u16 result;
    u8 *addr;
    u16 readFlash1Buffer[0x20];

    if (sectorNum >= 0x10)
        return 0x80FF;

    REG_WAITCNT = (REG_WAITCNT & ~WAITCNT_SRAM_MASK) | gFlash->wait[0];

    addr = FLASH_BASE + (sectorNum << gFlash->sector.shift);

    FLASH_WRITE(0x5555, 0xAA);
    FLASH_WRITE(0x2AAA, 0x55);
    FLASH_WRITE(0x5555, 0x80);
    FLASH_WRITE(0x5555, 0xAA);
    FLASH_WRITE(0x2AAA, 0x55);
    *addr = 0x30;

    SetReadFlash1(readFlash1Buffer);

    result = WaitForFlashWrite(2, addr, 0xFF);

    REG_WAITCNT = (REG_WAITCNT & ~WAITCNT_SRAM_MASK) | WAITCNT_SRAM_8;

    return result;
}

u16 ProgramByte(u8 *src, u8 *dest)
{
    FLASH_WRITE(0x5555, 0xAA);
    FLASH_WRITE(0x2AAA, 0x55);
    FLASH_WRITE(0x5555, 0xA0);
    *dest = *src;

    return WaitForFlashWrite(1, dest, *src);
}

static u32 VerifyEraseSector_Core(u8 *dest);
static u16 VerifyEraseSector(u8 *dest, u8 *src);

u16 ProgramFlashSector_LE(u16 sectorNum, void *src)
{
    u16 result;
    u8 *dest;
    u16 VerifyEraseSector_Core_Buffer[0x30];
    u16 *funcSrc;
    u16 *funcDest;
    u16 i;
    u8 tryNum;
    u8 erasesToTry;
    u8 j;

    if (sectorNum > 15)
        return 0x80FF;

#if AGBFLASH_USE_V126
    if (gFlash->sector.count == FLASH_ROM_SIZE_1M) {
        SwitchFlashBank(sectorNum / SECTORS_PER_BANK);
        sectorNum %= SECTORS_PER_BANK;
    }
#endif

    dest = FLASH_BASE + (sectorNum << gFlash->sector.shift);
    funcSrc = (u16 *)((intptr_t)VerifyEraseSector_Core ^ 1);
    funcDest = VerifyEraseSector_Core_Buffer;

    i = ((intptr_t)VerifyEraseSector - (intptr_t)VerifyEraseSector_Core);

    while (i != 0) {
        *funcDest++ = *funcSrc++;
        i -= 2;
    }

    tryNum = 0;
    while ((result = EraseFlashSector_LE(sectorNum))
           || (result = VerifyEraseSector(dest, (u8 *)((intptr_t)&VerifyEraseSector_Core_Buffer + 1)))) {
        tryNum++;
        if (tryNum == 0x51) {
            return result;
        }
    }

    erasesToTry = 1;
    if (tryNum != 0) {
        erasesToTry = 6;
    }

    for (j = 1; j <= erasesToTry; j++) {
        EraseFlashSector_LE(sectorNum);
    }

    SetReadFlash1(VerifyEraseSector_Core_Buffer);

    REG_WAITCNT = (REG_WAITCNT & ~WAITCNT_SRAM_MASK) | gFlash->wait[0];
    gFlashNumRemainingBytes = gFlash->sector.size;
    while (gFlashNumRemainingBytes && (result = ProgramByte(src, dest), result == 0)) {
        gFlashNumRemainingBytes--;
        src++, dest++;
    }
    REG_WAITCNT = (REG_WAITCNT & ~WAITCNT_SRAM_MASK) | 3;
    return result;
}

static u32 VerifyEraseSector_Core(u8 *dest)
{
    u32 sectorNum;
    u8 src;

    for (sectorNum = gFlash->sector.size; sectorNum != 0; sectorNum--) {
        src = *dest++;

        if (src != 0xff) {
            break;
        }
    }
    return sectorNum;
}

static u16 VerifyEraseSector(u8 *dest, u8 *src)
{
    u32 result;
    // call VerifyEraseSector_Core
    result = ((u32(*)(u8 *))((intptr_t)src))(dest);

    if (result != 0) {
        return 0x8004;
    }

    return 0;
}
