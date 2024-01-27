#include "global.h"
#include "core.h"
#include "game/game.h"
#include "game/stage/stage.h"
#include "game/multiboot/connection.h"
#include "game/multiplayer/multipak_connection.h"
#include "game/multiboot/collect_rings/results.h"
#include "task.h"
#include "sprite.h"
#include "data/sprite_data.h"
#include "bg_triangles.h"
#include "game/save.h"
#include "game/title_screen.h"
#include "game/screen_fade.h"
#include "lib/m4a.h"
#include "multi_boot.h"
#include "sio32_multi_load.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

struct MultiplayerSinglePakResultsScreen_UNK80 {
    Sprite unk0;
    u8 filler30[8];
};

struct MultiplayerSinglePakResultsScreen {
    Background unk0;
    Background unk40;
    struct MultiplayerSinglePakResultsScreen_UNK80 unk80[4];
    Sprite unk160[10];
    Sprite unk340;
    Sprite unk370[3];
    Sprite unk400;
    u16 unk430;
    u16 unk432;
    u32 unk434;
    u8 actor;
    u8 filler439[3];
    u32 unk43C;
}; /* size 0x440 */

struct MultiplayerSinglePakResultsScreen *sub_8082B1C(s16);

void sub_8081FB0(void);
void sub_8082038(struct MultiplayerSinglePakResultsScreen *);
void sub_8082B80(struct MultiplayerSinglePakResultsScreen *);
void sub_8082C58(struct MultiplayerSinglePakResultsScreen *);
void sub_8082CB4(struct MultiplayerSinglePakResultsScreen *);
void sub_8082BF8(struct MultiplayerSinglePakResultsScreen *);

void CreateMultiplayerSinglePakResultsScreen(u32 a)
{
    struct MultiplayerSinglePakResultsScreen *resultsScreen;
    const u8 *unk408 = gUnknown_08C88408;
    const u8 *unk92208 = gUnknown_08C92208;

    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    gWinRegs[4] = 0;
    gWinRegs[5] = 0;
    gWinRegs[0] = 0;
    gWinRegs[2] = 0;
    gWinRegs[1] = 0;
    gWinRegs[3] = 0;
    gUnknown_03005424 = 0;
    gMultiSioEnabled = TRUE;
    gFlags &= ~0x4000;
    m4aSoundVSyncOn();
    gGameMode = GAME_MODE_MULTI_PLAYER_COLLECT_RINGS;

    CpuFastCopy(unk92208, (void *)VRAM, VRAM_SIZE - BG_VRAM_SIZE);
    CpuFastCopy(unk408, (void *)EWRAM_START + 0x33000, EWRAM_SIZE - 0x33000);

    gTilemapsRef = ((struct MapHeader ***)(EWRAM_START + 0x33000))[0];
    gMultiplayerLanguage = gLoadedSaveGame->language;

    sub_8081FB0();
    resultsScreen = sub_8082B1C(a);
    sub_8082038(resultsScreen);
    sub_8082B80(resultsScreen);
    sub_8082BF8(resultsScreen);

    if (a != 0) {
        sub_8082C58(resultsScreen);
        m4aSongNumStart(MUS_VS_LOBBY);
    } else {
        sub_8082CB4(resultsScreen);
        m4aSongNumStart(MUS_VS_SELECT_PAK_MODE);
    }

    gBldRegs.bldCnt = 0;
    gBldRegs.bldAlpha = 0;
    gBldRegs.bldY = 0;
}

void sub_8081FB0(void)
{
    gDispCnt = 0x40;
    gBgCntRegs[3] = 0x5e0b;
    gBgCntRegs[2] = 0x1c0c;
    gUnknown_03004D80[2] = 0x7f;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xff;
    gUnknown_03002280[2][3] = 32;
    gUnknown_03004D80[3] = 0xff;
    gUnknown_03002280[3][0] = 0;
    gUnknown_03002280[3][1] = 0;
    gUnknown_03002280[3][2] = 0xff;
    gUnknown_03002280[3][3] = 64;

    DmaFill32(3, 0, (void *)VRAM + 0x9FE0, 65);
    DmaFill32(3, 0, (void *)VRAM + 0xCFE0, 65);
}

