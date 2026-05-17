#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/menus/title_screen.h"
#include "game/sa1/save.h"
#include "game/sa1/special_stage/main.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/stage.h"
#include "game/sa1/stage/stage_ui.h"
#include "data/sa1/ui_graphics.h"

#include "constants/sa1/animations.h"

typedef struct {
    union {
        // TODO: This union might actually be their shared global type?
        GameOverB overB;
        Strc_8052C84 strc0;
    } u;
    s16 unk18;
    u16 unk1A;
} Game_2_0_Sub;

typedef struct {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    u8 unkA;
    struct Task *taskC; // -> Game_2_0_Sub
    struct Task *task10; // -> Game_2_0_Sub
    struct Task *task14; // -> Game_2_0_Sub
    s16 unk18;
    u8 unk1A;
} Game_2_0;

void sub_805BC94(u16 arg0);
void sub_805C448(u8 arg0);
void Task_805C594(void);
void Task_805C6B0(void);
void Task_805C740(void);
void Task_805C83C(void);
void TaskDestructor_nullsub_805C8FC(struct Task *t);

// (89.77%) https://decomp.me/scratch/ZhMAK
NONMATCH("asm/non_matching/game/sa1/ui/game2_0__sub_805BC94.inc", void sub_805BC94(u16 arg0))
{
    Strc_80528AC sp00;
    s32 sp34;
    s32 sp38;
    u8 temp_r0_2;
    u8 temp_r5;

    if ((Div(arg0, 100) << 0x18) != 0) {
        sp38 = 3;
    } else {
        temp_r0_2 = Div(arg0, 10);

        if (temp_r0_2 != 0) {
            sp38 = 2;
        } else {
            sp38 = 1;
        }
    }

    sp00.uiGfxID = 50;
    sp00.unk2B = 4;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.tilesSize = 80 * TILE_SIZE_4BPP;
    sp00.paletteSize = 0x20;
    sp00.unk28 = 6;
    sp00.vramC = OBJ_VRAM0 + 0x5DA0;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = UIGFX_STGRESULT_HEADLINE_BACK;
    sp00.unk2B = 8;
    sp00.tiles = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].tiles;
    sp00.palette = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].palette;
    sp00.tilesSize = 16 * TILE_SIZE_4BPP;
    sp00.paletteSize = 0x20;
    sp00.unk28 = 6;
    sp00.vramC = OBJ_VRAM0 + 0x77A0;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk8);
    sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unkC);
    sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk10);
    sp00.unk0.unkA = *(&gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk14);
    sp00.unk0.unkB = *(&gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk18);
    sub_80528AC(&sp00);

    if (sp38 == 1) {
        sp00.uiGfxID = 47;
    } else if (sp38 == 2) {
        sp00.uiGfxID = 48;
    } else {
        sp00.uiGfxID = 49;
    }

    sp00.unk2B = 2;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.tilesSize = 0xE00;
    sp00.paletteSize = 0x20;
    sp00.unk28 = 6;
    sp00.vramC = OBJ_VRAM0 + 0x67A0;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);

    switch (sp38) {
        case 3: {
            sp34 = 1;
            temp_r5 = (u8)Div(arg0, 100);
            arg0 = (s32)(u16)Mod(arg0, 100);
            if (temp_r5 != 0) {
                sp34 = 0;
                sp00.uiGfxID = UIGFX_TIMER_DIGITS;
                sp00.unk2B = sp38;
                sp00.tiles = *(&gUiGraphics[UIGFX_TIMER_DIGITS].tiles) + (temp_r5 << 7);
                sp00.palette = *(&gUiGraphics[UIGFX_TIMER_DIGITS].palette);
                sp00.vramC = OBJ_VRAM0 + 0x69E0;
                sp00.tilesSize = 0x40;
                sp00.paletteSize = 0x20;
                sp00.unk28 = 6;
                sp00.unk2A = 13;
                sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk8);
                sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unkC);
                sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk10);
                sp00.unk0.unkA = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk14);
                sp00.unk0.unkB = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk18);
                sub_80528AC(&sp00);

                sp00.uiGfxID = UIGFX_TIMER_DIGITS;
                sp00.unk2B = sp38;
                sp00.tiles = *(&gUiGraphics[UIGFX_TIMER_DIGITS].tiles) + (temp_r5 << 7) + 0x40;
                sp00.palette = *(&gUiGraphics[UIGFX_TIMER_DIGITS].palette);
                sp00.vramC = OBJ_VRAM0 + 0x6A60;
                sp00.tilesSize = 2 * TILE_SIZE_4BPP;
                sp00.paletteSize = 0x20;
                sp00.unk28 = 6;
                sp00.unk2A = 13;
                sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk8);
                sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unkC);
                sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk10);
                sp00.unk0.unkA = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk14);
                sp00.unk0.unkB = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk18);
                sub_80528AC(&sp00);
            }

            temp_r5 = (u8)Div(arg0, 10);
            arg0 = (s32)(u16)Mod(arg0, 10);
            if ((temp_r5 != 0) || (sp34 == 0)) {
                sp34 = 0;
                sp00.uiGfxID = UIGFX_TIMER_DIGITS;
                sp00.unk2B = sp38;
                sp00.tiles = *(&gUiGraphics[UIGFX_TIMER_DIGITS].tiles) + (temp_r5 << 7);
                sp00.palette = *(&gUiGraphics[UIGFX_TIMER_DIGITS].palette);
                sp00.vramC = OBJ_VRAM0 + 0x6BA0;
                sp00.tilesSize = 2 * TILE_SIZE_4BPP;
                sp00.paletteSize = 0x20;
                sp00.unk28 = 6;
                sp00.unk2A = 13;
                sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk8);
                sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unkC);
                sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk10);
                sp00.unk0.unkA = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk14);
                sp00.unk0.unkB = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk18);
                sub_80528AC(&sp00);

                sp00.uiGfxID = UIGFX_TIMER_DIGITS;
                sp00.unk2B = sp38;
                sp00.tiles = *(&gUiGraphics[UIGFX_TIMER_DIGITS].tiles) + (temp_r5 << 7) + 0x40;
                sp00.palette = *(&gUiGraphics[UIGFX_TIMER_DIGITS].palette);
                sp00.vramC = OBJ_VRAM0 + 0x6C20;
                sp00.tilesSize = 2 * TILE_SIZE_4BPP;
                sp00.paletteSize = 0x20;
                sp00.unk28 = 6;
                sp00.unk2A = 13;
                sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk8);
                sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unkC);
                sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk10);
                sp00.unk0.unkA = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk14);
                sp00.unk0.unkB = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk18);
                sub_80528AC(&sp00);
            }

            temp_r5 = (u8)arg0;
            if ((temp_r5 != 0) || (sp34 == 0)) {
                sp00.uiGfxID = UIGFX_TIMER_DIGITS;
                sp00.unk2B = 3;
                sp00.tiles = *(&gUiGraphics[UIGFX_TIMER_DIGITS].tiles) + (temp_r5 << 7);
                sp00.palette = *(&gUiGraphics[UIGFX_TIMER_DIGITS].palette);
                sp00.vramC = OBJ_VRAM0 + 0x6BE0;
                sp00.tilesSize = 2 * TILE_SIZE_4BPP;
                sp00.paletteSize = 0x20;
                sp00.unk28 = 6;
                sp00.unk2A = 13;
                sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk8);
                sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unkC);
                sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk10);
                sp00.unk0.unkA = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk14);
                sp00.unk0.unkB = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk18);
                sub_80528AC(&sp00);

                sp00.uiGfxID = UIGFX_TIMER_DIGITS;
                sp00.unk2B = 3;
                sp00.tiles = gUiGraphics[UIGFX_TIMER_DIGITS].tiles + (temp_r5 << 7) + 0x40;
                sp00.palette = gUiGraphics[UIGFX_TIMER_DIGITS].palette;
                sp00.vramC = OBJ_VRAM0 + 0x6C60;
                sp00.tilesSize = 2 * TILE_SIZE_4BPP;
                sp00.paletteSize = 0x20;
                sp00.unk28 = 6;
                sp00.unk2A = 13;
                sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk8);
                sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unkC);
                sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk10);
                sp00.unk0.unkA = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk14);
                sp00.unk0.unkB = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk18);
                sub_80528AC(&sp00);
            }
        } break;

        case 2: {
            temp_r5 = Div(arg0, 0xA);
            arg0 = Mod(arg0, 0xA);

            sp00.uiGfxID = UIGFX_TIMER_DIGITS;
            sp00.unk2B = 3;
            sp00.tiles = *(&gUiGraphics[UIGFX_TIMER_DIGITS].tiles) + (temp_r5 << 7);
            sp00.palette = *(&gUiGraphics[UIGFX_TIMER_DIGITS].palette);
            sp00.vramC = OBJ_VRAM0 + 0x69E0;
            sp00.tilesSize = 0xE00;
            sp00.paletteSize = 0x20;
            sp00.unk28 = 6;
            sp00.unk2A = 13;
            sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk8);
            sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unkC);
            sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk10);
            sp00.unk0.unkA = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk14);
            sp00.unk0.unkB = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk18);
            sub_80528AC(&sp00);

            sp00.uiGfxID = UIGFX_TIMER_DIGITS;
            sp00.unk2B = 3;
            sp00.tiles = *(&gUiGraphics[UIGFX_TIMER_DIGITS].tiles) + (temp_r5 << 7) + 0x40;
            sp00.palette = *(&gUiGraphics[UIGFX_TIMER_DIGITS].palette);
            sp00.vramC = OBJ_VRAM0 + 0x6A60;
            sp00.tilesSize = 0x40;
            sp00.paletteSize = 0x20;
            sp00.unk28 = 6;
            sp00.unk2A = 13;
            sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk8);
            sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unkC);
            sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk10);
            sp00.unk0.unkA = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk14);
            sp00.unk0.unkB = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk18);
            sub_80528AC(&sp00);

            sp00.uiGfxID = UIGFX_TIMER_DIGITS;
            sp00.unk2B = 3;
            sp00.tiles = *(&gUiGraphics[UIGFX_TIMER_DIGITS].tiles) + (arg0 << 7);
            sp00.palette = *(&gUiGraphics[UIGFX_TIMER_DIGITS].palette);
            sp00.vramC = OBJ_VRAM0 + 0x6BA0;
            sp00.tilesSize = 0x40;
            sp00.paletteSize = 0x20;
            sp00.unk28 = 6;
            sp00.unk2A = 13;
            sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk8);
            sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unkC);
            sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk10);
            sp00.unk0.unkA = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk14);
            sp00.unk0.unkB = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk18);
            sub_80528AC(&sp00);

            sp00.uiGfxID = UIGFX_TIMER_DIGITS;
            sp00.unk2B = 3;
            sp00.tiles = *(&gUiGraphics[UIGFX_TIMER_DIGITS].tiles) + (arg0 << 7) + 0x40;
            sp00.palette = *(&gUiGraphics[UIGFX_TIMER_DIGITS].palette);
            sp00.vramC = OBJ_VRAM0 + 0x6c20;
            sp00.tilesSize = 0x40;
            sp00.paletteSize = 0x20;
            sp00.unk28 = 6;
            sp00.unk2A = 13;
            sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk8);
            sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unkC);
            sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk10);
            sp00.unk0.unkA = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk14);
            sp00.unk0.unkB = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk18);
            sub_80528AC(&sp00);

        } break;

        default: {
            u8 v = arg0;

            sp00.uiGfxID = UIGFX_TIMER_DIGITS;
            sp00.unk2B = 3;
            sp00.tiles = *(&gUiGraphics[UIGFX_TIMER_DIGITS].tiles) + (v << 7);
            sp00.palette = *(&gUiGraphics[UIGFX_TIMER_DIGITS].palette);
            sp00.vramC = OBJ_VRAM0 + 0x69E0;
            sp00.tilesSize = 0x40;
            sp00.paletteSize = 0x20;
            sp00.unk28 = 6;
            sp00.unk2A = 13;
            sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk8);
            sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unkC);
            sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk10);
            sp00.unk0.unkA = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk14);
            sp00.unk0.unkB = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk18);
            sub_80528AC(&sp00);

            sp00.uiGfxID = UIGFX_TIMER_DIGITS;
            sp00.unk2B = 3;
            sp00.tiles = *(&gUiGraphics[UIGFX_TIMER_DIGITS].tiles) + (v << 7) + 0x40;
            sp00.palette = *(&gUiGraphics[UIGFX_TIMER_DIGITS].palette);
            sp00.vramC = OBJ_VRAM0 + 0x6A60;
            sp00.tilesSize = 0x40;
            sp00.paletteSize = 0x20;
            sp00.unk28 = 6;
            sp00.unk2A = 13;
            sp00.unk0.unk4 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk8);
            sp00.unk0.unk8 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unkC);
            sp00.unk0.unk9 = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk10);
            sp00.unk0.unkA = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk14);
            sp00.unk0.unkB = *(&gUiGraphics[UIGFX_TIMER_DIGITS].unk18);
            sub_80528AC(&sp00);
        } break;
    }
}
END_NONMATCH

