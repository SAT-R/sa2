#include "global.h"
#include "main.h"
#include "multiplayer_results.h"
#include "multiplayer_multipak_connection.h"
#include "task.h"
#include "sprite.h"
#include "save.h"
#include "multi_sio.h"
#include "m4a.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "game.h"
#include "flags.h"
#include "course_select.h"
#include "time_attack.h"

#ifdef TEAMPLAY_AVAILABLE
#include "multiplayer_team_play.h"
#endif

struct MultiplayerResultsScreen {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    // TODO: these may be the wrong way around
    struct UNK_0808B3FC_UNK240 resultRows[MULTI_SIO_PLAYERS_MAX];
    struct UNK_0808B3FC_UNK240 characterRows[MULTI_SIO_PLAYERS_MAX];
    u16 animStep;
    u8 numPlayers;
    u8 mode;
    u8 unk204;
}; /* size 0x208 */

static void sub_805C0F0(void);
static void sub_805C30C(void);
static void sub_805C3D0(void);
static void sub_805C69C(void);
static void sub_805C504(void);

static const struct UNK_080E0D64 gUnknown_080D9100[][7] = {
    [LANG_DEFAULT] = {
        TextElementAlt3(0, 0, 1077),
        TextElementAlt3(1, 0, 1077),
        TextElementAlt3(2, 0, 1077),
        TextElementAlt3(3, 0, 1077),
        TextElementAlt3(4, 0, 1077),
        TextElementAlt3(5, 0, 1077),
        TextElementAlt3(6, 0, 1077),
    },
    [LANG_JAPANESE] = {
        TextElementAlt3(0, 0, 1077),
        TextElementAlt3(1, 0, 1077),
        TextElementAlt3(2, 0, 1077),
        TextElementAlt3(3, 0, 1077),
        TextElementAlt3(4, 0, 1077),
        TextElementAlt3(5, 0, 1077),
        TextElementAlt3(6, 0, 1077),
    },
    [LANG_ENGLISH] = {
        TextElementAlt3(0, 0, 1089),
        TextElementAlt3(1, 0, 1089),
        TextElementAlt3(2, 0, 1089),
        TextElementAlt3(3, 0, 1089),
        TextElementAlt3(4, 0, 1089),
        TextElementAlt3(5, 0, 1089),
        TextElementAlt3(6, 0, 1089),
    },
    [LANG_GERMAN] = {
        TextElementAlt3(0, 0, 1090),
        TextElementAlt3(1, 0, 1090),
        TextElementAlt3(2, 0, 1090),
        TextElementAlt3(3, 0, 1089),
        TextElementAlt3(4, 0, 1089),
        TextElementAlt3(5, 0, 1089),
        TextElementAlt3(6, 0, 1089),
    },
    [LANG_FRENCH] = {
        TextElementAlt3(0, 0, 1091),
        TextElementAlt3(1, 0, 1091),
        TextElementAlt3(2, 0, 1091),
        TextElementAlt3(3, 0, 1089),
        TextElementAlt3(4, 0, 1089),
        TextElementAlt3(5, 0, 1089),
        TextElementAlt3(6, 0, 1089),
    },
    [LANG_SPANISH] = {
        TextElementAlt3(0, 0, 1092),
        TextElementAlt3(1, 0, 1092),
        TextElementAlt3(2, 0, 1092),
        TextElementAlt3(3, 0, 1089),
        TextElementAlt3(4, 0, 1089),
        TextElementAlt3(5, 0, 1089),
        TextElementAlt3(6, 0, 1089),
    },
    [LANG_ITALIAN] = {
        TextElementAlt3(0, 0, 1093),
        TextElementAlt3(1, 0, 1093),
        TextElementAlt3(2, 0, 1093),
        TextElementAlt3(3, 0, 1089),
        TextElementAlt3(4, 0, 1089),
        TextElementAlt3(5, 0, 1089),
        TextElementAlt3(6, 0, 1089),
    },
};

static const struct UNK_080E0D64 gUnknown_080D9288[MULTI_SIO_PLAYERS_MAX] = {
    TextElementAlt4(13, 0, 1074),
    TextElementAlt4(14, 0, 1074),
    TextElementAlt4(15, 0, 1074),
    TextElementAlt4(16, 0, 1074),
};

static const u16 gUnknown_080D92A8[] = {
    [LANG_DEFAULT] = 116, [LANG_JAPANESE] = 116, [LANG_ENGLISH] = 117,
    [LANG_GERMAN] = 118,  [LANG_FRENCH] = 119,   [LANG_SPANISH] = 120,
    [LANG_ITALIAN] = 121,
};

