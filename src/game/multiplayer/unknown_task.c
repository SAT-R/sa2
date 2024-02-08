#include "core.h"
#include "sakit/globals.h"

#include "game/player_mp_actor.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/item_tasks.h"

#include "game/unknown_effect.h"

#include "lib/m4a.h"

#include "constants/songs.h"

void Task_80188FC(void)
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
            if (0x5000 == recv->unk0
                && something == 0 != (!(recv->unk8[0] & (0x1000 << id)))) {
                return;
            }
        }
    }

    if (gUnknown_03005438 == gUnknown_03005420) {
        DmaFill16(3, 0, &gMultiSioSend.pat0.unk8[3], sizeof(struct UNK_3005510) - 1);
    } else {
        DmaCopy16(3, &gUnknown_03005510[gUnknown_03005420], &gMultiSioSend.pat0.unk8[3],
                  sizeof(struct UNK_3005510) - 1);
        gUnknown_03005420 = (gUnknown_03005420 + 1) & 0xF;
        send->unk8[0] ^= (0x1000 << id);
    }
}

typedef void (*UnknownFunction)(struct MultiSioData_0_0 *recv, u8 i);

extern const UnknownFunction gUnknown_080D5744[];

void Task_8018A28(void)
{
    u8 id = SIO_MULTI_CNT->id;
    struct MultiSioData_0_0 *send = &gMultiSioSend.pat0;

    u8 i;

    for (i = 0; i < 4; i++) {
        struct MultiSioData_0_0 *recv;
        if (i == id) {
            continue;
        }
        if (!GetBit(gMultiplayerConnections, i)) {
            break;
        }

        if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {
            continue;
        }

        recv = &gMultiSioRecv[i].pat0;
        if (recv->unk0 == 0x5000
            && (recv->unk8[0] & (0x1000 << i)) != (send->unk8[0] & (0x1000 << i))) {
            if ((u8)(recv->unkE - 1) < 8) {

                gUnknown_080D5744[recv->unkE - 1](recv, i);
            }
            send->unk8[0] ^= (0x1000 << i);
        }
    }
}

void sub_8018AD8(struct MultiSioData_0_0 *recv, u8 i)
{
    struct MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);
    struct MultiplayerPlayer *us = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);

    if (!(us->unk5C & 1) && PLAYER_IS_ALIVE
        && gUnknown_030054B4[SIO_MULTI_CNT->id] == -1) {
        switch (recv->unkF) {
            case 0: {
                if (gGameMode != GAME_MODE_TEAM_PLAY
                    || ((gMultiplayerConnections & (0x10 << (i))) >> ((i + 4))
                        != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                            >> (SIO_MULTI_CNT->id + 4))) {
                    gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__40;
                    gPlayer.unk32 = 600;
                    CreateItemTask_Confusion(gPlayer.character);
                    m4aSongNumStart(217);
                }
                break;
            }
            case 1: {
                if ((u8)recv->unk10 == SIO_MULTI_CNT->id
                    && !(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__80)) {
                    u32 prevMoveState = gPlayer.moveState
                        & (MOVESTATE_IN_SCRIPTED | MOVESTATE_IGNORE_INPUT
                           | MOVESTATE_400000);
                    if (!(prevMoveState)) {
                        InitializePlayer(&gPlayer);
                        gPlayer.x = Q_24_8_NEW(mpp->unk50);
                        gPlayer.y = Q_24_8_NEW(mpp->unk52 - (s8)mpp->unk58[0]);
                        m4aMPlayTempoControl(&gMPlayInfo_BGM, 256);
                        gPlayer.moveState = prevMoveState;
                        gPlayer.unk90->s.unk10 &= ~0x3000;
                        gPlayer.unk90->s.unk10 |= 0x2000;

                        gPlayer.unk94->s.unk10 &= ~0x3000;
                        gPlayer.unk94->s.unk10 |= 0x2000;

                        gCamera.unk50 &= ~3;
                        gPlayer.unk38 = (mpp->unk54 >> 7) & 1;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                        mpp->unk60 = 30;
                        gPlayer.timerInvulnerability = 120;
                        gCamera.x = (Q_24_8_TO_INT(gPlayer.x) + gCamera.shiftX) - 0x78;
                        gCamera.y = (Q_24_8_TO_INT(gPlayer.y) + gCamera.shiftY) - 0x50;
                        m4aSongNumStart(SE_218);
                    }
                }
                break;
            }
            case 2: {
                if (!(gPlayer.moveState & MOVESTATE_IN_SCRIPTED)
                    && (gGameMode != GAME_MODE_TEAM_PLAY
                        || ((gMultiplayerConnections & (0x10 << (i))) >> ((i + 4))
                            != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                                >> (SIO_MULTI_CNT->id + 4)))) {
                    gPlayer.itemEffect |= 0x10;

                    gPlayer.timerSpeedup = 600;
                    gPlayer.itemEffect &= ~0x4;
                    CreateItemTask_Confusion(gPlayer.character);
                    m4aSongNumStart(SE_ITEM_CONFUSION);
                    m4aMPlayTempoControl(&gMPlayInfo_BGM, 128);
                }
                break;
            }
            case 3: {
                if (gGameMode != GAME_MODE_TEAM_PLAY
                    || ((gMultiplayerConnections & (0x10 << (i))) >> ((i + 4))
                        != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                            >> (SIO_MULTI_CNT->id + 4))) {
                    gUnknown_03005B7C = 1;
                    m4aSongNumStart(SE_219);
                }
                break;
            }
            case 4: {
                if (gGameMode != GAME_MODE_TEAM_PLAY
                    || ((gMultiplayerConnections & (0x10 << (i))) >> ((i + 4))
                        != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                            >> (SIO_MULTI_CNT->id + 4))) {
                    gUnknown_0300583C = 1;
                    m4aSongNumStart(SE_216);
                }
                break;
            }
        }
    }
}