void sub_805C448(u8 arg0)
{
    struct Task *t2 = NULL;
    struct Task *t1 = NULL;
    struct Task *t3 = NULL;
    Game_2_0_Sub *sub = NULL;
    Game_2_0 *strc = NULL;

    sub_80535FC();
    UiGfxStackInit();
    t1 = TaskCreate(Task_805C6B0, sizeof(Game_2_0_Sub), 0x2120U, 0U, NULL);
    sub = TASK_DATA(t1);
    sub->unk18 = 0;
    sub->unk1A = 0;
    sub->u.overB.qUnkA = 0xF0;
    sub->u.overB.unkC = 0x7E;
    sub->u.overB.unkE = 8;
    sub->u.overB.unk10 = 8;
    sub->u.overB.unk12 = 6;
    sub->u.overB.unk16 = 1;
    sub->u.overB.unk8 = 0xA;
    t2 = TaskCreate(Task_805C740, sizeof(Game_2_0_Sub), 0x2120U, 0U, NULL);
    sub = TASK_DATA(t2);
    sub->unk18 = 0;
    sub->unk1A = 0;
    sub->u.overB.qUnkA = 0x100;
    sub->u.overB.unkC = 0x80;
    sub->u.overB.unkE = 9;
    sub->u.overB.unk10 = 2;
    sub->u.overB.unk12 = 6;
    sub->u.overB.unk16 = 1;
    sub->u.overB.unk8 = 0;

    if (arg0 != 0) {
        Strc_8052C84 *strc0;
        t3 = TaskCreate(Task_805C83C, sizeof(Game_2_0_Sub), 0x2120U, 0U, NULL);
        sub = TASK_DATA(t3);
        strc0 = &sub->u.strc0;
        sub->unk18 = 0;
        sub->unk1A = 0;
        strc0->unk0 = 0x100;
        strc0->unk2 = 0;
        strc0->unk4 = 0;
        strc0->unk6 = 0;
        strc0->unkA = 0x39;
        strc0->unkC = 0x49;
        strc0->byteCount = 5;
        strc0->unk10 = 4;
        strc0->unk12 = 6;
        strc0->unk16 = 1;
        strc0->unk8 = 0;
    }

    strc = TASK_DATA(TaskCreate(Task_805C594, sizeof(Game_2_0), 0x2100U, 0U, TaskDestructor_nullsub_805C8FC));
    strc->unk18 = 0;
    strc->unk1A = arg0;
    strc->task10 = t1;
    strc->task14 = t2;
    strc->taskC = t3;
    strc->unk0 = 0;
    strc->unk2 = 1;
    strc->unk4 = 2;
    strc->unk6 = 0;
    strc->unk8 = 0x60;
    strc->unkA = 1;

    if (arg0 != 0) {
        sub_80543A4((StrcUi_805423C *)strc);
    }
}

