#ifndef GUARD_SIO32_MULTI_LOAD_H
#define GUARD_SIO32_MULTI_LOAD_H

#include "multi_sio.h"

// Optimize the following settings based on the software specifications

#define SIO32ML_BLOCK_SIZE          0x8000  // Communication Data Block Size

// Update if maximum delay for communication interrupt is larger than following.
#define SIO32ML_INTR_DELAY_MAX      1000    // Communication Interrupt Allowed Delay Clocks

#define SIO32ML_INTR_CLOCK_MAX      256     // Communication Interrupt Processing Maximum Clocks

#define SIO32ML_SYNC_DATA           0xfefefefe  // Synchronized Data (0x00000000and 0xffffffff prohibited)

#define SIO32ML_SYSTEM_CLOCK        (16  * 1024 * 1024)// System Clock
#define SIO32ML_SHIFT_CLOCK         (256 * 1024)       // Shift Clock
#define SIO32ML_LINE_CLOCKS         1232               // Line Clocks

// Comment out if no space in CPU internal Work RAM
#ifdef  MULTI_SIO_DI_FUNC_FAST
// #define SIO32ML_DI_FUNC_FAST                // SIO Interrupt Prohibit Function High Speed Flag (CPU Internal RAM Execution)
#endif

#define SIO32ML_TIMER_NO            3       // Timer No.
#define SIO32ML_TIMER_INTR_FLAG     (INTR_FLAG_TIMER0 << SIO32ML_TIMER_NO)
                                            // Timer Interrupt Flag

#define REG_SIO32ML_TIMER    (*(vu32 *)(REG_ADDR_TMCNT + (SIO32ML_TIMER_NO * 4)))
#define REG_SIO32ML_TIMER_L  (*(vu16 *)(REG_ADDR_TMCNT_L + (SIO32ML_TIMER_NO * 4)))
#define REG_SIO32ML_TIMER_H  (*(vu16 *)(REG_ADDR_TMCNT_H + (SIO32ML_TIMER_NO * 4)))
                                            // Timer Register

// Timer count temporary value is calculated from communication data block size.
#define SIO32ML_TIMER_COUNT_TMP     (SIO32ML_SYSTEM_CLOCK / SIO32ML_SHIFT_CLOCK * 32 \
                                    + SIO32ML_INTR_DELAY_MAX + SIO32ML_INTR_CLOCK_MAX)
                                            // Timer Count Temporary Value
#define SIO32ML_TIMER_COUNT_MAX     0x10000 // Timer Count Maximum Value
#define SIO32ML_TIMER_COUNT         ((SIO32ML_TIMER_COUNT_TMP > SIO32ML_TIMER_COUNT_MAX)   \
                                    ? SIO32ML_TIMER_COUNT_MAX - SIO32ML_TIMER_COUNT_MAX    \
                                    : SIO32ML_TIMER_COUNT_MAX - SIO32ML_TIMER_COUNT_TMP)
                                            // Timer Count

// Load timeout frames is calculated from above values.
#define SIO32ML_MODE_WAIT_FRAMES    6       // SIO Mode Switch Wait Frames
#define SIO32ML_LD_TIMEOUT_FRAMES   (((SIO32ML_TIMER_COUNT_MAX - SIO32ML_TIMER_COUNT          \
                                     + SIO32ML_INTR_DELAY_MAX  + SIO32ML_INTR_CLOCK_MAX)      \
                                    * (SIO32ML_BLOCK_SIZE / 4)) / (SIO32ML_LINE_CLOCKS * 228) \
                                    +  SIO32ML_MODE_WAIT_FRAMES + 2)
                                            // Load timeout frames


// 32bit Serial Communication Multi-load Work Area Structure
struct Sio32MultiLoadArea
{
    u8  type;                               // Connection (Master/Slave)
    u8  state;                              // Communication Function State
    u8  frameCounter;                       // Frame Counter
    u8  downloadSuccessFlag;                // Download Success Flag

    u32 *datap;                             // Data Pointer
    s32  dataCounter;                       // Data Counter

    u32 checkSum;                           // Checksum
    u32 checkSumTmp;
    s32 checkSumCounter;                    // Checksum Counter
};

extern struct Sio32MultiLoadArea gSio32MultiLoadArea;           // 32bit Serial Communication Multi-load Work Area

/*------------------------------------------------------------------*/
/*         32bit Serial Communication Multi-load Intialization      */
/*------------------------------------------------------------------*/

extern void Sio32MultiLoadInit(u32 type, void *datap);

//* Initialize register and buffer.
//* To avoid problem with shift clock synchronization set master to 256Kbps
//  32 bit serial communication mode first.
//
//* 2Mbps communication with a cable is not guaranteed so do not set up.
//* Set already connection already determined with multi-play communication
//  to Type.
//* Do not pass VRAM address to Datap during display.
//  May fail with checksum of stored data.
//  Copy to VRAM after storing to work RAM once.
//  After this, possible overwrite program data to work RAM.
//
//* Arguments:
//    u32   type    Connection (Master = Not 0/ Slave = 0)
//    void *datap   Data Pointer (Master = Send Data/ Slave= Receive Buffer)

/*------------------------------------------------------------------*/
/*                  32bit Serial Communication Multi-load Main      */
/*------------------------------------------------------------------*/

extern u32 Sio32MultiLoadMain(u32 *progressCounterp);

//* After 1 frame wait, set the slave to 256Kbps 32bit serial communication
//  mode. Also, until the slave's SIO mode is determined the waits and then
//  communication is started.
//* Slave successively calculates receive data checksum, and checks when
//  receive complete.
//* If receive is not completed at time when should be, end receive forcibly.
//* After communication ends prohibit communication interrupts, and return
//  to multi-play communication mode.
//
//* Arguments:
//    u32 *progressCounterp     Progress Counter Pointer
//                              (Disabled when 0 specified)
//* Return Value:
//    During communication = 0/ End = Not 0

/*------------------------------------------------------------------*/
/* 32bit Serial Communication Multi-load Interrupt Routine          */
/*------------------------------------------------------------------*/

extern void Sio32MultiLoadIntr(void);

//* Master does only send and slave only receive.
//* Master resets timer during send.
//* Slave stores receive data in order to receive buffer during 
//  communication interrupt.
//  Lastly it stores checksum to work area.
//
//* Program so slave is called with communication interrupt and master
//  is called with timer interrupt.
//* Data is passed with pipeline operation so delayed with slave with
//  large ID and then received. Therefore at a minimum need to send 
//  two (8 Bytes) extra times.
//
//* Example:
//  ID      0    1    2    3
//  Data    0 -> 0 -> 0 -> 0
//          1 -> 0 -> 0 -> 0
//          2 -> 1 -> 0 -> 0
//          3 -> 2 -> 1 -> 0
//          4 -> 3 -> 2 -> 1

#endif // GUARD_SIO32_MULTI_LOAD_H
