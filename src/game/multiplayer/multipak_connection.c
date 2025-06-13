#include "global.h"
#include "core.h"
#include "task.h"
#include "sprite.h"
#include "multi_sio.h"

#include "game/multiplayer/multipak_connection.h"
#include "game/multiplayer/communication_outcome.h"
#include "game/multiplayer/mode_select.h"

#include "data/sprite_data.h"
#include "game/save.h"
#include "game/title_screen.h"

#include "game/stage/screen_fade.h"
#include "game/stage/tilemap_table.h"
#include "lib/m4a/m4a.h"
#include "constants/text.h"
#include "flags.h"

#include "game/character_select.h"

#include "data/sprite_tables.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

struct MultiPakConnectScreen {
    ScreenFade fade;
    Sprite s;
    Sprite s2;
    Sprite unk6C;
    Background unk9C;
    u32 unkDC;
    u8 fillerDC[8];
    u16 unkE8;
    u8 fillerEA;
    u8 unkEB;
    u8 fillerEC[2];
    u8 unkEE[MULTI_SIO_PLAYERS_MAX];
    u8 unkF2[MULTI_SIO_PLAYERS_MAX];

    u8 unkF6;
    u8 fillerF7[3];
    u8 unkFA;
    u8 unkFB;
    u8 unkFC;
    u8 unkFD;
}; /** size 0x100 */

static void sub_805ADAC(void);
static void sub_805B4C0(void);
static void sub_805B454(void);

static const TileInfo gUnknown_080D9050[] = {
    TextElement(1, LANG_DEFAULT, 0, 90, SA2_ANIM_MP_MSG),         TextElement(1, LANG_JAPANESE, 0, 90, SA2_ANIM_MP_MSG),
    TextElement(1, LANG_ENGLISH, 0, 84, SA2_ANIM_MP_COMM_MSG_EN), TextElement(1, LANG_GERMAN, 0, 90, SA2_ANIM_MP_COMM_MSG_DE),
    TextElement(1, LANG_FRENCH, 0, 90, SA2_ANIM_MP_COMM_MSG_FR),  TextElement(1, LANG_SPANISH, 0, 90, SA2_ANIM_MP_COMM_MSG_ES),
    TextElement(1, LANG_ITALIAN, 0, 45, SA2_ANIM_MP_COMM_MSG_IT),
};

void StartMultiPakConnect(void)
{
    struct Task *t;
    struct MultiPakConnectScreen *connectScreen;
    ScreenFade *fade;
    Sprite *s;
    Background *background;
    const TileInfo *unkD64;
    void *vramAddr = (void *)OBJ_VRAM0;
    u8 i;

    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
    gDispCnt = 0x1141;
    gBgCntRegs[0] = 0x1401;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    t = TaskCreate(sub_805ADAC, sizeof(struct MultiPakConnectScreen), 0x2000, 0, NULL);
    connectScreen = TASK_DATA(t);
    connectScreen->unkEB = 0;
    connectScreen->unkFC = 1;
    connectScreen->unkFD = 0;

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        connectScreen->unkEE[i] = 0;
        connectScreen->unkF2[i] = 0;
    }

    fade = &connectScreen->fade;
    fade->window = 1;
    fade->brightness = 0;
    fade->flags = 2;
    fade->speed = 0x100;
    fade->bldCnt = 0x3FFF;
    fade->bldAlpha = 0;
    UpdateScreenFade(fade);

    s = &connectScreen->s;
    s->graphics.dest = vramAddr;
    vramAddr += gUnknown_080D9050[gLoadedSaveGame->language].numTiles * TILE_SIZE_4BPP;
    s->graphics.anim = gUnknown_080D9050[gLoadedSaveGame->language].anim;
    s->variant = gUnknown_080D9050[gLoadedSaveGame->language].variant;
    s->prevVariant = -1;
    s->x = 8;
    s->y = 24;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);

    s = &connectScreen->s2;
    s->graphics.dest = vramAddr;
    vramAddr += gPressStartTiles[gLoadedSaveGame->language].numTiles * TILE_SIZE_4BPP;
    s->graphics.anim = gPressStartTiles[gLoadedSaveGame->language].anim;
    s->variant = gPressStartTiles[gLoadedSaveGame->language].variant;
    s->prevVariant = -1;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = 122;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;

    s = &connectScreen->unk6C;
    s->graphics.dest = vramAddr;
    s->graphics.anim = SA2_ANIM_MP_MSG;
    s->variant = SA2_ANIM_VARIANT_MP_MSG_2;
    s->prevVariant = -1;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT * (7. / 8.));
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;

    // TODO: make macro
    background = &connectScreen->unk9C;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(20);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_MP_WAIT_CONNECTION;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1E;
    background->targetTilesY = 0x14;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        MultiSioStart();
    }

    gMultiplayerUnlockedCharacters = gLoadedSaveGame->unlockedCharacters | 0xF;
    gMultiplayerUnlockedLevels = 1;

    for (i = 0; i < 5; i++) {
        if (gMultiplayerUnlockedLevels < gLoadedSaveGame->unlockedLevels[i]) {
            gMultiplayerUnlockedLevels = gLoadedSaveGame->unlockedLevels[i];
        }
    }

    if (gMultiplayerUnlockedLevels > 0x1B) {
        gMultiplayerUnlockedLevels = 0x1B;
    }

    connectScreen->unkF6 = 0;
    connectScreen->unkFA = 0;
}

