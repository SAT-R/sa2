#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "data/sa1/ui_graphics.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/sa1/save.h"
#include "game/sa1/stage/stage_ui.h"

typedef struct {
    s32 unk0;
    u8 unk4[8];
    s8 unkC;
    u8 unkD;
    u8 unkE;
    u8 unkF;
} VsRecord_10;

typedef struct {
    /* 0x00 */ StrcUi_805423C strc;
    /* 0x0C */ Sprite s;
    /* 0x3C */ struct Task *task3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
} VsRecord_48;

typedef struct {
    /* 0x00 */ VsRecord_10 records[10];
    /* 0xA0 */ GameOverB unkA0;
    /* 0xB8 */ Sprite s;
    /* 0xE8 */ s32 unkE8;
    /* 0xEC */ s32 unkEC;
} VsRecord_F0;

void SwapRecords(VsRecord_10 *a, VsRecord_10 *b);
void Task_VsRecordInit(void);
void Task_8060874(void);
void sub_806012C(void);
void CreatePlayerDataMenu(void);
void TaskDestructor_VsRecord(struct Task *t);

extern void sub_805321C(u8 *param0, GameOverB *param1);
extern void sub_805345C(u8 *param0, GameOverB *param1);

extern u16 gUnknown_0868B8D4[16];
extern u8 gUnknown_0868B8F4[0x7C0];
extern u8 gUnknown_0868C0B4[0x500];
extern u16 gUnknown_0868C5B4[16];
extern u8 gUnknown_0868C5D4[0x940];
extern u8 gUnknown_0868CF14[0x500];
extern u16 gUnknown_0868D414[16];
extern u8 gUnknown_0868D434[0x620];
extern u8 gUnknown_0868DA54[0x580];
extern u16 gUnknown_0868DFD4[16];
extern u8 gUnknown_0868DFF4[0x600];
extern u8 gUnknown_0868E5F4[0x580];

void sub_805FF38(VsRecord_10 *records, u8 arg1, s16 arg2, s16 arg3)
{
    s16 sp0;
    s16 sp4;
    s16 temp_r1_2;
    u8 var_r4;
    u8 var_r5;

    var_r4 = arg2;
    var_r5 = arg3;
    temp_r1_2 = (records[var_r4].unkC + records[var_r5].unkC) >> 1;
    while (var_r4 < var_r5) {
        if (arg1 == 0) {
            while (records[var_r4].unkC < temp_r1_2) {
                var_r4++;
            }

            while (records[var_r5].unkC > temp_r1_2) {
                var_r5--;
            }
        } else {
            while (records[var_r4].unkC > temp_r1_2) {
                var_r4++;
            }

            while (records[var_r5].unkC < temp_r1_2) {
                var_r5--;
            }
        }

        if (var_r4 < var_r5) {
            SwapRecords(&records[var_r4], &records[var_r5]);
            var_r4++;
            var_r5--;
        }
    }

    if (arg2 < --var_r4) {
        sub_805FF38(records, arg1, arg2, var_r4);
    }

    if (arg3 > ++var_r5) {
        sub_805FF38(records, arg1, var_r5, arg3);
    }
}

void SwapRecords(VsRecord_10 *a, VsRecord_10 *b)
{
    VsRecord_10 temp;
    u8 i;

    // Copy a -> temp
    temp.unk0 = a->unk0;
    temp.unkC = a->unkC;
    temp.unkD = a->unkD;
    temp.unkE = a->unkE;
    for (i = 0; i < ARRAY_COUNT(temp.unk4); i++) {
        temp.unk4[i] = a->unk4[i];
    }

    // Copy b -> a
    a->unk0 = b->unk0;
    a->unkC = b->unkC;
    a->unkD = b->unkD;
    a->unkE = b->unkE;
    for (i = 0; i < ARRAY_COUNT(a->unk4); i++) {
        a->unk4[i] = b->unk4[i];
    }

    // Copy temp -> b
    b->unk0 = temp.unk0;
    b->unkC = temp.unkC;
    b->unkD = temp.unkD;
    b->unkE = temp.unkE;
    for (i = 0; i < ARRAY_COUNT(b->unk4); i++) {
        b->unk4[i] = temp.unk4[i];
    }
}

