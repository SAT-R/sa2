#include "global.h"
#include "core.h"
#include "trig.h"
#include "lib/m4a/m4a.h"
#include "data/sa1/ui_graphics.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/shared/stage/entity.h"
#include "game/globals.h"
#include "game/sa1/save.h"
#include "game/sa1/special_stage/main.h"
#include "game/shared/stage/stage.h"

#include "constants/sa1/ui_graphics.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    u8 filler0[0xC];
    Task *taskC;
    Task *task10;
    Task *task14;
    Task *task18;
    Task *task1C;
    Task *task20;
    Task *task24;
    s16 unk28;
    u16 unk2A;
} Game_2_1_2C;

typedef struct {
    union {
        // TODO: This union might actually be their shared global type?
        GameOverB overB;
        Strc_8052C84 strc0;
    } u;
    s32 unk18;
    s32 unk1C;
    u16 unk20;
    u16 unk22;
    u16 unk24;
    u16 unk26;
    u8 unk28;
    u8 unk29;
    u8 unk2A;
    u8 unk2B[7];
} Game_2_1_34;

void sub_805C900(u8 arg0);
void sub_805C994(u8 arg0);
void Task_805D684(void);
void Task_805D720(void);
void sub_805D81C(void);
void Task_805D8EC(void);
void sub_805D9E4(void);
void Task_805DB04(void);
void Task_805DD10(void);
void Task_805DF2C(void);
void sub_805E018(void);
void sub_805D4F0(void);
void TaskDestructor_805E1E4(Task *t);

extern u8 gUnknown_08487134[NUM_TIME_ATTACK_ZONES * ACTS_PER_ZONE];

void sub_805C900(u8 arg0)
{
    s16 var_r4;
    s32 temp_r0_2;
    s32 strc34_2;
    u8 *temp_r5;
    s32 var_r6;
    s32 temp_r0_3;
    Game_2_1_34 *strc34;

    strc34 = TASK_DATA(gCurTask);
    if (0) {
    } else if (arg0 == 0) {
        var_r6 = strc34->unk26 * 100;
    } else if (arg0 == 1) {
        var_r6 = strc34->unk18;
    } else if (arg0 == 2) {
        var_r6 = strc34->unk1C;
    } else if (arg0 == 3) {
        var_r6 = strc34->unk2A;
    }

    for (var_r4 = 6; var_r4 >= 0; var_r4--) {
        u8 *ptrUnk2B = strc34->unk2B;
        temp_r0_2 = Div(var_r6, 10);
        temp_r5 = &ptrUnk2B[var_r4];
        strc34_2 = ((temp_r0_2 << 3) + (temp_r0_2 << 1));
        temp_r0_3 = ((var_r6 - strc34_2) + 32);
        *temp_r5 = temp_r0_3;
        if ((var_r6 != strc34_2) && (arg0 == 3)) {
            *temp_r5 = (temp_r0_3 + 0xB);
        }
        var_r6 = temp_r0_2;
    }
}

