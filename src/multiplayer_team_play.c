#include "global.h"
#include "multiplayer_team_play.h"
#include "save.h"
#include "constants/text.h"
#include "data.h"
#include "task.h"
#include "sprite.h"
#include "multi_sio.h"
#include "multiplayer_multipak_connection.h"
#include "game.h"
#include "input.h"
#include "m4a.h"
#include "constants/songs.h"
#include "flags.h"
#include "course_select.h"
#include "trig.h"

struct MultiplayerTeamPlayScreen {
    struct UNK_0808B3FC_UNK240 unk0[4];
    struct UNK_0808B3FC_UNK240 unkC0[5];
    struct UNK_0808B3FC_UNK240 unk1B0;
    struct UNK_0808B3FC_UNK240 unk1E0;
    struct Unk_03002400 unk210;
    struct Unk_03002400 unk250;
    struct Unk_03002400 unk290;
    struct Unk_03002400 unk2D0;
    s16 unk310;
    s16 unk312;
    u16 unk314;
    u8 unk316;
    u8 unk317;
    u8 filler318[6];
    u8 unk31E;
    u8 unk31F;
}; /* 0x320 */

void sub_805CB34(void);

extern const struct UNK_080E0D64 gUnknown_080D92BC[4];
extern const struct UNK_080E0D64 gUnknown_080D92DC[35];

void CreateMultiplayerTeamPlayScreen(void) {
    struct Task* t;
    struct MultiplayerTeamPlayScreen* teamPlayScreen;
    struct UNK_0808B3FC_UNK240* element;
    struct Unk_03002400* background;
    u32 lang, vram;
    u8 i;
    
    lang = gLoadedSaveGame->unk6;
    if (lang > NUM_LANGUAGES) {
        lang = LANG_JAPANESE;
    }

    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
    gUnknown_030054D4[3] = 0;
    gUnknown_030054D4[2] = 0;
    gUnknown_030054D4[1] = 0;
    gUnknown_030054D4[0] = 0;
    gDispCnt = 0x1B00;
    gDispCnt |= 0x40;
    gBgCntRegs[3] = 0x1e0d;
    gBgCntRegs[2] = 0x9608;
    gBgCntRegs[1] = 0x8e06;
    gBgCntRegs[0] = 0x8603;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xff;
    gUnknown_03002280[11] = 32;

    t = TaskCreate(sub_805CB34, 0x320, 0x3000, 0, NULL);
    teamPlayScreen = TaskGetStructPtr(t, teamPlayScreen);
    teamPlayScreen->unk310 = 0;
    teamPlayScreen->unk312 = 0;
    teamPlayScreen->unk314 = 0;
    teamPlayScreen->unk316 = 1;
    teamPlayScreen->unk317 = 0;

    for (i = 0, vram = OBJ_VRAM0; i < 4; i++) {
        element = &teamPlayScreen->unk0[i];
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk4 = (void*)vram;
        vram += gUnknown_080D92BC[i].unk0 * 0x20;
        element->unk1A = 0x100;
        element->unk8 = 0;
        element->unkA = gUnknown_080D92BC[i].unk4;
        element->unk20 = gUnknown_080D92BC[i].unk6;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk21 = 0xFF;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk28 = -1;
        element->unk10 = 0x1000;
        sub_8004558(element);
    }

    for (i = 0; i < 5; i++) {
        element = &teamPlayScreen->unkC0[i];
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk4 = (void*)vram;
        vram += gUnknown_080D92DC[i + lang * 5].unk0 * 0x20;
        element->unk1A = 0xC0;
        element->unk8 = 0;
        element->unkA = gUnknown_080D92DC[i + lang * 5].unk4;
        element->unk20 = gUnknown_080D92DC[i + lang * 5].unk6;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk21 = 0xFF;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk28 = -1;
        element->unk10 = 0;
        sub_8004558(element);
    }
    element = &teamPlayScreen->unk1B0;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk4 = (void*)vram;
    element->unk1A = 0xC0;
    element->unk8 = 0;
    element->unkA = 0x434;
    element->unk20 = 9;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;

    background = &teamPlayScreen->unk210;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(6);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x7B;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 0;
    sub_8002A3C(background);

    background = &teamPlayScreen->unk250;
    background->unk4 = BG_SCREEN_ADDR(8);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(14);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x7A;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x28;
    background->unk2A = 0;
    background->unk2E = 1;
    sub_8002A3C(background);

    background = &teamPlayScreen->unk290;
    background->unk4 = BG_SCREEN_ADDR(16);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(22);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x7C;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 10;
    background->unk2A = 0;
    background->unk2E = 3;
    sub_8002A3C(background);

    background = &teamPlayScreen->unk2D0;
    background->unk4 = BG_SCREEN_ADDR(24);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x7E;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->unk2E = 3;
    sub_8002A3C(background);
}

