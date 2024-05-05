#include "multi_boot.h"

#include "global.h"

static s32 MultiBootSend(struct MultiBootParam *mp, u16 data);
static s32 MultiBootHandShake(struct MultiBootParam *mp);
static void MultiBootWaitSendDone(void);

static u16 gMultiBootRequiredData[MULTIBOOT_NCHILD];

#define MULTIBOOT_INIT(mp)                                                              \
    (mp)->client_bit = 0;                                                               \
    (mp)->probe_count = 0;                                                              \
    (mp)->response_bit = 0;                                                             \
    (mp)->check_wait = MULTIBOOT_CONNECTION_CHECK_WAIT;                                 \
    (mp)->sendflag = 0;                                                                 \
    (mp)->handshake_timeout = 0;                                                        \
    REG_RCNT = 0;                                                                       \
    REG_SIOCNT = SIO_MULTI_MODE | SIO_115200_BPS;                                       \
    REG_SIODATA8 = 0;

/*------------------------------------------------------------------*/
/*                   Multi-play Boot Main                           */
/*------------------------------------------------------------------*/

s32 MultiBootMain(struct MultiBootParam *mp)
{
    s32 i, j, k;

    if (MultiBootCheckComplete(mp))
        /* Transfer is complete so no other processing done */
        return 0;
    if (mp->check_wait > MULTIBOOT_CONNECTION_CHECK_WAIT) {
        /* After system call error, do not send anything,
         * and wait for client to have timeout error.
         */
        --mp->check_wait;
        return 0;
    }
output_burst:
    if (mp->sendflag) {
        mp->sendflag = 0;
        /* There is a problem if SC7, SC6 is on at this point.
         * There may be a problem with the connection(connected to JOY) and
         * communication does not have timeout error.
         * When the connection ID is not 00 or there is a problem with the SD or
         * SI terminals an error occurs.
         */
        i = REG_SIOCNT
            & (SIO_MULTI_BUSY | SIO_ERROR | SIO_ID | SIO_MULTI_SD | SIO_MULTI_SI);
        if (i != SIO_MULTI_SD) {
            MULTIBOOT_INIT(mp);
            return i ^ SIO_MULTI_SD;
        }
    }
    if (mp->probe_count >= 0xe0) {
        /* Check(handshake) to see if all slaves booted properly. */
        i = MultiBootHandShake(mp);
        if (i)
            return i;
        /* If Low speed recognition mode, handshake also 2bytes communication,
         * call If High speed recognition mode, handshake also high speed
         * communication.
         */
        if (mp->server_type == MULTIBOOT_SERVER_TYPE_QUICK && mp->probe_count > 0xe1
            && MultiBootCheckComplete(mp) == 0) {
            MultiBootWaitSendDone();
            goto output_burst;
        }
        /* Timeout check */
        if (MultiBootCheckComplete(mp) == 0) {
            if (mp->handshake_timeout == 0) {
                MULTIBOOT_INIT(mp);
                return MULTIBOOT_ERROR_HANDSHAKE_FAILURE;
            }
            --mp->handshake_timeout;
        }
        return 0;
    }
    switch (mp->probe_count) {
        case 0:
            /* client not doing recognition
             * Value should be CLIENT_INFO 000 0 ccc 0
             * First, check if some kind of response(other than 0xffff)
             * from machine.
             */
            k = 0x0e;
            for (i = MULTIBOOT_NCHILD; i != 0; --i) {
                if (*(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2)
                    != 0xffff) { // braces are required to match on my machine,
                                 // but works fine on SBird's CE :/
                    break;
                }
                k >>= 1;
            }
            k &= 0x0e; /* 4P-2P: d3-d1 is 1 */
            mp->response_bit = k; /* mark connected slaves */
            /* Machine recognized as client,
             * must be CLIENT_INFO 000 0 ccc 0.
             */
            for (i = MULTIBOOT_NCHILD; i != 0; --i) {
                j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
                if (mp->client_bit & (1 << i)) {
                    if (j != ((MULTIBOOT_CLIENT_INFO << 8) | (1 << i))) {
                        /* Need to do recognition processing again */
                        k = 0;
                        break;
                    }
                }
            }
            mp->client_bit &= k; /* update recognized slaves */
            if (k == 0)
                /* From client, until at least one returns value other than
                 * 0xffff, maintain fixed time until redo of recognition
                 * processing
                 */
                mp->check_wait = MULTIBOOT_CONNECTION_CHECK_WAIT;
            if (mp->check_wait) {
                --mp->check_wait;
            } else {
                /* If machine with response and client status do not match up,
                 * do recognition processing again.
                 */
                if (mp->response_bit != mp->client_bit) {
                    MultiBootStartProbe(mp);
                    goto case_1;
                }
            }
        output_master_info:
            /* Output MASTER_INFO 000 0 ccc 0. */
            return MultiBootSend(mp, (MULTIBOOT_MASTER_INFO << 8) | mp->client_bit);
        case 1:
        case_1:
            /* Start recognition.
             * Those where in data is CLIENT_INFO 000 0 ccc 0
             * are recognized.
             */
            mp->probe_target_bit = 0;
            for (i = MULTIBOOT_NCHILD; i != 0; --i) {
                j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
                if ((j >> 8) == MULTIBOOT_CLIENT_INFO) {
                    /* Check validity of 000 0 ccc 0.
                     * If 4P, 0x08
                     * If 3P, 0x04
                     * If 2P, 0x02
                     * If not so, invalid.
                     */
                    gMultiBootRequiredData[i - 1]
                        = j; /* During processing next time must be same value */
                    j &= 0xff;
                    if (j == (1 << i))
                        mp->probe_target_bit |= j; /* recognized */
                }
            }

            if (mp->response_bit != mp->probe_target_bit)
                goto output_master_info;
            /* Send MASTER_START_PROBE 000 0 ccc 0.
             * Here the recognized bits are 000, ccc.
             * If not possible that 000 or ccc, not recognized by master.
             */
            mp->probe_count = 2;
            return MultiBootSend(
                mp, (MULTIBOOT_MASTER_START_PROBE << 8) | mp->probe_target_bit);
        case 2:
            /* Must be CLIENT_INFO 000 0 ccc 0.
             * Output header +0, +1 bytes.
             */
            for (i = MULTIBOOT_NCHILD; i != 0; --i) {
                if (mp->probe_target_bit & (1 << i)) {
                    j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
                    if (j != gMultiBootRequiredData[i - 1])
                        /* Problem with client recognition */
                        mp->probe_target_bit ^= 1 << i;
                }
            }
            goto output_header;
        case 0xd0:
            /* Request for start of master server.
             * If CLIENT_INFO 000 0 ccc 0, not ready
             * to download client.
             * If all clients CLIENT_DLREADY, call system
             * call and transfer boot program.
             */
            k = 1; /* Okay to go to download start? */
            for (i = MULTIBOOT_NCHILD; i != 0; --i) {
                j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
                /* handshake data from client
                 * Regardless of recognition, save for all machines
                 */
                mp->client_data[i - 1] = j;
                if (mp->probe_target_bit & (1 << i)) {
                    if ((j >> 8) != MULTIBOOT_CLIENT_INFO
                        && (j >> 8) != MULTIBOOT_CLIENT_DLREADY) {
                        MULTIBOOT_INIT(mp);
                        return MULTIBOOT_ERROR_NO_DLREADY; /* No response saying
                                                              ready to do
                                                              download */
                    }
                    if (j == gMultiBootRequiredData[i - 1])
                        /* CLIENT_INFO 000 0 ccc 0
                         * Was at least one machine not ready for download,
                         * so not start download yet.
                         */
                        k = 0;
                }
            }
            if (k == 0)
                /* Not start download yet.
                 * Send request for download preparation
                 */
                return MultiBootSend(
                    mp, (MULTIBOOT_MASTER_REQUEST_DLREADY << 8) | mp->palette_data);
            /* All machines ready to download */
            mp->probe_count = 0xd1;
            k = 0x11;
            for (i = MULTIBOOT_NCHILD; i != 0; --i) /* handshake data */
                k += mp->client_data[i - 1];
            mp->handshake_data = k;
            return MultiBootSend(mp, (MULTIBOOT_MASTER_START_DL << 8) | (k & 0xff));
        case 0xd1:
            /* Send MASTER_START_DL
             * Should be CLIENT_DLREADY.
             */
            for (i = MULTIBOOT_NCHILD; i != 0; --i) {
                j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
                if (mp->probe_target_bit & (1 << i)) {
                    if ((j >> 8) != MULTIBOOT_CLIENT_DLREADY) {
                        MULTIBOOT_INIT(mp);
                        return MULTIBOOT_ERROR_NO_DLREADY; /* No response saying
                                                              ready to do
                                                              download */
                    }
                }
            }
            i = MultiBoot(mp);
            if (i == 0) {
                /* complete
                 * Make mp -> probe_count into 0xe0(request for handshake
                 * start).
                 */
                mp->probe_count = 0xe0;
                mp->handshake_timeout = MULTIBOOT_HANDSHAKE_TIMEOUT;
                return 0;
            }
            MULTIBOOT_INIT(mp);
            /* With system call failure, possible that client still in
             * receive data status.
             * Therefore, until retry, do not send anything including
             * MASTER_INFO, during time for "Client has timeout error".
             */
            mp->check_wait = MULTIBOOT_CONNECTION_CHECK_WAIT * 2;
            return MULTIBOOT_ERROR_BOOT_FAILURE; /* Transfer failed */
        default:
            /* 4-...: Doing recognition processing
             * 4 -> +0,1 byte
             * 6 -> +2,3
             * 8 -> +4,5
             *  :
             * 0xc2 -> +0xbe, 0xbf byte
             * Output header data.
             */

            /* When client is being recognized,
             * value is MASTER_START_PROBE - 1, ..-2, ..., 0
             * 0x61 - 1,               0x5f
             * lower bytes are 000 0 ccc 0
             */
            for (i = MULTIBOOT_NCHILD; i != 0; --i) {
                if (mp->probe_target_bit & (1 << i)) {
                    j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
                    if ((j >> 8)
                            != (MULTIBOOT_MASTER_START_PROBE + 1
                                - (mp->probe_count >> 1))
                        || ((j & 0xff) != (1 << i)))
                        /* Problem with client recognition */
                        mp->probe_target_bit ^= 1 << i;
                }
            }
            if (mp->probe_count == 0xc4) {
                /* From recognized, those leftover last are
                 * qualified as client.
                 */
                mp->client_bit = mp->probe_target_bit & 0x0e;
                mp->probe_count = 0;
                goto output_master_info;
            }
        output_header:
            /* If no target, ends with error in middle. */
            if (mp->probe_target_bit == 0) {
                MULTIBOOT_INIT(mp);
                return MULTIBOOT_ERROR_NO_PROBE_TARGET; /* No recognized target
                                                         */
            }
            mp->probe_count += 2;
            if (mp->probe_count == 0xc4)
                /* When getting final data, send MASTER_INFO 000 0 ccc 0.
                 * If do not problem with timing.
                 */
                goto output_master_info;
            i = MultiBootSend(mp,
                              (mp->masterp[mp->probe_count - 4 + 1] << 8)
                                  | mp->masterp[mp->probe_count - 4]);
            if (i)
                return i;
            /* If Low speed recognition mode, for each frame of call, 2 bytes of
             * communication.
             * If High speed recognition mode,
             * (time to end of communication + sufficient time for slave
             * interrupt processing)
             * Wait, continued communication.
             */
            if (mp->server_type == MULTIBOOT_SERVER_TYPE_QUICK) {
                MultiBootWaitSendDone();
                goto output_burst;
            }
            return 0;
    }
    /* never comes here */
}