void sub_805C994(u8 arg0)
{
    Strc_80528AC gfx;

    gfx.uiGfxID = UIGFX_STGRESULT_HEADLINE_BACK;
    gfx.unk2B = 8;
    gfx.tiles = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].tiles;
    gfx.palette = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].palette;
    gfx.tilesSize = 0x200;
    gfx.paletteSize = 0x20;
    gfx.unk28 = 14;
    gfx.vramC = OBJ_VRAM0 + 0x77A0;
    gfx.unk2A = 13;
    gfx.unk0.unk4 = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk8;
    gfx.unk0.unk8 = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unkC;
    gfx.unk0.unk9 = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk10;
    gfx.unk0.unkA = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk14;
    gfx.unk0.unkB = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk18;
    sub_80528AC(&gfx);

    if (arg0 != 0) {
        gfx.uiGfxID = UIGFX_51;
        gfx.unk2B = 2;
        gfx.tiles = gUiGraphics[gfx.uiGfxID].tiles;
        gfx.palette = gUiGraphics[gfx.uiGfxID].palette;
        gfx.tilesSize = 0xE00;
        gfx.paletteSize = 0x20;
        gfx.unk28 = 0xF;
        gfx.vramC = OBJ_VRAM0 + 0x69A0;
        gfx.unk2A = 13;
        gfx.unk0.unk4 = gUiGraphics[gfx.uiGfxID].unk8;
        gfx.unk0.unk8 = gUiGraphics[gfx.uiGfxID].unkC;
        gfx.unk0.unk9 = gUiGraphics[gfx.uiGfxID].unk10;
        gfx.unk0.unkA = gUiGraphics[gfx.uiGfxID].unk14;
        gfx.unk0.unkB = gUiGraphics[gfx.uiGfxID].unk18;
        sub_80528AC(&gfx);

        gfx.uiGfxID = UIGFX_STGRESULT_SONIC + gSelectedCharacter;
        gfx.unk2B = 2;
        gfx.tiles = gUiGraphics[gfx.uiGfxID].tiles;
        gfx.palette = gUiGraphics[gfx.uiGfxID].palette;
        gfx.tilesSize = 0x600;
        gfx.paletteSize = 0xC;
        gfx.unk28 = 15;
        gfx.vramC = OBJ_VRAM0 + 0x63a0;
        gfx.unk2A = 13;
        gfx.unk0.unk4 = gUiGraphics[gfx.uiGfxID].unk8;
        gfx.unk0.unk8 = gUiGraphics[gfx.uiGfxID].unkC;
        gfx.unk0.unk9 = gUiGraphics[gfx.uiGfxID].unk10;
        gfx.unk0.unkA = gUiGraphics[gfx.uiGfxID].unk14;
        gfx.unk0.unkB = gUiGraphics[gfx.uiGfxID].unk18;
        sub_80528AC(&gfx);
    } else {
        gfx.uiGfxID = UIGFX_53;
        gfx.unk2B = 2;
        gfx.tiles = gUiGraphics[gfx.uiGfxID].tiles;
        gfx.palette = gUiGraphics[gfx.uiGfxID].palette;
        gfx.tilesSize = 0x1400;
        gfx.paletteSize = 0x20;
        gfx.unk28 = 0xF;
        gfx.vramC = OBJ_VRAM0 + 0x63A0;
        gfx.unk2A = 0xD;
        gfx.unk0.unk4 = gUiGraphics[gfx.uiGfxID].unk8;
        gfx.unk0.unk8 = gUiGraphics[gfx.uiGfxID].unkC;
        gfx.unk0.unk9 = gUiGraphics[gfx.uiGfxID].unk10;
        gfx.unk0.unkA = gUiGraphics[gfx.uiGfxID].unk14;
        gfx.unk0.unkB = gUiGraphics[gfx.uiGfxID].unk18;
        sub_80528AC(&gfx);
    }

    gfx.uiGfxID = UIGFX_52;
    gfx.unk2B = 3;
    gfx.tiles = gUiGraphics[gfx.uiGfxID].tiles;
    gfx.palette = gUiGraphics[gfx.uiGfxID].palette;
    gfx.tilesSize = 0x1100;
    gfx.paletteSize = 0x20;
    gfx.unk28 = 0xE;
    gfx.vramC = OBJ_VRAM0 + 0x52A0;
    gfx.unk2A = 0xD;
    gfx.unk0.unk4 = gUiGraphics[gfx.uiGfxID].unk8;
    gfx.unk0.unk8 = gUiGraphics[gfx.uiGfxID].unkC;
    gfx.unk0.unk9 = gUiGraphics[gfx.uiGfxID].unk10;
    gfx.unk0.unkA = gUiGraphics[gfx.uiGfxID].unk14;
    gfx.unk0.unkB = gUiGraphics[gfx.uiGfxID].unk18;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_54;
    gfx.unk2B = 4;
    gfx.tiles = gUiGraphics[gfx.uiGfxID].tiles;
    gfx.palette = gUiGraphics[gfx.uiGfxID].palette;
    gfx.tilesSize = 0x600;
    gfx.paletteSize = 0x20;
    gfx.unk28 = 0xD;
    gfx.vramC = OBJ_VRAM0 + 0x4CA0;
    gfx.unk2A = 0xD;
    gfx.unk0.unk4 = gUiGraphics[gfx.uiGfxID].unk8;
    gfx.unk0.unk8 = gUiGraphics[gfx.uiGfxID].unkC;
    gfx.unk0.unk9 = gUiGraphics[gfx.uiGfxID].unk10;
    gfx.unk0.unkA = gUiGraphics[gfx.uiGfxID].unk14;
    gfx.unk0.unkB = gUiGraphics[gfx.uiGfxID].unk18;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_56;
    gfx.unk2B = 5;
    gfx.tiles = gUiGraphics[gfx.uiGfxID].tiles;
    gfx.palette = gUiGraphics[gfx.uiGfxID].palette;
    gfx.tilesSize = 0x20;
    gfx.paletteSize = 0x20;
    gfx.unk28 = 0xC;
    gfx.vramC = OBJ_VRAM0 + 0x4CA0;
    gfx.unk2A = 0xC;
    gfx.unk0.unk4 = gUiGraphics[gfx.uiGfxID].unk8;
    gfx.unk0.unk8 = gUiGraphics[gfx.uiGfxID].unkC;
    gfx.unk0.unk9 = gUiGraphics[gfx.uiGfxID].unk10;
    gfx.unk0.unkA = gUiGraphics[gfx.uiGfxID].unk14;
    gfx.unk0.unkB = gUiGraphics[gfx.uiGfxID].unk18;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_57;
    gfx.unk2B = 5;
    gfx.tiles = gUiGraphics[gfx.uiGfxID].tiles;
    gfx.palette = gUiGraphics[gfx.uiGfxID].palette;
    gfx.tilesSize = 0x20;
    gfx.paletteSize = 0x20;
    gfx.unk28 = 0xB;
    gfx.vramC = OBJ_VRAM0 + 0x4CA0;
    gfx.unk2A = 0xC;
    gfx.unk0.unk4 = gUiGraphics[gfx.uiGfxID].unk8;
    gfx.unk0.unk8 = gUiGraphics[gfx.uiGfxID].unkC;
    gfx.unk0.unk9 = gUiGraphics[gfx.uiGfxID].unk10;
    gfx.unk0.unkA = gUiGraphics[gfx.uiGfxID].unk14;
    gfx.unk0.unkB = gUiGraphics[gfx.uiGfxID].unk18;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_58;
    gfx.unk2B = 5;
    gfx.tiles = gUiGraphics[gfx.uiGfxID].tiles;
    gfx.palette = gUiGraphics[gfx.uiGfxID].palette;
    gfx.tilesSize = 0x20;
    gfx.paletteSize = 0x20;
    gfx.unk28 = 10;
    gfx.vramC = OBJ_VRAM0 + 0x4CA0;
    gfx.unk2A = 0xC;
    gfx.unk0.unk4 = gUiGraphics[gfx.uiGfxID].unk8;
    gfx.unk0.unk8 = gUiGraphics[gfx.uiGfxID].unkC;
    gfx.unk0.unk9 = gUiGraphics[gfx.uiGfxID].unk10;
    gfx.unk0.unkA = gUiGraphics[gfx.uiGfxID].unk14;
    gfx.unk0.unkB = gUiGraphics[gfx.uiGfxID].unk18;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_ASCII_CHARS;
    gfx.unk2B = 6;
    gfx.tiles = gUiGraphics[gfx.uiGfxID].tiles + 0x400;
    gfx.palette = gUiGraphics[gfx.uiGfxID].palette;
    gfx.vramC = OBJ_VRAM0 + 0x4A20;
    gfx.tilesSize = 0x280;
    gfx.paletteSize = 0x20;
    gfx.unk28 = 0x9;
    gfx.unk2A = 0xD;
    gfx.unk0.unk4 = gUiGraphics[gfx.uiGfxID].unk8;
    gfx.unk0.unk8 = gUiGraphics[gfx.uiGfxID].unkC;
    gfx.unk0.unk9 = gUiGraphics[gfx.uiGfxID].unk10;
    gfx.unk0.unkA = gUiGraphics[gfx.uiGfxID].unk14;
    gfx.unk0.unkB = gUiGraphics[gfx.uiGfxID].unk18;
    sub_80528AC(&gfx);
}

