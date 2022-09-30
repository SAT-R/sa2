#include "global.h"
#include "main.h"
#include "data.h"
#include "multiplayer_communication_outcome.h"
#include "multiplayer_multipak_connection.h"
#include "task.h"
#include "sprite.h"
#include "save.h"
#include "title_screen.h"
#include "multi_sio.h"
#include "m4a.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "game.h"
#include "flags.h"
#include "character_select.h"

struct CommunicationOutcomeScreen {
    struct Unk_03002400 unk0;
    u8 filler40[96];
    struct UNK_0808B3FC_UNK240 unkA0;
    struct UNK_0808B3FC_UNK240 unkD0;
    struct UNK_0808B3FC_UNK240 unk100;
    u8 filler130[204];
    u32 unk1FC;
    u16 unk200;
    u8 filler202;
    u8 unk203;
    u8 unk204[2];
    u8 unk206;
    u8 unk207[21];
}; /* size 0x21C */

static void sub_805BC40(void);

static const u16 gUnknown_080D9088[2] = {1075, 1075};
static const u8 gUnknown_080D908C[2] = { 0, 1 };
static const struct UNK_080E0D64 gUnknown_080D9090[][7] = {
    {
        TextElementAlt2(LANG_DEFAULT, 1, 51, 1074),
        TextElementAlt2(LANG_JAPANESE, 1, 51, 1074),
        TextElementAlt2(LANG_ENGLISH, 1, 75, 1079),
        TextElementAlt2(LANG_GERMAN, 1, 75, 1080),
        TextElementAlt2(LANG_FRENCH, 1, 57, 1081),
        TextElementAlt2(LANG_SPANISH, 1, 45, 1082),
        TextElementAlt2(LANG_ITALIAN, 1, 51, 1083),
    },
    {
        TextElementAlt2(LANG_DEFAULT, 3, 66, 1074),
        TextElementAlt2(LANG_JAPANESE, 3, 66, 1074),
        TextElementAlt2(LANG_ENGLISH, 3, 68, 1079),
        TextElementAlt2(LANG_GERMAN, 3, 88, 1080),
        TextElementAlt2(LANG_FRENCH, 3, 60, 1081),
        TextElementAlt2(LANG_SPANISH, 3, 68, 1082),
        TextElementAlt2(LANG_ITALIAN, 3, 60, 1083),
    }
};

void CreateMultipackOutcomeScreen(u8 outcome) {
    u8 i;
    u8 count;
    struct Task* t;
    struct CommunicationOutcomeScreen* outcomeScreen; 
    struct UNK_0808B3FC_UNK240* unk100;
    struct Unk_03002400* background;
    gDispCnt = 0x3140;
    gBgCntRegs[0] = 0x803;
    gBgScrollRegs[0][0] = 0x100;
    gBgScrollRegs[0][1] = 0;
    gWinRegs[0] = 0xF0;
    gWinRegs[2] = 0xA0;
    gWinRegs[4] = 0x31;
    gWinRegs[5] = 0x31;

    gBldRegs.bldCnt = 0xBF;
    gBldRegs.bldY = 0x10;

    t = TaskCreate(sub_805BC40, sizeof(struct CommunicationOutcomeScreen), 0x2000, 0, NULL);
    outcomeScreen = TaskGetStructPtr(t);

    outcomeScreen->unk203 = outcome;
    outcomeScreen->unk200 = 0x78;
    outcomeScreen->unk1FC = 0;

    for (i = 0, count = 0; i < 4; i++) {
        if (GetBit(gUnknown_030055B8, i)) {
            count++;
        }
    }

    outcomeScreen->unk206 = count;
    
    unk100 = &outcomeScreen->unk100;
    unk100->unk16 = 0x78;
    unk100->unk18 = 0x8C;
    unk100->unk4 = (void*)OBJ_VRAM0;
    unk100->unk1A= 0x3C0;
    unk100->unk8 = 0;
    unk100->unkA = 0x432;
    unk100->unk20 = outcome + 6;
    unk100->unk14 = 0;
    unk100->unk1C = 0;
    unk100->unk21 = 0xFF;
    unk100->unk22 = 0x10;
    unk100->unk25 = 0;
    unk100->unk10 = 0x2000;
    
    unk100 = &outcomeScreen->unkD0;
    unk100->unk16 = 0x78;
    unk100->unk18 = 0x24;
    unk100->unk4 = (void*)OBJ_VRAM0 + 0x2000;
    unk100->unk1A= 0x3C0;
    unk100->unk8 = 0;
    unk100->unkA = gUnknown_080D9088[outcome];
    unk100->unk20 = gUnknown_080D908C[outcome];
    unk100->unk14 = 0;
    unk100->unk1C = 0;
    unk100->unk21 = 0xFF;
    unk100->unk22 = 0x10;
    unk100->unk25 = 0;
    unk100->unk10 = 0x2000;

    unk100 = &outcomeScreen->unkA0;
    unk100->unk16 = 0x78;
    unk100->unk18 = 0x78;
    unk100->unk4 = (void*)OBJ_VRAM0 + 0x4000;
    unk100->unk1A= 0x3C0;
    unk100->unk8 = 0;
    unk100->unkA = gUnknown_080D9088[outcome];
    unk100->unk20 = gUnknown_080D908C[outcome];
    unk100->unk14 = 0;
    unk100->unk1C = 0;
    unk100->unk21 = 0xFF;
    unk100->unk22 = 0x10;
    unk100->unk25 = 0;
    unk100->unk10 = 0x2000;

    background = &outcomeScreen->unk0;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(8);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 0;
    background->unk1C = 0x73;
    sub_8002A3C(background);
    m4aMPlayAllStop();
    if (outcome != OUTCOME_CONNECTION_SUCCESS) {
        m4aSongNumStart(MUS_VS_MISS);
    } else { 
        m4aSongNumStart(MUS_VS_SUCCESS);
        
    }
}

