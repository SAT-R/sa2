#include "core.h"
#include "game/special_stage/main.h"
#include "game/special_stage/utils.h"
#include "game/special_stage/player.h"
#include "game/special_stage/ui.h"
#include "game/special_stage/world.h"
#include "game/special_stage/collectables.h"
#include "game/special_stage/guard_robo.h"
#include "game/special_stage/physics.h"
#include "game/special_stage/tables.h"
#include "game/game.h"
#include "game/save.h"
#include "sprite.h"
#include "game/screen_transition.h"
#include "lib/m4a.h"
#include "task.h"
#include "game/title_screen.h"
#include "constants/zones.h"

#include "constants/songs.h"

#define MAX_POINTS 99900

static void Task_ShowIntroScreen(void);
static void SpecialStageOnDestroy(struct Task *);
static void Task_InitComponents(void);
static void SpecialStagePauseMenuMain(void);
static void TickStageTimer(void);
void Task_SpecialStageMain(void);
void sub_806BFD0(void);
void Task_FadeInSpecialStage(void);
void Task_FadeToResultScreen(void);
static void SetupIntroScreenRegisters(void);
void sub_806C638(void);
void sub_806C6A4(void);
void sub_806C560(void);
void sub_806C49C(void);
void sub_806C42C(void);
void sub_806C338(void);
void sub_806CA54(void);
void sub_806CA18(void);
void sub_806C158(void);

void CreateSpecialStage(s16 selectedCharacter, s16 level)
{
    struct Task *t;
    struct SpecialStage *stage;

    s16 zone, character, temp, i, target;

    m4aMPlayAllStop();

    if (level != -1) {
        temp = level >> 2;
    } else {
        temp = gCurrentLevel >> 2;
    }
    zone = temp;

    if (selectedCharacter == -1) {
        character = gSelectedCharacter;
    } else {
        character = selectedCharacter;
    }

    InitSpecialStageScreenVram();

    t = TaskCreate(Task_ShowIntroScreen, sizeof(struct SpecialStage), 0x2000, 0,
                   SpecialStageOnDestroy);
    stage = TASK_DATA(t);
    stage->cameraX = Q_16_16(256);
    stage->cameraY = Q_16_16(256);
    stage->unk59C = 0;

    stage->cameraBearing = 512;

    if (character <= CHARACTER_AMY) {
        stage->character = character;
        stage->unk5B7 = FALSE;
    } else {
        stage->character = CHARACTER_TAILS;
        stage->unk5B7 = TRUE;
    }

    stage->zone = zone;
    stage->level = level;
    stage->animFrame = 0;

    stage->timeHundreds = 1;
    stage->timeTens = 2;
    stage->timeUnits = 0;
    stage->timeTicks = 0;

    stage->rings = 0;
    stage->ringsTarget = gSpecialStageScoreTargets[zone];

    stage->state = 0;
    stage->paused = 0;
    stage->ringsHundreds = 0;

    stage->ringsTens = 0;
    stage->ringsUnits = 0;

    stage->ringsTargetHundreds = Div(stage->ringsTarget, 100);
    stage->ringsTargetTens
        = Div(stage->ringsTarget, 10) - (stage->ringsTargetHundreds * 10);
    stage->ringsTargetUnits = Mod(stage->ringsTarget, 10);

    stage->targetReached = 0;
    stage->targetReached = 0;
    stage->pauseMenuCursor = 0;
    stage->unk5C7 = 0;
    stage->unk5C8 = 0;

    stage->unk5CA = 120;
    stage->unk5CC = 140;
    stage->unk5CE = 64;

    stage->unk5D0 = 40;
    stage->unk5D1 = 60;

    // wtf, all this stuff is const
    target = 49;
    stage->unk5D2 = target;

    for (i = 1; i < stage->unk5D2; i *= 2)
        ;

    stage->unk5D2 = i;
    stage->unk5D3 = (((DISPLAY_HEIGHT - 1) - stage->unk5D1) >> 1) + stage->unk5D1;
}

