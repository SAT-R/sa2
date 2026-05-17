#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "lib/m4a/m4a.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/sa1/save.h"
#include "data/sa1/ui_graphics.h"
#include "game/sa1/menus/mp_mode_select.h"
#include "game/sa1/stage/stage_ui.h"

#include "constants/sa1/songs.h"

/* NOTE(Jace): This whole module needs to be considered to be redone. */

typedef struct {
    Strc_8052C84 unk0;
    StrcUi_805423C strc18;
    s16 unk24;
    u8 filler26;
    s16 unk28;
    u8 filler2A;
    u16 unk2C;
    u16 filler2C;
    u16 unk30;
    u8 filler32[1];
    u16 unk34[16];
    s16 unk54;
    u16 filler56;
    u16 unk58;
    u16 filler5A;
    u16 unk5C;
    u16 filler5E;
    u16 unk60;
    u16 filler62;
    u16 unk64;
    u16 filler66;
    GraphicsData gfx68;
    GraphicsData gfx74;
    GraphicsData gfx80;
    GraphicsData gfx8C;
    GraphicsData gfx98;
    GraphicsData gfxA4;
    GraphicsData gfxB0;
    GraphicsData gfxBC;
    s16 unkC8[6][2];
    s16 unkE0[6][2];
    u16 unkF8;
    u16 fillerFA;
    s16 unkFC;
} PlayerNameMenu;

void sub_8052D64(u8 *param0, Strc_8052C84 *param1);
void Task_80595DC(void);
extern u8 gUnknown_08684D3C[0x1000];
extern u8 gUnknown_08688444[];
extern const u8 gUnknown_08688568[4];
extern u8 gUnknown_08685D3C[0x800];
extern u8 gUnknown_0868653C[0x1600];
extern void sub_805321C(u8 *param0, GameOverB *param1);
extern u8 gUnknown_0868856C[4];
extern u16 gUnknown_08688492[];
extern void CreatePlayerDataMenu(void);

void sub_8058830(void);

static inline void incUnkFC()
{
    PlayerNameMenu *menu = TASK_DATA(gCurTask);
    ++menu->unkFC;
}

