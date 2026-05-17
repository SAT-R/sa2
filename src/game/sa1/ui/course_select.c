#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "data/sa1/ui_graphics.h"
#include "game/sa1/ui/character_select.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/shared/multiplayer/communication_outcome.h"
#include "game/globals.h"
#include "game/sa1/save.h"
#include "game/shared/stage/stage.h"
#include "game/sa1/stage/stage_ui.h"
#include "game/sa1/menus/time_attack.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/ui_graphics.h"

typedef struct {
    StrcUi_805423C strc0;
    u8 fillerC[4];
    struct Task *task10;
    struct Task *task14;
    struct Task *task18;
    Sprite s;
    u32 unk4C;
    u16 unk50;
    s16 unk52;
    u8 unk54;
    u8 level;
    u8 unk56;
    u8 unk57;
    u8 unk58;
    u8 unk59;
} CourseSelectState;

typedef struct {
    Sprite s;
    u8 filler30[0x18];
    u32 unk48;
    u16 unk4C;
    u8 unk4E;
    u8 unk4F;
    u8 unk50;
    u8 unk51;
} CourseSelect_54;

typedef struct {
    Sprite sprites[15];
    u32 unk2D0;
    u16 unk2D4;
    u8 unk2D6;
    u8 unk2D7;
    u8 unk2D8;
    u8 unk2D9;
    u8 unk2DA;
    u8 unk2DB;
} CourseSelect_2DC;

extern u8 gUnknown_086A17F4[];
extern u8 gUnknown_086A2534[];
extern u16 gUnknown_086A2A34[];
extern u8 gUnknown_086A2C34[];
extern u8 gUnknown_086A3DB4[];

extern u8 gUnknown_03005140;

typedef struct {
    void *vram;
    u32 anim;
    u32 variant;
} StaticTileInfo;
const StaticTileInfo gUnknown_0868B10C[15] = {
    { OBJ_VRAM0 + 0x0020, 0x000002D4, 0x00000000 }, { OBJ_VRAM0 + 0x03E0, 0x000002D4, 0x00000001 },
    { OBJ_VRAM0 + 0x07A0, 0x000002D4, 0x00000002 }, { OBJ_VRAM0 + 0x0B60, 0x000002D4, 0x00000003 },
    { OBJ_VRAM0 + 0x0F20, 0x000002D4, 0x00000004 }, { OBJ_VRAM0 + 0x12E0, 0x000002D4, 0x00000005 },
    { OBJ_VRAM0 + 0x16A0, 0x000002D4, 0x00000006 }, { OBJ_VRAM0 + 0x1A60, 0x000002D4, 0x00000007 },
    { OBJ_VRAM0 + 0x1E20, 0x000002D4, 0x00000008 }, { OBJ_VRAM0 + 0x21E0, 0x000002D4, 0x00000009 },
    { OBJ_VRAM0 + 0x25A0, 0x000002D4, 0x0000000A }, { OBJ_VRAM0 + 0x2960, 0x000002D4, 0x0000000B },
    { OBJ_VRAM0 + 0x2D20, 0x000002D4, 0x0000000C }, { OBJ_VRAM0 + 0x30E0, 0x000002D4, 0x0000000D },
    { OBJ_VRAM0 + 0x34A0, 0x000002D4, 0x0000000E },
};

const StaticTileInfo gUnknown_0868B1C0[8] = {
    { OBJ_VRAM0 + 0x3860, 0x000002D5, 0 }, { OBJ_VRAM0 + 0x3CE0, 0x000002D6, 0 }, { OBJ_VRAM0 + 0x4160, 0x000002D7, 0 },
    { OBJ_VRAM0 + 0x45E0, 0x000002E6, 0 }, { OBJ_VRAM0 + 0x4A60, 0x000002E7, 0 }, { OBJ_VRAM0 + 0x4EE0, 0x000002E8, 0 },
    { OBJ_VRAM0 + 0x5360, 0x000002D9, 0 }, { OBJ_VRAM0 + 0x57E0, 0x000002D8, 0 },
};

const u16 gUnknown_0868B220[] = {
    20, 20, 20, 20, 20, 20, 20, 36, 60, 84, 108, 132, 156, 180, 204, 228,
};

void sub_8061894(void);
void Task_CourseSelectInit(void);
void Task_8062A80(void);
void Task_8062E18(void);
void Task_8062C28(void);
void Task_8062140(void);
void Task_8062B38(void);
void Task_8062CB4(void);
void Task_8062540(void);
void Task_80628A4(void);
void CreateTimeAttackRecords(void);
void Task_80629E8(void);
void TaskDestructor_CourseSelect(struct Task *t);

extern void CreateTimeAttackRecord(u8 arg0);