void sub_805CC34(void);

void sub_805D118(struct MultiplayerTeamPlayScreen*);
void sub_805D644(struct MultiplayerTeamPlayScreen*);

void sub_805CB34(void) {
    struct MultiplayerTeamPlayScreen* teamPlayScreen;

    if (gGameMode > 2) {
        u32 i;
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX && GetBit(gUnknown_030055B8, i); i++) {
            if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {
                if (gUnknown_030054D4[i]++ > 0xB4) {
                    TasksDestroyAll();
                    gUnknown_03002AE4 = gUnknown_0300287C;
                    gUnknown_03005390 = 0;
                    gUnknown_03004D5C = gUnknown_03002A84;
                    MultiPakCommunicationError();
                    return;
                }
            } else {
                gUnknown_030054D4[i] = 0;
            }
        }
    }

    teamPlayScreen = TaskGetStructPtr(gCurTask, teamPlayScreen);
    gWinRegs[5] = 0x3F;
    gBldRegs.bldCnt = 0x3F48;
    gBldRegs.bldAlpha = 0x810;
    gWinRegs[2] = 0xA0;

    if (gBgScrollRegs[1][1] < 0xA0) {
        gBgScrollRegs[1][1] += 4;
    } else {
        gBgScrollRegs[1][1] = 0xA0;
        gCurTask->main = sub_805CC34;
    }

    sub_805D118(teamPlayScreen);
    sub_805D644(teamPlayScreen);
}

void sub_805D5C8(void);