void Task_805C594(void)
{
    s16 temp_r0;
    s16 temp_r0_2;
    s16 temp_r0_3;
    s32 temp_r2;
    s32 temp_r5;
    u16 *r3;
    Game_2_0 *strc;
    Game_2_0_Sub *subA;
    Game_2_0_Sub *subB;
#ifdef BUG_FIX
    // NOTE: Technically this is redundant, since it's neither getting read nor set
    //       if strc->unk1A is not 0, but it's better to have to to prevent future bugs when editing.
    Game_2_0_Sub *subR3 = NULL;
#else
    Game_2_0_Sub *subR3;
#endif

    strc = TASK_DATA(gCurTask);
    subA = TASK_DATA(strc->task10);
    subB = TASK_DATA(strc->task14);
    if (strc->unk1A != 0) {
        subR3 = TASK_DATA(strc->taskC);
    }

    subA->unk18 = strc->unk18;
    subB->unk18 = strc->unk18;

    if (strc->unk1A != 0) {
        subR3->unk18 = strc->unk18;
        if (strc->unk1A != 0) {
            if (strc->unk18 < 106) {
                if (strc->unk18 > 20) {
                    sub_805423C((StrcUi_805423C *)strc);
                } else {
                    sub_80543A4((StrcUi_805423C *)strc);
                }
            }
        }
    }

    if (++strc->unk18 > 0xFF) {
        gDispCnt &= ~0xE000;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
        gStageFlags &= ~STAGE_FLAG__ACT_START;
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        gPlayer.heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
        gPartner.moveState &= ~MOVESTATE_IGNORE_INPUT;
        gPartner.heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
        CreateSpecialStageUI();
        TaskDestroy(strc->task14);
        TaskDestroy(strc->task10);
        if (strc->unk1A != 0) {
            TaskDestroy(strc->taskC);
        }
        TaskDestroy(gCurTask);
        return;
    }

    if (strc->unk18 == 2) {
        sub_805BC94(gSpecialStageTargetRings);
    }
}