void sub_8061894(void)
{
    Strc_80528AC gfx;
    s8 *temp_r5;
    s8 *temp_r7;

    UiGfxStackInit();

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 1;
    gfx.tiles = gUnknown_086A17F4;
    gfx.tilesSize = 0xE00;
    gfx.layout = gUnknown_086A2534;
    gfx.layoutSize = 0x500;
    gfx.unk29 = 0x1;
    gfx.unk2A = 0x11;
    gfx.unk0.unk4 = 0;
    gfx.unk0.unk8 = 0;
    gfx.unk0.unk9 = 0;
    gfx.unk0.unkA = 0;
    gfx.unk0.unkB = 0;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 0;
    gfx.tiles = gUnknown_086A2C34;
    gfx.tilesSize = 0x1180;
    gfx.palette = gUnknown_086A2A34;
    gfx.paletteSize = 0x200;
    gfx.layout = gUnknown_086A3DB4;
    gfx.layoutSize = 0x1000;
    gfx.unk28 = 0;
    gfx.unk29 = 0;
    gfx.unk2A = 0x15;
    sub_80528AC(&gfx);
}

void CreateCourseSelect(bool8 arg0)
{
    Strc_80528AC gfx;
    s32 sp34;
    struct Task *task0;
    struct Task *task1;
    u8 unlockedLevelCount;
    s32 sp40;
    s32 temp_r1_2;
    s32 temp_r1_3;
    s32 temp_r1_4;
    s32 temp_r3;
    s32 temp_r3_2;
    CourseSelect_54 *strc54;
    CourseSelectState *state;
    CourseSelect_2DC *strc2DC;
    CourseSelect_2DC *strc2DC_2;
    struct Task *temp_r0_2;
    struct Task *task2;
    struct Task *task3;
    Sprite *s;
    u8 i;

    sp34 = arg0;
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    m4aSongNumStart(4U);
    sub_80535FC();
    UiGfxStackInit();

    if (arg0 == 1) {
        unlockedLevelCount = 13;
    } else {
        if (IS_MULTI_PLAYER) {
            unlockedLevelCount = gUnknown_03005140 + 2;
        } else {
            unlockedLevelCount = LOADED_SAVE->unlockedLevels[gSelectedCharacter] + 2;
        }

        if (gSelectedCharacter == CHARACTER_SONIC) {
            if (unlockedLevelCount == 0) {
                unlockedLevelCount = 1;
            }
            if (unlockedLevelCount > 15) {
                unlockedLevelCount = 15;
            } else if (LOADED_SAVE->unlockedLevels[0] == 0xD) {
                unlockedLevelCount = 14;
            }
        } else {
            if (unlockedLevelCount == 0) {
                unlockedLevelCount = 1;
            }
            if (unlockedLevelCount > 14) {
                unlockedLevelCount = 14;
            }
        }
        if ((gGameMode != 0) && (unlockedLevelCount > 0xDU)) {
            unlockedLevelCount = 13;
        }
    }

    gDispCnt = 0x1340;
    gBgCntRegs[0] = 0x1D83;
    gBgCntRegs[1] = 0x1886;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    sub_8061894();

    task0 = TaskCreate(Task_CourseSelectInit, sizeof(CourseSelectState), 0x2000U, 0U, TaskDestructor_CourseSelect);
    state = TASK_DATA(task0);
    state->unk4C = 0;
    state->unk57 = 0;
    state->unk50 = 0x14;
    state->unk52 = 0x14;
    state->unk54 = 0;
    state->level = 1;
    state->unk58 = unlockedLevelCount;
    state->unk59 = sp34;
    state->strc0.unk0 = 0;
    state->strc0.unk2 = 1;
    state->strc0.unk4 = 2;
    state->strc0.unk6 = 0;
    state->strc0.unk8 = 0x200;
    state->strc0.unkA = 1;

    task1 = TaskCreate(Task_8062E18, sizeof(CourseSelect_54), 0x2030U, 0U, NULL);
    strc54 = TASK_DATA(task1);
    strc54->unk48 = 0;
    strc54->unk4C = 0;
    strc54->unk4E = 0;
    strc54->unk4F = 0;
    strc54->unk51 = unlockedLevelCount;
    s = &strc54->s;
    s->graphics.dest = OBJ_VRAM0 + 0x6400;
    s->graphics.anim = SA1_ANIM_ARROW_UP;
    s->variant = 0;
    s->oamFlags = 0;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    state->task18 = task1;
    s = &state->s;
    s->x = DISPLAY_CENTER_X;
    s->y = DISPLAY_CENTER_Y;
    s->graphics.dest = strc54->s.graphics.dest + 0xC0;
    s->oamFlags = 0x80;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_VS_MENU_WAIT;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    task2 = TaskCreate(Task_8062A80, sizeof(CourseSelect_2DC), 0x2030U, 0U, NULL);
    strc2DC = TASK_DATA(task2);
    strc2DC->unk2D0 = 0;
    strc2DC->unk2D4 = 0;
    strc2DC->unk2D6 = 0;
    strc2DC->unk2D7 = 0;
    strc2DC->unk2DA = (u8)unlockedLevelCount;
    strc2DC->unk2D9 = 0;
    strc2DC->unk2DB = (u8)sp34;

    for (i = 0; i < state->unk58; i++) {
        {
            s = &strc2DC->sprites[i];
            temp_r1_2 = i * 0xC;
            s->graphics.dest = (void *)gUnknown_0868B10C[i].vram;
            s->graphics.anim = gUnknown_0868B10C[i].anim;
            s->variant = gUnknown_0868B10C[i].variant;
            s->oamFlags = 0x480;
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = 0x10;
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->frameFlags = 0x2000;
            UpdateSpriteAnimation(s);
        }
    }

    for (; i < (s32)ARRAY_COUNT(strc2DC->sprites); i++) {
        s = &strc2DC->sprites[i];
        s->graphics.dest = NULL;
    }
    state->task10 = task2;

    task2 = TaskCreate(Task_8062C28, sizeof(CourseSelect_2DC), 0x2030U, 0U, NULL);
    strc2DC_2 = TASK_DATA(task2);
    strc2DC_2->unk2D0 = 0;
    strc2DC_2->unk2D4 = 0;
    strc2DC_2->unk2D6 = 0;
    strc2DC_2->unk2D7 = 0;
    strc2DC_2->unk2DA = unlockedLevelCount;

    for (i = 0; i < 8; i++) {
        s = &strc2DC_2->sprites[i];
        s->graphics.dest = gUnknown_0868B1C0[i].vram;
        s->graphics.anim = gUnknown_0868B1C0[i].anim;
        s->variant = gUnknown_0868B1C0[i].variant;
        s->oamFlags = 0x480;
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x2000;
        UpdateSpriteAnimation(s);
    }

    for (; i < (s32)ARRAY_COUNT(strc2DC_2->sprites); i++) {
        s = &strc2DC_2->sprites[i];
        s->graphics.dest = NULL;
    }
    state->task14 = task2;

    if (sp34 == 1) {
        gBgScrollRegs[0][1] = 0x14;
        gBgCntRegs[0] = 0x9D83;
        state->unk4C = 0x3F;
        strc2DC->unk2D0 = 0x3F;
        strc2DC_2->unk2D0 = 0x3F;
        task0->main = Task_8062140;
        state->task10->main = Task_8062B38;
        state->task14->main = Task_8062CB4;

        gfx.uiGfxID = 62;
        gfx.unk2B = 0;
        gfx.tiles = gUiGraphics[62].tiles;
        gfx.palette = gUiGraphics[62].palette;
        gfx.tilesSize = 0x20;
        gfx.paletteSize = 0x20;
        gfx.unk28 = 3;
        gfx.vramC = OBJ_VRAM0 + 0x20;
        gfx.unk2A = 0xC;
        gfx.unk0.unk4 = gUiGraphics[62].unk8;
        gfx.unk0.unk8 = gUiGraphics[62].unkC;
        gfx.unk0.unk9 = gUiGraphics[62].unk10;
        gfx.unk0.unkA = gUiGraphics[62].unk14;
        gfx.unk0.unkB = gUiGraphics[62].unk18;
        sub_80528AC(&gfx);
    }
    sub_805423C(&state->strc0);
}

