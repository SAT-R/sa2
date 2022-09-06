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
    u8 filler3CC[2];
    u16 unk3CE;
    u16 unk3D0;
    u8 filler3D2[2];
    u32 unk3D4;
    s32 unk3D8;
    u32 unk3DC;
}; /* size 0x3E0 */

void sub_8031C64(void);
void sub_8034638(struct Task*);

extern const u16 gUnknown_080D71D4[6][2];
extern const u16 gUnknown_080D71EC[6][2];
extern const u16 gUnknown_080D725C[6][2];
extern const u16 gUnknown_080D7204[6][2];
extern const u16 gUnknown_080D722C[12][2];

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

void sub_8031CD8(void);

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

void sub_8031E10(void);
void sub_8033078(struct CharacterSelectionScreen* characterScreen);
void sub_8032E38(struct CharacterSelectionScreen* characterScreen);

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

void sub_8031E84(void);
void sub_803353C(struct CharacterSelectionScreen* characterScreen);

void sub_8031E10(void) {
    struct CharacterSelectionScreen* characterScreen = TaskGetStructPtr(gCurTask);
    u32 var = ++characterScreen->unk3D4;
    characterScreen->unk3C5++;
    if (var >= 0x10) {
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


extern const u16 gUnknown_080D7218[4][2];
extern const u16 gUnknown_080D7278[5];

extern const u8 gUnknown_080D7282[4][5];

void sub_8032D9C(void);
void sub_8032AF4(void);
void sub_8033F38(void);
void sub_8033C64(struct CharacterSelectionScreen*);
void sub_8032508(void);
void sub_803274C(void);

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

extern const u16 gUnknown_080D7296[8];

void sub_8032990(void);

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


extern const u8 gUnknown_080D72AC[5];

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
