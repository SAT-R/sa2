#include "core.h"
#include "game/game.h"
#include "game/save.h"
#include "game/race_progress.h"
#include "multi_sio.h"
#include "game/multiboot/collect_rings/time_display.h"
#include "lib/m4a.h"
#include "game/time_attack/lobby.h"
#include "game/game_over.h"
#include "constants/songs.h"
#include "trig.h"

#include "constants/move_states.h"

void sub_802B61C(u16, u16, u16);
void sub_80299F0(u32, u32, u32, Player *);
void CreateGameStage(void);

void sub_801AB3C(void);

void sub_801B7A8(struct Task *);
void sub_801F044(void);

void sub_80213C0(u32, u32, Player *);
void sub_80498CC(u8);
void sub_802B708(void);
void sub_801C068(u32);
void sub_801BF90(void);

void sub_800BEF8(void);
void SetupStageLoadingScreen(void);

void sub_80115D0(u32, u32, u32);
void sub_8007E10(void);
void sub_800888C(void);

void sub_8019120(void);
void sub_8016028(u8);
void sub_8019498(void);
void sub_80193C4(u8);
void sub_8013FAC(Player *);
void sub_80191A4(void);

extern const u16 gLevelSongs[];

void sub_801AF14(void);
void sub_801AFA4(void);
void sub_801B03C(void);
void sub_801B0D4(void);
void sub_801B180(void);
void sub_801B22C(void);
void sub_801B324(void);
void sub_801B41C(void);
void sub_801B4EC(void);
void sub_801B5BC(void);
void sub_801B7BC(void);
void sub_801B83C(void);
void sub_801B8A8(void);
void sub_801B914(void);
void sub_801B980(void);
void sub_801B9EC(void);
void sub_801BA58(void);
void sub_801BAC4(void);
void sub_801BB30(void);
void sub_801BB9C(void);
void sub_801BC88(void);
void sub_801BC1C(void);
void sub_801BD08(void);
void sub_801BD74(void);
void sub_801BDE0(void);
void sub_801BE4C(void);
void sub_801BEB8(void);
void sub_801BF24(void);
const VoidFn gUnknown_080D57DC[]
    = { sub_801AF14, sub_801B7BC, sub_801B83C, sub_801BF24, // Anti-Formatting
        sub_801B8A8, sub_801B914, sub_801B980, sub_801BF24, //
        sub_801AFA4, sub_801B03C, sub_801B9EC, sub_801BF24, //
        sub_801B0D4, sub_801B180, sub_801BA58, sub_801BF24, //
        sub_801BAC4, sub_801BB30, sub_801BB9C, sub_801BF24, //
        sub_801B22C, sub_801B324, sub_801BC1C, sub_801BF24, //
        sub_801B41C, sub_801B4EC, sub_801B5BC, sub_801BF24, //
        sub_801BC88, sub_801BD08, sub_801BD74, sub_801BDE0, //
        sub_801BE4C, sub_801BEB8 };

const Background gUnknown_080D5864[] = {
    {
        .graphics = {  
            .src = NULL,  
            .dest = (void*)BG_VRAM,  
            .size = 0,  
            .anim = 0,
        },
        .tilesVram = (void*)0x600F000,
        .unk10 = NULL,
        .unk14 = 0,
        .unk16 = 0,
        .unk18 = 0,
        .unk1A = 0,
        .unk1C = 0,
        .unk1E = 0,
        .unk20 = 0,
        .unk22 = 0,
        .unk24 = 0,
        .unk26 = 31,
        .unk28 = 21,
        .unk2A = 0,
        .animFrameCounter = 0,
        .animDelayCounter = 0,
        .unk2D = 0,
        .unk2E = 121,
        .scrollX = 0,
        .scrollY = 0,
        .prevScrollX = 32767,
        .prevScrollY = 32767,
        .unk38 = NULL,
        .unk3C = 0,
        .unk3E = 0,
    },
    {
        .graphics = {  
            .src = NULL,  
            .dest = (void*)BG_VRAM,  
            .size = 0,  
            .anim = 0,
        },
        .tilesVram = (void*)0x600F800,
        .unk10 = NULL,
        .unk14 = 0,
        .unk16 = 0,
        .unk18 = 0,
        .unk1A = 0,
        .unk1C = 0,
        .unk1E = 0,
        .unk20 = 0,
        .unk22 = 0,
        .unk24 = 0,
        .unk26 = 31,
        .unk28 = 21,
        .unk2A = 0,
        .animFrameCounter = 0,
        .animDelayCounter = 0,
        .unk2D = 0,
        .unk2E = 98,
        .scrollX = 0,
        .scrollY = 0,
        .prevScrollX = 32767,
        .prevScrollY = 32767,
        .unk38 = NULL,
        .unk3C = 0,
        .unk3E = 0,
    },
    {
        .graphics = {  
            .src = NULL,  
            .dest = (void*)0x6008000,  
            .size = 0,  
            .anim = 0,
        },
        .tilesVram = (void*)0x600E800,
        .unk10 = NULL,
        .unk14 = 0,
        .unk16 = 0,
        .unk18 = 0,
        .unk1A = 0,
        .unk1C = 0,
        .unk1E = 0,
        .unk20 = 0,
        .unk22 = 0,
        .unk24 = 0,
        .unk26 = 32,
        .unk28 = 32,
        .unk2A = 0,
        .animFrameCounter = 0,
        .animDelayCounter = 0,
        .unk2D = 0,
        .unk2E = 19,
        .scrollX = 0,
        .scrollY = 0,
        .prevScrollX = 32767,
        .prevScrollY = 32767,
        .unk38 = NULL,
        .unk3C = 0,
        .unk3E = 0,
    },
    {
        .graphics = {  
            .src = NULL,  
            .dest = (void*)0x600C000,  
            .size = 0,  
            .anim = 0,
        },
        .tilesVram = (void*)0x600E000,
        .unk10 = NULL,
        .unk14 = 0,
        .unk16 = 0,
        .unk18 = 0,
        .unk1A = 0,
        .unk1C = 0,
        .unk1E = 0,
        .unk20 = 0,
        .unk22 = 0,
        .unk24 = 0,
        .unk26 = 32,
        .unk28 = 32,
        .unk2A = 0,
        .animFrameCounter = 0,
        .animDelayCounter = 0,
        .unk2D = 0,
        .unk2E = 16,
        .scrollX = 0,
        .scrollY = 0,
        .prevScrollX = 32767,
        .prevScrollY = 32767,
        .unk38 = NULL,
        .unk3C = 0,
        .unk3E = 0,
    },
};

