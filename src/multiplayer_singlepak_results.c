#include "global.h"
#include "main.h"
#include "game.h"
#include "multiplayer_singlepak_connection.h"
#include "multiplayer_multipak_connection.h"
#include "multiplayer_singlepak_results.h"
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

struct MultiplayerSinglePakResultsScreen_UNK80 {
    struct UNK_0808B3FC_UNK240 unk0;
    u8 filler30[8];
};

struct MultiplayerSinglePakResultsScreen {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    struct MultiplayerSinglePakResultsScreen_UNK80 unk80[4];
    struct UNK_0808B3FC_UNK240 unk160[4];
    u8 unk220[288];
    struct UNK_0808B3FC_UNK240 unk340;
    struct UNK_0808B3FC_UNK240 unk370[3];
    struct UNK_0808B3FC_UNK240 unk400;
    u16 unk430;
    u16 unk432;
    u32 unk434;
    u8 unk438;
    u8 filler439[3];
    u32 unk43C;
}; /* size 0x440 */

extern const u8 gUnknown_08C88408[0x2000];
extern const u8 gUnknown_08C92208[0x3400];

struct MultiplayerSinglePakResultsScreen* sub_8082B1C(s16);

void sub_8081FB0(void);
void sub_8082038(struct MultiplayerSinglePakResultsScreen*);
void sub_8082B80(struct MultiplayerSinglePakResultsScreen*);
void sub_8082C58(struct MultiplayerSinglePakResultsScreen*);
void sub_8082CB4(struct MultiplayerSinglePakResultsScreen*);
void sub_8082BF8(struct MultiplayerSinglePakResultsScreen*);

struct UNK_02003300 {
    union Unk_03002E60* unk0;
} /* Unknown length */;

void CreateMultiplayerSinglePakResultsScreen(u32 a) {
    struct MultiplayerSinglePakResultsScreen* resultsScreen;
    const u8* unk408 = gUnknown_08C88408;
    const u8* unk92208 = gUnknown_08C92208;

    gUnknown_030054D4[3] = 0;
    gUnknown_030054D4[2] = 0;
    gUnknown_030054D4[1] = 0;
    gUnknown_030054D4[0] = 0;
    gWinRegs[4] = 0;
    gWinRegs[5] = 0;
    gWinRegs[0] = 0;
    gWinRegs[2] = 0;
    gWinRegs[1] = 0;
    gWinRegs[3] = 0;
    gUnknown_03005424 = 0;
    gMultiSioEnabled = TRUE;
    gFlags &= ~0x4000;
    m4aSoundVSyncOn();
    gGameMode = 5;

    CpuFastCopy(unk92208, (void*)VRAM, 0x80 << 0x8);
    CpuFastCopy(unk408, (void*)EWRAM_START + 0x33000, 0xd0 << 0x8);
    gUnknown_03002260 = ((struct UNK_02003300*)(EWRAM_START + 0x33000))->unk0;
    gUnknown_030053EC = gLoadedSaveGame->unk6;

    sub_8081FB0();
    resultsScreen = sub_8082B1C(a);
    sub_8082038(resultsScreen);
    sub_8082B80(resultsScreen);
    sub_8082BF8(resultsScreen);

    if (a != 0) {
        sub_8082C58(resultsScreen);
        m4aSongNumStart(MUS_VS_LOBBY);
    } else {
        sub_8082CB4(resultsScreen);
        m4aSongNumStart(MUS_VS_SELECT_PAK_MODE);
    }

    gBldRegs.bldCnt = 0;
    gBldRegs.bldAlpha = 0;
    gBldRegs.bldY = 0;
}

void sub_8081FB0(void) {
    gDispCnt = 0x40;
    gBgCntRegs[3] = 0x5e0b;
    gBgCntRegs[2] = 0x1c0c;
    gUnknown_03004D80[2] = 0x7f;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xff;
    gUnknown_03002280[11] = 32;
    gUnknown_03004D80[3] = 0xff;
    gUnknown_03002280[12] = 0;
    gUnknown_03002280[13] = 0;
    gUnknown_03002280[14] = 0xff;
    gUnknown_03002280[15] = 64;

    DmaFill32(3, 0, (void*)VRAM + 0x9FE0, 65);
    DmaFill32(3, 0, (void*)VRAM + 0xCFE0, 65);
}