/*------------------------------------------------------------------*/
/*                       Send Data                                  */
/*------------------------------------------------------------------*/

/*
 * If connection has problem, non-0
 */
static s32 MultiBootSend(struct MultiBootParam *mp, u16 data)
{
    s32 i;

    /* If SC7 is on, problem has occurred.
     * There may be a problem with the connection(connected to JOY) and
     * communication does not have timeout error.
     * (reconnect cable) May be first communication so no check for
     * SC6, connection ID.
     */
    i = REG_SIOCNT & (SIO_MULTI_BUSY | SIO_MULTI_SD | SIO_MULTI_SI);
    if (i != SIO_MULTI_SD) {
        MULTIBOOT_INIT(mp);
        return i ^ SIO_MULTI_SD;
    }
    REG_SIODATA8 = data;
    REG_SIOCNT = SIO_MULTI_MODE | SIO_115200_BPS | SIO_START;
    mp->sendflag = 1;
    return 0;
}

/*------------------------------------------------------------------*/
/*                    Start recognition of client                   */
/*------------------------------------------------------------------*/

void MultiBootStartProbe(struct MultiBootParam *mp)
{
    if (mp->probe_count != 0) {
        MULTIBOOT_INIT(mp);
        return;
    }
    mp->check_wait = 0;
    mp->client_bit = 0;
    mp->probe_count = 1;
}