// (91.64%) https://decomp.me/scratch/oLMqr
NONMATCH("asm/non_matching/game/sa1/ui/game2_1__sub_805D048.inc", void sub_805D048(u8 arg0))
{
    Task *task18;
    Task *task1C;
    Task *taskC;
    Task *task24;
    Task *task10;
    Task *task14;
    Task *t;
    u32 sp20;
    s32 sp24;
    Task *task20;
    Game_2_1_2C *temp_r0_10;
    Game_2_1_34 *temp_r2;
    s32 var_r8;
    u16 temp_sl;
    u16 var_r7;
    u8 temp_r0;
    u8 temp_sb;

    sub_80535FC();

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    if (gSpecialStageCollectedRings >= gSpecialStageTargetRings) {
        m4aSongNumStart(MUS_047);
        sp24 = 1;
        sp20 = 0x2710;
        if (GetBit(LOADED_SAVE->chaosEmeralds, gUnknown_08487134[gCurrentLevel])) {
            var_r8 = 1;
        } else {
            SetBit(LOADED_SAVE->chaosEmeralds, gUnknown_08487134[gCurrentLevel]);
            var_r8 = 0;
        }
    } else {
        m4aSongNumStart(MUS_SPECIAL_STAGE_RESULT_LOSE);
        var_r8 = 0;
        sp24 = 0;
        sp20 = 0;
    }
    temp_sb = LOADED_SAVE->chaosEmeralds;
    temp_sl = gSpecialStageCollectedRings;
    temp_r0 = gUnknown_0300507C + var_r8;
    SA2_LABEL(gUnknown_0300543C) = SA2_LABEL(gUnknown_0300543C) + temp_r0;

    INCREMENT_SCORE_A(sp20 + temp_sl * 100);

    if (sp20 > (temp_sl * 100)) {
        var_r7 = Div(sp20, 100);
    } else {
        var_r7 = temp_sl;
    }

    UiGfxStackInit();

    task1C = TaskCreate(Task_805D684, sizeof(Game_2_1_34), 0x2120U, 0U, NULL);
    temp_r2 = TASK_DATA(task1C);
    temp_r2->unk20 = 0;
    temp_r2->unk22 = var_r7;
    temp_r2->unk24 = 0;
    temp_r2->u.strc0.unkA = 0xF0;
    temp_r2->u.strc0.unkC = 0x7E;
    temp_r2->u.strc0.byteCount = 8;
    temp_r2->u.strc0.unk10 = 8;
    temp_r2->u.strc0.unk12 = 0xE;
    temp_r2->u.strc0.unk16 = 1;
    temp_r2->u.strc0.unk8 = 0xA;
    temp_r2->unk28 = sp24;
    temp_r2->unk29 = temp_sb;
    temp_r2->unk2A = temp_r0;
    temp_r2->unk26 = temp_sl;
    temp_r2->unk18 = sp20;
    temp_r2->unk1C = 0;

    task18 = TaskCreate(Task_805D720, sizeof(Game_2_1_34), 0x2120U, 0U, NULL);
    temp_r2 = TASK_DATA(task18);
    temp_r2->unk20 = 0;
    temp_r2->unk22 = var_r7;
    temp_r2->unk24 = 0;
    temp_r2->u.strc0.unkA = 0x100;
    temp_r2->u.strc0.unkC = 0x80;
    temp_r2->u.strc0.byteCount = 9;
    temp_r2->u.strc0.unk10 = 2;
    temp_r2->u.strc0.unk12 = 0xF;
    temp_r2->u.strc0.unk16 = 1;
    temp_r2->u.strc0.unk8 = 0;
    temp_r2->unk28 = sp24;
    temp_r2->unk29 = temp_sb;
    temp_r2->unk2A = temp_r0;
    temp_r2->unk26 = temp_sl;
    temp_r2->unk18 = sp20;
    temp_r2->unk1C = 0;

    taskC = TaskCreate(Task_805D8EC, sizeof(Game_2_1_34), 0x2120U, 0U, NULL);
    temp_r2 = TASK_DATA(taskC);
    temp_r2->unk20 = 0;
    temp_r2->unk22 = var_r7;
    temp_r2->unk24 = 0;
    temp_r2->u.strc0.unk0 = 0x100;
    temp_r2->u.strc0.unk2 = 0;
    temp_r2->u.strc0.unk4 = 0;
    temp_r2->u.strc0.unk6 = 0;
    temp_r2->u.strc0.unkA = 0x39;
    temp_r2->u.strc0.unkC = 0x49;
    temp_r2->u.strc0.byteCount = 3;
    temp_r2->u.strc0.unk10 = 3;
    temp_r2->u.strc0.unk12 = 0xE;
    temp_r2->u.strc0.unk16 = 1;
    temp_r2->u.strc0.unk8 = 0x18;
    temp_r2->unk28 = sp24;
    temp_r2->unk29 = temp_sb;
    temp_r2->unk2A = temp_r0;
    temp_r2->unk26 = temp_sl;
    temp_r2->unk18 = sp20;
    temp_r2->unk1C = 0;

    task24 = TaskCreate(Task_805DB04, sizeof(Game_2_1_34), 0x2120U, 0U, NULL);
    temp_r2 = TASK_DATA(task24);
    temp_r2->unk20 = 0;
    temp_r2->unk22 = var_r7;
    temp_r2->unk24 = 0;
    temp_r2->u.strc0.unk0 = 0x100;
    temp_r2->u.strc0.unk2 = 0;
    temp_r2->u.strc0.unk4 = 0;
    temp_r2->u.strc0.unk6 = 1;
    temp_r2->u.strc0.unkA = 0x39;
    temp_r2->u.strc0.unkC = 0x39;
    temp_r2->u.strc0.byteCount = 3;
    temp_r2->u.strc0.unk10 = 3;
    temp_r2->u.strc0.unk12 = 0xE;
    temp_r2->u.strc0.unk16 = 1;
    temp_r2->u.strc0.unk8 = 0x10;
    temp_r2->unk28 = sp24;
    temp_r2->unk29 = temp_sb;
    temp_r2->unk2A = temp_r0;
    temp_r2->unk26 = temp_sl;
    temp_r2->unk18 = sp20;
    temp_r2->unk1C = 0;

    task10 = TaskCreate(Task_805DD10, sizeof(Game_2_1_34), 0x2120U, 0U, NULL);
    temp_r2 = TASK_DATA(task10);
    temp_r2->unk20 = 0;
    temp_r2->unk22 = var_r7;
    temp_r2->unk24 = 0;
    temp_r2->u.strc0.unk0 = 0x100;
    temp_r2->u.strc0.unk2 = 0;
    temp_r2->u.strc0.unk4 = 0;
    temp_r2->u.strc0.unk6 = 2;
    temp_r2->u.strc0.unkA = 0x39;
    temp_r2->u.strc0.unkC = 0x39;
    temp_r2->u.strc0.byteCount = 3;
    temp_r2->u.strc0.unk10 = 3;
    temp_r2->u.strc0.unk12 = 0xE;
    temp_r2->u.strc0.unk16 = 1;
    temp_r2->u.strc0.unk8 = 8;
    temp_r2->unk28 = sp24;
    temp_r2->unk29 = temp_sb;
    temp_r2->unk2A = temp_r0;
    temp_r2->unk26 = temp_sl;
    temp_r2->unk18 = sp20;
    temp_r2->unk1C = 0;

    task14 = TaskCreate(Task_805DF2C, sizeof(Game_2_1_34), 0x2120U, 0U, NULL);
    temp_r2 = TASK_DATA(task14);
    temp_r2->unk20 = 0;
    temp_r2->unk22 = var_r7;
    temp_r2->unk24 = 0;
    temp_r2->u.strc0.unk0 = 0x100;
    temp_r2->u.strc0.unk2 = 0;
    temp_r2->u.strc0.unk4 = 0;
    temp_r2->u.strc0.unk6 = 3;
    temp_r2->u.strc0.unkA = 0x39;
    temp_r2->u.strc0.unkC = 0x39;
    temp_r2->u.strc0.byteCount = 3;
    temp_r2->u.strc0.unk10 = 3;
    temp_r2->u.strc0.unk12 = 0xE;
    temp_r2->u.strc0.unk16 = 1;
    temp_r2->u.strc0.unk8 = 0;
    temp_r2->unk28 = sp24;
    temp_r2->unk29 = temp_sb;
    temp_r2->unk2A = temp_r0;
    temp_r2->unk26 = temp_sl;
    temp_r2->unk18 = sp20;
    temp_r2->unk1C = 0;

    task20 = TaskCreate(sub_805E018, sizeof(Game_2_1_34), 0x2120U, 0U, NULL);
    temp_r2 = TASK_DATA(task20);
    temp_r2->unk20 = 0;
    temp_r2->unk22 = var_r7;
    temp_r2->unk24 = 0;
    temp_r2->u.strc0.unkA = 0;
    temp_r2->u.strc0.unkC = 0x29;
    temp_r2->u.strc0.byteCount = 1;
    temp_r2->u.strc0.unk10 = 4;
    temp_r2->u.strc0.unk12 = 0xD;
    temp_r2->u.strc0.unk16 = 1;
    temp_r2->u.strc0.unk8 = 0;
    temp_r2->unk28 = sp24;
    temp_r2->unk29 = temp_sb;
    temp_r2->unk2A = temp_r0;
    temp_r2->unk26 = temp_sl;
    temp_r2->unk18 = sp20;
    temp_r2->unk1C = 0;

    temp_r0_10 = TASK_DATA(TaskCreate(sub_805D4F0, sizeof(Game_2_1_2C), 0x2100U, 0U, TaskDestructor_805E1E4));
    temp_r0_10->unk28 = 0;
    temp_r0_10->unk2A = var_r7;
    temp_r0_10->task1C = task1C;
    temp_r0_10->task18 = task18;
    temp_r0_10->taskC = taskC;
    temp_r0_10->task24 = task24;
    temp_r0_10->task10 = task10;
    temp_r0_10->task14 = task14;
    temp_r0_10->task20 = task20;

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

    sub_805C994(arg0);
}
END_NONMATCH

