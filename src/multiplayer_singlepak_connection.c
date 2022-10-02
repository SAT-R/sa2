#include "global.h"
#include "main.h"
#include "game.h"
#include "multiplayer_singlepak_connection.h"
#include "multiplayer_multipak_connection.h"
#include "multiplayer_mode_select.h"
#include "task.h"
#include "sprite.h"
#include "save.h"
#include "title_screen.h"
#include "transition.h"
#include "m4a.h"
#include "constants/text.h"
#include "constants/songs.h"
#include "multi_boot.h"
#include "sio32_multi_load.h"

struct SinglePakConnectScreen {
    struct UNK_802D4CC_UNK270 unk0;
    struct UNK_0808B3FC_UNK240 unkC;
    struct UNK_0808B3FC_UNK240 unk3C;
    struct UNK_0808B3FC_UNK240 unk6C;
    struct Unk_03002400 unk9C;
    void* unkDC;
    u32 unkE0;
    u32 unkE4;
    u32 unkE8;
    u16 unkEC;
    u32 unkF0;
    u32 unkF4;
    u8 unkF8;
    u8 unkF9;
    u8 unkFA;
    u8 fillerFB;
};

#define SomeSioCheck() ((*(vu8 *)REG_ADDR_SIOCNT) & SIO_ID)

void sub_8081200(void) {
    u8 i;
    u8* gameMode = &gGameMode;
    u8 val = 5;
    
    gUnknown_030059D8 = 0;
    gUnknown_03005844 = NULL;
    gUnknown_03005848 = 0;
    gUnknown_030059E0.unk8C = 0;
    gUnknown_03005960.unk5C = 0;
    gUnknown_0300543C = 0;
    *gameMode = val;
    gUnknown_030054DC = 0;

    for (i = 0; i < 4; i++) {
        gUnknown_030055A0[i] = NULL;
    };

    sub_801A6D8();
    gUnknown_03005424 &= ~0x1;
    gUnknown_030059E0.unk20 &= ~0x200000;
    gUnknown_030059E0.unk5C |= gUnknown_03005B38.unk0 | gUnknown_03005B38.unk2;
}

void sub_8081604(void);

extern void* const gUnknown_080E01E0[7][2];
extern const u16 gUnknown_080E018C[7][3];
extern const u16 gUnknown_080E01B6[7][3];

void StartSinglePakConnect(void) {
    struct Task* t;
    struct SinglePakConnectScreen* connectScreen;
    struct UNK_802D4CC_UNK270* transition;
    struct UNK_0808B3FC_UNK240* element; 
    struct Unk_03002400* background;
    struct MultiBootParam* mbParams;
    u32 ram;
    gUnknown_030054D4[3] = 0;
    gUnknown_030054D4[2] = 0;
    gUnknown_030054D4[1] = 0;
    gUnknown_030054D4[0] = 0;
    gDispCnt = 0x1141;
    gBgCntRegs[0] = 0x1401;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    t = TaskCreate(sub_8081604, 0xFC, 0x2000, 0, NULL);
    connectScreen = TaskGetStructPtr(t);
    connectScreen->unkFA = gLoadedSaveGame->unk6;

    if ((u8)LanguageIndex(connectScreen->unkFA) > LanguageIndex(LANG_ITALIAN)) {
        connectScreen->unkFA = 1;
    }

    connectScreen->unkDC = gUnknown_080E01E0[connectScreen->unkFA][0];
    connectScreen->unkE0 = (u32)gUnknown_080E01E0[connectScreen->unkFA][1] - (u32)gUnknown_080E01E0[connectScreen->unkFA][0];
    connectScreen->unkF0 = 0;
    connectScreen->unkF9 = 0;
    connectScreen->unkE4 = 0;
    connectScreen->unkE8 = 0;
    connectScreen->unkEC = 0;
    
    transition = &connectScreen->unk0;
    transition->unk0 = 1;
    transition->unk4 = 0;
    transition->unk2 = 2;
    transition->unk6 = 0x100;
    transition->unk8 = 0x3FFF;
    transition->unkA = 0;
    sub_802D4CC(transition);

    ram = OBJ_VRAM0;
    element = &connectScreen->unkC;
    element->unk16 = 8;
    element->unk18 = 0x18;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0x1000;
    element->unkA = gUnknown_080E018C[connectScreen->unkFA][0];
    element->unk20 = gUnknown_080E018C[connectScreen->unkFA][1];
    element->unk21 = 0xFF;
    element->unk4 = (void*)ram;
    ram += gUnknown_080E018C[connectScreen->unkFA][2] * 0x20;
    sub_8004558(element);

    element = &connectScreen->unk3C;
    element->unk16 = 0x78;
    element->unk18 = 0x7A;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0x1000;
    element->unkA = gUnknown_080E01B6[connectScreen->unkFA][0];
    element->unk20 = gUnknown_080E01B6[connectScreen->unkFA][1];
    element->unk21 = 0xFF;
    element->unk4 = (void*)ram;
    ram += gUnknown_080E01B6[connectScreen->unkFA][2] * 0x20;

    element = &connectScreen->unk6C;
    element->unk16 = 0x78;
    element->unk18 = 0x8C;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0x1000;
    element->unkA = 0x432;
    element->unk20 = 8;
    element->unk21 = 0xFF;
    element->unk4 = (void*)ram;

    background = &connectScreen->unk9C;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(20);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x72;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 0;
    sub_8002A3C(background);
    m4aSongNumStart(MUS_CONNECTION_PENDING);

    if (!SomeSioCheck()) {
        gMultiSioEnabled = FALSE;
        mbParams = &gUnknown_03002A90;
        mbParams->masterp = connectScreen->unkDC;
        mbParams->server_type = 0;
        MultiBootInit(mbParams);
        gCurTask->main = sub_8081604;
    } else {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        MultiPakCommunicationError();
    }
}