void sub_8082038(struct MultiplayerSinglePakResultsScreen *screen)
{
    Background *background = &screen->unk0;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(16);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(30);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_LEVEL_BG(LEVEL_INDEX(ZONE_1, ACT_2));
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1e;
    background->targetTilesY = 0x19;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(3);
    DrawBackground(background);
}

void sub_80823FC(void);

void sub_808207C(void)
{
    u32 i;
    Sprite *s;
    struct MultiplayerSinglePakResultsScreen *resultsScreen;
    gDispCnt |= 0x1800;
    gMultiplayerConnections = ((gMultiSioStatusFlags & MULTI_SIO_ALL_CONNECTED) >> 8);
    MultiPakHeartbeat();

    gMultiSioSend.pat0.unk0 = 0x4010;
    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        gMultiSioSend.pat0.unk3 = gMultiplayerLanguage;
    }

    resultsScreen = TASK_DATA(gCurTask);
#ifndef NON_MATCHING
    while (0)
        ;
#endif
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;

    if (++resultsScreen->unk430 > 0xF0) {
        gFlags &= ~0x8000;

        if (resultsScreen->unk434) {
            for (i = 0; i < 3; i++) {
#ifndef NON_MATCHING
                s32 var;
#endif
                s = &resultsScreen->unk370[i];
                s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2500 + (i * 0x180));

                s->x = 0;
                s->y = 0;
                s->unk1A = SPRITE_OAM_ORDER(4);
                s->graphics.size = 0;
#ifndef NON_MATCHING
                var = 0x44c;
                asm("" ::"r"(var));
#endif
                if (gMultiplayerLanguage == 1) {
                    s->graphics.anim = SA2_ANIM_MP_SINGLE_PAK_RESULTS_CUMULATIVE;
                } else {
                    s->graphics.anim = SA2_ANIM_MP_SINGLE_PAK_RESULTS_ROUND;
                }

                s->variant = i;
                s->animCursor = 0;
                s->timeUntilNextFrame = 0;
                s->prevVariant = -1;
                s->animSpeed = 0x10;
                s->palId = 0;
                s->unk10 = 0x1000;
                UpdateSpriteAnimation(s);
            }
        }

        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            s = &resultsScreen->unk400;
            s->x = (DISPLAY_WIDTH / 2);
            s->y = (DISPLAY_HEIGHT / 2);

            if (resultsScreen->unk434) {
                s->graphics.dest = resultsScreen->unk370[2].graphics.dest + 0x180;
            } else {
                s->graphics.dest = resultsScreen->unk340.graphics.dest + 0x180;
            }
            s->unk1A = SPRITE_OAM_ORDER(0);
            s->graphics.size = 0;
            if (gMultiplayerLanguage == 1) {
                s->graphics.anim = SA2_ANIM_PRESS_START_MSG_JP;
            } else {
                s->graphics.anim = SA2_ANIM_PRESS_START_MSG_EN;
            }
            s->variant = 0;
            s->animCursor = 0;
            s->timeUntilNextFrame = 0;
            s->prevVariant = -1;
            s->animSpeed = 0x10;
            s->palId = 0;
            s->unk10 = 0;
            UpdateSpriteAnimation(s);
        }
        resultsScreen->unk430 = 0;
        gCurTask->main = sub_80823FC;
        sub_80823FC();
    } else {
#ifndef NON_MATCHING
        // This is wrong, just here to make asm correct here
        resultsScreen++;
        while (0)
            ;
        resultsScreen--;
#endif

        for (i = 0; i < 4; i++) {
            if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i + 8))) {
                if (gUnknown_030054B4[i] & 1) {
                    sub_80078D4(3, i * 40, (i + 1) * 40,
                                DISPLAY_WIDTH - resultsScreen->unk430,
                                DISPLAY_HEIGHT - i * 40);
                } else {
                    sub_80078D4(3, i * 40, (i + 1) * 40,
                                resultsScreen->unk430 - DISPLAY_WIDTH,
                                DISPLAY_HEIGHT - i * 40);
                }
            } else {
                if (gUnknown_030054B4[i] & 1) {
                    sub_80078D4(3, gUnknown_030054B4[i] * 40,
                                (gUnknown_030054B4[i] + 1) * 40,
                                DISPLAY_WIDTH - resultsScreen->unk430,
                                (i * 5 - gUnknown_030054B4[i] * 5) * 8);
                } else {
                    sub_80078D4(3, gUnknown_030054B4[i] * 40,
                                (gUnknown_030054B4[i] + 1) * 40,
                                resultsScreen->unk430 - DISPLAY_WIDTH,
                                (i * 5 - gUnknown_030054B4[i] * 5) * 8);
                }
            }
        }
    }
}

