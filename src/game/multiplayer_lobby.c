#include "global.h"
#include "core.h"
#include "game/multiplayer_lobby.h"
#include "task.h"
#include "sprite.h"
#include "game/screen_transition.h"
#include "lib/m4a.h"
#include "constants/songs.h"
#include "game/save.h"
#include "malloc_vram.h"
#include "game/multiplayer/multipak_connection.h"
#include "game/title_screen.h"
#include "game/character_select.h"

#include "constants/animations.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

struct MultiplayerLobbyScreen {
    Sprite chao;
    Sprite uiElements[3];
    Background background;
    struct TransitionState transition;
    bool8 fadeInComplete;
    u8 cursor;
    u16 idleFrame;
    u8 animFrame;
    u8 playersWaiting;
} /* size 0x114 */;

#define ELEMENT_TITLE 0
#define ELEMENT_YES   1
#define ELEMENT_NO    2

#define CURSOR_YES 0
#define CURSOR_NO  1

#define CHAO_EXIT_WAVE_ANIM_LENGTH 120

#define MSG_VS_LOBBY_EXIT             0x40A3
#define MSG_VS_LOBBY_WAITING_FOR_EXIT 0x40A2
#define MSG_VS_LOBBY_CURSOR_MOVE      0x40A1
#define MSG_VS_LOBBY_CURSOR_POS       0x40A0

static const TileInfo sUiText[] = {
    [TextElementOffset(LanguageIndex(LANG_JAPANESE), 3, ELEMENT_TITLE)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_PLAY_AGAIN, 57, SA2_ANIM_MP_MSG),
    [TextElementOffset(LanguageIndex(LANG_JAPANESE), 3, ELEMENT_YES)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_MSG_JAPANESE_8, 12, SA2_ANIM_MP_MSG),
    [TextElementOffset(LanguageIndex(LANG_JAPANESE), 3, ELEMENT_NO)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_MSG_JAPANESE_9, 18, SA2_ANIM_MP_MSG),

    [TextElementOffset(LanguageIndex(LANG_ENGLISH), 3, ELEMENT_TITLE)] = TextElementAlt4(
        SA2_ANIM_VARIANT_MP_COMM_MSG_PLAY_AGAIN, 48, SA2_ANIM_MP_COMM_MSG_EN),
    [TextElementOffset(LanguageIndex(LANG_ENGLISH), 3, ELEMENT_YES)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_YES, 10, SA2_ANIM_MP_COMM_MSG_EN),
    [TextElementOffset(LanguageIndex(LANG_ENGLISH), 3, ELEMENT_NO)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_NO, 10, SA2_ANIM_MP_COMM_MSG_EN),

    [TextElementOffset(LanguageIndex(LANG_GERMAN), 3, ELEMENT_TITLE)]
    = TextElementAlt4(2, 69, SA2_ANIM_MP_COMM_MSG_DE),
    [TextElementOffset(LanguageIndex(LANG_GERMAN), 3, ELEMENT_YES)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_YES, 15, SA2_ANIM_MP_COMM_MSG_DE),
    [TextElementOffset(LanguageIndex(LANG_GERMAN), 3, ELEMENT_NO)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_NO, 21, SA2_ANIM_MP_COMM_MSG_DE),

    [TextElementOffset(LanguageIndex(LANG_FRENCH), 3, ELEMENT_TITLE)]
    = TextElementAlt4(2, 39, SA2_ANIM_MP_COMM_MSG_FR),
    [TextElementOffset(LanguageIndex(LANG_FRENCH), 3, ELEMENT_YES)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_YES, 18, SA2_ANIM_MP_COMM_MSG_FR),
    [TextElementOffset(LanguageIndex(LANG_FRENCH), 3, ELEMENT_NO)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_NO, 18, SA2_ANIM_MP_COMM_MSG_FR),

    [TextElementOffset(LanguageIndex(LANG_SPANISH), 3, ELEMENT_TITLE)]
    = TextElementAlt4(2, 69, SA2_ANIM_MP_COMM_MSG_ES),
    [TextElementOffset(LanguageIndex(LANG_SPANISH), 3, ELEMENT_YES)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_YES, 9, SA2_ANIM_MP_COMM_MSG_ES),
    [TextElementOffset(LanguageIndex(LANG_SPANISH), 3, ELEMENT_NO)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_NO, 15, SA2_ANIM_MP_COMM_MSG_ES),

    [TextElementOffset(LanguageIndex(LANG_ITALIAN), 3, ELEMENT_TITLE)]
    = TextElementAlt4(2, 69, SA2_ANIM_MP_COMM_MSG_IT),
    [TextElementOffset(LanguageIndex(LANG_ITALIAN), 3, ELEMENT_YES)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_YES, 9, SA2_ANIM_MP_COMM_MSG_IT),
    [TextElementOffset(LanguageIndex(LANG_ITALIAN), 3, ELEMENT_NO)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_NO, 15, SA2_ANIM_MP_COMM_MSG_IT),
};
static const s8 sShakeAnimPositions[] = {
    0, 2, 4, 3, 0, -2, -4, -3,
};

