#include "multi_boot.h"
#include "global.h"

s32 MultiBootSend(struct MultiBootParam *mp, u16 data);
s32 MultiBootHandShake(struct MultiBootParam *mp);
void MultiBootWaitSendDone(void);

// TODO: convert to static and use 
// . = 0x00000400; src/multi_boot.o(.bss);
// in iwram
extern u16 gMultiBootRequiredData[MULTIBOOT_NCHILD];
// static u16 gMultiBootRequiredData[MULTIBOOT_NCHILD];

#define MULTIBOOT_INIT(mp)                              \
    (mp)->client_bit = 0;                               \
    (mp)->probe_count = 0;                              \
    (mp)->response_bit = 0;                             \
    (mp)->check_wait = MULTIBOOT_CONNECTION_CHECK_WAIT; \
    (mp)->sendflag = 0;                                 \
    (mp)->handshake_timeout = 0;                        \
    REG_RCNT = 0;                                       \
    REG_SIOCNT = SIO_MULTI_MODE | SIO_115200_BPS;       \
    REG_SIODATA8 = 0;                                   \


s32 MultiBootMain(struct MultiBootParam *mp)
{
    s32 i, j, k;

    if (MultiBootCheckComplete(mp))
    /* Transfer is complete so no other processing done */
        return 0;
    if (mp->check_wait > MULTIBOOT_CONNECTION_CHECK_WAIT)
    {
        /* After system call error, do not send anything,
         * and wait for client to have timeout error.
         */
        --mp->check_wait;
        return 0;
    }
output_burst:
    if (mp->sendflag)
    {
        mp->sendflag = 0;
        /* There is a problem if SC7, SC6 is on at this point.
         * There may be a problem with the connection(connected to JOY) and      
         * communication does not have timeout error.
         * When the connection ID is not 00 or there is a problem with the SD or SI terminals an error occurs.
         */
        i = REG_SIOCNT & (SIO_MULTI_BUSY | SIO_ERROR | SIO_ID | SIO_MULTI_SD | SIO_MULTI_SI);
        if (i != SIO_MULTI_SD)
        {
            MULTIBOOT_INIT(mp);
            return i ^ SIO_MULTI_SD;
        }
    }
    if (mp->probe_count >= 0xe0)
    {
        /* Check(handshake) to see if all slaves booted properly. */
        i = MultiBootHandShake(mp);
        if (i)
            return i;
        /* If Low speed recognition mode, handshake also 2bytes communication, call
         * If High speed recognition mode, handshake also high speed communication.
         */
        if (mp->server_type == MULTIBOOT_SERVER_TYPE_QUICK
         && mp->probe_count > 0xe1 && MultiBootCheckComplete(mp) == 0)
        {
            MultiBootWaitSendDone();
            goto output_burst;
        }
        /* Timeout check */
        if (MultiBootCheckComplete(mp) == 0)
        {
            if (mp->handshake_timeout == 0)
            {
                MULTIBOOT_INIT(mp);
                return MULTIBOOT_ERROR_HANDSHAKE_FAILURE;
            }
            --mp->handshake_timeout;
        }
        return 0;
    }
    switch (mp->probe_count)
    {
    case 0:
        /* client not doing recognition
         * Value should be CLIENT_INFO 000 0 ccc 0
         * First, check if some kind of response(other than 0xffff) 
         * from machine.
         */
        k = 0x0e;
        for (i = MULTIBOOT_NCHILD; i != 0; --i)
        {
            if (*(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2) != 0xffff)
            { // braces are required to match on my machine, but works fine on SBird's CE :/
                break;
            }
            k >>= 1;
        }
        k &= 0x0e; /* 4P-2P: d3-d1 is 1 */
        mp->response_bit = k; /* mark connected slaves */
        /* Machine recognized as client, 
         * must be CLIENT_INFO 000 0 ccc 0.
         */
        for (i = MULTIBOOT_NCHILD; i != 0; --i)
        {
            j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
            if (mp->client_bit & (1 << i))
            {
                if (j != ((MULTIBOOT_CLIENT_INFO << 8) | (1 << i)))
                {
                    /* Need to do recognition processing again */
                    k = 0;
                    break;
                }
            }
        }
        mp->client_bit &= k; /* update recognized slaves */
        if (k == 0)
            /* From client, until at least one returns value other than 
             * 0xffff, maintain fixed time until redo of recognition processing
             */
            mp->check_wait = MULTIBOOT_CONNECTION_CHECK_WAIT;
        if (mp->check_wait)
        {
            --mp->check_wait;
        }
        else
        {
            /* If machine with response and client status do not match up,
             * do recognition processing again.
             */
            if (mp->response_bit != mp->client_bit)
            {
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
        for (i = MULTIBOOT_NCHILD; i != 0; --i)
        {
            j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
            if ((j >> 8) == MULTIBOOT_CLIENT_INFO)
            {
                /* Check validity of 000 0 ccc 0.
                 * If 4P, 0x08
                 * If 3P, 0x04
                 * If 2P, 0x02
                 * If not so, invalid.
                 */
                gMultiBootRequiredData[i - 1] = j; /* During processing next time must be same value */
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
        return MultiBootSend(mp, (MULTIBOOT_MASTER_START_PROBE << 8) | mp->probe_target_bit);
    case 2:
        /* Must be CLIENT_INFO 000 0 ccc 0.
         * Output header +0, +1 bytes.
         */
        for (i = MULTIBOOT_NCHILD; i != 0; --i)
        {
            if (mp->probe_target_bit & (1 << i))
            {
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
        for (i = MULTIBOOT_NCHILD; i != 0; --i)
        {
            j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
            /* handshake data from client
             * Regardless of recognition, save for all machines
             */
            mp->client_data[i - 1] = j;
            if (mp->probe_target_bit & (1 << i))
            {
                if ((j >> 8) != MULTIBOOT_CLIENT_INFO
                 && (j >> 8) != MULTIBOOT_CLIENT_DLREADY)
                {
                    MULTIBOOT_INIT(mp);
                    return MULTIBOOT_ERROR_NO_DLREADY; /* No response saying ready to do download */
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
            return MultiBootSend(mp, (MULTIBOOT_MASTER_REQUEST_DLREADY << 8) | mp->palette_data);
        /* All machines ready to download */
        mp->probe_count = 0xd1;
        k = 0x11;
        for (i = MULTIBOOT_NCHILD; i != 0; --i)
            /* handshake data */
            k += mp->client_data[i - 1];
        mp->handshake_data = k;
        return MultiBootSend(mp, (MULTIBOOT_MASTER_START_DL << 8) | (k & 0xff));
    case 0xd1:
        /* Send MASTER_START_DL
         * Should be CLIENT_DLREADY.
         */
        for (i = MULTIBOOT_NCHILD; i != 0; --i)
        {
            j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
            if (mp->probe_target_bit & (1 << i))
            {
                if ((j >> 8) != MULTIBOOT_CLIENT_DLREADY)
                {
                    MULTIBOOT_INIT(mp);
                    return MULTIBOOT_ERROR_NO_DLREADY; /* No response saying ready to do download */
                }
            }
        }
        i = MultiBoot(mp);
        if (i == 0)
        {
            /* complete
             * Make mp -> probe_count into 0xe0(request for handshake start).
             */
            mp->probe_count = 0xe0;
            mp->handshake_timeout = MULTIBOOT_HANDSHAKE_TIMEOUT;
            return 0;
        }
        MULTIBOOT_INIT(mp);
        /* With system call failure, possible that client still in
         * receive data status.
         * Therefore, until retry, do not send anything including MASTER_INFO,
         * during time for "Client has timeout error".
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
        for (i = MULTIBOOT_NCHILD; i != 0; --i)
        {
            if (mp->probe_target_bit & (1 << i))
            {
                j = *(vu16 *)(REG_ADDR_SIOMULTI0 + i * 2);
                if ((j >> 8) != (MULTIBOOT_MASTER_START_PROBE + 1 - (mp->probe_count >> 1))
                 || ((j & 0xff) != (1 << i)))
                    /* Problem with client recognition */
                    mp->probe_target_bit ^= 1 << i;
            }
        }
        if (mp->probe_count == 0xc4)
        {
            /* From recognized, those leftover last are 
             * qualified as client.
             */
            mp->client_bit = mp->probe_target_bit & 0x0e;
            mp->probe_count = 0;
            goto output_master_info;
        }
    output_header:
        /* If no target, ends with error in middle. */
        if (mp->probe_target_bit == 0)
        {
            MULTIBOOT_INIT(mp);
            return MULTIBOOT_ERROR_NO_PROBE_TARGET; /* No recognized target */
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
        if (mp->server_type == MULTIBOOT_SERVER_TYPE_QUICK)
        {
            MultiBootWaitSendDone();
            goto output_burst;
        }
        return 0;
    }
    /* never comes here */
}