void sub_805CC34(void) {
    u8 i, j;
    u8 count;
    struct Unk_03002400* background;
    struct UNK_0808B3FC_UNK240* element;
    struct MultiplayerTeamPlayScreen* teamPlayScreen;
    union MultiSioData *msd;
    gDispCnt |= 0x400;

    if (gGameMode > 2) {
        u32 i;
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX && GetBit(gUnknown_030055B8, i); i++) {
            if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {
                if (gUnknown_030054D4[i]++ > 0xB4) {
                    TasksDestroyAll();
                    gUnknown_03002AE4 = gUnknown_0300287C;
                    gUnknown_03005390 = 0;
                    gUnknown_03004D5C = gUnknown_03002A84;
                    MultiPakCommunicationError();
                    return;
                }
            } else {
                gUnknown_030054D4[i] = 0;
            }
        }
    }

    teamPlayScreen = TaskGetStructPtr(gCurTask, teamPlayScreen);
    
    if (gMultiSioStatusFlags & MULTI_SIO_PARENT && !teamPlayScreen->unk317) {
        if (gPressedKeys & DPAD_LEFT) {
            if (teamPlayScreen->unk31E == 0) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
            }
            teamPlayScreen->unk316 = 1;
        } else {
            if (gPressedKeys & DPAD_RIGHT) {
                if (teamPlayScreen->unk31E != 0) {
                    m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                }
                teamPlayScreen->unk316 = 0;
            }
        }
    }

    count = 1;
    for (i = 0; i < 4; i++) {
        if (i != SIO_MULTI_CNT->id && GetBit(gUnknown_030055B8, i)) {
            count++;
            if (i == 0) {
                msd = gMultiSioRecv;
                if (teamPlayScreen->unk316 != msd->pat0.unk2) {
                    m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                }
                teamPlayScreen->unk316 = msd->pat0.unk2;
            }
        }
    }

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        if (gPressedKeys & A_BUTTON && teamPlayScreen->unk317 == 0) {
            teamPlayScreen->unk317 = 1;
            m4aSongNumStart(SE_SELECT);
        } else if (teamPlayScreen->unk317 != 0) {
            for (j = 1, i = 0; i < count; i++) {
                if (i != SIO_MULTI_CNT->id && GetBit(gUnknown_030055B8, i)) {
                    msd = &gMultiSioRecv[i];
                    if (msd->pat0.unk0 > 1) j++;
                }
            }

            if (count == j) {
                if (teamPlayScreen->unk316 != 0) {
                    struct Unk_03002400* background = &teamPlayScreen->unk290;

                    gUnknown_03004D80[2] = 0;
                    gUnknown_03002280[8] = 0;
                    gUnknown_03002280[9] = 0;
                    gUnknown_03002280[10] = 0xFF;
                    gUnknown_03002280[11] = 32;

                    background->unk4 = BG_SCREEN_ADDR(16);
                    background->unkA = 0;
                    background->unkC = BG_SCREEN_ADDR(22);
                    background->unk18 = 0;
                    background->unk1A = 0;
                    background->unk1C = 0x7D;
                    background->unk1E = 0;
                    background->unk20 = 0;
                    background->unk22 = 0;
                    background->unk24 = 0;
                    background->unk26 = 0x1E;
                    background->unk28 = 7;
                    background->unk2A = 0;
                    background->unk2E = 3;
                    sub_8002A3C(background);

                    gMultiSioSend.pat0.unk0 = 0x4035;
                    teamPlayScreen->unk317 = 0;
                    gGameMode = 4;
                    gCurTask->main = sub_805D5C8;
                    return;
                } else {
                    TaskDestroy(gCurTask);
                    gFlags &= ~0x4;
                    gGameMode = 3;
                    sub_80346C8(0, gUnknown_030054D8, 0);
                    gMultiSioSend.pat0.unk0 = 0x4035;
                    return;
                }                
            }
        }
    } else if ((msd = gMultiSioRecv)->pat0.unk0 == 1) {
        m4aSongNumStart(SE_SELECT);
        if (teamPlayScreen->unk316 != 0) {
            background = &teamPlayScreen->unk290;
            
            gUnknown_03004D80[2] = 0;
            gUnknown_03002280[8] = 0;
            gUnknown_03002280[9] = 0;
            gUnknown_03002280[10] = 0xFF;
            gUnknown_03002280[11] = 32;

            background->unk4 = BG_SCREEN_ADDR(16);
            background->unkA = 0;
            background->unkC = BG_SCREEN_ADDR(22);
            background->unk18 = 0;
            background->unk1A = 0;
            background->unk1C = 0x7D;
            background->unk1E = 0;
            background->unk20 = 0;
            background->unk22 = 0;
            background->unk24 = 0;
            background->unk26 = 0x1E;
            background->unk28 = 7;
            background->unk2A = 0;
            background->unk2E = 3;
            sub_8002A3C(background);

            gMultiSioSend.pat0.unk0 = 0x4035;
            teamPlayScreen->unk317 = 0;
            gGameMode = 4;
            gCurTask->main = sub_805D5C8;
            return;
        } else {
            m4aSongNumStart(SE_SELECT);
            TaskDestroy(gCurTask);
            gFlags &= ~0x4;
            gGameMode = 3;
            sub_80346C8(0, gUnknown_030054D8, 0);
            return;
        }
    }
    sub_805D118(teamPlayScreen);
    sub_805D644(teamPlayScreen);

    element = &teamPlayScreen->unkC0[0];
    element->unk16 = 0x78;
    element->unk18 = 0x1C;
    sub_80051E8(element);
    
    element = &teamPlayScreen->unkC0[2];
    element->unk16 = 0x46;
    element->unk18 = 0x34;
    if (teamPlayScreen->unk316 != 0) {
        element->unk25 = 0;
    } else {
        element->unk25 = 0xFF;
    }
    sub_80051E8(element);

    element = &teamPlayScreen->unkC0[3];
    element->unk16 = 0xAA;
    element->unk18 = 0x34;
    if (teamPlayScreen->unk316 != 0) {
        element->unk25 = 0;
    } else {
        element->unk25 = 1;
    }
    sub_80051E8(element);

    element = &teamPlayScreen->unkC0[4];
    element->unk16 = 0x78;
    element->unk18 = 0x34;
    sub_80051E8(element);

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        union MultiSioData *msd = &gMultiSioSend;
        if (!teamPlayScreen->unk317)
            msd->pat0.unk0 = 0;
        else
            msd->pat0.unk0 = 1;
        msd->pat0.unk2 = teamPlayScreen->unk316;
    }
}

