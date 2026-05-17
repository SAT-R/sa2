#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "data/sa1/ui_graphics.h"
#include "game/sa1/ui/collect_chaos_emeralds_msg.h"
#include "data/sa1/credits.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/sa1/stage/stage_ui.h"
#include "game/sa1/save.h"
#include "game/sa1/menus/title_screen.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/anim_sizes.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"

extern const u8 gUnknown_0868483C[0x500];

const ALIGNED(4) u16 gUnknown_086886A0[12] = {
    22,  0, //
    79,  0, //
    139, 0, //
    322, 0, //
    322, 0, //
    322, 0, //
};

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Sprite s2;
    /* 0x60 */ u8 unk60[8];
    /* 0x68 */ s16 unk68;
    /* 0x6A */ s16 unk6A;
    /* 0x6C */ s16 unk6C;
    /* 0x6E */ s16 unk6E;
    /* 0x70 */ s16 unk70;
    /* 0x72 */ s16 unk72;
    /* 0x74 */ s16 unk74;
    /* 0x74 */ u8 unk76;
    /* 0x78 */ s32 unk78;
    /* 0x7C */ u32 unk7C;
} StaffCredits;

typedef struct {
    /* 0x00 */ StrcUi_805423C strc;
    /* 0x0C */ struct Task *task1; // -> (StaffCredits *)
    /* 0x10 */ struct Task *task2; // -> (StaffCredits *)
    /* 0x14 */ s32 unk14;
} Credits_18;

void sub_805E1E8(void);
void Task_805E888(void); // -> StaffCredits
void Task_805E758(void); // -> StaffCredits
void Task_805E698(void); // -> Credits_18
void TaskDestructor_805E9B0(struct Task *t);

extern void sub_8053370(const char *str, void *param1);

void sub_805E1E8(void)
{
    Strc_80528AC sp00;

    sp00.unk2B = 8;
    sp00.uiGfxID = 0x3B;
    sp00.unk2A = 13;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.vramC = VRAM_RESERVED_STAFF_CREDITS_A;
    sp00.tilesSize = 1 * TILE_SIZE_4BPP;
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.paletteSize = 32;
    sp00.unk28 = 15;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);

    sp00.unk2B = 7;
    sp00.uiGfxID = 0;
    sp00.unk2A = 13;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.vramC = VRAM_RESERVED_STAFF_CREDITS_A;
    sp00.tilesSize = 236 * TILE_SIZE_4BPP;
    sp00.palette = gUiGraphics[60].palette;
    sp00.paletteSize = 32;
    sp00.unk28 = 14;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = UIGFX_CHAR_SELECT_BLACK_BOX_2;
    sp00.unk2B = 0;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.tilesSize = 1 * TILE_SIZE_4BPP;
    sp00.paletteSize = 32;
    sp00.unk28 = 0;
    sp00.unk29 = 1;
    sp00.layout = gUnknown_0868483C;
    sp00.layoutSize = 0;
    sp00.unk2A = 5;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);
}