s8 sub_8081D70(struct SinglePakConnectScreen*);
void sub_8081DF0(struct SinglePakConnectScreen*, u8);

void sub_8081AD4(struct SinglePakConnectScreen*);
void sub_8081C50(void);

void sub_8081604(void) {
    struct SinglePakConnectScreen* connectScreen = TaskGetStructPtr(gCurTask);
    s8 result;
    s32 result2;
    struct MultiBootParam* params;
    sub_802D4CC(&connectScreen->unk0);
    sub_80051E8(&connectScreen->unkC);
    result = sub_8081D70(connectScreen);

    if (SomeSioCheck()) {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        MultiPakCommunicationError();
    }

    if (gUnknown_03002A90.client_bit & 0xE) {
        if (gUnknown_03002A90.probe_count == 0 && result > 1) {
            sub_8081DF0(connectScreen, result);
            if (gPressedKeys & START_BUTTON) {
                connectScreen->unkF0 = 1;
                gFlags |= 0x8000;
                gFlags |= 0x4000;
                m4aMPlayAllStop();
                gFlags &= ~0x4;
                m4aSoundVSyncOff();
                DmaStop(0);
                DmaStop(1);
                DmaStop(2);
                DmaStop(3);
                MultiBootStartMaster(&gUnknown_03002A90, connectScreen->unkDC + 0xC0, connectScreen->unkE0 - 0xC0, 4, 1);
            }
        }
    } else {
        connectScreen->unkF0 = 0;
        gFlags &= ~0x4000;
        gFlags &= ~0x8000;
        m4aSoundVSyncOn();
    }

    if (connectScreen->unkF0 == 0 && gPressedKeys & B_BUTTON) {
        m4aSongNumStop(MUS_CONNECTION_PENDING);
        m4aSongNumStart(SE_RETURN);
        TaskDestroy(gCurTask);
        CreateMultiplayerModeSelectScreen();
        return;
    }

    result2 = MultiBootMain(&gUnknown_03002A90);
    if (result2 == 0x50 || result2 == 0x60 || result2 == 0x70 || result2 == 0x71) {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        gFlags &= ~0x4000;
        gFlags &= ~0x8000;
        m4aSoundVSyncOn();
        MultiPakCommunicationError();
        return;
    }

    if (MultiBootCheckComplete(&gUnknown_03002A90)) {
        union MultiSioData *send, *recv, *recv0, *recv1, *recv2, *recv3;
        sub_8081AD4(connectScreen);
        connectScreen->unkF9 = 0;
        send = &gMultiSioSend;
        send->pat2.unk0 = 0;
    
        recv0 = &gMultiSioRecv[0];
        recv0->pat2.unk0 = 0;
        recv1 = &gMultiSioRecv[1];
        recv1->pat2.unk0 = 0;
        recv2 = &gMultiSioRecv[2];
        recv2->pat2.unk0 = 0;
        recv3 = &gMultiSioRecv[3];
        recv3->pat2.unk0 = 0;
        
        send->pat0.unk2 = 0;
        send->pat0.unk0 = 0xF001;
        
        recv0->pat2.unk2 = 0;
        recv1--; recv1++;
        recv0++;
        recv1->pat2.unk2 = 0;
        recv2->pat2.unk2 = 0;
        recv3->pat2.unk2 = 0;
        gCurTask->main = sub_8081C50;
    }
}

