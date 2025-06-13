#include "global.h"
#include "game/multiplayer/team_play.h"
#include "game/save.h"
#include "core.h"
#include "task.h"
#include "sprite.h"
#include "multi_sio.h"
#include "game/multiplayer/multipak_connection.h"
#include "lib/m4a/m4a.h"
#include "flags.h"
#include "game/course_select.h"
#include "trig.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

struct MultiplayerTeamPlayScreen {
    Sprite unk0[4];
    Sprite unkC0[5];
    Sprite unk1B0;
    Sprite unk1E0;
    Background unk210;
    Background unk250;
    Background unk290;
    Background unk2D0;
    s16 unk310;
    s16 unk312;
    u16 unk314;
    u8 unk316;
    u8 unk317;
    u8 filler318[6];
    u8 unk31E;
    u8 unk31F;
}; /* 0x320 */

static void sub_805CB34(void);
static void sub_805CC34(void);
static void sub_805D118(struct MultiplayerTeamPlayScreen *);
static void sub_805D644(struct MultiplayerTeamPlayScreen *);
static void sub_805D5C8(void);
static void sub_805D610(void);

static const u8 gUnknown_080D92B8[] = { 40, 174 };
static const u8 gUnknown_080D92BA[] = { 80, 159 };

static const TileInfo gUnknown_080D92BC[] = {
    TextElementAlt4(5, 8, SA2_ANIM_MULTIPLAYER_UNKNOWN),
    TextElementAlt4(6, 8, SA2_ANIM_MULTIPLAYER_UNKNOWN),
    TextElementAlt4(7, 8, SA2_ANIM_MULTIPLAYER_UNKNOWN),
    TextElementAlt4(8, 8, SA2_ANIM_MULTIPLAYER_UNKNOWN),
};

static const TileInfo gUnknown_080D92DC[] = {
    TextElement(5, LANG_DEFAULT, 0, 46, 1076),  TextElement(5, LANG_DEFAULT, 1, 42, 1076),  TextElement(5, LANG_DEFAULT, 2, 12, 1076),
    TextElement(5, LANG_DEFAULT, 3, 18, 1076),  TextElement(5, LANG_DEFAULT, 4, 6, 1076),   TextElement(5, LANG_JAPANESE, 0, 46, 1076),
    TextElement(5, LANG_JAPANESE, 1, 42, 1076), TextElement(5, LANG_JAPANESE, 2, 12, 1076), TextElement(5, LANG_JAPANESE, 3, 18, 1076),
    TextElement(5, LANG_JAPANESE, 4, 6, 1076),  TextElement(5, LANG_ENGLISH, 0, 38, 1084),  TextElement(5, LANG_ENGLISH, 1, 46, 1084),
    TextElement(5, LANG_ENGLISH, 2, 14, 1084),  TextElement(5, LANG_ENGLISH, 3, 10, 1084),  TextElement(5, LANG_ENGLISH, 4, 6, 1076),
    TextElement(5, LANG_GERMAN, 0, 57, 1085),   TextElement(5, LANG_GERMAN, 1, 46, 1085),   TextElement(5, LANG_GERMAN, 2, 10, 1085),
    TextElement(5, LANG_GERMAN, 3, 14, 1085),   TextElement(5, LANG_GERMAN, 4, 6, 1076),    TextElement(5, LANG_FRENCH, 0, 51, 1086),
    TextElement(5, LANG_FRENCH, 1, 72, 1086),   TextElement(5, LANG_FRENCH, 2, 10, 1086),   TextElement(5, LANG_FRENCH, 3, 14, 1086),
    TextElement(5, LANG_FRENCH, 4, 6, 1076),    TextElement(5, LANG_SPANISH, 0, 75, 1087),  TextElement(5, LANG_SPANISH, 1, 69, 1087),
    TextElement(5, LANG_SPANISH, 2, 9, 1087),   TextElement(5, LANG_SPANISH, 3, 15, 1087),  TextElement(5, LANG_SPANISH, 4, 6, 1076),
    TextElement(5, LANG_ITALIAN, 0, 72, 1088),  TextElement(5, LANG_ITALIAN, 1, 75, 1088),  TextElement(5, LANG_ITALIAN, 2, 6, 1088),
    TextElement(5, LANG_ITALIAN, 3, 10, 1088),  TextElement(5, LANG_ITALIAN, 4, 6, 1076),
};

