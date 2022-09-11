#include "global.h"
#include "main.h"
#include "data.h"
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
#include "trig.h"
#include "multiplayer_multipak_connection.h"
#include "multiplayer_results.h"
#include "player.h"
#include "profile.h"
#include "course_select.h"
#include "title_screen.h"
#include "time_attack.h"

struct CharacterSelectionScreen {
    struct UNK_802D4CC_UNK270 unk0;
    struct Unk_03002400 unkC;
    struct Unk_03002400 unk4C;
    struct Unk_03002400 unk8C;
    struct UNK_0808B3FC_UNK240 unkCC;
    struct UNK_0808B3FC_UNK240 unkFC;
    struct UNK_0808B3FC_UNK240 unk12C;
    struct UNK_0808B3FC_UNK240 unk15C;
    struct UNK_808D124_UNK180 unk18C;
    struct UNK_0808B3FC_UNK240 unk198;
    struct UNK_808D124_UNK180 unk1C8;
    struct UNK_0808B3FC_UNK240 unk1D4[5];
    struct UNK_0808B3FC_UNK240 unk2C4;
    struct UNK_808D124_UNK180 unk2F4;
    struct UNK_0808B3FC_UNK240 unk300;
    struct UNK_0808B3FC_UNK240 unk330;
    struct UNK_0808B3FC_UNK240 unk360;
    struct UNK_0808B3FC_UNK240 unk390;
    u8 unk3C0;
    u8 unk3C1;
    u8 unk3C2;
    u8 unk3C3;
    u8 unk3C4;
    u8 unk3C5;
    u8 unk3C6;
    u8 unk3C7;
    u8 unk3C8;
    u8 unk3C9;
    u8 unk3CA;
    u8 unk3CB;
    u8 unk3CC;
    u8 unk3CD;
    u16 unk3CE;
    u16 unk3D0;
    u8 filler3D2[2];
    u32 unk3D4;
    u32 unk3D8;
    u32 unk3DC;
}; /* size 0x3E0 */

void sub_8031C64(void);
void sub_8034638(struct Task*);
void sub_8031E10(void);
void sub_8031CD8(void);
void sub_8033078(struct CharacterSelectionScreen* characterScreen);
void sub_8032E38(struct CharacterSelectionScreen* characterScreen);
void sub_8031E84(void);
void sub_803353C(struct CharacterSelectionScreen* characterScreen);
void sub_8032D9C(void);
void sub_8032AF4(void);
void sub_8033F38(void);
void sub_8033C64(struct CharacterSelectionScreen*);
void sub_8032508(void);
void sub_803274C(void);
void sub_8034358(void);
void sub_8032990(void);

extern const u16 gUnknown_080D71EC[6][2];
extern const u16 gUnknown_080D7204[6][2];
extern const u16 gUnknown_080D7218[4][2];
extern const u16 gUnknown_080D722C[12][2];
extern const u16 gUnknown_080D725C[6][2];
extern const u8 gUnknown_080D7274[4];
extern const u16 gUnknown_080D7278[5];
extern const u8 gUnknown_080D7282[4][5];
extern const u16 gUnknown_080D7296[8];
extern const u8 gUnknown_080D72AC[5];
extern const u8 gUnknown_080D72B1[7];

#define ScrollBackground() ({ \
    gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xFF; \
    gBgScrollRegs[2][0] = (gBgScrollRegs[2][0] - 1) & 0xFF; \
    gBgScrollRegs[2][1] = (gBgScrollRegs[2][1] + 1) & 0xFF; \
})

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

    t = TaskCreate(sub_8031C64, sizeof(struct CharacterSelectionScreen), 0x4100, 0, sub_8034638);
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

void sub_8031C64(void) {
    struct CharacterSelectionScreen* characterScreen = TaskGetStructPtr(gCurTask);
    if (++characterScreen->unk3D4 > 0x17) {
        characterScreen->unk3D4 = 0;
        gCurTask->main = sub_8031CD8;
    }

    sub_802D4CC(&characterScreen->unk0);
    sub_80051E8(&characterScreen->unk300);
    sub_80051E8(&characterScreen->unk330);

    ScrollBackground();
}

void sub_8031CD8(void) {
    struct CharacterSelectionScreen* characterScreen = TaskGetStructPtr(gCurTask);
    register u32 temp asm("r3") = ++characterScreen->unk3D4;
    register u32 r0 asm("r0");

    if (temp > 0x3C || ((gPressedKeys & A_BUTTON) && !IsMultiplayer())) {
        characterScreen->unk3C5++;
        characterScreen->unk3D8 = characterScreen->unk3C0 * -0x6600;
        if (characterScreen->unk3C3 != 0) {
            characterScreen->unk3D8 += 2;
        } else {
            characterScreen->unk3D8 += 4;
        }
        characterScreen->unk3D8 &= 0x3FFFF;
        characterScreen->unk3D4 = 0;
        gCurTask->main = sub_8031E10;
        sub_8033078(characterScreen);
    } else {
        characterScreen->unk3D8 -= Div(gSineTable[(((r0 = temp + 4) << 2) & 0x3FF) + 0x100], 3);
        if (characterScreen->unk3C3 != 0) {
            characterScreen->unk3D8 += 6; 
        } else {
            characterScreen->unk3D8 += 0xC;
        }
        characterScreen->unk3D8 &= 0x3FFFF;
        sub_8032E38(characterScreen);
    }

    ScrollBackground();
}

void sub_8031E10(void) {
    struct CharacterSelectionScreen* characterScreen = TaskGetStructPtr(gCurTask);
    u32 var = ++characterScreen->unk3D4;
    characterScreen->unk3C5++;
    if (var >= 16) {
        characterScreen->unk3C5++;
        characterScreen->unk3D4 = 0;
        gCurTask->main = sub_8031E84;
        sub_803353C(characterScreen);
        ScrollBackground();
        return;
    }

    sub_8033078(characterScreen);
    ScrollBackground();
}