// (91.30%) https://decomp.me/scratch/ayTm4
NONMATCH("asm/non_matching/game/sa1/ui/game2_1__sub_805D4F0.inc", void sub_805D4F0())
{
    u8 unused[4];
    s32 temp_r6;

    Game_2_1_2C *strc2C = TASK_DATA(gCurTask);
    Game_2_1_34 *subA = TASK_DATA(strc2C->task1C);
    Game_2_1_34 *subB = TASK_DATA(strc2C->task18);
    Game_2_1_34 *subC = TASK_DATA(strc2C->taskC);
    Game_2_1_34 *subD = TASK_DATA(strc2C->task24);
    Game_2_1_34 *subE = TASK_DATA(strc2C->task10);
    Game_2_1_34 *subF = TASK_DATA(strc2C->task14);
    Game_2_1_34 *subG = TASK_DATA(strc2C->task20);

    subA->unk20 = strc2C->unk28;
    subB->unk20 = strc2C->unk28;
    subC->unk20 = strc2C->unk28;
    subD->unk20 = strc2C->unk28;
    subE->unk20 = strc2C->unk28;
    subF->unk20 = strc2C->unk28;
    subG->unk20 = strc2C->unk28;

    if (strc2C->unk28 > 0xA9) {
        if (subF->unk26 != 0) {
            if (--subF->unk26 == 0) {
                subF->unk26 = 0; // lol
            }

            subD->unk1C += 100;
        }

        if (subE->unk18 != 0) {
            subE->unk18 -= 100;
            subD->unk1C += 100;
        }
    }

    if ((strc2C->unk2A + 615) < ++strc2C->unk28) {
        gPlayer.checkPointX -= 16;
        gPlayer.checkPointY -= 16;
        TasksDestroyAll();

        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();

        temp_r6 = gCourseTime;
        CreateGameStage();
        gPlayer.checkPointX = gSpecialStageReturnX;
        gPlayer.checkPointY = gSpecialStageReturnY;
        gPlayer.SA2_LABEL(unk99)[1] = 1;
        gCourseTime = temp_r6;
        return;
    }

    if (strc2C->unk28 == (strc2C->unk2A + 0xAA)) {
        if (subC->unk2A != 0) {
            m4aSongNumStart(0x9AU);
        } else {
            m4aSongNumStart(0x8DU);
        }
    }

    if ((strc2C->unk28 > 0xAA) && (strc2C->unk28 < (strc2C->unk2A + 0xAA)) && (Mod(strc2C->unk28, 4) == 0)) {
        m4aSongNumStart(0x8CU);
    }
}
END_NONMATCH