// (82.53%) https://decomp.me/scratch/rFE3j
NONMATCH("asm/non_matching/game/sa1/ui/player_name_input_menu__CreatePlayerNameInputMenu.inc", void CreatePlayerNameInputMenu(void))
{
    Strc_80528AC sp4;
    Task *t;
    s32 temp_r3;
    s32 var_r8_2;
    u8 *temp_r3_2;
    PlayerNameMenu *menu = NULL;
    StrcUi_805423C *strc18;
    Strc_8052C84 *unk0;
    u8 i = 0;

    gBgCntRegs[1] = 0x1C06;
    gBgCntRegs[2] = 0x1A09;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gDispCnt = 0x3640;
    gBldRegs.bldCnt = 0x1F;
    gWinRegs[0] = 1;
    gWinRegs[2] = 1;

    sub_80535FC();
    t = TaskCreate(sub_8058830, sizeof(PlayerNameMenu), 0x2000U, 0U, NULL);
    TASK_GET_MEMBER(PlayerNameMenu, t, s16, unk24) = 0;
    TASK_GET_MEMBER(PlayerNameMenu, t, s16, unk28) = 0;
    TASK_GET_MEMBER(PlayerNameMenu, t, s16, unk2C) = 0;
    TASK_GET_MEMBER(PlayerNameMenu, t, s16, unk30) = 0;
    TASK_GET_MEMBER(PlayerNameMenu, t, s16, unk54) = 0;
    TASK_GET_MEMBER(PlayerNameMenu, t, s16, unkFC) = 0;

    unk0 = &TASK_GET_MEMBER(PlayerNameMenu, t, Strc_8052C84, unk0);
    unk0->unkA = 0x1E;
    unk0->unkC = 0x1E;
    unk0->byteCount = 1;
    unk0->unk8 = 0;
    unk0->unk10 = 3;
    unk0->unk16 = 1;
    unk0->unk12 = 0;

    strc18 = &TASK_GET_MEMBER(PlayerNameMenu, t, StrcUi_805423C, strc18);
    strc18->unk0 = 0;
    strc18->unk2 = 1;
    strc18->unk4 = 2;
    strc18->unk6 = 0;
    strc18->unk8 = 0x100;
    strc18->unkA = 1;

    for (i = 0; i < (s32)ARRAY_COUNT(LOADED_SAVE->playerName); i++) {
        temp_r3_2 = &LOADED_SAVE->playerName[i];
        if ((LOADED_SAVE->playerName[i] >= 0x20) && LOADED_SAVE->playerName[i] <= 0x89U) {
            TASK_GET_MEMBER(PlayerNameMenu, t, s16, unkC8[i][0]) = (gUnknown_08688492[*temp_r3_2 - 0x20] + 0x1001);
            TASK_GET_MEMBER(PlayerNameMenu, t, s16, unkC8[i][1]) = (gUnknown_08688492[*temp_r3_2 - 0x20] + 0x1002);
            TASK_GET_MEMBER(PlayerNameMenu, t, s16, unkE0[i][0]) = (gUnknown_08688492[*temp_r3_2 - 0x20] + 0x1015);
            TASK_GET_MEMBER(PlayerNameMenu, t, s16, unkE0[i][1]) = (gUnknown_08688492[*temp_r3_2 - 0x20] + 0x1016);
        } else {
            LOADED_SAVE->playerName[i] = 0x20;
            TASK_GET_MEMBER(PlayerNameMenu, t, s16, unkC8[i][0]) = (gUnknown_08688492[*temp_r3_2 - 0x20] + 0x1001);
            TASK_GET_MEMBER(PlayerNameMenu, t, s16, unkC8[i][1]) = (gUnknown_08688492[*temp_r3_2 - 0x20] + 0x1002);
            TASK_GET_MEMBER(PlayerNameMenu, t, s16, unkE0[i][0]) = (gUnknown_08688492[*temp_r3_2 - 0x20] + 0x1015);
            TASK_GET_MEMBER(PlayerNameMenu, t, s16, unkE0[i][1]) = (gUnknown_08688492[*temp_r3_2 - 0x20] + 0x1016);
        }
    }

    var_r8_2 = 5;
    while ((var_r8_2 >= 0) && (LOADED_SAVE->playerName[var_r8_2] == 0x20)) {
        var_r8_2 -= 1;
    }

    menu->unkF8 = (s16)(var_r8_2 + 1);
    UiGfxStackInit();

    sp4.uiGfxID = 0x23;
    sp4.unk2B = 0;
    sp4.tiles = gUiGraphics[sp4.uiGfxID].tiles;
    sp4.palette = gUiGraphics[sp4.uiGfxID].palette;
    sp4.tilesSize = 0x5000;
    sp4.paletteSize = 0x20;
    sp4.unk28 = 0;
    sp4.unk29 = 2;
    sp4.layout = &gUnknown_08684D3C[0];
    sp4.layoutSize = 0x500;
    sp4.unk2A = 0x15;
    sp4.unk0.unk4 = gUiGraphics[sp4.uiGfxID].unk8;
    sp4.unk0.unk8 = gUiGraphics[sp4.uiGfxID].unkC;
    sp4.unk0.unk9 = gUiGraphics[sp4.uiGfxID].unk10;
    sp4.unk0.unkA = gUiGraphics[sp4.uiGfxID].unk14;
    sp4.unk0.unkB = gUiGraphics[sp4.uiGfxID].unk18;
    sub_80528AC(&sp4);

    sp4.uiGfxID = 0x24;
    sp4.unk2B = 1;
    sp4.tiles = gUiGraphics[sp4.uiGfxID].tiles;
    sp4.palette = gUiGraphics[sp4.uiGfxID].palette;
    sp4.tilesSize = 0x2800;
    sp4.paletteSize = 0x20;
    sp4.unk28 = 0;
    sp4.unk29 = 1;
    sp4.layout = &gUnknown_08685D3C[0];
    sp4.layoutSize = 0x800;
    sp4.unk2A = 0x15;
    sp4.unk0.unk4 = gUiGraphics[sp4.uiGfxID].unk8;
    sp4.unk0.unk8 = gUiGraphics[sp4.uiGfxID].unkC;
    sp4.unk0.unk9 = gUiGraphics[sp4.uiGfxID].unk10;
    sp4.unk0.unkA = gUiGraphics[sp4.uiGfxID].unk14;
    sp4.unk0.unkB = gUiGraphics[sp4.uiGfxID].unk18;
    sub_80528AC(&sp4);

    sp4.uiGfxID = 0x25;
    sp4.unk2B = 1;
    sp4.palette = gUiGraphics[sp4.uiGfxID].palette;
    sp4.paletteSize = 0x20;
    sp4.unk28 = 2;
    sp4.unk29 = 1;
    sp4.unk2A = 4;
    sp4.unk0.unk4 = gUiGraphics[sp4.uiGfxID].unk8;
    sp4.unk0.unk8 = gUiGraphics[sp4.uiGfxID].unkC;
    sp4.unk0.unk9 = gUiGraphics[sp4.uiGfxID].unk10;
    sp4.unk0.unkA = gUiGraphics[sp4.uiGfxID].unk14;
    sp4.unk0.unkB = gUiGraphics[sp4.uiGfxID].unk18;
    sub_80528AC(&sp4);

    sp4.uiGfxID = 0x26;
    sp4.unk2B = 3;
    sp4.tiles = gUiGraphics[sp4.uiGfxID].tiles;
    sp4.palette = gUiGraphics[sp4.uiGfxID].palette;
    sp4.tilesSize = 0x100;
    sp4.paletteSize = 0x20;
    sp4.unk28 = 0;
    sp4.vramC = OBJ_VRAM0 + 0x2000;
    sp4.unk2A = 0xD;
    sp4.unk0.unk4 = gUiGraphics[sp4.uiGfxID].unk8;
    sp4.unk0.unk8 = gUiGraphics[sp4.uiGfxID].unkC;
    sp4.unk0.unk9 = gUiGraphics[sp4.uiGfxID].unk10;
    sp4.unk0.unkA = gUiGraphics[sp4.uiGfxID].unk14;
    sp4.unk0.unkB = gUiGraphics[sp4.uiGfxID].unk18;
    sub_80528AC(&sp4);

    sub_805423C(strc18);
    m4aSongNumStartOrChange(0x30U);
}
END_NONMATCH