static void SetupIntroScreenRegisters(void)
{
    gDispCnt = 0x1641;
    gBgCntRegs[1] = 0x703;
    gBgCntRegs[2] = 0xD086;
    gBldRegs.bldCnt = 0xAF;
    gBldRegs.bldY = 0x10;

    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;

    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[1][0] = 0;
    gUnknown_03002280[1][1] = 0;
    gUnknown_03002280[1][2] = 0xFF;
    gUnknown_03002280[1][3] = 0x20;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[2][0] = 0;
    gUnknown_03002280[2][1] = 0;
    gUnknown_03002280[2][2] = 0xFF;
    gUnknown_03002280[2][3] = 0x80;
}

void Task_IntroScreenMain(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);

    struct TransitionState *transition = &stage->transition;
    DisplaySprite(&stage->introText);
    gBldRegs.bldCnt = 0xAF;

    stage->animFrame++;

    if (stage->animFrame > 139) {
        gBldRegs.bldCnt = 0xBF;
        gBldRegs.bldY = 0x10;

        transition->unk0 = 0;
        transition->unk2 = 2;
        transition->unk4 = Q_8_8(0);
        transition->speed = 0x100;
        transition->unkA = 0;
        transition->unk8 = 0xBF;
        stage->animFrame = 0;
        gCurTask->main = Task_InitComponents;
    }
}

void Task_InitComponents(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    stage->state = 2;

    switch (stage->animFrame) {
        case 0:
            stage->physicsTask = CreateSpecialStagePhysics(stage);
            stage->playerTask = CreateSpecialStagePlayer(stage);
            stage->screenVram = gUnknown_03005B5C;
            stage->guardRoboTask = CreateSpecialStageGuardRobo(stage);
            break;
        case 1:
            stage->collectablesTask = CreateSpecialStageCollectables(stage);
            break;
        case 2:
            stage->worldTask = CreateSpecialStageWorld(stage);
            stage->uiTask = CreateSpecialStageUI(stage);
            break;
        case 3:
            stage->state = 3;
            gCurTask->main = Task_FadeInSpecialStage;
            return;
    }

    stage->animFrame++;
}

void Task_SpecialStageStartDelay(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    SpecialStagePauseMenuMain();

    if (!stage->paused) {
        TickStageTimer();
        stage->animFrame++;
    }

    if (stage->animFrame > 59) {
        stage->animFrame = 0;
        stage->state = 5;
        gCurTask->main = Task_SpecialStageMain;
    }
}

void Task_SpecialStageMain(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(stage->playerTask);

    if (stage->state == 6) {
#ifndef NON_MATCHING
        do
#endif
            if (player->state != 14 && player->state != 15) {
                player->state = 11;
            }
#ifndef NON_MATCHING
        while (0);
#endif
        stage->state = 7;
    }

    if (stage->state == 6 || stage->state == 7) {
        if (player->state != 11 && player->state != 12 && player->state != 13) {
            player->state = 11;
        }
    }

    switch (player->state) {
        case 13:
            stage->state = 8;
            gCurTask->main = sub_806BFD0;
            return;
        case 15:
            stage->state = 8;
            gCurTask->main = sub_806BFD0;
            return;
        case 14:
            break;
        default:
            SpecialStagePauseMenuMain();
            break;
    }

    if (stage->paused == FALSE) {
        TickStageTimer();
        if (stage->unk5C7) {
            s32 temp = --stage->unk5C8;
            if (temp == 0) {
                stage->unk5C7 = 0;
                if (stage->timeHundreds == 0 && stage->timeTens < 3) {
                    m4aSongNumStart(MUS_SPECIAL_STAGE_PINCH);
                } else {
                    m4aSongNumStart(MUS_SPECIAL_STAGE);
                }
            }
        } else {
            if (stage->timeHundreds == 0 && stage->timeTens == 3 && stage->timeUnits == 0
                && stage->timeTicks == 0) {
                m4aSongNumStart(MUS_SPECIAL_STAGE_PINCH);
            }
        }
    }
}