static void sub_805ADAC(void)
{
    s32 i;
    s32 x;
    s32 var1 = 0;
    s32 var2 = 0;
    u8 var3 = 0;
    bool8 r4 = FALSE;
    bool8 bool1 = FALSE;
    bool8 bool2 = FALSE;
    bool8 bool3 = TRUE;
    struct MultiPakConnectScreen *connectScreen = TASK_DATA(gCurTask);
    struct MultiSioData_0_0 *send, *recv;
    struct MultiSioData_0_0 *data;
    Sprite *r4p;

    UpdateScreenFade(&connectScreen->fade);

    if (gMultiSioStatusFlags & (MULTI_SIO_PARENT | MULTI_SIO_RECV_ID0)) {
        if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(SIO_MULTI_CNT->id))) {
            if (gMultiplayerMissingHeartbeats[SIO_MULTI_CNT->id]++ > 180) {
                TasksDestroyAll();
                PAUSE_BACKGROUNDS_QUEUE();
                gUnknown_03005390 = 0;
                PAUSE_GRAPHICS_QUEUE();
                LinkCommunicationError();
                return;
            }
        } else {
            gMultiplayerMissingHeartbeats[SIO_MULTI_CNT->id] = 0;
        }
    }

    if (gMultiSioStatusFlags & MULTI_SIO_CONNECTED_ID0) {
        r4 = TRUE;
    }

    recv = &gMultiSioRecv[0].pat0;
    if (gMultiSioStatusFlags & MULTI_SIO_HARD_ERROR || (r4 && !(gMultiSioStatusFlags & MULTI_SIO_RECV_ID0) && recv->unk0 != 0)) {
        if (++connectScreen->unkFD >= 9) {
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gUnknown_03005390 = 0;
            PAUSE_GRAPHICS_QUEUE();
            LinkCommunicationError();
            return;
        }
    } else {
        connectScreen->unkFD = 0;
    }

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        data = &gMultiSioRecv[i].pat0;
        connectScreen->unkEE[i] <<= 1;
        connectScreen->unkF2[i] <<= 1;
        if (i == SIO_MULTI_CNT->id || (gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i) && data->unk0 > 0x400F)) {
            connectScreen->unkEE[i] |= 1;
            var1++;
            var3 |= MULTI_SIO_RECV_ID(i);
            if (bool1) {
                bool2 = TRUE;
            }
            gMultiplayerIds[i] = data->unk4;
            gMultiplayerNames[i][0] = data->unk8[0];
            gMultiplayerNames[i][1] = data->unk8[1];
            gMultiplayerNames[i][2] = data->unk8[2];
            gMultiplayerUnlockedCharacters |= data->unkE;

            if (gMultiplayerUnlockedLevels < data->unkF) {
                gMultiplayerUnlockedLevels = data->unkF;
            }

        } else {
            u16 a = (&REG_SIOMULTI0)[i];
            bool1 = TRUE;
            if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i)) && a == 0) {
                bool2 = TRUE;
                connectScreen->unkF2[i] |= 1;

                if (connectScreen->unkEE[i] == 0) {
                    bool2 = TRUE;
                    bool3 = FALSE;
                }
            } else {
                if (connectScreen->unkF2[i] != 0 || (gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i) && data->unk0 < 0x4010)) {
                    bool2 = TRUE;
                    bool3 = FALSE;
                }
            }
        }
        if (connectScreen->unkEE[i] != 0) {
            var2++;
        }
    }

    if (var2 == 0) {
        var2 = 1;
    }

    if (connectScreen->unkFA == 0) {
        if (!(gMultiSioStatusFlags & MULTI_SIO_PARENT) && gMultiSioStatusFlags & MULTI_SIO_RECV_ID0 && recv->unk0 > 0x4010) {
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gUnknown_03005390 = 0;
            PAUSE_GRAPHICS_QUEUE();
            LinkCommunicationError();
            return;
        }
        connectScreen->unkFA = 1;
    }

    if (!bool2 && recv->unk0 == 0x4011 && connectScreen->unkFA != 0) {
        gMultiplayerPseudoRandom = recv->unk10;
        gMultiplayerConnections = recv->unk2;
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (GetBit(gMultiplayerConnections, i)) {
                if (i == 0) {
                    gMultiplayerIds[0] = recv->unk4;
                    gMultiplayerNames[0][0] = recv->unk8[0];
                    gMultiplayerNames[0][1] = recv->unk8[1];
                    gMultiplayerNames[0][2] = recv->unk8[2];
                    gMultiplayerUnlockedCharacters |= recv->unkE;
                    if (gMultiplayerUnlockedLevels < recv->unkF) {
                        gMultiplayerUnlockedLevels = recv->unkF;
                    }
                    continue;
                }
                data = &gMultiSioRecv[i].pat0;
                if (data->unk0 != 0x4010) {
                    continue;
                }

                gMultiplayerIds[i] = data->unk4;
                gMultiplayerNames[i][0] = data->unk8[0];
                gMultiplayerNames[i][1] = data->unk8[1];
#ifndef NON_MATCHING
                do {
#endif
                    gMultiplayerNames[i][2] = data->unk8[2];
#ifndef NON_MATCHING
                } while (0);
#endif
                gMultiplayerUnlockedCharacters |= data->unkE;
                if (gMultiplayerUnlockedLevels < data->unkF) {
                    gMultiplayerUnlockedLevels = data->unkF;
                }
            }
        }
        connectScreen->unkE8 = 0;
        connectScreen->unkF6 = 0;
        gMultiplayerMissingHeartbeats[3] = 0;
        gMultiplayerMissingHeartbeats[2] = 0;
        gMultiplayerMissingHeartbeats[1] = 0;
        gMultiplayerMissingHeartbeats[0] = 0;
        connectScreen->unkFB = 0;
        gCurTask->main = sub_805B4C0;
        sub_805B4C0();
        return;
    }

    if (recv->unk0 >= 0x4013) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gUnknown_03005390 = 0;
        PAUSE_GRAPHICS_QUEUE();
        LinkCommunicationError();
        return;
    }

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            send = &gMultiSioSend.pat0;
            send->unk0 = 0;
            connectScreen->unkE8 = 0;
            gCurTask->main = sub_805B454;
            return;
        }

        gMultiSioEnabled = FALSE;
        MultiSioStop();
        MultiSioInit(0);
        send = &gMultiSioSend.pat0;
        send->unk0 = 0;
        gUnknown_03004D80[0] = 0;

        gUnknown_03002280[0][0] = 0;
        gUnknown_03002280[0][1] = 0;
        gUnknown_03002280[0][2] = 0xff;
        gUnknown_03002280[0][3] = 32;
        CreateMultiplayerModeSelectScreen();
        TaskDestroy(gCurTask);
        return;
    }

    if ((gMultiSioStatusFlags & MULTI_SIO_PARENT) && var2 > 1 && bool3) {
        r4p = &connectScreen->s2;
        UpdateSpriteAnimation(r4p);
        DisplaySprite(r4p);
    }

    if (var2 > 1) {
        r4p = &connectScreen->unk6C;
        r4p->graphics.anim = SA2_ANIM_MP_MSG;
        r4p->variant = var2 + SA2_ANIM_VARIANT_MP_MSG_OK;
        r4p->prevVariant = -1;
        UpdateSpriteAnimation(r4p);
        DisplaySprite(r4p);
    }
    r4p = &connectScreen->s;
    DisplaySprite(r4p);

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        if ((!bool2 && var1 > 1 && gPressedKeys & START_BUTTON) || (connectScreen->unkF6 != 0 && !bool2 && var1 > 1)) {
            send = &gMultiSioSend.pat0;
            send->unk0 = 0x4011;
            send->unk2 = var3;
            send->unk4 = gLoadedSaveGame->id;
            send->unk10 = connectScreen->unkDC;
            for (x = 0; x < 3; x++) {
                send->unk8[x] = gLoadedSaveGame->playerName[x];
            }
            send->unkE = gMultiplayerUnlockedCharacters;
            send->unkF = gMultiplayerUnlockedLevels;
            connectScreen->unkF6 = 1;
#ifndef NON_MATCHING
            do {
#endif
                connectScreen->unkFC = 0;
#ifndef NON_MATCHING
            } while (0);
#endif
            return;
        }
    }

    if (connectScreen->unkF6 != 0) {
        connectScreen->unkF6 = 0;
        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            connectScreen->unkFC = 1;
        }
    }
    send = &gMultiSioSend.pat0;
    send->unk0 = 0x4010;
    send->unk4 = gLoadedSaveGame->id;
    for (x = 0; x < 3; x++) {
        send->unk8[x] = gLoadedSaveGame->playerName[x];
    }
    send->unkE = gMultiplayerUnlockedCharacters;
    send->unkF = gMultiplayerUnlockedLevels;
}