void sub_806012C(void)
{
    SaveGame *save = LOADED_SAVE;
    Strc_80528AC sp00;

    UiGfxStackInit();

    if (save->uiLanguage == 0) {
        sp00.uiGfxID = UIGFX_OPTIONS;
        sp00.unk2B = 0;
        sp00.tiles = gUnknown_0868B8F4;
        sp00.tilesSize = sizeof(gUnknown_0868B8F4);
        sp00.palette = gUnknown_0868B8D4;
        sp00.paletteSize = sizeof(gUnknown_0868B8D4);
        sp00.layout = gUnknown_0868C0B4;
        sp00.layoutSize = sizeof(gUnknown_0868C0B4);
        sp00.unk28 = 0;
        sp00.unk29 = 0;
        sp00.unk2A = 21;
        sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
        sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
        sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
        sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
        sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
        sub_80528AC(&sp00);

        sp00.uiGfxID = UIGFX_OPTIONS;
        sp00.unk2B = 01;
        sp00.tiles = gUnknown_0868D434;
        sp00.tilesSize = sizeof(gUnknown_0868D434);
        sp00.palette = gUnknown_0868D414;
        sp00.paletteSize = sizeof(gUnknown_0868D414);
        sp00.layout = gUnknown_0868DA54;
        sp00.layoutSize = sizeof(gUnknown_0868DA54);
        sp00.unk28 = 1;
        sp00.unk29 = 1;
        sp00.unk2A = 21;
        sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
        sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
        sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
        sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
        sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
        sub_80528AC(&sp00);
    } else {
        sp00.uiGfxID = UIGFX_OPTIONS;
        sp00.unk2B = 0;
        sp00.tiles = gUnknown_0868C5D4;
        sp00.tilesSize = sizeof(gUnknown_0868C5D4);
        sp00.palette = gUnknown_0868C5B4;
        sp00.paletteSize = sizeof(gUnknown_0868C5B4);
        sp00.layout = gUnknown_0868CF14;
        sp00.layoutSize = sizeof(gUnknown_0868CF14);
        sp00.unk28 = 0;
        sp00.unk29 = 0;
        sp00.unk2A = 21;
        sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
        sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
        sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
        sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
        sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
        sub_80528AC(&sp00);

        sp00.uiGfxID = UIGFX_OPTIONS;
        sp00.unk2B = 1;
        sp00.tiles = gUnknown_0868DFF4;
        sp00.tilesSize = sizeof(gUnknown_0868DFF4);
        sp00.palette = gUnknown_0868DFD4;
        sp00.paletteSize = sizeof(gUnknown_0868DFD4);
        sp00.layout = gUnknown_0868E5F4;
        sp00.layoutSize = sizeof(gUnknown_0868E5F4);
        sp00.unk28 = 1;
        sp00.unk29 = 1;
        sp00.unk2A = 21;
        sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
        sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
        sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
        sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
        sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
        sub_80528AC(&sp00);
    }

    sp00.uiGfxID = UIGFX_ASCII_CHARS;
    sp00.unk2B = 2;
    sp00.tiles = gUiGraphics[0].tiles;
    sp00.palette = gUiGraphics[0].palette;
    sp00.vramC = OBJ_VRAM0;
    sp00.tilesSize = 0x1B80;
    sp00.paletteSize = 0x20;
    sp00.unk28 = 2;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[0].unk8;
    sp00.unk0.unk8 = gUiGraphics[0].unkC;
    sp00.unk0.unk9 = gUiGraphics[0].unk10;
    sp00.unk0.unkA = gUiGraphics[0].unk14;
    sp00.unk0.unkB = gUiGraphics[0].unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = 60;
    sp00.unk2B = 3;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.vramC = OBJ_VRAM0;
    sp00.tilesSize = 0x20;
    sp00.paletteSize = 0x20;
    sp00.unk28 = 2;
    sp00.unk2A = 12;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);
}

