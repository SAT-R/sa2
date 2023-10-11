#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/course_select.h"
#include "game/cutscenes/endings.h"
#include "game/cutscenes/level_endings.h"
#include "game/save.h"
#include "game/screen_transition.h"
#include "game/special_stage/main.h"
#include "game/stage/ui.h"

#include "constants/songs.h"
#include "constants/zones.h"

// TODO(Jace): Maybe call this module "Points Summary" instead?

typedef struct {
    /*  0x00 */ struct TransitionState transition;
    /*  0x0C */ Sprite s1[3];
    /*  0x9C */ Sprite sprTimeScore;
    /*  0xCC */ Sprite sprRingScore;
    /*  0xFC */ Sprite sprSpRingScore;
    /* 0x12C */ Sprite s7;
    /* 0x15C */ s32 timeBonusScore; // Time Bonus?
    /* 0x160 */ s32 ringBonusScore; // Ring Bonus?
    /* 0x164 */ s32 spRingBonusScore; // SP-Ring Bonus?
    /* 0x168 */ s32 counter; // framesSince the task started
    /* 0x16C */ s32 unk16C;
    /* 0x170 */ u8 unk170;
} StageOutro; /* size: 0x174 */

#define OUTRO_TIME_BONUS_Y_POS    90
#define OUTRO_RING_BONUS_Y_POS    110
#define OUTRO_SP_RING_BONUS_Y_POS 130

const u16 gUnknown_080D71CC[3] = { 0, 69, 173 };

void sub_80310F0(void);
static void sub_8031138(u16 p0);
void sub_8031314(void);
static void sub_80313D0(void);

#if 0
u16 sub_80304DC(u32 courseTime, u16 ringCount, u8 spRingCount)
{
    struct Task *t;
    StageOutro *outro;

    gLoadedSaveGame->score += gRingCount;

    t = TaskCreate(Task_UpdateGotThroughScreen, sizeof(StageOutro), 0xC100, 0, TaskDestructor_UpdateGotThroughScreen);
    outro = TaskGetStructPtr(t);
    outro->counter = 0;
    outro->unk170 = 0;

    return (u16)outro->unk16C;
}
#endif

