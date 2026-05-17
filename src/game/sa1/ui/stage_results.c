#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/sa1/ui/collect_chaos_emeralds_msg.h"
#include "data/sa1/credits.h"
#include "game/sa1/save.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/stage.h"
#include "game/sa1/stage/stage_ui.h"
#include "data/sa1/ui_graphics.h"

#include "constants/sa1/ui_graphics.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ void *vram0;
    /* 0x04 */ void *vram4;
} VramPtrs;

typedef struct {
    /* 0x00 */ GameOverB unk0;
    /* 0x18 */ s32 unk18;
    /* 0x1C */ u16 unk1C;
    /* 0x1E */ u16 unk1E;
    /* 0x20 */ u8 unk20[0x10];
    /* 0x30 */ s32 unk30;
} StrcStgResults_34; /* 0x34 */

typedef struct {
    /* 0x00 */ u16 unk0;
    /* 0x02 */ u16 unk2;
    /* 0x04 */ u16 unk4;
    /* 0x06 */ u16 unk6;
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u8 unkA;
    /* 0x0C */ Task *taskC; // -> StrcStgResults_34 *
    /* 0x10 */ Task *task10; // -> StrcStgResults_34 *
    /* 0x14 */ Task *task14; // -> StrcStgResults_34 *
    /* 0x18 */ Task *task18; // -> StrcStgResults_34 *
    /* 0x1C */ VramPtrs vram1C;
    /* 0x24 */ s16 unk24;
    /* 0x28 */ s32 unk28;
    /* 0x2C */ s32 unk2C;
    /* 0x30 */ s32 unk30;
    /* 0x34 */ u16 unk34;
    /* 0x36 */ u8 unk36;
} StrcStgResults_38; /* 0x38 */

extern void CreateTimeAttackResult(TimeRecord record);

extern ALIGNED(4) u8 gUnknown_08688404[11];
extern ALIGNED(4) u8 gUnknown_0868840F[11];
extern ALIGNED(4) u8 gUnknown_0868841C[12];
extern ALIGNED(4) u8 gUnknown_08688428[0x19];

void sub_8056FE4(VramPtrs *ptrs);

void Task_8057B74(void);
void Task_8057C3C(void);
void Task_8057D30(void);
void Task_805803C(void);

// StrcStgResults_38
void Task_8057888(void);
void TaskDestructor_8058344(Task *t);

void sub_8056FE4(VramPtrs *arg0)
{
    Strc_80528AC sp00;
    const void *var_r0;

    sp00.uiGfxID = UIGFX_STGRESULT_HEADLINE_BACK;
    sp00.unk2B = 8;
    sp00.tiles = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].tiles;
    sp00.palette = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].palette;
    sp00.tilesSize = (8 * 2) * TILE_SIZE_4BPP;
    sp00.paletteSize = 32;
    sp00.unk28 = 6;
    sp00.vramC = (void *)BG_VRAM + 0x11000; // TODO: Create VRAM_RESERVED_ #define!
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk8;
    sp00.unk0.unk8 = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unkC;
    sp00.unk0.unk9 = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk10;
    sp00.unk0.unkA = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk14;
    sp00.unk0.unkB = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = UIGFX_34;
    sp00.unk2B = 2;

    if (gCurrentLevel == LEVEL_INDEX(ZONE_7, ACT_THE_MOON)) {
        sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles + 0x1E00;
    } else if (gCurrentLevel == LEVEL_INDEX(ZONE_7, ACT_X_ZONE)) {
        sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles + 0x1400;
    } else if (gCurrentLevel & 0x1) {
        sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles + 0xA00;
    } else {
        sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    }

    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.paletteSize = 32;
    sp00.unk28 = 12;
    sp00.tilesSize = 0xA00;
    sp00.vramC = (void *)arg0->vram0 + 0x600; // TODO: Create VRAM_RESERVED_ #define!
    sp00.unk2A = 0xD;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = (gUiGraphics[sp00.uiGfxID].unkC);
    sp00.unk0.unk9 = (gUiGraphics[sp00.uiGfxID].unk10);
    sp00.unk0.unkA = (gUiGraphics[sp00.uiGfxID].unk14);
    sp00.unk0.unkB = (gUiGraphics[sp00.uiGfxID].unk18);
    sub_80528AC(&sp00);

    sp00.uiGfxID = gSelectedCharacter + UIGFX_STGRESULT_SONIC;
    sp00.unk2B = 2;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.tilesSize = (8 * 6) * TILE_SIZE_4BPP;
    sp00.paletteSize = 12;
    sp00.unk28 = 12;
    sp00.vramC = (void *)arg0->vram0; // TODO: Create VRAM_RESERVED_ #define!
    sp00.unk2A = 0xD;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = (gUiGraphics[sp00.uiGfxID].unkC);
    sp00.unk0.unk9 = (gUiGraphics[sp00.uiGfxID].unk10);
    sp00.unk0.unkA = (gUiGraphics[sp00.uiGfxID].unk14);
    sp00.unk0.unkB = (gUiGraphics[sp00.uiGfxID].unk18);
    sub_80528AC(&sp00);

    sp00.uiGfxID = UIGFX_ASCII_CHARS;
    sp00.unk2B = 4;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles + 0x9C0;
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.tilesSize = 2 * TILE_SIZE_4BPP;
    sp00.paletteSize = 32;
    sp00.unk28 = 0x6;
    sp00.vramC = (void *)arg0->vram4 + 0x240; // TODO: Create VRAM_RESERVED_ #define!
    sp00.unk2A = 0xD;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = (gUiGraphics[sp00.uiGfxID].unkC);
    sp00.unk0.unk9 = (gUiGraphics[sp00.uiGfxID].unk10);
    sp00.unk0.unkA = (gUiGraphics[sp00.uiGfxID].unk14);
    sp00.unk0.unkB = (gUiGraphics[sp00.uiGfxID].unk18);
    sub_80528AC(&sp00);

    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles + 0xB40;
    sp00.vramC = arg0->vram4 + 0x100;
    sp00.tilesSize = 6 * TILE_SIZE_4BPP;
    sub_80528AC(&sp00);

    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles + 0x880;
    sp00.vramC = arg0->vram4 + 0x1C0;
    sp00.tilesSize = 2 * TILE_SIZE_4BPP;
    sub_80528AC(&sp00);

    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles + 0x940;
    sp00.vramC = arg0->vram4 + 0x200;
    sub_80528AC(&sp00);

    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles + 0xA40;
    sp00.vramC = arg0->vram4 + 0x280;
    sub_80528AC(&sp00);

    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles + 0x1240;
    sp00.vramC = arg0->vram4 + 0x2C0;
    sub_80528AC(&sp00);

    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles + 0xC80;
    sp00.vramC = arg0->vram4 + 0;
    sp00.tilesSize = 8 * TILE_SIZE_4BPP;
    sub_80528AC(&sp00);
}