void sub_8082AA8(void);
void sub_8082630(void);
void sub_8082788(void);

void sub_80823FC(void)
{
    Background *background;
    u32 i;
    s32 val2 = 0;
    u8 val = FALSE;
    struct MultiplayerSinglePakResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    union MultiSioData *packet;

    gMultiplayerConnections = ((gMultiSioStatusFlags & MULTI_SIO_ALL_CONNECTED) >> 8);
    packet = &gMultiSioRecv[0];
    if (packet->pat0.unk0 == 0x4012) {
        gSelectedCharacter = SIO_MULTI_CNT->id;
        if (!resultsScreen->unk434) {
            background = &resultsScreen->unk40;
            gBgScrollRegs[2][0] = 0;
            gBgScrollRegs[2][1] = 0;
            background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
            background->graphics.anim = 0;
            background->layoutVram = (void *)BG_SCREEN_ADDR(28);
            background->unk18 = 0;
            background->unk1A = 0;
            background->tilemapId = TM_LEVEL_METATILES_0(LEVEL_INDEX(ZONE_1, ACT_BOSS));
            switch (gMultiplayerLanguage) {
                case 0:
                    background->unk1E = 0;
                    background->unk20 = 4;
                    break;
                case 1:
                    background->unk1E = 0;
                    background->unk20 = 0;
                    break;
                case 2:
                default:
                    background->unk1E = 0;
                    background->unk20 = 4;
                    break;
            }
            background->unk22 = 6;
            background->unk24 = 8;
            background->targetTilesX = 0x12;
            background->targetTilesY = 4;
            background->paletteOffset = 0;
            background->flags = BACKGROUND_FLAGS_BG_ID(2);
            DrawBackground(background);
        }

        gDispCnt |= 0x400;
        resultsScreen->unk430 = 0;
        if (resultsScreen->unk434) {
            gBldRegs.bldCnt = 0xFF;
            gCurTask->main = sub_8082630;
            sub_8082630();
        } else {
            gCurTask->main = sub_8082AA8;
            sub_8082AA8();
        }
    } else {
        sub_8082788();

        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            DisplaySprite(&resultsScreen->unk400);
        }

        for (i = 0; i < 4 && GetBit(gMultiplayerConnections, i); i++) {
            if (!(MULTI_SIO_RECV_ID(i) & gMultiSioStatusFlags)) {
                val = TRUE;
            } else {
                packet = &gMultiSioRecv[i];
                if (i == SIO_MULTI_CNT->id || packet->pat0.unk0 == 0x4010) {
                    val2++;
                }
            }
        }
        packet = &gMultiSioSend;
        packet->pat0.unk0 = 0x4010;
        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            packet->pat0.unk3 = gMultiplayerLanguage;
        }

        if ((gMultiSioStatusFlags & MULTI_SIO_PARENT && gPressedKeys & START_BUTTON
             && !val && val2 > 1)
            || resultsScreen->actor) {
            resultsScreen->actor = 1;
            packet->pat0.unk0 = 0x4012;
        }
    }
}

void sub_808267C(void);
void sub_8082788(void);

void sub_8082630(void)
{
    struct MultiplayerSinglePakResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    resultsScreen->unk430 += 0x20;
    sub_8082788();

    if (resultsScreen->unk430 > 0x1000) {
        resultsScreen->unk430 = 0x1000;
        // irrelevant
        gBldRegs.bldY = 0x10;
        gCurTask->main = sub_808267C;
    }

    gBldRegs.bldY = resultsScreen->unk430 >> 8;
}