void CreateStaffCredits()
{
    s32 sp4;
    Sprite *s;
    s32 s_2;
    u16 s_3;
    u16 temp_r1;
    struct Task *t;
    struct Task *t1;
    struct Task *t2;
    struct Task *t3;
    StaffCredits *credits;
    Credits_18 *credits18;

    TasksDestroyInPriorityRange(1U, 0x1800U);
    TasksDestroyInPriorityRange(0x1801U, 0xFFFFU);
    sub_80535FC();
    UiGfxStackInit();
    gDispCnt = 0x1240;
    gBgCntRegs[1] = 0x1907;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    t1 = TaskCreate(Task_805E888, sizeof(StaffCredits), 0x6200U, 0U, NULL);
    credits = TASK_DATA(t1);
    s = &credits->s;

    credits->unk78 = 0x30;
    credits->unk7C = 0;

    s->graphics.dest = VRAM_RESERVED_STAFF_CREDITS_B;
    s->graphics.anim = SA1_ANIM_CREDITS_COMPANY_LOGOS;
    s->variant = 0;
    s->x = 0;
    s->y = 0;
    s->oamFlags = 0x480;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &credits->s2;
    s->graphics.anim = SA1_ANIM_CREDITS_COPYRIGHT;
    s->variant = 1;
    s->graphics.dest = VRAM_RESERVED_STAFF_CREDITS_C;
    s->x = DISPLAY_CENTER_X;
    s->y = 0;
    s->oamFlags = 0x480;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    t2 = TaskCreate(Task_805E758, sizeof(StaffCredits), 0x6120U, 0U, NULL);
    credits = TASK_DATA(t2);
    credits->unk78 = 0x30;
    credits->unk7C = 0;
    credits->unk6A = -0x50;
    credits->unk6C = 0;
    credits->unk6E = 3;
    credits->unk68 = 0;
    credits->unk70 = 7;
    credits->unk76 = 1;
    credits->unk72 = 0xE;
    credits->unk74 = 5;

    t = TaskCreate(Task_805E698, sizeof(Credits_18), 0x6000U, 0U, TaskDestructor_805E9B0);
    credits18 = TASK_DATA(t);
    credits18->unk14 = 0x30;
    credits18->task1 = t1;
    credits18->task2 = t2;
    credits18->strc.unk0 = 0;
    credits18->strc.unk2 = 0;
    credits18->strc.unk4 = 1;
    credits18->strc.unk6 = 0;
    credits18->strc.unk8 = 0x80;
    credits18->strc.unkA = 8;

    DmaFill32(3, 0, BG_CHAR_ADDR_FROM_BGCNT(1), 0x40);

    gBgSprites_Unknown1[1] = 1;
    gBgSprites_Unknown2[1][0] = 0;
    gBgSprites_Unknown2[1][1] = 0;
    gBgSprites_Unknown2[1][2] = -1;
    gBgSprites_Unknown2[1][3] = 0x14;

    gDispCnt |= 0x6000;
    gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
    gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, 36);
    gWinRegs[WINREG_WIN1H] = WIN_RANGE(0, DISPLAY_WIDTH);
    gWinRegs[WINREG_WIN1V] = WIN_RANGE(DISPLAY_HEIGHT - 28, DISPLAY_HEIGHT);
    gWinRegs[WINREG_WININ] = 0x3F3F;
    gWinRegs[WINREG_WINOUT] = 0x1F;
    gBldRegs.bldCnt = 0x1FDF;
    gBldRegs.bldAlpha = 0x10;
    gBldRegs.bldY = 0x10;

    sub_805E1E8();
    m4aSongNumStart(MUS_STAFF_CREDITS);
}

void Task_805E698(void)
{
    Credits_18 *credits_18 = TASK_DATA(gCurTask);
    StaffCredits *creditsB = TASK_DATA(credits_18->task2);
    StaffCredits *creditsA = TASK_DATA(credits_18->task1);
    u8 r2;

    if (credits_18->unk14 < 8334) {
        creditsB->unk78 = credits_18->unk14;
        creditsA->unk78 = credits_18->unk14;
    } else {
        creditsB->unk78 = 8334;
        creditsA->unk78 = 8334;
    }

    credits_18->unk14++;

    if (credits_18->unk14 > 8520) {
        r2 = sub_805423C(&credits_18->strc);
    } else {
        r2 = 0;
    }

    if ((credits_18->unk14 > 8550) && r2) {
        gDispCnt &= ~0xE000;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;

        TaskDestroy(credits_18->task2);
        TaskDestroy(credits_18->task1);
        TaskDestroy(gCurTask);

        if (LOADED_SAVE->chaosEmeralds != ALL_ZONE_CHAOS_EMERALDS) {
            CreateGetAllChaosEmeraldsMessage();
        } else {
            CreateSegaLogo();
        }
    }
}

