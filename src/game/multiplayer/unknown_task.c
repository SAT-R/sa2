#include "core.h"
#include "sakit/globals.h"

#include "game/multiplayer/mp_player.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/item_tasks.h"

#include "game/multiplayer/player_unk_1.h"

#include "game/unknown_effect.h"

#include "game/multiplayer/finish.h"

#include "lib/m4a.h"

#include "constants/songs.h"

void sub_8018E00(union MultiSioData *recv, u8 i);
void sub_8018AD8(union MultiSioData *recv, u8 i);
typedef void (*UnknownFunction)(union MultiSioData *recv, u8 i);

const UnknownFunction gUnknown_080D5744[] = {
    sub_8019240, sub_80192A8, sub_80192FC, sub_8019350,
    sub_8019368, sub_8018AD8, sub_8018E00, VoidReturnSIOControl32,
    NULL,
};

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

void Task_8018A28(void)
{
    u8 id = SIO_MULTI_CNT->id;
    struct MultiSioData_0_0 *send = &gMultiSioSend.pat0;

    u8 i;

    for (i = 0; i < 4; i++) {
        union MultiSioData *recv;
        if (i == id) {
            continue;
        }
        if (!GetBit(gMultiplayerConnections, i)) {
            break;
        }

        if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {
            continue;
        }

        recv = &gMultiSioRecv[i];
        if (recv->pat0.unk0 == 0x5000
            && (recv->pat0.unk8[0] & (0x1000 << i)) != (send->unk8[0] & (0x1000 << i))) {
            if ((u8)(recv->pat0.unkE - 1) < 8) {

                gUnknown_080D5744[recv->pat0.unkE - 1](recv, i);
            }
            send->unk8[0] ^= (0x1000 << i);
        }
    }
}

void sub_8018AD8(union MultiSioData *recv, u8 i)
{
    struct MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);
    struct MultiplayerPlayer *us = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);

    if (!(us->unk5C & 1) && PLAYER_IS_ALIVE
        && gUnknown_030054B4[SIO_MULTI_CNT->id] == -1) {
        switch (recv->pat0.unkF) {
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
                if ((u8)recv->pat0.unk10 == SIO_MULTI_CNT->id
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

void sub_8018E00(union MultiSioData *recv, u8 i)
{
    u32 j;
    struct MultiplayerPlayer *mpp;

    s32 count2 = 0;
    s32 count3 = 0;
    s32 count = 0;
    bool8 somebool = FALSE;
    mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);

    for (j = 0; j < 4; j++) {
        // u32 id = SIO_MULTI_CNT->id;
        struct MultiplayerPlayer *mpp2;
        if (gMultiplayerPlayerTasks[j] == NULL) {
            break;
        }
        count++;
        mpp2 = TASK_DATA(gMultiplayerPlayerTasks[j]);
        if (gGameMode != GAME_MODE_TEAM_PLAY) {

            if (mpp2->unk5C & 1 && gUnknown_030054B4[j] != -1) {
                count2++;
                count3++;
            }
        } else {
            if ((gMultiplayerConnections & (0x10 << (j))) >> ((j + 4))
                    != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                        >> (SIO_MULTI_CNT->id + 4)
                && (s8)gUnknown_030054B4[j] == 0) {
                count2 = 1;
            }
        }
    }

    if (gUnknown_030054B4[i] == -1) {
        sub_8019CCC(i, count2);
    } else {
        somebool = 1;
    }

    if (gGameMode == GAME_MODE_TEAM_PLAY) {
        for (j = 0; j < 4 && gMultiplayerPlayerTasks[j] != NULL; j++) {
            if (j != i && gUnknown_030054B4[j] == -1
                && (gMultiplayerConnections & (0x10 << (j))) >> ((j + 4))
                    == (gMultiplayerConnections & (0x10 << (i))) >> (i + 4)) {
                sub_8019CCC(j, count2);
                if (j == SIO_MULTI_CNT->id) {
                    sub_80218E4(&gPlayer);
                    gPlayer.moveState &= ~MOVESTATE_8;
                    gPlayer.moveState &= ~MOVESTATE_20;
                    gPlayer.moveState &= ~MOVESTATE_4;
                    gPlayer.moveState &= ~MOVESTATE_10;
                    gPlayer.moveState |= MOVESTATE_IN_AIR;
                    gPlayer.moveState &= ~MOVESTATE_400;
                    gPlayer.moveState &= ~MOVESTATE_100;
                    gPlayer.unk64 = 0x14;
                    sub_8023B5C(&gPlayer, 0xe);
                    gPlayer.unk16 = 6;
                    gPlayer.unk17 = 0xE;
                    gPlayer.unk61 = 0;
                    gPlayer.unk62 = 0;
                    gPlayer.speedGroundX = 0;
                    gPlayer.speedAirX = 0;
                    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
                    gPlayer.unk5C = 0;
                    gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                    gPlayer.unk64 = 0x1C;
                    gPlayer.moveState |= MOVESTATE_800000;
                }
            }
        }
    }

    mpp->unk5C |= 1;

    if (count2 == 0 && !(gUnknown_03005424 & 1)) {
        gUnknown_03005424 |= 4;
        gCourseTime = 3600; // max?
    };

    if ((count3 + 1) >= (u32)(count - 1) || gGameMode == GAME_MODE_TEAM_PLAY) {
        for (j = 0; j < 4; j++) {
            struct MultiplayerPlayer *mpp2;

            if (gMultiplayerPlayerTasks[j] == NULL) {
                break;
            }

            mpp2 = TASK_DATA(gMultiplayerPlayerTasks[j]);
            if (gUnknown_030054B4[j] == -1) {
                if (gGameMode == GAME_MODE_TEAM_PLAY) {
                    sub_8019CCC(j, 1);
                } else {
                    u32 temp;
                    struct UNK_3005510 *unk10;
                    sub_8019CCC(j, count - 1);
                    mpp2->unk5C |= 1;
                    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
                    gPlayer.unk5C = 0;
                    temp = gUnknown_03005438;
                    unk10 = &gUnknown_03005510[temp];
                    gUnknown_03005438++;
                    gUnknown_03005438 &= 0xF;

                    unk10->unk0 = 7;
                }
            }
        }

        if (!somebool) {
            sub_8019F08();
        }
    }
}

void Task_80188FC(void);
struct Task *sub_8019120(void)
{
    struct Task *t = TaskCreate(Task_80188FC, 0, -2, 0, NULL);
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, &gMultiSioRecv, sizeof(gMultiSioRecv));
    DmaFill32(3, 0, &gUnknown_03005510, sizeof(gUnknown_03005510));
    gUnknown_03005438 = gUnknown_03005420 = 0;
    return t;
}

void Task_8018A28(void);
struct Task *sub_80191A4(void)
{
    struct Task *t = TaskCreate(Task_8018A28, 0, 1, 0, NULL);
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, &gMultiSioRecv, sizeof(gMultiSioRecv));
    DmaFill32(3, 0, &gUnknown_03005510, sizeof(gUnknown_03005510));
    gUnknown_03005420 = 0;
    gUnknown_03005438 = 0;
    return t;
}
