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
#include "game/stage/stage.h"
#include "game/save.h"
#include "sprite.h"
#include "game/stage/screen_fade.h"
#include "lib/m4a/m4a.h"
#include "task.h"
#include "game/title_screen.h"
#include "constants/zones.h"

#include "constants/songs.h"
#include "constants/tilemaps.h"

#define MAX_POINTS 99900

// TODO(Jace): Should this be in global.h?
//             To me it seems like a very localized case, but maybe we could use it in other places?
#ifndef BUG_FIX
#define BUG_FIX_RETURN(_value) return;
#else
#define BUG_FIX_RETURN(_value) return (_value);
#endif

static void Task_ShowIntroScreen(void);
static void SpecialStageOnDestroy(struct Task *);
static void Task_InitComponents(void);
#ifndef BUG_FIX
static void SpecialStagePauseMenuMain(void);
#else
static bool32 SpecialStagePauseMenuMain(void);
#endif
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

    s16 zone, character, temp, i, viewDistance;

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

    t = TaskCreate(Task_ShowIntroScreen, sizeof(struct SpecialStage), 0x2000, 0, SpecialStageOnDestroy);
    stage = TASK_DATA(t);
    stage->q16CameraX = Q_16_16(256);
    stage->q16CameraY = Q_16_16(256);
    stage->unk59C = 0;

    stage->cameraRotX = 512;

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
    stage->ringsTargetTens = Div(stage->ringsTarget, 10) - (stage->ringsTargetHundreds * 10);
    stage->ringsTargetUnits = Mod(stage->ringsTarget, 10);

    stage->targetReached = FALSE;
    stage->pauseMenuCursor = 0;
    stage->unk5C7 = 0;
    stage->unk5C8 = 0;

    stage->cameraOriginX = DISPLAY_WIDTH / 2;
    stage->cameraHeight = 140;
    stage->worldScale = 64; // scale

    stage->cameraPitch = 40; // lower = towards the ground, higher = towards the horizon

    stage->horizonHeight = 60; // horizon (pixels)

    // This value is 49 on the GBA
    // - (horizonHeight / 2) - 1 is just a guess
    viewDistance = (DISPLAY_HEIGHT / 2) - (60 / 2) - 1;
    stage->viewDistance = viewDistance;

    // Round up to the nearest power of 2
    for (i = 1; i < stage->viewDistance; i *= 2)
        ;

    stage->viewDistance = i;
    stage->unk5D3 = (((DISPLAY_HEIGHT - 1) - stage->horizonHeight) >> 1) + stage->horizonHeight;
}

static void SetupIntroScreenRegisters(void)
{
    gDispCnt = (DISPCNT_OBJ_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_1);
    gBgCntRegs[1] = (BGCNT_TXT256x256 | BGCNT_16COLOR | BGCNT_PRIORITY(3) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(7));
    gBgCntRegs[2] = (BGCNT_TXT512x512 | BGCNT_256COLOR | BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(16));
    gBldRegs.bldCnt = BLDCNT_EFFECT_LIGHTEN | (BLDCNT_TGT1_ALL & ~BLDCNT_TGT1_OBJ);
    gBldRegs.bldY = 0x10;

    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;

    INIT_BG_SPRITES_LAYER_32(1);
    INIT_BG_SPRITES_LAYER_128(2);
}

void Task_IntroScreenMain(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);

    ScreenFade *fade = &stage->fade;
    DisplaySprite(&stage->introText);
    gBldRegs.bldCnt = 0xAF;

    stage->animFrame++;

    if (stage->animFrame > 139) {
        gBldRegs.bldCnt = 0xBF;
        gBldRegs.bldY = 0x10;

        fade->window = 0;
        fade->flags = 2;
        fade->brightness = Q_8_8(0);
        fade->speed = Q(1.0);
        fade->bldAlpha = 0;
        fade->bldCnt = 0xBF;
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
#ifndef BUG_FIX
    SpecialStagePauseMenuMain();
#else
    // BUG: Without this, we would access free'd task memory.
    bool32 taskDestroyed = SpecialStagePauseMenuMain();
    if (taskDestroyed)
        return;
#endif

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
        do {
#endif
            if (player->state != 14 && player->state != 15) {
                player->state = 11;
            }
#ifndef NON_MATCHING
        } while (0);
#endif
        stage->state = 7;
    }

    if (stage->state == 6 || stage->state == 7) {
        if (player->state != 11 && player->state != 12 && player->state != 13) {
            player->state = 11;
        }
    }

    switch (player->state) {
        case 13: {
            stage->state = 8;
            gCurTask->main = sub_806BFD0;
        }
            return;

        case 15: {
            stage->state = 8;
            gCurTask->main = sub_806BFD0;
        }
            return;

        case 14: {
        } break;

        default: {
#ifndef BUG_FIX
            SpecialStagePauseMenuMain();
#else
            bool32 taskDestroyed = SpecialStagePauseMenuMain();
            if (taskDestroyed)
                return;
#endif
        } break;
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
            if (stage->timeHundreds == 0 && stage->timeTens == 3 && stage->timeUnits == 0 && stage->timeTicks == 0) {
                m4aSongNumStart(MUS_SPECIAL_STAGE_PINCH);
            }
        }
    }
}