// (98.99%) https://decomp.me/scratch/19nrW
// NOTE: Only non-matching thing is TasksDestroyAll() not
//       getting initialized like in the original.
NONMATCH("asm/non_matching/game/stage/outro/Task_UpdateGotThroughScreen.inc",
         void Task_UpdateGotThroughScreen(void))
{
    StageOutro *outro = TaskGetStructPtr(gCurTask);
    u32 counter = outro->counter;

    if (++counter > outro->unk16C + 309) {
        counter = outro->unk16C + 310;
    }
    outro->counter = counter;

    if (IS_EXTRA_STAGE(gCurrentLevel)) {
        gBldRegs.bldCnt
            = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_BD | BLDCNT_TGT1_BG0
               | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3);
    }

    if (counter >= 150) {
        if (outro->ringBonusScore != 0) {
            outro->ringBonusScore -= 100;
            INCREMENT_SCORE_A(100);
        }
        // _08030AEE

        if (outro->spRingBonusScore != 0) {
            outro->spRingBonusScore -= 100;
            INCREMENT_SCORE_A(100);
        }

        if (outro->timeBonusScore != 0) {
            outro->timeBonusScore -= 100;
            INCREMENT_SCORE_A(100);
        }

        // If user pressed A, quickly finish score counting
        if (!IS_FINAL_OR_EXTRA_STAGE(gCurrentLevel)) {
            if (gPressedKeys & A_BUTTON) {
                INCREMENT_SCORE_A(outro->ringBonusScore);
                INCREMENT_SCORE_A(outro->spRingBonusScore);
                INCREMENT_SCORE_A(outro->timeBonusScore);

                outro->ringBonusScore = 0;
                outro->spRingBonusScore = 0;
                outro->timeBonusScore = 0;

                if (counter < outro->unk16C + 149) {
                    counter = outro->unk16C + 149;
                    outro->counter = counter;
                }
            }
        }
        // _08030CB8

        if ((gStageTime % 4u) == 0) {
            if ((outro->ringBonusScore != 0) || (outro->spRingBonusScore != 0)
                || (outro->timeBonusScore != 0)) {
                m4aSongNumStart(SE_STAGE_RESULT_COUNTER);
            } else if (outro->unk170 == 0) {
                outro->unk170 = 1;
                m4aSongNumStart(SE_STAGE_RESULT_COUNTER_DONE);
            }
        }
    }
    // _08030D3E

    if (counter > outro->unk16C + 309) {
        if (IS_FINAL_STAGE(gCurrentLevel)) {
            // _08030D50+0xC
            if (((u16)gMPlayInfo_BGM.status) == 0) {
                // _08030D68
                gLoadedSaveGame->unlockedLevels[gSelectedCharacter]
                    = LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53);
                WriteSaveGame();

                TasksDestroyAll();

                { // TODO: This is a macro!
                    gUnknown_03002AE4 = gUnknown_0300287C;
                    gUnknown_03005390 = 0;
                    gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
                }

                StartEndingCutscenes();
                return;
            }
        } else if (IS_EXTRA_STAGE(gCurrentLevel)) {
            // _08030DD0
            if (((u16)gMPlayInfo_BGM.status) == 0) {
                gCurrentLevel++;
                gLoadedSaveGame->unlockedLevels[gSelectedCharacter] = gCurrentLevel;

                TasksDestroyAll();

                { // TODO: This is a macro!
                    gUnknown_03002AE4 = gUnknown_0300287C;
                    gUnknown_03005390 = 0;
                    gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
                }

                StartEndingCutscenes();

                WriteSaveGame();
                return;
            }
        } else {
            // _08030E40
            if (NextTransitionFrame(&outro->transition) == 1) {
                gBldRegs.bldY = 0x10;
                gPlayer.moveState |= MOVESTATE_100000;

                if (ACT_INDEX(gCurrentLevel) == ACT_BOSS) {
                    TasksDestroyAll();

                    { // TODO: This is a macro!
                        gUnknown_03002AE4 = gUnknown_0300287C;
                        gUnknown_03005390 = 0;
                        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
                    }

                    gCurrentLevel++;

                    if (gCurrentLevel
                        > gLoadedSaveGame->unlockedLevels[gSelectedCharacter]) {
                        gLoadedSaveGame->unlockedLevels[gSelectedCharacter]
                            = gCurrentLevel;

                        if (gSelectedCharacter == CHARACTER_SONIC) {
                            switch (LEVEL_TO_ZONE(gCurrentLevel - 1)) {
                                case ZONE_1: {
                                    gLoadedSaveGame->unlockedCharacters
                                        |= CHARACTER_BIT(CHARACTER_CREAM);
                                    CreateCharacterUnlockCutScene(0);
                                } break;

                                case ZONE_3: {
                                    gLoadedSaveGame->unlockedCharacters
                                        |= CHARACTER_BIT(CHARACTER_TAILS);
                                    CreateCharacterUnlockCutScene(2);
                                } break;

                                case ZONE_5: {
                                    gLoadedSaveGame->unlockedCharacters
                                        |= CHARACTER_BIT(CHARACTER_KNUCKLES);
                                    CreateCharacterUnlockCutScene(1);
                                } break;

                                default: {
                                    CreateCourseSelectionScreen(
                                        gCurrentLevel,
                                        gLoadedSaveGame
                                            ->unlockedLevels[gSelectedCharacter],
                                        1);
                                }
                            }
                        } else {
                            // _08030F54
                            CreateCourseSelectionScreen(
                                gCurrentLevel,
                                gLoadedSaveGame->unlockedLevels[gSelectedCharacter], 1);
                        }
                    } else {
                        // _08030F6A
                        CreateCourseSelectionScreen(
                            gCurrentLevel,
                            gLoadedSaveGame->unlockedLevels[gSelectedCharacter], 4);
                    }
                    WriteSaveGame();
                    return;
                } else {
                    // _08030F74
                    gCurrentLevel++;
                    if (gCurrentLevel
                        > gLoadedSaveGame->unlockedLevels[gSelectedCharacter]) {
                        gLoadedSaveGame->unlockedLevels[gSelectedCharacter]
                            = gCurrentLevel;
                    }
                    // _08030F94

                    if ((gPlayer.moveState & MOVESTATE_800000)
                        && (gSpecialRingCount >= 7)) {
                        TasksDestroyAll();

                        { // TODO: This is a macro!
                            gUnknown_03002AE4 = gUnknown_0300287C;
                            gUnknown_03005390 = 0;
                            gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
                        }

                        CreateSpecialStage(-1, -1);

                        gDispCnt |= DISPCNT_WIN0_ON;
                        gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
                        gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
                        gWinRegs[WINREG_WININ] |= WININ_WIN0_ALL;
                        gWinRegs[WINREG_WINOUT]
                            |= (WINOUT_WIN01_ALL & ~WINOUT_WIN01_CLR);

                        gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL
                                           | BLDCNT_TGT2_ALL);
                        gBldRegs.bldY = 0x10;

                        WriteSaveGame();
                        return;
                    }

                    // _08031030
                    TasksDestroyAll();

                    { // TODO: This is a macro!
                        gUnknown_03002AE4 = gUnknown_0300287C;
                        gUnknown_03005390 = 0;
                        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
                    }

                    GameStageStart();

                    WriteSaveGame();
                    return;
                }
            }
        }
        // _0803106C

        if ((gPlayer.moveState & MOVESTATE_8000000) && gSpecialRingCount >= 7) {
            sub_80313D0();
            gPlayer.moveState |= MOVESTATE_4000000;
            return;
        }
    }

    sub_80310F0();
    sub_8031314();

    if (IS_FINAL_OR_EXTRA_STAGE(gCurrentLevel)) {
        if (counter > outro->unk16C + 245) {
            u32 innerCount = counter;
            innerCount -= 245;
            sub_8031138((innerCount - outro->unk16C) * 16);
        } else {
            sub_8031138(0);
        }
    } else {
        sub_8031138(0);
    }
}
END_NONMATCH