void sub_8031E84(void) {
    struct UNK_0808B3FC_UNK240* element;
    struct UNK_802D4CC_UNK270* unk0;
    union MultiSioData* packet;
    struct CharacterSelectionScreen* characterScreen = TaskGetStructPtr(gCurTask);
    characterScreen->unk3C5 = (characterScreen->unk3C5 & 0x3F) + 1;

    MultiPakHeartbeat();

    if (IsMultiplayer()) {
        u8 i;
        characterScreen->unk3DC = 0;
        
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (i != SIO_MULTI_CNT->id && GetBit(gUnknown_030055B8, i)) {
                packet = &gMultiSioRecv[i];
                if (packet->pat0.unk0 > 0x4020) {
                    characterScreen->unk3DC |= CHARACTER_BIT(packet->pat0.unk2);
                }
            }
        }
    } else if (gPressedKeys & B_BUTTON || characterScreen->unk3C9 != 0) {
        unk0 = &characterScreen->unk0;
        unk0->unk0 = 0;
        unk0->unk4 = 0;
        unk0->unk2 = 1;
        unk0->unk6 = 0x180;
        unk0->unk8 = 0xFF;
        unk0->unkA = 0;
        gCurTask->main = sub_8032D9C;

        if (characterScreen->unk3C9 == 0) {
            m4aSongNumStart(SE_RETURN);
        }

        sub_803353C(characterScreen);
        return;
    }

    if (characterScreen->unk3C8 != 0) {
        element = &characterScreen->unkFC;
        element->unkA = gUnknown_080D7218[characterScreen->unk3C1][0];
        element->unk20 = gUnknown_080D7218[characterScreen->unk3C1][1];
        element->unk21 = 0xFF;
        
        element = &characterScreen->unk360;
        element->unkA = 0x2E0;
        element->unk20 = 0xB;
        element->unk21 = 0xFF;
        gSelectedCharacter = characterScreen->unk3C1;

        characterScreen->unk3D4 = 0;

        unk0 = &characterScreen->unk0;
        unk0->unk0 = 0;
        unk0->unk4 = 0;
        unk0->unk2 = 1;
        unk0->unk6 = 0x180;
        unk0->unk8 = 0xFF;
        unk0->unkA = 0;

        m4aSongNumStart(gUnknown_080D7278[characterScreen->unk3C1]);

        if (IsMultiplayer()) {
            gCurTask->main = sub_8033F38;
        } else {
            gCurTask->main = sub_8032AF4;            
        }
        sub_8033C64(characterScreen);
    } else {
        if (gInput & (DPAD_LEFT | DPAD_UP)) {
            if (characterScreen->unk3C1 == 0 && characterScreen->unk3C3 == 0) {
                characterScreen->unk3D8 = 0x26800;
            }

            characterScreen->unk3C5 = 0;
            characterScreen->unk3C6 = 0xC;
            characterScreen->unk3C2 = characterScreen->unk3C1;
            characterScreen->unk3C1 = gUnknown_080D7282[characterScreen->unk3C3 + 2][characterScreen->unk3C1];
            characterScreen->unk3D4 = 0;
            characterScreen->unk3C4 = 0;
            characterScreen->unk3CB = 0;
            element = &characterScreen->unk300;
            element->unkA = 0x2E2;
            element->unk20 = 1;
            element->unk21 = 0xFF;
            m4aSongNumStart(SE_SHIFT);
            gCurTask->main = sub_8032508;
            sub_803353C(characterScreen);
        } else if (gInput & (DPAD_RIGHT | DPAD_DOWN)) {
            characterScreen->unk3C5 = 0;
            characterScreen->unk3C7 = 0xC;
            characterScreen->unk3C2 = characterScreen->unk3C1;
            characterScreen->unk3C1 = gUnknown_080D7282[characterScreen->unk3C3][characterScreen->unk3C1];
            characterScreen->unk3D4 = 0;
            characterScreen->unk3C4 = 0;
            characterScreen->unk3CB = 1;

            element = &characterScreen->unk330;
            element->unkA = 0x2E2;
            element->unk20 = 1;
            element->unk21 = 0xFF;
            m4aSongNumStart(SE_SHIFT);
            gCurTask->main = sub_803274C;
            sub_803353C(characterScreen);
        } else {
#ifndef NON_MATCHING
            if (!(!IsMultiplayer() && !((gPressedKeys & A_BUTTON) && (characterScreen->unk3CA & CHARACTER_BIT(characterScreen->unk3C1))))) {
                goto code;
            }
            while (0) ;
            goto label;
            code:
#else
            if (!IsMultiplayer() && !((gPressedKeys & A_BUTTON) && (characterScreen->unk3CA & CHARACTER_BIT(characterScreen->unk3C1))) {
                sub_803353C(characterScreen);
            } else
#endif
            if (!IsMultiplayer() // completely optimized out
                || (gPressedKeys & A_BUTTON && !(characterScreen->unk3DC & CHARACTER_BIT(characterScreen->unk3C1)))) {
                element = &characterScreen->unkFC;
                element->unkA = gUnknown_080D7218[characterScreen->unk3C1][0];
                element->unk20 = gUnknown_080D7218[characterScreen->unk3C1][1];
                element->unk21 = 0xFF;
                
                element = &characterScreen->unk360;
                element->unkA = 0x2E0;
                element->unk20 = 0xB;
                element->unk21 = 0xFF;

                gSelectedCharacter = characterScreen->unk3C1;
                characterScreen->unk3D4 = 0;

                unk0 = &characterScreen->unk0;
                unk0->unk0 = 0;
                unk0->unk4 = 0;
                unk0->unk2 = 1;
                unk0->unk6 = 0x180;
                unk0->unk8 = 0xFF;
                unk0->unkA = 0;
                m4aSongNumStart(gUnknown_080D7278[characterScreen->unk3C1]);

                // Some sort of tail merge
                if (IsMultiplayer()) {
                    gCurTask->main = sub_8033F38;
                } else {
                    gCurTask->main = sub_8032AF4;
                }
                sub_8033C64(characterScreen);
            }
            else if (IsMultiplayer() && characterScreen->unk3DC & CHARACTER_BIT(characterScreen->unk3C1)) {
                if (characterScreen->unk3CB) {
                    characterScreen->unk3C5 = 0;
                    characterScreen->unk3C7 = 0xC;
                    characterScreen->unk3C2 = characterScreen->unk3C1;
                    characterScreen->unk3C1 = gUnknown_080D7282[characterScreen->unk3C3][characterScreen->unk3C1];
    
                    characterScreen->unk3D4 = 0;
                    characterScreen->unk3C4 = 0;
                    element = &characterScreen->unk330;
                    element->unkA = 0x2E2;
                    element->unk20 = 1;
                    element->unk21 = 0xFF;
                    m4aSongNumStart(SE_SHIFT);
                    gCurTask->main = sub_803274C;
                } else {
                    if (characterScreen->unk3C1 == 0 && characterScreen->unk3C3 == 0) {
                        characterScreen->unk3D8 = 0x26800;
                    }
                    characterScreen->unk3C5 = 0;
                    characterScreen->unk3C6 = 0xC;
                    characterScreen->unk3C2 = characterScreen->unk3C1;
    
                    characterScreen->unk3C1 = gUnknown_080D7282[characterScreen->unk3C3 + 2][characterScreen->unk3C1];
                    characterScreen->unk3D4 = 0;
                    characterScreen->unk3C4 = 0;
                    characterScreen->unk3CB = 0;
                    element = &characterScreen->unk300;
                    element->unkA = 0x2E2;
                    element->unk20 = 1;
                    element->unk21 = 0xFF;
                    m4aSongNumStart(SE_SHIFT);
                    gCurTask->main = sub_8032508;
                }
                sub_803353C(characterScreen);
            }
            else {
#ifndef NON_MATCHING
                label:
#endif
                sub_803353C(characterScreen);
            }
        }
    }
    if (IsMultiplayer()) {
        packet = &gMultiSioSend;
        packet->pat0.unk0 = 0x4020;
        packet->pat0.unk2 = characterScreen->unk3C1;
    }

    ScrollBackground();
}