void sub_806BFD0(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    ScreenFade *fade = &stage->fade;
    struct SpecialStageGuardRobo *guardRobo = TASK_DATA(stage->guardRoboTask);
    struct SpecialStagePlayer *player = TASK_DATA(stage->playerTask);

    guardRobo->state = 0;

    fade->window = 1;
    fade->flags = 1;
    fade->brightness = Q_8_8(0);
    fade->speed = 0x40;
    fade->bldAlpha = 0;
    fade->bldCnt = 0xBF;
    UpdateScreenFade(fade);

    gDispCnt = 0x9641;
    gWinRegs[WINREG_WINOUT] = 0x103F;

    if (player->state == 13) {
        m4aSongNumStart(MUS_SPECIAL_STAGE_CLEAR);
    }
    gCurTask->main = Task_FadeToResultScreen;
}

void Task_FadeToResultScreen(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    ScreenFade *fade = &stage->fade;
    struct SpecialStagePlayer *player = TASK_DATA(stage->playerTask);

    if (UpdateScreenFade(fade) == 0) {
        gDispCnt = 0x9641;
        gWinRegs[WINREG_WINOUT] = 0x103F;
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

    SpecialStageDrawBackground(&stage->unk48, 0, 7, TM_TILEMAP_139, 0x20, 0x20, 0, 1, 0, 0);
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
            stage->unk5C8 = -106;
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
    ScreenFade *fade = &stage->fade;
    stage->animFrame++;

    if (stage->unk5C7 == 1) {
        if (--stage->unk5C8 == 0) {
            m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT);
            stage->unk5C7 = 0;
        }
    }

    if (gPressedKeys & A_BUTTON || stage->animFrame > 60) {
        fade->window = 0;
        fade->flags = 1;
        fade->brightness = Q_8_8(0);
        fade->speed = 64;
        fade->bldAlpha = 0;
        fade->bldCnt = 0xBF;

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

    if ((gLoadedSaveGame->chaosEmeralds[character] & ALL_ZONE_CHAOS_EMERALDS) == ALL_ZONE_CHAOS_EMERALDS) {
        gLoadedSaveGame->chaosEmeralds[character] = ALL_ZONE_CHAOS_EMERALDS | CHAOS_EMERALDS_COMPLETED;
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
    if (UpdateScreenFade(&stage->fade) == 0) {
        return;
    }

    stage->animFrame++;
    if (stage->animFrame > 119) {
        s32 temp = stage->finalScore;

        if (stage->playerTask != NULL) {
            TaskDestroy(stage->playerTask);
            stage->playerTask = NULL;
        }

        if (stage->uiTask != NULL) {
            TaskDestroy(stage->uiTask);
            stage->uiTask = NULL;
        }

        INCREMENT_SCORE_A(temp);

        gLoadedSaveGame->score += stage->rings;

        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
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

#ifndef BUG_FIX
void SpecialStagePauseMenuMain(void)
#else
bool32 SpecialStagePauseMenuMain(void)
#endif
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

            BUG_FIX_RETURN(FALSE);
        } else if (gPressedKeys & A_BUTTON) {
            if (stage->pauseMenuCursor == 0) {
                stage->paused = FALSE;
                // Don't jump when exiting menu
                gPressedKeys &= ~A_BUTTON;

                BUG_FIX_RETURN(FALSE);
            }
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gBgSpritesCount = 0;
            PAUSE_GRAPHICS_QUEUE();
            CreateTitleScreenAndSkipIntro();

            // Signal to calling functions that the task was destroyed.
            BUG_FIX_RETURN(TRUE);
        }
    }

    if (gPressedKeys & START_BUTTON) {
        stage->paused = !stage->paused ? TRUE : FALSE;
        stage->pauseMenuCursor = 0;
    }

    BUG_FIX_RETURN(FALSE);
}

static void SpecialStageOnDestroy(UNUSED struct Task *t)
{
    gBgOffsetsPrimary = &gBgOffsetsBuffer[0];
    gBgOffsetsSecondary = &gBgOffsetsBuffer[1];
}

static void Task_ShowIntroScreen(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);
    SetupIntroScreenRegisters();
    sub_806CA88(&stage->introText, RENDER_TARGET_SCREEN, 0x28, 0x37C, 0, (DISPLAY_WIDTH / 2), (DISPLAY_HEIGHT / 2), 0, 0, 0);

    stage->state = 1;
    m4aSongNumStart(MUS_SPECIAL_STAGE_INTRO);

    gCurTask->main = Task_IntroScreenMain;
}

void Task_FadeInSpecialStage(void)
{
    struct SpecialStage *stage = TASK_DATA(gCurTask);

    if (UpdateScreenFade(&stage->fade) != 0) {
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
