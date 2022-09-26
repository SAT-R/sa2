#include "global.h"
#include "main.h"
#include "multiplayer_lobby.h"
#include "task.h"
#include "sprite.h"
#include "transition.h"
#include "m4a.h"
#include "constants/songs.h"
#include "save.h"
#include "malloc_vram.h"
#include "multiplayer_multipak_connection.h"
#include "title_screen.h"
#include "character_select.h"

struct MultiplayerLobbyScreen {
    struct UNK_0808B3FC_UNK240 unk0;
    struct UNK_0808B3FC_UNK240 unk30[3];
    struct Unk_03002400 unkC0;
    struct UNK_802D4CC_UNK270 unk100;
    u8 unk10C;
    u8 unk10D;
    u16 unk10E;
    u8 unk110;
    u8 unk111;
} /* size 0x114 */;

extern const struct UNK_080E0D64 gUnknown_080E02EC[12];

void sub_8087644(void);
void sub_8087F10(struct Task*);
void sub_8087478(struct MultiplayerLobbyScreen*);

void sub_8087400(void) {
    struct Task* t = TaskCreate(sub_8087644, 0x114, 0x1000, 0, sub_8087F10);
    struct MultiplayerLobbyScreen* lobbyScreen = TaskGetStructPtr(t);

    lobbyScreen->unk10C = 0;
    lobbyScreen->unk10D = 0;
    lobbyScreen->unk10E = 0;
    lobbyScreen->unk110 = 0;
    lobbyScreen->unk111 = 0;
    sub_8087478(lobbyScreen);
    sub_802D4CC(&lobbyScreen->unk100);
    m4aSongNumStart(MUS_VS_4);
}

void sub_8087478(struct MultiplayerLobbyScreen* lobbyScreen) {
    u8 i;
    struct UNK_0808B3FC_UNK240* element;
    struct Unk_03002400* background;
    struct UNK_802D4CC_UNK270* transitionConfig;
    s8 lang = gLoadedSaveGame->unk6 - 1;

    if (lang < 0) {
        lang = 0;
    }

    // So dumb
    i = 0;

    // Has to match this way
    gDispCnt = 1;
    gDispCnt |= 0x1141;

    gBgCntRegs[0] = 0x1E01;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xFF;
    gUnknown_03002280[3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xFF;
    gUnknown_03002280[7] = 0x20;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xFF;
    gUnknown_03002280[11] = 0x20;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;    
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;

    background = &lobbyScreen->unkC0;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x73;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 0;
    sub_8002A3C(background);

    element = &lobbyScreen->unk0;
    element->unk4 = VramMalloc(0x38);
    element->unkA = 0x450;
    element->unk20 = 3;
    element->unk21 = 0xFF;
    element->unk16 = 0x78;
    element->unk18 = 0x6E;
    element->unk1A = 0xC0;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk10 = 0x1000;
    sub_8004558(element);

    for (i = 0; i < 3; i++) {
        element = &lobbyScreen->unk30[i];
        element->unk4 = VramMalloc(gUnknown_080E02EC[lang * 3 + i].unk0);
        element->unkA = gUnknown_080E02EC[lang * 3 + i].unk4;
        element->unk20 = gUnknown_080E02EC[lang * 3 + i].unk6;
        element->unk21 = 0xFF;
        element->unk16 = 0x78;
        element->unk18 = 0x24;
        element->unk1A = 0x100;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk10 = 0;
        sub_8004558(element);
    }

    lobbyScreen->unk100.unk0 = 1;
    lobbyScreen->unk100.unk4 = 0;
    lobbyScreen->unk100.unk2 = 2;
    lobbyScreen->unk100.unk6 = 0x200;
    lobbyScreen->unk100.unk8 = 0x3FFF;
    lobbyScreen->unk100.unkA = 0;
}

void sub_808782C(void);
void sub_8087E10(struct MultiplayerLobbyScreen*);

void sub_8087644(void) {
    u8 i;
    struct MultiplayerLobbyScreen* lobbyScreen = TaskGetStructPtr(gCurTask);
    union MultiSioData* send;
    MultiPakHeartbeat();
    
    if (lobbyScreen->unk10C != 0 && gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        send = &gMultiSioSend;
        send->pat0.unk3 = 0;
        send->pat0.unk2 = lobbyScreen->unk10D;
        send->pat0.unk0 = 0x40A3;
    } else if (lobbyScreen->unk10C == 0) {
        send = &gMultiSioSend;
        send->pat0.unk3 = 0;
        send->pat0.unk2 = lobbyScreen->unk10D;
        send->pat0.unk0 = 0x40A0; 
    }

    if (lobbyScreen->unk10E == 0) {
        if (sub_802D4CC(&lobbyScreen->unk100) == 1) {
            if (lobbyScreen->unk10C != 0) {
                TaskDestroy(gCurTask);
                if (lobbyScreen->unk10D != 0) {
                    gMultiSioEnabled = FALSE;
                    MultiSioStop();
                    MultiSioInit(0);
                    CreateTitleScreenAndSkipIntro();
                    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                        gUnknown_030055A0[i] = 0;
                    }

                    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                        gMultiplayerCharacters[i] = 0;
                        gUnknown_030054B4[i] = 0;
                        gUnknown_030054D4[i] = 0;
                    }

                    return;
                }
                CreateCharacterSelectionScreen(0, gUnknown_03005594 & 0x10);
                return;
            }

            gCurTask->main = sub_808782C;
            lobbyScreen->unk10C = 1;
        }
    } else if (--lobbyScreen->unk10E > 0x78) {
        lobbyScreen->unk10E = 0x78;
    }

    sub_8087E10(lobbyScreen);
}

