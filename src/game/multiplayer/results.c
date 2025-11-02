#include "global.h"
#include "core.h"
#include "flags.h"
#include "multi_sio.h"
#include "sprite.h"
#include "task.h"
#include "game/stage/stage.h"
#include "game/course_select.h"
#include "game/multiplayer/results.h"
#include "game/multiplayer/multipak_connection.h"
#include "game/multiplayer_lobby.h"
#include "game/save.h"

#ifdef TEAMPLAY_AVAILABLE
#include "game/multiplayer/team_play.h"
#endif
#include "lib/m4a/m4a.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

struct MultiplayerResultsScreen {
    Background unk0;
    Background unk40;
    // TODO: these may be the wrong way around
    Sprite resultRows[MULTI_SIO_PLAYERS_MAX];
    Sprite characterRows[MULTI_SIO_PLAYERS_MAX];
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

static const TileInfo gUnknown_080D9100[][7] = {
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

static const TileInfo sResultsScreenPlayerCursor[MULTI_SIO_PLAYERS_MAX] = {
    TextElementAlt4(SA2_ANIM_VARIANT_MP_MSG_1P, 0, SA2_ANIM_MP_MSG),
    TextElementAlt4(SA2_ANIM_VARIANT_MP_MSG_2P, 0, SA2_ANIM_MP_MSG),
    TextElementAlt4(SA2_ANIM_VARIANT_MP_MSG_3P, 0, SA2_ANIM_MP_MSG),
    TextElementAlt4(SA2_ANIM_VARIANT_MP_MSG_4P, 0, SA2_ANIM_MP_MSG),
};

static const u16 sResultsScreenBgSelectedCharacters[] = {
    [LANG_DEFAULT] = TM_MP_CHARACTERS_SELECTED_JP, [LANG_JAPANESE] = TM_MP_CHARACTERS_SELECTED_JP,
    [LANG_ENGLISH] = TM_MP_CHARACTERS_SELECTED_EN, [LANG_GERMAN] = TM_MP_CHARACTERS_SELECTED_DE,
    [LANG_FRENCH] = TM_MP_CHARACTERS_SELECTED_FR,  [LANG_SPANISH] = TM_MP_CHARACTERS_SELECTED_ES,
    [LANG_ITALIAN] = TM_MP_CHARACTERS_SELECTED_IT,
};

void CreateMultiplayerResultsScreen(u8 mode)
{
    struct Task *t;
    struct MultiplayerResultsScreen *resultsScreen;
    Background *background;
    u32 i;
    Sprite *s;

    u32 count = 0;
    u32 lang = gLoadedSaveGame->language;
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

    gUnknown_03002280[3][0] = 0;
    gUnknown_03002280[3][1] = 0;
    gUnknown_03002280[3][2] = 0xFF;
    gUnknown_03002280[3][3] = 0x40;

    DmaFill32(3, 0, (void *)VRAM + 0x9fe0, 0x40);
    t = TaskCreate(sub_805C0F0, sizeof(struct MultiplayerResultsScreen), 0x2000, 0, NULL);
    resultsScreen = TASK_DATA(t);

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
    background->graphics.dest = (void *)BG_SCREEN_ADDR(16);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = sResultsScreenBgSelectedCharacters[lang];
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1E;
    background->targetTilesY = 0x20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(3);
    DrawBackground(background);

    for (; count < 4; count++) {
        if (gUnknown_030054B4[count] == -1) {
            break;
        }
    }

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        s32 temp2 = (i + 4) * 0x800;
        if (GetBit(gMultiplayerConnections, i)) {
            s32 temp;
            s = &resultsScreen->resultRows[i];
            s->x = 200;
            s->y = 0x33 + (0x20 * i);
            s->graphics.dest = (void *)(OBJ_VRAM0 + (i * 0x800));
            s->oamFlags = SPRITE_OAM_ORDER(16);
            s->graphics.size = 0;
            temp = gUnknown_030054B4[i];
            if (temp == 5) {
                s->graphics.anim = gUnknown_080D9100[lang][1].anim;
                s->variant = gUnknown_080D9100[lang][1].variant;
            } else if (temp == 4) {
                s->graphics.anim = gUnknown_080D9100[lang][2].anim;
                s->variant = gUnknown_080D9100[lang][2].variant;
            } else if (count == 2 || gGameMode == GAME_MODE_TEAM_PLAY) {
                s->graphics.anim = gUnknown_080D9100[lang][0].anim;
                s->variant = gUnknown_080D9100[lang][0].variant + temp;
            } else {
                s->graphics.anim = gUnknown_080D9100[lang][3].anim;
                s->variant = gUnknown_080D9100[lang][3].variant + temp;
            }
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->frameFlags = 0x1000;
            UpdateSpriteAnimation(s);

            s = &resultsScreen->characterRows[i];
            s->x = 0;
            s->y = 0x1F + (0x20 * i);
            s->graphics.dest = (void *)(OBJ_VRAM0 + temp2);
            s->oamFlags = SPRITE_OAM_ORDER(16);
            s->graphics.size = 0;
            s->graphics.anim = sResultsScreenPlayerCursor[i].anim;
            s->variant = sResultsScreenPlayerCursor[i].variant;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->frameFlags = 0x1000;
            UpdateSpriteAnimation(s);
        }
    }

    if (mode != MULTIPLAYER_RESULTS_MODE_CHARACTER_SELECTION) {
        m4aSongNumStart(MUS_VS_3);
    }
}

static void sub_805C0F0(void)
{
    struct MultiplayerResultsScreen *selectionResultsScreen;
    u16 *unk1884 = gBgOffsetsHBlank;
    gDispCnt |= 0x1800;

    MultiPakHeartbeat();

    selectionResultsScreen = TASK_DATA(gCurTask);

    if ((selectionResultsScreen->animStep += 0x400) > 0xF000) {
        selectionResultsScreen->animStep = 0;

        gCurTask->main = sub_805C30C;
        sub_805C30C();
    } else {
        u32 i;
        u16 j, x;
        u16 unk200 = selectionResultsScreen->animStep >> 8;
        gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
        gHBlankCopyTarget = (void *)REG_ADDR_BG3HOFS;
        gHBlankCopySize = 4;

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
    struct MultiplayerResultsScreen *selectionResultsScreen = TASK_DATA(gCurTask);
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
    struct MultiplayerResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    resultsScreen->animStep += 0x200;

    if (resultsScreen->animStep > 0x1000) {
        resultsScreen->animStep = 0x1000;
        gBldRegs.bldY = 0x10;
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        if (resultsScreen->mode == MULTIPLAYER_RESULTS_MODE_COURSE_COMPLETE) {
            CreateMultiplayerLobbyScreen();
        } else {
            if (gGameMode == GAME_MODE_MULTI_PLAYER) {
                u8 i;
                for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                    if (!GetBit(gMultiplayerConnections, i)) {
                        break;
                    }
                }
                gGameMode = GAME_MODE_MULTI_PLAYER;

#ifdef TEAMPLAY_AVAILABLE
                CreateMultiplayerResultsScreen();
#else
                CreateCourseSelectionScreen(0, gMultiplayerUnlockedLevels, COURSE_SELECT_CUT_SCENE_NONE);
#endif
            } else if (gGameMode == GAME_MODE_SINGLE_PLAYER && gLoadedSaveGame->unlockedLevels[gSelectedCharacter] == 0) {
                gCurrentLevel = 0;
                GameStageStart();
                return;
            } else {
#ifdef TEAMPLAY_AVAILABLE
                CreateMultiplayerResultsScreen();
#else
                CreateCourseSelectionScreen(0, gLoadedSaveGame->unlockedLevels[gSelectedCharacter], COURSE_SELECT_CUT_SCENE_NONE);
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
    u16 *unk1884 = gBgOffsetsHBlank;
    MultiPakHeartbeat();

    selectionResultsScreen = TASK_DATA(gCurTask);
    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    gHBlankCopyTarget = (void *)REG_ADDR_BG3VOFS;
    gHBlankCopySize = 2;

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
    Sprite *item;

    MultiPakHeartbeat();

    resultsScreen = TASK_DATA(gCurTask);

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        if (GetBit(gMultiplayerConnections, i)) {
            item = &resultsScreen->characterRows[i];
            DisplaySprite(item);
            if (resultsScreen->mode == MULTIPLAYER_RESULTS_MODE_COURSE_COMPLETE) {
                item = &resultsScreen->resultRows[i];
                DisplaySprite(item);
            }
        }
    }
}