void sub_8082038(struct MultiplayerSinglePakResultsScreen* screen) {
    struct Unk_03002400* background = &screen->unk0;
    background->unk4 = BG_SCREEN_ADDR(16);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 5;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1e;
    background->unk28 = 0x19;
    background->unk2A = 0;
    background->unk2E = 3;
    sub_8002A3C(background);
}

extern void sub_80078D4(u8, u8, u8, u16, u16);

void sub_80823FC(void);

void sub_808207C(void) {
    u32 i;
    struct UNK_0808B3FC_UNK240* element;
    struct MultiplayerSinglePakResultsScreen* resultsScreen;
    gDispCnt |= 0x1800;
    gUnknown_030055B8 = ((gMultiSioStatusFlags & MULTI_SIO_ALL_CONNECTED) >> 8);
    MultiPakHeartbeat();


    gMultiSioSend.pat0.unk0 = 0x4010;
    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        gMultiSioSend.pat0.unk3 = gUnknown_030053EC;
    }

    resultsScreen = TaskGetStructPtr(gCurTask);
#ifndef NON_MATCHING
    while(0);
#endif
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;

    if (++resultsScreen->unk430 > 0xF0) {
        gFlags &= ~0x8000;

        if (resultsScreen->unk434) {
            for (i = 0; i < 3; i++) {
#ifndef NON_MATCHING
                s32 var;
#endif
                element = &resultsScreen->unk370[i];
                element->unk4 = (void*)(OBJ_VRAM0 + 0x2500 + (i * 0x180));

                element->unk16 = 0;
                element->unk18 = 0;
                element->unk1A = 0x100;
                element->unk8 = 0;
#ifndef NONMATCHING
                var = 0x44c;
                asm(""::"r"(var));
#endif
                if (gUnknown_030053EC == 1) {
                    element->unkA = 0x44B;
                } else {
                    element->unkA = 0x44C;
                }
                
                element->unk20 = i;
                element->unk14 = 0;
                element->unk1C = 0;
                element->unk21 = 0xFF;
                element->unk22 = 0x10;
                element->unk25 = 0;
                element->unk10 = 0x1000;
                sub_8004558(element);
            }
        }

        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            element = &resultsScreen->unk400;
            element->unk16 = 0x78;
            element->unk18 = 0x50;

            if (resultsScreen->unk434) {
                element->unk4 = resultsScreen->unk370[2].unk4 + 0x180;
            } else {
                element->unk4 = resultsScreen->unk340.unk4 + 0x180;
            }
            element->unk1A = 0;
            element->unk8 = 0;
            if (gUnknown_030053EC == 1) {
                element->unkA = 0x452;
            } else {
                element->unkA = 0x453;
            }
            element->unk20 = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk21 = 0xFF;
            element->unk22 = 0x10;
            element->unk25 = 0;
            element->unk10 = 0;
            sub_8004558(element);
        }
        resultsScreen->unk430 = 0;
        gCurTask->main = sub_80823FC;
        sub_80823FC();
    } else {
#ifndef NON_MATCHING
        // This is wrong, just here to make asm correct here
        resultsScreen++; 
        while(0);
        resultsScreen--;
#endif
    
        for (i = 0; i < 4; i++) {
            if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i + 8))) {
                if (gUnknown_030054B4[i] & 1) {
                    sub_80078D4(3, i * 40, (i + 1) * 40, 0xF0 - resultsScreen->unk430, 0xA0 - i * 0x28);
                } else {
                    sub_80078D4(3, i * 40, (i + 1) * 40, resultsScreen->unk430 - 0xF0, 0xA0 - i * 0x28);
                }
            } else {
                 if (gUnknown_030054B4[i] & 1) {
                    sub_80078D4(3, gUnknown_030054B4[i] * 40, (gUnknown_030054B4[i] + 1) * 40, 0xF0 - resultsScreen->unk430, (i * 5 - gUnknown_030054B4[i] * 5) * 8);
                } else {
                    sub_80078D4(3, gUnknown_030054B4[i] * 40, (gUnknown_030054B4[i] + 1) * 40, resultsScreen->unk430 - 0xF0, (i * 5 - gUnknown_030054B4[i] * 5) * 8);
                }
            }
        }
    }
}