u8 sub_8087F8C(union MultiSioData*);
void sub_8087C98(void);
void sub_8087AE0(void);

void sub_808782C(void) {
    u8 i;
    struct MultiplayerLobbyScreen* lobbyScreen = TaskGetStructPtr(gCurTask);
    register union MultiSioData *recv asm("r4"), *send;
    struct UNK_0808B3FC_UNK240* element = &lobbyScreen->unk0;
    MultiPakHeartbeat();

    recv = &gMultiSioRecv[0];
    if (sub_8087F8C(recv) != 0) {
        return;
    }

    if (!(gMultiSioStatusFlags & MULTI_SIO_PARENT) && (recv->pat0.unk0 == 0x40A0 || recv->pat0.unk0 == 0x40A1)) {
        lobbyScreen->unk10D = recv->pat0.unk2;
        if (recv->pat0.unk3 != 0) {
            lobbyScreen->unk10E = 0;
            lobbyScreen->unk110 = 7;
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);
            
            if (lobbyScreen->unk10D != 0) {
                if (element->unk20 != 5) {
                    element->unkA = 0x450;
                    element->unk20 = 4;
                    element->unk21 = 0xFF;
                }

            } else {
                if (element->unk20 != 3) {
                    element->unkA = 0x450;
                    element->unk20 = 6;
                    element->unk21 = 0xFF;
                }
            }
        }
    }
    send = &gMultiSioSend;
    send->pat0.unk3 = 0;
    send->pat0.unk0 = 0x40A0;
    

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
            send->pat0.unk0 = 0x40A1;
        } else if (gPressedKeys & DPAD_LEFT) {
            lobbyScreen->unk110 = 7;
            lobbyScreen->unk10E = 0;
            lobbyScreen->unk10D = 0;

            if (element->unk20 != 3) {
                element->unkA = 0x450;
                element->unk20 = 6;
                element->unk21 = 0xFF;
            }
            send->pat0.unk3 = 1;
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        } else if (gPressedKeys & DPAD_RIGHT) {
            lobbyScreen->unk110 = 7;
            lobbyScreen->unk10E = 0;
            lobbyScreen->unk10D = 1;
            
            if (element->unk20 != 5) {
                element->unkA = 0x450;
                element->unk20 = 4;
                element->unk21 = 0xFF;
            }
            send->pat0.unk3 = 1;
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        }
    }
    send->pat0.unk2 = lobbyScreen->unk10D;
    recv = &gMultiSioRecv[0];
    if (sub_8087F8C(recv) == 0) {
        if (recv->pat0.unk0 == 0x40A1) {
            if (recv->pat0.unk2 > 1) {
                recv->pat0.unk2 = 1;
            }
            m4aSongNumStart(SE_SELECT);
            lobbyScreen->unk10E = 0;

            if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
                gCurTask->main = sub_8087AE0;
            } else {
                gCurTask->main = sub_8087C98;
            }
        }

        if (++lobbyScreen->unk10E == 600) {
            element->unk20 = 1;
        }

        sub_8087E10(lobbyScreen);
    };
}