// (86.97%) https://decomp.me/scratch/1mKl5
NONMATCH("asm/non_matching/game/sa1/ui/course_select__Task_CourseSelectInit.inc", void Task_CourseSelectInit())
{
    Strc_80528AC gfx;
    s32 sp38;
    s32 sp3C;
    u8 var_r2;
    u8 var_r3;
    u16 *var_r1;

    u8 var_r5 = 0;
    CourseSelectState *state = TASK_DATA(gCurTask);
    CourseSelect_2DC *unk2DC = TASK_DATA(state->task10);
    CourseSelect_2DC *unk2DC_2 = TASK_DATA(state->task14);
    CourseSelect_54 *strc54 = TASK_DATA(state->task18);

    u32 temp_r8 = state->unk4C + 1;
    if ((temp_r8 == 0x3F) && (state->unk58 == 1)) {
        state->unk52 = 0;
    } else {
        state->unk52 = 0x14;
    }

    state->unk50 = 0x14;
    if (temp_r8 < 11) {
        gfx.uiGfxID = 62;
        gfx.unk2B = 0;
        gfx.tiles = gUiGraphics[62].tiles;
        gfx.palette = gUiGraphics[62].palette;
        gfx.tilesSize = 0x20;
        gfx.paletteSize = 0x20;
        gfx.unk28 = 3;
        gfx.vramC = OBJ_VRAM0 + 0x20;
        gfx.unk2A = 0xC;
        gfx.unk0.unk4 = gUiGraphics[62].unk8;
        gfx.unk0.unk8 = gUiGraphics[62].unkC;
        gfx.unk0.unk9 = gUiGraphics[62].unk10;
        gfx.unk0.unkA = gUiGraphics[62].unk14;
        gfx.unk0.unkB = gUiGraphics[62].unk18;
        sub_80528AC(&gfx);
    }
    state->unk4C = temp_r8;
    unk2DC->unk2D0 = temp_r8;
    unk2DC_2->unk2D0 = temp_r8;
    strc54->unk48 = temp_r8;
    unk2DC->unk2D7 = state->level;
    unk2DC_2->unk2D7 = state->level;
    strc54->unk4F = state->level;
    state->unk50 += Div(((s16)state->unk52 - state->unk50) * 2, 10);
    unk2DC->unk2D4 = state->unk50;
    unk2DC_2->unk2D4 = (u16)state->unk50;
    strc54->unk4C = (u16)state->unk50;
    unk2DC->unk2D9 = (u8)state->unk57;
    sub_805423C(&state->strc0);

    gFlags |= 4;
    gHBlankCopyTarget = (void *)&REG_BG0HOFS;
    gHBlankCopySize = 4;
    var_r1 = gBgOffsetsHBlankPrimary;

    for (var_r2 = 0; var_r2 < 12; var_r2++, var_r5++) {
        *var_r1++ = 0;
        *var_r1++ = 0x14;
    }

    for (var_r2 = 0; var_r5 < DISPLAY_HEIGHT; var_r5++, var_r2) {
        var_r3 = 0;
        sp3C = var_r2 * 2;
        ++var_r2;
        for (; var_r3 < (0x40 - temp_r8) && (var_r5 < DISPLAY_HEIGHT); var_r5++, var_r3++) {
            *var_r1++ = 0;
            *var_r1++ = (0 - var_r5) & 0x1FF;
        }

        var_r3 = ((((sp3C + var_r2) * 8) - var_r5) + 0x20);
        for (var_r2 = 0; (var_r2 < 0x18) && (var_r5 < DISPLAY_HEIGHT); var_r5++, var_r2++) {
            *var_r1++ = 0;
            *var_r1++ = (s16)var_r3;
        }
    }

    if ((temp_r8 == 0x3F) || (A_BUTTON & gPressedKeys)) {
        gBgScrollRegs[0][1] = 0x14;
        state->unk4C = 0x3F;
        unk2DC->unk2D0 = 0x3F;
        unk2DC_2->unk2D0 = 0x3F;
        gBgCntRegs[0] = 0x9D83;
        gFlags &= ~4;
        gCurTask->main = Task_8062140;
    }
}
END_NONMATCH