const u16 gUnknown_080D5964[][2] = {
    { 32, 216 }, { 32, 204 }, { 32, 216 }, { 32, 208 }, { 32, 208 },
    { 32, 232 }, { 32, 264 }, { 32, 264 }, { 32, 264 },
};

void sub_801C774(void);
void sub_801CB74(void);
void sub_801CD7C(void);
void sub_801CEE4(void);
void sub_801D104(void);
void sub_801D1A8(void);
void sub_801D95C(void);
void sub_801DF08(void);
void sub_801E118(void);
void sub_801E12C(void);
const VoidFn gUnknown_080D5988[] = {
    sub_801C774, sub_801C774, sub_801C774, NULL, // Anti-Formatting
    sub_801E118, sub_801E118, sub_801E118, NULL, //
    sub_801CB74, sub_801CB74, sub_801CB74, NULL, //
    sub_801CD7C, sub_801CD7C, sub_801E12C, NULL, //
    sub_801CEE4, sub_801CEE4, NULL,        NULL, //
    sub_801D104, sub_801D104, sub_801D1A8, NULL, //
    sub_801D95C, sub_801D95C, sub_801D95C, NULL, //
    NULL,        sub_801DF08, sub_801C774, NULL, //
    NULL,        NULL,
};

void sub_801C818(s32, s32);
void sub_801C94C(s32, s32);
void sub_801CBE8(s32, s32);
void sub_801CDF0(s32, s32);
void sub_801CF60(s32, s32);
void sub_801D534(s32, s32);
void sub_801E130(s32, s32);
void sub_801E134(s32, s32);
void sub_801E1A4(s32, s32);
void sub_801E1D0(s32, s32);
void sub_801E1E4(s32, s32);
void sub_801E234(s32, s32);
void sub_801E26C(s32, s32);
void sub_801E2E0(s32, s32);
void sub_801E310(s32, s32);
void sub_801E360(s32, s32);
const CameraMain gUnknown_080D5A10[] = {
    sub_801C818, sub_801C818, sub_801E134, sub_801E130, // Anti-Formatting
    sub_801C94C, sub_801C94C, sub_801E1A4, sub_801E130, //
    sub_801CBE8, sub_801CBE8, sub_801E1D0, sub_801E130, //
    sub_801CDF0, sub_801CDF0, sub_801E130, sub_801E130, //
    sub_801CF60, sub_801CF60, sub_801E1E4, sub_801E130, //
    sub_801D534, sub_801D534, sub_801E234, sub_801E130, //
    sub_801E26C, sub_801E26C, sub_801E2E0, sub_801E130, //
    sub_801E310, sub_801E360, sub_801C818, sub_801C94C, //
    sub_801C818, sub_801D534,
};

asm(".global gUnknown_080D5A98\n"
    "gUnknown_080D5A98:\n"
    "    .incbin \"baserom.gba\", 0x000D5A98, 0x88");

const u8 gUnknown_080D5B20 = 14;
const u8 gUnknown_080D5B21 = 0;

asm("    .global gUnknown_080D5B22\n"
    "gUnknown_080D5B22:\n"
    "    .incbin \"baserom.gba\", 0x000D5B22, 0x2E");

asm("    .global gUnknown_080D5B50\n"
    "gUnknown_080D5B50:\n"
    "    .incbin \"baserom.gba\", 0x000D5B50, 0xA0\n");

asm("    .global gUnknown_080D5BF0\n"
    "gUnknown_080D5BF0:\n"
    "    .incbin \"baserom.gba\", 0x000D5BF0, 0x12");

asm("    .global gUnknown_080D5C02\n"
    "gUnknown_080D5C02:\n"
    "    .incbin \"baserom.gba\", 0x000D5C02, 0x2");

asm("    .global gUnknown_080D5C04\n"
    "gUnknown_080D5C04:\n"
    "    .incbin \"baserom.gba\", 0x000D5C04, 0x5E");

asm("    .global gUnknown_080D5C62\n"
    "gUnknown_080D5C62:\n"
    "    .incbin \"baserom.gba\", 0x000D5C62, 0x20");

asm("    .global gUnknown_080D5C82\n"
    "gUnknown_080D5C82:\n"
    "    .incbin \"baserom.gba\", 0x000D5C82, 0x20");

asm("    .global gUnknown_080D5CA2\n"
    "gUnknown_080D5CA2:\n"
    "    .incbin \"baserom.gba\", 0x000D5CA2, 0x20");

// Some palette
asm("    .global gUnknown_080D5CC2\n"
    "gUnknown_080D5CC2:\n"
    "    .incbin \"baserom.gba\", 0x000D5CC2, 0x22");

void ApplyGameStageSettings(void)
{
    gUnknown_03005450 = 0;
    gUnknown_030054B0 = 0;
    gNumLives = 3;

    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        gNumLives = 1;
    }

    if ((gGameMode >= GAME_MODE_TIME_ATTACK && gGameMode <= GAME_MODE_TEAM_PLAY)
        || (gUnknown_03005424 & 0x40)) {
        gUnknown_030054EC = 0;
    } else {
        gUnknown_030054EC = gLoadedSaveGame->difficultyLevel;
    }

    if ((gUnknown_03005424 & 0x40)) {
        sub_802B61C(A_BUTTON, B_BUTTON, R_BUTTON);
    } else {
        sub_802B61C(gLoadedSaveGame->buttonConfig.jump,
                    gLoadedSaveGame->buttonConfig.attack,
                    gLoadedSaveGame->buttonConfig.trick);
    }
}

void GameStageStart(void)
{
    gUnknown_03005444 = 0;
    gUnknown_030055B0 = 0;
    gRingCount = 0;
    gUnknown_030054F8 = 1;

    if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        sub_80299F0(gSelectedCharacter, gCurrentLevel, 0, &gPlayer);
        gUnknown_030056A4 = 0;
    }

    gUnknown_03005590 = 0;
    gUnknown_03005424 &= ~0x80;

    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        gUnknown_030054A0 = gFrameCount;
    }

    gUnknown_030053E4 = 0;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        gUnknown_03005490 = 0;
    } else {
        gUnknown_03005490 = 0x2A30;
    }

    CreateGameStage();
}