void sub_80310F0(void)
{
    StageOutro *outro = TaskGetStructPtr(gCurTask);
    u32 counter = outro->counter;
    Sprite *s = &outro->s7;

    if (counter <= 15) {
        s->x = (16 - counter) * 15;
        s->y = 100;
    } else if (counter <= 23) {
        s->y = 100;
    } else if (counter <= 28) {
        s->y -= 7;
    }
}

// (90.87%) https://decomp.me/scratch/ju0GI
NONMATCH("asm/non_matching/game/stage/outro/sub_8031138.inc", void sub_8031138(u16 p0))
{
    StageOutro *outro = TaskGetStructPtr(gCurTask);
    u32 counter = outro->counter;
    u32 i;
    Sprite *s;
    s32 bonusVal;
    s16 xPos;
    s16 r4;

    if (counter < 24) {
        s32 x;
        s = &outro->s7;
        x = 0;

        if (counter <= 16) {
            x = (16 - counter) * 24;
        }

        x = x - p0;

        for (i = 0; i < 8; i++) {
            s->x = x + i * 32;
            DisplaySprite(s);
        }
    } else {
        // _08031198
        s = &outro->s7;

        for (i = 0; i < 8; i++) {
            s->x = -p0 + i * 32;
            DisplaySprite(s);
        }
    }
    // _080311B2

    if (counter > 28) {
        u32 numDisplayedBonuses = (ACT_INDEX(gCurrentLevel) == ACT_BOSS) ? 2 : 3;

        for (i = 0; i < numDisplayedBonuses; i++) {
            s = &outro->s1[i];
            s->x -= p0;
            DisplaySprite(s);
        }
    }
    // _080311F4

    if (counter >= 39) {

        s = &outro->sprTimeScore;

        if (counter < 56) {
            s32 innerX = DISPLAY_WIDTH - ((counter - 39) * 12);
            r4 = innerX;
        } else {
            r4 = 48;
        }
        s->x = r4 - p0;
        DisplaySprite(s);

        bonusVal = outro->timeBonusScore;
        xPos = p0;
        xPos -= 144;
        StageUI_PrintIntegerAt(bonusVal, (r4 - xPos), OUTRO_TIME_BONUS_Y_POS, 0);
    }
    // _0803124C

    if (counter >= 49) {
        s = &outro->sprRingScore;

        if (counter <= 65) {
            r4 = DISPLAY_WIDTH - ((counter - 49) * 12);
        } else {
            r4 = 48;
        }
        s->x = r4 - p0;
        DisplaySprite(s);

        bonusVal = outro->ringBonusScore;
        xPos = p0;
        xPos -= 144;
        StageUI_PrintIntegerAt(bonusVal, (r4 - xPos), OUTRO_RING_BONUS_Y_POS, 0);
    }
    // _0803129C

    if ((ACT_INDEX(gCurrentLevel) != ACT_BOSS)
        && (gCurrentLevel < LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE))
        && (counter >= 59)) {
        s = &outro->sprSpRingScore;

        if (counter <= 75) {
            s32 innerX = DISPLAY_WIDTH - ((counter - 59) * 12);
            r4 = innerX;
        } else {
            r4 = 48;
        }

        s->x = r4 - p0;
        DisplaySprite(s);

        bonusVal = outro->spRingBonusScore;
        xPos = p0;
        xPos -= 144;
        StageUI_PrintIntegerAt(bonusVal, (r4 - xPos), OUTRO_SP_RING_BONUS_Y_POS, 0);
    }
}
END_NONMATCH

