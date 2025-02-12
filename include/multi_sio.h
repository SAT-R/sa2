#ifndef GUARD_MULTI_SIO_H
#define GUARD_MULTI_SIO_H

#include "global.h"

// Optimize the following settings based on the software
// specifications

#define MULTI_SIO_BLOCK_SIZE 20 // Communication Data Block Size (Max. 24 Bytes)

#define MULTI_SIO_PLAYERS_MAX 4 // Maximum Number of Players

#define MULTI_SIO_SYNC_DATA 0xfefe // Synchronized Data (0x0000/0xfffa~0xffff prohibited)

#if PLATFORM_GBA
// Comment out if no space in CPU internal Work RAM
#define MULTI_SIO_DI_FUNC_FAST // SIO Interrupt Prohibit Function High
                               // Speed Flag (CPU Internal RAM
                               // Execution)
#endif

// Update if maximum delay for communication interrupt is larger than
// following.
#define MULTI_SIO_INTR_DELAY_MAX 2000 // Communication Interrupt Allowed Delay Clocks

#ifdef MULTI_SIO_DI_FUNC_FAST
#define MULTI_SIO_INTR_CLOCK_MAX 400 // Communication Interrupt Processing Maximum Clocks
#else
#define MULTI_SIO_INTR_CLOCK_MAX 1000
#endif

#define MULTI_SIO_1P_SEND_CLOCKS 3000 // Communication Time for 1 unit

#if MULTI_SIO_PLAYERS_MAX == 4
#define MULTI_SIO_START_BIT_WAIT 0 // Start Bit Wait Time
#else
#define MULTI_SIO_START_BIT_WAIT 512
#endif

// During development set NDEBUG to undefined and value below to 0,
// define with last check and confirm operation with changed to 600.
// (Even if increase setting the communication interval increases, but
//  processing doesn't slow).
//#define NDEBUG                              // Can define with
// Makefile (MakefileDemo)
#ifdef NDEBUG
#define MULTI_SIO_INTR_MARGIN 600 // Communication Interrupt Error Guarantee Value
#else
#define MULTI_SIO_INTR_MARGIN 0
#endif

#define MULTI_SIO_BAUD_RATE    115200 // Baud Rate
#define MULTI_SIO_BAUD_RATE_NO SIO_115200_BPS // Baud Rate No.

#define MULTI_SIO_TIMER_NO        3 // Timer No.
#define MULTI_SIO_TIMER_INTR_FLAG (INTR_FLAG_TIMER0 << MULTI_SIO_TIMER_NO)

#define REG_MULTI_SIO_TIMER   (*(vu32 *)(REG_ADDR_TMCNT + (MULTI_SIO_TIMER_NO * 4)))
#define REG_MULTI_SIO_TIMER_L (*(vu16 *)(REG_ADDR_TMCNT_L + (MULTI_SIO_TIMER_NO * 4)))
#define REG_MULTI_SIO_TIMER_H (*(vu16 *)(REG_ADDR_TMCNT_H + (MULTI_SIO_TIMER_NO * 4)))
// Timer Register

// Timer count number is calculated from communication data block
// size.
#define MULTI_SIO_TIMER_COUNT_TMP (SYSTEM_CLOCK / 60 / ((2 + 4 + MULTI_SIO_BLOCK_SIZE + 6) / (16 / 8)))
// Timer Count Temporary Value
#define MULTI_SIO_TIMER_COUNT_MIN                                                                                                          \
    (MULTI_SIO_1P_SEND_CLOCKS * MULTI_SIO_PLAYERS_MAX + MULTI_SIO_START_BIT_WAIT + MULTI_SIO_INTR_MARGIN + MULTI_SIO_INTR_DELAY_MAX        \
     + MULTI_SIO_INTR_CLOCK_MAX)
// Timer Count Minimum Value
#define MULTI_SIO_TIMER_COUNT_MAX 0x10000 // Timer Count Maximum Value
#define MULTI_SIO_TIMER_COUNT     (MULTI_SIO_TIMER_COUNT_MAX - MULTI_SIO_TIMER_COUNT_TMP)
// Timer Count
// Timer Count Setting Error
#if MULTI_SIO_TIMER_COUNT_TMP < MULTI_SIO_TIMER_COUNT_MIN
#error MULTI_SIO_TIMER_COUNT is too short,
#error because MULTI_SIO_BLOCK_SIZE or MULTI_SIO_INTR_DELAY_MAX is too large.
#elif MULTI_SIO_TIMER_COUNT_TMP > MULTI_SIO_TIMER_COUNT_MAX
#error MULTI_SIO_TIMER_COUNT is too long.
#endif

