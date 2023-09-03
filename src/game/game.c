#include <string.h>
#include "core.h"
#include "flags.h"
#include "multi_sio.h"
#include "trig.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "game/game_5.h"
#include "game/game_over.h"
#include "game/multiboot/collect_rings/time_display.h"
#include "game/race_progress.h"
#include "game/save.h"
#include "game/screen_shake.h"
#include "game/stage/entities_manager.h"
#include "game/stage/rings_manager.h"
#include "game/stage/music_manager.h"
#include "game/stage/palette_loader.h"
#include "game/stage/pause_menu.h"
#include "game/time_attack/lobby.h"
#include "game/stage/music_manager.h"

#include "constants/songs.h"
#include "constants/tilemaps.h"

void sub_80299F0(u32, u32, u32, Player *);
void CreateGameStage(void);

void sub_801AB3C(void);

void sub_801B7A8(struct Task *);
void sub_801F044(void);

void sub_80213C0(u32, u32, Player *);
void sub_80498CC(u8);
void sub_802B708(void);
void InitCamera(u32);
void sub_801BF90(void);

void SetupStageLoadingScreen(void);

void sub_80115D0(u32, u32, u32);

void sub_8019120(void);
void CreateMultiplayerPlayer(u8);
void sub_8019498(void);
void sub_80193C4(u8);
void CreatePlayerActor(Player *);
void sub_80191A4(void);

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

void sub_802C668(s32 *, s32 *);
void Task_801E0A8(void);
void TaskDestructor_801E040(struct Task *);

extern const CameraMain sStageBgUpdateFuncs[];
extern const u32 *gCollisionTable[NUM_LEVEL_IDS];
extern const u16 gUnknown_080D5964[9][2];

const VoidFn gUnknown_080D57DC[NUM_LEVEL_IDS]
    = { sub_801AF14, sub_801B7BC, sub_801B83C, sub_801BF24, // Anti-Formatting
        sub_801B8A8, sub_801B914, sub_801B980, sub_801BF24, //
        sub_801AFA4, sub_801B03C, sub_801B9EC, sub_801BF24, //
        sub_801B0D4, sub_801B180, sub_801BA58, sub_801BF24, //
        sub_801BAC4, sub_801BB30, sub_801BB9C, sub_801BF24, //
        sub_801B22C, sub_801B324, sub_801BC1C, sub_801BF24, //
        sub_801B41C, sub_801B4EC, sub_801B5BC, sub_801BF24, //
        sub_801BC88, sub_801BD08, sub_801BD74, sub_801BDE0, //
        sub_801BE4C, sub_801BEB8 };

void ApplyGameStageSettings(void)
{
    gLevelScore = 0;
    gUnknown_030054B0 = 0;
    gNumLives = 3;

    if (IS_MULTI_PLAYER) {
        gNumLives = 1;
    }

    if ((gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK
         || gGameMode == GAME_MODE_MULTI_PLAYER || gGameMode == GAME_MODE_TEAM_PLAY)
        || (gUnknown_03005424 & 0x40)) {
        gDifficultyLevel = 0;
    } else {
        gDifficultyLevel = gLoadedSaveGame->difficultyLevel;
    }

    if ((gUnknown_03005424 & 0x40)) {
        SetPlayerControls(A_BUTTON, B_BUTTON, R_BUTTON);
    } else {
        SetPlayerControls(gLoadedSaveGame->buttonConfig.jump,
                          gLoadedSaveGame->buttonConfig.attack,
                          gLoadedSaveGame->buttonConfig.trick);
    }
}