static void Task_FadeInOrHandleExit(void);
static void MultiplayerLobbyScreenOnDestroy(struct Task *);
static void CreateUI(struct MultiplayerLobbyScreen *);
static void ScreenMain(void);
static void RenderUI(struct MultiplayerLobbyScreen *);
static u8 CatchInvalidPacket(union MultiSioData *);
static void Task_ListenForExit(void);
static void Task_NotifyExit(void);
static void ExitToCharacterSelect(struct MultiplayerLobbyScreen *);
static void StartMultiplayerExitAnim(struct MultiplayerLobbyScreen *);

void CreateMultiplayerLobbyScreen(void)
{
    struct Task *t
        = TaskCreate(Task_FadeInOrHandleExit, sizeof(struct MultiplayerLobbyScreen),
                     0x1000, 0, MultiplayerLobbyScreenOnDestroy);
    struct MultiplayerLobbyScreen *lobbyScreen = TaskGetStructPtr(t);

    lobbyScreen->fadeInComplete = FALSE;
    lobbyScreen->cursor = CURSOR_YES;
    lobbyScreen->idleFrame = 0;
    lobbyScreen->animFrame = 0;
    lobbyScreen->playersWaiting = 0;
    CreateUI(lobbyScreen);
    NextTransitionFrame(&lobbyScreen->transition);
    m4aSongNumStart(MUS_VS_LOBBY);
}

