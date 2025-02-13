#include "global.h"
#include "multi_sio.h"
#include "sio32_multi_load.h"

#if PORTABLE
#include "platform/platform.h"
#endif

static const char sMultiSioLibVer[] = "MultiSio4Sio32Load010528";

#ifdef MULTI_SIO_DI_FUNC_FAST
u32 gMultiSioIntrFuncBuf[0x120 / 4] = {}; // Interrupt Routine RAM Execution Buffer
#endif

struct MultiSioArea gMultiSioArea = {};

#if (GAME <= GAME_SA2)
UNUSED u32 gUnusedMultiSioSpace[2] = {};
#endif

#ifdef MULTI_SIO_DI_FUNC_FAST
u32 gMultiSioRecvFuncBuf[0x40 / 4] = {}; // Receive Data/Check Buffer Change Routine RAM Execution Buffer
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
    CpuFill32(0, &gMultiSioArea,
              sizeof(struct MultiSioArea)); // Clear Multi-play Communication Work Area
#ifdef MULTI_SIO_DI_FUNC_FAST // Copy Function
    CpuCopy32(MultiSioRecvBufChange, gMultiSioRecvFuncBuf, sizeof(gMultiSioRecvFuncBuf));
    CpuCopy32(MultiSioIntr, gMultiSioIntrFuncBuf, sizeof(gMultiSioIntrFuncBuf));
#endif
    gMultiSioArea.connectedFlags = connectedFlags;
    gMultiSioArea.sendBufCounter = 13;
    gMultiSioArea.nextSendBufp = (u16 *)&gMultiSioArea.sendBuf[0]; // Set Send Buffer Pointer
    gMultiSioArea.currentSendBufp = (u16 *)&gMultiSioArea.sendBuf[1];
    for (i = 0; i < 4; ++i) { // Set Receive Buffer Pointer
        gMultiSioArea.currentRecvBufp[i] = (u16 *)&gMultiSioArea.recvBuf[i][0];
        gMultiSioArea.lastRecvBufp[i] = (u16 *)&gMultiSioArea.recvBuf[i][1];
        gMultiSioArea.recvCheckBufp[i] = (u16 *)&gMultiSioArea.recvBuf[i][2];
    }
    REG_IME = 0;
    REG_IE |= INTR_FLAG_SERIAL; // Enable SIO Interrupt
    REG_IME = 1;
}

/*------------------------------------------------------------------*/
/*                      Multi-play Communication Main               */
/*------------------------------------------------------------------*/

u32 MultiSioMain(void *sendp, void *recvp, u32 loadRequest)
{
    struct SioMultiCnt sioCntBak;
    UNUSED s32 i, ii; // declared in SDK

    sioCntBak = *(struct SioMultiCnt *)REG_ADDR_SIOCNT; // Check Connection
    switch (gMultiSioArea.state) {
        case 0:
            if (!sioCntBak.id) {
                if (!sioCntBak.sd || sioCntBak.enable)
                    break;
                if (!sioCntBak.si && gMultiSioArea.sendBufCounter == 13) {
                    REG_IME = 0;
                    REG_IE &= ~INTR_FLAG_SERIAL; // Disable SIO Interrupt
                    REG_IE |= MULTI_SIO_TIMER_INTR_FLAG; // Enable Timer Interrupt
                    REG_IME = 1;
                    ((struct SioMultiCnt *)REG_ADDR_SIOCNT)->ifEnable = 0; // Reset SIO-IFE
                    REG_IF = INTR_FLAG_SERIAL | MULTI_SIO_TIMER_INTR_FLAG;
                    REG_MULTI_SIO_TIMER = MULTI_SIO_TIMER_COUNT; // Timer Initialization
                    gMultiSioArea.type = SIO_MULTI_PARENT;
                    ((struct SioMultiCnt *)REG_ADDR_SIOCNT)->enable = 1; // Start Send
                }
            }
            gMultiSioArea.state = 1;
            // fallthrough
        case 1:
            MultiSioRecvDataCheck(recvp); // Check Receive Data
            MultiSioSendDataSet(sendp, loadRequest); // Set Send Data
            break;
    }
    ++gMultiSioArea.sendFrameCounter;
    return gMultiSioArea.recvSuccessFlags | gMultiSioArea.loadEnable << 4 | gMultiSioArea.loadRequest << 5
        | gMultiSioArea.loadSuccessFlag << 6 | (gMultiSioArea.type == SIO_MULTI_PARENT) << 7 | gMultiSioArea.connectedFlags << 8
        | (gMultiSioArea.hardError != 0) << 12 | (sioCntBak.id >= MULTI_SIO_PLAYERS_MAX) << 13;
}

/*------------------------------------------------------------------*/
/*                      Set Send Data                               */
/*------------------------------------------------------------------*/

