#include "main.h"
#include "game.h"
#include "save.h"
#include "course_progress.h"
#include "multi_sio.h"

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
void CreateCollectRingsTimeDisplay(void);

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

extern const u16 gUnknown_080D5964[][2];
// TODO not TaskMain use an inline type
extern const TaskMain gUnknown_080D57DC[];

void ApplyGameStageSettings(void)
{
    gUnknown_03005450 = 0;
    gUnknown_030054B0 = 0;
    gUnknown_03005448 = 3;

    if (IsMultiplayer()) {
        gUnknown_03005448 = 1;
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