static void CreateUI(struct MultiplayerLobbyScreen *lobbyScreen)
{
    u8 i;
    Sprite *element;
    Background *background;
    struct TransitionState *transition;
    s8 lang = gLoadedSaveGame->language - 1;

    if (lang < 0) {
        lang = 0;
    }

    // So dumb
    i = 0;

    // Has to match this way
    gDispCnt = 1;
    gDispCnt |= 0x1141;

    gBgCntRegs[0] = 0x1E01;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xFF;
    gUnknown_03002280[0][3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[1][0] = 0;
    gUnknown_03002280[1][1] = 0;
    gUnknown_03002280[1][2] = 0xFF;
    gUnknown_03002280[1][3] = 0x20;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xFF;
    gUnknown_03002280[2][3] = 0x20;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;

    background = &lobbyScreen->background;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->tilesVram = (void *)BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = TM_MP_MESSAGE_BOX_UNKNOWN;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 0;
    sub_8002A3C(background);

    element = &lobbyScreen->chao;
    element->graphics.dest = VramMalloc(0x38);
    element->graphics.anim = SA2_ANIM_MP_CHEESE_SITTING;
    element->variant = 3;
    element->unk21 = 0xFF;
    element->x = (DISPLAY_WIDTH / 2);
    element->y = (DISPLAY_HEIGHT)-50;
    element->unk1A = 0xC0;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->palId = 0;
    element->unk10 = 0x1000;
    sub_8004558(element);

    for (i = 0; i < ARRAY_COUNT(lobbyScreen->uiElements); i++) {
        element = &lobbyScreen->uiElements[i];
        element->graphics.dest
            = VramMalloc(sUiText[TextElementOffsetAlt(lang, 3, i)].numTiles);
        element->graphics.anim = sUiText[TextElementOffsetAlt(lang, 3, i)].anim;
        element->variant = sUiText[TextElementOffsetAlt(lang, 3, i)].variant;
        element->unk21 = 0xFF;
        element->x = (DISPLAY_WIDTH / 2);
        element->y = (DISPLAY_HEIGHT / 4) - 4;
        element->unk1A = 0x100;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->palId = 0;
        element->unk10 = 0;
        sub_8004558(element);
    }

    lobbyScreen->transition.unk0 = 1;
    lobbyScreen->transition.unk4 = 0;
    lobbyScreen->transition.unk2 = 2;
    lobbyScreen->transition.speed = 0x200;
    lobbyScreen->transition.unk8 = 0x3FFF;
    lobbyScreen->transition.unkA = 0;
}

static void Task_FadeInOrHandleExit(void)
{
    u8 i;
    struct MultiplayerLobbyScreen *lobbyScreen = TaskGetStructPtr(gCurTask);
    union MultiSioData *send;
    MultiPakHeartbeat();

    if (lobbyScreen->fadeInComplete && gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        send = &gMultiSioSend;
        send->pat0.unk3 = 0;
        send->pat0.unk2 = lobbyScreen->cursor;
        send->pat0.unk0 = MSG_VS_LOBBY_EXIT;
    } else if (!lobbyScreen->fadeInComplete) {
        send = &gMultiSioSend;
        send->pat0.unk3 = 0;
        send->pat0.unk2 = lobbyScreen->cursor;
        send->pat0.unk0 = MSG_VS_LOBBY_CURSOR_POS;
    }

    // Wait for idle frame to reach 0
    if (lobbyScreen->idleFrame == 0) {
        if (NextTransitionFrame(&lobbyScreen->transition)
            == SCREEN_TRANSITION_COMPLETE) {
            if (lobbyScreen->fadeInComplete) {
                TaskDestroy(gCurTask);
                if (lobbyScreen->cursor != CURSOR_YES) {
                    gMultiSioEnabled = FALSE;
                    MultiSioStop();
                    MultiSioInit(0);
                    CreateTitleScreenAndSkipIntro();
                    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                        gMultiplayerPlayerTasks[i] = NULL;
                    }

                    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                        gMultiplayerCharacters[i] = 0;
                        gUnknown_030054B4[i] = 0;
                        gMultiplayerMissingHeartbeats[i] = 0;
                    }
                } else {
                    CreateCharacterSelectionScreen(0,
                                                   gMultiplayerUnlockedCharacters
                                                       & CHARACTER_BIT(CHARACTER_AMY));
                }
                return;
            } else {
                gCurTask->main = ScreenMain;
                lobbyScreen->fadeInComplete = TRUE;
            }
        }

    } else {
        // Otherwise, we are exiting, and there is an idle frame
        // set so wait for exit anim to complete
        lobbyScreen->idleFrame--;

        if (lobbyScreen->idleFrame > CHAO_EXIT_WAVE_ANIM_LENGTH) {
            lobbyScreen->idleFrame = CHAO_EXIT_WAVE_ANIM_LENGTH;
        }
    }

    RenderUI(lobbyScreen);
}