void MultiSioSendDataSet(void *sendp, u32 loadRequest)
{
    s32 checkSum = 0;
    s32 i;

    ((struct MultiSioPacket *)gMultiSioArea.nextSendBufp)->loadRequest = loadRequest;
    ((struct MultiSioPacket *)gMultiSioArea.nextSendBufp)->downloadSuccessFlag = gSio32MultiLoadArea.downloadSuccessFlag;
    ((struct MultiSioPacket *)gMultiSioArea.nextSendBufp)->loadSuccessFlag = gMultiSioArea.loadSuccessFlag;
    ((struct MultiSioPacket *)gMultiSioArea.nextSendBufp)->frameCounter = (u8)gMultiSioArea.sendFrameCounter;
    ((struct MultiSioPacket *)gMultiSioArea.nextSendBufp)->recvErrorFlags = gMultiSioArea.connectedFlags ^ gMultiSioArea.recvSuccessFlags;
    ((struct MultiSioPacket *)gMultiSioArea.nextSendBufp)->checkSum = 0;
    CpuCopy32(sendp, &gMultiSioArea.nextSendBufp[2],
              MULTI_SIO_BLOCK_SIZE); // Set Send Data
    for (i = 0; i < sizeof(struct MultiSioPacket) / 2 - 2; ++i) // Calculate Checksum Send Data
        checkSum += gMultiSioArea.nextSendBufp[i];
    ((struct MultiSioPacket *)gMultiSioArea.nextSendBufp)->checkSum = ~checkSum;
    if (gMultiSioArea.type)
        REG_MULTI_SIO_TIMER_H = 0; // Stop Timer
    gMultiSioArea.sendBufCounter = -1;
    if (gMultiSioArea.type && gMultiSioArea.startFlag)
        REG_MULTI_SIO_TIMER_H = TIMER_1CLK | TIMER_INTR_ENABLE | TIMER_ENABLE; // Start Timer
}

/*------------------------------------------------------------------*/
/*                     Check Receive Data                           */
/*------------------------------------------------------------------*/

u32 MultiSioRecvDataCheck(void *recvp)
{
    u32 (*multiSioRecvBufChangeOnRam)(void) = (u32(*)(void))gMultiSioRecvFuncBuf;
    s32 checkSum;
    vu32 UNUSED recvCheck = 0;
    u8 syncRecvFlagBak[4];
    s32 i, ii;

#ifdef MULTI_SIO_DI_FUNC_FAST // Update Receive Data/Check Buffer
    *(u32 *)syncRecvFlagBak = multiSioRecvBufChangeOnRam();
#else
    REG_IME = 0; // Disable Interrupt (Approx. 80 Clocks)
    for (i = 0; i < 4; ++i) {
        u16 *bufpTmp = gMultiSioArea.recvCheckBufp[i]; // Update Receive Data/Check Buffer
        gMultiSioArea.recvCheckBufp[i] = gMultiSioArea.lastRecvBufp[i];
        gMultiSioArea.lastRecvBufp[i] = bufpTmp;
    }
    REG_IME = 1; // Enable Interrupt
#endif
    gMultiSioArea.recvSuccessFlags = 0;
    for (i = 0; i < 4; ++i) {
        checkSum = 0; // Calculate Checksum Receive Data
        for (ii = 0; ii < sizeof(struct MultiSioPacket) / 2 - 2; ++ii)
            checkSum += gMultiSioArea.recvCheckBufp[i][ii];
        if (syncRecvFlagBak[i]) // Receive Success Confirmation
            if ((s16)checkSum == -1) {
                gMultiSioArea.recvSuccessFlags |= 1 << i;
                gMultiSioArea.downloadSuccessFlags |= ((struct MultiSioPacket *)gMultiSioArea.recvCheckBufp[i])->downloadSuccessFlag << i;
                CpuCopy32(&((u8 *)gMultiSioArea.recvCheckBufp[i])[4], &((u8 *)recvp)[i * MULTI_SIO_BLOCK_SIZE], MULTI_SIO_BLOCK_SIZE);
            }
        CpuFill32(0, &((u8 *)gMultiSioArea.recvCheckBufp[i])[4], MULTI_SIO_BLOCK_SIZE);
    }
    gMultiSioArea.connectedFlags |= gMultiSioArea.recvSuccessFlags; // Set Connect Complete Flag
    if (gMultiSioArea.recvSuccessFlags & 1) {

        if (gMultiSioArea.type == SIO_MULTI_PARENT) {
            if (gMultiSioArea.recvSuccessFlags & 0x3) // Enable Load
                if (gMultiSioArea.recvSuccessFlags == gMultiSioArea.connectedFlags)
                    gMultiSioArea.loadEnable = 1;
            if ((gMultiSioArea.downloadSuccessFlags & 0xe) == (gMultiSioArea.connectedFlags & 0xe)) // Check Load
                gMultiSioArea.loadSuccessFlag = 1;
        } else
            gMultiSioArea.loadSuccessFlag |= ((struct MultiSioPacket *)gMultiSioArea.recvCheckBufp[0])->loadSuccessFlag;
        gMultiSioArea.loadRequest |= ((struct MultiSioPacket *)gMultiSioArea.recvCheckBufp[0])->loadRequest; // Request Load
    }
    return gMultiSioArea.recvSuccessFlags;
}