/*------------------------------------------------------------------*/
/*                   Start send from master server                  */
/*------------------------------------------------------------------*/

void MultiBootStartMaster(struct MultiBootParam *mp, const u8 *srcp, s32 length,
                          u8 palette_color, s8 palette_speed)
{
    s32 i;

    if (mp->probe_count != 0 || mp->client_bit == 0 || mp->check_wait != 0) {
        /* Recognition processing, cannot do processing */
        MULTIBOOT_INIT(mp);
        return;
    }
    mp->boot_srcp = (u8 *)srcp;
    length = (length + 15) & ~15; /* 16 byte units */
    if (length < MULTIBOOT_SEND_SIZE_MIN || length > MULTIBOOT_SEND_SIZE_MAX) {
        /* More than number or transfer bytes */
        MULTIBOOT_INIT(mp);
        return;
    }
    mp->boot_endp = (u8 *)(srcp + length);
    switch (palette_speed) {
        case -4:
        case -3:
        case -2:
        case -1:
            i = (palette_color << 3) | (3 - palette_speed);
            break;
        case 0:
            i = 0x38 | palette_color;
            break;
        case 1:
        case 2:
        case 3:
        case 4:
            i = (palette_color << 3) | (palette_speed - 1);
            break;
    }
    mp->palette_data = ((i & 0x3f) << 1) | 0x81;
    mp->probe_count = 0xd0;
}