void sub_806BFD0(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    struct TransitionState *transition = &stage->transition;
    struct SpecialStageGuardRobo *guardRobo = TASK_DATA(stage->guardRoboTask);
    struct SpecialStagePlayer *player = TASK_DATA(stage->playerTask);

    guardRobo->state = 0;

    transition->unk0 = 1;
    transition->unk2 = 1;
    transition->unk4 = Q_8_8(0);
    transition->speed = 0x40;
    transition->unkA = 0;
    transition->unk8 = 0xBF;
    NextTransitionFrame(transition);

    gDispCnt = 0x9641;
    gWinRegs[5] = 0x103F;

    if (player->state == 13) {
        m4aSongNumStart(MUS_SPECIAL_STAGE_CLEAR);
    }
    gCurTask->main = Task_FadeToResultScreen;
}

void Task_FadeToResultScreen(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    struct TransitionState *transition = &stage->transition;
    struct SpecialStagePlayer *player = TASK_DATA(stage->playerTask);

    if (NextTransitionFrame(transition) == 0) {
        gDispCnt = 0x9641;
        gWinRegs[5] = 0x103F;
        return;
    }

    if (stage->guardRoboTask != NULL) {
        TaskDestroy(stage->guardRoboTask);
        stage->guardRoboTask = NULL;
    }

    if (stage->physicsTask != NULL) {
        TaskDestroy(stage->physicsTask);
        stage->physicsTask = NULL;
    }

    if (stage->worldTask != NULL) {
        TaskDestroy(stage->worldTask);
        stage->worldTask = NULL;
    }

    if (stage->collectablesTask != NULL) {
        TaskDestroy(stage->collectablesTask);
        stage->collectablesTask = NULL;
    }

    if (stage->uiTask != NULL) {
        TaskDestroy(stage->uiTask);
        stage->uiTask = NULL;
    }

    sub_806CEC4(&stage->unk48, 0, 7, 0x8B, 0x20, 0x20, 0, 1, 0, 0);
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gDispCnt = 0x1240;

    if (player->state == 13) {
        stage->animFrame = 0;
        player->state = 0x10;
        gCurTask->main = sub_806CA18;
    } else {
        gCurTask->main = sub_806C158;
    }
}

void sub_806C158(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    struct SpecialStagePlayer *player = TASK_DATA(stage->playerTask);

    gBldRegs.bldY = 0;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldAlpha = 0;

    stage->uiTask = CreateSpecialStageResultsScreen(stage);
    stage->points = stage->rings * 100;

    if (stage->points > MAX_POINTS) {
        stage->points = MAX_POINTS;
    }

    stage->bonusPoints = stage->targetReached ? 10000 : 0;
    stage->finalScore = 0;

    if (player->state == 16) {
        if (stage->targetReached) {
            m4aSongNumStart(MUS_CHAOS_EMERALD);
            stage->unk5C7 = 1;
            stage->unk5C8 = 150;
        } else {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = 0;
            stage->unk5C8 = 0;
        }
    } else {
        m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT_LOSE);
    }

    stage->animFrame = 0;
    gCurTask->main = sub_806CA54;
}

void sub_806C25C(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);

    if (stage->unk5C7 == 1) {
        if (--stage->unk5C8 == 0) {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = 0;
        }
    }

    if (gPressedKeys & A_BUTTON) {
        gCurTask->main = sub_806C42C;
        return;
    }

    if (stage->points < 100) {
        stage->finalScore += stage->points;
        stage->points = 0;
    } else {
        stage->finalScore += 100;
        stage->points -= 100;
    }

    if (stage->finalScore > MAX_POINTS) {
        stage->finalScore = MAX_POINTS;
    }

    stage->animFrame++;

    if ((stage->animFrame & 3) == 0) {
        m4aSongNumStart(SE_STAGE_RESULT_COUNTER);
    }

    if (stage->points == 0) {
        stage->points = 0;
        gCurTask->main = sub_806C338;
    }
}