void sub_8032508(void) {
    u32 unk3D4;
    struct CharacterSelectionScreen* characterScreen;
    struct UNK_0808B3FC_UNK240* element;
    MultiPakHeartbeat();

    characterScreen = TaskGetStructPtr(gCurTask);

    unk3D4 = ++characterScreen->unk3D4;
    characterScreen->unk3C4++;

    if (characterScreen->unk3C6 != 0) {
        characterScreen->unk3C6--;
        if (characterScreen->unk3C6 == 0) {
            element = &characterScreen->unk300;
            element->unkA = 0x2E2;
            element->unk20 = 0;
            element->unk21 = 0xff;
        }
    }

    characterScreen->unk3D8 += gUnknown_080D7296[unk3D4];
    characterScreen->unk3D8 &= 0x3FFFF;

    if ((!IsMultiplayer() && (gPressedKeys & A_BUTTON) && (characterScreen->unk3CA & CHARACTER_BIT(characterScreen->unk3C1)))
        || (IsMultiplayer() && (gPressedKeys & A_BUTTON) && !(characterScreen->unk3DC & CHARACTER_BIT(characterScreen->unk3C1)))) {
        characterScreen->unk3C8 = 1;
    } else if (!IsMultiplayer() && (gPressedKeys & B_BUTTON)) {
        if (!characterScreen->unk3C9) {
            m4aSongNumStart(SE_RETURN);
        }
        characterScreen->unk3C9 = 1;
    }

    if (unk3D4 > 9) {
        characterScreen->unk3D4 = 0;
        
        if (characterScreen->unk3C1 == 0) {
            characterScreen->unk3D8 = 0;
        }

        gCurTask->main = sub_8032990;
    }

    sub_803353C(characterScreen);

    ScrollBackground();
    if (IsMultiplayer()) {
        gMultiSioSend.pat0.unk0 = 0x4020;
        gMultiSioSend.pat0.unk2 = characterScreen->unk3C1;
    }
}

void sub_803274C(void) {
    u32 unk3D4;
    struct CharacterSelectionScreen* characterScreen;
    struct UNK_0808B3FC_UNK240* element;
    MultiPakHeartbeat();

    characterScreen = TaskGetStructPtr(gCurTask);

    unk3D4 = ++characterScreen->unk3D4;
    characterScreen->unk3C4++;

    if (characterScreen->unk3C7 != 0) {
        characterScreen->unk3C7--;
        if (characterScreen->unk3C7 == 0) {
            element = &characterScreen->unk330;
            element->unkA = 0x2E2;
            element->unk20 = 0;
            element->unk21 = 0xff;
        }
    }

    characterScreen->unk3D8 -= gUnknown_080D7296[unk3D4];
    characterScreen->unk3D8 &= 0x3FFFF;

    if ((!IsMultiplayer() && (gPressedKeys & A_BUTTON) && (characterScreen->unk3CA & CHARACTER_BIT(characterScreen->unk3C1)))
        || (IsMultiplayer() && (gPressedKeys & A_BUTTON) && !(characterScreen->unk3DC & CHARACTER_BIT(characterScreen->unk3C1)))) {
        characterScreen->unk3C8 = 1;
    } else if (!IsMultiplayer() && (gPressedKeys & B_BUTTON)) {
        if (!characterScreen->unk3C9) {
            m4aSongNumStart(SE_RETURN);
        }
        characterScreen->unk3C9 = 1;
    }

    if (unk3D4 > 9) {
        characterScreen->unk3D4 = 0;
        
        if (characterScreen->unk3C1 == 0) {
            characterScreen->unk3D8 = 0;
        }

        gCurTask->main = sub_8032990;
    }

    sub_803353C(characterScreen);

    ScrollBackground();
    if (IsMultiplayer()) {
        gMultiSioSend.pat0.unk0 = 0x4020;
        gMultiSioSend.pat0.unk2 = characterScreen->unk3C1;
    }
}

void sub_8032990(void) {
    struct UNK_0808B3FC_UNK240* element;
    struct CharacterSelectionScreen* characterScreen = TaskGetStructPtr(gCurTask);
    u32 unk3D4 = ++characterScreen->unk3D4;
    characterScreen->unk3C4++;

    if (characterScreen->unk3C6 != 0) {
        characterScreen->unk3C6--;
        if (characterScreen->unk3C6 == 0) {
            element = &characterScreen->unk300;
            element->unkA = 0x2E2;
            element->unk20 = 0;
            element->unk21 = 0xff;
        }
    }

    if (characterScreen->unk3C7 != 0) {
        characterScreen->unk3C7--;
        if (characterScreen->unk3C7 == 0) {
            element = &characterScreen->unk330;
            element->unkA = 0x2E2;
            element->unk20 = 0;
            element->unk21 = 0xff;
        }
    }

    if ((!IsMultiplayer() && (gPressedKeys & A_BUTTON) && (characterScreen->unk3CA & CHARACTER_BIT(characterScreen->unk3C1)))
        || (IsMultiplayer() && (gPressedKeys & A_BUTTON) && !(characterScreen->unk3DC & CHARACTER_BIT(characterScreen->unk3C1)))) {
        characterScreen->unk3C8 = 1;
    }

    if (unk3D4 > 5) {
        characterScreen->unk3C5++;
        gCurTask->main = sub_8031E84;
    }

    sub_803353C(characterScreen);
    ScrollBackground();
}