void sub_808267C(void)
{
    union MultiSioData *packet;
    struct MultiplayerSinglePakResultsScreen *resultsScreen = TASK_DATA(gCurTask);

    packet = &gMultiSioRecv[0];

    if (packet->pat3.unk0 == 0x4080) {
        u32 i;
        gMultiplayerPseudoRandom = packet->pat3.unk8;

        for (i = 0; i < 4; i++) {
            gMultiplayerCharacters[i] = 0;
            gUnknown_030054B4[i] = i;
        }

        gFlags &= ~4;
        if (resultsScreen->unk434) {
            TaskDestroy(gCurTask);
            CreateMultiplayerSinglePakResultsScreen(0);
        } else {
            TaskDestroy(gCurTask);
            gBldRegs.bldCnt = 0;
            gBldRegs.bldY = 0;
            sub_8081200();
            GameStageStart();
        }
        return;
    }

    sub_8082788();
    packet = &gMultiSioSend;
    packet->pat0.unk0 = 0x4051;
    packet->pat0.unk2 = 0;

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        u8 i;
        for (i = 0; i < 4; i++) {
            if (GetBit(gMultiplayerConnections, i)) {
                packet = &gMultiSioRecv[i];
                if (packet->pat0.unk0 != 0x4051) {
                    return;
                }
            }
        }
        packet = &gMultiSioSend;
        packet->pat3.unk0 = 0x4080;
        packet->pat3.unk8 = resultsScreen->unk43C;
    }
}

void sub_8082788(void)
{
    u32 i;

    Sprite *s;
    struct MultiplayerSinglePakResultsScreen *resultsScreen;

    MultiPakHeartbeat();
    resultsScreen = TASK_DATA(gCurTask);

    for (i = 0; i < 4; i++) {
        if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i + 8))) {
            sub_80078D4(3, i * 40, (i + 1) * 40, 0, DISPLAY_HEIGHT - i * 40);
        } else {
            sub_80078D4(3, gUnknown_030054B4[i] * 40, (gUnknown_030054B4[i] + 1) * 40, 0,
                        i * 40 - gUnknown_030054B4[i] * 40);
            if (resultsScreen->unk434) {
                u16 temp;

                s = &resultsScreen->unk80[i].unk0;
                s->x = (DISPLAY_WIDTH / 2);
                s->y = gUnknown_030054B4[i] * 40 + 20;
                UpdateSpriteAnimation(s);
                DisplaySprite(s);

                s = &resultsScreen->unk370[gMultiplayerCharacters[i]];
                s->x = 52;
                s->y = gUnknown_030054B4[i] * 40 + 20;
                DisplaySprite(s);

                // TODO: Fix type
                temp = sub_8004518(gMultiplayerCharRings[i]);
                s = &resultsScreen->unk160[((temp) >> 8) & 0xF];

                if (s != &resultsScreen->unk160[0]) {
                    s->x = 160;
                    s->y = gUnknown_030054B4[i] * 40 + 20;
                    DisplaySprite(s);
                }

                s = &resultsScreen->unk160[((temp) >> 4) & 0xF];

                if (s != &resultsScreen->unk160[0] || (temp > 0xFF)) {
                    s->x = 171;
                    s->y = gUnknown_030054B4[i] * 40 + 20;
                    DisplaySprite(s);
                }

                s = &resultsScreen->unk160[(temp)&0xF];
                s->x = 182;
                s->y = gUnknown_030054B4[i] * 40 + 20;
                DisplaySprite(s);
            } else {
                u16 temp;
                s = &resultsScreen->unk80[i].unk0;
                s->x = (DISPLAY_WIDTH / 2);
                s->y = i * 40 + 20;
                UpdateSpriteAnimation(s);
                DisplaySprite(s);

                if (gUnknown_03005428[i] > 99) {
                    temp = 99;
                } else {
                    temp = sub_8004518(gUnknown_03005428[i]);
                }

                s = &resultsScreen->unk160[((temp) >> 4)];

                if (s != &resultsScreen->unk160[0]) {
                    s->x = 160;
                    s->y = i * 40 + 20;
                    DisplaySprite(s);
                }
                s = &resultsScreen->unk160[temp & 0xF];
                s->x = 171;
                s->y = i * 40 + 20;
                DisplaySprite(s);

                s = &resultsScreen->unk340;
                s->x = 197;
                s->y = i * 40 + 20;
                DisplaySprite(s);
            }
        }
    }
}

