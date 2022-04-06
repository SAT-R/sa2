#include "global.h"
#include "multi_sio.h"

static const char sMultiSioLibVer[] = "MultiSio4Sio32Load010528";

#ifdef MULTI_SIO_DI_FUNC_FAST
// u32 gMultiSioRecvFuncBuf[0x40 / 4];  // Receive Data/Check Buffer Change Routine RAM Execution Buffer
// u32 gMultiSioIntrFuncBuf[0x180 / 4]; // Interrupt Routine RAM Execution Buffer
#endif

/*------------------------------------------------------------------*/
/*                      Multi-play Communication Initialization     */
/*------------------------------------------------------------------*/
extern u32 MultiSioRecvBufChange(void);

void MultiSioInit(u32 connectedFlags)
{
    s32 i;

    REG_IME = 0;
    REG_IE &= ~(INTR_FLAG_SERIAL // Disable SIO & Timer Interrupt 
              | MULTI_SIO_TIMER_INTR_FLAG);
    REG_IME = 1;
    REG_RCNT = ST_R_SIO_MASTER_MODE;
    *(vu32 *)REG_ADDR_SIOCNT = SIO_MULTI_MODE;
    REG_SIOCNT |= SIO_INTR_ENABLE | MULTI_SIO_BAUD_RATE_NO;
    CpuFill32(0, &gMultiSioArea, sizeof(struct MultiSioArea)); // Clear Multi-play Communication Work Area
#ifdef MULTI_SIO_DI_FUNC_FAST // Copy Function
    CpuCopy32(MultiSioRecvBufChange, gMultiSioRecvFuncBuf, sizeof(gMultiSioRecvFuncBuf));
    CpuCopy32(MultiSioIntr,          gMultiSioIntrFuncBuf, sizeof(gMultiSioIntrFuncBuf));
#endif
    gMultiSioArea.connectedFlags  = connectedFlags;
    gMultiSioArea.sendBufCounter  = 13;
    gMultiSioArea.nextSendBufp    = (u16 *)&gMultiSioArea.sendBuf[0]; // Set Send Buffer Pointer
    gMultiSioArea.currentSendBufp = (u16 *)&gMultiSioArea.sendBuf[1];
    for (i = 0; i < 4; ++i)
    { // Set Receive Buffer Pointer
        gMultiSioArea.currentRecvBufp[i] = (u16 *)&gMultiSioArea.recvBuf[i][0];
        gMultiSioArea.lastRecvBufp[i]    = (u16 *)&gMultiSioArea.recvBuf[i][1];
        gMultiSioArea.recvCheckBufp[i]   = (u16 *)&gMultiSioArea.recvBuf[i][2];
    }
    REG_IME = 0;
    REG_IE |= INTR_FLAG_SERIAL; // Enable SIO Interrupt
    REG_IME = 1;
}
