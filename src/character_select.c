#include "global.h"
#include "main.h"
#include "transition.h"
#include "game.h"
#include "sprite.h"
#include "character_select.h"
#include "save.h"
#include "m4a.h"
#include "task.h"
#include "malloc_vram.h"
#include "constants/songs.h"
#include "flags.h"

struct CharacterSelectionScreen {
    struct UNK_802D4CC_UNK270 unk0;
    struct Unk_03002400 unkC;
    struct Unk_03002400 unk4C;
    struct Unk_03002400 unk8C;
    struct UNK_0808B3FC_UNK240 unkCC;
    struct UNK_0808B3FC_UNK240 unkFC;
    struct UNK_0808B3FC_UNK240 unk12C;
    struct UNK_0808B3FC_UNK240 unk15C;
    u8 filler18C[12];
    struct UNK_0808B3FC_UNK240 unk198;
    u8 filler1C8[12];
    struct UNK_0808B3FC_UNK240 unk1D4[5];
    struct UNK_0808B3FC_UNK240 unk2C4;
    u8 filler2F4[12];
    struct UNK_0808B3FC_UNK240 unk300;
    struct UNK_0808B3FC_UNK240 unk330;
    struct UNK_0808B3FC_UNK240 unk360;
    struct UNK_0808B3FC_UNK240 unk390;
    u8 unk3C0;
    u8 unk3C1;
    u8 filler3C2;
    u8 unk3C3;
    u8 unk3C4;
    u8 unk3C5;
    u8 unk3C6;
    u8 unk3C7;
    u8 unk3C8;
    u8 unk3C9;
    u8 unk3CA;
    u8 unk3CB;
    u8 filler3CC[2];
    u16 unk3CE;
    u16 unk3D0;
    u8 filler3D2[2];
    u32 unk3D4;
    u32 unk3D8;
    u32 unk3DC;
}; /* size 0x3E0 */

void sub_8031C64(void);
void sub_8034638(struct Task*);

extern const u16 gUnknown_080D71D4[6][2];
extern const u16 gUnknown_080D71EC[6][2];
extern const u16 gUnknown_080D725C[6][2];
extern const u16 gUnknown_080D7204[6][2];
extern const u16 gUnknown_080D722C[12][2];