// (93.06%) https://decomp.me/scratch/mM5tB
NONMATCH("asm/non_matching/game/sa1/stage/stage_results__CreateStageResults.inc", u32 CreateStageResults(u32 ringCount, u32 courseTime))
{
    s16 temp_r2_5;
    s16 var_r5_6;
    s32 temp_r0_11;
    s16 temp_r0_5;
    s16 temp_r2_3;
    StrcStgResults_38 *temp_r4;
    StrcStgResults_34 *temp_r7;
    StrcStgResults_34 *temp_r7_2;
    s32 var_r0;
    Task *temp_r5;
    Task *taskLast;
    Task *t1;
    Task *t2;
    Task *t0;
    s32 sp10;
    u32 sp14;
    u32 sp18;
    s32 sp1C;
    u16 temp_r1_2;
    u16 temp_r2;
    u32 timeScore;
    u32 ringScore;
    s16 ringCount2 = ringCount;
    bool32 isInFinalStage;

    ringScore = 100 * ringCount;
    LOADED_SAVE->score += ringCount2;
    gStageFlags |= 0x20;
    if (gCurrentLevel == 0xA) {
        gCamera.SA2_LABEL(unk50) |= 0x2000;
    }
    if (gGameMode == 1) {
        CreateTimeAttackResult(courseTime);
        return 0U;
    }

    isInFinalStage = 0;
    if ((gSelectedCharacter == CHARACTER_SONIC) && (gCurrentLevel >= LEVEL_INDEX(ZONE_7, ACT_X_ZONE))
        && (LOADED_SAVE->chaosEmeralds == ALL_ZONE_CHAOS_EMERALDS) && (LOADED_SAVE->unlockedLevels[0] > 12)
        && (LOADED_SAVE->unlockedLevels[1] > 12) && (LOADED_SAVE->unlockedLevels[2] > 12) && (LOADED_SAVE->unlockedLevels[3] > 12)
        && ((LOADED_SAVE->unlockedLevels[0] != 0xF) || (gMultiplayerCurrentLevel != LEVEL_INDEX(ZONE_7, ACT_X_ZONE)))) {
        isInFinalStage = 1;
    }

    sp1C = isInFinalStage;
    if (isInFinalStage == 0) {
        temp_r2 = LOADED_SAVE->unlockedLevels[gPlayer.character];
        var_r0 = gCurrentLevel + 1;

        if (var_r0 < temp_r2) {
            var_r0 = temp_r2;
        }
        LOADED_SAVE->unlockedLevels[gPlayer.character] = var_r0;
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1)) {
        const s32 countDown = TIME(3, 0);
        if (gCheckpointTime <= +countDown) {
            courseTime = 1;
        } else {
            courseTime = gCheckpointTime - countDown;
        }
    }
    if (gCurrentLevel == LEVEL_INDEX(ZONE_7, ACT_THE_MOON)) {
        m4aSongNumStart(MUS_EXTRA_CLEAR);
    } else if (gCurrentLevel == LEVEL_INDEX(ZONE_7, ACT_X_ZONE)) {
        m4aSongNumStart(MUS_FINAL_CLEAR);
    } else if (gCurrentLevel & 0x1) {
        m4aSongNumStart(MUS_BOSS_CLEAR);
    } else {
        m4aSongNumStart(MUS_ACT_CLEAR);
    }

    gMusicManagerState.unk0 = 0xFF;

    if (courseTime >= TIME(6, 0)) {
        timeScore = 0;
    } else if (courseTime >= TIME(5, 0)) {
        timeScore = 500;
    } else if (courseTime >= TIME(4, 0)) {
        timeScore = 1000;
    } else if (courseTime >= TIME(3, 0)) {
        timeScore = 2000;
    } else if (courseTime >= TIME(2, 0)) {
        timeScore = 3000;
    } else if (courseTime >= TIME(1, 30)) {
        timeScore = 4000;
    } else if (courseTime >= TIME(1, 0)) {
        timeScore = 5000;
    } else if (courseTime >= TIME(0, 50)) {
        timeScore = 10000;
    } else if (courseTime >= TIME(0, 30)) {
        timeScore = 50000;
    } else {
        timeScore = 80000;
    }

    if (ringScore > timeScore) {
        sp10 = Div(ringScore, 100) + 75;
    } else {
        sp10 = Div(timeScore, 100) + 75;
    }

    sp18 = ringScore;
    sp14 = timeScore;
    UiGfxStackInit();

    t0 = TaskCreate(Task_8057B74, sizeof(StrcStgResults_34), 0x2120U, 0U, 0);
    temp_r7 = TASK_DATA(t0);
    temp_r7->unk1C = 0;
    temp_r7->unk30 = sp10;
    temp_r7->unk1E = 0;
    temp_r7->unk0.qUnkA = 0xF0;
    temp_r7->unk0.unkC = 0x7E;
    temp_r7->unk0.unkE = 8;
    temp_r7->unk0.unk10 = 8;
    temp_r7->unk0.unk12 = 6;
    temp_r7->unk0.unk16 = 1;
    temp_r7->unk0.unk8 = 0xA;

    t1 = TaskCreate(Task_8057C3C, sizeof(StrcStgResults_34), 0x2120U, 0U, 0);
    temp_r7 = TASK_DATA(t1);
    temp_r7->unk1C = 0;
    temp_r7->unk30 = sp10;
    temp_r7->unk1E = 0;
    temp_r7->unk0.qUnkA = 0x100;
    temp_r7->unk0.unkC = 0x80;
    temp_r7->unk0.unkE = 9;
    temp_r7->unk0.unk10 = 2;
    temp_r7->unk0.unk12 = 0xC;
    temp_r7->unk0.unk16 = 1;
    temp_r7->unk0.unk8 = 0;

    t2 = TaskCreate(Task_8057D30, sizeof(StrcStgResults_34), 0x2120U, 0U, 0);
    temp_r7 = TASK_DATA(t2);
    temp_r7->unk18 = ringScore;
    temp_r7->unk1C = 0;
    temp_r7->unk30 = sp10;
    temp_r7->unk1E = 0;
    temp_r7->unk0.qUnkA = 0x100;
    temp_r7->unk0.unkC = 0x66;
    temp_r7->unk0.unkE = 0x10;
    temp_r7->unk0.unk10 = 4;
    temp_r7->unk0.unk12 = 6;
    temp_r7->unk0.unk16 = 1;
    temp_r7->unk0.unk8 = 0;

    for (temp_r2_3 = 15; temp_r2_3 >= 0; temp_r2_3--) {
        temp_r0_11 = Div(ringScore, 10);
        temp_r7->unk20[temp_r2_3] = ((ringScore - (temp_r0_11 * 10)) + 0x20);
        ringScore = temp_r0_11;
    };

    for (var_r5_6 = 11; var_r5_6 < 15; var_r5_6++) {
        if (temp_r7->unk20[var_r5_6] == 0x20) {
            temp_r7->unk20[var_r5_6] = 0x2BU;
        } else {
            break;
        }
    }

    for (var_r5_6 = 0; var_r5_6 < 11; var_r5_6++) {
        temp_r7->unk20[var_r5_6] = gUnknown_08688404[var_r5_6];
    }

    taskLast = TaskCreate(Task_805803C, sizeof(StrcStgResults_34), 0x2120U, 0, 0);
    temp_r7 = TASK_DATA(taskLast);
    temp_r7->unk18 = timeScore;
    temp_r7->unk1C = 0;
    temp_r7->unk30 = sp10;
    temp_r7->unk1E = 0;
    temp_r7->unk0.qUnkA = 0x100;
    temp_r7->unk0.unkC = 0x50;
    temp_r7->unk0.unkE = 0x10;
    temp_r7->unk0.unk10 = 4;
    temp_r7->unk0.unk12 = 6;
    temp_r7->unk0.unk16 = 1;
    temp_r7->unk0.unk8 = 0;

    for (var_r5_6 = 15; var_r5_6 >= 0; var_r5_6--) {
        temp_r0_11 = Div(timeScore, 10);
        temp_r7->unk20[var_r5_6] = ((timeScore - ((temp_r0_11 * 10))) + 0x20);
        timeScore = temp_r0_11;
    };

    for (var_r5_6 = 11; var_r5_6 < 15; var_r5_6++) {
        if (temp_r7->unk20[var_r5_6] == 0x20) {
            temp_r7->unk20[var_r5_6] = 0x2BU;
        } else {
            break;
        }
    }

    for (var_r5_6 = 0; var_r5_6 < 11; var_r5_6++) {
        temp_r7->unk20[var_r5_6] = gUnknown_0868840F[var_r5_6];
    }

    // StrcStgResults_38
    temp_r5 = TaskCreate(Task_8057888, sizeof(StrcStgResults_38), 0x2100U, 0U, TaskDestructor_8058344);
    temp_r4 = TASK_DATA(temp_r5);
    temp_r4->unk24 = 0;
    temp_r4->unk2C = sp18;
    temp_r4->unk30 = sp14;
    temp_r4->unk34 = 0x2D;
    temp_r4->unk28 = sp10;
    temp_r4->task14 = t0;
    temp_r4->task18 = taskLast;
    temp_r4->task10 = t1;
    temp_r4->taskC = t2;
    temp_r4->unk0 = 0;
    temp_r4->unk2 = 0;
    temp_r4->unk4 = 1;
    temp_r4->unk6 = 0;
    temp_r4->unk8 = 0x100;
    temp_r4->unkA = 1;
    temp_r4->unk36 = sp1C;

    // TODO: ALLOC_TILES() instead of VramMalloc!
    temp_r4->vram1C.vram0 = VramMalloc(0x80U);
    temp_r4->vram1C.vram4 = VramMalloc(0x1EU);
    sub_8056FE4(&temp_r4->vram1C);

    return (sp10 + 285);
}
END_NONMATCH

