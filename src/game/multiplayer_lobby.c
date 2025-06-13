#include "global.h"
#include "core.h"
#include "game/multiplayer_lobby.h"
#include "task.h"
#include "sprite.h"
#include "game/stage/screen_fade.h"
#include "lib/m4a/m4a.h"
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
    ScreenFade fade;
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

    [TextElementOffset(LanguageIndex(LANG_ENGLISH), 3, ELEMENT_TITLE)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_PLAY_AGAIN, 48, SA2_ANIM_MP_COMM_MSG_EN),
    [TextElementOffset(LanguageIndex(LANG_ENGLISH), 3, ELEMENT_YES)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_YES, 10, SA2_ANIM_MP_COMM_MSG_EN),
    [TextElementOffset(LanguageIndex(LANG_ENGLISH), 3, ELEMENT_NO)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_NO, 10, SA2_ANIM_MP_COMM_MSG_EN),

    [TextElementOffset(LanguageIndex(LANG_GERMAN), 3, ELEMENT_TITLE)] = TextElementAlt4(2, 69, SA2_ANIM_MP_COMM_MSG_DE),
    [TextElementOffset(LanguageIndex(LANG_GERMAN), 3, ELEMENT_YES)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_YES, 15, SA2_ANIM_MP_COMM_MSG_DE),
    [TextElementOffset(LanguageIndex(LANG_GERMAN), 3, ELEMENT_NO)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_NO, 21, SA2_ANIM_MP_COMM_MSG_DE),

    [TextElementOffset(LanguageIndex(LANG_FRENCH), 3, ELEMENT_TITLE)] = TextElementAlt4(2, 39, SA2_ANIM_MP_COMM_MSG_FR),
    [TextElementOffset(LanguageIndex(LANG_FRENCH), 3, ELEMENT_YES)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_YES, 18, SA2_ANIM_MP_COMM_MSG_FR),
    [TextElementOffset(LanguageIndex(LANG_FRENCH), 3, ELEMENT_NO)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_NO, 18, SA2_ANIM_MP_COMM_MSG_FR),

    [TextElementOffset(LanguageIndex(LANG_SPANISH), 3, ELEMENT_TITLE)] = TextElementAlt4(2, 69, SA2_ANIM_MP_COMM_MSG_ES),
    [TextElementOffset(LanguageIndex(LANG_SPANISH), 3, ELEMENT_YES)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_YES, 9, SA2_ANIM_MP_COMM_MSG_ES),
    [TextElementOffset(LanguageIndex(LANG_SPANISH), 3, ELEMENT_NO)]
    = TextElementAlt4(SA2_ANIM_VARIANT_MP_COMM_MSG_NO, 15, SA2_ANIM_MP_COMM_MSG_ES),

    [TextElementOffset(LanguageIndex(LANG_ITALIAN), 3, ELEMENT_TITLE)] = TextElementAlt4(2, 69, SA2_ANIM_MP_COMM_MSG_IT),
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
    struct Task *t = TaskCreate(Task_FadeInOrHandleExit, sizeof(struct MultiplayerLobbyScreen), 0x1000, 0, MultiplayerLobbyScreenOnDestroy);
    struct MultiplayerLobbyScreen *lobbyScreen = TASK_DATA(t);

    lobbyScreen->fadeInComplete = FALSE;
    lobbyScreen->cursor = CURSOR_YES;
    lobbyScreen->idleFrame = 0;
    lobbyScreen->animFrame = 0;
    lobbyScreen->playersWaiting = 0;
    CreateUI(lobbyScreen);
    UpdateScreenFade(&lobbyScreen->fade);
    m4aSongNumStart(MUS_VS_LOBBY);
}

static void CreateUI(struct MultiplayerLobbyScreen *lobbyScreen)
{
    u8 i;
    Sprite *s;
    Background *background;
    ScreenFade *fade;
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
    background->layoutVram = (void *)BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_MP_MESSAGE_BOX_UNKNOWN;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x14;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);

    s = &lobbyScreen->chao;
    s->graphics.dest = VramMalloc(0x38);
    s->graphics.anim = SA2_ANIM_MP_CHEESE_SITTING;
    s->variant = 3;
    s->prevVariant = -1;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT)-50;
    s->oamFlags = SPRITE_OAM_ORDER(3);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);

    for (i = 0; i < ARRAY_COUNT(lobbyScreen->uiElements); i++) {
        s = &lobbyScreen->uiElements[i];
        s->graphics.dest = VramMalloc(sUiText[TextElementOffsetAlt(lang, 3, i)].numTiles);
        s->graphics.anim = sUiText[TextElementOffsetAlt(lang, 3, i)].anim;
        s->variant = sUiText[TextElementOffsetAlt(lang, 3, i)].variant;
        s->prevVariant = -1;
        s->x = (DISPLAY_WIDTH / 2);
        s->y = (DISPLAY_HEIGHT / 4) - 4;
        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = 0;
        UpdateSpriteAnimation(s);
    }

    lobbyScreen->fade.window = 1;
    lobbyScreen->fade.brightness = 0;
    lobbyScreen->fade.flags = 2;
    lobbyScreen->fade.speed = Q(2.0);
    lobbyScreen->fade.bldCnt = 0x3FFF;
    lobbyScreen->fade.bldAlpha = 0;
}