// Pretty close: https://decomp.me/scratch/A2o3b
NONMATCH("asm/non_matching/CreateCharacterSelectionScreen.inc", void CreateCharacterSelectionScreen(u8 selectedCharacter, bool8 allUnlocked)) {
    struct Task* t;
    struct CharacterSelectionScreen* characterScreen;
    struct UNK_802D4CC_UNK270* screenFade;
    struct Unk_03002400* background;
    struct UNK_0808B3FC_UNK240* element;
    u32 a;

    u8 i = 0;
    s8 something;
    u32 character = selectedCharacter;
    s8 lang;
    lang = gLoadedSaveGame->unk6 - 1;
    if (lang < 0) {
        lang = 0;
    }

    if (lang < 1) {
        something = 0;
    } else {
        something = 1;
    }
    // something missing to do with lang here

    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
    gUnknown_030054D4[3] = 0;
    gUnknown_030054D4[2] = 0;
    gUnknown_030054D4[1] = 0;
    gUnknown_030054D4[0] = 0;

    m4aSongNumStart(MUS_CHARACTER_SELECTION);
    gDispCnt = 0x1740;
    gBgCntRegs[2] = 0x1507;
    gBgCntRegs[1] = 0x160E;
    gBgCntRegs[0] = 0x1403;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    t = TaskCreate(sub_8031C64, 0x3E0, 0x4100, 0, sub_8034638);
    characterScreen = TaskGetStructPtr(t);

    characterScreen->unk3CA = gLoadedSaveGame->unk13;
    characterScreen->unk3C1 = selectedCharacter;
    characterScreen->unk3C4 = 0x10;
    characterScreen->unk3C5 = 0;
    characterScreen->unk3C6 = 0;
    characterScreen->unk3C7 = 0;
    characterScreen->unk3D4 = 0;
    characterScreen->unk3CE = 0xA6;
    characterScreen->unk3D0 = 0xA6;
    characterScreen->unk3C8 = 0;
    characterScreen->unk3DC = 0;
    characterScreen->unk3C9 = 0;
    characterScreen->unk3CB = 0;

    if (allUnlocked != FALSE) {
        characterScreen->unk3D8 = ((0x108 - (0x66 * selectedCharacter)) & 0x3FF) * 0x100 + 2;
        characterScreen->unk3C3 = 1;
        characterScreen->unk3C0 = selectedCharacter;

        if (selectedCharacter >= 5) {
            characterScreen->unk3C0 = 4;
        }
    } else {
        
        characterScreen->unk3D8 = ((0x16E - (selectedCharacter * 0x66)) & 0x3FF) * 0x100 + 4;
        characterScreen->unk3C3 = 0;
        characterScreen->unk3C0 = selectedCharacter;
        if (selectedCharacter >= 4) {
            characterScreen->unk3C0 = 3;
        }
    } 

    screenFade = &characterScreen->unk0;
    screenFade->unk0 = 0;
    screenFade->unk4 = 0;
    screenFade->unk2 = 2;
    screenFade->unk6 = 0x180;
    screenFade->unk8 = 0xFF;
    screenFade->unkA = 0;
    sub_802D4CC(screenFade);

    background = &characterScreen->unk8C;
    background->unk4 = BG_SCREEN_ADDR(24);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(22);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 99;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 1;
    sub_8002A3C(background);

    background = &characterScreen->unkC;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(20);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x175;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->unk2E = 0;
    sub_8002A3C(background);

    background = &characterScreen->unk4C;
    background->unk4 = BG_SCREEN_ADDR(8);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(21);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x176;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->unk2E = 2;
    sub_8002A3C(background);

    for (i = 0; i < 5; i++) {
        element = &characterScreen->unk1D4[i];
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk4 = VramMalloc(0x10);
        element->unkA = 0x2E1;
        element->unk20 = i;
        element->unk1A = 0x100;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk21 = 0xFF;
        element->unk22 = 0x10;
        element->unk25 = 0;
        element->unk28 = -1;
        element->unk10 = 0;
        sub_8004558(element);
    }

    element = &characterScreen->unk2C4;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk4 = VramMalloc(0x40);
    element->unkA = 0x2E1;
    element->unk20 = 5;
    element->unk1A = 0xC0;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->unk12C;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk4 = VramMalloc(0x24);
    element->unkA = gUnknown_080D722C[characterScreen->unk3C0 + (something * 6)][0];
    element->unk20 = gUnknown_080D722C[characterScreen->unk3C0 + (something * 6)][1];
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->unk15C;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk4 = VramMalloc(0x40);
    element->unkA = gUnknown_080D71D4[characterScreen->unk3C0][0];
    element->unk20 = gUnknown_080D71D4[characterScreen->unk3C0][1];
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->unk198;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk4 = VramMalloc(0x40);
    element->unkA = gUnknown_080D71EC[characterScreen->unk3C0][0];
    element->unk20 = gUnknown_080D71EC[characterScreen->unk3C0][1];
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->unkCC;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk4 = VramMalloc(0x36);
    element->unkA = gUnknown_080D725C[lang][0];
    element->unk20 = gUnknown_080D725C[lang][1];
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->unk300;
    element->unk16 = 0x11;
    element->unk18 = 0x12;
    element->unk4 = VramMalloc(0x18);
    element->unkA = 0x2e2;
    element->unk20 = 0;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->unk330;
    element->unk16 = 0x11;
    element->unk18 = 0x8E;
    element->unk4 = VramMalloc(0x18);
    element->unkA = 0x2e2;
    element->unk20 = 0;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0x800;
    sub_8004558(element);

    element = &characterScreen->unk360;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk4 = (void*)(OBJ_VRAM0 + 0x400);
    element->unkA = 0x2e0;
    element->unk20 = 10;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->unk390;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk4 = (void*)(OBJ_VRAM0 + 0x2580);
    element->unkA = 0x2e6;
    element->unk20 = 0;
    element->unk1A = 0x40;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->unkFC;
    element->unk16 = 0;
    element->unk18 = 0;
    element->unk4 = (void*)(OBJ_VRAM0 + 0x1000);
    element->unkA = gUnknown_080D7204[characterScreen->unk3C0][0];
    element->unk20 = gUnknown_080D7204[characterScreen->unk3C0][1];
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    for (i = 0; i < 16; i++) {
        gObjPalette[i + 0xf0] = 0;
    }

    gFlags |= 0x2;
}
END_NONMATCH
