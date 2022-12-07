#include "time_attack_lobby.h"
#include "main.h"
#include "sprite.h"
#include "save.h"
#include "transition.h"
#include "game.h"
#include "malloc_vram.h"
#include "m4a.h"
#include "character_select.h"
#include "course_select.h"
#include "profile.h"
#include "title_screen.h"
#include "zones.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/songs.h"

struct TimeAttackLobbyScreen {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    struct UNK_0808B3FC_UNK240 unk80;
    struct UNK_0808B3FC_UNK240 unkB0[5];
    struct UNK_802D4CC_UNK270 unk1A0;
    u8 unk1AC;
    u8 unk1AD;
    u8 unk1AE;
    u8 unk1AF;
};

const struct UNK_080E0D64 gUnknown_080E0474[] = {
    TextElementAlt4(0, 20, 0),   TextElementAlt4(0, 16, 91),
    TextElementAlt4(0, 30, 182), TextElementAlt4(0, 20, 273),
    TextElementAlt4(0, 20, 364), TextElementAlt4(3, 64, 9),
    TextElementAlt4(3, 64, 100), TextElementAlt4(3, 64, 191),
    TextElementAlt4(3, 64, 282), TextElementAlt4(3, 64, 373),
};

const struct UNK_080E0D64 gUnknown_080E04C4[] = {
    TextElementAlt4(0, 9, 455),
    TextElementAlt4(0, 9, 456),
};

const struct UNK_080E0D64 gUnknown_080E04D4[] = {
    TextElementAlt4(0, 22, 1051), TextElementAlt4(1, 32, 1051),
    TextElementAlt4(2, 22, 1051), TextElementAlt4(3, 22, 1051),
    TextElementAlt4(4, 10, 1051), TextElementAlt4(0, 24, 1052),
    TextElementAlt4(1, 42, 1052), TextElementAlt4(2, 36, 1052),
    TextElementAlt4(3, 30, 1052), TextElementAlt4(4, 8, 1052),
    TextElementAlt4(0, 24, 1053), TextElementAlt4(1, 36, 1053),
    TextElementAlt4(2, 42, 1053), TextElementAlt4(3, 36, 1053),
    TextElementAlt4(4, 20, 1053), TextElementAlt4(0, 24, 1054),
    TextElementAlt4(1, 48, 1054), TextElementAlt4(2, 36, 1054),
    TextElementAlt4(3, 32, 1054), TextElementAlt4(4, 8, 1054),
    TextElementAlt4(0, 44, 1055), TextElementAlt4(1, 44, 1055),
    TextElementAlt4(2, 38, 1055), TextElementAlt4(3, 32, 1055),
    TextElementAlt4(4, 8, 1055),  TextElementAlt4(0, 20, 1056),
    TextElementAlt4(1, 44, 1056), TextElementAlt4(2, 40, 1056),
    TextElementAlt4(3, 28, 1056), TextElementAlt4(4, 12, 1056),
};

#define IsBossTimeAttack() ((gGameMode / 2) % 2)