void CreateMultiplayerResultsScreen(u8 mode)
{
    struct Task *t;
    struct MultiplayerResultsScreen *resultsScreen;
    struct Unk_03002400 *background;
    u32 i;
    struct UNK_0808B3FC_UNK240 *element;

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

    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;

    gUnknown_03004D80[3] = 0;

    gUnknown_03002280[12] = 0;
    gUnknown_03002280[13] = 0;
    gUnknown_03002280[14] = 0xFF;
    gUnknown_03002280[15] = 0x40;

    DmaFill32(3, 0, (void *)VRAM + 0x9fe0, 0x40);
    t = TaskCreate(sub_805C0F0, sizeof(struct MultiplayerResultsScreen), 0x2000, 0,
                   NULL);
    resultsScreen = TaskGetStructPtr(t);

    resultsScreen->animStep = 0;

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        if (!GetBit(gMultiplayerConnections, i)) {
            break;
        }
    }

    resultsScreen->numPlayers = i;
    resultsScreen->mode = mode;

    if (mode != MULTIPLAYER_RESULTS_MODE_CHARACTER_SELECTION) {
        resultsScreen->unk204 = 222;
    } else {
        resultsScreen->unk204 = 0;
    }

    background = &resultsScreen->unk0;
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

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        s32 temp2 = (i + 4) * 0x800;
        if (GetBit(gMultiplayerConnections, i)) {
            s32 temp;
            element = &resultsScreen->resultRows[i];
            element->unk16 = 200;
            element->unk18 = 0x33 + (0x20 * i);
            element->unk4 = (void *)(OBJ_VRAM0 + (i * 0x800));
            element->unk1A = 0x400;
            element->unk8 = 0;
            temp = gUnknown_030054B4[i];
            if (temp == 5) {
                element->unkA = gUnknown_080D9100[lang][1].unk4;
                element->unk20 = gUnknown_080D9100[lang][1].unk6;
            } else if (temp == 4) {
                element->unkA = gUnknown_080D9100[lang][2].unk4;
                element->unk20 = gUnknown_080D9100[lang][2].unk6;
            } else if (count == 2 || gGameMode == 4) {
                element->unkA = gUnknown_080D9100[lang][0].unk4;
                element->unk20 = gUnknown_080D9100[lang][0].unk6 + temp;
            } else {
                element->unkA = gUnknown_080D9100[lang][3].unk4;
                element->unk20 = gUnknown_080D9100[lang][3].unk6 + temp;
            }
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk21 = 0xFF;
            element->unk22 = 0x10;
            element->unk25 = 0;
            element->unk10 = 0x1000;
            sub_8004558(element);

            element = &resultsScreen->characterRows[i];
            element->unk16 = 0;
            element->unk18 = 0x1F + (0x20 * i);
            element->unk4 = (void *)(OBJ_VRAM0 + temp2);
            element->unk1A = 0x400;
            element->unk8 = 0;
            element->unkA = gUnknown_080D9288[i].unk4;
            element->unk20 = gUnknown_080D9288[i].unk6;
            element->unk14 = 0;
            element->unk1C = 0;
            element->unk21 = 0xFF;
            element->unk22 = 0x10;
            element->unk25 = 0;
            element->unk10 = 0x1000;
            sub_8004558(element);
        }
    }

    if (mode != MULTIPLAYER_RESULTS_MODE_CHARACTER_SELECTION) {
        m4aSongNumStart(MUS_VS_3);
    }
}

static void sub_805C0F0(void)
{
    struct MultiplayerResultsScreen *selectionResultsScreen;
    u16 *unk1884 = gUnknown_03001884;
    gDispCnt |= 0x1800;

    MultiPakHeartbeat();

    selectionResultsScreen = TaskGetStructPtr(gCurTask);

    if ((selectionResultsScreen->animStep += 0x400) > 0xF000) {
        selectionResultsScreen->animStep = 0;

        gCurTask->main = sub_805C30C;
        sub_805C30C();
    } else {
        u32 i;
        u16 j, x;
        u16 unk200 = selectionResultsScreen->animStep >> 8;
        gFlags |= 0x4;
        gUnknown_03002878 = (void *)REG_ADDR_BG3HOFS;
        gUnknown_03002A80 = 4;

        for (x = 0, i = 0; i < 0x20; i++, x++) {
            *unk1884++ = 0;
            *unk1884++ = selectionResultsScreen->unk204;
        }

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (!GetBit(gMultiplayerConnections, i)) {
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
                    *unk1884++ = (gMultiplayerCharacters[i] * 0x20 + 0x20) - x;
                }
                x += 0x20;
                continue;
            }

            for (j = 0; j < 0x20; j++) {
                *unk1884++ = unk200 - 0xF0;
                *unk1884++ = (gMultiplayerCharacters[i] * 0x20 + 0x20) - x;
            }
            x += 0x20;
        }
    }
}

