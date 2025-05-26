#include "global.h"
#include "core.h"
#include "game/sa1_sa2_shared/globals.h"

void sub_020048AC(u8 a, u8 b, u8 c, u16 d, u16 e)
{
    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    gHBlankCopyTarget = (void *)(REG_ADDR_BG0HOFS + a * 4);
    gHBlankCopySize = 4;
    if (b < c) {
        DmaFill32(3, ((d & 0x1FF) | ((e & 0x1FF) << 0x10)), gBgOffsetsHBlank + (b * 4), (c - b) * 4);
    }
}

void Task_MultiplayerEventMgr_Send(void)
{
    u8 id = SIO_MULTI_CNT->id;
    struct MultiSioData_0_0 *send = &gMultiSioSend.pat0;
    u32 something = send->unk8[0] & (0x1000 << id);

    u8 i;

    for (i = 0; i < 4 && GetBit(gMultiplayerConnections, i); i++) {
        struct MultiSioData_0_0 *recv;
        if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {
            return;
        } else {
            recv = &gMultiSioRecv[i].pat0;
            if (0x5000 == recv->unk0 && (something == 0) != (!(recv->unk8[0] & (0x1000 << id)))) {
                return;
            }
        }
    }

    if (gRoomEventQueueWritePos == gRoomEventQueueSendPos) {
        DmaFill16(3, 0, &gMultiSioSend.pat0.unk8[3], sizeof(RoomEvent) - 1);
    } else {
        DmaCopy16(3, &gRoomEventQueue[gRoomEventQueueSendPos], &gMultiSioSend.pat0.unk8[3], sizeof(RoomEvent) - 1);
        gRoomEventQueueSendPos = (gRoomEventQueueSendPos + 1) & 0xF;
        send->unk8[0] ^= (0x1000 << id);
    }
}