void sub_8088944(struct TimeAttackLobbyScreen *lobbyScreen)
{
    struct UNK_802D4CC_UNK270 *transitionConfig;
    struct Unk_03002400 *background;
    struct UNK_0808B3FC_UNK240 *element;
    s8 lang = gLoadedSaveGame->unk6 - 1;
    u32 i;

    if (lang < 0) {
        lang = 0;
    }

    gDispCnt = 1;
    gDispCnt |= 0x1341;
    gBgCntRegs[0] = 0x1D05;
    gBgCntRegs[1] = 0x702;

    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xff;
    gUnknown_03002280[3] = 32;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xff;
    gUnknown_03002280[7] = 32;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xff;
    gUnknown_03002280[11] = 32;

    gBgScrollRegs[0][0] = 0xFFF8;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;

    for (i = 0; i < 5; i++) {
        element = &lobbyScreen->unkB0[i + 1];
        if (i != 3) {
            if (i > 3) {
                element = &lobbyScreen->unkB0[i];
            }

            if (i == 2 && (gGameMode & GAME_MODE_BOSS_TIME_ATTACK)) {
                element = &lobbyScreen->unkB0[3];
                i = 3;
            }
            element->vram = VramMalloc(gUnknown_080E04D4[lang * 5 + i].numTiles);
            element->anim = gUnknown_080E04D4[lang * 5 + i].anim;
            element->variant = gUnknown_080E04D4[lang * 5 + i].variant;
            element->unk21 = 0xFF;
            element->x = (DISPLAY_WIDTH / 2);
            element->y = i * 16 + 24;
            if (i > 2) {
                element->y -= 16;
            }
            element->unk1A = 0x100;
            element->unk8 = 0;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk22 = 0x10;
            element->focused = 0;
            element->unk28 = -1;
            element->unk10 = 0x1000;
            sub_8004558(element);
        }
    }

    element = &lobbyScreen->unk80;
    element->vram = NULL;
    element->anim = SA2_ANIM_MSG_JP_TRY_AGAIN;
    element->variant = 5;
    element->unk21 = 0xFF;
    element->x = 0;
    element->y = 0;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28 = -1;
    element->unk10 = 0x1000;
    sub_8004558(element);

    element = &lobbyScreen->unk80;
    element->vram = VramMalloc(gUnknown_080E0474[gSelectedCharacter].numTiles);
    element->anim = gUnknown_080E0474[gSelectedCharacter].anim;
    element->variant = gUnknown_080E0474[gSelectedCharacter].variant;
    element->unk21 = 0xFF;
    element->x = (DISPLAY_WIDTH / 2);
    element->y = (DISPLAY_HEIGHT * (13. / 16.));
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28 = -1;
    element->unk10 = 0x1400;
    sub_8004558(element);

    lobbyScreen->unkB0[0].vram = 0;

    if (gSelectedCharacter == CHARACTER_CREAM) {
        lobbyScreen->unk1AC = 1;
        element = &lobbyScreen->unkB0[0];
        element->vram = VramMalloc(gUnknown_080E04C4[0].numTiles);
        element->anim = gUnknown_080E04C4[0].anim;
        element->variant = gUnknown_080E04C4[0].variant;
        element->unk21 = 0xFF;
        element->x = (DISPLAY_WIDTH * (5. / 12.));
        element->y = (DISPLAY_HEIGHT * (11. / 16.));
        element->unk1A = 0x140;
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = 0;
        element->unk28 = -1;
        element->unk10 = 0x1400;
        sub_8004558(element);
    }

    background = &lobbyScreen->unk40;
    background->unk4 = BG_SCREEN_ADDR(8);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(29);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x96;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1C;
    background->unk28 = 0xC;
    background->unk2A = 0;
    background->unk2E = 0;
    sub_8002A3C(background);

    background = &lobbyScreen->unk0;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(7);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x97;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->unk2E = 1;
    sub_8002A3C(background);

    transitionConfig = &lobbyScreen->unk1A0;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk2 = 2;
    transitionConfig->unk6 = 0x200;
    transitionConfig->unk8 = 0x3FFF;
    transitionConfig->unkA = 0;

    m4aSongNumStart(MUS_TIME_ATTACK_MENU);
    sub_802D4CC(transitionConfig);
}

void sub_8088EB4(void);

void sub_8088CC4(void)
{
    struct TimeAttackLobbyScreen *lobbyScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *element;
    u32 i;

    for (i = 0; i < 4; i++) {
        element = &lobbyScreen->unkB0[i + 1];
        if (i == lobbyScreen->unk1AD) {
            element->focused = 0;
        } else {
            element->focused = 1;
        }
        sub_80051E8(element);
    }
    element = &lobbyScreen->unk80;
    sub_8004558(element);
    sub_80051E8(element);

    if (lobbyScreen->unk1AC != 0) {
        element = &lobbyScreen->unkB0[0];
        sub_8004558(element);
        sub_80051E8(element);
    }

    if (sub_802D4CC(&lobbyScreen->unk1A0) == 1) {
        gCurTask->main = sub_8088EB4;
    }
}

void sub_8088D60(void)
{
    struct TimeAttackLobbyScreen *lobbyScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *element;
    u32 i;
    if (sub_802D4CC(&lobbyScreen->unk1A0) == 1) {
        TaskDestroy(gCurTask);
        switch (lobbyScreen->unk1AD) {
            case 0:
                sub_801A770();
                break;
            case 1:
                CreateCharacterSelectionScreen(gSelectedCharacter,
                                               gLoadedSaveGame->unk13
                                                   & CHARACTER_BIT(CHARACTER_AMY));
                gCurrentLevel = LEVEL_INDEX(ZONE_1, ACT_1);
                break;
            case 2:
                CreateTimeAttackLevelSelectScreen(IsBossTimeAttack(), gSelectedCharacter,
                                                  gCurrentLevel);
                break;
            case 3:
                CreateTitleScreenAndSkipIntro();
                break;
        }
        return;
    }

    for (i = 0; i < 4; i++) {
        element = &lobbyScreen->unkB0[i + 1];
        sub_80051E8(element);
    }

    element = &lobbyScreen->unk80;
    switch (lobbyScreen->unk1AD) {
        case 1:
            element->x -= 4;
            break;
        case 0:
        case 2:
            element->x += 4;
            break;
    }
    sub_8004558(element);
    sub_80051E8(element);

    if (lobbyScreen->unk1AC == 0) {
        return;
    }

    element = &lobbyScreen->unkB0[0];
    switch (lobbyScreen->unk1AD) {
        case 1:
            element->x -= 2;
            break;
        case 0:
        case 2:
            element->x += 3;
            break;
    }

    sub_8004558(element);
    sub_80051E8(element);
}