void sub_8082AA8(void);
void sub_8082630(void);
void sub_8082788(void);

void sub_80823FC(void) {
    struct Unk_03002400* background;
    u32 i;
    s32 val2 = 0;
    u8 val = FALSE;
    struct MultiplayerSinglePakResultsScreen* resultsScreen = TaskGetStructPtr(gCurTask);
    union MultiSioData* packet;

    gUnknown_030055B8 = ((gMultiSioStatusFlags & MULTI_SIO_ALL_CONNECTED) >> 8);
    packet = &gMultiSioRecv[0];
    if (packet->pat0.unk0 == 0x4012) {
        gSelectedCharacter = SIO_MULTI_CNT->id;
        if (!resultsScreen->unk434) {
            background = &resultsScreen->unk40;
            gBgScrollRegs[2][0] = 0;
            gBgScrollRegs[2][1] = 0;
            background->unk4 = BG_SCREEN_ADDR(24);
            background->unkA = 0;
            background->unkC = BG_SCREEN_ADDR(28);
            background->unk18 = 0;
            background->unk1A = 0;
            background->unk1C = 6;
            switch (gUnknown_030053EC) {
                case 0:
                    background->unk1E = 0;
                    background->unk20 = 4;
                    break;
                case 1:
                    background->unk1E = 0;
                    background->unk20 = 0;
                    break;
                case 2:
                default:
                    background->unk1E = 0;
                    background->unk20 = 4;
                    break;
            }
            background->unk22 = 6;
            background->unk24 = 8;
            background->unk26 = 0x12;
            background->unk28 = 4;
            background->unk2A = 0;
            background->unk2E = 2;
            sub_8002A3C(background);
        }

        gDispCnt |= 0x400;
        resultsScreen->unk430 = 0;
        if (resultsScreen->unk434) {
            gBldRegs.bldCnt = 0xFF;
            gCurTask->main = sub_8082630;
            sub_8082630();
        } else {
            gCurTask->main = sub_8082AA8;
            sub_8082AA8();
        }
    } else {
        sub_8082788();

        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            sub_80051E8(&resultsScreen->unk400);
        }


        for (i = 0; i < 4 && GetBit(gUnknown_030055B8, i); i++) {
            if (!(MULTI_SIO_RECV_ID(i) & gMultiSioStatusFlags)) {
                val = TRUE;
            } else {
                packet = &gMultiSioRecv[i];
                if (i == SIO_MULTI_CNT->id || packet->pat0.unk0 == 0x4010) {
                    val2++;
                }
            }
        }
        packet = &gMultiSioSend;
        packet->pat0.unk0 = 0x4010;
        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            packet->pat0.unk3 = gUnknown_030053EC;
        }

        if ((gMultiSioStatusFlags & MULTI_SIO_PARENT && gPressedKeys & START_BUTTON && !val && val2 > 1) || resultsScreen->unk438) {
            resultsScreen->unk438 = 1;
            packet->pat0.unk0 = 0x4012;
        }
    }
}

void sub_808267C(void);
void sub_8082788(void);

void sub_8082630(void) {
    struct MultiplayerSinglePakResultsScreen* resultsScreen = TaskGetStructPtr(gCurTask);
    resultsScreen->unk430 += 0x20;
    sub_8082788();

    if (resultsScreen->unk430 > 0x1000) {
        resultsScreen->unk430 = 0x1000;
        // irrelevant
        gBldRegs.bldY = 0x10;
        gCurTask->main = sub_808267C;
    }

    gBldRegs.bldY = resultsScreen->unk430 >> 8;
}