/*------------------------------------------------------------------*/
/*                  Handshake (final confirmation of boot)          */
/*------------------------------------------------------------------*/

static s32 MultiBootHandShake(struct MultiBootParam *mp)
{
    s32 i, j;

#define send_data (mp->system_work[0])
#define must_data (mp->system_work[1])
    switch (mp->probe_count) {
        case 0xe0:
        case_0xe0:
            /* Master sends 0x0000. */
            mp->probe_count = 0xe1;
            must_data = 0x0000;
            send_data = 0x100000; /* Right before next send >>5  */
            return MultiBootSend(mp, 0x0000);
        default:
            /* 0xe1-0xe6
             * If expected data does not come, do again from case_0xe0.
             * 0xe1: After master sends 0x0000. All slaves must be 0x0000.
             * 0xe2: After master sends 0x8000. All slaves must be 0x0000.
             * 0xe3:        0x0400                            0x8000
             * 0xe4:        0x0020                            0x0400
             * 0xe5:        0x0001                            0x0020
             * 0xe6:        0x0000                            0x0001
             */
            for (i = MULTIBOOT_NCHILD; i != 0; --i) {
                j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
                if ((mp->client_bit & (1 << i)) && j != must_data)
                    /* Expected data still hasn't come from all slaves. */
                    goto case_0xe0;
            }
            ++mp->probe_count;
            must_data = send_data & 0xffff;
            if (send_data == 0x0000) {
                /* This time send initial code low. */
                must_data = mp->masterp[0xac] | (mp->masterp[0xad] << 8);
                send_data = must_data << 5; /* right before sending >>5 */
            }
            send_data >>= 5;
        output_common:
            return MultiBootSend(mp, send_data);
        case 0xe7: /* Master sent initial code, low. All slaves must be same. */
        case 0xe8: /* Master sent initial code, high. All slaves must be same.
                    */
            for (i = MULTIBOOT_NCHILD; i != 0; --i) {
                j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
                if ((mp->client_bit & (1 << i)) && j != must_data) {
                    /* Desired data did not come from all slaves.
                     * If reach this point and have error, stop(infinite loop)
                     * slave, and no retry by master. On master's screen
                     * display, "Communication failure. Turn off power and check
                     * connection. Turn on power again."
                     */
                    MULTIBOOT_INIT(mp);
                    return MULTIBOOT_ERROR_HANDSHAKE_FAILURE;
                }
            }
            ++mp->probe_count;
            if (mp->probe_count == 0xe9) /* Handshake Success! */
                return 0;
            /* This time send the initial code, high. */
            send_data = mp->masterp[0xae] | (mp->masterp[0xaf] << 8);
            must_data = send_data;
            goto output_common;
    }
#undef send_data
#undef must_data
}