void GameStageStart(void)
{
    gTrappedAnimalVariant = 0;
    gUnknown_030055B0 = 0;
    gRingCount = 0;
    gUnknown_030054F8 = 1;

    if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        sub_80299F0(gSelectedCharacter, gCurrentLevel, 0, &gPlayer);
        gUnknown_030056A4 = NULL;
    }

    gStageTime = 0;
    gUnknown_03005424 &= ~0x80;

    if (IS_MULTI_PLAYER) {
        gUnknown_030054A0 = gFrameCount;
    }

    gCheckpointTime = ZONE_TIME_TO_INT(0, 0);

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        gCourseTime = ZONE_TIME_TO_INT(0, 0);
    } else {
        gCourseTime = ZONE_TIME_TO_INT(3, 0);
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
        CreateStageMusicManager();
        SetupStageLoadingScreen();
        InitCamera(gCurrentLevel);
        gUnknown_080D57DC[gCurrentLevel]();
    } else {
        InitCamera(0);
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

    CreateStageRingsManager();
    CreateStageEntitiesManager();

    gUnknown_03001944 = 0;
    gUnknown_030017F0 = 0x100;
    gUnknown_03005394 = 0x100;
    gUnknown_03002A8C = 0x78;
    gUnknown_03004D58 = 0x50;
    gUnknown_0300194C = 0x78;
    gUnknown_03002820 = 0x50;
    gUnknown_03005398 = 0x80;

    if (IS_MULTI_PLAYER) {
        sub_80191A4();
        sub_8019120();

        gRandomItemBox = 0;

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            gUnknown_030053E8[i] = 0;

            if (GetBit(gMultiplayerConnections, i)) {
                CreateMultiplayerPlayer(i);
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
            gPlayer.itemEffect |= PLAYER_ITEM_EFFECT__80;
        }
    } else {
        for (i = 0; i < 4; i++) {
            gUnknown_030054B4[i] = -1;
        }
    }

    gUnknown_030056A4 = NULL;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        CreatePlayerActor(&gPlayer);
    }

    if (IS_MULTI_PLAYER && gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        CreateRaceProgressIndicator();
    }
}

void sub_801AB3C(void)
{
    u16 sioId = SIO_MULTI_CNT->id;
    u32 timeStep;

    if (IS_SINGLE_PLAYER) {
        if (!(gUnknown_03005424 & 0x20) && (gPressedKeys & START_BUTTON)
            && !(gUnknown_03005424 & 0x40)) {
            CreatePauseMenu();
        }
        gStageTime++;
        timeStep = 1;
    } else {
        u32 temp = (gFrameCount - gUnknown_030054A0);
        timeStep = temp - gStageTime;
        gStageTime = temp;

        if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            if ((temp & ~(0x1FF)) != ((temp - timeStep) & ~(0x1FF))) {
                u32 mask, rand;
                MultiplayerPseudoRandom32();

                if ((temp & ~(0xFFF)) != ((temp - timeStep) & ~(0xFFF))) {
                    u32 value = (gRandomItemBox >> 4) + 1;
                    gRandomItemBox = ((gRandomItemBox & 0xF) | (value * 16));
                }
                rand = gMultiplayerPseudoRandom;
                mask = 7;
                gRandomItemBox = (gRandomItemBox & 0xF8) | (rand & mask);
            }

        } else if ((temp & ~(0x3F)) != ((temp - timeStep) & ~(0x3F))) {
            MultiplayerPseudoRandom32();
        }

        if (gCamera.unk50 & CAM_MODE_SPECTATOR) {
            if ((gInput & (L_BUTTON | R_BUTTON)) == (L_BUTTON | R_BUTTON)) {
                if (sioId != 3) {
                    gCamera.spectatorTarget = 3;
                } else {
                    gCamera.spectatorTarget = 2;
                }
            } else if (gInput & L_BUTTON) {
                if (sioId == 0) {
                    gCamera.spectatorTarget = 1;
                } else {
                    gCamera.spectatorTarget = 0;
                }
            } else if (gInput & R_BUTTON) {
                if (sioId < 2) {
                    gCamera.spectatorTarget = 2;
                } else {
                    gCamera.spectatorTarget = 1;
                }
            } else {
                gCamera.spectatorTarget = sioId;
            }
        } else {
            gCamera.spectatorTarget = sioId;
        }

        // If player is not connected, switch back to our player
        if (!GetBit(gMultiplayerConnections, gCamera.spectatorTarget)) {
            gCamera.spectatorTarget = sioId;
        }

        if (gUnknown_030053E0 > 0) {
            gUnknown_030053E0--;
        }
    }

    gUnknown_0300544C = gUnknown_03005424;

    if (gUnknown_03005424 & 1) {
        return;
    }

    gCheckpointTime += timeStep;

    if (gUnknown_03005424 & EXTRA_STATE__4) {
        gCourseTime -= timeStep;
        if ((s32)gCourseTime > 0) {
            return;
        }

        if (IS_SINGLE_PLAYER) {
            gUnknown_03005424 |= EXTRA_STATE__ACT_START;

            if (gLoadedSaveGame->timeLimitDisabled) {
                return;
            }

            gPlayer.itemEffect = 0;

            if (gPlayer.moveState & 0x40) {
                gPlayer.speedAirY = -0x2A0;
            } else {
                gPlayer.speedAirY = -0x4E0;
            }

            if (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_BOSS)) {
                CreateScreenShake(0x800, 8, 16, -1, 208);
            }
            gPlayer.moveState |= 0x80;
            m4aSongNumStart(SE_149);
        } else {
            gUnknown_03005424 |= EXTRA_STATE__ACT_START;
            sub_8019F08();
        }
    } else {
        gCourseTime += timeStep;
        if (gCourseTime <= MAX_COURSE_TIME) {
            return;
        }

        if (IS_SINGLE_PLAYER) {
            gUnknown_03005424 |= EXTRA_STATE__ACT_START;

            if (gLoadedSaveGame->timeLimitDisabled
                && (gGameMode == GAME_MODE_SINGLE_PLAYER || IS_MULTI_PLAYER)) {
                return;
            }

            gPlayer.itemEffect = 0;

            if (gPlayer.moveState & 0x40) {
                gPlayer.speedAirY = -0x2A0;
            } else {
                gPlayer.speedAirY = -0x4E0;
            }
            gPlayer.moveState |= 0x80;
            m4aSongNumStart(SE_149);
        } else {
            gUnknown_03005424 |= EXTRA_STATE__ACT_START;
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
        gUnknown_03005424 |= EXTRA_STATE__ACT_START;
        CreateGameOverScreen(1);
    } else {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
        CreateGameStage();
    }
}