void CreateVsRecord()
{
    Sprite *s;
    VsRecord_10 *temp_r2;
    VsRecord_10 *temp_r5;
    s32 temp_r1;
    struct Task *t;
    u8 i, j;

    VsRecord_48 *record48;
    VsRecord_F0 *recordF0;

    sub_80535FC();
    gDispCnt = 0x1340;
    m4aSongNumStop(0x30U);
    m4aSongNumStart(0xAU);
    gBgCntRegs[0] = 0x1F00;
    gBgCntRegs[1] = 0x1E07;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    sub_806012C();

    record48 = TASK_DATA(TaskCreate(Task_VsRecordInit, sizeof(VsRecord_48), 0x2000U, 0U, TaskDestructor_VsRecord));
    record48->unk40 = 0;
    record48->unk44 = 0;
    record48->strc.unk0 = 0;
    record48->strc.unk2 = 1;
    record48->strc.unk4 = 2;
    record48->strc.unk6 = 0;
    record48->strc.unk8 = 0x100;
    record48->strc.unkA = 8;

    t = TaskCreate(Task_8060874, sizeof(VsRecord_F0), 0x2030U, 0U, NULL);
    recordF0 = TASK_DATA(t);
    recordF0->unkEC = 0;
    recordF0->unkA0.qUnkA = 0;
    recordF0->unkA0.unkC = 0;
    recordF0->unkA0.unkE = 0;
    recordF0->unkA0.unk10 = 2;
    recordF0->unkA0.unk12 = 2;
    recordF0->unkA0.unk16 = 1;
    recordF0->unkA0.unk8 = 0;
    recordF0->unkE8 = 0;
    record48->task3C = t;

    s = &recordF0->s;
    s->graphics.dest = (void *)0x06017080;
    s->graphics.anim = 0x368;
    s->variant = 0;
    s->oamFlags = 0;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &record48->s;
    s->graphics.dest = (void *)0x06016400;
    s->graphics.anim = 0x2E9;
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

    // TODO: There's some inconsistency regarding the types here...
    DmaCopy16(3, LOADED_SAVE->multiplayerScores, recordF0, 0xA0);

    for (i = 0; i < 9; i++) {
        for (j = i + 1; j < 10; j++) {
            temp_r5 = &recordF0->records[i];
            temp_r2 = &recordF0->records[j];

            if (temp_r5->unkC < temp_r2->unkC) {
                SwapRecords(temp_r5, temp_r2);
            }
        }
    }

    sub_805423C(&record48->strc);
    m4aSongNumStart(0xAU);
}

void Task_VsRecordInit()
{
    Sprite *s;
    s32 temp_r0;
    s32 temp_r2;
    u32 var_r0;
    u32 var_r1;
    s32 var_r5;
    s32 unk40;

    VsRecord_48 *record48 = TASK_DATA(gCurTask);
    VsRecord_F0 *recordF0 = TASK_DATA(record48->task3C);

    var_r5 = record48->unk44;
    unk40 = record48->unk40;
    unk40++;
    if ((var_r5 != 0) && (DPAD_UP & gInput)) {
        var_r1 = var_r5 - Q(1);
        var_r0 = I(var_r1);
        var_r5 = 0;
        if (var_r0 != 0) {
            var_r5 = var_r1;
        }
    } else if (((u32)var_r5 < 0x4200) && (DPAD_DOWN & gInput)) {
        var_r1 = var_r5 + Q(1);
        var_r0 = I(var_r1);
        var_r5 = 0x4200;
        if (var_r0 < 0x4200) {
            var_r5 = var_r1;
        }
    }

    record48->unk40 = unk40;
    recordF0->unkE8 = unk40;
    record48->unk44 = var_r5;
    recordF0->unkEC = var_r5;
    sub_805423C(&record48->strc);

    if (record48->strc.unk6 > 0x1800) {
        if ((B_BUTTON & gPressedKeys) && (record48->strc.unk4 != 1)) {
            m4aSongNumStart(0x6BU);
            record48->strc.unk4 = 1;
            record48->strc.unk6 = 0x2000 - (u16)record48->strc.unk6;
            m4aSongNumStart(0x6BU);
        }
        if ((record48->strc.unk6 > 0x1800) && (record48->strc.unk4 == 1)) {
            m4aSongNumStop(10);
            TaskDestroy(record48->task3C);
            TaskDestroy(gCurTask);
            gBgSprites_Unknown1[1] = 0;
            gBgSprites_Unknown2[1][0] = 0;
            gBgSprites_Unknown2[1][1] = 0;
            gBgSprites_Unknown2[1][2] = 0xFF;
            gBgSprites_Unknown2[1][3] = 0x20;
            gBgSprites_Unknown1[2] = 0;
            gBgSprites_Unknown2[2][0] = 0;
            gBgSprites_Unknown2[2][1] = 0;
            gBgSprites_Unknown2[2][2] = -1;
            gBgSprites_Unknown2[2][3] = 0x20;
            CreatePlayerDataMenu();
            return;
        }
    }

    s = &record48->s;
    UpdateSpriteAnimation(s);
    s->x = 233;
    if (var_r5 != 0) {
        s->y = 70;
        s->frameFlags &= 0xFFFFF7FF;
        DisplaySprite(s);
    }
    if (var_r5 != 0x4200) {
        s->y = 138;
        s->frameFlags |= 0x800;
        DisplaySprite(s);
    }
}

