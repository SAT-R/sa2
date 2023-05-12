#include "sio32_multi_load.h"

#include "global.h"

// static const char sMultiSioLibVer[] = "Sio32MultiLoad010214";

// COMMON
struct Sio32MultiLoadArea gSio32MultiLoadArea; // 32bit serial communication
// multi-load work area

/*------------------------------------------------------------------*/
/*        32bit serial communication multi-load main                */
/*------------------------------------------------------------------*/

u32 Sio32MultiLoadMain(u32 *progressCounterp)
{
    s32 dataCounter, dataCounterBak;
    UNUSED s32 i, ii; // declared in SDK

    switch (gSio32MultiLoadArea.state) {
        case 0:
            if (gSio32MultiLoadArea.type
                || gSio32MultiLoadArea.frameCounter) // Slave SIO Mode switch delay wait
                gSio32MultiLoadArea.state = 1;
            break;
        case 1:
            if (gSio32MultiLoadArea.type == SIO_SCK_IN) {
                if (gSio32MultiLoadArea.frameCounter
                    < SIO32ML_MODE_WAIT_FRAMES) // Master wait
                    break;
            } else // Slave
                REG_SIOCNT = SIO_32BIT_MODE; // Switches to SIO mode
            REG_SIODATA32 = 0; // Clears data registery
            REG_IF = INTR_FLAG_SERIAL | SIO32ML_TIMER_INTR_FLAG; // Resets IF
            if (gSio32MultiLoadArea.type == SIO_SCK_IN) { // Sets Master
                REG_SIOCNT |= SIO_ENABLE; // Starts communication
                REG_SIO32ML_TIMER = SIO32ML_TIMER_COUNT
                    | ((TIMER_1CLK | TIMER_INTR_ENABLE | TIMER_ENABLE)
                       << 16); // Starts timer
                REG_IME = 0;
                REG_IE |= SIO32ML_TIMER_INTR_FLAG; // Enables timer interrupt
                REG_IME = 1;
            } else { // Sets Slave
                REG_SIOCNT |= SIO_INTR_ENABLE | SIO_ENABLE; // Starts communication
                REG_IME = 0;
                REG_IE |= INTR_FLAG_SERIAL; // Enables SIO interrupt
                REG_IME = 1;
            }
            gSio32MultiLoadArea.frameCounter = 0;
            gSio32MultiLoadArea.state = 2;
            break;
        case 2:
            dataCounter = gSio32MultiLoadArea.dataCounter;
            dataCounterBak = dataCounter;
            if (dataCounter > SIO32ML_BLOCK_SIZE / 4)
                dataCounter = SIO32ML_BLOCK_SIZE / 4;
            else if (dataCounter < 0)
                dataCounter = 0;
            if (progressCounterp)
                *progressCounterp = dataCounter; // Set progress counter
            if (gSio32MultiLoadArea.type != SIO_SCK_IN) { // Slave
                while (gSio32MultiLoadArea.checkSumCounter
                       < dataCounter) // Receiving data sum check
                    gSio32MultiLoadArea.checkSumTmp
                        += ((s32 *)gSio32MultiLoadArea
                                .datap)[gSio32MultiLoadArea.checkSumCounter++];
                if (dataCounterBak > SIO32ML_BLOCK_SIZE / 4)
                    if ((gSio32MultiLoadArea.checkSum += gSio32MultiLoadArea.checkSumTmp)
                        == -1)
                        gSio32MultiLoadArea.downloadSuccessFlag = 1; // Succeeds download
            }
            if (dataCounterBak > SIO32ML_BLOCK_SIZE / 4 // Complete communication
                || gSio32MultiLoadArea.frameCounter
                    == 0x8C) // SIO32ML_LD_TIMEOUT_FRAMES in SDK doesn't match
                gSio32MultiLoadArea.state = 3; // Load time out
            break;
        case 3:
            REG_IME = 0;
            REG_IE &= ~(INTR_FLAG_SERIAL
                        | SIO32ML_TIMER_INTR_FLAG); // Disables SIO and timer interrupt
            REG_IME = 1;
            REG_SIOCNT = SIO_32BIT_MODE; // Stops SIO32
            *(vu32 *)REG_ADDR_SIOCNT = SIO_MULTI_MODE; // Switches to SIO mode
            *(vu32 *)REG_ADDR_SIOCNT = SIO_MULTI_MODE | MULTI_SIO_BAUD_RATE_NO;
            *(vu64 *)REG_ADDR_SIODATA32 = 0; // Clears data register
            if (gSio32MultiLoadArea.type) // Master
                REG_SIO32ML_TIMER = 0; // Resets timer
            REG_IF = INTR_FLAG_SERIAL | SIO32ML_TIMER_INTR_FLAG; // Resets IF
            if (!gSio32MultiLoadArea.type)
                return 1; // Slave comes back first
            gSio32MultiLoadArea.frameCounter = 0;
            gSio32MultiLoadArea.state = 4;
            break;
        case 4:
            if (gSio32MultiLoadArea.frameCounter >= 3) // Master comes back later
                return 1;
            break;
    }
    ++gSio32MultiLoadArea.frameCounter;
    return 0;
}