void Task_805D684(void)
{
    s16 unk20;
    s16 temp_r1;
    Game_2_1_34 *temp_r2;

    temp_r2 = TASK_DATA(gCurTask);

    unk20 = temp_r2->unk20;
    if (unk20 > ((u16)temp_r2->unk22 + 0x221)) {
        if (temp_r2->u.overB.qUnkA < -32) {
            temp_r2->u.overB.qUnkA += 32;
            if (temp_r2->u.strc0.byteCount != 0) {
                temp_r2->u.strc0.byteCount--;
            }
        }
        temp_r2->u.overB.qUnkA -= 0x1A;
    } else if (unk20 > 0x31) {
        temp_r2->u.strc0.unkC = 0x11U;
    } else if (unk20 > 0x21) {
        temp_r2->u.strc0.unkC -= 6;
    } else if (unk20 > 0x19) {
        temp_r2->u.overB.qUnkA = 0xFFF0U;
    } else if (unk20 > 0xF) {
        temp_r2->u.overB.qUnkA -= 0x1A;
        if (temp_r2->u.overB.qUnkA < -0x10) {
            temp_r2->u.overB.qUnkA = -0x10;
        }
    }
    sub_8052F78("        ", &temp_r2->u.overB);
}

void Task_805D720()
{
    s16 var_r0_2;
    s16 unk20;
    Game_2_1_34 *strc34;

    const char sp00[] = " !\"#$%&'() !\"#$%&'() !\"#$%&'()";

    strc34 = TASK_DATA(gCurTask);
    unk20 = strc34->unk20;
    if (unk20 > ((u16)strc34->unk22 + 0x221)) {
        strc34->u.overB.qUnkA -= 0x1C;
        if (strc34->u.overB.qUnkA < -0x1F) {
            if (strc34->u.overB.unkE != 0) {
                strc34->u.overB.unkE--;
            }
            strc34->u.overB.qUnkA += 0x20;
            strc34->unk24 = Mod(strc34->unk24 + 1, 10);
        }

        sub_8052F78((const char *)&sp00[strc34->unk24], &strc34->u.overB);
    } else if (unk20 > 49) {
        strc34->u.overB.unkC = 0x13;
        strc34->u.overB.qUnkA -= 2;

        if (strc34->u.overB.qUnkA < -0x1F) {
            strc34->u.overB.qUnkA += 0x20;
            strc34->unk24 = Mod(strc34->unk24 + 1, 0xA);
        }

        sub_8052F78((const char *)&sp00[strc34->unk24], &strc34->u.overB);
    } else if (unk20 > 33) {
        strc34->u.overB.unkC -= 6;
        strc34->u.overB.qUnkA -= 2;

        if (strc34->u.overB.qUnkA < -0x1F) {
            strc34->u.overB.qUnkA += 0x20;
            strc34->unk24 = Mod(strc34->unk24 + 1, 0xA);
        }

        sub_8052F78((const char *)&sp00[strc34->unk24], &strc34->u.overB);
    } else if (unk20 > 0x19) {
        strc34->u.overB.qUnkA -= 2;
        strc34->u.overB.unkE = 9;

        if (strc34->u.overB.qUnkA < -0x1F) {
            strc34->u.overB.qUnkA += 0x20;
            strc34->unk24 = Mod(strc34->unk24 + 1, 0xA);
        }

        sub_8052F78((const char *)&sp00[strc34->unk24], &strc34->u.overB);
    } else if (unk20 > 0xF) {
        strc34->u.overB.qUnkA -= 0x1C;
        if (strc34->u.overB.qUnkA < 0xF0) {
            strc34->u.overB.unkE = 9 - (strc34->u.overB.qUnkA >> 0x5);
            if (strc34->u.overB.qUnkA < -0x1F) {
                strc34->u.overB.qUnkA += 0x20;
                strc34->unk24 = Mod((u16)strc34->unk24 + 1, 0xA);
            }
            sub_8052F78((const char *)&sp00[strc34->unk24], &strc34->u.overB);
        }
    }
}

void sub_805D81C(void)
{
    s32 strc34_3;
    u16 temp_r7;
    u16 temp_r8;
    s16 var_r6;
    u8 var_r5;

    Game_2_1_34 *strc34 = TASK_DATA(gCurTask);

    temp_r7 = strc34->u.strc0.unkA;
    temp_r8 = strc34->u.strc0.unkC;
    if (strc34->unk20 <= (strc34->unk22 + 558)) {
        if (strc34->unk20 > (strc34->unk22 + 545)) {
            s32 v1 = (strc34->unk20 - 545);
            var_r6 = (v1 - strc34->unk22) * 0x1C;
        } else {
            var_r6 = 0;
        }
        sub_805C900(3);

        for (var_r5 = 0; var_r5 < 7; var_r5++) {
            if (strc34->unk2B[var_r5] != 0x20) {
                break;
            }
        }

        if (strc34->u.strc0.unk2 == 0x100) {
            strc34->u.strc0.unkC = 0x7EU;
            strc34->u.strc0.byteCount = 1;
            strc34->u.strc0.unkA = (179 - var_r6);
            sub_8052F78((const char *)&strc34->unk2B[var_r5], &strc34->u.overB);
        } else {
            s32 divResB = Div(strc34->u.strc0.unk2, 25);
            s32 divResA = (strc34->u.strc0.unk2 / 16);
            strc34->u.strc0.unkC = ((143 - divResA) - divResB);
            strc34->u.strc0.byteCount = 1;
            strc34->u.strc0.unkA = 0xA3U;
            sub_8052C84((const char *)&strc34->unk2B[var_r5], &strc34->u.strc0);
        }

        strc34->u.strc0.unkA = temp_r7;
        strc34->u.strc0.unkC = temp_r8;
    }
}