/*------------------------------------------------------------------*/
/*                      Start Multi-play Communication              */
/*------------------------------------------------------------------*/

void MultiSioStart(void)
{
    if (gMultiSioArea.type)
        gMultiSioArea.startFlag = 1; // Set Start Flag
}

/*------------------------------------------------------------------*/
/*                      Stop Multi-play Communication               */
/*------------------------------------------------------------------*/

void MultiSioStop(void)
{
    REG_IME = 0;
    REG_IE &= ~(INTR_FLAG_SERIAL | MULTI_SIO_TIMER_INTR_FLAG); // Disable SIO & Timer Interrupt
    REG_IME = 1;
    REG_SIOCNT = SIO_MULTI_MODE | MULTI_SIO_BAUD_RATE_NO; // Stop SIO
    REG_MULTI_SIO_TIMER = MULTI_SIO_TIMER_COUNT; // Stop Timer
    REG_IF = INTR_FLAG_SERIAL | MULTI_SIO_TIMER_INTR_FLAG; // Reset IF
    gMultiSioArea.startFlag = 0; // Reset Start Flag
}

/*==================================================================*/
/*                  Multi-play Communication Interrupt Routine      */
/*==================================================================*/

#ifndef MULTI_SIO_DI_FUNC_FAST
void MultiSioIntr(void)
{
    u16 recvTmp[4];
    u16 *bufpTmp;
    s32 i;
    UNUSED s32 ii; // declared in SDK

    // Save Receive Data
    *(u64 *)recvTmp = *(u64 *)REG_ADDR_SIOMLT_RECV;
    // Detect hard error
    gMultiSioArea.hardError = ((struct SioMultiCnt *)REG_ADDR_SIOCNT)->error;
    // Send Data Processing
    if (gMultiSioArea.sendBufCounter == -1) { // Set Synchronized Data
        ((struct SioMultiCnt *)REG_ADDR_SIOCNT)->data = MULTI_SIO_SYNC_DATA;
        bufpTmp = gMultiSioArea.currentSendBufp; // Change Send Buffer
        gMultiSioArea.currentSendBufp = gMultiSioArea.nextSendBufp;
        gMultiSioArea.nextSendBufp = bufpTmp;
    } else if (gMultiSioArea.sendBufCounter >= 0) { // Set Send Data
        ((struct SioMultiCnt *)REG_ADDR_SIOCNT)->data = gMultiSioArea.currentSendBufp[gMultiSioArea.sendBufCounter];
#if PORTABLE
        Platform_SioSend();
#endif
    }
    if (gMultiSioArea.sendBufCounter < (s32)(sizeof(struct MultiSioPacket) / 2 - 1))
        ++gMultiSioArea.sendBufCounter;
    // Receive Data Processing (Max. Approx. 350 Clocks/Included in wait period)
    for (i = 0; i < 4; ++i) {
        if (recvTmp[i] == MULTI_SIO_SYNC_DATA && gMultiSioArea.recvBufCounter[i] > (s32)(sizeof(struct MultiSioPacket) / 2 - 3)) {
            gMultiSioArea.recvBufCounter[i] = -1;
        } else {
            gMultiSioArea.currentRecvBufp[i][gMultiSioArea.recvBufCounter[i]] = recvTmp[i];
            // Store Receive Data
            if (gMultiSioArea.recvBufCounter[i] == (s32)(sizeof(struct MultiSioPacket) / 2 - 3)) {
                bufpTmp = gMultiSioArea.lastRecvBufp[i]; // Change Receive Buffer
                gMultiSioArea.lastRecvBufp[i] = gMultiSioArea.currentRecvBufp[i];
                gMultiSioArea.currentRecvBufp[i] = bufpTmp;
                gMultiSioArea.syncRecvFlag[i] = 1; // Receive Complete Flag
            }
        }
        if (gMultiSioArea.recvBufCounter[i] < (s32)(sizeof(struct MultiSioPacket) / 2 - 1))
            ++gMultiSioArea.recvBufCounter[i];
    }
    // Start Master Send
    if (gMultiSioArea.type == SIO_MULTI_PARENT) {
        REG_MULTI_SIO_TIMER_H = 0; // Stop Timer
        REG_SIOCNT |= SIO_ENABLE; // Restart Send
        REG_MULTI_SIO_TIMER_H = TIMER_1CLK | TIMER_INTR_ENABLE | TIMER_ENABLE; // Restart Timer
    }
}
#endif