void Task_805C6B0()
{
    s16 temp_r0;
    s16 temp_r0_2;

    Game_2_0_Sub *sub = TASK_DATA(gCurTask);

    if (sub->unk18 > 0xF5) {
        if (sub->u.overB.qUnkA < -0x20) {
            sub->u.overB.qUnkA = (u16)sub->u.overB.qUnkA + 0x20;
            if (sub->u.overB.unkE != 0) {
                sub->u.overB.unkE = (u16)sub->u.overB.unkE - 1;
            }
        }
        sub->u.overB.qUnkA -= 0x1A;
    } else if (sub->unk18 > 0x2D) {
        sub->u.overB.unkC = 0x11;
    } else if (sub->unk18 > 0x21) {
        sub->u.overB.unkC = (u16)sub->u.overB.unkC - 8;
    } else if (sub->unk18 > 0x19) {
        sub->u.overB.qUnkA = -0x10;
    } else if (sub->unk18 > 0xF) {
        sub->u.overB.qUnkA -= 0x1A;
        if (sub->u.overB.qUnkA < -0x10) {
            sub->u.overB.qUnkA = -0x10;
        }
    }

    sub_8052F78("        ", &sub->u.overB);
}

// TODO: Remove this, when memcpy/memset are inlined.
// NOTE: Until then, these have to be here for matching, because we inlined const data above.
const u8 fillerTemp_08688635[3] = { 0 };
const u8 gUnknown_08688638[]
    = { 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0 };