void Task_805E758()
{
    u8 sp0;
    s16 *temp_r1_2;
    s16 *temp_r1_3;
    s16 var_r0;
    s32 temp_r0;
    s32 temp_r0_2;
    s32 temp_r0_3;
    s32 temp_r4;
    s32 var_r7;
    s32 var_sl;
    u32 var_r8;
    u8 i;

    StaffCredits *credits = TASK_DATA(gCurTask);

    temp_r4 = credits->unk78;
    if (!(1 & temp_r4)) {
        credits->unk7C = temp_r4 * (Div(0x143000, 0x201C) + 1);
    }

    temp_r0 = I(credits->unk7C) - 0xC;
    if (temp_r0 > 0x8AU) {
        var_r8 = (u32)(I(credits->unk7C) - 0x86) >> 4;
        var_sl = Mod(I(credits->unk7C) - 0x96, 0x10) + 8;
    } else {
        var_r8 = 0;
        var_sl = 0;
    }
    var_r7 = 0x24;
    if (var_r8 < 0x139) {
        sp0 = 7;
    } else {
        sp0 = 67 - var_r8;
    }

    for (i = 0; i < sp0; i++) {
        if (sCreditsEntries[var_r8 + i].length != 0) {
            if (temp_r0 > 0x8AU) {
                s32 v = sCreditsEntries[var_r8 + i].unk2 + var_r7;
                credits->unk6C = v - var_sl;
            } else {
                s32 v = sCreditsEntries[var_r8 + i].unk2 + 0x8A;
                credits->unk6C = (v - temp_r0) + var_r7;
            }

            if (credits->unk6C < 0x8B) {
                credits->unk6A = 120 - (sCreditsEntries[var_r8 + i].length * 4);
                credits->unk6E = sCreditsEntries[var_r8 + i].length;
                credits->unk68 = (s16)(i * 0x10);
                credits->unk72 = sCreditsEntries[var_r8 + i].unk1 + 0xE;
                sub_8053370(sCreditsEntries[var_r8 + i].name, &credits->unk60[0]);
                var_r7 += 0x10;
            } else {
                break;
            }
        } else {
            var_r7 += 0x10;
        }
    }
}

// (96.67%) https://decomp.me/scratch/cdKHE
NONMATCH("asm/non_matching/game/sa1/ui/staff_credits__Task_805E888.inc", void Task_805E888())
{
    Sprite *s;
    Sprite *s2;
    s16 temp_r0_4;
    s32 temp_r0_2;
    s32 temp_r0_3;
    s32 temp_r5;
    s32 temp_sl;
    s32 var_r5;
    u32 temp_r6;
    u8 i, j;
#ifndef BUG_FIX
    u8 var_r8;
#else
    u8 var_r8 = 0;
#endif

    StaffCredits *credits = TASK_DATA(gCurTask);

    s = &credits->s;
    s2 = &credits->s2;
    temp_r5 = credits->unk78;
    if (!(1 & temp_r5)) {
        credits->unk7C = temp_r5 * (Div(0x143000, 0x201C) + 1);
    }

    temp_r0_2 = I(credits->unk7C) - 0xC;
    if (temp_r0_2 > 0x9AU) {
        temp_r0_3 = temp_r0_2 - 0x8A;
        temp_r6 = (u32)temp_r0_3 >> 4;
        temp_sl = Mod(temp_r0_3 - 0x10, 0x10) + 4;
        var_r5 = 0xFF;

        for (i = 0; i < 10; i++) {
            for (j = 0; j < 4; j++) {
                if (gUnknown_086886A0[j] == (temp_r6 + i)) {
                    var_r5 = j;
                    var_r8 = i;
                    i = 0xA;
                    j = 5;
                }
            }
        }

        if (temp_r6 >= (gUnknown_086886A0[3] - 3)) {
            var_r5 = 3;
            var_r8 = 0;
        }

        if (var_r5 != 0xFF) {
            s32 yPos = (24 - temp_sl);
            s->y = yPos + (var_r8 * 0x10);

            if (s->y < 0x9B) {
                s32 xPos = DISPLAY_CENTER_X;
                s->x = xPos;

                switch (var_r5) {
                    case 0: {
                    } break;

                    case 1:
                    case 2: {
                        s->graphics.anim = 0x2E4;
                        s->variant = var_r5;
                    } break;

                    default:
                        s->graphics.anim = 0x2E4;
                        s->variant = 3;
                        if (s->y < DISPLAY_CENTER_Y) {
                            s->y = DISPLAY_CENTER_Y;
                        }
                        s2->x = xPos;
                        s2->y = s->y + 40;
                        UpdateSpriteAnimation(s2);
                        DisplaySprite(s2);
                        break;
                }
                UpdateSpriteAnimation(s);
                DisplaySprite(s);
            }
        }
    }
}
END_NONMATCH

void TaskDestructor_805E9B0(struct Task *t) { }