void Task_8062140()
{
    Sprite *temp_r4_2;
    s32 var_r0;
    s32 var_r1;
    u32 temp_r8;
    u8 temp_r0_2;
    union MultiSioData *send_recv;
    u32 i;

    CourseSelectState *state = TASK_DATA(gCurTask);
    CourseSelect_2DC *unk2DC = TASK_DATA(state->task10);
    CourseSelect_2DC *unk2DC_2 = TASK_DATA(state->task14);
    CourseSelect_54 *strc54 = TASK_DATA(state->task18);

    if (IS_MULTI_PLAYER) {
        for (i = 0; (i < 4) && GetBit(gMultiplayerConnections, i); i++) {
            if (!CheckBit(gMultiSioStatusFlags, i)) {
                if (gMultiplayerMissingHeartbeats[i]++ > 0xB4U) {
                    TasksDestroyAll();
                    PAUSE_BACKGROUNDS_QUEUE();
                    gBgSpritesCount = 0;
                    PAUSE_GRAPHICS_QUEUE();
                    LinkCommunicationError();
                    return;
                }
            } else {
                gMultiplayerMissingHeartbeats[i] = 0;
            }
        }

        if (IS_MULTI_PLAYER) {
            send_recv = gMultiSioRecv;

            if ((gMultiSioStatusFlags & MULTI_SIO_TYPE) == MULTI_SIO_CHILD) {
                if (send_recv->pat0.unk0 > 0x4FU) {
                    state->level = send_recv->pat0.unk2;
                }
                UpdateSpriteAnimation(&state->s);
                DisplaySprite(&state->s);
            }
        }
    }

    temp_r8 = state->unk4C;
    temp_r0_2 = state->unk58;
    temp_r8++;
    if (((gMultiSioStatusFlags & MULTI_SIO_TYPE) == MULTI_SIO_PARENT) || (IS_SINGLE_PLAYER)) {
        if (state->unk58 > 1U) {
            if (DPAD_DOWN & gRepeatedKeys) {
                if (state->level < (temp_r0_2 - 1)) {
                    m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                    state->level++;
                }
            } else if (DPAD_UP & gRepeatedKeys) {
                if (state->level > 1U) {
                    m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                    state->level--;
                }
            }
        }
    }

    if (state->level > (Div(state->unk52, 24) + 5)) {
        if (((gSelectedCharacter != 0) || (gCurrentLevel < 12) || (LOADED_SAVE->chaosEmeralds != ALL_ZONE_CHAOS_EMERALDS)
             || (LOADED_SAVE->unlockedLevels[0] <= 12) || (LOADED_SAVE->unlockedLevels[1] <= 12) || (LOADED_SAVE->unlockedLevels[2] <= 12)
             || (LOADED_SAVE->unlockedLevels[3] <= 12) || ((LOADED_SAVE->unlockedLevels[0] == 0xF) && (gMultiplayerCurrentLevel == 12)))
            && (temp_r0_2 > 0xDU) && (state->level == 0xD)) {

            {
                var_r1 = state->level;
                var_r1 -= 5;
                state->unk52 = (var_r1 * 0x18) - 8;
            }
        } else {
            state->unk52 = (((((state->level - 5) & 0x1E) + 1) * 24) - 8);
        }
    } else {
        if (state->level <= Div(state->unk52, 0x18)) {
            var_r1 = state->level;
            var_r0 = (var_r1 * 0x18) - 8;
            if (var_r0 > 0x10) {
                var_r1 = (u32)var_r1 >> 1;
                var_r1 <<= 1;
                var_r0 = state->unk52 = ((var_r1 - 1) * 0x18) - 8;
            } else {
                state->unk52 = (var_r1 * 0x18) - 8;
            }
        }
    }
    state->unk4C = temp_r8;
    unk2DC->unk2D0 = temp_r8;
    unk2DC_2->unk2D0 = temp_r8;
    strc54->unk48 = temp_r8;
    unk2DC->unk2D7 = state->level;
    unk2DC_2->unk2D7 = state->level;
    strc54->unk4F = state->level;
    state->unk50 += Div((state->unk52 - state->unk50) * 2, 10);
    unk2DC->unk2D4 = state->unk50;
    unk2DC_2->unk2D4 = state->unk50;
    strc54->unk4C = state->unk50;
    unk2DC->unk2D9 = state->unk57;
    sub_805423C(&state->strc0);

    if (IS_MULTI_PLAYER) {
        send_recv = &gMultiSioSend;
        send_recv->pat0.unk0 = 0x50;
        send_recv->pat0.unk2 = state->level;
    }

    if (state->strc0.unk6 > 0x1800) {
        if (state->strc0.unk4 == 2) {
            if (IS_SINGLE_PLAYER) {
                if (A_BUTTON & gPressedKeys) {
                    if (gGameMode != GAME_MODE_TIME_ATTACK) {
                        m4aSongNumStop(MUS_COURSE_SELECTION);
                    }
                    if (temp_r8 > 64) {
                        state->unk57 = 1;
                        gCurTask->main = Task_8062540;
                        m4aSongNumStart(SE_SELECT);
                        state->strc0.unk4 = 1;
                        state->strc0.unk6 = 0x2000 - state->strc0.unk6;
                    }
                } else if ((B_BUTTON & gPressedKeys) != 0) {
                    m4aSongNumStop(MUS_COURSE_SELECTION);
                    state->unk57 = 2;
                    gCurTask->main = Task_8062540;
                    m4aSongNumStart(0x6BU);
                    state->strc0.unk4 = 1;
                    state->strc0.unk6 = 0x2000 - state->strc0.unk6;
                }
            } else {
                if (((gMultiSioStatusFlags & MULTI_SIO_TYPE) == MULTI_SIO_PARENT) && (A_BUTTON & gPressedKeys)) {
                    send_recv = &gMultiSioSend;
                    send_recv->pat0.unk0 = 0x51;
                }

                send_recv = gMultiSioRecv;
                if (send_recv->pat0.unk0 == 0x51) {
                    state->unk57 = 1;
                    gCurTask->main = Task_8062540;
                    m4aSongNumStart(SE_SELECT);
                    m4aSongNumStop(MUS_COURSE_SELECTION);
                    state->strc0.unk4 = 1;
                    state->strc0.unk6 = 0x2000 - state->strc0.unk6;
                }
            }
        }
    }

    gBgScrollRegs[0][1] = state->unk50;
}

