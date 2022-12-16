#include "global.h"
#include "main.h"
#include "game.h"
#include "multiplayer_singlepak_connection.h"
#include "multiplayer_singlepak_results.h"
#include "multiplayer_multipak_connection.h"
#include "multiplayer_mode_select.h"
#include "task.h"
#include "sprite.h"
#include "save.h"
#include "title_screen.h"
#include "transition.h"
#include "m4a.h"
#include "multi_boot.h"
#include "sio32_multi_load.h"
#include "mb_programs.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"
#include "constants/text.h"

struct SinglePakConnectScreen {
    struct UNK_802D4CC_UNK270 unk0;
    Sprite unkC;
    Sprite unk3C;
    Sprite unk6C;
    Background unk9C;
    void *mbProgStart;
    u32 mbProgLength;
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

#define SomeSioCheck()         ((*(vu8 *)REG_ADDR_SIOCNT) & SIO_ID)
#define MB_SUBGAME_LOADER_SIZE 0x314C

void *const gUnknown_080E0168[9] = {
    &gUnknown_08CBAC04, &gUnknown_08CC2C04, &gUnknown_08CCAC04,
    &gUnknown_08C92208, &gUnknown_08CA6760, &gUnknown_08CAD1DC,
    &gUnknown_08CB41C0, &gUnknown_08C90408, &gUnknown_08C88408,
};

static const u16 gUnknown_080E018C[7][3] = {
    [LANG_DEFAULT] = { 0, 0, 0 },
    [LANG_JAPANESE] = { SA2_ANIM_MP_MSG, 0, 90 },
    [LANG_ENGLISH] = { SA2_ANIM_MP_COMM_MSG_EN, 0, 84 },
    [LANG_GERMAN] = { SA2_ANIM_MP_COMM_MSG_DE, 0, 90 },
    [LANG_FRENCH] = { SA2_ANIM_MP_COMM_MSG_FR, 0, 90 },
    [LANG_SPANISH] = { SA2_ANIM_MP_COMM_MSG_ES, 0, 90 },
    [LANG_ITALIAN] = { SA2_ANIM_MP_COMM_MSG_IT, 0, 45 },
};

// TODO/BUG: gUnknown_080E01B6 is (likely) in the wrong order!
//           But maybe this was fixed in the PAL release?
static const u16 gUnknown_080E01B6[7][3] = {
    [LANG_DEFAULT] = { 0, 0, 0 },
    [LANG_JAPANESE] = { SA2_ANIM_PRESS_START_MSG_JP, 0, 46 },
    [LANG_ENGLISH] = { SA2_ANIM_PRESS_START_MSG_EN, 0, 34 },
    [LANG_GERMAN] = { SA2_ANIM_PRESS_START_MSG_FR, 0, 38 },
    [LANG_FRENCH] = { SA2_ANIM_PRESS_START_MSG_DE, 0, 46 },
    [LANG_SPANISH] = { SA2_ANIM_PRESS_START_MSG_IT, 0, 30 },
    [LANG_ITALIAN] = { SA2_ANIM_PRESS_START_MSG_ES, 0, 30 },
};

static void *const gUnknown_080E01E0[7][2] = {
    { NULL, NULL },
    { &gMultiBootProgram_SubgameLoader, &rom_footer },
    { &gMultiBootProgram_SubgameLoader, &rom_footer },
    { &gMultiBootProgram_SubgameLoader, &rom_footer },
    { &gMultiBootProgram_SubgameLoader, &rom_footer },
    { &gMultiBootProgram_SubgameLoader, &rom_footer },
    { &gMultiBootProgram_SubgameLoader, &rom_footer },
};

static const u32 gUnknown_080E0218[7] = {
    [LANG_DEFAULT] = 0,   [LANG_JAPANESE] = 127, [LANG_ENGLISH] = 128,
    [LANG_GERMAN] = 129,  [LANG_FRENCH] = 130,   [LANG_SPANISH] = 131,
    [LANG_ITALIAN] = 132,
};

void sub_8081200(void)
{
    u8 i;
    u8 *gameMode = &gGameMode;
    u8 val = 5;

    gUnknown_030059D8 = 0;
    gUnknown_03005844 = NULL;
    gUnknown_03005848 = 0;
    gPlayer.unk8C = 0;
    gCamera.unk5C = 0;
    gUnknown_0300543C = 0;
    *gameMode = val;
    gUnknown_030054DC = 0;

    for (i = 0; i < 4; i++) {
        gMultiplayerPlayerTasks[i] = NULL;
    };

    sub_801A6D8();
    gUnknown_03005424 &= ~0x1;
    gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
    gPlayer.unk5C |= gPlayerControls.unk0 | gPlayerControls.unk2;
}

void sub_8081604(void);

void StartSinglePakConnect(void)
{
    struct Task *t;
    struct SinglePakConnectScreen *connectScreen;
    struct UNK_802D4CC_UNK270 *transition;
    Sprite *element;
    Background *background;
    struct MultiBootParam *mbParams;
    u32 ram;
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
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

    connectScreen->mbProgStart = gUnknown_080E01E0[connectScreen->unkFA][0];
    connectScreen->mbProgLength = (u32)gUnknown_080E01E0[connectScreen->unkFA][1]
        - (u32)gUnknown_080E01E0[connectScreen->unkFA][0];
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
    element->x = 8;
    element->y = 24;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0x1000;
    element->anim = gUnknown_080E018C[connectScreen->unkFA][0];
    element->variant = gUnknown_080E018C[connectScreen->unkFA][1];
    element->unk21 = 0xFF;
    element->vram = (void *)ram;
    ram += gUnknown_080E018C[connectScreen->unkFA][2] * 0x20;
    sub_8004558(element);

    element = &connectScreen->unk3C;
    element->x = (DISPLAY_WIDTH / 2);
    element->y = (DISPLAY_HEIGHT - 38);
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0x1000;
    element->anim = gUnknown_080E01B6[connectScreen->unkFA][0];
    element->variant = gUnknown_080E01B6[connectScreen->unkFA][1];
    element->unk21 = 0xFF;
    element->vram = (void *)ram;
    ram += gUnknown_080E01B6[connectScreen->unkFA][2] * 0x20;

    element = &connectScreen->unk6C;
    element->x = (DISPLAY_WIDTH / 2);
    element->y = (DISPLAY_HEIGHT * (7. / 8.));
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0x1000;
    element->anim = SA2_ANIM_MP_MSG;
    element->variant = SA2_ANIM_VARIANT_MP_MSG_2;
    element->unk21 = 0xFF;
    element->vram = (void *)ram;

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
        mbParams = &gMultiBootParam;
        mbParams->masterp = connectScreen->mbProgStart;
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

s8 sub_8081D70(struct SinglePakConnectScreen *);
void sub_8081DF0(struct SinglePakConnectScreen *, u8);

void sub_8081AD4(struct SinglePakConnectScreen *);
void sub_8081C50(void);

void sub_8081604(void)
{
    struct SinglePakConnectScreen *connectScreen = TaskGetStructPtr(gCurTask);
    s8 result;
    s32 multiBootFlags;
    struct MultiBootParam *params;
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

    if (gMultiBootParam.client_bit & 0xE) {
        if (gMultiBootParam.probe_count == 0 && result > 1) {
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
                MultiBootStartMaster(&gMultiBootParam, connectScreen->mbProgStart + 0xC0,
                                     connectScreen->mbProgLength - 0xC0, 4, 1);
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

    multiBootFlags = MultiBootMain(&gMultiBootParam);
    if (multiBootFlags == MULTIBOOT_ERROR_NO_PROBE_TARGET
        || multiBootFlags == MULTIBOOT_ERROR_NO_DLREADY
        || multiBootFlags == MULTIBOOT_ERROR_BOOT_FAILURE
        || multiBootFlags == MULTIBOOT_ERROR_HANDSHAKE_FAILURE) {
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

    if (MultiBootCheckComplete(&gMultiBootParam)) {
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
        recv1--;
        recv1++;
        recv0++;
        recv1->pat2.unk2 = 0;
        recv2->pat2.unk2 = 0;
        recv3->pat2.unk2 = 0;
        gCurTask->main = sub_8081C50;
    }
}

void sub_8081D04(void);
void sub_8081D58(void);

bool32 sub_8081E38(struct SinglePakConnectScreen *, u16);

void sub_80818B8(void)
{
    u16 i, j;
    u32 temp;
    struct SinglePakConnectScreen *connectScreen = TaskGetStructPtr(gCurTask);
    if (gMultiSioStatusFlags & MULTI_SIO_LD_REQUEST
        && connectScreen->unkF9 < ARRAY_COUNT(gUnknown_080E0168)) {
        gCurTask->main = sub_8081D04;
    }

    if (gMultiSioStatusFlags & MULTI_SIO_LD_ENABLE) {
        connectScreen->unkF8 = 1;
    }

    gMultiSioSend.pat2.unk0 = connectScreen->unkFA;
    gMultiSioStatusFlags
        = MultiSioMain(&gMultiSioSend, &gMultiSioRecv, connectScreen->unkF8);

    if (connectScreen->unkF4 == 0) {
        MultiSioStart();
        connectScreen->unkF4 = 1;
    }

    temp = ((gMultiSioStatusFlags
             & (MULTI_SIO_CONNECTED_ID0 | MULTI_SIO_CONNECTED_ID1
                | MULTI_SIO_CONNECTED_ID2 | MULTI_SIO_CONNECTED_ID3))
            >> 8);

    for (i = 1; i < 4; i++) {
        if (!sub_8081E38(connectScreen, i)) {
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
            union MultiSioData *recv = &gMultiSioRecv[i];
            if (recv->pat0.unk0 == 0x4010) {
                for (j = 0; j < 4; j++) {
                    gMultiplayerCharacters[j] = 0;
                    gUnknown_03005428[j] = 0;
                    gUnknown_030054B4[j] = j;
                    gMultiplayerMissingHeartbeats[j] = 0;
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
void sub_8081E90(struct SinglePakConnectScreen *);

void sub_8081A5C(void)
{
    u32 progress = 0;
    struct SinglePakConnectScreen *connectScreen = TaskGetStructPtr(gCurTask);
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

void sub_8081AD4(struct SinglePakConnectScreen *connectScreen)
{
    Background *background;
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

    CpuFill16(0xF3FF, (void *)BG_SCREEN_ADDR(31), 2049);
    CpuFill16(0xFFFF, (void *)VRAM + 0x7FE0, 32);

    gBgPalette[255] = 0x1F;
    gFlags |= 1;
}

void sub_8081C0C(void)
{
    u32 i;
    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        gMultiplayerCharacters[i] = 0;
        gUnknown_03005428[i] = 0;
        gUnknown_030054B4[i] = i;
        gMultiplayerMissingHeartbeats[i] = 0;
    }

    MultiSioStart();
    CreateMultiplayerSinglePakResultsScreen(0);
}

void sub_8081DB4(struct SinglePakConnectScreen *);

void sub_8081C50(void)
{
    struct SinglePakConnectScreen *connectScreen = TaskGetStructPtr(gCurTask);
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    sub_8081DB4(connectScreen);
    gCurTask->main = sub_80818B8;
    MultiSioStart();
}

void sub_8081CC4(void);

void sub_8081C8C(void)
{
    struct SinglePakConnectScreen *connectScreen = TaskGetStructPtr(gCurTask);
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    sub_8081DB4(connectScreen);
    gCurTask->main = sub_8081CC4;
}

void sub_80818B8(void);

void sub_8081CC4(void)
{
    if (gMultiSioStatusFlags & MULTI_SIO_LD_ENABLE) {
        if (gMultiSioStatusFlags & MULTI_SIO_LD_SUCCESS) {
            gMultiSioSend.pat0.unk2 += 1;
        }
        gCurTask->main = sub_80818B8;
    }

    sub_80818B8();
}

void sub_8081D04(void)
{
    struct SinglePakConnectScreen *connectScreen = TaskGetStructPtr(gCurTask);
    MultiSioStop();
    gIntrTable[0] = Sio32MultiLoadIntr;
    Sio32MultiLoadInit(gMultiSioStatusFlags & 0x80,
                       gUnknown_080E0168[connectScreen->unkF9]);
    gCurTask->main = sub_8081A5C;
}

void sub_8081D58(void)
{
    TaskDestroy(gCurTask);
    CreateMultiplayerSinglePakResultsScreen(0);
}

s8 sub_8081D70(UNUSED struct SinglePakConnectScreen *connectScreen)
{
    u8 i;
    s8 result;

    for (result = 1, i = 1; i < MULTI_SIO_PLAYERS_MAX; i++) {
        if (GetBit(gMultiBootParam.response_bit, i)
            && GetBit(gMultiBootParam.client_bit, i)) {
            result++;
        }
    }

    return result;
}

void sub_8081DB4(struct SinglePakConnectScreen *connectScreen)
{
    gIntrTable[0] = (void *)gMultiSioIntrFuncBuf;
    MultiSioInit((gMultiSioStatusFlags & MULTI_SIO_ALL_CONNECTED) >> 8);
    connectScreen->unkF8 = 0;
    connectScreen->unkF4 = 0;
    gMultiSioStatusFlags = 0;
}

void sub_8081DF0(struct SinglePakConnectScreen *connectScreen, u8 a)
{
    sub_8004558(&connectScreen->unk3C);
    sub_80051E8(&connectScreen->unk3C);

    connectScreen->unk6C.anim = SA2_ANIM_MP_MSG;
    connectScreen->unk6C.variant = a + SA2_ANIM_VARIANT_MP_MSG_OK;
    connectScreen->unk6C.unk21 = 0xFF;

    sub_8004558(&connectScreen->unk6C);
    sub_80051E8(&connectScreen->unk6C);
}

// HeartBeatClient
bool32 sub_8081E38(struct SinglePakConnectScreen *connectScreen, u16 id)
{
    if (MULTI_SIO_RECV_ID(id + 8) & gMultiSioStatusFlags) {
        if (!(MULTI_SIO_RECV_ID(id) & gMultiSioStatusFlags)) {
            if (gMultiplayerMissingHeartbeats[id]++ > 180) {
                return FALSE;
            }
        } else {
            gMultiplayerMissingHeartbeats[id] = 0;
        }
    }

    return TRUE;
}

void sub_8081E90(struct SinglePakConnectScreen *connectScreen)
{
    u8 val = (connectScreen->unkE4 * 0xA0) / 0x12000;
    gWinRegs[0] = (val + 0x28) | 0x2800;
}