void CreateMultiplayerTeamPlayScreen(void)
{
    struct Task *t;
    struct MultiplayerTeamPlayScreen *teamPlayScreen;
    Sprite *s;
    Background *background;
    u32 lang;
    void *vram;
    u8 i;

    lang = gLoadedSaveGame->language;
    if (lang > NUM_LANGUAGES) {
#ifndef EUROPE
        lang = LANG_JAPANESE;
#else
        lang = LANG_ENGLISH;
#endif
    }

    // TODO: make this a macro
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;

    gDispCnt = 0x1B00;
    gDispCnt |= 0x40;
    gBgCntRegs[3] = 0x1e0d;
    gBgCntRegs[2] = 0x9608;
    gBgCntRegs[1] = 0x8e06;
    gBgCntRegs[0] = 0x8603;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xff;
    gUnknown_03002280[2][3] = 32;

    t = TaskCreate(sub_805CB34, sizeof(struct MultiplayerTeamPlayScreen), 0x3000, 0, NULL);
    teamPlayScreen = TASK_DATA(t);
    teamPlayScreen->unk310 = 0;
    teamPlayScreen->unk312 = 0;
    teamPlayScreen->unk314 = 0;
    teamPlayScreen->unk316 = 1;
    teamPlayScreen->unk317 = 0;

    for (i = 0, vram = OBJ_VRAM0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        s = &teamPlayScreen->unk0[i];
        s->x = 0;
        s->y = 0;
        s->graphics.dest = (void *)vram;
        vram += gUnknown_080D92BC[i].numTiles * TILE_SIZE_4BPP;
        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->graphics.anim = gUnknown_080D92BC[i].anim;
        s->variant = gUnknown_080D92BC[i].variant;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x1000;
        UpdateSpriteAnimation(s);
    }

    for (i = 0; i < 5; i++) {
        s = &teamPlayScreen->unkC0[i];
        s->x = 0;
        s->y = 0;
        s->graphics.dest = (void *)vram;
        vram += gUnknown_080D92DC[TextElementOffset(lang, 5, i)].numTiles * TILE_SIZE_4BPP;
        s->oamFlags = SPRITE_OAM_ORDER(3);
        s->graphics.size = 0;
        s->graphics.anim = gUnknown_080D92DC[TextElementOffset(lang, 5, i)].anim;
        s->variant = gUnknown_080D92DC[TextElementOffset(lang, 5, i)].variant;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0;
        UpdateSpriteAnimation(s);
    }
    s = &teamPlayScreen->unk1B0;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = (void *)vram;
    s->oamFlags = SPRITE_OAM_ORDER(3);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_MULTIPLAYER_UNKNOWN;
    s->variant = SA2_ANIM_VARIANT_MULTIPLAYER_UNKNOWN_ARROWS;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;

    background = &teamPlayScreen->unk210;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(6);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_MP_UNKNOWN_GREEN;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1E;
    background->targetTilesY = 0x14;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);

    background = &teamPlayScreen->unk250;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(14);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_MP_UNKNOWN_ORANGE_ZIGZAG;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1E;
    background->targetTilesY = 0x28;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(1);
    DrawBackground(background);

    background = &teamPlayScreen->unk290;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(16);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(22);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_UNKNOWN_MESSAGE_BOX_WHITE;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1E;
    background->targetTilesY = 10;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(3);
    DrawBackground(background);

    background = &teamPlayScreen->unk2D0;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_MP_VS_BACKGROUND_TEXT;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(3);
    DrawBackground(background);
}

static void sub_805CB34(void)
{
    struct MultiplayerTeamPlayScreen *teamPlayScreen;

    MultiPakHeartbeat();

    teamPlayScreen = TASK_DATA(gCurTask);
    gWinRegs[5] = 0x3F;
    gBldRegs.bldCnt = 0x3F48;
    gBldRegs.bldAlpha = 0x810;
    gWinRegs[2] = DISPLAY_HEIGHT;

    if (gBgScrollRegs[1][1] < DISPLAY_HEIGHT) {
        gBgScrollRegs[1][1] += 4;
    } else {
        gBgScrollRegs[1][1] = DISPLAY_HEIGHT;
        gCurTask->main = sub_805CC34;
    }

    sub_805D118(teamPlayScreen);
    sub_805D644(teamPlayScreen);
}