void sub_805D118(struct MultiplayerTeamPlayScreen* teamPlayScreen) {
    u16 i;
    s16 unk312, unk310;
    
    u16* unk1884 = (u16*)gUnknown_03001884;
    teamPlayScreen->unk314 = (teamPlayScreen->unk314 + 1) & 1023;
    teamPlayScreen->unk310 += gSineTable[teamPlayScreen->unk314] >> 4;
    teamPlayScreen->unk312 += gSineTable[teamPlayScreen->unk314 + 0x100] >> 4;

    unk310 = teamPlayScreen->unk310 >> 8;
    unk312 = teamPlayScreen->unk312 >> 8;

    gFlags |= 0x4;
    gUnknown_03002A80 = 4;
    gUnknown_03002878 = (void*)REG_ADDR_BG3HOFS;

    for (i = 0; i < 160; i++) {
        *unk1884 = (gSineTable[(gFrameCount + i * 4) & 1023] >> 0xB) + unk310;
        unk1884++;
        *unk1884 = (gSineTable[((gFrameCount + i * 2) & 1023) + 0x100] >> 0xB) + unk312;
        unk1884++;
    }
}

extern const u8 gUnknown_080D92B8[2];
extern const u8 gUnknown_080D92BA[2];

void sub_805D610(void);