void Task_805C740(void)
{
    Game_2_0_Sub *sub;

#ifndef NON_MATCHING
    const char arrA[22 + 5];
    memcpy((void *)arrA, &gUnknown_08688638[0], sizeof(arrA) - 5);
    memset((void *)(arrA + 22), 0, 5);
#else
    // TODO: Inline the mem calls!
    // const u8 arrA[16] = { /* data here */ };
    const char arrA[] = { 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
                          0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0,    0,    0,    0,    0,    0 };
#endif

    sub = TASK_DATA(gCurTask);
    if (sub->unk18 > 0xF5) {
        sub->u.overB.qUnkA -= 0x1C;
        if (sub->u.overB.qUnkA < -0x1F) {
            if (sub->u.overB.unkE != 0) {
                sub->u.overB.unkE--;
            }

            sub->u.overB.qUnkA += 0x20;
            sub->unk1A = Mod(sub->unk1A + 1, 7);

            sub_8052F78((const char *)&arrA[sub->unk1A], &sub->u.overB);
        } else {
            sub_8052F78((const char *)&arrA[sub->unk1A], &sub->u.overB);
        }

    } else if (sub->unk18 > 0x2D) {
        sub->u.overB.unkC = 0x13U;
        sub->u.overB.qUnkA -= 2;

        if (sub->u.overB.qUnkA < -0x1F) {
            sub->u.overB.qUnkA += 0x20;
            sub->unk1A = Mod(sub->unk1A + 1, 7);
        }

        sub_8052F78((const char *)&arrA[sub->unk1A], &sub->u.overB);
    } else if (sub->unk18 > 0x21) {
        sub->u.overB.unkC -= 8;
        sub->u.overB.qUnkA -= 2;

        if (sub->u.overB.qUnkA < -0x1F) {
            sub->u.overB.qUnkA += 0x20;
            sub->unk1A = Mod(sub->unk1A + 1, 7);
        }

        sub_8052F78((const char *)&arrA[sub->unk1A], &sub->u.overB);
    } else if (sub->unk18 > 0x19) {
        sub->u.overB.qUnkA -= 2;
        sub->u.overB.unkE = 9U;

        if (sub->u.overB.qUnkA < -0x1F) {
            sub->u.overB.qUnkA += 0x20;
            sub->unk1A = Mod(sub->unk1A + 1, 7);
        }

        sub_8052F78((const char *)&arrA[sub->unk1A], &sub->u.overB);
    } else if (sub->unk18 > 0xF) {
        sub->u.overB.qUnkA -= 0x1C;
        if (sub->u.overB.qUnkA <= 0xEF) {
            sub->u.overB.unkE = (u16)(9 - (sub->u.overB.qUnkA >> 0x5));
            if (sub->u.overB.qUnkA < -0x1F) {
                sub->u.overB.qUnkA += 0x20;
                sub->unk1A = Mod(sub->unk1A + 1, 7);
            }
            sub_8052F78((const char *)&arrA[sub->unk1A], &sub->u.overB);
        }
    }
}