static void ScreenMain(void)
{
    u8 i;
    struct MultiplayerLobbyScreen *lobbyScreen = TaskGetStructPtr(gCurTask);
#ifndef NON_MATCHING
    register union MultiSioData *recv asm("r4"), *send;
#else
    union MultiSioData *recv, *send;
#endif
    Sprite *chao = &lobbyScreen->chao;
    MultiPakHeartbeat();

    recv = &gMultiSioRecv[0];
    if (CatchInvalidPacket(recv)) {
        return;
    }

    if (!(gMultiSioStatusFlags & MULTI_SIO_PARENT)
        && (recv->pat0.unk0 == MSG_VS_LOBBY_CURSOR_POS
            || recv->pat0.unk0 == MSG_VS_LOBBY_CURSOR_MOVE)) {
        lobbyScreen->cursor = recv->pat0.unk2;
        // cursor moved
        if (recv->pat0.unk3 != 0) {
            lobbyScreen->idleFrame = 0;
            lobbyScreen->animFrame = ARRAY_COUNT(sShakeAnimPositions) - 1;
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);

            if (lobbyScreen->cursor != CURSOR_YES) {
                if (chao->variant != 5) {
                    chao->graphics.anim = SA2_ANIM_MP_CHEESE_SITTING;
                    chao->variant = 4;
                    chao->unk21 = 0xFF;
                }

            } else {
                if (chao->variant != 3) {
                    chao->graphics.anim = SA2_ANIM_MP_CHEESE_SITTING;
                    chao->variant = 6;
                    chao->unk21 = 0xFF;
                }
            }
        }
    }
    send = &gMultiSioSend;
    send->pat0.unk3 = 0;
    send->pat0.unk0 = MSG_VS_LOBBY_CURSOR_POS;

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
            send->pat0.unk0 = MSG_VS_LOBBY_CURSOR_MOVE;
        } else if (gPressedKeys & DPAD_LEFT) {
            lobbyScreen->animFrame = ARRAY_COUNT(sShakeAnimPositions) - 1;
            lobbyScreen->idleFrame = 0;
            lobbyScreen->cursor = 0;

            if (chao->variant != 3) {
                chao->graphics.anim = SA2_ANIM_MP_CHEESE_SITTING;
                chao->variant = 6;
                chao->unk21 = 0xFF;
            }
            send->pat0.unk3 = 1;
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        } else if (gPressedKeys & DPAD_RIGHT) {
            lobbyScreen->animFrame = ARRAY_COUNT(sShakeAnimPositions) - 1;
            lobbyScreen->idleFrame = 0;
            lobbyScreen->cursor = 1;

            if (chao->variant != 5) {
                chao->graphics.anim = SA2_ANIM_MP_CHEESE_SITTING;
                chao->variant = 4;
                chao->unk21 = 0xFF;
            }
            send->pat0.unk3 = 1;
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        }
    }
    send->pat0.unk2 = lobbyScreen->cursor;

    recv = &gMultiSioRecv[0];
    if (CatchInvalidPacket(recv)) {
        return;
    }

    if (recv->pat0.unk0 == MSG_VS_LOBBY_CURSOR_MOVE) {
        if (recv->pat0.unk2 > 1) {
            recv->pat0.unk2 = 1;
        }
        m4aSongNumStart(SE_SELECT);
        lobbyScreen->idleFrame = 0;

        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            gCurTask->main = Task_NotifyExit;
        } else {
            gCurTask->main = Task_ListenForExit;
        }
    }

    // 10 seconds
    if (++lobbyScreen->idleFrame == 600) {
        chao->variant = 1;
    }

    RenderUI(lobbyScreen);
}

static void Task_NotifyExit(void)
{
    u8 i;
    struct MultiplayerLobbyScreen *lobbyScreen = TaskGetStructPtr(gCurTask);
#ifndef NON_MATCHING
    register union MultiSioData *send asm("r4");
#else
    union MultiSioData *send;
#endif
    MultiPakHeartbeat();

    for (i = 1; i < MULTI_SIO_PLAYERS_MAX; i++) {
        if (GetBit(gMultiplayerConnections, i)) {
            if (CatchInvalidPacket(&gMultiSioRecv[i])) {
                return;
            }
            if (gMultiSioRecv[i].pat0.unk0 == MSG_VS_LOBBY_WAITING_FOR_EXIT) {
                lobbyScreen->playersWaiting |= 1 << (i - 1);
            }
        }
    }

    // All players waiting, notify
    if (lobbyScreen->playersWaiting == gMultiplayerConnections >> 1) {
        send = &gMultiSioSend;
        send->pat0.unk3 = 0;
        send->pat0.unk2 = lobbyScreen->cursor;
        send->pat0.unk0 = MSG_VS_LOBBY_EXIT;

        if (lobbyScreen->cursor != CURSOR_YES) {
            StartMultiplayerExitAnim(lobbyScreen);
        } else {
            ExitToCharacterSelect(lobbyScreen);
        }
        RenderUI(lobbyScreen);
        return;
    }

    send = &gMultiSioSend;
    send->pat0.unk2 = lobbyScreen->cursor;
    send->pat0.unk3 = 0;
    send->pat0.unk0 = MSG_VS_LOBBY_CURSOR_MOVE;
    RenderUI(lobbyScreen);
    if (++lobbyScreen->idleFrame > 8) {
        TaskDestroy(gCurTask);
        MultiPakCommunicationError();
    }
}

