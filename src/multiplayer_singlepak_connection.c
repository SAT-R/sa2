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

struct SinglePakConnectScreen {
    struct UNK_802D4CC_UNK270 unk0;
    struct UNK_0808B3FC_UNK240 unkC;
    struct UNK_0808B3FC_UNK240 unk3C;
    struct UNK_0808B3FC_UNK240 unk6C;
    struct Unk_03002400 unk9C;
    u32 unkDC;
    u32 unkE0;
    u32 unkE4;
    u32 unkE8;
    u16 unkEC;
    u32 unkF0;
    u8 fillerF4[5];
    u8 unkF9;
    u8 unkFA;
    u8 fillerFB;
};

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

extern const u32 gUnknown_080E01E0[7][2];
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
    connectScreen->unkE0 = gUnknown_080E01E0[connectScreen->unkFA][1] - gUnknown_080E01E0[connectScreen->unkFA][0];
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

    if (!((*(vu8 *)REG_ADDR_SIOCNT) & SIO_ID)) {
        gMultiSioEnabled = FALSE;
        mbParams = &gUnknown_03002A90;
        mbParams->masterp = (void*)connectScreen->unkDC;
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