void sub_8032AF4(void) {
    union MultiSioData* packet;
    struct UNK_0808B3FC_UNK240* element;
    struct CharacterSelectionScreen* characterScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &characterScreen->unk0;
    MultiPakHeartbeat();

    if (IsMultiplayer()) {
        u8 i;
        characterScreen->unk3DC = 0;
        
        // Receive selected characters
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (i != SIO_MULTI_CNT->id && GetBit(gUnknown_030055B8, i)) {
                packet = &gMultiSioRecv[i];
                if (packet->pat0.unk0 > 0x4020) {
                    characterScreen->unk3DC |= CHARACTER_BIT(packet->pat0.unk2);
                }
            }
        }
    }

    characterScreen->unk3D4++;
    characterScreen->unk3C5 = (characterScreen->unk3C5 & 0x3F) + 1;

    if (characterScreen->unk3C6 != 0) {
        characterScreen->unk3C6--;
        if (characterScreen->unk3C6 == 0) {
            element = &characterScreen->unk300;
            element->unkA = 0x2E2;
            element->unk20 = 0;
            element->unk21 = 0xff;
        }
    }

    if (characterScreen->unk3C7 != 0) {
        characterScreen->unk3C7--;
        if (characterScreen->unk3C7 == 0) {
            element = &characterScreen->unk330;
            element->unkA = 0x2E2;
            element->unk20 = 0;
            element->unk21 = 0xff;
        }
    }

    if ((characterScreen->unk3D4 >= gUnknown_080D72AC[characterScreen->unk3C1]) && sub_802D4CC(unk0) == 1) {
        TaskDestroy(gCurTask);

        if (IsMultiplayer()) {
            CreateMultiplayerResultsScreen(MULTIPLAYER_RESULTS_MODE_CHARACTER_SELECTION);
            return;
        }

        if (gGameMode != GAME_MODE_SINGLE_PLAYER) {
            CreateTimeAttackSelectionScreen((gGameMode & GAME_MODE_BOSS_TIME_ATTACK) != 0, gSelectedCharacter, gCurrentLevel);
            return;
        }

        // Only 1 level available
        if (gLoadedSaveGame->unk7[gSelectedCharacter] < 3) {
            gCurrentLevel = TO_LEVEL_INDEX(ZONE_1, ACT_1);
            sub_801A770();
            return;
        }

        if (gLoadedSaveGame->unk1A == 1 && gSelectedCharacter == CHARACTER_SONIC) {
            sub_80346C8(0, gLoadedSaveGame->unk7[gSelectedCharacter], 2);
            return;
        }

        sub_80346C8(0, gLoadedSaveGame->unk7[gSelectedCharacter], 0);
        return;
    }

    sub_8033C64(characterScreen);
    ScrollBackground();
}

void sub_8032D9C(void) {
    struct CharacterSelectionScreen* characterScreen = TaskGetStructPtr(gCurTask);
    struct UNK_802D4CC_UNK270* unk0 = &characterScreen->unk0;

    if (sub_802D4CC(unk0) == 1) {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        if (gGameMode != GAME_MODE_SINGLE_PLAYER) {
            sub_8087FC0();
        } else {
            CreateTitleScreenAtSinglePlayerMenu();
            
        }
    } else {
        sub_803353C(characterScreen);
        ScrollBackground();
    }
}

void sub_8032E38(struct CharacterSelectionScreen* characterScreen) {
    u8 i;
    struct UNK_0808B3FC_UNK240* element;

    if (characterScreen->unk3C3 != 0) {
        for (i = 0; i < 10; i++) {
            if ((characterScreen->unk3D4 > (i - characterScreen->unk3C0) * 5)
                || (characterScreen->unk3C0 == 4 && i < 2 && (characterScreen->unk3D4 > 0x13))) {
                u8 temp2 = i - Div(i, 5) * 5;
                element = &characterScreen->unk1D4[temp2];

                element->unk16 = ((gSineTable[(((characterScreen->unk3D8 >> 8) + (i * 0x66)) & 0x3FF) + 0x100] * 0x5C) >> 0xE) + 10;
                element->unk18 = ((gSineTable[(((characterScreen->unk3D8 >> 8) + (i * 0x66)) & 0x3FF)] * 0x5C) >> 0xE) + 0x50;
                sub_80051E8(element);
            }
        }
    } else {
        u16 temp = ((characterScreen->unk3D8 >> 8) + 0x330) & 0x3FF;

        for (i = 0; i < 9; i++) {
            if (characterScreen->unk3D4 > (s8)(i - characterScreen->unk3C0)) {
                u32 temp2;
                element = &characterScreen->unk1D4[(i + 2) & 3];
                
                temp2 = (temp + i * 0x66) & 0x3FF;
                element->unk16 = ((gSineTable[temp2 + 0x100] * 0x5C) >> 0xE) + 10;
                element->unk18 = (gSineTable[temp2] * 0x5C >> 0xE) + 0x50;
                sub_80051E8(element);
            }
        }

        if (characterScreen->unk3C0 > 0 && characterScreen->unk3C0 < 4 && characterScreen->unk3D4 > 0x13) {
            for (; i < gUnknown_080D7274[characterScreen->unk3C0]; i++) {
                u32 temp2;
                element = &characterScreen->unk1D4[(i + 2) & 3];
                temp2 = (temp + i * 0x66) & 0x3FF;
                element->unk16 = (gSineTable[temp2 + 0x100] * 0x5C >> 0xE) + 10;
                element->unk18 = (gSineTable[temp2] * 0x5C >> 0xE) + 0x50;
                sub_80051E8(element);
            }
        }
    }

    element = &characterScreen->unk300;
    sub_80051E8(element);
    element = &characterScreen->unk330;
    sub_80051E8(element);
}