// (80.92%) https://decomp.me/scratch/QyXdU
NONMATCH("asm/non_matching/game/sa1/ui/vs_record__Task_8060874.inc", void Task_8060874())
{
    Sprite *s;
    u32 temp_r0;
    u8 temp_r0_5;
    u8 var_r4;
    u8 var_r5;
    u8 subroutine_arg0[2];
    s32 unkEC;
    SaveGame *save = LOADED_SAVE;

    VsRecord_F0 *recordF0 = TASK_DATA(gCurTask);

    unkEC = recordF0->unkEC;
    temp_r0 = unkEC;
    gBgScrollRegs[1][1] = ((temp_r0 >> 8) - 0x30) & 0x1FF;
    recordF0->unkA0.unkE = 1;

    for (var_r5 = 0; var_r5 < 6; var_r5++) {
        recordF0->unkA0.qUnkA = (var_r5 * 8) + 0x1B;
        recordF0->unkA0.unkC = 32;

        if ((save->playerName[var_r5] >= 112) && (save->playerName[var_r5] < 138)) {
            recordF0->unkA0.unkC = 40;
        }
        sub_805321C(&save->playerName[var_r5], &recordF0->unkA0);
    }

    recordF0->unkA0.unkC = 0x20;
    if (save->unk425 > 9U) {
        subroutine_arg0[0] = (Div(save->unk425, 10) + 48);
        subroutine_arg0[1] = (Mod(save->unk425, 10) + 48);
        if (save->uiLanguage != 0) {
            recordF0->unkA0.qUnkA = 0x5B;
        } else {
            recordF0->unkA0.qUnkA = 0x59;
        }
        recordF0->unkA0.unkE = 2;
        sub_805321C(subroutine_arg0, &recordF0->unkA0);
    } else {
        recordF0->unkA0.unkE = 1;
        subroutine_arg0[0] = (save->unk425 + 48);
        if (save->uiLanguage != 0) {
            recordF0->unkA0.qUnkA = 0x63;
        } else {
            recordF0->unkA0.qUnkA = 0x61;
        }

        if (save->unk425 < 2) {
            subroutine_arg0[1] = 0x8A;
            sub_805321C(subroutine_arg0, &recordF0->unkA0);
            recordF0->unkA0.qUnkA = 0x7E;
            sub_805321C(subroutine_arg0 + 1, &recordF0->unkA0);
        } else {
            subroutine_arg0[0] = (s8)(save->unk425 + 48);
            sub_805321C(subroutine_arg0, &recordF0->unkA0);
        }
    }
    if (save->unk426 > 9U) {
        recordF0->unkA0.unkE = 2;
        subroutine_arg0[0] = Div(save->unk426, 0xA) + 48;
        subroutine_arg0[1] = Mod(save->unk426, 0xA) + 48;
        if (save->uiLanguage != 0) {
            recordF0->unkA0.qUnkA = 0x88;
        } else {
            recordF0->unkA0.qUnkA = 0x89;
        }

        sub_805321C(subroutine_arg0, &recordF0->unkA0);
    } else {
        recordF0->unkA0.unkE = 1;
        if (save->uiLanguage != 0) {
            recordF0->unkA0.qUnkA = 0x90;
        } else {
            recordF0->unkA0.qUnkA = 0x91;
        }
        subroutine_arg0[0] = save->unk426 + 48;
        if ((save->unk426 <= 1U) && (save->uiLanguage != 0)) {
            s = &recordF0->s;
            s->x = 152;
            s->y = 32;
            s->frameFlags &= ~0x800;
            DisplaySprite(s);
            subroutine_arg0[1] = 0x8A;
            sub_805321C(subroutine_arg0, &recordF0->unkA0);
            recordF0->unkA0.qUnkA = 0xB1;
            sub_805321C(&subroutine_arg0[1], &recordF0->unkA0);
        } else {
            sub_805321C(subroutine_arg0, &recordF0->unkA0);
        }
    }

    if (save->unk427 > 9U) {
        recordF0->unkA0.unkE = 2;
        subroutine_arg0[0] = (Div(save->unk427, 10) + 48);
        subroutine_arg0[1] = (Mod(save->unk427, 10) + 48);
        recordF0->unkA0.qUnkA = 0xB9;
        sub_805321C(&subroutine_arg0[0], &recordF0->unkA0);
    } else {
        recordF0->unkA0.unkE = 1;
        recordF0->unkA0.qUnkA = 0xC1;
        subroutine_arg0[0] = (save->unk427 + 48);
        if (save->unk427 < 2) {
            subroutine_arg0[1] = 0x8A;
            sub_805321C(subroutine_arg0, &recordF0->unkA0);
            recordF0->unkA0.qUnkA = 0xE2;
            sub_805321C(&subroutine_arg0[1], &recordF0->unkA0);
        } else {
            sub_805321C(&subroutine_arg0[0], &recordF0->unkA0);
        }
    }

    for (var_r5 = 0; var_r5 < 9; var_r5++) {
        s32 v = (var_r5 + (unkEC >> 12));
        recordF0->unkA0.unkE = 1;

        for (var_r4 = 0; var_r4 < 6; var_r4++) {
            recordF0->unkA0.qUnkA = (var_r4 * 8) + 60;
            recordF0->unkA0.unkC = ((var_r5 * 0x10) - (((unkEC >> 8) & 0xF) - 0x38));
            if ((u8)(recordF0->records[v].unk4[var_r4] - 112) < 26) {
                recordF0->unkA0.unkC = ((var_r5 * 0x10) - (((unkEC >> 8) & 0xF) - 0x38)) + 8;
            }

            sub_805345C(&recordF0->records[v].unk4[var_r4], &recordF0->unkA0);
        }
        recordF0->unkA0.unkC = (var_r5 * 0x10) - (((unkEC >> 8) & 0xF) - 56);
        temp_r0_5 = recordF0->records[v].unkC;
        if (temp_r0_5 == 0xFF) {
            subroutine_arg0[0] = 32;
            subroutine_arg0[1] = 48;
        } else {
            if (recordF0->records[v].unkC > 9U) {
                subroutine_arg0[0] = Div((u8)recordF0->records[v].unkC, 10) + 48;
                subroutine_arg0[1] = Mod((u8)recordF0->records[v].unkC, 10) + 48;
            } else {
                subroutine_arg0[0] = 32;
                subroutine_arg0[1] = (u8)recordF0->records[v].unkC + 48;
            }
        }
        recordF0->unkA0.qUnkA = Q(0.5);
        recordF0->unkA0.unkE = 2;
        sub_805345C(subroutine_arg0, &recordF0->unkA0);

        if (recordF0->records[v].unkD > 9U) {
            subroutine_arg0[0] = Div(recordF0->records[v].unkD, 10) + 48;
            subroutine_arg0[1] = Mod(recordF0->records[v].unkD, 10) + 48;
        } else {
            subroutine_arg0[0] = 0x20;
            subroutine_arg0[1] = recordF0->records[v].unkD + 48;
        }
        recordF0->unkA0.qUnkA = Q(160. / 256.);
        sub_805345C(subroutine_arg0, &recordF0->unkA0);

        if (recordF0->records[v].unkE > 9U) {
            subroutine_arg0[0] = Div(recordF0->records[v].unkE, 10) + 48;
            subroutine_arg0[1] = Mod(recordF0->records[v].unkE, 10) + 48;
        } else {
            subroutine_arg0[0] = 0x20;
            subroutine_arg0[1] = recordF0->records[v].unkE + 0x30;
        }
        recordF0->unkA0.qUnkA = 0xC0;
        sub_805345C(subroutine_arg0, &recordF0->unkA0);
    }
}
END_NONMATCH

void TaskDestructor_VsRecord(struct Task *t) { }