// TODO: Fix gotos.
// (100.00%) https://decomp.me/scratch/Srat8
void Task_8057888(void)
{
    u8 i;
    StrcStgResults_34 *taskC;
    StrcStgResults_34 *task10;
    StrcStgResults_34 *task14;
    StrcStgResults_34 *task18;
    u8 temp_r4;

    Player *p = &gPlayer;
    Camera *cam = &gCamera;
    StrcStgResults_38 *arg0;

    arg0 = TASK_DATA(gCurTask);

    task14 = TASK_DATA(arg0->task14);
    task18 = TASK_DATA(arg0->task18);
    task10 = TASK_DATA(arg0->task10);
    taskC = TASK_DATA(arg0->taskC);
    task14->unk1C = arg0->unk24;
    task18->unk1C = arg0->unk24;
    task10->unk1C = arg0->unk24;
    taskC->unk1C = arg0->unk24;

    if (arg0->unk24 < 135) {
        for (i = 0; i < 12; i++) {
            if (i != 0) {
                SA2_LABEL(sub_80047A0)(0U, 0x100, Div(i << 8, 12), i + 20);
            } else {
                SA2_LABEL(sub_80047A0)(0U, 0x100, 1, 20);
            }
        }
    }

    if (arg0->unk24 >= 0xB5) {
        if (arg0->unk2C == 0) {
            if (arg0->unk30 == 0) {
                goto blk_else;
            }
        } else {
            arg0->unk2C -= 100;
            INCREMENT_SCORE_A(100);
            taskC->unk18 = arg0->unk2C;
        }

        if (arg0->unk30 != 0) {
            arg0->unk30 -= 100;
            INCREMENT_SCORE_A(100);
            task18->unk18 = arg0->unk30;
        }

        if (arg0->unk2C == 0 && arg0->unk30 == 0) {
            if (!(gCurrentLevel & 0x1)) {
                p->moveState &= ~MOVESTATE_800000;
            }
            cam->SA2_LABEL(unk8) = 0;
            cam->SA2_LABEL(unkC) = 0;
            if (gSelectedCharacter == 0) {
                if ((arg0->unk36 == 0) && (gCurrentLevel >= LEVEL_INDEX(ZONE_7, ACT_X_ZONE))) {
                    arg0->unk34 = 0x87;
                } else {
                    arg0->unk34 = 0x2D;
                }

            } else if (IS_FINAL_STAGE(gCurrentLevel)) {
                arg0->unk34 = 0x87;
            } else {
                arg0->unk34 = 0x2D;
            }

            m4aSongNumStart(SE_STAGE_RESULT_COUNTER_DONE);
        } else if (Mod(gStageTime, 4) == 0) {
#ifndef NON_MATCHING
            // TODO: This sound hurts a lot with the current GB channel implementation
            m4aSongNumStart(SE_STAGE_RESULT_COUNTER);
#endif
        }
    }
    goto block_inc_return;

blk_else : {
    cam->SA2_LABEL(unk8) = 0;
    cam->SA2_LABEL(unkC) = 0;

    if (((u32)I(p->qWorldX) - cam->x) + 0x40 > (DISPLAY_WIDTH + 128)) {
        gPlayer.qSpeedAirX = 0;
        gPlayer.qSpeedGround = 0;

        if (gNumSingleplayerCharacters == 2) {
            if ((I(gPartner.qWorldX) - cam->x) > (DISPLAY_WIDTH + 64)) {
                gPartner.moveState |= MOVESTATE_IA_OVERRIDE;
                gPartner.moveState |= MOVESTATE_IGNORE_INPUT;
                gPartner.heldInput = 0;
                gPartner.frameInput = 0;
                gPartner.qSpeedAirX = 0;
                gPartner.qSpeedGround = 0;
            }
        }
    }

    if (arg0->unk28 + DISPLAY_WIDTH < (u32)arg0->unk24) {
        if (!IS_FINAL_OR_EXTRA_STAGE(gCurrentLevel)) {
            sub_805423C((StrcUi_805423C *)arg0);
        }

        if ((arg0->unk34 == 0) || (--arg0->unk34 == 0)) {
            arg0->unk34 = 0;
            temp_r4 = arg0->unk36;

            TaskDestroy(arg0->taskC);
            TaskDestroy(arg0->task10);
            TaskDestroy(arg0->task14);
            TaskDestroy(arg0->task18);
            TaskDestroy(gCurTask);

            if (gSelectedCharacter == 0) {
                if (temp_r4 == 0) {
                    if (gCurrentLevel < LEVEL_INDEX(ZONE_7, ACT_X_ZONE)) {
                        GoToNextLevel();
                        return;
                    }
                    if (!IS_EXTRA_STAGE(gCurrentLevel)) {
                        CreateCongratulationsAnimation();
                    }
                }
                return;
            } else {
                if (IS_FINAL_STAGE(gCurrentLevel)) {
                    CreateCongratulationsAnimation();
                    return;
                } else {
                    GoToNextLevel();
                    return;
                }
            }
        }
    }
}

block_inc_return:
    arg0->unk24++;
}