// TODO: This is so bad. Rewrite this entire thing.
// The generated assembly could easily be halved doing that, and complexity would be MUCH improved.
// (75.00%) https://decomp.me/scratch/WT79A
NONMATCH("asm/non_matching/game/sa1/ui/player_name_input_menu__sub_8058830.inc", void sub_8058830())
{
    Strc_80528AC subroutine_arg0;
    s8 sp28;
    s8 sp2B;
    StrcUi_805423C *sp30;
    Task *sp34;
    s32 sp44;
    s32 sp48;
    PlayerNameMenu *sp64;
    s16 temp_r0_3;
    s16 temp_r0_9;
    s16 temp_r2;
    s32 temp_r1_15;
    s32 temp_r1_17;
    s32 temp_r1_30;
    s32 temp_r1_41;
    s32 temp_r1_42;
    s32 temp_r1_44;
    s32 temp_r1_45;
    s32 temp_r2_2;
    s32 temp_r2_3;
    s32 temp_r2_4;
    s32 temp_r2_5;
    Strc_8052C84 *temp_r4_2;
    s32 temp_r4_3;
    s32 temp_r4_4;
    GameOverB *temp_r4_5;
    s32 temp_r4_6;
    s32 temp_r5;
    s32 temp_r5_2;
    s32 temp_r6_3;
    GraphicsData *gfx;
    s32 var_r0_2;
    s32 var_r0_5;
    s32 var_r0_6;
    s32 var_r1;
    s32 var_r1_2;
    s32 var_r1_3;
    s32 var_r1_4;
    s32 var_r7_2;
    u16 temp_r0_14;
    u16 temp_r0_2;
    u16 temp_r1_14;
    u16 temp_r2_6;
    u16 temp_r4;
    u16 temp_r6;
    s16 temp_r8;
    u16 temp_sb;
    u16 temp_sl;
    u16 i;
    u16 pressedKeys;
    u32 temp_r6_2;
    u8 *temp_r3_6;

    PlayerNameMenu *menu = TASK_DATA(gCurTask);

    sp64 = menu;
    pressedKeys = gPressedKeys;
    sp30 = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, StrcUi_805423C, strc18);

    menu->unk2C++;
    if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk2C) > 0x20) {
        menu->unk2C = 0;
    }

    menu->unk30++;
    if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk30) > 0x2E) {
        menu->unk30 = 0;
    }

    menu->unkFC++;
    if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk30) < 60) {
        sub_805423C((StrcUi_805423C *)sp30);
    } else {
        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk30, 60);
    }

    if (gInput & 0x10) {
        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk58, TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk58) + 1);
    } else {
        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk58, 0);
    }

    if (0x20 & gInput) {
        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk5C, TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk5C) + 1);
    } else {
        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk5C, 0);
    }

    if (0x40 & gInput) {
        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk64, TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk64) + 1);
    } else {
        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk64, 0);
    }

    if (0x80 & gInput) {
        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk60, TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk60) + 1);
    } else {
        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk60, 0);
    }

    temp_sb = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk24);
    temp_sl = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28);
    temp_r8 = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54);

    if ((DPAD_RIGHT & gPressedKeys) || (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk58) > 0xF)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        temp_r1_15 = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk58);
        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk58, temp_r1_15 - 5);
        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk24, TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk24) + 1);

        if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk24) > 9) {
            TASK_SET_MEMBER(PlayerNameMenu, gCurTask, s16, unk24, 0);
        }

        pressedKeys |= DPAD_RIGHT;
    } else if ((DPAD_LEFT & gPressedKeys) || (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk5C) > 0xF)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        temp_r1_17 = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk5C);
        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk5C, temp_r1_17 - 5);

        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk24, TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk24) - 1);

        if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk24) < 0) {
            TASK_SET_MEMBER(PlayerNameMenu, gCurTask, s16, unk24, 9);
        }

        pressedKeys |= DPAD_LEFT;
    }

    if ((DPAD_DOWN & gPressedKeys) || ((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk60) > 0xF))) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk60) = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk60) - 5;

        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28, TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) + 1);
        if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) > 5) {
            TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) = 5;

            TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk60, TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk60) + 1);

            if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54) > 2) {
                TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) = 0;
                TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54) = 0;
            }
        }

        pressedKeys |= DPAD_DOWN;
    } else if ((DPAD_UP & gPressedKeys) || (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk64) > 0xF)) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        TASK_SET_MEMBER(PlayerNameMenu, gCurTask, u16, unk64, TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk64) - 5);

        TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) - 1;

        if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) < 0) {
            TASK_SET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28, 0);

            TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54) = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54) - 1;

            if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54) < 0) {
                TASK_SET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28, 5);
                TASK_SET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54, 2);
            }
        }

        pressedKeys |= DPAD_UP;
    }

    temp_r4_2 = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, Strc_8052C84, unk0);
    temp_r0_3 = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk2C);
    if (temp_r0_3 < 0x10) {
        temp_r4_2->unk0 = (s16)(((0x10 - temp_r0_3) * 6) + 0x100);
        temp_r4_2->unk2 = ((0x10 - TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk2C)) * 6) + 0x100;
    } else {
        temp_r4_2->unk0 = (((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk2C) - 15) * 6) + 0x100);
        temp_r4_2->unk2 = ((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk2C) - 0xF) * 6) + 0x100;
    }

    temp_r2 = (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk24) * 0x10) + 0x20;
    temp_r4_2->unkA = temp_r2;
    temp_r4_2->unkA = (s16)(temp_r2 - (((u16)temp_r4_2->unk0 - 240) >> 7));
    temp_r4_2->unkC = (s16)(((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) * 0x10) + 0x28) - (((u16)temp_r4_2->unk2 - 0xF0) >> 7));
    temp_r4_2->unk4 = 0;
    temp_r4_2->unk6 = 2;
    sub_8052D64((u8 *)&gUnknown_08688568[0], temp_r4_2);

    if ((gPrevInput | pressedKeys) & 0xF9) {
        sp34 = gCurTask;
        gfx = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, GraphicsData, gfx80);
        temp_r2_2 = (temp_sb << 2);
        temp_r4_3 = ((s16)temp_sl + (temp_r8)) << 7;
        sp44 = temp_r4_3;
        temp_r1_30 = (temp_r2_2 + 10 + temp_r4_3) & 0x7FF;
        //  gfx->dest = temp_r1_30;
        gfx->src = &gUnknown_08685D3C[temp_r1_30 & 0x3FF];
        // #define (bg) ((u8*)BG_VRAM + ((gBgCntRegs[bg] & BGCNT_CHARBASE(0x3)) << 12))
        gfx->dest = (u8 *)(BG_VRAM + temp_r1_30 + ((0x1F00 & gBgCntRegs[1]) << 3));
        gfx->size = 4;
        gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = gfx;
        gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
        gfx = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, GraphicsData, gfx8C);
        temp_r2_3 = (temp_r2_2 + 0x4A + sp44) & 0x7FF;
        // gfx->dest = temp_r2_3;
        gfx->src = &gUnknown_08685D3C[temp_r2_3 & 0x3FF];
        gfx->dest = (u8 *)(BG_VRAM + temp_r2_3 + ((0x1F00 & gBgCntRegs[1]) << 3));
        gfx->size = 4;
        gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = gfx;
        gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
    }

    temp_r6
        = ((u16)((0x70000 & (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54) + TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28)))
                 * 20)
           + TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk24))
        * 2;
    if ((gPressedKeys == 0) && (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) < 6)) {
        gfx = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, GraphicsData, gfx68);
        temp_r2_4 = (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk24) * 4) + 10;
        temp_r2_5
            = (temp_r2_4
               + ((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) + TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54)) << 7))
            & 0x7FF;
        gfx->src = &gUnknown_0868653C[(temp_r2_5 & 0x3FF)];
        gfx->dest = (void *)(BG_VRAM + temp_r2_5 + ((0x1F00 & gBgCntRegs[1]) * 8));
        gfx->size = 4;
        gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = gfx;
        gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
        gfx = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, GraphicsData, gfx74);