void sub_8033078(struct CharacterSelectionScreen* characterScreen) {
    u8 i;
    u16 temp4;
    struct UNK_0808B3FC_UNK240* element;
    struct UNK_808D124_UNK180* config;

    if (characterScreen->unk3C3 != 0) {
        for (i = 0; i < 10; i++) {
            u8 temp2 = i - Div(i, 5) * 5;
            if (temp2 != characterScreen->unk3C1 || characterScreen->unk3C4 != 0x10) {
                
                element = &characterScreen->unk1D4[temp2];

                element->unk16 = ((gSineTable[(((characterScreen->unk3D8 >> 8) + (i * 0x66) + 2) & 0x3FF) + 0x100] * 0x5C) >> 0xE) + 10;
                element->unk18 = ((gSineTable[(((characterScreen->unk3D8 >> 8) + (i * 0x66) + 2) & 0x3FF)] * 0x5C) >> 0xE) + 0x50;
                sub_80051E8(element);
            }
        }
    } else {
        u16 temp = ((characterScreen->unk3D8 >> 8) + 0x330) & 0x3FF;
        for (i = 0; i < 8; i++) {
            u32 temp2;
            u32 temp3  = (i + 2) & 3;
            if (temp3 != characterScreen->unk3C1 || characterScreen->unk3C4 < 0xD) {
                element = &characterScreen->unk1D4[temp3];
                temp2 = ((temp + i * 0x66) + 4) & 0x3FF;
                element->unk16 = (gSineTable[temp2 + 0x100] * 0x5C >> 0xE) + 10;
                element->unk18 = (gSineTable[temp2] * 0x5C >> 0xE) + 0x50;
                sub_80051E8(element);
            }
        }
    }
    element = &characterScreen->unk2C4;
    config = &characterScreen->unk2F4;
    
    element->unk16 = 0x65;
    element->unk18 = 0x4F;
    element->unk20 = characterScreen->unk3C1 + 5;
    element->unk21 = 0xFF;
    
    config->unk0 = 0;
    config->unk2 = (gSineTable[(characterScreen->unk3C5 * 0x10 + 0x100) & 0x3FF] >> 8) + 0xC0;
    config->unk4 = (gSineTable[(characterScreen->unk3C5 * 0x10 + 0x100) & 0x3FF] >> 8) + 0xC0;
    config->unk6[0] = element->unk16;
    config->unk6[1] = element->unk18;

    element->unk10 = gUnknown_030054B8++ | 0x60;
    sub_8004558(element);
    sub_8004860(element, config);
    sub_80051E8(element);

    
    if (characterScreen->unk3D4 < 8) {
        i = 0xA0;
    } else {
        i = ((0x10 - characterScreen->unk3D4) * 0x14);
    }
    element = &characterScreen->unkCC;
    element->unk16 = i + 0xF0;
    element->unk18 = 0x10;
    sub_80051E8(element);

    if (characterScreen->unk3D4 < 8) {
        i = 8 - characterScreen->unk3D4;
    } else {
        i = 0;
    }

    element = &characterScreen->unkFC;
    if (i != 0) {
        element->unk16 = characterScreen->unk3CE + (0x80 - (gSineTable[i * 0x10 + 0x100] >> 7)) * 2;
    } else {
        element->unk16 = characterScreen->unk3CE;
    }

    element->unk18 = 0x82;
    temp4 = element->unk16;

    if (!(characterScreen->unk3CA >> characterScreen->unk3C1 & 1) && !IsMultiplayer()) {
        element->unk10 |= 0x40000;
        element->unk25 = gUnknown_080D72B1[characterScreen->unk3C1];
    } else {
        element->unk10 &= ~0x40000;
        element->unk25 = 0;
    }
    sub_80051E8(element);

    if (characterScreen->unk3C1 == 1) {
        element = &characterScreen->unk360;
        element->unk16 = temp4;
        element->unk18 = 0x82;

        if (!(characterScreen->unk3CA >> characterScreen->unk3C1 & 1) && !IsMultiplayer()) {
            element->unk10 |= 0x40000;
            element->unk25 = gUnknown_080D72B1[5];
        } else {
            element->unk10 &= ~0x40000;
            element->unk25 = 0;
        }
        sub_80051E8(element);
    }

    if (characterScreen->unk3D4 < 4) {
        i = 8;
    } else if (characterScreen->unk3D4 < 0xC) {
        i = (0xC - characterScreen->unk3D4);
    } else {
        i = 0;
    }
    element = &characterScreen->unk12C;
    element->unk16 = characterScreen->unk3D0 + i * 0x14;
    element->unk18 = 0x90;
    sub_80051E8(element);

    element = &characterScreen->unk15C;
    config = &characterScreen->unk18C;
    
    element->unk16 = 0x28;
    element->unk18 = 0x4F;

    config->unk0 = 0;
    config->unk2 = 0x100;
    config->unk4 = 0x100 - ((0x10 - characterScreen->unk3D4) * 0xF);
    config->unk6[0] = element->unk16;
    config->unk6[1] = element->unk18;

    element->unk10 = gUnknown_030054B8++ | 0x20; 
    sub_8004558(element);
    sub_8004860(element, config);
    sub_80051E8(element);

    element = &characterScreen->unk198;
    config = &characterScreen->unk1C8;
    
    element->unk16 = 0x28;
    element->unk18 = 0x4F;
    
    config->unk0 = 0;
    config->unk2 = 0x100;
    config->unk4 = 0x100 - ((0x10 - characterScreen->unk3D4) * 0xF);
    config->unk6[0] = element->unk16;
    config->unk6[1] = element->unk18;

    element->unk10 = gUnknown_030054B8++ | 0x20; 
    sub_8004558(element);
    sub_8004860(element, config);
    sub_80051E8(element);

    element = &characterScreen->unk300;
    sub_80051E8(element);
    element = &characterScreen->unk330;
    sub_80051E8(element);
}

