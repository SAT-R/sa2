#include "global.h"
#include "gba/flash_internal.h"

struct FlashSetupInfo * const gSetup512KInfos[];

u16 IdentifyFlash512K(void)
{
    u16 result;
    u16 flashId;
    const struct FlashSetupInfo * const *setupInfo;

    REG_WAITCNT = (REG_WAITCNT & ~WAITCNT_SRAM_MASK) | WAITCNT_SRAM_8;

    flashId = ReadFlashId();

    setupInfo = gSetup512KInfos;
    result = 1;

    for (;;)
    {
        if ((*setupInfo)->type.ids.separate.makerId == 0)
            break;

        if (flashId == (*setupInfo)->type.ids.joined)
        {
            result = 0;
            break;
        }

        setupInfo++;
    }

    ProgramFlashSector = (*setupInfo)->programFlashSector;
    EraseFlashChip = (*setupInfo)->eraseFlashChip;
    EraseFlashSector = (*setupInfo)->eraseFlashSector;
    WaitForFlashWrite = (*setupInfo)->WaitForFlashWrite;
    gFlashMaxTime = (*setupInfo)->maxTime;
    gFlash = &(*setupInfo)->type;

    return result;
}

u16 WaitForFlashWrite512K_Common(u8 phase, u8 *addr, u8 lastData)
{
    u16 result = 0;
    u8 status;

    StartFlashTimer(phase);

    while ((status = PollFlashStatus(addr)) != lastData)
    {
        if (gFlashTimeoutFlag)
        {
            if (PollFlashStatus(addr) == lastData)
                break;

            if (gFlash->ids.separate.makerId == 0xc2)
                FLASH_WRITE(0x5555, 0xF0);

            result = phase | 0xC000u;
            break;
        }
    }

    StopFlashTimer();

    return result;
}