/*------------------------------------------------------------------*/
/*                   Multi-play Boot Initialization                 */
/*------------------------------------------------------------------*/

void MultiBootInit(struct MultiBootParam *mp) { MULTIBOOT_INIT(mp); }

/*------------------------------------------------------------------*/
/*                       Check transfer completion                  */
/*------------------------------------------------------------------*/

s32 MultiBootCheckComplete(struct MultiBootParam *mp)
{
    if (mp->probe_count == 0xe9) /* Transfer complete status */
        return 1;
    /* middle of recognition, haven't started transfer, or transfer failure */
    return 0;
}

/*------------------------------------------------------------------*/
/*                     Wait Cycle                                   */
/*------------------------------------------------------------------*/

static inline void MultiBootWaitCycles(u32 cycles)
{
    /* Depending on if this is in CPU internal working, CPU external
     * working, ROM, the CPU cycles used for one of this function's wait
     * loops is different.
     * CPU External Working (0x02XXXXXX) ... 12 cycles/loop
     * ROM        (0x08XXXXXX) ... 13 cycles/loop
     *            (Have prefetch  Setup maximum speed)
     * CPU Internal Working (0x03XXXXXX) ... 4  cycles/loop
     * If address area other than above, temporarily use 4 cycles/loop.
     * If set up lower cycles/loop than actual,
     * can get specified cycle number wait.
     *
     * Use AGB system clock 16.78MHz as hint for argument, cycles.
     * If use 0x1000000 (16777216) with cycles approximately 1 second wait.
     * (If V blank interrupt is processed during this, actual wait is longer)
     */

#ifndef PORTABLE
    asm("mov r2, pc\n\t"
        "lsr r2, #24\n\t"
        "mov r1, #12\n\t"
        "cmp r2, #0x02\n\t"
        "beq MultiBootWaitCyclesLoop\n\t"
        "mov r1, #13\n\t"
        "cmp r2, #0x08\n\t"
        "beq MultiBootWaitCyclesLoop\n\t"
        "mov r1, #4\n\t"
        "MultiBootWaitCyclesLoop:\n\t"
        "sub r0, r1\n\t"
        "bgt MultiBootWaitCyclesLoop\n\t"
        :
        :
        : "r0", "r1", "r2");
#endif
}

/*------------------------------------------------------------------*/
/*             Check if communication completed within fixed time   */
/*------------------------------------------------------------------*/

static void MultiBootWaitSendDone(void)
{
    s32 i;

    /* If cannot detect communication end within fixed time(1 frame),
     * remove loop.
     * Even if fast this loop takes 9 cycles/loop,
     * (ldr=3, and=1, branch skip=1, i++=1, branch=3)
     * try loop for 1 frame.
     * Number of times do loop is,
     * 0x1000000 (16.78MHz=cycles/sec) / 60 (frames/sec) / 9 (cycles/loop)
     * = approximately 31069 (loops/frame)
     */
    for (i = 0; i < 31069; ++i)
        if ((REG_SIOCNT & SIO_START) == 0)
            break;
    /* Sufficient time for slave's interrupt processing */
    MultiBootWaitCycles(600);
}