void Task_8062540()
{
    u8 level;
    s32 unk4C;
    u8 *unk58;
    u32 i;
    union MultiSioData *send_recv;

    CourseSelectState *state = TASK_DATA(gCurTask);
    CourseSelect_2DC *unk2DC = TASK_DATA(state->task10);
    CourseSelect_2DC *unk2DC_2 = TASK_DATA(state->task14);
    CourseSelect_54 *strc54 = TASK_DATA(state->task18);

    if (IS_MULTI_PLAYER) {
        for (i = 0; (i < 4) && GetBit(gMultiplayerConnections, i); i++) {
            if (!CheckBit(gMultiSioStatusFlags, i)) {
                if (gMultiplayerMissingHeartbeats[i]++ > 0xB4U) {
                    TasksDestroyAll();
                    PAUSE_BACKGROUNDS_QUEUE();
                    gBgSpritesCount = 0;
                    PAUSE_GRAPHICS_QUEUE();
                    LinkCommunicationError();
                    return;
                }
            } else {
                gMultiplayerMissingHeartbeats[i] = 0;
            }
        }

        if (IS_MULTI_PLAYER) {
            send_recv = gMultiSioRecv;

            if ((gMultiSioStatusFlags & MULTI_SIO_TYPE) == MULTI_SIO_CHILD) {
                if (send_recv->pat0.unk0 > 0x4FU) {
                    state->level = send_recv->pat0.unk2;
                }
            }
        }
    }

    unk4C = state->unk4C;
    unk58 = &state->unk58;
    unk4C++;

    if (*unk58 == 1) {
        state->unk52 = 0;
    }
    state->unk4C = unk4C;
    unk2DC->unk2D0 = unk4C;
    unk2DC_2->unk2D0 = unk4C;
    strc54->unk48 = unk4C;
    unk2DC->unk2D7 = (u8)state->level;
    unk2DC_2->unk2D7 = state->level;
    strc54->unk4F = (u8)state->level;
    state->unk50 += Div((state->unk52 - state->unk50) * 2, 10);
    unk2DC->unk2D4 = state->unk50;
    unk2DC_2->unk2D4 = state->unk50;
    strc54->unk4C = state->unk50;
    unk2DC->unk2D9 = state->unk57;
    sub_805423C(&state->strc0);

    if ((state->strc0.unk6 > 0x1800) && (state->strc0.unk4 == 1)) {
        if (IS_SINGLE_PLAYER) {
            gDispCnt &= 0x1FFF;
            gBldRegs.bldCnt = 0;
            gBldRegs.bldY = 0;
            gBgCntRegs[0] = 0x9D03;
            gBgCntRegs[1] = 0x1806;
            if (state->unk57 == 1) {
                if (gGameMode == GAME_MODE_TIME_ATTACK) {
                    level = state->level;
                    if (level == 0) {
                        gCurrentLevel = 0;
                        gMultiplayerCurrentLevel = 0;
                    } else if (level < 0x13) {
                        gCurrentLevel = level - 1;
                        gMultiplayerCurrentLevel = gCurrentLevel;
                    }
                    CreateTimeAttackRecords();

                    TaskDestroy(state->task18);
                    TaskDestroy(state->task14);
                    TaskDestroy(state->task10);
                    TaskDestroy(gCurTask);
                } else if (state->unk59 == 1) {
                    CreateTimeAttackRecord((u8)(state->level - 1));

                    TaskDestroy(state->task18);
                    TaskDestroy(state->task14);
                    TaskDestroy(state->task10);
                    TaskDestroy(gCurTask);
                } else {
                    gBgSprites_Unknown1[0] = 0;
                    gBgSprites_Unknown2[0][0] = 0;
                    gBgSprites_Unknown2[0][1] = 0;
                    gBgSprites_Unknown2[0][2] = -1;
                    gBgSprites_Unknown2[0][3] = 0x20;
                    gBgSprites_Unknown1[1] = 0;
                    gBgSprites_Unknown2[1][0] = 0;
                    gBgSprites_Unknown2[1][1] = 0;
                    gBgSprites_Unknown2[1][2] = -1;
                    gBgSprites_Unknown2[1][3] = 0x20;
                    gBgSprites_Unknown1[2] = 0;
                    gBgSprites_Unknown2[2][0] = 0;
                    gBgSprites_Unknown2[2][1] = 0;
                    gBgSprites_Unknown2[2][2] = -1;
                    gBgSprites_Unknown2[2][3] = 0x20;
                    gBgSprites_Unknown1[3] = 0;
                    gBgSprites_Unknown2[3][0] = 0;
                    gBgSprites_Unknown2[3][1] = 0;
                    gBgSprites_Unknown2[3][2] = -1;
                    gBgSprites_Unknown2[3][3] = 0x20;

                    level = state->level;
                    if (level == 0) {
                        gCurrentLevel = 0;
                        gMultiplayerCurrentLevel = 0;
                        ApplyGameStageSettingsAndStart();
                    } else if ((u32)level < 19) {
                        gCurrentLevel = level - 1;
                        gMultiplayerCurrentLevel = gCurrentLevel;
                        ApplyGameStageSettingsAndStart();
                    }

                    TaskDestroy(state->task18);
                    TaskDestroy(state->task14);
                    TaskDestroy(state->task10);
                    TaskDestroy(gCurTask);
                }
            } else {
                u32 unk59 = state->unk59;
                TaskDestroy(state->task18);
                TaskDestroy(state->task14);
                TaskDestroy(state->task10);
                TaskDestroy(gCurTask);

                if (unk59 == 1) {
                    CreateTimeAttackMenu();
                } else {
                    CreateCharacterSelectionScreen(0);
                }
            }
        } else {
            // -> IS_MULTI_PLAYER
            gCurTask->main = Task_80628A4;
            goto mp_check; // TODO: remove goto
        }
    } else {
        gBgScrollRegs[0][1] = (s16)state->unk50;

    mp_check:
        if (IS_MULTI_PLAYER) {
            if ((gMultiSioStatusFlags & MULTI_SIO_TYPE) == MULTI_SIO_PARENT) {
                send_recv = &gMultiSioSend;
                send_recv->pat0.unk0 = 0x51;
                send_recv->pat0.unk2 = state->level;
            }
        }
    }
}