void Task_8057B74(void)
{
    s16 temp_r0;
    s16 temp_r1;
    StrcStgResults_34 *arg0 = TASK_DATA(gCurTask);

    temp_r1 = arg0->unk1C;
    if (temp_r1 > (u32)(arg0->unk30 + 0xE6)) {
        if ((gCurrentLevel & 0x1) || (gCurrentLevel > 0xB)) {
            if (arg0->unk0.qUnkA < -0x20) {
                arg0->unk0.qUnkA = arg0->unk0.qUnkA + 0x20;
                if (arg0->unk0.unkE != 0) {
                    arg0->unk0.unkE = arg0->unk0.unkE - 1;
                }
            }
            arg0->unk0.qUnkA = arg0->unk0.qUnkA - 0x1A;
        }
    } else if (temp_r1 >= 50) {
        arg0->unk0.unkE = 9;
        arg0->unk0.unkC = 42;
    } else if (temp_r1 >= 36) {
        arg0->unk0.unkC -= 6;
    } else if (temp_r1 >= 26) {
        arg0->unk0.qUnkA = -16;
    } else if (temp_r1 >= 16) {
        arg0->unk0.qUnkA -= 26;

        if (arg0->unk0.qUnkA < -16) {
            arg0->unk0.qUnkA = -16;
        }
    }
    if ((u32)(arg0->unk30 + DISPLAY_WIDTH) < arg0->unk1C) {
        sub_8052F78((const char *)&gUnknown_0868841C[0], &arg0->unk0);
    } else {
        sub_80530CC((const char *)&gUnknown_0868841C[0], &arg0->unk0);
    }
}

