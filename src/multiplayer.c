#include "global.h"
#include "data.h"
#include "multiplayer.h"
#include "multiplayer_mode_select.h"
#include "task.h"
#include "sprite.h"
#include "save.h"
#include "title_screen.h"
#include "multi_sio.h"
#include "input.h"
#include "m4a.h"
#include "constants/songs.h"
#include "game.h"
#include "flags.h"
#include "zones.h"

struct MultiplayerConnectScreen {
    struct UNK_802D4CC_UNK270 unk0;
    struct UNK_0808B3FC_UNK240 unkC;
    struct UNK_0808B3FC_UNK240 unk3C;
    struct UNK_0808B3FC_UNK240 unk6C;
    struct Unk_03002400 unk9C;
    u32 unkDC;
    u8 fillerDC[8];
    u16 unkE8;
    u8 fillerEA;
    u8 unkEB;
    u8 fillerEC[2];
    u8 unkEE[4];
    u8 unkF2[4];

    u8 unkF6;
    u8 fillerF7[3];
    u8 unkFA;
    u8 unkFB;
    u8 unkFC;
    u8 unkFD;
    u8 fillerFE[2];
}; /** size 0x100 */

void sub_805ADAC(void);

extern const struct UNK_080E0D64 gUnknown_080D9050[7];
u8 gUnknown_03005594;
u8 gUnknown_030054D8;

void sub_805AAD8(void) {
    struct Task* t;
    struct MultiplayerConnectScreen* connectScreen;
    struct UNK_802D4CC_UNK270* unk0;
    struct UNK_0808B3FC_UNK240* unkC;
    struct Unk_03002400* unk9C;
    const struct UNK_080E0D64* unkD64;
    void* vramAddr = (void*)OBJ_VRAM0;
    u8 i;

    gUnknown_030054D4[3] = 0;
    gUnknown_030054D4[2] = 0;
    gUnknown_030054D4[1] = 0;
    gUnknown_030054D4[0] = 0;
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
    gDispCnt = 0x1141;
    gBgCntRegs[0] = 0x1401;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    t = TaskCreate(sub_805ADAC, 0x100, 0x2000, 0, NULL);
    connectScreen = TaskGetStructPtr(t, connectScreen);
    connectScreen->unkEB = 0;
    connectScreen->unkFC = 1;
    connectScreen->unkFD = 0;

    for (i = 0; i < 4; i++) {
        connectScreen->unkEE[i] = 0;
        connectScreen->unkF2[i] = 0;
    }

    unk0 = &connectScreen->unk0;
    unk0->unk0 = 1;
    unk0->unk4 = 0;
    unk0->unk2 = 2;
    unk0->unk6 = 0x100;
    unk0->unk8 = 0x3FFF;
    unk0->unkA = 0;
    sub_802D4CC(unk0);
    
    unkC = &connectScreen->unkC;
    unkC->unk4 = vramAddr;
    vramAddr += gUnknown_080D9050[gLoadedSaveGame->unk6].unk0 * TILE_SIZE_4BPP;
    unkC->unkA = gUnknown_080D9050[gLoadedSaveGame->unk6].unk4;
    unkC->unk20 = gUnknown_080D9050[gLoadedSaveGame->unk6].unk6;
    unkC->unk21 = 0xFF;
    unkC->unk16 = 8;
    unkC->unk18 = 0x18;
    unkC->unk1A = 0x100;
    unkC->unk8 = 0;
    unkC->unk14 = 0;
    unkC->unk1C = 0;
    unkC->unk22 = 0x10;
    unkC->unk25 = 0;
    unkC->unk28 = -1;
    unkC->unk10 = 0x1000;
    sub_8004558(unkC);

    unkC = &connectScreen->unk3C;
    unkC->unk4 = vramAddr;
    vramAddr += gPressStartTiles[gLoadedSaveGame->unk6].unk0 * TILE_SIZE_4BPP;
    unkC->unkA = gPressStartTiles[gLoadedSaveGame->unk6].unk4;
    unkC->unk20 = gPressStartTiles[gLoadedSaveGame->unk6].unk6;
    unkC->unk21 = 0xFF;
    unkC->unk16 = 0x78;
    unkC->unk18 = 0x7A;
    unkC->unk1A = 0x100;
    unkC->unk8 = 0;
    unkC->unk14 = 0;
    unkC->unk1C = 0;
    unkC->unk22 = 0x10;
    unkC->unk25 = 0;
    unkC->unk28 = -1;
    unkC->unk10 = 0x1000;

    unkC = &connectScreen->unk6C;
    unkC->unk4 = vramAddr;
    unkC->unkA = 0x432;
    unkC->unk20 = 8;
    unkC->unk21 = 0xFF;
    unkC->unk16 = 0x78;
    unkC->unk18 = 0x8C;
    unkC->unk1A = 0x100;
    unkC->unk8 = 0;
    unkC->unk14 = 0;
    unkC->unk1C = 0;
    unkC->unk22 = 0x10;
    unkC->unk25 = 0;
    unkC->unk28 = -1;
    unkC->unk10 = 0x1000;

    // TODO: make macro
    unk9C = &connectScreen->unk9C;
    unk9C->unk4 = BG_SCREEN_ADDR(0);
    unk9C->unkA = 0;
    unk9C->unkC = BG_SCREEN_ADDR(20);
    unk9C->unk18 = 0;
    unk9C->unk1A = 0;
    unk9C->unk1C = 0x72;
    unk9C->unk1E = 0;
    unk9C->unk20 = 0;
    unk9C->unk22 = 0;
    unk9C->unk24 = 0;
    unk9C->unk26 = 0x1E;
    unk9C->unk28 = 0x14;
    unk9C->unk2A = 0;
    unk9C->unk2E = 0;
    sub_8002A3C(unk9C);
    
    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        MultiSioStart();
    }

    gUnknown_03005594 = gLoadedSaveGame->unk13 | 0xF;
    gUnknown_030054D8 = 1;
    
    for (i = 0; i < 5; i++) {
        if (gUnknown_030054D8 < gLoadedSaveGame->unk7[i]) {
            gUnknown_030054D8 = gLoadedSaveGame->unk7[i];
        }
    }

    if (gUnknown_030054D8 > 0x1B) {
        gUnknown_030054D8 = 0x1B;
    }

    connectScreen->unkF6 = 0;
    connectScreen->unkFA = 0;
}