void Task_80628A4()
{
    union MultiSioData *send_recv;
    u32 sioFlags;
    u32 i, j;

    CourseSelectState *state = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        for (i = 0; (i < 4) && GetBit(gMultiplayerConnections, i); i++) {
            if (!CheckBit(gMultiSioStatusFlags, i)) {
                if (gMultiplayerMissingHeartbeats[i]++ > 0xB4U) {
                    TasksDestroyAll();
                    PAUSE_BACKGROUNDS_QUEUE();
                    gBgSpritesCount = 0;
                    PAUSE_GRAPHICS_QUEUE();
                    LinkCommunicationError();
                    return;
                }
            } else {
                gMultiplayerMissingHeartbeats[i] = 0;
            }
        }
    }

    send_recv = gMultiSioRecv;
    if (send_recv->pat0.unk0 == 0x52) {
        gCurTask->main = Task_80629E8;
    }

    if ((gMultiSioStatusFlags & MULTI_SIO_TYPE) == MULTI_SIO_PARENT) {
        for (j = 1; j < 4; j++) {
            if (GetBit(gMultiplayerConnections, j)) {
                send_recv = &gMultiSioRecv[j];
                if (send_recv->pat0.unk0 != 0x51) {
                    break;
                }
            }
        }

        if (j == 4) {
            send_recv = &gMultiSioSend;
            send_recv->pat0.unk0 = 0x52;
            send_recv->pat0.unk2 = state->level;
            return;
        }
    }

    send_recv = &gMultiSioSend;
    send_recv->pat0.unk0 = 0x51;
    send_recv->pat0.unk2 = state->level;
}