static void Task_ListenForExit(void)
{
    struct MultiplayerLobbyScreen *lobbyScreen = TaskGetStructPtr(gCurTask);
#ifndef NON_MATCHING
    register union MultiSioData *recv, *send asm("r4");
#else
    union MultiSioData *recv, *send;
#endif

    MultiPakHeartbeat();

    recv = &gMultiSioRecv[0];
    if (CatchInvalidPacket(recv)) {
        return;
    }

    if (recv->pat0.unk0 == MSG_VS_LOBBY_EXIT) {
        if (lobbyScreen->cursor != CURSOR_YES) {
            StartMultiplayerExitAnim(lobbyScreen);
        } else {
            ExitToCharacterSelect(lobbyScreen);
        }
    }
    send = &gMultiSioSend;
    send->pat0.unk3 = 0;
    send->pat0.unk2 = 0;
    send->pat0.unk0 = MSG_VS_LOBBY_WAITING_FOR_EXIT;
    RenderUI(lobbyScreen);
}

static void StartMultiplayerExitAnim(struct MultiplayerLobbyScreen *lobbyScreen)
{
    Sprite *chao = &lobbyScreen->chao;
    lobbyScreen->transition.unk4 = 0;
    lobbyScreen->transition.unk2 = 1;
    lobbyScreen->transition.unkA = 0;
    lobbyScreen->transition.speed = 0x100;
    lobbyScreen->idleFrame = CHAO_EXIT_WAVE_ANIM_LENGTH;
    m4aSongNumStop(MUS_VS_LOBBY);
    m4aSongNumStart(MUS_VS_EXIT);

    // Cheese waves at the Player
    chao->graphics.anim = SA2_ANIM_MP_CHEESE_WAVING;
    chao->variant = 0;
    chao->unk21 = 0xFF;
    gCurTask->main = Task_FadeInOrHandleExit;
}

static void RenderUI(struct MultiplayerLobbyScreen *lobbyScreen)
{
    Sprite *element = &lobbyScreen->chao;
    // Chao anim finished
    if (!sub_8004558(element)) {
        if (lobbyScreen->cursor != CURSOR_YES
            && element->graphics.anim == SA2_ANIM_MP_CHEESE_WAVING) {
            element->variant = 1;
        } else {
            if (element->variant == 6) {
                element->variant = 3;
            }

            if (element->variant == 4) {
                element->variant = 5;
            }
        }
    }

    sub_80051E8(element);

    element = &lobbyScreen->uiElements[ELEMENT_TITLE];
    sub_80051E8(element);

    element = &lobbyScreen->uiElements[ELEMENT_YES];
    if (lobbyScreen->cursor != CURSOR_YES) {
        element->x = (DISPLAY_WIDTH / 6) + 4;
        element->palId = 1;
    } else {
        element->x = sShakeAnimPositions[lobbyScreen->animFrame] + 0x2C;
        element->palId = 0;
    }
    element->y = DISPLAY_HEIGHT - 50;
    sub_80051E8(element);

    element = &lobbyScreen->uiElements[ELEMENT_NO];

    if (lobbyScreen->cursor != CURSOR_YES) {
        element->x = sShakeAnimPositions[lobbyScreen->animFrame] + 0xC0;
        element->palId = 15;
    } else {
        element->x = (DISPLAY_WIDTH - 48);
        element->palId = 0;
    }
    element->y = DISPLAY_HEIGHT - 50;
    sub_80051E8(element);

    if (lobbyScreen->animFrame > 0) {
        lobbyScreen->animFrame--;
    }
}

static void MultiplayerLobbyScreenOnDestroy(struct Task *t)
{
    u8 i;
    struct MultiplayerLobbyScreen *lobbyScreen = TaskGetStructPtr(t);
    VramFree(lobbyScreen->chao.graphics.dest);

    for (i = 0; i < 3; i++) {
        VramFree(lobbyScreen->uiElements[i].graphics.dest);
    }
}

static void ExitToCharacterSelect(struct MultiplayerLobbyScreen *lobbyScreen)
{
    lobbyScreen->idleFrame = 0;
    lobbyScreen->transition.unk4 = 0;
    lobbyScreen->transition.unk2 = 1;
    lobbyScreen->transition.speed = 0x200;
    lobbyScreen->transition.unkA = 0;
    gCurTask->main = Task_FadeInOrHandleExit;
}

static bool8 CatchInvalidPacket(union MultiSioData *packet)
{
    if (packet->pat0.unk0 <= MSG_VS_LOBBY_EXIT
        && packet->pat0.unk0 >= MSG_VS_LOBBY_CURSOR_POS) {
        return FALSE;
    }

    if (packet->pat0.unk0 == 0) {
        return FALSE;
    }

    TaskDestroy(gCurTask);
    MultiPakCommunicationError();
    return TRUE;
}