void sub_8031314(void)
{
    StageOutro *outro = TaskGetStructPtr(gCurTask);
    u32 counter = outro->counter;

    if (counter > 28) {
        u32 r0;

        if (counter < 45) {
            r0 = (u16)(240 - ((counter - 29) * 15));
        } else {
            r0 = 3;
        }

        {
            s32 i = 0;
            s32 r4 = (s16)r0;
            for (; i < ARRAY_COUNT(gUnknown_080D71CC); i++) {
                Sprite *s = &outro->s1[i];
                s32 match = gUnknown_080D71CC[i];
                s->x = r4 + match;
            }
        }
    }
}

void TaskDestructor_UpdateGotThroughScreen(struct Task *t)
{
    StageOutro *outro = TaskGetStructPtr(t);
    if (outro->s7.graphics.dest != NULL) {
        VramFree(outro->s7.graphics.dest);
        VramFree(outro->s1[0].graphics.dest);
        VramFree(outro->s1[1].graphics.dest);
        VramFree(outro->s1[2].graphics.dest);
        VramFree(outro->sprTimeScore.graphics.dest);
        VramFree(outro->sprRingScore.graphics.dest);
        VramFree(outro->sprSpRingScore.graphics.dest);
    }
}

void sub_80313D0(void)
{
    StageOutro *outro = TaskGetStructPtr(gCurTask);
    if (outro->s7.graphics.dest != NULL) {
        VramFree(outro->s7.graphics.dest);
        VramFree(outro->s1[0].graphics.dest);
        VramFree(outro->s1[1].graphics.dest);
        VramFree(outro->s1[2].graphics.dest);
        VramFree(outro->sprTimeScore.graphics.dest);
        VramFree(outro->sprRingScore.graphics.dest);
        VramFree(outro->sprSpRingScore.graphics.dest);

        outro->s7.graphics.dest = NULL;
    }
}