void Task_805D8EC()
{
    s16 temp_r0_2;
    s32 temp_r0_3;
    u16 temp_r0;
    u16 temp_r1_2;

    Game_2_1_34 *strc34 = TASK_DATA(gCurTask);
    s16 unk20 = strc34->unk20;
    u8 unk2A = strc34->unk2A;

    if (unk2A != 0) {
        if ((unk20 >= (strc34->unk22 + 0xAA))) {
            strc34->u.overB.unkE = 3;
            strc34->u.overB.unk10 = 3;
            strc34->u.overB.unk12 = 0xE;
            if (unk20 > (strc34->unk22 + 0x221)) {
                strc34->u.overB.unkC = 0x81;
                strc34->u.overB.qUnkA -= 0x1C;
                if (strc34->u.overB.qUnkA < -0x80) {
                    strc34->u.overB.unkE = 0;
                    strc34->u.overB.qUnkA = -0x80;
                } else {
                    sub_8052F78(")*+", &strc34->u.overB);
                }

                sub_805D81C();
            } else if (unk20 > 39) {
                strc34->u.strc0.unk2 += 0x20;

                if (strc34->u.strc0.unk2 >= 0x100) {
                    strc34->u.strc0.unk2 = 0x100;
                    strc34->u.strc0.unkA = 0x29;
                    strc34->u.strc0.unkC = 0x81;
                    sub_8052F78(")*+", &strc34->u.overB);
                } else {
                    strc34->u.strc0.unkA = 0x19U;
                    strc34->u.strc0.unkC = (0x8B - (strc34->u.strc0.unk2 >> 4));
                    sub_8052C84(")*+", &strc34->u.strc0);
                }

                sub_805D81C();
            } else if (unk20 > 0x21) {
                strc34->u.strc0.unkA = 0x19U;
                strc34->u.strc0.unkC = (0x8B - (strc34->u.strc0.unk2 >> 4));
                strc34->u.strc0.unk2 += 0x20;
                sub_8052C84(")*+", &strc34->u.strc0);
                sub_805D81C();
            }
        }
    }
}

void sub_805D9E4()
{
    s32 temp_r0;
    s16 temp_r2_2;
    s32 temp_r1_3;
    s32 var_r0;
    u16 temp_r1;
    u16 temp_r1_2;
    u16 temp_r2;
    u16 temp_r7;
    u16 temp_r8;
    s16 var_r6;
    u8 var_r5;

    Game_2_1_34 *strc34 = TASK_DATA(gCurTask);

    temp_r7 = strc34->u.strc0.unkA;
    temp_r8 = strc34->u.strc0.unkC;
    if (strc34->unk20 <= (strc34->unk22 + 558)) {
        if (strc34->unk20 > (strc34->unk22 + 545)) {
            s32 v = (strc34->unk20 - 545);
            var_r6 = (v - strc34->unk22) * 0x1C;
        } else {
            var_r6 = 0;
        }
        strc34->u.strc0.unk10 = 6;
        strc34->u.strc0.unk12 = 9;
        sub_805C900(2);
        for (var_r5 = 0; var_r5 < 7; var_r5++)

        {
            if (strc34->unk2B[var_r5] != 0x20)
                break;
        }

        if (strc34->u.strc0.unk2 == 0x100) {
            strc34->u.strc0.unkC = 0x6AU;
            if (strc34->unk1C != 0) {
                s32 v;
                s32 w = 7 - var_r5;
                strc34->u.strc0.byteCount = w;
                v = 195;
                v -= var_r6;
                strc34->u.strc0.unkA = (v - (w * 8));
                sub_8052F78((const char *)&strc34->unk2B[var_r5], &strc34->u.overB);
            } else {
                strc34->u.strc0.byteCount = 1;
                strc34->u.strc0.unkA = (0xBB - var_r6);
                sub_8052F78(" ", &strc34->u.overB);
            }
        } else {
            s32 divResB = Div((s32)strc34->u.strc0.unk2, 25);
            s32 divResA = (strc34->u.strc0.unk2 >> 4);
            strc34->u.strc0.unkC = ((0x77 - divResA) - divResB);
            if (strc34->unk1C != 0) {
                temp_r0 = 7 - var_r5;
                strc34->u.strc0.byteCount = temp_r0;
                strc34->u.strc0.unkA = (u16)(((6 - temp_r0) * 8) + 0x8F);
                sub_8052C84((const char *)&strc34->unk2B[var_r5], &strc34->u.strc0);
            } else {
                strc34->u.strc0.byteCount = 1;
                strc34->u.strc0.unkA = 0xB7U;
                sub_8052C84(" ", &strc34->u.strc0);
            }
        }
        strc34->u.strc0.unkA = temp_r7;
        strc34->u.strc0.unkC = temp_r8;
    }
}

void Task_805DB04(void)
{
    s16 temp_r0_2;
    s32 temp_r0_3;
    u16 temp_r0;
    u16 temp_r1_2;

    Game_2_1_34 *strc34 = TASK_DATA(gCurTask);
    s16 unk20 = strc34->unk20;
    u8 unk2A = strc34->unk2A;

    strc34->u.overB.unkE = 3;
    strc34->u.overB.unk10 = 3;
    strc34->u.overB.unk12 = 0xE;
    if (unk20 > (strc34->unk22 + 0x221)) {
        strc34->u.overB.unkC = 0x6D;
        strc34->u.overB.qUnkA -= 0x1C;
        if (strc34->u.overB.qUnkA < -0x80) {
            strc34->u.overB.unkE = 0;
            strc34->u.overB.qUnkA = -0x80;
        } else {
            sub_8052F78("&'(", &strc34->u.overB);
        }

        sub_805D9E4();
    } else if (unk20 > 45) {
        strc34->u.strc0.unk2 += 0x20;

        if (strc34->u.strc0.unk2 >= 0x100) {
            strc34->u.strc0.unk2 = 0x100;
            strc34->u.strc0.unkA = 0x29;
            strc34->u.strc0.unkC = 0x6D;
            sub_8052F78("&'(", &strc34->u.overB);
        } else {
            strc34->u.strc0.unkA = 0x19U;
            strc34->u.strc0.unkC = (0x77 - (strc34->u.strc0.unk2 >> 4));
            sub_8052C84("&'(", &strc34->u.strc0);
        }

        sub_805D9E4();
    } else if (unk20 > 0x27) {
        strc34->u.strc0.unkA = 0x19U;
        strc34->u.strc0.unkC = (0x77 - (strc34->u.strc0.unk2 >> 4));
        strc34->u.strc0.unk2 += 0x20;

        if (strc34->u.strc0.unk2 >= 0x100) {
            strc34->u.strc0.unk2 = 0x100;
        }

        sub_8052C84("&'(", &strc34->u.strc0);
        sub_805D9E4();
    }
}