void Task_805C83C()
{
    s16 temp_r0;
    s16 temp_r0_2;
    s16 temp_r0_3;
    s16 temp_r1_2;
    u16 temp_r1;

    Game_2_0_Sub *sub = TASK_DATA(gCurTask);

    if (sub->unk18 > 0xF5) {
        sub->u.overB.unkC = 0x49;
        sub->u.overB.qUnkA -= 0x1C;
        if (sub->u.overB.qUnkA < -0x80) {
            sub->u.overB.unkE = 0;
            sub->u.overB.qUnkA = -0x80;
        } else {
            sub_8052F78(" !\"#$", &sub->u.overB);
        }
    } else if (sub->unk18 > 0x2D) {
        sub->u.strc0.unk2 += 0x10;
        if (sub->u.strc0.unk2 >= 0x100) {
            sub->u.strc0.unk2 = 0x100;
            sub->u.overB.qUnkA = 0x39;
            sub->u.overB.unkC = 0x49;

            sub_8052F78(" !\"#$", &sub->u.overB);
        } else {
            sub->u.overB.qUnkA = 0x29;
            sub->u.overB.unkC = 0x54 - (sub->u.strc0.unk2 >> 3);
            sub_8052C84(" !\"#$", (Strc_8052C84 *)sub);
        }
    } else if (sub->unk18 > 0x21) {
        sub->u.overB.qUnkA = 0x29;
        sub->u.overB.unkC = 0x54 - (sub->u.strc0.unk2 >> 3);
        sub->u.strc0.unk2 += 0x10;

        if (sub->u.strc0.unk2 >= 0x100) {
            sub->u.strc0.unk2 = 0x100;
        }

        sub_8052C84(" !\"#$", (Strc_8052C84 *)sub);
    }
}

void TaskDestructor_nullsub_805C8FC(struct Task *t) { }