#if PLATFORM_GBA
        // TODO
        gfx->dest = (u8 *)((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk24)) * 4) + 0x4A;
        gfx->dest
            = (u8 *)((temp_r2_4
                      + ((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) + TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54))
                         << 7))
                     & 0x7FF);
        gfx->src = &gUnknown_0868653C[((uintptr_t)gfx->dest) & 0x3FF];
        gfx->dest = (void *)(VRAM + (uintptr_t)gfx->dest + ((0x1F00 & gBgCntRegs[1]) * 8));
        gfx->size = 4;
        gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = gfx;
        gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
#endif
    }
    if (0x300 & gPressedKeys) {
        if (0x200 & gPressedKeys) {
            if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) != 0) {
                TASK_SET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8, TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) - 1);
            }
        } else {
            if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) < 5) {
                TASK_SET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8, TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) + 1);
            }
        }
    }

    if ((A_BUTTON & gPressedKeys) && !(B_BUTTON & gPressedKeys)) {
        switch (temp_r6) {
            case 0x126:
                if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) != 0) {
                    TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) - 1;
                }
                break;
            case 0x128:
                if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) != 0) {
                    TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) + 1;
                }
                break;
            case 0x12A:
                var_r1_3 = 0;

                for (i = 0; i < 6; i++) {
                    if ((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i][0]) - Q(16)) != 0x10DB) {
                        var_r1_3 |= 1;
                    }
                }

                if (var_r1_3 != 0) {
                    sp30->unk6 = 0;
                    sp30->unk4 = 1;
                    TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkFC) = 0;
                    gCurTask->main = Task_80595DC;
                }
                break;
            default:
                if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) < 6) {
                    TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) + 1;
                    TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[temp_r2_6 + 0][0]) = temp_r6 + 0x2001;
                    TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[temp_r2_6 + 0][1]) = temp_r6 + 0x2002;
                    TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[temp_r2_6 + 2][0]) = temp_r6 + 0x2015;
                    TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[temp_r2_6 + 2][2]) = temp_r6 + 0x2016;
                }
                break;
        }
        m4aSongNumStart(SE_SELECT);
    }

    if ((START_BUTTON & gPressedKeys) || ((A_BUTTON & gPressedKeys) && (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) == 6))) {
        temp_r6_2 = 7 & TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54);
        if (temp_r6_2 < 2) {
            TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54) = 2U;
            TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk24) = 9;
            TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) = 5;
        } else {
            TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk24) = 9;
            TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) = (s16)(7 - temp_r6_2);
        }
    }

    if (((A_BUTTON | B_BUTTON) & gPressedKeys) == B_BUTTON) {
        if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) > 0) {
            TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) - 1;
            for (i = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8); i < 5; i++) {
                TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i + 0][0])
                    = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i + 1][0]);
                TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i + 0][1])
                    = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i + 1][1]);
                TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i + 2][0])
                    = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i + 3][0]);
                TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i + 2][1])
                    = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i + 3][1]);
            }

            TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i + 0][0]) = 0x20DB;
            TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i + 0][1]) = 0x20DC;
            TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i + 2][0]) = 0x20EF;
            TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i + 2][1]) = 0x20F0;
            m4aSongNumStart(SE_RETURN);
        }
    }
    UiGfxStackInit();
    temp_r0_9 = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk30);
    if (temp_r0_9 <= 0x16) {
        var_r0_5 = 0x17 - temp_r0_9;
    } else {
        var_r0_5 = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk30) - 0x17;
    }

    var_r7_2 = 31 - (((u16)gSineTable[(((var_r0_5 << 5) / 23) << 5) / 60U] << 0x10) >> 0x17);
    if (var_r7_2 > 31) {
        var_r7_2 = 31;
    }

    for (i = 0; i < 16; i++) {
        temp_r5 = i * 2;
        sp48 = temp_r5;
        temp_r4_4 = Div(var_r7_2 * ((gUiGraphics[28].palette[i] & 0x7C00) >> 10), 0x20);
        temp_r5_2 = Div(var_r7_2 * ((gUiGraphics[28].palette[i] & 0x3E0) >> 5), 0x20);
        TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk34[i])
            = (s16)((temp_r4_4 << 10) + (temp_r5_2 << 5) + Div(var_r7_2 * (0x1F & gUiGraphics[28].palette[i]), 0x20));
    }

    subroutine_arg0.uiGfxID = 0x25;
    subroutine_arg0.unk2B = 1;
    subroutine_arg0.palette = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, u16, unk34);
    subroutine_arg0.paletteSize = sizeof(menu->unk34);
    subroutine_arg0.unk28 = 1;
    subroutine_arg0.unk29 = 1;
    subroutine_arg0.unk2A = 4;
    subroutine_arg0.unk0.unk4 = gUiGraphics[subroutine_arg0.uiGfxID].unk8;
    subroutine_arg0.unk0.unk8 = gUiGraphics[subroutine_arg0.uiGfxID].unkC;
    subroutine_arg0.unk0.unk9 = gUiGraphics[subroutine_arg0.uiGfxID].unk10;
    subroutine_arg0.unk0.unkA = gUiGraphics[subroutine_arg0.uiGfxID].unk14;
    subroutine_arg0.unk0.unkB = gUiGraphics[subroutine_arg0.uiGfxID].unk18;
    sub_80528AC(&subroutine_arg0);

    if (((s16)TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) <= 5)
        && ((((u16)(((0x70000
                      & ((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54) + TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28))
                         << 0x10))
                     >> 0x10)
                    * 0x14)
              + TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk24))
             << 0x11)
            != 0x012A0000)) {
        temp_r4_5 = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, GameOverB, unk0);
        (&TASK_GET_MEMBER(PlayerNameMenu, gCurTask, Strc_8052C84, unk0))->unkA
            = (s16)((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkF8) * 0x10) + 0x78);

        if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk2C) > 0x10) {
            var_r1_4 = 16 - TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk2C);
        } else {
            var_r1_4 = TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk2C) - 16;
        }
        (&TASK_GET_MEMBER(PlayerNameMenu, gCurTask, Strc_80528AC, unk0))->layoutSize = (s16)(0xD - (var_r1_4 >> 2));
        sub_805321C(&gUnknown_0868856C[0], temp_r4_5);
    }

    gfx = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, GraphicsData, gfx98);
    gfx->src = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[0][0]);
    temp_r1_41 = (((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54) - 2) << 7) + 0x1E) & 0x7FF;
    gfx->dest = (void *)((uintptr_t)gfx->dest + VRAM + ((0x1F00 & gBgCntRegs[1]) * 8));
    gfx->size = 0x18;
    gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = gfx;
    gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
    gfx = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, GraphicsData, gfxA4);
    gfx->src = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkE0[0][0]);
    temp_r1_42 = (((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54) - 2) << 7) + 0x5E) & 0x7FF;
    gfx->dest = (void *)(BG_VRAM + temp_r1_42 + ((0x1F00 & gBgCntRegs[1]) * 8));
    gfx->size = sizeof(menu->unkE0);
    gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = gfx;
    gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;

    if (temp_r8 != TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54)) {
        gfx = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, GraphicsData, gfxB0);
        temp_r6_3 = (temp_r8 + 6) << 7;
        gfx->src = &gUnknown_08685D3C[15 + (temp_r6_3 & 0x7FF)];
        temp_r4_6 = ((temp_r8 - 2) << 7);
        temp_r1_44 = (temp_r4_6 + 0x1E) & 0x7FF;
        gfx->dest = (void *)(temp_r1_44 + BG_VRAM + ((0x1F00 & gBgCntRegs[1]) * 8));
        gfx->size = 0x18;
        gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = gfx;
        gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
        gfx = &TASK_GET_MEMBER(PlayerNameMenu, gCurTask, GraphicsData, gfxBC);
        if (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk28) == 0) {
            var_r0_6 = temp_r4_6;
        } else {
            var_r0_6 = temp_r6_3;
        }
        gfx->src = &temp_r3_6[(var_r0_6 + 0x40) & 0x7FF];
        temp_r1_45 = ((temp_r8 * 2) - 0xA2) & 0x7FF;
        gfx->dest = (void *)(VRAM + temp_r1_45 + ((0x1F00 & gBgCntRegs[1]) * 8));
        gfx->size = 0x18;
        gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = gfx;
        gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
    }
    gBgScrollRegs[1][1] = ((TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unk54) * 0x10) - 0x30) & 0x1FF;
}
END_NONMATCH