static void sub_805C30C(void)
{
    struct MultiplayerResultsScreen *selectionResultsScreen = TaskGetStructPtr(gCurTask);
    bool32 somebool = FALSE;

    if (selectionResultsScreen->mode == MULTIPLAYER_RESULTS_MODE_COURSE_COMPLETE) {
        if (selectionResultsScreen->animStep++ > 300) {
            somebool = TRUE;
        }
    } else {
        if (selectionResultsScreen->animStep++ > 60) {
            somebool = TRUE;
        }
    }

    if (somebool) {
        selectionResultsScreen->animStep = 0;
        gBldRegs.bldCnt = 0xFF;
        m4aMPlayFadeOut(&gMPlayInfo_BGM, 0);
        m4aMPlayFadeOut(&gMPlayInfo_SE1, 0);
        m4aMPlayFadeOut(&gMPlayInfo_SE2, 0);
        m4aMPlayFadeOut(&gMPlayInfo_SE3, 0);
        gCurTask->main = sub_805C3D0;
        sub_805C3D0();
    } else {
        sub_805C69C();
        sub_805C504();
    }
}

static void sub_805C3D0(void)
{
    struct MultiplayerResultsScreen *resultsScreen = TaskGetStructPtr(gCurTask);
    resultsScreen->animStep += 0x200;

    if (resultsScreen->animStep > 0x1000) {
        resultsScreen->animStep = 0x1000;
        gBldRegs.bldY = 0x10;
        gFlags &= ~0x4;
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        if (resultsScreen->mode == MULTIPLAYER_RESULTS_MODE_COURSE_COMPLETE) {
            CreateMultiplayerLobbyScreen();
        } else {
            if (gGameMode == 3) {
                u8 i;
                for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                    if (!GetBit(gMultiplayerConnections, i)) {
                        break;
                    }
                }
                gGameMode = 3;

#ifdef TEAMPLAY_AVAILABLE
                CreateMultiplayerResultsScreen();
#else
                CreateCourseSelectionScreen(0, gMultiplayerUnlockedLevels,
                                            COURSE_SELECT_CUT_SCENE_NONE);
#endif
            } else if (gGameMode == 0
                       && gLoadedSaveGame->unk7[gSelectedCharacter] == 0) {
                gCurrentLevel = 0;
                sub_801A770();
                return;
            } else {
#ifdef TEAMPLAY_AVAILABLE
                CreateMultiplayerResultsScreen();
#else
                CreateCourseSelectionScreen(0, gLoadedSaveGame->unk7[gSelectedCharacter],
                                            COURSE_SELECT_CUT_SCENE_NONE);
#endif
            }
        }
    } else {
        sub_805C504();
        gBldRegs.bldY = resultsScreen->animStep >> 8;
    }
}

static void sub_805C504(void)
{
    u32 i;
    u16 j, x;

    struct MultiplayerResultsScreen *selectionResultsScreen;
    u16 *unk1884 = gUnknown_03001884;
    MultiPakHeartbeat();

    selectionResultsScreen = TaskGetStructPtr(gCurTask);
    gFlags |= 0x4;
    gUnknown_03002878 = (void *)REG_ADDR_BG3VOFS;
    gUnknown_03002A80 = 2;

    for (x = 0, i = 0; i < 0x20; i++, x++) {
        *unk1884++ = selectionResultsScreen->unk204;
    }

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        if (!GetBit(gMultiplayerConnections, i)) {
            for (j = 0; j < 0x20; j++) {
                *unk1884++ = 0xC0 - x;
            }
            x += 0x20;
            continue;
        }

        if (i & 1) {
            for (j = 0; j < 0x20; j++) {
                *unk1884++ = (gMultiplayerCharacters[i] * 0x20 + 0x20) - x;
            }
            x += 0x20;
            continue;
        }

        for (j = 0; j < 0x20; j++) {
            *unk1884++ = (gMultiplayerCharacters[i] * 0x20 + 0x20) - x;
        }
        x += 0x20;
    }
}

static void sub_805C69C(void)
{
    u32 i;
    struct MultiplayerResultsScreen *resultsScreen;
    struct UNK_0808B3FC_UNK240 *item;

    MultiPakHeartbeat();

    resultsScreen = TaskGetStructPtr(gCurTask);

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        if (GetBit(gMultiplayerConnections, i)) {
            item = &resultsScreen->characterRows[i];
            sub_80051E8(item);
            if (resultsScreen->mode == MULTIPLAYER_RESULTS_MODE_COURSE_COMPLETE) {
                item = &resultsScreen->resultRows[i];
                sub_80051E8(item);
            }
        }
    }
}