void sub_806C338(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    if (stage->unk5C7 == 1) {
        if (--stage->unk5C8 == 0) {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = 0;
        }
    }

    if (gPressedKeys & A_BUTTON) {
        gCurTask->main = sub_806C42C;
        return;
    }

    if (stage->bonusPoints < 100) {
        stage->finalScore += stage->bonusPoints;
        stage->bonusPoints = 0;
    } else {
        stage->finalScore += 100;
        stage->bonusPoints -= 100;
    }

    if (stage->finalScore > MAX_POINTS) {
        stage->finalScore = MAX_POINTS;
    }

    stage->animFrame++;

    if ((stage->animFrame & 3) == 0) {
        m4aSongNumStart(SE_STAGE_RESULT_COUNTER);
    }

    if (stage->bonusPoints == 0) {
        if (stage->finalScore != 0) {
            m4aSongNumStart(SE_STAGE_RESULT_COUNTER_DONE);
        }

        stage->bonusPoints = 0;
        stage->animFrame = 0;
        gCurTask->main = sub_806C49C;
    }
}

void sub_806C42C(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    stage->finalScore += stage->points;
    stage->points = 0;

    stage->finalScore += stage->bonusPoints;
    stage->bonusPoints = 0;

    if (stage->finalScore > MAX_POINTS) {
        stage->finalScore = MAX_POINTS;
    }

    if (stage->finalScore != 0) {
        m4aSongNumStart(SE_STAGE_RESULT_COUNTER_DONE);
    }

    stage->animFrame = 0;
    gCurTask->main = sub_806C49C;
}

void sub_806C49C(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    struct TransitionState *transition = &stage->transition;
    stage->animFrame++;

    if (stage->unk5C7 == 1) {
        if (--stage->unk5C8 == 0) {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = 0;
        }
    }

    if (gPressedKeys & A_BUTTON || stage->animFrame > 60) {
        transition->unk0 = 0;
        transition->unk2 = 1;
        transition->unk4 = Q_8_8(0);
        transition->speed = 0x40;
        transition->unkA = 0;
        transition->unk8 = 0xBF;

        stage->animFrame = 0;
        if (stage->targetReached) {
            gCurTask->main = sub_806C560;
        } else {
            gCurTask->main = sub_806C6A4;
        }
    }
}

void sub_806C560(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    u8 character = stage->character;
    u8 chaosEmeralds = gLoadedSaveGame->chaosEmeralds[character];

    if (stage->unk5C7 == 1) {
        if (--stage->unk5C8 == 0) {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = 0;
        }
    }

    if (!(chaosEmeralds & CHAOS_EMERALD(stage->zone))) {
        SpecialStageResultsScreenNewEmeraldSequence(stage);
        gLoadedSaveGame->chaosEmeralds[character] |= CHAOS_EMERALD(stage->zone);
        stage->animFrame = 120;
    } else {
        stage->animFrame = 12;
    }

    if ((gLoadedSaveGame->chaosEmeralds[character] & ALL_ZONE_CHAOS_EMERALDS)
        == ALL_ZONE_CHAOS_EMERALDS) {
        gLoadedSaveGame->chaosEmeralds[character]
            = ALL_ZONE_CHAOS_EMERALDS | CHAOS_EMERALDS_COMPLETED;
    }

    gCurTask->main = sub_806C638;
}

void sub_806C638(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);

    if (stage->unk5C7 == 1) {
        if (--stage->unk5C8 == 0) {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = 0;
        }
    }

    stage->animFrame--;

    if (stage->animFrame < 1) {
        stage->animFrame = 0;
        gCurTask->main = sub_806C6A4;
    }
}