// https://decomp.me/scratch/LpkD4
// Same issues as the create function
NONMATCH("asm/non_matching/sub_803353C.inc", void sub_803353C(struct CharacterSelectionScreen* characterScreen)) {
    u8 a, b, d;
    u16 c, e, f;
    u8 i;
    s8 somethinga;
    struct UNK_0808B3FC_UNK240* element;
    struct UNK_808D124_UNK180* config;

    s8 lang = gLoadedSaveGame->unk6 - 1;

    if (lang < 0) {
        lang = 0;
    }

    if (lang < 1) {
        somethinga = 0;
    } else {
        somethinga = 1;
    } 

    

    if (characterScreen->unk3C4 >= 8) {
        a = characterScreen->unk3C1;
        b = 0;
        c = 8;
    } else {
        a = characterScreen->unk3C1;
        b = 8 - characterScreen->unk3C4;
        c = characterScreen->unk3C4;
    }

    if (characterScreen->unk3C4 < 4) {
        d = 8;
    } else if (characterScreen->unk3C4 < 12) {
        d = 12 - characterScreen->unk3C4;
    } else {
        d = 0;
    }

    if (characterScreen->unk3C4 == 0) {
        element = &characterScreen->unkFC;
        element->unkA = gUnknown_080D7204[a][0];
        element->unk20 = gUnknown_080D7204[a][1];
        element->unk21 = 0xFF;

        if (!(characterScreen->unk3CA & CHARACTER_BIT(characterScreen->unk3C1)) && !IsMultiplayer()) {
            element->unk10 |= 0x40000;
            element->unk25 = gUnknown_080D72B1[gGameMode];
        } else {
            element->unk10 &= ~0x40000;
            element->unk25 = 0;
        }

        sub_8004558(element);

        if (!(characterScreen->unk3CA & CHARACTER_BIT(characterScreen->unk3C1)) && !IsMultiplayer()) {
            element = &characterScreen->unk12C;
            element->unkA = gUnknown_080D722C[5][0];
            element->unk20 = gUnknown_080D722C[5][1];
            element->unk21 = 0xFF;
            sub_8004558(element);

            element = &characterScreen->unk15C;
            element->unkA = gUnknown_080D71D4[5][0];
            element->unk20 = gUnknown_080D71D4[5][1];
            element->unk21 = 0xFF;
            
            element = &characterScreen->unk198;
            element->unkA = gUnknown_080D71EC[5][0];
            element->unk20 = gUnknown_080D71EC[5][1];
            element->unk21 = 0xFF;
        } else {
            element = &characterScreen->unk12C;
            element->unkA = gUnknown_080D722C[a + somethinga *  6][0];
            element->unk20 = gUnknown_080D722C[a + somethinga *  6][1];
            element->unk21 = 0xFF;
            sub_8004558(element);

            element = &characterScreen->unk15C;
            element->unkA = gUnknown_080D71D4[a][0];
            element->unk20 = gUnknown_080D71D4[a][1];
            element->unk21 = 0xFF;

            element = &characterScreen->unk198;
            element->unkA = gUnknown_080D71EC[a][0];
            element->unk20 = gUnknown_080D71EC[a][1];
            element->unk21 = 0xFF;
        }
    }

    if (characterScreen->unk3C3 != 0) {
        for (i = 0; i < 10; i++) {
            u8 temp2 = i - Div(i, 5) * 5;
            if (temp2 != characterScreen->unk3C1 || characterScreen->unk3C4 < 0xD) {
                
                element = &characterScreen->unk1D4[temp2];

                element->unk16 = ((gSineTable[(((characterScreen->unk3D8 >> 8) + (i * 0x66) + 2) & 0x3FF) + 0x100] * 0x5C) >> 0xE) + 10;
                element->unk18 = ((gSineTable[(((characterScreen->unk3D8 >> 8) + (i * 0x66) + 2) & 0x3FF)] * 0x5C) >> 0xE) + 0x50;
                sub_80051E8(element);
            }
        }
    } else {
        u16 temp = ((characterScreen->unk3D8 >> 8) + 0x330) & 0x3FF;
        for (i = 0; i < 8; i++) {
            u32 temp2;
            u32 temp3  = (i + 2) & 3;
            if (temp3 != characterScreen->unk3C1 || characterScreen->unk3C4 < 0xD) {
                element = &characterScreen->unk1D4[temp3];
                temp2 = ((temp + i * 0x66) + 4) & 0x3FF;
                element->unk16 = (gSineTable[temp2 + 0x100] * 0x5C >> 0xE) + 10;
                element->unk18 = (gSineTable[temp2] * 0x5C >> 0xE) + 0x50;
                sub_80051E8(element);
            }
        }
    }

    if (characterScreen->unk3C4 > 9) {
        element = &characterScreen->unk2C4;
        config = &characterScreen->unk2F4;

        element->unk16 = 0x65;
        element->unk18 = 0x4F;
        element->unk20 = characterScreen->unk3C1 + 5;
        element->unk21 = 0xFF;

        config->unk0 = 0;
        config->unk2 = (gSineTable[(characterScreen->unk3C5 * 0x10 + 0x100) & 0x3FF] >> 8) + 0xC0;
        config->unk4 = (gSineTable[(characterScreen->unk3C5 * 0x10 + 0x100) & 0x3FF] >> 8) + 0xC0;
        config->unk6[0] = element->unk16;
        config->unk6[1] = element->unk18;

        element->unk10 = gUnknown_030054B8++ | 0x60;
        sub_8004558(element);
        sub_8004860(element, config);
        sub_80051E8(element);
    }

    element = &characterScreen->unkFC;

    if (b != 0) {
        element->unk16 = characterScreen->unk3CE + (0x80 - (gSineTable[i * 0x10 + 0x100] >> 7)) * 2;
        f = element->unk16;
        e = characterScreen->unk3CE + (b * 0x12);
        
    } else {
        element->unk16 = characterScreen->unk3CE;
        f = element->unk16;
        e = element->unk16;
    }
    element->unk18 = 0x82;

    if (!(characterScreen->unk3CA & CHARACTER_BIT(characterScreen->unk3C1)) && !IsMultiplayer()) {
        element->unk10 |= 0x40000;
        element->unk25 = gUnknown_080D72B1[characterScreen->unk3C1];
    } else {
        element->unk10 &= ~0x40000;
        element->unk25 = 0;
    }
    sub_80051E8(element);

    if (characterScreen->unk3C1 == 1) {
        element = &characterScreen->unk360;
        element->unk16 = e;
        element->unk18 = 0x82;

        if (!(characterScreen->unk3CA & CHARACTER_BIT(characterScreen->unk3C1)) && !IsMultiplayer()) {
            element->unk10 |= 0x40000;
            element->unk25 = gUnknown_080D72B1[5];
        } else {
            element->unk10 &= ~0x40000;
            element->unk25 = 0;
        }

        sub_80051E8(element);
    }

    if (IsMultiplayer() && characterScreen->unk3DC & CHARACTER_BIT(characterScreen->unk3C1)) {
        element = &characterScreen->unk390;
        element->unk16 = f;
        element->unk18 = 0x82;
        sub_80051E8(element);
    }

    element = &characterScreen->unk12C;
    element->unk16 = characterScreen->unk3D0 + (d * 5) * 4;
    element->unk18 = 0x90;
    sub_80051E8(element);

    element = &characterScreen->unkCC;
    element->unk16 = 0xF0;
    element->unk18 = 0x10;
    sub_80051E8(element);

    element = &characterScreen->unk15C;
    config = &characterScreen->unk18C;
    element->unk16 = 0x28;
    element->unk18 = 0x4F;

    if (c < 8) {
        config->unk0 = 0;
        config->unk2 = 0x100;
        config->unk4 = 0x100 - ((8 - c) * 0x1E);
        config->unk6[0] = element->unk16;
        config->unk6[1] = element->unk18;

        element->unk10 = gUnknown_030054B8++ | 0x20; 
        sub_8004558(element);
        sub_8004860(element, config);
    } else {
        element->unk10 = 0;
    }

    sub_80051E8(element);

    element = &characterScreen->unk198;
    config = &characterScreen->unk1C8;
    element->unk16 = 0x28;
    element->unk18 = 0x4F;

    if (c < 8) {
        config->unk0 = 0;
        config->unk2 = 0x100;
        config->unk4 = 0x100 - ((8 - c) * 0x1E);
        config->unk6[0] = element->unk16;
        config->unk6[1] = element->unk18;

        element->unk10 = gUnknown_030054B8++ | 0x20; 
        sub_8004558(element);
        sub_8004860(element, config);
    } else {
        element->unk10 = 0;
    }

    sub_80051E8(element);
    
    element = &characterScreen->unk300;
    sub_8004558(element);
    sub_80051E8(element);
    
    element = &characterScreen->unk330;
    sub_8004558(element);
    sub_80051E8(element);
}
END_NONMATCH