static void sub_805CC34(void)
{
    u8 i, j;
    u8 count;
    Background *background;
    Sprite *s;
    struct MultiplayerTeamPlayScreen *teamPlayScreen;
    union MultiSioData *msd;
    gDispCnt |= 0x400;

    MultiPakHeartbeat();

    teamPlayScreen = TASK_DATA(gCurTask);

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT && !teamPlayScreen->unk317) {
        if (gPressedKeys & DPAD_LEFT) {
            if (teamPlayScreen->unk31E == 0) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
            }
            teamPlayScreen->unk316 = 1;
        } else {
            if (gPressedKeys & DPAD_RIGHT) {
                if (teamPlayScreen->unk31E != 0) {
                    m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                }
                teamPlayScreen->unk316 = 0;
            }
        }
    }

    count = 1;
    for (i = 0; i < 4; i++) {
        if (i != SIO_MULTI_CNT->id && GetBit(gMultiplayerConnections, i)) {
            count++;
            if (i == 0) {
                msd = gMultiSioRecv;
                if (teamPlayScreen->unk316 != msd->pat0.unk2) {
                    m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                }
                teamPlayScreen->unk316 = msd->pat0.unk2;
            }
        }
    }

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        if (gPressedKeys & A_BUTTON && teamPlayScreen->unk317 == 0) {
            teamPlayScreen->unk317 = 1;
            m4aSongNumStart(SE_SELECT);
        } else if (teamPlayScreen->unk317 != 0) {
            for (j = 1, i = 0; i < count; i++) {
                if (i != SIO_MULTI_CNT->id && GetBit(gMultiplayerConnections, i)) {
                    msd = &gMultiSioRecv[i];
                    if (msd->pat0.unk0 > 1)
                        j++;
                }
            }

            if (count == j) {
                if (teamPlayScreen->unk316 != 0) {
                    Background *background = &teamPlayScreen->unk290;

                    gUnknown_03004D80[2] = 0;
                    gUnknown_03002280[2][0] = 0;
                    gUnknown_03002280[2][1] = 0;
                    gUnknown_03002280[2][2] = 0xFF;
                    gUnknown_03002280[2][3] = 32;

                    background->graphics.dest = (void *)BG_SCREEN_ADDR(16);
                    background->graphics.anim = 0;
                    background->layoutVram = (void *)BG_SCREEN_ADDR(22);
                    background->unk18 = 0;
                    background->unk1A = 0;
                    background->tilemapId = TM_UNKNOWN_MESSAGE_BOX_WHITE_SMALL;
                    background->unk1E = 0;
                    background->unk20 = 0;
                    background->unk22 = 0;
                    background->unk24 = 0;
                    background->targetTilesX = 0x1E;
                    background->targetTilesY = 7;
                    background->paletteOffset = 0;
                    background->flags = BACKGROUND_FLAGS_BG_ID(3);
                    DrawBackground(background);

                    gMultiSioSend.pat0.unk0 = 0x4035;
                    teamPlayScreen->unk317 = 0;
                    gGameMode = GAME_MODE_TEAM_PLAY;
                    gCurTask->main = sub_805D5C8;
                    return;
                } else {
                    TaskDestroy(gCurTask);
                    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
                    gGameMode = GAME_MODE_MULTI_PLAYER;
                    CreateCourseSelectionScreen(0, gMultiplayerUnlockedLevels, COURSE_SELECT_CUT_SCENE_NONE);
                    gMultiSioSend.pat0.unk0 = 0x4035;
                    return;
                }
            }
        }
    } else {
        msd = &gMultiSioRecv[0];
        if (msd->pat0.unk0 == 1) {
            m4aSongNumStart(SE_SELECT);
            if (teamPlayScreen->unk316 != 0) {
                background = &teamPlayScreen->unk290;

                gUnknown_03004D80[2] = 0;
                gUnknown_03002280[2][0] = 0;
                gUnknown_03002280[2][1] = 0;
                gUnknown_03002280[2][2] = 0xFF;
                gUnknown_03002280[2][3] = 32;

                background->graphics.dest = (void *)BG_SCREEN_ADDR(16);
                background->graphics.anim = 0;
                background->layoutVram = (void *)BG_SCREEN_ADDR(22);
                background->unk18 = 0;
                background->unk1A = 0;
                background->tilemapId = TM_UNKNOWN_MESSAGE_BOX_WHITE_SMALL;
                background->unk1E = 0;
                background->unk20 = 0;
                background->unk22 = 0;
                background->unk24 = 0;
                background->targetTilesX = 0x1E;
                background->targetTilesY = 7;
                background->paletteOffset = 0;
                background->flags = BACKGROUND_FLAGS_BG_ID(3);
                DrawBackground(background);

                gMultiSioSend.pat0.unk0 = 0x4035;
                teamPlayScreen->unk317 = 0;
                gGameMode = GAME_MODE_TEAM_PLAY;
                gCurTask->main = sub_805D5C8;
                return;
            } else {
                m4aSongNumStart(SE_SELECT);
                TaskDestroy(gCurTask);
                gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
                gGameMode = GAME_MODE_MULTI_PLAYER;
                CreateCourseSelectionScreen(0, gMultiplayerUnlockedLevels, COURSE_SELECT_CUT_SCENE_NONE);
                return;
            }
        }
    }
    sub_805D118(teamPlayScreen);
    sub_805D644(teamPlayScreen);

    s = &teamPlayScreen->unkC0[0];
    s->x = (DISPLAY_WIDTH / 2);
    s->y = 28;
    DisplaySprite(s);

    s = &teamPlayScreen->unkC0[2];
    s->x = 70;
    s->y = 52;
    if (teamPlayScreen->unk316 != 0) {
        s->palId = 0;
    } else {
        s->palId = 0xFF;
    }
    DisplaySprite(s);

    s = &teamPlayScreen->unkC0[3];
    s->x = 0xAA;
    s->y = 0x34;
    if (teamPlayScreen->unk316 != 0) {
        s->palId = 0;
    } else {
        s->palId = 1;
    }
    DisplaySprite(s);

    s = &teamPlayScreen->unkC0[4];
    s->x = (DISPLAY_WIDTH / 2);
    s->y = 52;
    DisplaySprite(s);

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        union MultiSioData *msd = &gMultiSioSend;
        if (!teamPlayScreen->unk317)
            msd->pat0.unk0 = 0;
        else
            msd->pat0.unk0 = 1;
        msd->pat0.unk2 = teamPlayScreen->unk316;
    }
}