void sub_806C6A4(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    if (NextTransitionFrame(&stage->transition) == 0) {
        return;
    }

    stage->animFrame++;
    if (stage->animFrame > 119) {
        s32 temp2, temp3, temp4;
        s32 temp = stage->finalScore;

        if (stage->playerTask != NULL) {
            TaskDestroy(stage->playerTask);
            stage->playerTask = NULL;
        }

        if (stage->uiTask != NULL) {
            TaskDestroy(stage->uiTask);
            stage->uiTask = NULL;
        }

        temp4 = gLevelScore;
        gLevelScore += temp;

        temp2 = Div(gLevelScore, 50000);
        temp3 = Div(temp4, 50000);

        if (temp2 != temp3 && gGameMode == GAME_MODE_SINGLE_PLAYER) {
            u16 temp5 = (temp2 - temp3);
            temp5 += gNumLives;

            if (temp5 > 0xFF) {
                temp5 = 0xFF;
            }

            gNumLives = temp5;
        }

        gLoadedSaveGame->score += stage->rings;

        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
        WriteSaveGame();
        GameStageStart();
    }
}

static void TickStageTimer(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);

    if (stage->timeTicks > 0) {
        stage->timeTicks--;
        return;
    }

    if (stage->timeUnits > 0) {
        stage->timeUnits--;
    } else if (stage->timeTens > 0) {
        stage->timeTens--;
        stage->timeUnits = 9;
    } else if (stage->timeHundreds > 0) {
        stage->timeHundreds--;
        stage->timeTens = 9;
        stage->timeUnits = 9;
    } else {
        stage->timeHundreds = 0;
        stage->timeTens = 0;
        stage->timeUnits = 0;
        stage->timeTicks = 0;

        if (stage->state != 7) {
            stage->state = 6;
        }
        return;
    }

    stage->timeTicks = GBA_FRAMES_PER_SECOND - 1;
}

void SpecialStagePauseMenuMain(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);

    if (stage->paused == TRUE) {
        if (gPressedKeys & (DPAD_UP | DPAD_DOWN)) {
            u8 prevCursorPosition = stage->pauseMenuCursor;

            if (gPressedKeys & DPAD_UP) {
                stage->pauseMenuCursor = 0;
            }

            if (gPressedKeys & DPAD_DOWN) {
                stage->pauseMenuCursor = 1;
            }

            if (prevCursorPosition != stage->pauseMenuCursor) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
            }
            return;
        }

        if (gPressedKeys & A_BUTTON) {
            if (stage->pauseMenuCursor == 0) {
                stage->paused = FALSE;
                // Don't jump when exiting menu
                gPressedKeys &= ~A_BUTTON;
                return;
            }
            TasksDestroyAll();
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
            CreateTitleScreenAndSkipIntro();
            return;
        }
    }

    if (gPressedKeys & START_BUTTON) {
        stage->paused = !stage->paused ? TRUE : FALSE;
        stage->pauseMenuCursor = 0;
    }
}

static void SpecialStageOnDestroy(UNUSED struct Task *t)
{
    gUnknown_03004D54 = &gUnknown_03001B60[0];
    gUnknown_030022C0 = &gUnknown_03001B60[1];
}

static void Task_ShowIntroScreen(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    SetupIntroScreenRegisters();
    sub_806CA88(&stage->introText, RENDER_TARGET_SCREEN, 0x28, 0x37C, 0, 0x78, 0x50, 0,
                0, 0);

    stage->state = 1;
    m4aSongNumStart(MUS_SPECIAL_STAGE_INTRO);

    gCurTask->main = Task_IntroScreenMain;
}

void Task_FadeInSpecialStage(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);

    if (NextTransitionFrame(&stage->transition) != 0) {
        stage->animFrame = 0;
        stage->state = 4;
        m4aSongNumStart(MUS_SPECIAL_STAGE);
        gCurTask->main = Task_SpecialStageStartDelay;
    }
}

void sub_806CA18(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);

    gBldRegs.bldY = 0;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldAlpha = 0;

    stage->animFrame++;

    if (stage->animFrame > 179) {
        gCurTask->main = sub_806C158;
    }
}

void sub_806CA54(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    stage->animFrame++;

    if (stage->animFrame > 59) {
        stage->animFrame = 0;
        gCurTask->main = sub_806C25C;
    }
}