void sub_8033C64(struct CharacterSelectionScreen* characterScreen) {
    struct UNK_808D124_UNK180* config;
    struct UNK_0808B3FC_UNK240* element, *element2, *element3;
    u8 i;
    if (characterScreen->unk3C3 != 0) {
        for (i = 0; i < 10; i++) {
            u8 temp2 = i - Div(i, 5) * 5;
            if (temp2 != characterScreen->unk3C1 || characterScreen->unk3C4 < 0xD) {
                
                element = &characterScreen->unk1D4[temp2];

                element->unk16 = ((gSineTable[(((characterScreen->unk3D8 >> 8) + (i * 0x66) + 2) & 0x3FF) + 0x100] * 0x5C) >> 0xE) + 10;
                element->unk18 = ((gSineTable[(((characterScreen->unk3D8 >> 8) + (i * 0x66) + 2) & 0x3FF)] * 0x5C) >> 0xE) + 0x50;
                sub_80051E8(element);
            }
        }
    } else {
        u16 temp = ((characterScreen->unk3D8 >> 8) + 0x330) & 0x3FF;
        for (i = 0; i < 8; i++) {
            u32 temp2;
            u32 temp3  = (i + 2) & 3;
            if (temp3 != characterScreen->unk3C1 || characterScreen->unk3C4 < 0xD) {
                element = &characterScreen->unk1D4[temp3];
                temp2 = ((temp + i * 0x66) + 4) & 0x3FF;
                element->unk16 = (gSineTable[temp2 + 0x100] * 0x5C >> 0xE) + 10;
                element->unk18 = (gSineTable[temp2] * 0x5C >> 0xE) + 0x50;
                sub_80051E8(element);
            }
        }
    }
    
    if (characterScreen->unk3C5 != 0) {
        element = &characterScreen->unk2C4;
        config = &characterScreen->unk2F4;

        element->unk16 = 0x65;
        element->unk18 = 0x4F;
        element->unk20 = characterScreen->unk3C1 + 5;
        element->unk21 = 0xFF;

        config->unk0 = 0;
        config->unk2 = (gSineTable[(characterScreen->unk3C5 * 0x10 + 0x100) & 0x3FF] >> 8) + 0xC0;
        config->unk4 = (gSineTable[(characterScreen->unk3C5 * 0x10 + 0x100) & 0x3FF] >> 8) + 0xC0;
        config->unk6[0] = element->unk16;
        config->unk6[1] = element->unk18;

        element->unk10 = gUnknown_030054B8++ | 0x60;
        sub_8004558(element);
        sub_8004860(element, config);
        sub_80051E8(element);
    }
    sub_8004558(&characterScreen->unkFC);
    sub_80051E8(&characterScreen->unkFC);

    if (characterScreen->unk3C1 == 1) {
        element2 = &characterScreen->unk360;
        sub_8004558(element2);
        sub_80051E8(element2);
    }
    if (IsMultiplayer() && (characterScreen->unk3DC & CHARACTER_BIT(characterScreen->unk3C1))) {
        sub_80051E8(&characterScreen->unk390);
    }
    sub_80051E8(&characterScreen->unk12C);
#ifndef NON_MATCHING
    if (&characterScreen->unkCC)
    {
        element3 = &characterScreen->unkCC;
        ++element3; --element3;
    }
    else
    {
        element3 = &characterScreen->unkCC;
        ++element3; --element3;
    }
    sub_80051E8(element3);
#else
    sub_80051E8(&characterScreen->unkCC);
#endif
    sub_80051E8(&characterScreen->unk15C);
    sub_80051E8(&characterScreen->unk198);

    element = &characterScreen->unk300;
    sub_8004558(element);
    sub_80051E8(element);

    element = &characterScreen->unk330;
    sub_8004558(element);
    sub_80051E8(element);
}