void sub_805DBF0(void)
{
    s32 temp_r0;
    s16 temp_r2_2;
    s32 temp_r1_3;
    s32 var_r0;
    u16 temp_r1;
    u16 temp_r1_2;
    u16 temp_r2;
    u16 temp_r7;
    u16 temp_r8;
    s16 var_r6;
    u8 var_r5;

    Game_2_1_34 *strc34 = TASK_DATA(gCurTask);

    temp_r7 = strc34->u.strc0.unkA;
    temp_r8 = strc34->u.strc0.unkC;
    if (strc34->unk20 <= (strc34->unk22 + 558)) {
        if (strc34->unk20 > (strc34->unk22 + 545)) {
            s32 v = (strc34->unk20 - 545);
            var_r6 = (v - strc34->unk22) * 0x1C;
        } else {
            var_r6 = 0;
        }
        strc34->u.strc0.unk10 = 6;
        strc34->u.strc0.unk12 = 9;
        sub_805C900(1);
        for (var_r5 = 0; var_r5 < 7; var_r5++)

        {
            if (strc34->unk2B[var_r5] != 0x20)
                break;
        }

        if (strc34->u.strc0.unk2 == 0x100) {
            strc34->u.strc0.unkC = 0x58;
            if (strc34->unk18 != 0) {
                s32 v;
                s32 w = 7 - var_r5;
                strc34->u.strc0.byteCount = w;
                v = 195;
                v -= var_r6;
                strc34->u.strc0.unkA = (v - (w * 8));
                sub_8052F78((const char *)&strc34->unk2B[var_r5], &strc34->u.overB);
            } else {
                strc34->u.strc0.byteCount = 1;
                strc34->u.strc0.unkA = (0xBB - var_r6);
                sub_8052F78(" ", &strc34->u.overB);
            }
        } else {
            s32 divResB = Div((s32)strc34->u.strc0.unk2, 25);
            s32 divResA = (strc34->u.strc0.unk2 >> 4);
            strc34->u.strc0.unkC = ((0x65 - divResA) - divResB);
            if (strc34->unk18 != 0) {
                temp_r0 = 7 - var_r5;
                strc34->u.strc0.byteCount = temp_r0;
                strc34->u.strc0.unkA = (u16)(((6 - temp_r0) * 8) + 0x8F);
                sub_8052C84((const char *)&strc34->unk2B[var_r5], &strc34->u.strc0);
            } else {
                strc34->u.strc0.byteCount = 1;
                strc34->u.strc0.unkA = 0xB7U;
                sub_8052C84(" ", &strc34->u.strc0);
            }
        }
        strc34->u.strc0.unkA = temp_r7;
        strc34->u.strc0.unkC = temp_r8;
    }
}

void Task_805DD10(void)
{
    s16 temp_r0_2;
    s32 temp_r0_3;
    u16 temp_r0;
    u16 temp_r1_2;

    Game_2_1_34 *strc34 = TASK_DATA(gCurTask);
    s16 unk20 = strc34->unk20;

    if (strc34->unk28) {
        strc34->u.overB.unkE = 3;
        strc34->u.overB.unk10 = 3;
        strc34->u.overB.unk12 = 0xE;
        if (unk20 > (strc34->unk22 + 0x221)) {
            strc34->u.overB.unkC = 0x5B;
            strc34->u.overB.qUnkA -= 0x1C;
            if (strc34->u.overB.qUnkA < -0x80) {
                strc34->u.overB.unkE = 0;
                strc34->u.overB.qUnkA = -0x80;
            } else {
                sub_8052F78("#$%", &strc34->u.overB);
            }

            sub_805DBF0();
        } else if (unk20 > 51) {
            strc34->u.strc0.unk2 += 0x20;

            if (strc34->u.strc0.unk2 >= 0x100) {
                strc34->u.strc0.unk2 = 0x100;
                strc34->u.strc0.unkA = 0x29;
                strc34->u.strc0.unkC = 0x5B;
                sub_8052F78("#$%", &strc34->u.overB);
            } else {
                strc34->u.strc0.unkA = 0x19U;
                strc34->u.strc0.unkC = (0x65 - (strc34->u.strc0.unk2 >> 4));
                sub_8052C84("#$%", &strc34->u.strc0);
            }

            sub_805DBF0();
        } else if (unk20 > 0x2D) {
            strc34->u.strc0.unkA = 0x19U;
            strc34->u.strc0.unkC = (0x65 - (strc34->u.strc0.unk2 >> 4));
            strc34->u.strc0.unk2 += 0x20;

            if (strc34->u.strc0.unk2 >= 0x100) {
                strc34->u.strc0.unk2 = 0x100;
            }

            sub_8052C84("#$%", &strc34->u.strc0);
            sub_805DBF0();
        }
    }
}

void sub_805DE0C(void)
{
    s32 temp_r0;
    s16 temp_r2_2;
    s32 temp_r1_3;
    s32 var_r0;
    u16 temp_r1;
    u16 temp_r1_2;
    u16 temp_r2;
    u16 temp_r7;
    u16 temp_r8;
    s16 var_r6;
    u8 var_r5;

    Game_2_1_34 *strc34 = TASK_DATA(gCurTask);

    temp_r7 = strc34->u.strc0.unkA;
    temp_r8 = strc34->u.strc0.unkC;
    if (strc34->unk20 <= (strc34->unk22 + 558)) {
        if (strc34->unk20 > (strc34->unk22 + 545)) {
            s32 v = (strc34->unk20 - 545);
            var_r6 = (v - strc34->unk22) * 0x1C;
        } else {
            var_r6 = 0;
        }
        strc34->u.strc0.unk10 = 6;
        strc34->u.strc0.unk12 = 9;
        sub_805C900(0);
        for (var_r5 = 0; var_r5 < 7; var_r5++)

        {
            if (strc34->unk2B[var_r5] != 0x20)
                break;
        }

        if (strc34->u.strc0.unk2 == 0x100) {
            strc34->u.strc0.unkC = 0x46;
            if (strc34->unk26 != 0) {
                s32 v;
                s32 w = 7 - var_r5;
                strc34->u.strc0.byteCount = w;
                v = 195;
                v -= var_r6;
                strc34->u.strc0.unkA = (v - (w * 8));
                sub_8052F78((const char *)&strc34->unk2B[var_r5], &strc34->u.overB);
            } else {
                strc34->u.strc0.byteCount = 1;
                strc34->u.strc0.unkA = (0xBB - var_r6);
                sub_8052F78(" ", &strc34->u.overB);
            }
        } else {
            s32 divResB = Div((s32)strc34->u.strc0.unk2, 25);
            s32 divResA = (strc34->u.strc0.unk2 >> 4);
            strc34->u.strc0.unkC = ((0x53 - divResA) - divResB);
            if (strc34->unk26 != 0) {
                temp_r0 = 7 - var_r5;
                strc34->u.strc0.byteCount = temp_r0;
                strc34->u.strc0.unkA = (u16)(((6 - temp_r0) * 8) + 0x8F);
                sub_8052C84((const char *)&strc34->unk2B[var_r5], &strc34->u.strc0);
            } else {
                strc34->u.strc0.byteCount = 1;
                strc34->u.strc0.unkA = 0xB7U;
                sub_8052C84(" ", &strc34->u.strc0);
            }
        }
        strc34->u.strc0.unkA = temp_r7;
        strc34->u.strc0.unkC = temp_r8;
    }
}