void sub_805D1F8(void) {
    s32 i;
    u8 count;
    bool8 someVar = TRUE;
    u8 pos[2] = { 0, 0 };
    struct MultiplayerTeamPlayScreen* teamPlayScreen;
    struct UNK_0808B3FC_UNK240* element;
    union MultiSioData* packet;

    teamPlayScreen = TaskGetStructPtr(gCurTask, teamPlayScreen);
    if (teamPlayScreen->unk31F == 0) {
        if (gRepeatedKeys & DPAD_RIGHT) {
            if (teamPlayScreen->unk31E == 0) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
            }
            teamPlayScreen->unk31E = 1;
        } else if (gRepeatedKeys & DPAD_LEFT) {
            if (teamPlayScreen->unk31E == 1) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
            }
            teamPlayScreen->unk31E = 0;
        }
    }

    if (gGameMode > 2) {
        u32 i;
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX && GetBit(gUnknown_030055B8, i); i++) {
            if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {
                if (gUnknown_030054D4[i]++ > 0xB4) {
                    TasksDestroyAll();
                    gUnknown_03002AE4 = gUnknown_0300287C;
                    gUnknown_03005390 = 0;
                    gUnknown_03004D5C = gUnknown_03002A84;
                    MultiPakCommunicationError();
                    return;
                }
            } else {
                gUnknown_030054D4[i] = 0;
            }
        }
    }

    element = &teamPlayScreen->unkC0[1];
    element->unk16 = 0x78;
    element->unk18 = 0x1C;
    sub_80051E8(element);

    for (i = 0; i < 4 && GetBit(gUnknown_030055B8, i); i++) {
        packet = &gMultiSioRecv[i];
        
        if (i == 0) {
            element = &teamPlayScreen->unk1B0;
            sub_8004558(element);
        }


        if (packet->pat0.unk0 == 0x4040 || packet->pat0.unk0 == 0x4041) {
            if (packet->pat0.unk0 != 0x4041) {
                element = &teamPlayScreen->unk0[i];
                element->unk18 = (i * 0x18) + 0x40;
                element->unk16 = gUnknown_080D92B8[packet->pat0.unk2];
                sub_80051E8(element);
                
                element = &teamPlayScreen->unk1B0;
                element->unk18 = (i * 0x18) + 0x40;
                element->unk16 = gUnknown_080D92BA[packet->pat0.unk2];

                if (packet->pat0.unk2 == 0) {
                    element->unk10 &= ~0x400;
                    gUnknown_030055B8 &= ~(0x10 << (i));
                } else {
                    element->unk10 |= 0x400;
                    gUnknown_030055B8 |= (0x10 << (i));
                }
                sub_80051E8(element);
                someVar = FALSE;
            } else {
                s16 a;
                element = &teamPlayScreen->unk0[i];
                sub_80051E8(element);
                a = element->unk16;

                if (a == gUnknown_080D92B8[0]) {
                    pos[0]++;
                } else {
                    pos[1]++;
                }
            }
        } else {
            someVar = FALSE;
        }
        
    }
    count = i;

    if (someVar) {
        if (pos[0] == 0 || pos[1] == 0) {
            teamPlayScreen->unk31F = 0;
        } else {
            gCurTask->main = sub_805D610;
            return;
        }
    }

    sub_805D118(teamPlayScreen);

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        teamPlayScreen->unk31F = 0;
    }

    if (
        (
            (!(gInput & (DPAD_LEFT | DPAD_RIGHT)) && (gPressedKeys & A_BUTTON)) 
            && 
            (
                (teamPlayScreen->unk31E == 0 && (count - 1) != pos[0]) 
                || 
                (teamPlayScreen->unk31E == 1 && (count - 1) != pos[1])
            )
        ) || 
            teamPlayScreen->unk31F != 0
    ) {
        if (teamPlayScreen->unk31F == 0) {
            m4aSongNumStart(SE_SELECT);
        }
        packet = &gMultiSioSend;
        gMultiSioSend.pat0.unk0 = 0x4041;
        gMultiSioSend.pat0.unk2 = teamPlayScreen->unk31E;
        teamPlayScreen->unk31F = 1;
    } else {
        packet = &gMultiSioSend;
        packet->pat0.unk0 = 0x4040;
        packet->pat0.unk2 = teamPlayScreen->unk31E;
    }

    for (i = 0; i < 4 && GetBit(gUnknown_030055B8, i); i++) {
        if (SIO_MULTI_CNT->id != i) {
            packet = &gMultiSioRecv[i];
            if (packet->pat0.unk0 > 0x4041) {
                TasksDestroyAll();
                gUnknown_03002AE4 = gUnknown_0300287C;
                gUnknown_03005390 = 0;
                gUnknown_03004D5C = gUnknown_03002A84;
                MultiPakCommunicationError();
                return;
            }
        }
    }
}

void sub_805D5C8(void) {
    struct MultiplayerTeamPlayScreen* teamPlayScreen = TaskGetStructPtr(gCurTask, teamPlayScreen);
    teamPlayScreen->unk31E = SIO_MULTI_CNT->id & 1;
    teamPlayScreen->unk31F = 0;
    gCurTask->main = sub_805D1F8;
    sub_805D1F8();
}

void sub_805D610(void) {
    TaskDestroy(gCurTask);
    gFlags &= ~0x4;
    sub_80346C8(0, gUnknown_030054D8, 0);
}

void sub_805D644(struct MultiplayerTeamPlayScreen* teamPlayScreen) {
    u8 i;
    struct UNK_0808B3FC_UNK240* element;
    
    for (i = 0; i < 4; i++) {
        if (GetBit(gUnknown_030055B8, i)) {
            element = &teamPlayScreen->unk0[i];
            element->unk16 = gUnknown_080D92B8[i & 1];
            element->unk18 = i * 0x18 + 0x40;
            sub_80051E8(element);
        }
    }
}