/*==================================================================*/
/*     32bit Serial Communication Multi-load Interrupt Routine      */
/*==================================================================*/

void Sio32MultiLoadIntr(void)
{
    u32 recvTmp;
    u32 *bufpTmp;

    // Saves received data
    recvTmp = REG_SIODATA32;
    // Slave prepares to receive
    if (gSio32MultiLoadArea.type != SIO_SCK_IN)
        REG_SIOCNT |= SIO_ENABLE;
    if (gSio32MultiLoadArea.type == SIO_SCK_IN) {
        REG_SIO32ML_TIMER_H = 0; // Stops timer
        // Process sending data
        if (gSio32MultiLoadArea.dataCounter < 0) // Sets synchronous data
            REG_SIODATA32 = SIO32ML_SYNC_DATA;
        else if (gSio32MultiLoadArea.dataCounter
                 < SIO32ML_BLOCK_SIZE / 4) // Sets sending
                                           // data
            REG_SIODATA32 = gSio32MultiLoadArea.datap[gSio32MultiLoadArea.dataCounter];
        else
            REG_SIODATA32 = gSio32MultiLoadArea.checkSum; // Sets check sum
    } else {
        // Process receiving data
        if (gSio32MultiLoadArea.dataCounter < 0) { // Checks synchronous data
            if (recvTmp != SIO32ML_SYNC_DATA)
                --gSio32MultiLoadArea.dataCounter;
        } else if (gSio32MultiLoadArea.dataCounter < SIO32ML_BLOCK_SIZE / 4) // Saves
                                                                             // receiving
                                                                             // data
            gSio32MultiLoadArea.datap[gSio32MultiLoadArea.dataCounter] = recvTmp;
        else
            gSio32MultiLoadArea.checkSum = recvTmp; // Saves check sum
    }
    if (gSio32MultiLoadArea.dataCounter < SIO32ML_BLOCK_SIZE / 4 + 3) {
        ++gSio32MultiLoadArea.dataCounter;
        // Master starts to sending
        if (gSio32MultiLoadArea.type == SIO_SCK_IN) {
            REG_SIOCNT |= SIO_ENABLE; // Restarts sending
            REG_SIO32ML_TIMER_H
                = TIMER_1CLK | TIMER_INTR_ENABLE | TIMER_ENABLE; // Restarts timer
        }
    }
}

/*------------------------------------------------------------------*/
/*       32bit Serial communication multi-load initialization       */
/*------------------------------------------------------------------*/

void Sio32MultiLoadInit(u32 type, void *datap)
{
    s32 checkSum = 0;
    UNUSED s32 i; // declared in SDK

    REG_IME = 0;
    REG_IE &= ~(INTR_FLAG_SERIAL
                | SIO32ML_TIMER_INTR_FLAG); // Disables SIO and timer interrupt
    REG_IME = 1;
    CpuFill32(0, &gSio32MultiLoadArea,
              sizeof(gSio32MultiLoadArea)); // Clears 32bit serial
                                            // communication work area
#ifdef SIO32ML_DI_FUNC_FAST // Copies function
    CpuCopy32(Sio32MultiLoadIntr, gMultiSioIntrFuncBuf, sizeof(gMultiSioIntrFuncBuf));
#endif
    *(vu32 *)REG_ADDR_SIOCNT
        = SIO_MULTI_MODE | MULTI_SIO_BAUD_RATE_NO; // Stops multi-play communication
    gSio32MultiLoadArea.datap = datap; // Sets data pointer
    gSio32MultiLoadArea.dataCounter = -1;
    if (type) { // Sets Master
        REG_SIO32ML_TIMER = 0; // Resets timer
        gSio32MultiLoadArea.type = SIO_SCK_IN;
        for (i = 0; i < SIO32ML_BLOCK_SIZE / 4; ++i) // Calculates sending data check sum
            checkSum += ((s32 *)datap)[i];
        gSio32MultiLoadArea.checkSum = ~checkSum;
        REG_SIOCNT = SIO_32BIT_MODE; // Switches to SIO mode (preceding code)
        REG_SIOCNT = SIO_32BIT_MODE | SIO_SCK_IN | SIO_IN_SCK_256K;
    }
}
