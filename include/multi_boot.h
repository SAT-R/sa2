#ifndef GUARD_MULTI_BOOT_H
#define GUARD_MULTI_BOOT_H

#include "global.h"

/* From MASTER_INFO to MASTER_START_DL are upper values.
 * From MASTER_REQUEST_CRC to MASTER_VERIFY_CRC are lower values (Upper=0)
 */
#define MULTIBOOT_MASTER_INFO            0x62
#define MULTIBOOT_CLIENT_INFO            0x72
#define MULTIBOOT_MASTER_START_PROBE     0x61
#define MULTIBOOT_MASTER_REQUEST_DLREADY 0x63
#define MULTIBOOT_CLIENT_DLREADY         0x73
#define MULTIBOOT_MASTER_START_DL        0x64
#define MULTIBOOT_MASTER_REQUEST_CRC     0x65
#define MULTIBOOT_CLIENT_CALC_CRC        0x74
#define MULTIBOOT_CLIENT_CRCREADY        0x75
#define MULTIBOOT_MASTER_VERIFY_CRC      0x66


/*------------------------------------------------------------------*/
/*                   Initialize Multi-play Boot                     */
/*------------------------------------------------------------------*/

extern void MultiBootInit(struct MultiBootParam *mp);

//* Sets serial communication mode as multi-play mode.
//* Basically, SIO_INTR_FLAG of IE is cleared, however it is acceptable to use SIO interrupt.
//
//* does not set mp -> masterp.
//  Make sure to set up before calling this initialization function.

/*------------------------------------------------------------------*/
/*                      Multi-play Boot Main                        */
/*------------------------------------------------------------------*/

extern s32 MultiBootMain(struct MultiBootParam *mp);

//* Basically, call it once per frame.
//  However, if there is a wait long enough, it is acceptable to call it multiple times per frame.
//  The safe length of wait time depends on the application.
//  (It is necessary to make the wait longer than the time it takes to process the interrupts of long period of time,
//  including V-Blank interrupts.)
//
//* Returns 0 in normal completion.
//
//* Returns 0 when transfer ends (successfully)  and a value of MultiBootCheckComplete() other than 0.
//
//* Once it is in the transfer end status, it simply returns 0 immediately.
//  In order to cancel this status, call MultiBootInit().
//  It is acceptable to call MultiBootStartProbe() or MultiBootStartMaster(), however, they are internally 
//  calling MultiBootInit().

/*------------------------------------------------------------------*/
/*                    Starts Client Recognition                     */
/*------------------------------------------------------------------*/

extern void MultiBootStartProbe(struct MultiBootParam *mp);

//  After calling this, the client's recognition processing is done with        //  MultiBootMain().
//  Call after verifying mp -> probe_count is 0.

/*------------------------------------------------------------------*/
/*                   Starts Transfer from Master Server             */
/*------------------------------------------------------------------*/

extern void MultiBootStartMaster(struct MultiBootParam *mp, const u8 *srcp, s32 length, u8 palette_color, s8 palette_speed);

//* Among the units connected by multi-play communication cable, only those units with game pak inserted 
//  can become master server.
//
//  srcp            Pointer for the program that you want to boot 
//                  (requires 4-byte alignment)
//                  For clients, it is downloaded immediately after the header.
//  length          Transfer byte count of program.
//                  MULTIBOOT_SEND_SIZE_MIN (0x100) bytes or more and
//                  MULTIBOOT_SEND_SIZE_MAX (0x40000) bytes or less.
//  "palette_color" and "palette_speed" are palette flash parameters of client while loading.
//  palette_color uses 0 to 6 to specify the basic palettes (7 types)
//  With "palette_speed", it flashes in reversal order from -4 to -1 (-4 being the fastest) and it flashes in normal
//  from +1 to +4 (+4 being the fastest)
//  Palette is fixed (no flash) at 0.
//  Do not specify any values other than listed above.

/*------------------------------------------------------------------*/
/*                       Check Transfer Completion                  */
/*------------------------------------------------------------------*/

extern s32 MultiBootCheckComplete(struct MultiBootParam *mp);

//* Check if transfer has completed.
//
//* Returns a value other than 0 if transfer has completed (successfully).
//  Returns 0 if it is still recognizing, has not started transfer, or transfer has failed.
//
//* Calling any one of MultiBootInit(), MultiBootStartProbe() or MultiBootStartMaster()
//  cancels the transfer completion status.


/* magic value below aren't documented in SDK header */

/* probe_count */

#define MULTIBOOT_REQ_PREP_REC                  0x0
#define MULTIBOOT_REQ_START_REC                 0x1
#define MULTIBOOT_REQ_PROC_REC                  0x2

#define MULTIBOOT_REC_COMPLETE                  0xc4

#define MULTIBOOT_REQ_TX_CHECK                  0xd0
#define MULTIBOOT_REQ_TX_START                  0xd1

#define MULTIBOOT_REQ_HANDSHAKE_START           0xe0
#define MULTIBOOT_REQ_HANDSHAKE_HEADER_CHECK_1  0xe1
#define MULTIBOOT_REQ_HANDSHAKE_HEADER_CHECK_2  0xe2
#define MULTIBOOT_REQ_HANDSHAKE_HEADER_CHECK_3  0xe3
#define MULTIBOOT_REQ_HANDSHAKE_HEADER_CHECK_4  0xe4
#define MULTIBOOT_REQ_HANDSHAKE_HEADER_CHECK_5  0xe5
#define MULTIBOOT_REQ_HANDSHAKE_HEADER_CHECK_6  0xe6
#define MULTIBOOT_REQ_HANDSHAKE_HEADER_CHECK_7  0xe7
#define MULTIBOOT_REQ_HANDSHAKE_HEADER_CHECK_8  0xe8
#define MULTIBOOT_HANDSHAKE_SUCCESS             0xe9

#endif // GUARD_MULTI_BOOT_H