static void Task_FadeInOrHandleExit(void)
{
    u8 i;
    struct MultiplayerLobbyScreen *lobbyScreen = TASK_DATA(gCurTask);
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
        if (UpdateScreenFade(&lobbyScreen->fade) == SCREEN_FADE_COMPLETE) {
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
                    CreateCharacterSelectionScreen(0, gMultiplayerUnlockedCharacters & CHARACTER_BIT(CHARACTER_AMY));
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
    struct MultiplayerLobbyScreen *lobbyScreen = TASK_DATA(gCurTask);
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
        && (recv->pat0.unk0 == MSG_VS_LOBBY_CURSOR_POS || recv->pat0.unk0 == MSG_VS_LOBBY_CURSOR_MOVE)) {
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
                    chao->prevVariant = -1;
                }

            } else {
                if (chao->variant != 3) {
                    chao->graphics.anim = SA2_ANIM_MP_CHEESE_SITTING;
                    chao->variant = 6;
                    chao->prevVariant = -1;
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
                chao->prevVariant = -1;
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
                chao->prevVariant = -1;
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
    struct MultiplayerLobbyScreen *lobbyScreen = TASK_DATA(gCurTask);
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
        LinkCommunicationError();
    }
}

static void Task_ListenForExit(void)
{
    struct MultiplayerLobbyScreen *lobbyScreen = TASK_DATA(gCurTask);
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
    lobbyScreen->fade.brightness = 0;
    lobbyScreen->fade.flags = 1;
    lobbyScreen->fade.bldAlpha = 0;
    lobbyScreen->fade.speed = Q(1.0);
    lobbyScreen->idleFrame = CHAO_EXIT_WAVE_ANIM_LENGTH;
    m4aSongNumStop(MUS_VS_LOBBY);
    m4aSongNumStart(MUS_VS_EXIT);

    // Cheese waves at the Player
    chao->graphics.anim = SA2_ANIM_MP_CHEESE_WAVING;
    chao->variant = 0;
    chao->prevVariant = -1;
    gCurTask->main = Task_FadeInOrHandleExit;
}

static void RenderUI(struct MultiplayerLobbyScreen *lobbyScreen)
{
    Sprite *s = &lobbyScreen->chao;
    // Chao anim finished
    if (!UpdateSpriteAnimation(s)) {
        if (lobbyScreen->cursor != CURSOR_YES && s->graphics.anim == SA2_ANIM_MP_CHEESE_WAVING) {
            s->variant = 1;
        } else {
            if (s->variant == 6) {
                s->variant = 3;
            }

            if (s->variant == 4) {
                s->variant = 5;
            }
        }
    }

    DisplaySprite(s);

    s = &lobbyScreen->uiElements[ELEMENT_TITLE];
    DisplaySprite(s);

    s = &lobbyScreen->uiElements[ELEMENT_YES];
    if (lobbyScreen->cursor != CURSOR_YES) {
        s->x = (DISPLAY_WIDTH / 6) + 4;
        s->palId = 1;
    } else {
        s->x = sShakeAnimPositions[lobbyScreen->animFrame] + 0x2C;
        s->palId = 0;
    }
    s->y = DISPLAY_HEIGHT - 50;
    DisplaySprite(s);

    s = &lobbyScreen->uiElements[ELEMENT_NO];

    if (lobbyScreen->cursor != CURSOR_YES) {
        s->x = sShakeAnimPositions[lobbyScreen->animFrame] + 0xC0;
        s->palId = 15;
    } else {
        s->x = (DISPLAY_WIDTH - 48);
        s->palId = 0;
    }
    s->y = DISPLAY_HEIGHT - 50;
    DisplaySprite(s);

    if (lobbyScreen->animFrame > 0) {
        lobbyScreen->animFrame--;
    }
}

static void MultiplayerLobbyScreenOnDestroy(struct Task *t)
{
    u8 i;
    struct MultiplayerLobbyScreen *lobbyScreen = TASK_DATA(t);
    VramFree(lobbyScreen->chao.graphics.dest);

    for (i = 0; i < 3; i++) {
        VramFree(lobbyScreen->uiElements[i].graphics.dest);
    }
}

static void ExitToCharacterSelect(struct MultiplayerLobbyScreen *lobbyScreen)
{
    lobbyScreen->idleFrame = 0;
    lobbyScreen->fade.brightness = 0;
    lobbyScreen->fade.flags = 1;
    lobbyScreen->fade.speed = Q(2.0);
    lobbyScreen->fade.bldAlpha = 0;
    gCurTask->main = Task_FadeInOrHandleExit;
}

static bool8 CatchInvalidPacket(union MultiSioData *packet)
{
    if (packet->pat0.unk0 <= MSG_VS_LOBBY_EXIT && packet->pat0.unk0 >= MSG_VS_LOBBY_CURSOR_POS) {
        return FALSE;
    }

    if (packet->pat0.unk0 == 0) {
        return FALSE;
    }

    TaskDestroy(gCurTask);
    LinkCommunicationError();
    return TRUE;
}