void Task_805DF2C(void)
{
    s16 temp_r0_2;
    s32 temp_r0_3;
    u16 temp_r0;
    u16 temp_r1_2;

    Game_2_1_34 *strc34 = TASK_DATA(gCurTask);
    s16 unk20 = strc34->unk20;

    strc34->u.overB.unkE = 3;
    strc34->u.overB.unk10 = 3;
    strc34->u.overB.unk12 = 0xE;
    if (unk20 > (strc34->unk22 + 0x221)) {
        strc34->u.overB.unkC = 0x49;
        strc34->u.overB.qUnkA -= 0x1C;
        if (strc34->u.overB.qUnkA < -0x80) {
            strc34->u.overB.unkE = 0;
            strc34->u.overB.qUnkA = -0x80;
        } else {
            sub_8052F78(" !\"", &strc34->u.overB);
        }

        sub_805DE0C();
    } else if (unk20 > 57) {
        strc34->u.strc0.unk2 += 0x20;

        if (strc34->u.strc0.unk2 >= 0x100) {
            strc34->u.strc0.unk2 = 0x100;
            strc34->u.strc0.unkA = 0x29;
            strc34->u.strc0.unkC = 0x49;
            sub_8052F78(" !\"", &strc34->u.overB);
        } else {
            strc34->u.strc0.unkA = 0x19U;
            strc34->u.strc0.unkC = (0x53 - (strc34->u.strc0.unk2 >> 4));
            sub_8052C84(" !\"", &strc34->u.strc0);
        }

        sub_805DE0C();
    } else if (unk20 > 0x33) {
        strc34->u.strc0.unkA = 0x19U;
        strc34->u.strc0.unkC = (0x53 - (strc34->u.strc0.unk2 >> 4));
        strc34->u.strc0.unk2 += 0x20;

        if (strc34->u.strc0.unk2 >= 0x100) {
            strc34->u.strc0.unk2 = 0x100;
        }

        sub_8052C84(" !\"", &strc34->u.strc0);
        sub_805DE0C();
    }
}

void sub_805E018()
{
    s32 temp_r0;
    s32 temp_r1_2;
    s32 temp_r4;
    u16 temp_r1;
    u16 temp_r2;
    u16 var_r5;
    u8 *var_r0;
    u8 *var_r0_2;
    u8 *var_r0_3;
    u8 i;

    Game_2_1_34 *strc34 = TASK_DATA(gCurTask);

    temp_r1 = strc34->unk20;
    if (temp_r1 > (strc34->unk22 + 545)) {
        s32 v = temp_r1;
        s16 w;
        s32 x;
        v -= 545;
        var_r5 = (u16)(v - strc34->unk22);
        temp_r0 = (var_r5 * 0x1C) << 16;
        i = 0;
        var_r5 = temp_r0 >> 16;
        x = ((temp_r0 >>= 16) - 5);
        for (i = 0; i < 7; i++) {
            s32 var;
            strc34->u.overB.qUnkA = ((i << 5) - x);
            var = var_r5 - 5;
            if (((i << 5) - var) > -0x20) {
                if (GetBit(strc34->unk29, i)) {
                    strc34->u.overB.unk12 = (u16)(0xD - (i >> 1));
                    if (i & 1) {
                        sub_8052F78("!", &strc34->u.overB);
                    } else {
                        sub_8052F78(" ", &strc34->u.overB);
                    }
                } else {
                    strc34->u.overB.unk12 = 0xB;
                    sub_8052F78("\"", &strc34->u.overB);
                }
            }
        }
    } else if ((u32)temp_r1 > 0x86U) {
        for (i = 0; i < 7; i++) {
            strc34->u.overB.qUnkA = (i << 5) + 5;
            if ((strc34->unk29 >> i) & 1) {
                strc34->u.overB.unk12 = (13 - (i >> 1));
                if (i & 1) {
                    sub_8052F78("!", &strc34->u.overB);
                } else {
                    sub_8052F78(" ", &strc34->u.overB);
                }
            } else {
                strc34->u.overB.unk12 = 0xB;
                sub_8052F78("\"", &strc34->u.overB);
            }
        }
    } else if (temp_r1 > 0x31U) {
        for (i = 0; i < 7; i++) {
            var_r5 = (temp_r1 - 0x31);
            temp_r0 = i * 5;
            if (var_r5 >= temp_r0) {
                var_r5 = (var_r5 - temp_r0);
                if (var_r5 > 50) {
                    var_r5 = 50;
                }
                temp_r4 = Div(COS(0), 80);
                strc34->u.overB.qUnkA = ((i << 5) + (temp_r4 + 5)) - Div(SIN(var_r5 * 5), 80);
                if ((strc34->unk29 >> i) & 1) {
                    strc34->u.overB.unk12 = (u16)(0xD - (i >> 1));
                    if (i & 1) {
                        sub_8052F78("!", &strc34->u.overB);
                    } else {
                        sub_8052F78(" ", &strc34->u.overB);
                    }
                } else {
                    strc34->u.overB.unk12 = 0xB;
                    sub_8052F78("\"", &strc34->u.overB);
                }
            }
        }
    }
}

void TaskDestructor_805E1E4(Task *t) { }