void sub_801AF14(void)
{
    u16 level;
    sub_80115D0(0x830, 0x7F207F20, 0);
    CreatePaletteLoaderTask(0x2000, 897, 0, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
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
    CreatePaletteLoaderTask(0x2000, 900, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 900, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 900, 2, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
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
    CreatePaletteLoaderTask(0x2000, 900, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 900, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 900, 2, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
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
    CreatePaletteLoaderTask(0x2000, 906, 2, NULL);
    CreatePaletteLoaderTask(0x2000, 906, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 906, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 901, 0, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
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
    CreatePaletteLoaderTask(0x2000, 906, 2, NULL);
    CreatePaletteLoaderTask(0x2000, 906, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 906, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 901, 0, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
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
    CreatePaletteLoaderTask(0x2000, 940, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 2, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 3, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 4, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 5, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 6, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 7, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 8, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 9, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 11, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
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
    CreatePaletteLoaderTask(0x2000, 940, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 1, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 2, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 3, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 4, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 5, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 6, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 7, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 8, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 9, NULL);
    CreatePaletteLoaderTask(0x2000, 940, 11, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
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
    CreatePaletteLoaderTask(0x2000, 941, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 942, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 943, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 944, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 945, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 946, 0, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
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
    CreatePaletteLoaderTask(0x2000, 941, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 942, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 943, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 944, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 945, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 946, 0, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
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
    CreatePaletteLoaderTask(0x2000, 941, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 942, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 943, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 944, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 945, 0, NULL);
    CreatePaletteLoaderTask(0x2000, 946, 0, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}

void DestroyCameraMovementTask(void);
void sub_80299FC(Player *player);

void sub_801B68C(void)
{
    TaskDestroy(gGameStageTask);
    gGameStageTask = NULL;
    sub_80299FC(&gPlayer);
    DestroyCameraMovementTask();
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
    CreatePaletteLoaderTask(0x2000, 897, 0, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
    CreatePaletteLoaderTask(0x2000, 686, 0, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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

    CreatePaletteLoaderTask(0x2000, 686, 0, NULL);

    level = gCurrentLevel;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (gSelectedCharacter == 0
            && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel
            && gCurrentLevel == 18) {
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
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
            gUnknown_030054A8.unk1 = 0x1E;
        } else {
            m4aSongNumStart(gLevelSongs[level]);
        }
    } else {
        m4aSongNumStart(MUS_VS_2);
    }
}