void Task_8057C3C(void)
{
    u8 arr[0x19];
    s16 temp_r1;
    s16 temp_r2;
    s16 var_r0;
    StrcStgResults_34 *arg0;

#ifndef NON_MATCHING
    asm("" ::"{r}"(gUnknown_08688428) : "r0");
    asm("mov r0, %0\n"
        "mov r2, %2\n"
        "bl memcpy" ::"r"(arr),
        "{r}"(gUnknown_08688428), "i"(sizeof(arr)));
#else
    memcpy(&arr, &gUnknown_08688428, sizeof(arr));
#endif
    arg0 = TASK_DATA(gCurTask);

    temp_r1 = arg0->unk1C;
    if ((u32)temp_r1 > (arg0->unk30 + 0xE6)) {
        arg0->unk0.qUnkA -= Q(28. / 256.);

        if (arg0->unk0.qUnkA < -0x1F) {
            if (arg0->unk0.unkE != 0) {
                arg0->unk0.unkE = arg0->unk0.unkE - 1;
            }
            var_r0 = arg0->unk0.qUnkA + 0x20;
            arg0->unk0.qUnkA = var_r0;
            arg0->unk1E = Mod(arg0->unk1E + 1, 8);
        }
        sub_80530CC((const char *)&arr[arg0->unk1E], &arg0->unk0);
    } else if (temp_r1 >= 50) {
        arg0->unk0.unkC = 0x2C;
        arg0->unk0.qUnkA -= Q(2. / 256.);

        if (arg0->unk0.qUnkA < -0x1F) {
            arg0->unk0.qUnkA += 0x20;
            arg0->unk1E = Mod(arg0->unk1E + 1, 8);
        }

        sub_80530CC((const char *)&arr[arg0->unk1E], &arg0->unk0);
    } else if (temp_r1 >= 36) {
        arg0->unk0.unkC -= 6;
        arg0->unk0.qUnkA -= Q(2. / 256.);

        if (arg0->unk0.qUnkA < -0x1F) {
            arg0->unk0.qUnkA += 0x20;
            arg0->unk1E = Mod(arg0->unk1E + 1, 8);
        }

        sub_80530CC((const char *)&arr[arg0->unk1E], &arg0->unk0);
    } else if (temp_r1 >= 26) {
        arg0->unk0.qUnkA -= Q(2. / 256.);
        arg0->unk0.unkE = 9;

        if (arg0->unk0.qUnkA < -0x1F) {
            arg0->unk0.qUnkA += 0x20;
            arg0->unk1E = Mod(arg0->unk1E + 1, 8);
        }

        sub_80530CC((const char *)&arr[arg0->unk1E], &arg0->unk0);
    } else if (temp_r1 >= 16) {
        arg0->unk0.qUnkA -= Q(28. / 256.);

        if (arg0->unk0.qUnkA < DISPLAY_WIDTH) {
            arg0->unk0.unkE = 9 - (arg0->unk0.qUnkA >> 5);
            if (arg0->unk0.qUnkA < -0x1F) {
                arg0->unk0.qUnkA += Q(32. / 256.);
                arg0->unk1E = Mod(arg0->unk1E + 1, 8);
            }
            sub_80530CC((const char *)&arr[arg0->unk1E], &arg0->unk0);
        }
    }
}