void CreateGameStage(void)
{
    u8 i;
    gGameStageTask = TaskCreate(sub_801AB3C, 0, 0xff00, 0, sub_801B7A8);
    gUnknown_0300540C = 0;
    gUnknown_030054F4 = 0;
    gUnknown_030054B0 = 0;

    gUnknown_03005424 |= 0x21;
    gUnknown_03005424 &= ~0x80;

    gUnknown_03005430 = 0;
    gUnknown_0300542C = 10;
    gUnknown_030055BC = 0;

    sub_801F044();
    gUnknown_030053E0 = 0;

    if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        sub_80213C0(gSelectedCharacter, gCurrentLevel, &gPlayer);
    }

    if ((gCurrentLevel & ACTS_PER_ZONE) == ACT_BOSS
        || (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)
            && gUnknown_030054B0 == 0)
        || gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        gUnknown_03005440 = gUnknown_080D5964[LEVEL_TO_ZONE(gCurrentLevel)][0];
        gUnknown_030054BC = gUnknown_080D5964[LEVEL_TO_ZONE(gCurrentLevel)][1];

        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
            sub_80498CC(gUnknown_030055B0);
        }

        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            sub_802B708();
            gUnknown_03005440 = gUnknown_080D5964[ZONE_FINAL + 1][0];
            gUnknown_030054BC = gUnknown_080D5964[ZONE_FINAL + 1][1];
        }
    }

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        sub_800BEF8();
        SetupStageLoadingScreen();
        sub_801C068(gCurrentLevel);
        gUnknown_080D57DC[gCurrentLevel]();
    } else {
        sub_801C068(0);
        sub_801BF90();
        CreateCollectRingsTimeDisplay();
        gPlayer.moveState &= ~(MOVESTATE_400000 | MOVESTATE_IGNORE_INPUT);
        gUnknown_03005424 &= ~0x1;
    }

    if (gCurrentLevel != LEVEL_INDEX(ZONE_1, ACT_1)) {
        sub_80115D0(-1, 0, 0);
    }

    gUnknown_03005424 &= ~0x2;
    gUnknown_03005424 &= ~0x4;

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        gUnknown_03005424 |= 4;
    }

    sub_8007E10();
    sub_800888C();

    gUnknown_03001944 = 0;
    gUnknown_030017F0 = 0x100;
    gUnknown_03005394 = 0x100;
    gUnknown_03002A8C = 0x78;
    gUnknown_03004D58 = 0x50;
    gUnknown_0300194C = 0x78;
    gUnknown_03002820 = 0x50;
    gUnknown_03005398 = 0x80;

    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        sub_80191A4();
        sub_8019120();

        gUnknown_030054E8 = 0;

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            gUnknown_030053E8[i] = 0;

            if (GetBit(gMultiplayerConnections, i)) {
                sub_8016028(i);
                if (i != SIO_MULTI_CNT->id) {
                    sub_80193C4(i);
                } else {
                    sub_8019498();
                }
            }

            gUnknown_030054B4[i] = -1;
            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                gMultiplayerCharacters[i] = i;
            }
        }

        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            gPlayer.unk37 |= 0x80;
        }
    } else {

        for (i = 0; i < 4; i++) {
            gUnknown_030054B4[i] = -1;
        }
    }

    gUnknown_030056A4 = 0;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        sub_8013FAC(&gPlayer);
    }

    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)
        && gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        CreateRaceProgressIndicator();
    }
}

void sub_800A9FC(void);

void sub_802B4F8(s32, s32, s32, s32, s32);

void sub_801AB3C(void)
{
    u16 sioId = SIO_MULTI_CNT->id;
    u32 step;

    if (GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        if (!(gUnknown_03005424 & 0x20) && (gPressedKeys & START_BUTTON)
            && !(gUnknown_03005424 & 0x40)) {
            sub_800A9FC();
        }
        gUnknown_03005590++;
        step = 1;
    } else {
        u32 temp = (gFrameCount - gUnknown_030054A0);
        step = temp - gUnknown_03005590;
        gUnknown_03005590 = temp;

        if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            if ((temp & ~(0x1FF)) != ((temp - step) & ~(0x1FF))) {
                u32 mask, v;
                gUnknown_03005434 = (gUnknown_03005434 * 0x196225) + 0x3C6EF35F;

                if ((temp & ~(0xFFF)) != ((temp - step) & ~(0xFFF))) {
                    u32 value = (gUnknown_030054E8 >> 4) + 1;
                    gUnknown_030054E8 = ((gUnknown_030054E8 & 0xF) | (value * 16));
                }
                v = gUnknown_03005434;
                mask = 7;
                gUnknown_030054E8 = (gUnknown_030054E8 & 0xF8) | ((u32)v & mask);
            }

        } else if ((temp & ~(0x3F)) != ((temp - step) & ~(0x3F))) {
            gUnknown_03005434 = (gUnknown_03005434 * 0x196225) + 0x3C6EF35F;
        }

        if (gCamera.unk50 & 4) {
            if ((gInput & (L_BUTTON | R_BUTTON)) == (L_BUTTON | R_BUTTON)) {
                if (sioId != 3) {
                    gCamera.unk66 = 3;
                } else {
                    gCamera.unk66 = 2;
                }
            } else if (gInput & L_BUTTON) {
                if (sioId == 0) {
                    gCamera.unk66 = 1;
                } else {
                    gCamera.unk66 = 0;
                }
            } else if (gInput & R_BUTTON) {
                if (sioId < 2) {
                    gCamera.unk66 = 2;
                } else {
                    gCamera.unk66 = 1;
                }
            } else {
                gCamera.unk66 = sioId;
            }
        } else {
            gCamera.unk66 = sioId;
        }

        if (!GetBit(gMultiplayerConnections, gCamera.unk66)) {
            gCamera.unk66 = sioId;
        }

        if (gUnknown_030053E0 != 0) {
            gUnknown_030053E0--;
        }
    }

    gUnknown_0300544C = gUnknown_03005424;

    if (gUnknown_03005424 & 1) {
        return;
    }

    gUnknown_030053E4 += step;

    if (gUnknown_03005424 & 4) {
        gUnknown_03005490 -= step;
        if ((s32)gUnknown_03005490 > 0) {
            return;
        }

        if (GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
            gUnknown_03005424 |= 1;

            if (gLoadedSaveGame->timeLimitEnabled) {
                return;
            }

            gPlayer.unk37 = 0;

            if (gPlayer.moveState & 0x40) {
                gPlayer.speedAirY = -0x2A0;
            } else {
                gPlayer.speedAirY = -0x4E0;
            }

            if (gCurrentLevel == 10) {
                sub_802B4F8(0x800, 8, 0x10, 0xffffffff, 0xd0);
            }
            gPlayer.moveState |= 0x80;
            m4aSongNumStart(SE_149);
        } else {
            gUnknown_03005424 |= 1;
            sub_8019F08();
        }
    } else {
        gUnknown_03005490 += step;
        if (gUnknown_03005490 < 0x8CA1U) {
            return;
        }

        if (GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
            gUnknown_03005424 |= 1;

            if (gLoadedSaveGame->timeLimitEnabled
                && (gGameMode == GAME_MODE_SINGLE_PLAYER
                    || !GAME_MODE_IS_SINGLE_PLAYER(gGameMode))) {
                return;
            }

            gPlayer.unk37 = 0;

            if (gPlayer.moveState & 0x40) {
                gPlayer.speedAirY = -0x2A0;
            } else {
                gPlayer.speedAirY = -0x4E0;
            }
            gPlayer.moveState |= 0x80;
            m4aSongNumStart(SE_149);
        } else {
            gUnknown_03005424 |= 1;
            sub_8019F08();
        }
    }
}