void sub_8082AA8(void)
{
    struct MultiplayerSinglePakResultsScreen *resultsScreen = TASK_DATA(gCurTask);

    sub_8082788();
    if (resultsScreen->unk430++ > 0x1E) {
        resultsScreen->unk430 = 0;
        m4aMPlayFadeOut(&gMPlayInfo_BGM, 8);
        m4aMPlayFadeOut(&gMPlayInfo_SE1, 8);
        m4aMPlayFadeOut(&gMPlayInfo_SE2, 8);
        m4aMPlayFadeOut(&gMPlayInfo_SE3, 8);
        gBldRegs.bldCnt = 0xFF;
        gCurTask->main = sub_8082630;
    }
}

struct MultiplayerSinglePakResultsScreen *sub_8082B1C(s16 mode)
{
    struct Task *t = TaskCreate(
        sub_808207C, sizeof(struct MultiplayerSinglePakResultsScreen), 0x2000, 0, NULL);
    struct MultiplayerSinglePakResultsScreen *resultsScreen = TASK_DATA(t);

    resultsScreen->unk434 = mode;
    resultsScreen->unk430 = 0;
    resultsScreen->actor = 0;
    resultsScreen->unk43C = gFrameCount;

    return resultsScreen;
}

void sub_8082CEC(Sprite *, u32, u16, u8, s16, s16, u16, u8, u32);

void sub_8082B80(struct MultiplayerSinglePakResultsScreen *resultsScreen)
{
    s16 i;

    for (i = 0; i < 4; i++) {
        u16 anim = gPlayerCharacterIdleAnims[i];
        sub_8082CEC(&resultsScreen->unk80[i].unk0, OBJ_VRAM0 + (i * 0x800), anim, 0,
                    0x78, (i * 40) + 20, SPRITE_OAM_ORDER(16), i, 0x1000);
    }
}

void sub_8082BF8(struct MultiplayerSinglePakResultsScreen *resultsScreen)
{
    s16 i;

    for (i = 0; i < 10; i++) {
        sub_8082CEC(&resultsScreen->unk160[i], OBJ_VRAM0 + (i * 4 + 0x100) * 0x20, 0x451,
                    i, 0, 0, SPRITE_OAM_ORDER(4), 0, 0x1000);
    }
}

void sub_8082C58(struct MultiplayerSinglePakResultsScreen *resultsScreen)
{
    s16 i;

    for (i = 0; i < 3; i++) {
        sub_8082CEC(&resultsScreen->unk370[i], OBJ_VRAM0 + 0x2500 + i * 0xC0, 1099, i, 0,
                    0, SPRITE_OAM_ORDER(4), 0, 0x1000);
    }
}

void sub_8082CB4(struct MultiplayerSinglePakResultsScreen *resultsScreen)
{
    sub_8082CEC(&resultsScreen->unk340, OBJ_VRAM0 + 0x2F00, 1099, 3, 0, 0,
                SPRITE_OAM_ORDER(4), 0, 0x1000);
}

void sub_8082CEC(Sprite *s, u32 vramAddr, u16 animId, u8 variant, s16 x, s16 y,
                 u16 unk1A, u8 unk25, u32 unk10)
{
    s->x = x;
    s->y = y;
    s->graphics.dest = (void *)vramAddr;
    s->unk1A = unk1A;
    s->graphics.size = 0;
    s->graphics.anim = animId;
    s->variant = variant;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = unk25;
    s->unk10 = unk10;
    UpdateSpriteAnimation(s);
}