static void sub_805B454(void)
{
    struct MultiPakConnectScreen *connectScreen = TASK_DATA(gCurTask);
    gMultiSioSend.pat0.unk0 = 0;
    if (++connectScreen->unkE8 > 4) {
        gMultiSioEnabled = FALSE;
        MultiSioStop();
        MultiSioInit(0);
        gUnknown_03004D80[0] = 0;
        gUnknown_03002280[0][0] = 0;
        gUnknown_03002280[0][1] = 0;
        gUnknown_03002280[0][2] = 0xFF;
        gUnknown_03002280[0][3] = 32;
        CreateMultiplayerModeSelectScreen();
        TaskDestroy(gCurTask);
    }
}

static void sub_805B4C0(void)
{
    struct MultiSioData_0_0 *recv, *data, *send;
    Sprite *r4p;
    s32 i, j;

    u8 recv2;
    s32 count = 0;
    struct MultiPakConnectScreen *connectScreen = TASK_DATA(gCurTask);
    MultiPakHeartbeat();
    recv = &gMultiSioRecv[0].pat0;
    recv2 = recv->unk2;

    if (recv->unk0 == 0x4012) {
        if (!GetBit(recv2, SIO_MULTI_CNT->id)) {
            gMultiSioEnabled = FALSE;
            MultiSioStop();
            MultiSioInit(0);
            send = &gMultiSioSend.pat0;
            send->unk0 = 0;
            gUnknown_03004D80[0] = 0;
            gUnknown_03002280[0][0] = 0;
            gUnknown_03002280[0][1] = 0;
            gUnknown_03002280[0][2] = 0xFF;
            gUnknown_03002280[0][3] = 32;
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gUnknown_03005390 = 0;
            PAUSE_GRAPHICS_QUEUE();
            LinkCommunicationError();
            return;
        }

        gGameMode = GAME_MODE_MULTI_PLAYER;
        for (i = 3; i >= 0; i--) {
            if (GetBit(gMultiplayerConnections, i)) {
                if (i == 0) {
                    if (gMultiplayerIds[i] == recv->unk4) {
                        gMultiplayerNames[i][3] = recv->unk8[0];
                        gMultiplayerNames[i][4] = recv->unk8[1];
                        gMultiplayerNames[i][5] = recv->unk8[2];
                    } else {
                        gMultiplayerNames[i][0] = PLAYER_NAME_END_CHAR;
                    }
                    gMultiplayerUnlockedCharacters |= recv->unkE;
                    if (gMultiplayerUnlockedLevels < recv->unkF) {
                        gMultiplayerUnlockedLevels = recv->unkF;
                    }
                } else {
                    data = &gMultiSioRecv[i].pat0;
                    if (data->unk0 == 0x4011) {
                        if (gMultiplayerIds[i] == data->unk4) {
                            gMultiplayerNames[i][3] = data->unk8[0];
                            gMultiplayerNames[i][4] = data->unk8[1];
                            gMultiplayerNames[i][5] = data->unk8[2];
                        } else {
                            gMultiplayerNames[i][0] = PLAYER_NAME_END_CHAR;
                        }
                        gMultiplayerUnlockedCharacters |= data->unkE;
                        if (gMultiplayerUnlockedLevels < data->unkF) {
                            gMultiplayerUnlockedLevels = data->unkF;
                        }
                    }
                }

                if (i != SIO_MULTI_CNT->id) {
                    InsertMultiplayerProfile(gMultiplayerIds[i], gMultiplayerNames[i]);
                }
            }
        }
        WriteSaveGame();
        TaskDestroy(gCurTask);
        CreateMultipackOutcomeScreen(OUTCOME_CONNECTION_SUCCESS);
        return;
    }
    if (recv->unk0 == 0x4010) {
        gMultiSioEnabled = FALSE;
        MultiSioStop();
        MultiSioInit(0);
        send = &gMultiSioSend.pat0;
        send->unk0 = 0;
        gUnknown_03004D80[0] = 0;
        gUnknown_03002280[0][0] = 0;
        gUnknown_03002280[0][1] = 0;
        gUnknown_03002280[0][2] = 0xFF;
        gUnknown_03002280[0][3] = 32;
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gUnknown_03005390 = 0;
        PAUSE_GRAPHICS_QUEUE();
        LinkCommunicationError();
        return;
    } else {
        if (gMultiSioStatusFlags & MULTI_SIO_PARENT && connectScreen->unkFB++ >= 0x3D) {
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gUnknown_03005390 = 0;
            PAUSE_GRAPHICS_QUEUE();
            LinkCommunicationError();
            return;
        }

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            u8 unkEE = connectScreen->unkEE[i];
            connectScreen->unkEE[i] <<= 1;
            if (unkEE << 0x19) {
                count++;
            }
        }

        if (count == 0) {
            count = 1;
        }

        if (count > 1) {
            r4p = &connectScreen->unk6C;
            r4p->graphics.anim = SA2_ANIM_MP_MSG;
            r4p->variant = count + SA2_ANIM_VARIANT_MP_MSG_OK;
            r4p->prevVariant = -1;
            UpdateSpriteAnimation(r4p);
            DisplaySprite(r4p);
        }

        if ((gMultiSioStatusFlags & MULTI_SIO_PARENT)) {
            send = &gMultiSioSend.pat0;
            send->unk0 = 0x4012;
            send->unk2 = recv2;
            send->unk4 = gLoadedSaveGame->id;
            for (j = 0; j < 3; j++) {
                send->unk8[j] = gLoadedSaveGame->playerName[j + 3];
            }
            send->unkE = gMultiplayerUnlockedCharacters;
            send->unkF = gMultiplayerUnlockedLevels;

            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                bool8 someBool = FALSE;

                if (!GetBit(gMultiplayerConnections, i)) {
                    if (gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i)) {
                        someBool = TRUE;
                    } else {
                        continue;
                    }
                }

                if (i != 0) {
                    if (!someBool && !(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {
                        someBool = TRUE;
                    }
                    if (!someBool) {
                        data = &gMultiSioRecv[i].pat0;
                        if (data->unk0 != 0x4011) {
                            someBool = TRUE;
                        }
                    }
                    if (!someBool) {
                        continue;
                    }
                    send->unk0 = 0x4011;
                    for (j = 0; j < 3; j++) {
                        send->unk8[j] = gLoadedSaveGame->playerName[j];
                    };

                    return;
                }
            }
        } else {
            send = &gMultiSioSend.pat0;
            send->unk0 = 0x4011;
            send->unk2 = recv2;
            send->unk4 = gLoadedSaveGame->id;
            for (j = 0; j < 3; j++) {
                send->unk8[j] = gLoadedSaveGame->playerName[j + 3];
            }
            send->unkE = gMultiplayerUnlockedCharacters;
            send->unkF = gMultiplayerUnlockedLevels;
        }
    }
}

UNUSED static void sub_805B98C(struct MultiPakConnectScreen *connectScreen)
{
    Sprite *s = &connectScreen->s;
    DisplaySprite(s);
    s++;
    DisplaySprite(s);
}

void LinkCommunicationError(void)
{
    m4aMPlayAllStop();
    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
    gDispCnt = 0x40;
    gMultiSioEnabled = FALSE;
    MultiSioStop();
    MultiSioInit(0);

    gTilemapsRef = (Tilemap **)gTilemaps;
    gRefSpriteTables = &gSpriteTables;
    gMultiplayerMissingHeartbeats[0] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[3] = 0;
    CreateMultipackOutcomeScreen(OUTCOME_CONNECTION_ERROR);
}