void sub_8081D04(void);
void sub_8081D58(void);

u32 sub_8081E38(struct SinglePakConnectScreen*, u32);

void sub_80818B8(void) {
    u16 i, j;
    u32 temp;
    struct SinglePakConnectScreen* connectScreen = TaskGetStructPtr(gCurTask);
    if (gMultiSioStatusFlags & MULTI_SIO_LD_REQUEST && connectScreen->unkF9 < 9) {
        gCurTask->main = sub_8081D04;
    }

    if (gMultiSioStatusFlags & MULTI_SIO_LD_ENABLE) {
        connectScreen->unkF8 = 1;
    }

    gMultiSioSend.pat2.unk0 = connectScreen->unkFA;
    gMultiSioStatusFlags = MultiSioMain(&gMultiSioSend, &gMultiSioRecv, connectScreen->unkF8);

    if (connectScreen->unkF4 == 0) {
        MultiSioStart();
        connectScreen->unkF4 = 1;
    }

    temp = ((gMultiSioStatusFlags & (MULTI_SIO_CONNECTED_ID0 | MULTI_SIO_CONNECTED_ID1 | MULTI_SIO_CONNECTED_ID2 | MULTI_SIO_CONNECTED_ID3)) >> 8);

    for (i = 1; i < 4; i++) {
        if (sub_8081E38(connectScreen, i) == 0) {
            TasksDestroyAll();
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gUnknown_03004D5C = gUnknown_03002A84;
            gFlags &= ~0x4000;
            gFlags &= ~0x8000;
            m4aSoundVSyncOn();
            MultiPakCommunicationError();
            return;
        }

        if (temp << i) {
            union MultiSioData* recv = &gMultiSioRecv[i];
            if (recv->pat0.unk0 == 0x4010) {
                for (j = 0; j < 4; j++) {
                    gMultiplayerCharacters[j] = 0;
                    gUnknown_03005428[j] = 0;
                    gUnknown_030054B4[j] = j;
                    gUnknown_030054D4[j] = 0;
                }
                gCurTask->main = sub_8081D58;
                gDispCnt = 0x40;
                return;
            }
        }
    }

    if (connectScreen->unkF9 != gMultiSioRecv[0].pat0.unk2) {
        connectScreen->unkF9 = gMultiSioRecv[0].pat0.unk2;
    }
}

void sub_8081C8C(void);
void sub_8081E90(struct SinglePakConnectScreen*);

extern const u32 gUnknown_080E0218[7];

void sub_8081A5C(void) {
    u32 progress = 0;
    struct SinglePakConnectScreen* connectScreen = TaskGetStructPtr(gCurTask);
    if (Sio32MultiLoadMain(&progress) != 0) {
        gCurTask->main = sub_8081C8C;
    }

    if (progress > connectScreen->unkE8) {
        connectScreen->unkE4 = connectScreen->unkE4 + (progress - connectScreen->unkE8);
        connectScreen->unkE8 = progress;
    } else if (progress < connectScreen->unkE8) {
        u32 temp;
        temp = ((connectScreen->unkE4 + 0x2000));
        temp -= connectScreen->unkE8;
        connectScreen->unkE4 = temp;
        connectScreen->unkE4 += progress;
        connectScreen->unkE8 = progress;
    }

    sub_8081E90(connectScreen);
}

void sub_8081AD4(struct SinglePakConnectScreen* connectScreen) {
    struct Unk_03002400* background;
    u16 temp;
    gDispCnt = 0x101;
    gBgCntRegs[0] = 0x1e02;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    
    background = &connectScreen->unk9C;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = gUnknown_080E0218[connectScreen->unkFA];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 0;
    sub_8002A3C(background);

    CpuFill16(0, &gBgPalette[17], 30);

    gDispCnt |= 0x2200;
    temp = 0x1f01;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gWinRegs[0] = 0x2828;
    gWinRegs[2] = 0x8890;
    gWinRegs[4] = 2;
    gWinRegs[5] = 1;
    gBgCntRegs[1] = temp;

    CpuFill16(0xF3FF, (void*)BG_SCREEN_ADDR(31), 2049);
    CpuFill16(0xFFFF, (void*)VRAM + 0x7FE0, 32);

    gBgPalette[255] = 0x1F;
    gFlags |= 1;
}