void sub_8033F38(void) {
    union MultiSioData* send, *recv;
    u32 i, j;
    struct UNK_0808B3FC_UNK240* element;
    u8 someArray[5] = {0, 0, 0, 0, 0};

    struct CharacterSelectionScreen* characterScreen = TaskGetStructPtr(gCurTask);
    ScrollBackground();

    MultiPakHeartbeat();

    if (IsMultiplayer()) {
        characterScreen->unk3DC = 0;
        
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (i != SIO_MULTI_CNT->id && GetBit(gUnknown_030055B8, i)) {
                recv = &gMultiSioRecv[i];
                if (recv->pat0.unk0 > 0x4020) {
                    characterScreen->unk3DC |= CHARACTER_BIT(recv->pat0.unk2);
                }
            }
        }
    }

    if (gPressedKeys & B_BUTTON) {
        characterScreen->unk3C8 = 0;
        gCurTask->main = sub_8031E84;
        
        element = &characterScreen->unkFC;
        element->unkA = gUnknown_080D7204[characterScreen->unk3C1][0];
        element->unk20 = gUnknown_080D7204[characterScreen->unk3C1][1];
        element->unk21 = 0xFF;
        
        element = &characterScreen->unk360;
        element->unkA = 0x2E0;
        element->unk20 = 10;
        element->unk21 = 0xFF;

        sub_8033C64(characterScreen);

        send = &gMultiSioSend;
        send->pat0.unk0 = 0x4020;
        send->pat0.unk2 = characterScreen->unk3C1;

        m4aSongNumStart(SE_RETURN);
    } else {
        recv = &gMultiSioRecv[0];
        if (recv->pat0.unk0 == 0x4022) {
            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                if (GetBit(gUnknown_030055B8, i)) {
                    recv = &gMultiSioRecv[i];
                    gUnknown_03005500[i] = recv->pat0.unk2;
                }
            }

            if (!(gMultiSioStatusFlags & MULTI_SIO_PARENT)) {
                send = &gMultiSioSend;
                send->pat0.unk0 = 0x4022;
                send->pat0.unk2 = characterScreen->unk3C1;
            }
            characterScreen->unk3CC = 0;
            gCurTask->main = sub_8034358;
            sub_8033C64(characterScreen);
            return;
        }
    
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (GetBit(gUnknown_030055B8, i) && i != SIO_MULTI_CNT->id) {
                recv = &gMultiSioRecv[i];
                if (recv->pat0.unk0 == 0x4021 && recv->pat0.unk2 == characterScreen->unk3C1 && i < SIO_MULTI_CNT->id) {
                    gCurTask->main = sub_8031E84;
                    m4aSongNumStart(SE_RETURN);
                    characterScreen->unk3C8 = 0;
            
                    element = &characterScreen->unkFC;
                    element->unkA = gUnknown_080D7204[characterScreen->unk3C1][0];
                    element->unk20 = gUnknown_080D7204[characterScreen->unk3C1][1];
                    element->unk21 = 0xFF;
                    sub_8004558(element);
                
                    element = &characterScreen->unk360;
                    element->unkA = 0x2E0;
                    element->unk20 = 10;
                    element->unk21 = 0xFF;
                    sub_8004558(element);

                    send = &gMultiSioSend;
                    send->pat0.unk0 = 0x4020;
                    send->pat0.unk2 = characterScreen->unk3C1;
                    sub_8033C64(characterScreen);
                    return;
                }
            }
        }
        
        
        if ((gMultiSioStatusFlags & MULTI_SIO_PARENT)) {
            send = &gMultiSioSend;
            send->pat0.unk0 = 0x4022;
            send->pat0.unk2 = characterScreen->unk3C1;

            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                u16 id;
                if (GetBit(gUnknown_030055B8, i)) {
                    recv = &gMultiSioRecv[i];
                    if (recv->pat0.unk0 != 0x4021) {
                        send->pat0.unk0 = 0x4021;
                        break;
                    }

                    if (++someArray[recv->pat0.unk2] > 1) {
                        send->pat0.unk0 = 0x4021;
                        break;
                    }
                }
            }
        } else {
            send = &gMultiSioSend;
            send->pat0.unk0 = 0x4021;
            send->pat0.unk2 = characterScreen->unk3C1;
        }
        sub_8033C64(characterScreen);
    }
}

NONMATCH("asm/non_matching/sub_8034358.inc", void sub_8034358()) {
    u32 i;
    bool8 found;
    union MultiSioData *send;
    union MultiSioData *recv;
    register struct CharacterSelectionScreen* characterScreen = TaskGetStructPtr(gCurTask);
    MultiPakHeartbeat();

    for (i = 0, found = FALSE; i < MULTI_SIO_PLAYERS_MAX; i++) {
        recv = &gMultiSioRecv[i];
        if (GetBit(gUnknown_030055B8, i) && recv->pat0.unk0 < 0x4022) {
            found = TRUE;
        }
    }

    if (found) {
        if (characterScreen->unk3CC != 0) {
            characterScreen->unk3CC <<= 1;
            if (characterScreen->unk3CC & 0x80) {
                send = &gMultiSioSend;
                send->pat0.unk0 = 0x4021;
                gCurTask->main = sub_8033F38;
            }
        } else {
            characterScreen->unk3CC = 1;
        }
        sub_8033C64(characterScreen);
    } else {
        characterScreen->unk3CC = 0;
        recv = &gMultiSioRecv[0];
        if (recv->pat0.unk0 == 0x4023) {
            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                if (GetBit(gUnknown_030055B8, i)) {
                    recv = &gMultiSioRecv[i];
                    if (!(gMultiSioStatusFlags & MULTI_SIO_PARENT)) {
                        gUnknown_03005500[i] = recv->pat0.unk2;
                    }
                }
            }
            sub_8033C64(characterScreen);
            gCurTask->main = sub_8032AF4;
        } else if (recv->pat0.unk0 == 0x4021) {
            send = &gMultiSioSend;
            send->pat0.unk0 = 0x4020;
            gCurTask->main = sub_8033F38;
        } else {
            u8 mostLevelsAvailable;
            if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
                send = &gMultiSioSend;
                send->pat0.unk0 = 0x4023;
                send->pat0.unk2 = characterScreen->unk3C1;
                mostLevelsAvailable = 0;
    
                for (i = 0; i < NUM_CHARACTERS; i++) {
                    if (mostLevelsAvailable < gLoadedSaveGame->unk7[i]) {
                        mostLevelsAvailable = gLoadedSaveGame->unk7[i];
                    }
                }

                for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                    if (GetBit(gUnknown_030055B8, i) && i != 0) {
                        recv = &gMultiSioRecv[i];
                        gUnknown_03005500[i] = recv->pat0.unk2;
                        if (recv->pat0.unk0 != 0x4022) {
                            send->pat0.unk0 = 0x4022;
                            if (gPressedKeys & B_BUTTON) {
                                send->pat0.unk0 = 0x4021;
                            }
                            break;
                        }
                    }
                }
                
           
            } else {
                send = &gMultiSioSend;
                send->pat0.unk0 = 0x4022;
                // Bug: should probably be set on the packet, not the recv data
                recv->pat0.unk2 = characterScreen->unk3C1;
                mostLevelsAvailable = 0;
    
                for (i = 0; i < NUM_CHARACTERS; i++) {
                    if (mostLevelsAvailable < gLoadedSaveGame->unk7[i]) {
                        mostLevelsAvailable = gLoadedSaveGame->unk7[i];
                    }
                }
            }
            
            send->pat0.unk3 = mostLevelsAvailable;
            sub_8033C64(characterScreen);
            ScrollBackground();
        }
    }
}
END_NONMATCH

void sub_8034638(struct Task* t) {
    u8 i;
    struct CharacterSelectionScreen* characterScreen = TaskGetStructPtr(t);
    VramFree(characterScreen->unk12C.unk4);
    VramFree(characterScreen->unk15C.unk4);
    VramFree(characterScreen->unk198.unk4);
    VramFree(characterScreen->unkCC.unk4);

    for (i = 0; i < NUM_CHARACTERS; i++) {
        VramFree(characterScreen->unk1D4[i].unk4);
    }

    VramFree(characterScreen->unk2C4.unk4);
    VramFree(characterScreen->unk300.unk4);
    VramFree(characterScreen->unk330.unk4);
}