void sub_808267C(void) {
    union MultiSioData* packet;
    struct MultiplayerSinglePakResultsScreen* resultsScreen = TaskGetStructPtr(gCurTask);

    packet = &gMultiSioRecv[0];

    if (packet->pat3.unk0 == 0x4080) {
        u32 i;
        gUnknown_03005434 = packet->pat3.unk8;

         for (i = 0; i < 4; i++) {
            gMultiplayerCharacters[i] = 0;
            gUnknown_030054B4[i] = i;
        }

        gFlags &= ~4;
        if (resultsScreen->unk434) {
            TaskDestroy(gCurTask);
            CreateMultiplayerSinglePakResultsScreen(0);
        } else {
            TaskDestroy(gCurTask);
            gBldRegs.bldCnt = 0;
            gBldRegs.bldY = 0;
            sub_8081200();
            sub_801A770();
        }
        return;
    } 

    sub_8082788();
    packet = &gMultiSioSend;
    packet->pat0.unk0 = 0x4051;
    packet->pat0.unk2 = 0;

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        u8 i;
        for (i = 0; i < 4; i++) {
            if (GetBit(gUnknown_030055B8, i)) {
                packet = &gMultiSioRecv[i];
                if (packet->pat0.unk0 != 0x4051) {
                    return;
                }
            }
        }
        packet = &gMultiSioSend;
        packet->pat3.unk0 = 0x4080;
        packet->pat3.unk8 = resultsScreen->unk43C;
    }
}

extern u8 gUnknown_030053E8[4];

u32 sub_8004518(u8);

void sub_8082788(void) {
    u32 i;
    
    struct UNK_0808B3FC_UNK240* element;
    struct MultiplayerSinglePakResultsScreen* resultsScreen;

    MultiPakHeartbeat();
    resultsScreen = TaskGetStructPtr(gCurTask);

    for (i = 0; i < 4; i++) {
        if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i + 8))) {
            sub_80078D4(3, i * 40, (i + 1) * 40, 0, 0xA0 - i * 0x28);
        } else {
            sub_80078D4(3, gUnknown_030054B4[i] * 40, (gUnknown_030054B4[i] + 1) * 40, 0, i * 0x28 - gUnknown_030054B4[i] * 0x28);
            if (resultsScreen->unk434) {
                u16 temp;
                
                element = &resultsScreen->unk80[i].unk0;
                element->unk16 = 0x78; 
                element->unk18 = gUnknown_030054B4[i] * 0x28 + 0x14;
                sub_8004558(element);
                sub_80051E8(element);

                element = &resultsScreen->unk370[gMultiplayerCharacters[i]];
                element->unk16 = 0x34;
                element->unk18 = gUnknown_030054B4[i] * 0x28 + 0x14;
                sub_80051E8(element);

                // TODO: Fix type
                temp = sub_8004518(gUnknown_030053E8[i]);
                element = &resultsScreen->unk160[((temp) >> 8) & 0xF];
                
                if (element != &resultsScreen->unk160[0]) {
                    element->unk16 = 0xA0;
                    element->unk18 = gUnknown_030054B4[i] * 0x28 + 0x14;
                    sub_80051E8(element);
                }

                element = &resultsScreen->unk160[((temp) >> 4) & 0xF];

                if (element != &resultsScreen->unk160[0] || (temp > 0xFF)) {
                    element->unk16 = 0xAB;
                    element->unk18 = gUnknown_030054B4[i] * 0x28 + 0x14;
                    sub_80051E8(element);
                }

                element = &resultsScreen->unk160[(temp) & 0xF];
                element->unk16 = 0xB6;
                element->unk18 = gUnknown_030054B4[i] * 0x28 + 0x14;
                sub_80051E8(element);
            } else {
                u16 temp;
                element = &resultsScreen->unk80[i].unk0;
                element->unk16 = 0x78;
                element->unk18 = i * 0x28 + 0x14;
                sub_8004558(element);
                sub_80051E8(element);

                if (gUnknown_03005428[i] > 99) {
                    temp = 99;
                } else {
                    temp = sub_8004518(gUnknown_03005428[i]);   
                }

                element = &resultsScreen->unk160[((temp) >> 4)];

                if (element != &resultsScreen->unk160[0]) {
                    element->unk16 = 0xA0;
                    element->unk18 = i * 0x28 + 0x14;
                    sub_80051E8(element);
                }
                element = &resultsScreen->unk160[temp & 0xF];
                element->unk16 = 0xAB;
                element->unk18 = i * 0x28 + 0x14;
                sub_80051E8(element);

                element = &resultsScreen->unk340;
                element->unk16 = 0xC5;
                element->unk18 = i * 0x28 + 0x14;
                sub_80051E8(element);
            }
        }
    }
}