// Multi-play Communication Packet Structure
struct MultiSioPacket {
    u8 frameCounter; // Frame Counter
    u8 recvErrorFlags : 4; // Receive Error Flag
    u8 loadRequest : 1; // Load Request
    u8 downloadSuccessFlag : 1; // Download Success Flag
    u8 loadSuccessFlag : 1; // Load Success
    u8 reserved_0 : 1; // Reserved
    u16 checkSum; // Checksum
    u16 data[MULTI_SIO_BLOCK_SIZE / 2]; // Communication Data
    u16 overrunCatch[2]; // Overrun Protect Area
};

// Multi-play Communication Work Area Structure
struct MultiSioArea {
    u8 type; // Connection (Master/Slave)
    u8 state; // Communication Function State
    u8 connectedFlags; // Connection History Flag
    u8 recvSuccessFlags; // Receive Success Flag

    u8 syncRecvFlag[4]; // Receive Confirmation Flag

    u8 downloadSuccessFlags : 4; // Download Success Flag
    u8 loadEnable : 1; // Enable Load
    u8 loadRequest : 1; // Load Request
    u8 loadSuccessFlag : 1; // Load Success
    u8 startFlag : 1; // Communication Start Flag

    u8 hardError; // Hard error
    u8 recvFlagsAvailableCounter; // Receiving success flag validation
                                  // counter

    u8 sendFrameCounter; // Send Frame Counter
    u8 recvFrameCounter[4][2]; // Receive Frame Counter

    s32 sendBufCounter; // Send Buffer Counter
    s32 recvBufCounter[4]; // Receive Buffer Counter

    u16 *nextSendBufp; // Send Buffer Pointer
    u16 *currentSendBufp;
    u16 *currentRecvBufp[4]; // Receive Buffer Pointer
    u16 *lastRecvBufp[4];
    u16 *recvCheckBufp[4];

    struct MultiSioPacket sendBuf[2]; // Send Buffer (Double Buffer)
    struct MultiSioPacket recvBuf[MULTI_SIO_PLAYERS_MAX][3];
    // Receive Buffer (Triple Buffer)
};

extern u32 gMultiSioRecvFuncBuf[0x40 / 4]; // Receive Data/Check Buffer Change Routine
                                           // RAM Execution Buffer
extern u32 gMultiSioIntrFuncBuf[0x120 / 4]; // Interrupt Routine RAM Execution Buffer

extern struct MultiSioArea gMultiSioArea; // Multi-play Communication Work Area

/*------------------------------------------------------------------*/
/*                      Multi-play Communication Initialization     */
/*------------------------------------------------------------------*/

extern void MultiSioInit(u32 connectedFlags);

//* Set serial communication mode to multi-play mode.
//* Initialize register and buffer.
//* Arguments:
//    u32 connectedFlags    Set appropriate flag if a unit recognized
//    as connected

/*------------------------------------------------------------------*/
/*                      Start Multi-play Communication              */
/*------------------------------------------------------------------*/

void MultiSioStart(void);

//* If following master recognition set flag to start send.
//* If slave or prior to master recognition do nothing.

/*------------------------------------------------------------------*/
/*                      Stop Multi-play Communication               */
/*------------------------------------------------------------------*/

void MultiSioStop(void);

//* Stop Communication

/*------------------------------------------------------------------*/
/*                      Multi-play Communication Main               */
/*------------------------------------------------------------------*/

extern u32 MultiSioMain(void *sendp, void *recvp, u32 loadRequest);

//* First determine if master or slave. If master recognized,
// initialize
//  timer.
//* Call MultiSioSendDataSet() and set send data.
//* Call MultiSioRecvDataCheck() and check if normal receive done,
//  and copy receive data to Recvp.
//
//* Set so called with as close a timing as possible within 1 frame.
//* Safer not to send data that matches flag data (SIO_SYNC_DATA)
// prior
//  to connection determination.
//
//* Arguments:
//    void *sendp           User Send Buffer Pointer
//    void *recvp           User Receive Buffer Pointer
//    u32  loadRequest      Load Request