void Task_8057D30(void)
{
    s16 sp0;
    s16 temp_r4;
    s32 temp_r0_3;
    s32 temp_r3;
    s32 var_r7;
    s16 var_r7_2;
    s8 var_r6;
    u16 temp_r0;
    u8 *temp_r1;

    StrcStgResults_34 *arg0 = TASK_DATA(gCurTask);

    var_r7 = arg0->unk18;
    temp_r0 = arg0->unk1C;
    if (temp_r0 > 90) {
        sp0 = temp_r0 - 90;
    } else {
        sp0 = 0;
    }

    if (arg0->unk1C > 0x85U) {
        for (var_r6 = 15; var_r6 >= 0; var_r6--) {
            temp_r0_3 = Div(var_r7, 10);
            arg0->unk20[var_r6] = (u8)((var_r7 - ((temp_r0_3 * 8) + (temp_r0_3 << 1))) + 0x20);
            var_r7 = temp_r0_3;
        }

        for (var_r6 = 11; var_r6 < 15; var_r6++) {
            if (arg0->unk20[var_r6] == 0x20) {
                arg0->unk20[var_r6] = 0x2B;
                continue;
            }

            break;
        }

        for (var_r6 = 0; var_r6 < 11; var_r6++) {
            arg0->unk20[var_r6] = gUnknown_08688404[var_r6];
        }
    }

    if (arg0->unk1C > (u32)(arg0->unk30 + 0xE6)) {
        s32 v = (arg0->unk1C - 0xE6);
        var_r7_2 = (v - arg0->unk30) * 0x1C;
    } else {
        var_r7_2 = 0;
    }

    if (sp0 > 0x96) {
        arg0->unk0.unk10 = 4;
        arg0->unk0.unk12 = 6;
        arg0->unk0.unkE = 0xA;
        arg0->unk0.qUnkA = 50 - var_r7_2;
        arg0->unk0.unkC = 0x66;

        if (arg0->unk0.qUnkA >= -80) {
            sub_80530CC((const char *)arg0->unk20, &arg0->unk0);
        }

        arg0->unk0.unk10 = 0;
        arg0->unk0.unk12 = 6;
        arg0->unk0.unkE = 1;

        for (var_r6 = 11; var_r6 < 16; var_r6++) {
            if (arg0->unk20[var_r6] != 0x2B) {
                s32 v = var_r7_2 - 50;
                arg0->unk0.qUnkA = (var_r6 * 8) - v;
                if (arg0->unk0.qUnkA >= -8) {
                    sub_80530CC((const char *)&arg0->unk20[var_r6], &arg0->unk0);
                }
            }
        }
    } else if (sp0 > 0x2C) {
        arg0->unk0.unk10 = 4;
        arg0->unk0.unk12 = 6;
        arg0->unk0.unkE = 0xA;
        arg0->unk0.qUnkA = 0x32;
        arg0->unk0.unkC = 0x66;
        sub_80530CC((const char *)arg0->unk20, &arg0->unk0);

        for (var_r6 = 11; (var_r6 < 15); var_r6++) {
            if (arg0->unk20[var_r6] != 0x2B)
                break;
        }

        arg0->unk0.unk10 = 0;
        arg0->unk0.unk12 = 6;
        arg0->unk0.unkE = 16 - var_r6;
        arg0->unk0.qUnkA = (var_r6 * 8) - (var_r7_2 -= 50);
        sub_80530CC((const char *)&arg0->unk20[var_r6], &arg0->unk0);
    } else {
        s32 var_sb = (u8)Div(sp0, 2);
        if ((u32)var_sb > 16) {
            var_sb = 16;
        }

        if (var_sb != 0) {
            s8 var_sl = 0;
            var_r6 = 0;

            if (var_sl < var_sb) {
                do {
                    var_r7_2 = (sp0 - (var_r6 * 2));

                    if (var_r6 < 11) {
                        arg0->unk0.unk10 = 4;
                        arg0->unk0.unk12 = 6;
                    } else {
                        arg0->unk0.unk10 = 0;
                        arg0->unk0.unk12 = 6;
                    }

                    if (var_r7_2 > 0xC) {
                        s8 v = ((var_sl << 24) + 0x01000000) >> 24;
                        var_sl = v;
                    } else {
                        if ((var_r6 < 11) || (arg0->unk20[var_r6] != 0x2B)) {
                            arg0->unk0.unkE = 1;
                            arg0->unk0.unkC = Div(0x100 - (var_r7_2 * 0x15), 0x23) + 0x5E;
                            if (var_r7_2 == 0xC) {
                                *((u16 *)&arg0->unk0.unk6) = 0x1F;
                            } else {
                                *((u16 *)&arg0->unk0.unk6) = var_r7_2 + 0x14;
                            }

                            arg0->unk0.qUnkA = (var_r6 * 8) + 0x2E;
                            sub_8052E40(&arg0->unk20[var_r6], (void *)&arg0->unk0);
                        }
                    }
                } while (++var_r6 < (s32)var_sb);
            }

            if (var_sl > 11) {
                for (var_r6 = 11; (var_r6 < 15); var_r6++) {
                    if (arg0->unk20[var_r6] != 0x2B)
                        break;
                }

                arg0->unk0.unk10 = 0;
                arg0->unk0.unk12 = 6;
                arg0->unk0.unkE = var_sl - var_r6;
                arg0->unk0.unkC = 0x66;
                arg0->unk0.qUnkA = (var_r6 * 8) + 0x32;
                sub_80530CC((const char *)&arg0->unk20[var_r6], &arg0->unk0);
                var_sl = 11;
            }

            arg0->unk0.unk10 = 4;
            arg0->unk0.unk12 = 6;
            arg0->unk0.unkE = var_sl;
            arg0->unk0.unkC = 0x66;
            arg0->unk0.qUnkA = 0x32;
            sub_80530CC((const char *)arg0->unk20, &arg0->unk0);
        }
    }
}