void sub_805B9A4(void);
u32 gUnknown_03005410[4];

// multiplayerNames
u16 gUnknown_03005460[4][6];

u32 gUnknown_03005434;
u8 gUnknown_030055B8;
void sub_805B4C0(void);
void sub_805B454(void);

#define SIO_MULTI_CNT ((volatile struct SioMultiCnt *)REG_ADDR_SIOCNT)

// https://decomp.me/scratch/EfwxS
NONMATCH("asm/non_matching/sub_805ADAC.inc", void sub_805ADAC()) {
    s32 i;
    s32 x;
    s32 var1 = 0;
    s32 var2 = 0;
    u8 var3 = 0;
    bool8 r4 = FALSE;
    bool8 bool1 = FALSE;
    bool8 bool2 = FALSE;
    bool8 bool3 = TRUE;
    struct MultiplayerConnectScreen *connectScreen = TaskGetStructPtr(gCurTask, connectScreen);
    struct MultiSioData_0_0 *send, *recv;
    struct MultiSioData_0_0 *data;
    struct UNK_0808B3FC_UNK240 *r4p;

    sub_802D4CC(&connectScreen->unk0);

    if (gMultiSioStatusFlags & (MULTI_SIO_PARENT | MULTI_SIO_RECV_ID0)) {
        if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(SIO_MULTI_CNT->id))) {
            if (gUnknown_030054D4[SIO_MULTI_CNT->id]++ > 180) {
                TasksDestroyAll();
                gUnknown_03002AE4 = gUnknown_0300287C;
                gUnknown_03005390 = 0;
                gUnknown_03004D5C = gUnknown_03002A84;
                sub_805B9A4();
                return;
            }
        } else {
            gUnknown_030054D4[SIO_MULTI_CNT->id] = 0;
        }
    }

    
    if (gMultiSioStatusFlags & MULTI_SIO_CONNECTED_ID0) {
        r4 = TRUE;
    }
    
    recv = &gMultiSioRecv[0].pat0;
    if (gMultiSioStatusFlags & MULTI_SIO_HARD_ERROR
        || (r4 && !(gMultiSioStatusFlags & MULTI_SIO_RECV_ID0) && recv->unk0 != 0)) {
        if (++connectScreen->unkFD >= 9) {
            TasksDestroyAll();
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gUnknown_03004D5C = gUnknown_03002A84;
            sub_805B9A4();
            return;
        }
    } else {
        connectScreen->unkFD = 0;
    }
    
    for (i = 0; i < 4; i++) {
        data = &gMultiSioRecv[i].pat0;
        connectScreen->unkEE[i] <<= 1;
        connectScreen->unkF2[i] <<= 1;
        if (i == SIO_MULTI_CNT->id || 
            (gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i) && 
             data->unk0 > 0x400F)) {
            connectScreen->unkEE[i] |= 1;
            var1++;
            var3 |= MULTI_SIO_RECV_ID(i);
            if (bool1) {
                bool2 = TRUE;
            }
            gUnknown_03005410[i] = data->unk4;
            gUnknown_03005460[i][0] = data->unk8[0];
            gUnknown_03005460[i][1] = data->unk8[1];
            gUnknown_03005460[i][2] = data->unk8[2];
            gUnknown_03005594 |= data->unkE;

            if (gUnknown_030054D8 < data->unkF) {
                gUnknown_030054D8 = data->unkF;
            }

            
        } else {
            u16 a = ((vu16 *)(REG_ADDR_SIOMULTI0))[i];
            bool1 = TRUE;
            if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i)) && a == 0) {
                bool2 = TRUE;
                connectScreen->unkF2[i] |= 1;

                if (connectScreen->unkEE[i] == 0) {
                    bool2 = TRUE;
                    bool3 = FALSE;
                }
            } else {
                if (connectScreen->unkF2[i] != 0
                    || (gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i) && data->unk0 < 0x4010)) {
                    bool2 = TRUE;
                    bool3 = FALSE;
                }
            }
        }
        if (connectScreen->unkEE[i] != 0) {
            var2++;
        }
    }

    if (var2 == 0) {
        var2 = 1;
    }

    if (connectScreen->unkFA == 0) {
        if (!(gMultiSioStatusFlags & MULTI_SIO_PARENT) && gMultiSioStatusFlags & MULTI_SIO_RECV_ID0 && recv->unk0 > 0x4010) {
            TasksDestroyAll();
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gUnknown_03004D5C = gUnknown_03002A84;
            sub_805B9A4();
            return;
        }
        connectScreen->unkFA = 1;
    }

    if (!bool2 && recv->unk0 == 0x4011 && connectScreen->unkFA != 0) {
        gUnknown_03005434 = recv->unk10;
        gUnknown_030055B8 = recv->unk2;
        for (i = 0; i < 4; i++) {
            
            if ((gUnknown_030055B8 >> i) & 1) {
                if (i == 0) {
                    gUnknown_03005410[0] = recv->unk4;
                    // Reg swap on this, should be r4, but is r6
                    gUnknown_03005460[0][0] = recv->unk8[0];
                    gUnknown_03005460[0][1] = recv->unk8[1];
                    gUnknown_03005460[0][2] = recv->unk8[2];
                    gUnknown_03005594 |= recv->unkE;
                    if (gUnknown_030054D8 < recv->unkF) {
                        gUnknown_030054D8 = recv->unkF;
                    }
                    continue;
                }
                data = &gMultiSioRecv[i].pat0;
#ifndef NONMATCHING
                asm("":::"r2");
#endif
                if (data->unk0 != 0x4010) {
                    continue;
                }
    
                gUnknown_03005410[i] = data->unk4;
                gUnknown_03005460[i][0] = data->unk8[0];
                gUnknown_03005460[i][1] = data->unk8[1];
                gUnknown_03005460[i][2] = data->unk8[2];
                gUnknown_03005594 |= data->unkE;
                if (gUnknown_030054D8 < data->unkF) {
                    gUnknown_030054D8 = data->unkF;
                }
            }
        }
        connectScreen->unkE8 = 0;
        connectScreen->unkF6 = 0;
        gUnknown_030054D4[3] = 0;
        gUnknown_030054D4[2] = 0;
        gUnknown_030054D4[1] = 0;
        gUnknown_030054D4[0] = 0;
        connectScreen->unkFB = 0;
        gCurTask->main = sub_805B4C0;
        sub_805B4C0();
        return;
    }

    if (recv->unk0 >= 0x4013) {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        sub_805B9A4();
        return;
    }
    
    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            send = &gMultiSioSend.pat0;
            send->unk0 = 0;
            connectScreen->unkE8 = 0;
            gCurTask->main = sub_805B454;
            return;
        }

        gMultiSioEnabled = FALSE;
        MultiSioStop();
        MultiSioInit(0);
        send = &gMultiSioSend.pat0;
        send->unk0 = 0;
        gUnknown_03004D80[0] = 0;

        gUnknown_03002280[0] = 0;
        gUnknown_03002280[1] = 0;
        gUnknown_03002280[2] = 0xff;
        gUnknown_03002280[3] = 32;
        CreateMultiplayerModeSelectScreen();
        TaskDestroy(gCurTask);
        return;
    }

    if ((gMultiSioStatusFlags & MULTI_SIO_PARENT) && var2 > 1 && bool3) {
        r4p = &connectScreen->unk3C;
        sub_8004558(r4p);
        sub_80051E8(r4p);
    }
    
    if (var2 > 1) {
        r4p = &connectScreen->unk6C;
        r4p->unkA = 0x432;
        r4p->unk20 = var2 + 6;
        r4p->unk21 = 0xFF;
        sub_8004558(r4p);
        sub_80051E8(r4p);
    }
    r4p = &connectScreen->unkC;
    sub_80051E8(r4p);

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        if ((!bool2 && var1 > 1 && gPressedKeys & START_BUTTON) || (connectScreen->unkF6 != 0 && !bool2 && var1 > 1)) {
            send = &gMultiSioSend.pat0;
            send->unk0 = 0x4011;
            send->unk2 = var3;
            send->unk4 = gLoadedSaveGame->unk0;
            send->unk10 = connectScreen->unkDC;
            for (x = 0; x < 3; x++) {
                send->unk8[x] = gLoadedSaveGame->unk20[x];
            }
            send->unkE = gUnknown_03005594;
            send->unkF = gUnknown_030054D8;
            connectScreen->unkF6 = 1;
            connectScreen->unkFC = 0;
            return;
        }
    }

    if (connectScreen->unkF6 != 0) {
        connectScreen->unkF6 = 0;
        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            connectScreen->unkFC = 1;
        }
    }
    send = &gMultiSioSend.pat0;
    send->unk0 = 0x4010;
    send->unk4 = gLoadedSaveGame->unk0;
    for (x = 0; x < 3; x++) {
        send->unk8[x] = gLoadedSaveGame->unk20[x];
    }
    send->unkE = gUnknown_03005594;
    send->unkF = gUnknown_030054D8;
}
END_NONMATCH

void sub_805B454(void) {
    struct MultiplayerConnectScreen* connectScreen = TaskGetStructPtr(gCurTask, connectScreen);
    gMultiSioSend.pat0.unk0 = 0;
    if (++connectScreen->unkE8 > 4) {
        gMultiSioEnabled = FALSE;
        MultiSioStop();
        MultiSioInit(0);
        gUnknown_03004D80[0] = 0;
        gUnknown_03002280[0] = 0;
        gUnknown_03002280[1] = 0;
        gUnknown_03002280[2] = 0xFF;
        gUnknown_03002280[3] = 32;
        CreateMultiplayerModeSelectScreen();
        TaskDestroy(gCurTask);
    }
}