//* Return Value:

#define MULTI_SIO_RECV_ID_MASK      0x000f // Receive success flag
#define MULTI_SIO_CONNECTED_ID_MASK 0x0f00 // Connection history flag

#define MULTI_SIO_RECV_ID_SHIFT      0
#define MULTI_SIO_CONNECTED_ID_SHIFT 8

#define MULTI_SIO_RECV_ID0             0x0001 // Receive success flag Master
#define MULTI_SIO_RECV_ID1             0x0002 // Slave 1
#define MULTI_SIO_RECV_ID2             0x0004 // Slave 2
#define MULTI_SIO_RECV_ID3             0x0008 // Slave 3
#define MULTI_SIO_LD_ENABLE            0x0010 // Enable load
#define MULTI_SIO_LD_REQUEST           0x0020 // Load request
#define MULTI_SIO_LD_SUCCESS           0x0040 // Load success
#define MULTI_SIO_TYPE                 0x0080 // Connection (Master/Slave)
#define MULTI_SIO_PARENT               0x0080 // Connect Master
#define MULTI_SIO_CHILD                0x0000 // Connect Slave
#define MULTI_SIO_CONNECTED_ID0        0x0100 // Connection history flag Master
#define MULTI_SIO_CONNECTED_ID1        0x0200 // Slave 1
#define MULTI_SIO_CONNECTED_ID2        0x0400 // Slave 2
#define MULTI_SIO_CONNECTED_ID3        0x0800 // Slave 3
#define MULTI_SIO_HARD_ERROR           0x1000 // Hard error
#define MULTI_SIO_ID_OVER_ERROR        0x2000 // ID over error
#define MULTI_SIO_RECV_FLAGS_AVAILABLE 0x8000 // Validate receive success flag

#define MULTI_SIO_RECV_ID(x)      (0x0001 << (x))
#define MULTI_SIO_CONNECTED_ID(x) (0x0100 << (x))

#define MULTI_SIO_ALL_CONNECTED                                                                                                            \
    (MULTI_SIO_CONNECTED_ID(0) | MULTI_SIO_CONNECTED_ID(1) | MULTI_SIO_CONNECTED_ID(2) | MULTI_SIO_CONNECTED_ID(3))

// Return Value Structure
struct MultiSioReturn {
    u32 recvSuccessFlags : 4; // Receive success flag
    u32 loadEnable : 1; // Enable load
    u32 loadRequest : 1; // Load request
    u32 loadSuccessFlag : 1; // Load success
    u32 type : 1; // Connection (master/slave)
    u32 connectedFlags : 4; // Connection history flag
    u32 hardError : 1; // Hard error
    u32 idOverError : 1; // ID over error
    u32 reserved : 1; // Reservation
    u32 recvFlagsAvailable : 1; // Validate receive success flag
};

/*------------------------------------------------------------------*/
/*                      Multi-play Communication Interrupt          */
/*------------------------------------------------------------------*/

extern void MultiSioIntr(void);

//* During communication interrupt, store receive data from each unit
//  in each receive buffer and set the send buffer data to the
//  register.
//* If master, reset timer and restart send.
//
//* Program so slave is called with communication interrupt and master
//  is called with timer interrupt.
//* Adjust setting so 1 packet (Except for OverRunCatch[]) can be
//  transfered with 1 frame.

/*------------------------------------------------------------------*/
/*                      Set Send Data                               */
/*------------------------------------------------------------------*/

extern void MultiSioSendDataSet(void *sendp, u32 loadReq);

//* Set the user send buffer data to send buffer.
//
//* Called from MultiSioMain().
//* Not necessary to call directly.
//
//* Arguments:
//    void *sendp  User Send Buffer Pointer
//    u32  loadReq Load Request

/*------------------------------------------------------------------*/
/*                      Check Receive Data                          */
/*------------------------------------------------------------------*/

extern u32 MultiSioRecvDataCheck(void *recvp);

//* Check if receive done normally. If normal, copy the receive data
//  to the user receive buffer.
//
//* Called from MultiSioMain().
//* Do not need to call directly.
//
//* Arguments:
//    void *recvp  User Receive Buffer Pointer

#endif // GUARD_MULTI_SIO_H
