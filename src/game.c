#include "main.h"
#include "game.h"
#include "save.h"
#include "course_progress.h"
#include "multi_sio.h"
#include "collect_rings_time_display.h"
#include "m4a.h"
#include "time_attack_lobby.h"
#include "game_over.h"
#include "constants/songs.h"

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
void sub_802F0A8(void);

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

extern const u16 gUnknown_080D5964[][2];
// TODO not TaskMain use an inline type
extern const TaskMain gUnknown_080D57DC[];

void ApplyGameStageSettings(void)
{
    gUnknown_03005450 = 0;
    gUnknown_030054B0 = 0;
    gNumLives = 3;

    if (IsMultiplayer()) {
        gNumLives = 1;
    }

    if ((gGameMode >= GAME_MODE_TIME_ATTACK && gGameMode <= GAME_MODE_TEAM_PLAY)
        || (gUnknown_03005424 & 0x40)) {
        gUnknown_030054EC = 0;
    } else {
        gUnknown_030054EC = gLoadedSaveGame->unk4;
    }

    if ((gUnknown_03005424 & 0x40)) {
        sub_802B61C(A_BUTTON, B_BUTTON, R_BUTTON);
    } else {
        sub_802B61C(gLoadedSaveGame->unk2C.unk0, gLoadedSaveGame->unk2C.unk2,
                    gLoadedSaveGame->unk2C.unk4);
    }
}

void GameStageStart(void)
{
    gUnknown_03005444 = 0;
    gUnknown_030055B0 = 0;
    gCourseTime = 0;
    gUnknown_030054F8 = 1;

    if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        sub_80299F0(gSelectedCharacter, gCurrentLevel, 0, &gPlayer);
        gUnknown_030056A4 = 0;
    }

    gUnknown_03005590 = 0;
    gUnknown_03005424 &= ~0x80;

    if (IsMultiplayer()) {
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
        sub_802F0A8();
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

    if (IsMultiplayer()) {
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

    if (IsMultiplayer() && gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        CreateRaceProgressIndicator();
    }
}

void sub_800A9FC(void);

void sub_8019F08(void);

void sub_802B4F8(s32, s32, s32, s32, s32);

void sub_801AB3C(void)
{
    u16 sioId = SIO_MULTI_CNT->id;
    u32 step;

    if (!IsMultiplayer()) {
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

        if (!IsMultiplayer()) {
            gUnknown_03005424 |= 1;

            if (gLoadedSaveGame->unk5) {
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

        if (!IsMultiplayer()) {
            gUnknown_03005424 |= 1;

            if (gLoadedSaveGame->unk5
                && (gGameMode == GAME_MODE_SINGLE_PLAYER || IsMultiplayer())) {
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
    u32 level;
    sub_80115D0(0x830, 0x7F207F20, 0);
    sub_8009628(0x2000, 0x381, 0, 0);

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;
    sub_8009628(0x2000, 900, 0, 0);
    sub_8009628(0x2000, 900, 1, 0);
    sub_8009628(0x2000, 900, 2, 0);

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;
    sub_8009628(0x2000, 900, 0, 0);
    sub_8009628(0x2000, 900, 1, 0);
    sub_8009628(0x2000, 900, 2, 0);

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;
    sub_8009628(0x2000, 906, 2, 0);
    sub_8009628(0x2000, 906, 0, 0);
    sub_8009628(0x2000, 906, 1, 0);
    sub_8009628(0x2000, 901, 0, 0);

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;
    sub_8009628(0x2000, 906, 2, 0);
    sub_8009628(0x2000, 906, 0, 0);
    sub_8009628(0x2000, 906, 1, 0);
    sub_8009628(0x2000, 901, 0, 0);

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;
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

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;
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

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;
    sub_8009628(0x2000, 941, 0, 0);
    sub_8009628(0x2000, 942, 0, 0);
    sub_8009628(0x2000, 943, 0, 0);
    sub_8009628(0x2000, 944, 0, 0);
    sub_8009628(0x2000, 945, 0, 0);
    sub_8009628(0x2000, 946, 0, 0);

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;
    sub_8009628(0x2000, 941, 0, 0);
    sub_8009628(0x2000, 942, 0, 0);
    sub_8009628(0x2000, 943, 0, 0);
    sub_8009628(0x2000, 944, 0, 0);
    sub_8009628(0x2000, 945, 0, 0);
    sub_8009628(0x2000, 946, 0, 0);

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;
    sub_8009628(0x2000, 941, 0, 0);
    sub_8009628(0x2000, 942, 0, 0);
    sub_8009628(0x2000, 943, 0, 0);
    sub_8009628(0x2000, 944, 0, 0);
    sub_8009628(0x2000, 945, 0, 0);
    sub_8009628(0x2000, 946, 0, 0);

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;
    sub_8009628(0x2000, 897, 0, 0);

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;
    sub_8009628(0x2000, 686, 0, 0);

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

    sub_8009628(0x2000, 686, 0, 0);

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
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
    u32 level;

#ifndef NON_MATCHING
    level = (u16)gCurrentLevel;
#endif

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0 && gLoadedSaveGame->unk7[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8[1] = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}