void Task_80629E8()
{
    u8 level;
    CourseSelectState *state = TASK_DATA(gCurTask);

    gDispCnt &= 0x1FFF;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    level = state->level;
    if (level == 0) {
        gCurrentLevel = 0;
        gMultiplayerCurrentLevel = 0;
        ApplyGameStageSettingsAndStart();
    } else if (level < 19) {
        gCurrentLevel = state->level - 1;
        gMultiplayerCurrentLevel = gCurrentLevel;
        ApplyGameStageSettingsAndStart();
    }

    TaskDestroy(state->task18);
    TaskDestroy(state->task14);
    TaskDestroy(state->task10);
    TaskDestroy(gCurTask);
}

void Task_8062A80()
{
    Sprite *s;
    s16 var_r0_2;
    u8 i;

    CourseSelect_2DC *strc2DC = TASK_DATA(gCurTask);

    for (i = 1; i < strc2DC->unk2DA; i++) {
        s = &strc2DC->sprites[i];
        if (i == strc2DC->unk2D7) {
            s->palId = 1;
            var_r0_2 = 0x4C;
        } else {
            s->palId = 0;
            var_r0_2 = 0x48;
        }
        s->x = var_r0_2;
        s->y = ((i - 1) * 24) + (i * (64 - strc2DC->unk2D0)) + 16;
        s->frameFlags |= 0x40000;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (strc2DC->unk2D0 == 0x3F) {
        gCurTask->main = Task_8062B38;
    }
}

void Task_8062B38()
{
    Sprite *s;
    u8 *var_r1;
    u8 temp_r1;
    u8 temp_r8;
    u8 var_r0;
    u8 spriteIndex;
    u32 spriteIndex_32;
    u8 var_r7;

    CourseSelect_2DC *strc2DC = TASK_DATA(gCurTask);
    temp_r8 = strc2DC->unk2DB;
    spriteIndex_32 = (Div(strc2DC->unk2D4, 24) - 1);
    spriteIndex_32 <<= 24;
    var_r7 = 0;
    spriteIndex = spriteIndex_32 >>= 24;
    for (; var_r7 < 8; var_r7++, spriteIndex++) {
        if ((spriteIndex != 0) && (spriteIndex <= (s32)(strc2DC->unk2DA - 1))) {
            s = &strc2DC->sprites[spriteIndex];
            if (temp_r8 == 1) {
                SPRITE_FLAG_SET(s, 18);
            }
            if (spriteIndex == strc2DC->unk2D7) {
                temp_r1 = strc2DC->unk2D9;
                if (temp_r1 == 1) {
                    var_r0 = strc2DC->unk2D0 & temp_r1;
                    if (var_r0 != 0) {
                        s->palId = 1;
                    } else {
                        s->palId = 0;
                    }
                } else {
                    s->palId = 1;
                }
                s->x = 0x4C;
            } else {
                s->x = 0x48;
                s->palId = 0;
            }
            s->y = (spriteIndex * 0x18) - (strc2DC->unk2D4 - 0xC);
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void Task_8062C28()
{
    Sprite *s;
    u8 i;

    CourseSelect_2DC *strc2DC = TASK_DATA(gCurTask);

    for (i = 1; i < 6; i++) {
        s = &strc2DC->sprites[i - 1];
        s->palId = 0;
        s->x = 212;
        s->y = ((i - 1) * 48) + (i * ((64 - strc2DC->unk2D0) << 1)) + 0x21;

        if (strc2DC->unk2DA > (((i - 1) * 2) + 1)) {
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }

    if (strc2DC->unk2D0 == 0x3F) {
        gCurTask->main = Task_8062CB4;
    }
}

void Task_8062CB4()
{
    Sprite *s;
    s32 temp_r0;
    u8 i;
    u8 var_r7;

    CourseSelect_2DC *strc2DC = TASK_DATA(gCurTask);

    if (strc2DC->unk2D4 > 0x2FU) {
        u32 v = Div(strc2DC->unk2D4, 0x30) - 1;
        v <<= 24;
        var_r7 = 1;
        i = v >>= 24;
        for (; var_r7 < 7; var_r7++, i++) {
            if (i < 8) {
                s = &strc2DC->sprites[i];
                s->x = 212;
                s->palId = 0;
                temp_r0 = (strc2DC->unk2D4 - 0x37);
                temp_r0 = (i * 0x30) - temp_r0;
                s->y = temp_r0;
                if (i == 6) {
                    s->y = temp_r0 - 0xC;
                }
                if (i == 7) {
                    s->y = (u16)s->y - 0x24;
                }

                if (strc2DC->unk2DA > ((i * 2) + 1)) {
                    UpdateSpriteAnimation(s);
                    DisplaySprite(s);
                } else if ((i == 7) && ((s8)gSelectedCharacter == CHARACTER_SONIC) && (strc2DC->unk2DA == 0xF)) {
                    UpdateSpriteAnimation(s);
                    DisplaySprite(s);
                }
            }
        }
    } else {
        u32 v = Div(strc2DC->unk2D4, 48);
        v <<= 24;
        var_r7 = 1;
        i = v >>= 24;
        for (; var_r7 < 6; var_r7++, i++) {
            if (i < 8) {
                s = &strc2DC->sprites[i];
                s->x = 212;
                s->palId = 0;
                temp_r0 = (strc2DC->unk2D4 - 0x37);
                temp_r0 = (i * 0x30) - temp_r0;
                s->y = temp_r0;
                if (i == 6) {
                    s->y = temp_r0 - 0xC;
                }
                if (i == 7) {
                    s->y = (u16)s->y - 36;
                    if ((gSelectedCharacter == CHARACTER_SONIC) && (strc2DC->unk2DA < 16)) {
                        UpdateSpriteAnimation(s);
                        DisplaySprite(s);
                    }
                } else if (strc2DC->unk2DA > ((i * 2) + 1)) {
                    UpdateSpriteAnimation(s);
                    DisplaySprite(s);
                }
            }
        }
    }
}

void Task_8062E18()
{
    CourseSelect_54 *strc54 = TASK_DATA(gCurTask);
    Sprite *s = &strc54->s;

    if (strc54->unk4C != 0x14) {
        s->frameFlags &= 0xFFFFF7FF;
        s->x = 48;
        s->y = 24;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
        if (((u32)strc54->unk51 > 6U) && ((u32)strc54->unk4C < gUnknown_0868B220[strc54->unk51 - 1])) {
            s->frameFlags |= 0x800;
            s->x = 48;
            s->y = 136;
            DisplaySprite(s);
        }
    } else {
        if (((u32)strc54->unk51 > 7U) && (strc54->unk4C < gUnknown_0868B220[(strc54->unk51 - 1)])) {
            s->frameFlags |= 0x800;
            s->x = 48;
            s->y = 136;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void TaskDestructor_CourseSelect(struct Task *t) { }