static void sub_805BC40(void) {
    struct UNK_0808B3FC_UNK240* unkD0;
    struct CommunicationOutcomeScreen* outcomeScreen = TaskGetStructPtr(gCurTask);
    unkD0 = &outcomeScreen->unkA0;
    sub_8004558(unkD0);
    sub_80051E8(unkD0);

    if (outcomeScreen->unk203 == OUTCOME_CONNECTION_SUCCESS) {
        const struct UNK_080E0D64* unk9090;
        u32 unk206 = outcomeScreen->unk206;
        u32 offset;
        unkD0 = &outcomeScreen->unkD0;
        unk9090 = gUnknown_080D9090[0];
        offset = gLoadedSaveGame->unk6 + 7;

        unkD0->unkA = unk9090[offset].unk4;
        offset = gLoadedSaveGame->unk6 + 7;
        unkD0->unk20 = unk9090[offset].unk6 + unk206 - 2;
        unkD0->unk21 = 0xFF;
        sub_8004558(unkD0);
        sub_80051E8(unkD0);
    } else {
        const struct UNK_080E0D64* unk9090;
        unkD0 = &outcomeScreen->unkD0;
        unk9090 = gUnknown_080D9090[0];

        unkD0->unkA = unk9090[gLoadedSaveGame->unk6].unk4;
        unkD0->unk20 = unk9090[gLoadedSaveGame->unk6].unk6;
        unkD0->unk21 = 0xFF;
        sub_8004558(unkD0);
        sub_80051E8(unkD0);
    }

    unkD0 = &outcomeScreen->unk100;
    sub_8004558(unkD0);
    sub_80051E8(unkD0);

    if (outcomeScreen->unk200 != 0) {
         outcomeScreen->unk200--;
        if (gBldRegs.bldY != 0) {
            gBldRegs.bldY--;
        }
        return;
    } 

    if (gBldRegs.bldY != 0x10) {
        gBldRegs.bldY++;
    } else {
        u8 outcome = outcomeScreen->unk203;
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        if (outcome == OUTCOME_CONNECTION_SUCCESS) {
            CreateCharacterSelectionScreen(gSelectedCharacter, gUnknown_03005594 & CHARACTER_BIT(CHARACTER_AMY));
        } else {
            gMultiSioEnabled = FALSE;
            MultiSioStop();
            MultiSioInit(0);
            gUnknown_03002260 = gMapHeaders;
            CreateTitleScreenAndSkipIntro();
        }
    }
}