void Task_805803C(void)
{
    s16 sp0;
    s32 temp_r0_3;
    s32 var_r7;
    s16 var_r7_2;
    s8 var_r6;
    u16 temp_r0;

    StrcStgResults_34 *arg0 = TASK_DATA(gCurTask);

    var_r7 = arg0->unk18;
    temp_r0 = arg0->unk1C;
    if (temp_r0 > 60) {
        sp0 = temp_r0 - 60;
    } else {
        sp0 = 0;
    }

    if (arg0->unk1C > 0x85U) {
        for (var_r6 = 15; var_r6 >= 0; var_r6--) {
            temp_r0_3 = Div(var_r7, 10);
            arg0->unk20[var_r6] = (u8)((var_r7 - ((temp_r0_3 * 8) + (temp_r0_3 << 1))) + 0x20);
            var_r7 = temp_r0_3;
        }

        for (var_r6 = 11; var_r6 < 15; var_r6++) {
            if (arg0->unk20[var_r6] == 0x20) {
                arg0->unk20[var_r6] = 0x2B;
                continue;
            }

            break;
        }

        for (var_r6 = 0; var_r6 < 11; var_r6++) {
            arg0->unk20[var_r6] = gUnknown_0868840F[var_r6];
        }
    }

    if (arg0->unk1C > (u32)(arg0->unk30 + 0xE6)) {
        s32 v = (arg0->unk1C - 0xE6);
        var_r7_2 = (v - arg0->unk30) * 0x1C;
    } else {
        var_r7_2 = 0;
    }

    if (sp0 > 0xB4) {
        arg0->unk0.unk10 = 4;
        arg0->unk0.unk12 = 6;
        arg0->unk0.unkE = 0xA;
        arg0->unk0.qUnkA = 50 - var_r7_2;
        arg0->unk0.unkC = 80;

        if (arg0->unk0.qUnkA >= -80) {
            sub_80530CC((const char *)arg0->unk20, &arg0->unk0);
        }

        arg0->unk0.unk10 = 0;
        arg0->unk0.unk12 = 6;
        arg0->unk0.unkE = 1;

        for (var_r6 = 11; var_r6 < 16; var_r6++) {
            if (arg0->unk20[var_r6] != 0x2B) {
                s32 v = var_r7_2 - 50;
                arg0->unk0.qUnkA = (var_r6 * 8) - v;
                if (arg0->unk0.qUnkA >= -8) {
                    sub_80530CC((const char *)&arg0->unk20[var_r6], &arg0->unk0);
                }
            }
        }
    } else if (sp0 > 0x2C) {
        arg0->unk0.unk10 = 4;
        arg0->unk0.unk12 = 6;
        arg0->unk0.unkE = 0xA;
        arg0->unk0.qUnkA = 0x32;
        arg0->unk0.unkC = 80;
        sub_80530CC((const char *)arg0->unk20, &arg0->unk0);

        for (var_r6 = 11; (var_r6 < 15); var_r6++) {
            if (arg0->unk20[var_r6] != 0x2B)
                break;
        }

        arg0->unk0.unk10 = 0;
        arg0->unk0.unk12 = 6;
        arg0->unk0.unkE = 16 - var_r6;
        arg0->unk0.qUnkA = (var_r6 * 8) - (var_r7_2 -= 50);
        sub_80530CC((const char *)&arg0->unk20[var_r6], &arg0->unk0);
    } else {
        s32 var_sb = (u8)Div(sp0, 2);
        if ((u32)var_sb > 16) {
            var_sb = 16;
        }

        if (var_sb != 0) {
            s8 var_sl = 0;
            var_r6 = 0;

            if (var_sl < var_sb) {
                do {
                    var_r7_2 = (sp0 - (var_r6 * 2));

                    if (var_r6 < 11) {
                        arg0->unk0.unk10 = 4;
                        arg0->unk0.unk12 = 6;
                    } else {
                        arg0->unk0.unk10 = 0;
                        arg0->unk0.unk12 = 6;
                    }

                    if (var_r7_2 > 0xB) {
                        s8 v = ((var_sl << 24) + 0x01000000) >> 24;
                        var_sl = v;
                    } else {
                        if ((var_r6 < 11) || (arg0->unk20[var_r6] != 0x2B)) {
                            arg0->unk0.unkE = 1;
                            arg0->unk0.unkC = Div(0x100 - (var_r7_2 * 0x15), 0x23) + 0x48;

                            *((u16 *)&arg0->unk0.unk6) = var_r7_2 + 0x14;

                            arg0->unk0.qUnkA = (var_r6 * 8) + 0x2E;
                            sub_8052E40(&arg0->unk20[var_r6], (void *)&arg0->unk0);
                        }
                    }
                } while (++var_r6 < (s32)var_sb);
            }

            if (var_sl > 11) {
                for (var_r6 = 11; (var_r6 < 15); var_r6++) {
                    if (arg0->unk20[var_r6] != 0x2B)
                        break;
                }

                arg0->unk0.unk10 = 0;
                arg0->unk0.unk12 = 6;
                arg0->unk0.unkE = var_sl - var_r6;
                arg0->unk0.unkC = 80;
                arg0->unk0.qUnkA = (var_r6 * 8) + 0x32;
                sub_80530CC((const char *)&arg0->unk20[var_r6], &arg0->unk0);
                var_sl = 11;
            }

            arg0->unk0.unk10 = 4;
            arg0->unk0.unk12 = 6;
            arg0->unk0.unkE = var_sl;
            arg0->unk0.unkC = 80;
            arg0->unk0.qUnkA = 0x32;
            sub_80530CC((const char *)arg0->unk20, &arg0->unk0);
        }
    }
}

void TaskDestructor_8058344(Task *t)
{
    StrcStgResults_38 *results = TASK_DATA(t);

    VramFree(results->vram1C.vram0);
    VramFree(results->vram1C.vram4);
}