// (99.87%%) https://decomp.me/scratch/hkbKh
NONMATCH("asm/non_matching/game/sa1/ui/player_name_input_menu__Task_80595DC.inc", void Task_80595DC(void))
{
    u32 temp_r5;
    u32 i, j;
    s32 var_r7 = 0;
    PlayerNameMenu *menu = TASK_DATA(gCurTask);
    Task *t;

    sub_805423C(&menu->strc18);

    incUnkFC();

#ifndef NON_MATCHING
    asm("ldr %0, [%1]" : "=r"(t) : "r"(&gCurTask));
#else
    t = gCurTask;
#endif

    if (TASK_GET_MEMBER(PlayerNameMenu, t, s16, unkFC) > 60) {
        for (i = 0; i < 6; i++) {
            temp_r5 = (TASK_GET_MEMBER(PlayerNameMenu, gCurTask, s16, unkC8[i][2]) - Q(32) - 1);
            j = ((temp_r5 / 40u) * 10) + ((temp_r5 % 40u) / 2);

            if (LOADED_SAVE->playerName[i] != gUnknown_08688444[j]) {
                var_r7 = 1;
                LOADED_SAVE->playerName[i] = gUnknown_08688444[j];
            }
        }

        if (var_r7 != 0) {
            LOADED_SAVE->unk4 = (s32)gFrameCount;
            {
                u16 prevIME, prevIE, prevDispstat;
                m4aMPlayAllStop();
                m4aSoundVSyncOff();

                gFlags |= FLAGS_8000;

                prevIE = REG_IE;
                prevIME = REG_IME;
                prevDispstat = REG_DISPSTAT;

                REG_IE = 0;
                REG_IE;
                REG_IME = 0;
                REG_IME;
                REG_DISPSTAT = 0;
                REG_DISPSTAT;

                gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;

                SlowDmaStop(0);
                SlowDmaStop(1);
                SlowDmaStop(2);
                SlowDmaStop(3);

                WriteSaveGame();

                REG_IE = prevIE;
                REG_IE;
                REG_IME = prevIME;
                REG_IME;
                REG_DISPSTAT = prevDispstat;
                REG_DISPSTAT;

                m4aSoundVSyncOn();
            }

            gFlags &= ~FLAGS_8000;
        }
        TaskDestroy(gCurTask);

        gBgSprites_Unknown1[1] = 0;
        gBgSprites_Unknown2[1][0] = 0;
        gBgSprites_Unknown2[1][1] = 0;
        gBgSprites_Unknown2[1][2] = 0xFF;
        gBgSprites_Unknown2[1][3] = 0x20;
        gBgSprites_Unknown1[2] = 0;
        gBgSprites_Unknown2[2][0] = 0;
        gBgSprites_Unknown2[2][1] = 0;
        gBgSprites_Unknown2[2][2] = 0xFF;
        gBgSprites_Unknown2[2][3] = 0x20;

        if (gGameMode == 2) {
            CreateMultiplayerModeSelectScreen();
            return;
        }
        CreatePlayerDataMenu();
    }
}
END_NONMATCH
