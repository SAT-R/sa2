#include "global.h"
#include "data.h"
#include "multiplayer.h"
#include "multiplayer_multipak_connection.h"
#include "task.h"
#include "sprite.h"
#include "save.h"
#include "multi_sio.h"
#include "input.h"
#include "m4a.h"
#include "constants/songs.h"
#include "game.h"
#include "flags.h"
#include "zones.h"

void sub_805C0F0(void);

struct MultiplayerSelectionResultsScreen {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    struct UNK_0808B3FC_UNK240 unk80[MULTI_SIO_PLAYERS_MAX];
    struct UNK_0808B3FC_UNK240 unk140[MULTI_SIO_PLAYERS_MAX];
    u16 unk200;
    u8 unk202;
    u8 unk203;
    u8 unk204;
    u8 unk205[3];
}; /* size 0x208 */

extern const u16 gUnknown_080D92A8[7];
extern const struct UNK_080E0D64 gUnknown_080D9100[7][7];
extern const struct UNK_080E0D64 gUnknown_080D9288[MULTI_SIO_PLAYERS_MAX];

void sub_805BDEC(u8 param) {
    struct Task* t;
    struct MultiplayerSelectionResultsScreen* selectionResultsScreen;
    struct Unk_03002400* background;
    u32 i;
    u32 b;
    struct UNK_0808B3FC_UNK240* unk80;
    
    u32 count = 0;
    u32 lang = gLoadedSaveGame->unk6;
    gWinRegs[4] = 0;
    gWinRegs[5] = 0;
    gWinRegs[0] = 0;
    gWinRegs[2] = 0;
    gWinRegs[1] = 0;
    gWinRegs[3] = 0;
    gDispCnt = 0x40;
    gBgCntRegs[3] = 0x5E0B;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;

    gUnknown_030054D4[3] = 0;
    gUnknown_030054D4[2] = 0;
    gUnknown_030054D4[1] = 0;
    gUnknown_030054D4[0] = 0;

    gUnknown_03004D80[3] = 0;

    gUnknown_03002280[12] = 0;
    gUnknown_03002280[13] = 0;
    gUnknown_03002280[14] = 0xFF;
    gUnknown_03002280[15] = 0x40;

    DmaFill32(3, 0, (void*)VRAM + 0x9fe0, 0x40);
    t = TaskCreate(sub_805C0F0, 0x208, 0x2000, 0, 0);
    selectionResultsScreen = TaskGetStructPtr(t, selectionResultsScreen);

    selectionResultsScreen->unk200 = 0;

    for (i = 0; i < 4; i++) {
        if (!GetBit(gUnknown_030055B8, i)) {
            break;
        }
    }

    selectionResultsScreen->unk202 = i;
    selectionResultsScreen->unk203 = param;

    if (param != 0) {
        selectionResultsScreen->unk204 = 0xDE;
    } else {
         selectionResultsScreen->unk204 = param;
    }

    background = &selectionResultsScreen->unk0;
    background->unk4 = BG_SCREEN_ADDR(16);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = gUnknown_080D92A8[lang];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->unk2E = 3;
    sub_8002A3C(background);

    for (; count < 4; count++) {
        if (gUnknown_030054B4[count] == -1) {
            break;
        }
    }

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++, b+= 0x20) {
        s32 temp2 = (i + 4) * 0x800;
        if (GetBit(gUnknown_030055B8, i)) {
            s32 temp;
            unk80 = &selectionResultsScreen->unk80[i];
            unk80->unk16 = 200;
            unk80->unk18 = 0x33 + (0x20 * i);
            unk80->unk4 = (void*)(OBJ_VRAM0 + (i * 0x800));
            unk80->unk1A = 0x400;
            unk80->unk8 = 0;
            temp = gUnknown_030054B4[i];
            if (temp == 5) {
                unk80->unkA = gUnknown_080D9100[lang][1].unk4;
                unk80->unk20 = gUnknown_080D9100[lang][1].unk6;
            } else if (temp == 4) {
                unk80->unkA = gUnknown_080D9100[lang][2].unk4;
                unk80->unk20 = gUnknown_080D9100[lang][2].unk6;
            } else if (count == 2 || gGameMode == 4) {
                unk80->unkA = gUnknown_080D9100[lang][0].unk4;
                unk80->unk20 = gUnknown_080D9100[lang][0].unk6 + temp;
            } else {
                unk80->unkA = gUnknown_080D9100[lang][3].unk4;
                unk80->unk20 = gUnknown_080D9100[lang][3].unk6 + temp;
            }
            unk80->unk14 = 0;
            unk80->unk1C = 0;
            unk80->unk21 = 0xFF;
            unk80->unk22 = 0x10;
            unk80->unk25 = 0;
            unk80->unk10 = 0x1000;
            sub_8004558(unk80);
    
            unk80 = &selectionResultsScreen->unk140[i];
            unk80->unk16 = 0;
            unk80->unk18 = 0x1F + (0x20 * i);
            unk80->unk4 = (void*)(OBJ_VRAM0 + temp2);
            unk80->unk1A = 0x400;
            unk80->unk8 = 0;
            unk80->unkA = gUnknown_080D9288[i].unk4;
            unk80->unk20 = gUnknown_080D9288[i].unk6;
            unk80->unk14 = 0;
            unk80->unk1C = 0;
            unk80->unk21 = 0xFF;
            unk80->unk22 = 0x10;
            unk80->unk25 = 0;
            unk80->unk10 = 0x1000;
            sub_8004558(unk80);
        }
    }

    if (param != 0) {
        m4aSongNumStart(MUS_VS_3);
    }
}

void sub_805C30C(void);

void sub_805C0F0(void) {
    struct MultiplayerSelectionResultsScreen* selectionResultsScreen;
    u16* unk1884 = (u16*)gUnknown_03001884;
    gDispCnt |= 0x1800;

    if (gGameMode > 2) {
        u32 i;
        for (i = 0; i < 4 && GetBit(gUnknown_030055B8, i); i++) {
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

    selectionResultsScreen = TaskGetStructPtr(gCurTask, selectionResultsScreen);

    if ((selectionResultsScreen->unk200 += 0x400) > 0xF000) {
        selectionResultsScreen->unk200 = 0;

        gCurTask->main = sub_805C30C;
        sub_805C30C();
    } else {
        u32 i;
        u16 j, x;
        u16 unk200 = selectionResultsScreen->unk200 >> 8; 
        gFlags |= 0x4;
        gUnknown_03002878 = (void*)REG_ADDR_BG3HOFS;
        gUnknown_03002A80 = 4;

        for (x = 0, i = 0; i < 0x20; i++, x++) {
            *unk1884++ = 0;
            *unk1884++ = selectionResultsScreen->unk204;
        }
    
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (!GetBit(gUnknown_030055B8, i)) {
                for (j = 0; j < 0x20; j++) {
                    *unk1884++ = 0;
                    *unk1884++ = 0xC0 - x;
                }
                x += 0x20;
                continue;
            } 
                
            if (i & 1) {
                for (j = 0; j < 0x20; j++) {
                    *unk1884++ = 0xF0 - unk200;
                    *unk1884++ = (gUnknown_03005500[i] * 0x20 + 0x20) - x;
                }
                x += 0x20;
                continue;
            } 
    
            for (j = 0; j < 0x20; j++) {
                *unk1884++ = unk200 - 0xF0;
                *unk1884++ = (gUnknown_03005500[i] * 0x20 + 0x20) - x;
            }
            x += 0x20;
        }
    }
}