void sub_8088EB4(void)
{
    struct TimeAttackLobbyScreen *lobbyScreen = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *element;
    struct UNK_802D4CC_UNK270 *transitionConfig;
    u32 i;

    if (gRepeatedKeys & (DPAD_UP) && lobbyScreen->unk1AD != 0) {
        lobbyScreen->unk1AD--;
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    } else if (gRepeatedKeys & DPAD_DOWN && lobbyScreen->unk1AD != 3) {
        lobbyScreen->unk1AD++;
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    }

    for (i = 0; i < 4; i++) {
        element = &lobbyScreen->unkB0[i + 1];
        if (i == lobbyScreen->unk1AD) {
            element->focused = 0;
        } else {
            element->focused = 1;
        }
        sub_80051E8(element);
    }
    element = &lobbyScreen->unk80;
    sub_8004558(element);
    sub_80051E8(element);

    if (lobbyScreen->unk1AC != 0) {
        element = &lobbyScreen->unkB0[0];
        sub_8004558(element);
        sub_80051E8(element);
    }

    if (gRepeatedKeys & A_BUTTON) {
        if (lobbyScreen->unk1AD != 3) {
            element = &lobbyScreen->unk80;
            VramFree(element->vram);
            element->vram
                = VramMalloc(gUnknown_080E0474[gSelectedCharacter + 5].numTiles);
            element->anim = gUnknown_080E0474[gSelectedCharacter + 5].anim;
            element->variant = gUnknown_080E0474[gSelectedCharacter + 5].variant;
            element->unk21 = 0xFF;
            element->unk22 = 0x40;
            if (lobbyScreen->unk1AD == 1) {
                element->unk10 &= ~0x400;
            }
            sub_8004558(element);

            if (lobbyScreen->unk1AC != 0) {
                element = &lobbyScreen->unkB0[0];
                VramFree(element->vram);

                element->vram = VramMalloc(gUnknown_080E04C4[1].numTiles);
                element->anim = gUnknown_080E04C4[1].anim;
                element->variant = gUnknown_080E04C4[1].variant;
                element->unk21 = 0xFF;
                element->unk22 = 0x40;
                if (lobbyScreen->unk1AD == 1) {
                    element->unk10 &= ~0x400;
                }
                sub_8004558(element);
            }
        }

        lobbyScreen->unk1A0.unkA = 0;
        lobbyScreen->unk1A0.unk4 = 0;
        lobbyScreen->unk1A0.unk2 = 1;
        m4aSongNumStart(SE_SELECT);
        m4aMPlayFadeOut(&gMPlayInfo_BGM, 0x1000);
        gCurTask->main = sub_8088D60;
    }
}

void sub_8089104(struct Task *);

void CreateTimeAttackLobbyScreen()
{
    struct Task *t = TaskCreate(sub_8088CC4, sizeof(struct TimeAttackLobbyScreen),
                                0x1000, 0, sub_8089104);
    struct TimeAttackLobbyScreen *lobbyScreen = TaskGetStructPtr(t);

    lobbyScreen->unk1AD = 0;
    lobbyScreen->unk1AC = 0;
    sub_8088944(lobbyScreen);
}

void sub_8089104(struct Task *t)
{
    struct TimeAttackLobbyScreen *lobbyScreen = TaskGetStructPtr(t);
    VramFree(lobbyScreen->unkB0[1].vram);
    VramFree(lobbyScreen->unkB0[2].vram);
    VramFree(lobbyScreen->unkB0[3].vram);
    VramFree(lobbyScreen->unkB0[4].vram);
    VramFree(lobbyScreen->unk80.vram);
    if (lobbyScreen->unk1AC != 0) {
        VramFree(lobbyScreen->unkB0[0].vram);
    }
}