// HandleDeath
void sub_801AE48(void)
{
    gUnknown_03005424 |= 0x20;
    if (gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
        CreateTimeAttackLobbyScreen();
        gNumLives = 2;
        return;
    }

    if (--gNumLives == 0) {
        gUnknown_03005424 |= 1;
        CreateGameOverScreen(1);
    } else {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
        CreateGameStage();
    }
}

void sub_8009628(s32, s32, s32, s32);

void sub_801AF14(void)
{
    u16 level;
    sub_80115D0(0x830, 0x7F207F20, 0);
    sub_8009628(0x2000, 0x381, 0, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801AFA4(void)
{
    u16 level;
    sub_8009628(0x2000, 900, 0, 0);
    sub_8009628(0x2000, 900, 1, 0);
    sub_8009628(0x2000, 900, 2, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B03C(void)
{
    u16 level;
    sub_8009628(0x2000, 900, 0, 0);
    sub_8009628(0x2000, 900, 1, 0);
    sub_8009628(0x2000, 900, 2, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B0D4(void)
{
    u16 level;
    sub_8009628(0x2000, 906, 2, 0);
    sub_8009628(0x2000, 906, 0, 0);
    sub_8009628(0x2000, 906, 1, 0);
    sub_8009628(0x2000, 901, 0, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B180(void)
{
    u16 level;
    sub_8009628(0x2000, 906, 2, 0);
    sub_8009628(0x2000, 906, 0, 0);
    sub_8009628(0x2000, 906, 1, 0);
    sub_8009628(0x2000, 901, 0, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B22C(void)
{
    u16 level;
    sub_8009628(0x2000, 940, 0, 0);
    sub_8009628(0x2000, 940, 1, 0);
    sub_8009628(0x2000, 940, 2, 0);
    sub_8009628(0x2000, 940, 3, 0);
    sub_8009628(0x2000, 940, 4, 0);
    sub_8009628(0x2000, 940, 5, 0);
    sub_8009628(0x2000, 940, 6, 0);
    sub_8009628(0x2000, 940, 7, 0);
    sub_8009628(0x2000, 940, 8, 0);
    sub_8009628(0x2000, 940, 9, 0);
    sub_8009628(0x2000, 940, 11, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B324(void)
{
    u16 level;
    sub_8009628(0x2000, 940, 0, 0);
    sub_8009628(0x2000, 940, 1, 0);
    sub_8009628(0x2000, 940, 2, 0);
    sub_8009628(0x2000, 940, 3, 0);
    sub_8009628(0x2000, 940, 4, 0);
    sub_8009628(0x2000, 940, 5, 0);
    sub_8009628(0x2000, 940, 6, 0);
    sub_8009628(0x2000, 940, 7, 0);
    sub_8009628(0x2000, 940, 8, 0);
    sub_8009628(0x2000, 940, 9, 0);
    sub_8009628(0x2000, 940, 11, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B41C(void)
{
    u16 level;
    sub_8009628(0x2000, 941, 0, 0);
    sub_8009628(0x2000, 942, 0, 0);
    sub_8009628(0x2000, 943, 0, 0);
    sub_8009628(0x2000, 944, 0, 0);
    sub_8009628(0x2000, 945, 0, 0);
    sub_8009628(0x2000, 946, 0, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B4EC(void)
{
    u16 level;
    sub_8009628(0x2000, 941, 0, 0);
    sub_8009628(0x2000, 942, 0, 0);
    sub_8009628(0x2000, 943, 0, 0);
    sub_8009628(0x2000, 944, 0, 0);
    sub_8009628(0x2000, 945, 0, 0);
    sub_8009628(0x2000, 946, 0, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B5BC(void)
{
    u16 level;
    sub_8009628(0x2000, 941, 0, 0);
    sub_8009628(0x2000, 942, 0, 0);
    sub_8009628(0x2000, 943, 0, 0);
    sub_8009628(0x2000, 944, 0, 0);
    sub_8009628(0x2000, 945, 0, 0);
    sub_8009628(0x2000, 946, 0, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801E028(void);
void sub_80299FC(Player *player);

void sub_801B68C(void)
{
    TaskDestroy(gGameStageTask);
    gGameStageTask = NULL;
    sub_80299FC(&gPlayer);
    sub_801E028();
}

void sub_801B6B4(void)
{
    gUnknown_03005424 |= 0x20;
    if (gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
        CreateTimeAttackLobbyScreen();
        gNumLives = 2;
        return;
    }

    if (--gNumLives == 0) {
        CreateGameOverScreen(1);
    } else {
        CreateGameOverScreen(2);
    }
}

void sub_801B744(void)
{
    TasksDestroyAll();
    gUnknown_03002AE4 = gUnknown_0300287C;
    gUnknown_03005390 = 0;
    gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
    WriteSaveGame();

    if (gGameMode == 0) {
        gCurrentLevel++;
        if (gCurrentLevel < 34) {
            GameStageStart();
        }
    }
}

void sub_801B7A8(struct Task *t)
{
    gGameStageTask = NULL;
    m4aMPlayAllStop();
}

void sub_801B7BC(void)
{
    u16 level;
    sub_8009628(0x2000, 897, 0, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B83C(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B8A8(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B914(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B980(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801B9EC(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BA58(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BAC4(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BB30(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BB9C(void)
{
    u16 level;
    sub_8009628(0x2000, 686, 0, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BC1C(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BC88(void)
{
    u16 level;

    sub_8009628(0x2000, 686, 0, 0);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BD08(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BD74(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BDE0(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BE4C(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BEB8(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BF24(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BF90(void)
{
    u16 level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_801BFFC(u16 level)
{
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void sub_802C668(s32 *, s32 *);
void sub_801E0A8(void);
void sub_801E040(struct Task *);

extern const s8 gUnknown_080D5A98[][4];

extern const u32 *gUnknown_080D62D8[];

extern const Background gUnknown_080D5864[4];

extern const CameraMain gUnknown_080D5A10[];

struct Backgrounds {
    Background unk0;
    Background unk40;
    Background unk80;
    Background unkC0;
};

extern struct Backgrounds gUnknown_03005850;
extern const u32 *gUnknown_030059C8;

void sub_801C068(u32 level)
{
    s32 x;
    u32 temp;

    struct Backgrounds *bgs;
    Player *player = &gPlayer;
    struct Camera *camera = &gCamera;
    const s8 *unkA98 = gUnknown_080D5A98[level];

    gDispCnt = 0x3E40;
    if (level == 0x1D) {
        gDispCnt = 0x3741;
    }

    gBgCntRegs[1] = 0x1E01;
    gBgCntRegs[2] = 0x1F02;
    temp = ((unkA98[0] + 0x1F) >> 6 | ((unkA98[1] + 0x1F) >> 6) << 1) << 0xE;
    gBgCntRegs[3] = temp | 3 | (unkA98[3] << 8) | (unkA98[2] << 2);

    if (level == 0x1D) {
        gDispCnt = 0x3641;
    }

    bgs = &gUnknown_03005850;
    memcpy(&gUnknown_03005850.unk40, &gUnknown_080D5864[0], 0x40);
    bgs->unk40.unk1C = level * 3;

    memcpy(&gUnknown_03005850.unk80, &gUnknown_080D5864[1], 0x40);
    bgs->unk80.unk1C = (level * 3) + 1;

    memcpy(&gUnknown_03005850.unkC0, &gUnknown_080D5864[2], 0x40);
    bgs->unkC0.unk1C = (level * 3) + 2;

    bgs->unkC0.graphics.dest = (void *)BG_CHAR_ADDR(unkA98[2]);
    bgs->unkC0.tilesVram = (void *)BG_SCREEN_ADDR(unkA98[3]);
    bgs->unkC0.unk26 = unkA98[0];
    bgs->unkC0.unk28 = unkA98[1];

    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[1][0] = 0;
    gUnknown_03002280[1][1] = 0;
    gUnknown_03002280[1][2] = 0xff;
    gUnknown_03002280[1][3] = 0x20;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xff;
    gUnknown_03002280[2][3] = 0x20;

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        bgs->unk40.unk2E |= 0x208;
        bgs->unk80.unk2E |= 0x208;
    }

    if (level != 0x1D) {
        sub_8002A3C(&bgs->unk40);
        sub_8002A3C(&bgs->unk80);
        sub_8002A3C(&bgs->unkC0);
    }

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        gUnknown_030059C8 = gUnknown_080D62D8[level];
    } else {
        gUnknown_030059C8 = *(u32 **)(EWRAM_START + 0x33004);
    }

    camera->unk28 = 0;
    camera->unk2C = gUnknown_030059C8[8];
    camera->unk30 = 0;
    camera->unk34 = gUnknown_030059C8[7];

    if (((gCurrentLevel & ACTS_PER_ZONE) == ACT_BOSS)
        || ((gCurrentLevel == 0x1C) && (gUnknown_030054B0 == 0))
        || (gCurrentLevel == 0x1D)) {
        if (gCurrentLevel == 0x1D) {
            sub_802C668(&player->x, &player->y);
            gUnknown_03005440 = gUnknown_080D5964[LEVEL_TO_ZONE(0x20)][0];
            gUnknown_030054BC = gUnknown_080D5964[LEVEL_TO_ZONE(0x20)][1];
            camera->x = 600;
            camera->unk10 = 0x78;
            camera->unk14 = 0;
            camera->y = 0;
            camera->unk64 = 0xFFFC;
        } else {
            camera->x = Q_24_8_TO_INT(player->x);
            camera->unk10 = Q_24_8_TO_INT(player->x) - 0x1E0;
            camera->y = Q_24_8_TO_INT(player->y) - 0x54;
            camera->unk14 = camera->y;
            camera->unk64 = player->unk17 - 4;
        }
    } else {
        camera->x = Q_24_8_TO_INT(player->x) - 0x78;
        camera->y = Q_24_8_TO_INT(player->y) - 0x54;

        if (camera->x < 0) {
            camera->x = 0;
        }

        if (camera->y < 0) {
            camera->y = 0;
        }

        camera->unk10 = camera->x;
        camera->unk14 = camera->y;
        camera->unk64 = player->unk17 - 4;
    }

    camera->unk8 = 0x1000;
    camera->unkC = 0xc;
    camera->unk56 = 0;
    camera->shiftX = 0;
    camera->shiftY = 0;
    camera->unk20 = 0;
    camera->unk24 = 0;
    camera->unk40 = 0;
    camera->unk44 = 8;
    camera->unk48 = 0;
    camera->unk4C = 0;
    camera->unk50 = 0;
    camera->unk52 = 0;
    camera->unk54 = 0;
    camera->unk60 = 0;
    camera->unk62 = 0;

    camera->unk5C = TaskCreate(sub_801E0A8, 0, 0xF00, 0, sub_801E040);

    camera->unk58 = gUnknown_080D5A10[level];

    if (gUnknown_080D5988[level] != NULL) {
        gUnknown_080D5988[level]();
    }
}

void sub_801C708(s32, s32);

void sub_801C394(void)
{
    Player *player = &gPlayer;
    struct Camera *camera = &gCamera;
    s32 newX, newY;
    newX = camera->x;
    newY = camera->y;
    camera->unk38 = newX;
    camera->unk3C = newY;

    newX = CLAMP(newX, camera->unk30, camera->unk34 - (DISPLAY_WIDTH + 1));
    newY = CLAMP(newY, camera->unk28, camera->unk2C - (DISPLAY_HEIGHT + 1));

    if (((gCurrentLevel & ACTS_PER_ZONE) == ACT_BOSS)
        || (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)
            && (gUnknown_030054B0 == 0))
        || (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53))) {
        s32 delta, playerY;
        if (player->moveState & MOVESTATE_DEAD) {
            if (camera->unk58 != NULL) {
                camera->unk58(gCamera.x, gCamera.y);
            }
            return;
        }

        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            sub_802C668(&player->x, &player->y);
        }

        camera->unk10 += 5;
        newX += 5;

        if (newX + ((DISPLAY_WIDTH / 2) + 1) < Q_24_8_TO_INT(player->x)) {
            if ((camera->unk10 + (DISPLAY_HEIGHT / 2)) > newX) {
                s32 temp = Q_24_8_TO_INT(player->x);
                temp -= DISPLAY_WIDTH / 2;
                camera->shiftX = temp - newX;
            } else {
                newX = (camera->unk10 + (DISPLAY_HEIGHT / 2));
                camera->shiftX = 0;
            }
        } else {
            camera->shiftX = 0;
            if ((newX + 96) > Q_24_8_TO_INT(player->x)) {
                newX = Q_24_8_TO_INT(player->x);
                newX -= 96;
                if (newX < camera->unk10) {
                    newX = camera->unk10;
                }
            }
        }

        playerY = Q_24_8_TO_INT(player->y);
        delta = playerY - newY;
        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            if (delta < 49) {
                s32 temp = newY - 48;
                newY = delta + temp;
                camera->shiftY = 0;
            } else if (delta >= (gUnknown_030054BC - 208)) {
                s32 temp = newY - 112;
                newY = delta + temp;
                camera->shiftY = 0;
            }
        } else {
            if (delta < 49) {
                s32 temp = newY - 48;
                newY = delta + temp;
                camera->shiftY = 0;
            } else {
                newY += 2;
            }
        }
        newY = CLAMP(newY, gUnknown_03005440, gUnknown_030054BC - DISPLAY_HEIGHT);

        newX = newX + camera->shiftX;
        newY = newY + camera->shiftY;
        newX += camera->unk60;
        newY += camera->unk62;

    } else {
        if (camera->unk40 != 0) {
            camera->unk40--;
        } else {
            if (!(camera->unk50 & 1)) {
                s16 airSpeedX = player->speedAirX;
                camera->unk10
                    = Q_24_8_TO_INT(player->x) + camera->shiftX - (DISPLAY_WIDTH / 2);
                camera->unk56 = (airSpeedX + (camera->unk56 * 15)) >> 4;
                camera->unk10 += (camera->unk56 >> 5);
            }
            if (!(camera->unk50 & 2)) {
                s32 unk64 = camera->unk64;
                s32 temp8 = player->unk17 - 4;
                if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
                    temp8 = -temp8;
                }

                if (unk64 != temp8) {
                    if (unk64 < temp8) {
                        unk64 += 5;
                        if (unk64 > temp8) {
                            unk64 = temp8;
                        }
                    } else {
                        unk64 -= 5;
                        if (unk64 < temp8) {
                            unk64 = temp8;
                        }
                    }
                    camera->unk64 = unk64;
                }

                camera->unk14 = Q_24_8_TO_INT(player->y) + camera->shiftY
                    - (DISPLAY_HEIGHT / 2) + camera->unk4C + unk64;
            }
        }

        if ((camera->unk10 - newX) > camera->unk44) {
            s32 temp = camera->unk10 - newX - camera->unk44;
            s32 temp2 = Q_24_8_TO_INT(camera->unk8);
            if (temp2 > temp) {
                temp2 = temp;
            }
            newX += temp2;
        } else if ((camera->unk10 - newX) < -camera->unk44) {
            s32 temp = (camera->unk10 - newX) + camera->unk44;
            s32 temp2 = -Q_24_8_TO_INT(camera->unk8);
            if (temp2 < temp) {
                temp2 = temp;
            }

            newX += temp2;
        }

        newX = CLAMP(newX, camera->unk30, camera->unk34 - DISPLAY_WIDTH);

        if (camera->unk8 < Q_24_8(16)) {
            camera->unk8 += Q_24_8(0.125);
        }

        if ((player->moveState & 2)
            && (player->character != CHARACTER_KNUCKLES || player->unk61 != 9)) {
            camera->unk48 += 4;
            camera->unk48 = camera->unk48 > 24 ? 24 : camera->unk48;
        } else {
            camera->unk48 -= 4;
            camera->unk48 = camera->unk48 < 0 ? 0 : camera->unk48;
        }

        if ((camera->unk14 - newY) > camera->unk48) {
            newY += (camera->unkC > ((camera->unk14 - newY) - camera->unk48))
                ? ((camera->unk14 - newY) - camera->unk48)
                : camera->unkC;
        } else if ((camera->unk14 - newY) < -(camera->unk48)) {
            newY += (-camera->unkC < (camera->unk14 - newY) + camera->unk48)
                ? (camera->unk14 - newY) + camera->unk48
                : -camera->unkC;
        }

        newY = CLAMP(newY, camera->unk28, camera->unk2C - DISPLAY_HEIGHT);

        // maybe a macro, these values are already clamped
        newX = CLAMP(newX, camera->unk30, camera->unk34 - DISPLAY_WIDTH);
        newY = CLAMP(newY, camera->unk28, camera->unk2C - DISPLAY_HEIGHT);
        newX = newX + camera->unk60;
        newY = newY + camera->unk62;
    }

    camera->x = newX;
    camera->y = newY;

    camera->unk38 -= newX;
    camera->unk3C -= newY;

    sub_801C708(newX, newY);

    if (camera->unk58 != NULL) {
        camera->unk58(newX, newY);
    }
}

void sub_801C708(s32 x, s32 y)
{

    if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        Background *layer = &gUnknown_03005850.unk40;
        gBgScrollRegs[1][0] = x & 7;
        gBgScrollRegs[1][1] = y & 7;
        layer->scrollX = x;
        layer->scrollY = y;
        sub_8002A3C(layer);
        UpdateBgAnimationTiles(layer);
        layer++;
        gBgScrollRegs[2][0] = x & 7;
        gBgScrollRegs[2][1] = y & 7;
        layer->scrollX = x;
        layer->scrollY = y;
        sub_8002A3C(layer);
    }
}

void sub_801C774(void)
{
    Background *background = &gUnknown_03005850.unk0;
    gDispCnt |= 0x100;
    gBgCntRegs[0] = 0x1B0F;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        const Background *templates = gUnknown_080D5864;
        memcpy(background, &templates[3], 0x40);

        background->unk1C = 0x71;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->tilesVram = (void *)BG_SCREEN_ADDR(27);

        background->unk26 = 0x20;
        background->unk28 = 0x20;
    } else {
        const Background *templates = gUnknown_080D5864;
        memcpy(background, &templates[3], 0x40);
        background->unk1C = 2;

        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->tilesVram = (void *)BG_SCREEN_ADDR(27);

        background->unk26 = 0x20;
        background->unk28 = 0x1E;
    }

    sub_8002A3C(background);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
}

void sub_801C818(s32 UNUSED a, s32 UNUSED b)
{

    s32 i;
    s32 initial1, initial2;
    s16 camY;
    u16 bgScroll;
    u16 *cursor;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if ((gPlayer.moveState & MOVESTATE_8000000) && gUnknown_030054F4 >= 7) {
            s32 temp, val;
            temp = (gPlayer.moveState & MOVESTATE_4000000) ? 7 : 0xF;

            val = gBgScrollRegs[0][0];
            if ((gUnknown_03005590 & temp) == temp) {
                val++;
            }
            gBgScrollRegs[0][0] = val;
            gBgScrollRegs[0][0] &= 0xFF;
        } else {
            gBgScrollRegs[0][0] = gCamera.x >> 6;
            gBgScrollRegs[0][0] &= 0xFF;
        }

        gBgScrollRegs[0][1] = gCamera.y >> 9;
        gFlags |= 4;
        gUnknown_03002878 = (void *)REG_ADDR_BG3HOFS;
        gUnknown_03002A80 = 4;
        cursor = gUnknown_03001884;
        initial1 = 0;

        if ((gPlayer.moveState & MOVESTATE_8000000) && gUnknown_030054F4 >= 7) {
            s32 temp, val;
            temp = (gPlayer.moveState & MOVESTATE_4000000) ? 0xF : 0x1F;

            val = gBgScrollRegs[3][0];
            if ((gUnknown_03005590 & temp) == temp) {
                val++;
            }
            gBgScrollRegs[3][0] = val;
            gBgScrollRegs[3][0] &= 0xFF;
            bgScroll = gBgScrollRegs[3][0];
        } else {
            bgScroll = gCamera.x >> 7;
            gBgScrollRegs[3][0] = bgScroll;
        }

        camY = gCamera.y >> 8;
        initial2 = 0;
        for (i = 0x47; i >= 0; i--) {
            *cursor++ = initial1;
            *cursor++ = initial2;
        }

        for (i = 0x56; i >= 0; i--) {
            *cursor++ = bgScroll;
            *cursor++ = camY;
        }
    }
}

// https://decomp.me/scratch/ekyaq
NONMATCH("asm/non_matching/sub_801C94C.inc", void sub_801C94C(s32 a, s32 b))
{
    u8 i, j;
    u16 *cursor = NULL;
    s16 something;
    s32 x = 0;
    if ((gPlayer.moveState & MOVESTATE_8000000) && gUnknown_030054F4 >= 7) {
        if (gBgScrollRegs[3][0] == 0) {
            gBgScrollRegs[3][0] = a;
        }
        gBgScrollRegs[3][0] += (gPlayer.speedGroundX >> 8);
        a = gBgScrollRegs[3][0];
    }

    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        s16 val;
        gBgScrollRegs[3][0] = a >> 4;
        val = Div(b, 0x10);
        if (val > 0x100) {
            val = 0x100;
        }
        gBgScrollRegs[3][1] = val;
    } else {
        s16 temp, temp2;
        s32 unk5590_1;

        temp = Div(b, 0x10);
        if (temp > 0x100) {
            temp = 0x100;
        }

        temp2 = Div(a, 0x69);
        if (temp2 > 0x100) {
            temp2 = 0x100;
        }

        gFlags |= 4;
        gUnknown_03002878 = (void *)REG_ADDR_BG3HOFS;
        gUnknown_03002A80 = 4;

        cursor = gUnknown_03001884;
        unk5590_1 = gUnknown_03005590 * 0x18;

        for (i = 0; i < 159; i++) {
            s16 temp4;
            s32 sin;
            s32 temp3 = temp + i;
            if ((u32)(temp3 - 0x6F) < 10) {
                temp4 = (((temp3 - 0x6E) * a) >> 5) & 0xFF;
            } else {
                if (temp3 > 0x78) {
                    temp4 = ((a * 10) >> 5) & 0xFF;
                } else {
                    temp4 = temp2 << 3;
                }
            }
            *cursor++ = temp4;
            *cursor++ = temp;
            sin = SIN(((i * 8) + (temp << 3)) & ONE_CYCLE) >> 12;

            if (temp + i + sin >= 178) {
                break;
            }
        }
        something = (a >> 3);
        for (j = 0; i < 159; i++, j++) {
            x = (x + 8);
            x &= ONE_CYCLE;
            *cursor++ = something + (SIN(x) >> 0xD)
                + (COS(((gUnknown_03005590 * 2) + x) & ONE_CYCLE) >> 0xB)
                + (SIN((unk5590_1 + (i * 0x40)) & ONE_CYCLE) >> 0xD);
            *cursor++ = (j / 2) + temp + (SIN(x) >> 0xC)
                + (COS((gUnknown_03005590 + (i * 8)) & ONE_CYCLE) >> 10);
        };
    }
}
END_NONMATCH

void sub_801CB74(void)
{
    Background *background = &gUnknown_03005850.unk0;
    gDispCnt |= 0x100;
    gBgCntRegs[0] = 0x1B0F;

    *background = gUnknown_080D5864[3];

    background->unk1C = 0x171;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->tilesVram = (void *)BG_SCREEN_ADDR(27);
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    sub_8002A3C(background);

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

NONMATCH("asm/non_matching/sub_801CBE8.inc", void sub_801CBE8(s32 a, s32 b))
{
    // TODO: similar to sub_801C94C
}
END_NONMATCH

void sub_800A6A8(void);

void sub_801CD7C(void)
{
    Background *background = &gUnknown_03005850.unk0;
    const Background *templates;
    gBgCntRegs[0] = 0x1B0F;

    *background = gUnknown_080D5864[3];

    background->unk1C = 0x173;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->tilesVram = (void *)BG_SCREEN_ADDR(27);
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2E = 0x13;
    sub_8002A3C(background);

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    if (GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        sub_800A6A8();
    }
}

struct UNK_801CDF0 {
    u8 unk0[0x40A];
    s16 unk40A;
};

void sub_801CDF0(s32 a, s32 b)
{
    Player *player = &gPlayer;

    if ((player->moveState & MOVESTATE_8000000) && gUnknown_030054F4 > 6) {
        struct UNK_801CDF0 *unkDF0 = (void *)IWRAM_START;
        if (unkDF0->unk40A == 0) {
            unkDF0->unk40A = a;
        }
        unkDF0->unk40A += player->speedGroundX >> 8;
        a = unkDF0->unk40A;
    } else {
        struct UNK_801CDF0 *unkDF0 = (void *)IWRAM_START;
        unkDF0->unk40A = 0;
    }

    if (GAME_MODE_IS_SINGLE_PLAYER(gGameMode) && !(gUnknown_03005424 & 0x100)) {
        gWinRegs[5] = 0x3e;
        gWinRegs[4] = 0x3f3f;
        gWinRegs[0] = 0xf0;
        gWinRegs[2] = 0xa0;
        gWinRegs[1] = 0xf0;
        gWinRegs[3] = 0xa0;
        gBldRegs.bldY = 7;
        gBldRegs.bldCnt = 0x3f41;
        gBldRegs.bldAlpha = 0xc0c;
    }

    sub_8002A3C(&gUnknown_03005850.unk0);
    UpdateBgAnimationTiles(&gUnknown_03005850.unk0);

    if (!(gUnknown_03005590 & 0xF)) {
        gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 1) & 0xff;
        gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xff;
    }
    gBgScrollRegs[3][0] = a >> 4;
    gBgScrollRegs[3][1] = b >> 6;
}

void sub_801CEE4(void)
{
    Background *background = &gUnknown_03005850.unk0;
    if (GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        gDispCnt |= 0x100;
        gBgCntRegs[0] = 0x1b0c;
        *background = gUnknown_080D5864[3];
        background->unk1C = 0x172;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->tilesVram = (void *)BG_SCREEN_ADDR(27);
        background->unk26 = 0x20;
        background->unk28 = 0x20;
        sub_8002A3C(background);
    }
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

void sub_801CF60(s32 UNUSED a, s32 UNUSED b)
{
    s32 num;
    u16 *cursor, i, val;
    gBgScrollRegs[0][0]++;
    gBgScrollRegs[3][0] = 0;
    num = gUnknown_03005590 * 2;
    if (GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        gFlags = gFlags | 4;
        gUnknown_03002878 = (void *)REG_ADDR_BG3HOFS;
        gUnknown_03002A80 = 2;
        cursor = gUnknown_03001884;
        if (gCurrentLevel != 18) {
            gDispCnt |= 0x100;
            gDispCnt |= 0x2000;
            gWinRegs[5] = 0x3f;
            gWinRegs[4] = 0x3f3f;
            gWinRegs[0] = 0xf0;
            gWinRegs[2] = 0xa0;
            gWinRegs[1] = 0xf0;
            gWinRegs[3] = 0xa0;
            gBldRegs.bldY = 7;
            gBldRegs.bldCnt = 0x3f41;
            gBldRegs.bldAlpha = 0x1010;
        }

        for (i = 0; i < 0x60; i++) {
            *cursor++ = 0;
        }

        val = Div(num, 8);
        for (; i < 100; i++) {
            *cursor++ = val;
        }

        val = Div(num, 7);
        for (; i < 0x68; i++) {
            *cursor++ = val;
        }

        val = Div(num, 6);
        for (; i < 0x70; i++) {
            *cursor++ = val;
        }

        val = Div(num, 5);
        for (; i < 0x78; i++) {
            *cursor++ = val;
        }

        val = Div(num, 4);
        for (; i < 0x80; i++) {
            *cursor++ = val;
        }

        val = Div(num, 3);
        for (; i < 0x90; i++) {
            *cursor++ = val;
        }

        val = Div(num, 2);
        for (; i < 0x9F; i++) {
            *cursor++ = val;
        }
    }
}

void sub_801D1A8(void);

void sub_801D104(void)
{
    gDispCnt |= 0x100;
    gBgCntRegs[0] = 0x1a0f;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 32;
    DmaFill32(3, 0, BG_SCREEN_ADDR(24), 64);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
    gUnknown_03005590 = 0x380;

    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        sub_801D1A8();
    }
    gBgCntRegs[3] &= ~(1 | 2);
    gBgCntRegs[3] |= 2;
}

void sub_801D1A8(void)
{
    Background *background = &gUnknown_03005850.unk0;
    gDispCnt |= 0x100;
    gBgCntRegs[0] = 0x1a0f;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 32;
    DmaFill32(3, 0, BG_SCREEN_ADDR(24), 64);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    *background = gUnknown_080D5864[3];
    background->unk1C = 0xA8;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->tilesVram = (void *)BG_SCREEN_ADDR(26);
    background->unk26 = 0x20;
    background->unk28 = 0x20;

    sub_8002A3C(background);
}