static void sub_805D118(struct MultiplayerTeamPlayScreen *teamPlayScreen)
{
    u16 i;
    s16 unk312, unk310;

    u16 *unk1884 = gBgOffsetsHBlank;
    teamPlayScreen->unk314 = (teamPlayScreen->unk314 + 1) & 1023;
    teamPlayScreen->unk310 += gSineTable[teamPlayScreen->unk314] >> 4;
    teamPlayScreen->unk312 += gSineTable[teamPlayScreen->unk314 + 0x100] >> 4;

    unk310 = teamPlayScreen->unk310 >> 8;
    unk312 = teamPlayScreen->unk312 >> 8;

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    gHBlankCopySize = 4;
    gHBlankCopyTarget = (void *)REG_ADDR_BG3HOFS;

    for (i = 0; i < 160; i++) {
        *unk1884++ = (gSineTable[(gFrameCount + i * 4) & 1023] >> 0xB) + unk310;
        *unk1884++ = (gSineTable[((gFrameCount + i * 2) & 1023) + 0x100] >> 0xB) + unk312;
    }
}

static void sub_805D1F8(void)
{
    s32 i;
    u8 count;
    bool8 someVar = TRUE;
    u8 pos[2] = { 0, 0 };
    struct MultiplayerTeamPlayScreen *teamPlayScreen;
    Sprite *s;
    union MultiSioData *packet;

    teamPlayScreen = TASK_DATA(gCurTask);
    if (teamPlayScreen->unk31F == 0) {
        if (gRepeatedKeys & DPAD_RIGHT) {
            if (teamPlayScreen->unk31E == 0) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
            }
            teamPlayScreen->unk31E = 1;
        } else if (gRepeatedKeys & DPAD_LEFT) {
            if (teamPlayScreen->unk31E == 1) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
            }
            teamPlayScreen->unk31E = 0;
        }
    }

    MultiPakHeartbeat();

    s = &teamPlayScreen->unkC0[1];
    s->x = (DISPLAY_WIDTH / 2);
    s->y = 28;
    DisplaySprite(s);

    for (i = 0; i < 4 && GetBit(gMultiplayerConnections, i); i++) {
        packet = &gMultiSioRecv[i];

        if (i == 0) {
            s = &teamPlayScreen->unk1B0;
            UpdateSpriteAnimation(s);
        }

        if (packet->pat0.unk0 == 0x4040 || packet->pat0.unk0 == 0x4041) {
            if (packet->pat0.unk0 != 0x4041) {
                s = &teamPlayScreen->unk0[i];
                s->y = (i * 24) + 64;
                s->x = gUnknown_080D92B8[packet->pat0.unk2];
                DisplaySprite(s);

                s = &teamPlayScreen->unk1B0;
                s->y = (i * 24) + 64;
                s->x = gUnknown_080D92BA[packet->pat0.unk2];

                if (packet->pat0.unk2 == 0) {
                    s->frameFlags &= ~0x400;
                    gMultiplayerConnections &= ~(0x10 << (i));
                } else {
                    s->frameFlags |= 0x400;
                    gMultiplayerConnections |= (0x10 << (i));
                }
                DisplaySprite(s);
                someVar = FALSE;
            } else {
                s16 a;
                s = &teamPlayScreen->unk0[i];
                DisplaySprite(s);
                a = s->x;

                if (a == gUnknown_080D92B8[0]) {
                    pos[0]++;
                } else {
                    pos[1]++;
                }
            }
        } else {
            someVar = FALSE;
        }
    }
    count = i;

    if (someVar) {
        if (pos[0] == 0 || pos[1] == 0) {
            teamPlayScreen->unk31F = 0;
        } else {
            gCurTask->main = sub_805D610;
            return;
        }
    }

    sub_805D118(teamPlayScreen);

    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        teamPlayScreen->unk31F = 0;
    }

    if (((!(gInput & (DPAD_LEFT | DPAD_RIGHT)) && (gPressedKeys & A_BUTTON))
         && ((teamPlayScreen->unk31E == 0 && (count - 1) != pos[0]) || (teamPlayScreen->unk31E == 1 && (count - 1) != pos[1])))
        || teamPlayScreen->unk31F != 0) {
        if (teamPlayScreen->unk31F == 0) {
            m4aSongNumStart(SE_SELECT);
        }
        packet = &gMultiSioSend;
        gMultiSioSend.pat0.unk0 = 0x4041;
        gMultiSioSend.pat0.unk2 = teamPlayScreen->unk31E;
        teamPlayScreen->unk31F = 1;
    } else {
        packet = &gMultiSioSend;
        packet->pat0.unk0 = 0x4040;
        packet->pat0.unk2 = teamPlayScreen->unk31E;
    }

    for (i = 0; i < 4 && GetBit(gMultiplayerConnections, i); i++) {
        if (SIO_MULTI_CNT->id != i) {
            packet = &gMultiSioRecv[i];
            if (packet->pat0.unk0 > 0x4041) {
                TasksDestroyAll();
                PAUSE_BACKGROUNDS_QUEUE();
                gUnknown_03005390 = 0;
                PAUSE_GRAPHICS_QUEUE();
                LinkCommunicationError();
                return;
            }
        }
    }
}

static void sub_805D5C8(void)
{
    struct MultiplayerTeamPlayScreen *teamPlayScreen = TASK_DATA(gCurTask);
    teamPlayScreen->unk31E = SIO_MULTI_CNT->id & 1;
    teamPlayScreen->unk31F = 0;
    gCurTask->main = sub_805D1F8;
    sub_805D1F8();
}

static void sub_805D610(void)
{
    TaskDestroy(gCurTask);
    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
    CreateCourseSelectionScreen(0, gMultiplayerUnlockedLevels, COURSE_SELECT_CUT_SCENE_NONE);
}

static void sub_805D644(struct MultiplayerTeamPlayScreen *teamPlayScreen)
{
    u8 i;
    Sprite *s;

    for (i = 0; i < 4; i++) {
        if (GetBit(gMultiplayerConnections, i)) {
            s = &teamPlayScreen->unk0[i];
            s->x = gUnknown_080D92B8[i & 1];
            s->y = i * 0x18 + 0x40;
            DisplaySprite(s);
        }
    }
}
