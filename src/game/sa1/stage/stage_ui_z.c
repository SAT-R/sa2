#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "data/sa1/ui_graphics.h"
#include "game/shared/stage/player.h"
#include "game/globals.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/shared/stage/mp_player.h"
#include "game/sa1/stage/mp_hud.h" // CreateChaoHuntHUD
#include "game/sa1/stage/stage_ui.h"
#include "game/shared/stage/underwater_effects.h"
#include "game/shared/stage/water_effects.h"

#include "constants/sa1/ui_graphics.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/sa1/zones.h"

void Task_8055458(void);
void Task_8055730(void);
void Task_8055798(void);
void Task_8055904(void);
void Task_8055998(void);
void Task_8055AA0(void);
void Task_8055B18(void);
void TaskDestructor_8055C38(struct Task *);
void TaskDestructor_StrcUI28_8055C4C(struct Task *);

extern const char gUnknown_08688378[];
extern const char gUnknown_08688386[];
extern const char gUnknown_08688394[];
extern const char gUnknown_08688398[];
extern const char gUnknown_086883AC[];
extern const char gUnknown_086883B0[];
extern const char gUnknown_086883B8[];
extern const char gUnknown_086883C4[];
extern const char gUnknown_086883CC[24];

/* TODO: Different module? */
bool32 sub_80549FC(void)
{
    bool32 result = FALSE;

    if (gSelectedCharacter == CHARACTER_KNUCKLES) {
        if (gPlayer.charState >= 70 && gPlayer.charState <= 75) {
            result = TRUE;
        }
    }

    return result;
}

/* TODO: Different module? */
bool32 sub_8054A28(void)
{
    bool32 result = FALSE;

    if (gSelectedCharacter == CHARACTER_KNUCKLES) {
        if (gPlayer.charState >= 62 && gPlayer.charState <= 69) {
            result = TRUE;
        }
    }

    return result;
}

/* TODO: Different module? */
bool32 sub_8054A54(void)
{
    bool32 result = FALSE;

    if (gSelectedCharacter == CHARACTER_AMY) {
        if (gPlayer.charState >= 91 && gPlayer.charState <= 93) {
            result = TRUE;
        }
    }

    return result;
}

// (71.41%) https://decomp.me/scratch/T4csx
NONMATCH("asm/non_matching/game/sa1/stage/intro__LoadStageIntroGraphics.inc", void LoadStageIntroGraphics(StrcStack *param0))
{
    Strc_80528AC sp00; // size: 0x30
    s32 act = (gCurrentLevel & 0x1);
    const void *tiles;

    sp00.uiGfxID = UIGFX_STGINTRO_ZIGZAG_SONIC + gSelectedCharacter;
    sp00.unk2B = 6;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.tilesSize = 0x400;
    sp00.paletteSize = 32;
    sp00.unk28 = 15;
    sp00.vramC = param0->vram4;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = UIGFX_STGINTRO_CHAR_NAMES;
    sp00.unk2B = 7;
    sp00.tiles = gUiGraphics[UIGFX_STGINTRO_CHAR_NAMES].tiles + (gSelectedCharacter * 0x800);
    sp00.palette = gUiGraphics[UIGFX_STGINTRO_CHAR_NAMES].palette;
    sp00.tilesSize = 0x800;
    sp00.paletteSize = 32;
    sp00.unk28 = 15;
    sp00.vramC = VRAM_RESERVED_STGINTRO_CHAR_NAME;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[UIGFX_STGINTRO_CHAR_NAMES].unk8;
    sp00.unk0.unk8 = gUiGraphics[UIGFX_STGINTRO_CHAR_NAMES].unkC;
    sp00.unk0.unk9 = gUiGraphics[UIGFX_STGINTRO_CHAR_NAMES].unk10;
    sp00.unk0.unkA = gUiGraphics[UIGFX_STGINTRO_CHAR_NAMES].unk14;
    sp00.unk0.unkB = gUiGraphics[UIGFX_STGINTRO_CHAR_NAMES].unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = UIGFX_STGRESULT_HEADLINE_BACK;
    sp00.unk2B = 8;
    sp00.tiles = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].tiles;
    sp00.palette = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].palette;
    sp00.tilesSize = 0x200;
    sp00.paletteSize = 32;
    sp00.unk28 = 6;
    sp00.vramC = param0->vram0;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk8;
    sp00.unk0.unk8 = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unkC;
    sp00.unk0.unk9 = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk10;
    sp00.unk0.unkA = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk14;
    sp00.unk0.unkB = gUiGraphics[UIGFX_STGRESULT_HEADLINE_BACK].unk18;
    sub_80528AC(&sp00);

    if (gCurrentLevel <= LEVEL_INDEX(ZONE_7, ACT_2)) {
        sp00.uiGfxID = UIGFX_STGNAMES_JP_0;
        sp00.unk2B = 9;
        sp00.tiles = gUiGraphics[UIGFX_STGNAMES_JP_0].tiles + (49 * TILE_SIZE_4BPP);
        sp00.palette = gUiGraphics[UIGFX_STGNAMES_JP_0].palette;
        sp00.tilesSize = (12 - gUnknown_08688378[gCurrentLevel]) * TILE_SIZE_4BPP;
        sp00.paletteSize = 32;
        sp00.unk28 = 6;
        sp00.vramC = param0->vram8;
        sp00.unk2A = 13;
        sp00.unk0.unk4 = gUiGraphics[UIGFX_STGNAMES_JP_0].unk8;
        sp00.unk0.unk8 = gUiGraphics[UIGFX_STGNAMES_JP_0].unkC;
        sp00.unk0.unk9 = gUiGraphics[UIGFX_STGNAMES_JP_0].unk10;
        sp00.unk0.unkA = gUiGraphics[UIGFX_STGNAMES_JP_0].unk14;
        sp00.unk0.unkB = gUiGraphics[UIGFX_STGNAMES_JP_0].unk18;
        sub_80528AC(&sp00);

        sp00.uiGfxID = UIGFX_STGNAMES_JP_0;
        sp00.unk2B = 9;
        sp00.tiles = gUiGraphics[UIGFX_STGNAMES_JP_0].tiles + 8 * TILE_SIZE_4BPP;
        sp00.palette = gUiGraphics[UIGFX_STGNAMES_JP_0].palette;
        sp00.tilesSize = 0x80;
        sp00.paletteSize = 32;
        sp00.unk28 = 6;
        sp00.vramC = param0->vram8 + 0x180;
        sp00.unk2A = 13;
        sp00.unk0.unk4 = gUiGraphics[UIGFX_STGNAMES_JP_0].unk8;
        sp00.unk0.unk8 = gUiGraphics[UIGFX_STGNAMES_JP_0].unkC;
        sp00.unk0.unk9 = gUiGraphics[UIGFX_STGNAMES_JP_0].unk10;
        sp00.unk0.unkA = gUiGraphics[UIGFX_STGNAMES_JP_0].unk14;
        sp00.unk0.unkB = gUiGraphics[UIGFX_STGNAMES_JP_0].unk18;
        sub_80528AC(&sp00);

        sp00.uiGfxID = UIGFX_STGNAMES_JP_0;
        sp00.unk2B = 9;
        sp00.tiles = gUiGraphics[UIGFX_STGNAMES_JP_0].tiles + gUnknown_08688386[gCurrentLevel] * TILE_SIZE_4BPP;
        sp00.palette = gUiGraphics[UIGFX_STGNAMES_JP_0].palette;
        sp00.tilesSize = gUnknown_08688378[gCurrentLevel] * TILE_SIZE_4BPP;
        sp00.paletteSize = 32;
        sp00.unk28 = 6;
        sp00.vramC = param0->vram8 + (12 - gUnknown_08688378[gCurrentLevel]) * TILE_SIZE_4BPP;
        sp00.unk2A = 13;
        sp00.unk0.unk4 = gUiGraphics[UIGFX_STGNAMES_JP_0].unk8;
        sp00.unk0.unk8 = gUiGraphics[UIGFX_STGNAMES_JP_0].unkC;
        sp00.unk0.unk9 = gUiGraphics[UIGFX_STGNAMES_JP_0].unk10;
        sp00.unk0.unkA = gUiGraphics[UIGFX_STGNAMES_JP_0].unk14;
        sp00.unk0.unkB = gUiGraphics[UIGFX_STGNAMES_JP_0].unk18;
        sub_80528AC(&sp00);

        sp00.uiGfxID = UIGFX_STGNAMES_JP_0;
        sp00.unk2B = 9;
        sp00.tiles = gUiGraphics[UIGFX_STGNAMES_JP_0].tiles + 0x100;
        sp00.palette = gUiGraphics[UIGFX_STGNAMES_JP_0].palette;
        sp00.tilesSize = 32;
        sp00.paletteSize = 32;
        sp00.unk28 = 6;
        sp00.vramC = param0->vram8;
        sp00.unk2A = 13;
        sp00.unk0.unk4 = gUiGraphics[UIGFX_STGNAMES_JP_0].unk8;
        sp00.unk0.unk8 = gUiGraphics[UIGFX_STGNAMES_JP_0].unkC;
        sp00.unk0.unk9 = gUiGraphics[UIGFX_STGNAMES_JP_0].unk10;
        sp00.unk0.unkA = gUiGraphics[UIGFX_STGNAMES_JP_0].unk14;
        sp00.unk0.unkB = gUiGraphics[UIGFX_STGNAMES_JP_0].unk18;
        sub_80528AC(&sp00);

        sp00.unk0.unk4 = 4;
        sp00.unk0.unk8 = 1;
        sp00.unk0.unk9 = 1;
        sp00.unk0.unkA = 4;
        sp00.unk0.unkB = 1;
        sub_80535C8(&sp00.unk0, 9);
    } else {
        s32 v;
        sp00.uiGfxID = 18;
        sp00.unk2B = 9;
        sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles + (gCurrentLevel - 14) * (16 * TILE_SIZE_4BPP);
        sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
        sp00.tilesSize = 0x200;
        sp00.paletteSize = 32;
        sp00.unk28 = 6;
        sp00.vramC = param0->vram8;
        sp00.unk2A = 13;
        v = gUiGraphics[sp00.uiGfxID].unk8;
        sp00.unk0.unk4 = v;
        v = gUiGraphics[sp00.uiGfxID].unkC;
        sp00.unk0.unk8 = v;
        v = gUiGraphics[sp00.uiGfxID].unk10;
        sp00.unk0.unk9 = v;
        v = gUiGraphics[sp00.uiGfxID].unk14;
        sp00.unk0.unkA = v;
        v = gUiGraphics[sp00.uiGfxID].unk18;
        sp00.unk0.unkB = v;
        sub_80528AC(&sp00);
    }

    sp00.uiGfxID = UIGFX_STGRESULT_ACT12;
    sp00.unk2B = 10;
    tiles = (gUiGraphics[UIGFX_STGRESULT_ACT12].tiles + 0x100);
    sp00.tiles = tiles + act * 0x80;
    // sp00.palette = gUiGraphics[UIGFX_STGRESULT_ACT12].palette;
    sp00.tilesSize = 0x80;
    sp00.vramC = param0->vram10 + (8 * TILE_SIZE_4BPP);
    sp00.unk2A = 9;
    sp00.unk0.unk4 = gUiGraphics[UIGFX_STGRESULT_ACT12].unk8;
    sp00.unk0.unk8 = gUiGraphics[UIGFX_STGRESULT_ACT12].unkC;
    sp00.unk0.unk9 = gUiGraphics[UIGFX_STGRESULT_ACT12].unk10;
    sp00.unk0.unkA = gUiGraphics[UIGFX_STGRESULT_ACT12].unk14;
    sp00.unk0.unkB = gUiGraphics[UIGFX_STGRESULT_ACT12].unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = UIGFX_STGRESULT_ACT12;
    sp00.unk2B = 10;
    sp00.tiles = gUiGraphics[UIGFX_STGRESULT_ACT12].tiles;
    sp00.palette = gUiGraphics[UIGFX_STGRESULT_ACT12].palette;
    sp00.tilesSize = 0x100;
    sp00.vramC = param0->vram10;
    sp00.paletteSize = 32;
    sp00.unk28 = 6;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[UIGFX_STGRESULT_ACT12].unk8;
    sp00.unk0.unk8 = gUiGraphics[UIGFX_STGRESULT_ACT12].unkC;
    sp00.unk0.unk9 = gUiGraphics[UIGFX_STGRESULT_ACT12].unk10;
    sp00.unk0.unkA = gUiGraphics[UIGFX_STGRESULT_ACT12].unk14;
    sp00.unk0.unkB = gUiGraphics[UIGFX_STGRESULT_ACT12].unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = gUnknown_08688398[gCurrentLevel] + 19;
    sp00.unk2B = 2;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.palette = gUiGraphics[UIGFX_STGNAME_1].palette;
    sp00.tilesSize = 0x700;
    sp00.paletteSize = 32;
    sp00.unk28 = 6;
    sp00.vramC = param0->vramC;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);

    sp00.unk0.unk4 = 8;
    sp00.unk0.unk8 = 2;
    sp00.unk0.unk9 = 1;
    sp00.unk0.unkA = 4;
    sp00.unk0.unkB = 2;
    sub_80535C8(&sp00.unk0, 2);
}
END_NONMATCH

// Output: struct Task *t -> Struct_sub_80550F8
// (94.00%) https://decomp.me/scratch/e0aBK
NONMATCH("asm/non_matching/game/sa1/stage/stage_ui__sub_80550F8.inc", struct Task *sub_80550F8(void))
{
    Strc_Ui_24 *ui_24;
    Strc_Ui_28 *ui_28;
    struct Task *t, *tt;
    void *vram0, *vram1;
    StrcStack sp04;
    u8 i;
    struct Task *t6;

    if ((gCurrentLevel <= LEVEL_INDEX(ZONE_7, ACT_1)) && ((gCurrentLevel & 0x1) != ACT_1) && (gFinalBossActive != gCurrentLevel)
        && (!IS_EXTRA_STAGE(gCurrentLevel))) {
        for (i = 0; i < 8; i++) {
            OamData *oam = OamMalloc(UI_OAM_ORDER_INDEX);

            if (iwram_end == oam) {
                break;
            }

            oam->all.attr0 = 0x400 | 42;
            oam->all.attr1 = i * 32 + ~0x7FFF;
            oam->all.attr2 = 0x6080;
        }
    }

    sub_80535FC();
    UiGfxStackInit();
    // _08055164

    tt = TaskCreate(Task_8055730, sizeof(Strc_Ui_24), 0x2120, 0, TaskDestructor_8055C38);
    sp04.task1C = tt;
    ui_24 = TASK_DATA(tt);
    ui_24->unk18 = 0;
    ui_24->unk20 = 1;
    ui_24->unk1A = 0;
    ui_24->unk0.qUnkA = -Q(80. / 256.);
    ui_24->unk0.unkC = 0;
    ui_24->unk0.unkE = 3;
    ui_24->unk0.unk8 = 24;
    ui_24->unk0.unk10 = 6;
    ui_24->unk0.unk16 = 0;
    ui_24->unk0.unk12 = 15;
    ui_24->unk0.unk14 = 5;
    ui_24->unk1C = VramMalloc(32);
    sp04.vram4 = ui_24->unk1C;
    ui_24->unk21 = 0;

    tt = TaskCreate(Task_8055798, sizeof(Strc_Ui_24), 0x2120, 0, NULL);
    sp04.task20 = tt;
    ui_24 = TASK_DATA(tt);
    ui_24->unk18 = 0;
    ui_24->unk20 = 0;
    ui_24->unk1A = 1;
    ui_24->unk0.qUnkA = +Q(20. / 256.);
    ui_24->unk0.unkE = 1;
    ui_24->unk0.unk8 = 24;
    ui_24->unk0.unk10 = 7;
    ui_24->unk0.unk12 = 15;
#if 0
    ui_24->unk0.unk16 = 3;
#else
    ui_24->unk0.unk16 = 1;
#endif
    ui_24->unk0.unk8 = 16;
    ui_24->unk21 = 0;

    tt = TaskCreate(Task_8055904, sizeof(Strc_Ui_24), 0x2120, 0, TaskDestructor_8055C38);
    sp04.task14 = tt;
    ui_24 = TASK_DATA(tt);
    ui_24->unk18 = 0;
    ui_24->unk20 = 1;
    ui_24->unk1A = 0;
    ui_24->unk0.qUnkA = +Q(180. / 256.);
    ui_24->unk0.unkC = 160;
    ui_24->unk0.unkE = 6;
    ui_24->unk0.unk10 = 10;
    ui_24->unk0.unk12 = 6;
    ui_24->unk0.unk16 = 1;
    ui_24->unk0.unk8 = 0;
    ui_24->unk1C = VramMalloc(12);
    sp04.vram10 = ui_24->unk1C;
    ui_24->unk21 = 0;

    tt = TaskCreate(Task_8055998, sizeof(Strc_Ui_24), 0x2120, 0, TaskDestructor_8055C38);
    sp04.task18 = tt;
    ui_24 = TASK_DATA(tt);
    ui_24->unk18 = 0;
    ui_24->unk20 = 1;
    ui_24->unk1A = 0;

    if (((gCurrentLevel & 0x1) != ACT_1) && (gFinalBossActive != gCurrentLevel) && (!IS_EXTRA_STAGE(gCurrentLevel))) {
        ui_24->unk0.qUnkA = -Q(16. / 256.);
        ui_24->unk0.unkC = +42;

    } else {
        ui_24->unk0.qUnkA = +Q(240. / 256.);
        ui_24->unk0.unkC = 126;
    }

    ui_24->unk0.unkE = 8;
    ui_24->unk0.unk10 = 8;
    ui_24->unk0.unk12 = 6;
    ui_24->unk0.unk16 = 1;
    ui_24->unk0.unk8 = 8;
    ui_24->unk1C = VramMalloc(16);
    sp04.vram0 = ui_24->unk1C;
    ui_24->unk21 = 0;

    tt = TaskCreate(Task_8055AA0, sizeof(Strc_Ui_24), 0x2120, 0, TaskDestructor_8055C38);
    sp04.task24 = tt;
    ui_24 = TASK_DATA(tt);
    ui_24->unk18 = 0;
    ui_24->unk20 = 1;
    ui_24->unk1A = 0;
    ui_24->unk0.qUnkA = +Q(360. / 256.);
    ui_24->unk0.unkC = 114;
    ui_24->unk0.unkE = 4;
    ui_24->unk0.unk10 = 9;
    ui_24->unk0.unk12 = 6;
    ui_24->unk0.unk16 = 1;
    ui_24->unk0.unk8 = 0;
    ui_24->unk1C = VramMalloc(16);
    sp04.vram8 = ui_24->unk1C;
    ui_24->unk21 = 0;

    t6 = TaskCreate(Task_8055B18, sizeof(Strc_Ui_24), 0x2120, 0, TaskDestructor_8055C38);
    ui_24 = TASK_DATA(t6);
    ui_24->unk18 = 0;
    ui_24->unk20 = 1;
    ui_24->unk1A = 0;
    ui_24->unk0.qUnkA = +Q(1.0);
    ui_24->unk0.unkC = 128;
    ui_24->unk0.unkE = 9;
    ui_24->unk0.unk10 = 2;
    ui_24->unk0.unk12 = 6;
    ui_24->unk0.unk16 = 1;
    ui_24->unk0.unk8 = 0;
    ui_24->unk1C = VramMalloc(56);
    sp04.vramC = ui_24->unk1C;
    ui_24->unk21 = 0;

    t = TaskCreate(Task_8055458, sizeof(Strc_Ui_28), 0x2100, 0, TaskDestructor_StrcUI28_8055C4C);
    ui_28 = TASK_DATA(t);
    ui_28->unk24 = 0;
    ui_28->unk26 = 1;
    ui_28->taskC = sp04.task1C;
    ui_28->task10 = sp04.task20;
    ui_28->task14 = sp04.task18;
    ui_28->task18 = sp04.task24;
    ui_28->task1C = sp04.task14;
    ui_28->task20 = t6;
    ui_28->unk0.unk0 = 0;
    ui_28->unk0.unk2 = 0;
    ui_28->unk0.unk4 = 2;
    ui_28->unk0.unk6 = 0;
    ui_28->unk0.unk8 = 96;
    ui_28->unk0.unkA = 1;
    ui_28->unk27 = 0;

    LoadStageIntroGraphics(&sp04);
    sub_805423C(&ui_28->unk0);

    return t;
}
END_NONMATCH

// (90.26%) https://decomp.me/scratch/eeD7q
NONMATCH("asm/non_matching/game/sa1/stage/stage_ui__Task_8055458.inc", void Task_8055458(void))
{
    Strc_Ui_28 *strcMain = TASK_DATA(gCurTask);
    Strc_Ui_24 *strc1 = TASK_DATA(strcMain->taskC);
    Strc_Ui_24 *strc2 = TASK_DATA(strcMain->task10);
    Strc_Ui_24 *strc3 = TASK_DATA(strcMain->task14);
    Strc_Ui_24 *strc4 = TASK_DATA(strcMain->task18);
    Strc_Ui_24 *strc5 = TASK_DATA(strcMain->task1C);
    Strc_Ui_24 *strc6 = TASK_DATA(strcMain->task20);

    if ((gPressedKeys & (A_BUTTON | B_BUTTON | DPAD_ANY)) && IS_SINGLE_PLAYER) {
        if ((strcMain->unk24 > 35) && (strcMain->unk24 < 215)) {
            strcMain->unk24 = 215;

            strcMain->unk0.unk8 = Div(0x2000 - strcMain->unk0.unk6, 10);

            if (strcMain->unk27 == 0) {
                strcMain->unk26 = sub_805423C(&strcMain->unk0);
            }
        }
    }
    // _080554E8

    strc1->unk18 = strcMain->unk24;
    strc2->unk18 = strcMain->unk24;
    strc3->unk18 = strcMain->unk24;
    strc4->unk18 = strcMain->unk24;
    strc5->unk18 = strcMain->unk24;
    strc6->unk18 = strcMain->unk24;

    strc1->unk20 = strcMain->unk26;
    strc2->unk20 = strcMain->unk26;
    strc3->unk20 = strcMain->unk26;
    strc4->unk20 = strcMain->unk26;
    strc5->unk20 = strcMain->unk26;
    strc6->unk20 = strcMain->unk26;

    strc1->unk21 = strcMain->unk27;
    strc2->unk21 = strcMain->unk27;
    strc3->unk21 = strcMain->unk27;
    strc4->unk21 = strcMain->unk27;
    strc5->unk21 = strcMain->unk27;
    strc6->unk21 = strcMain->unk27;

    if (strcMain->unk27 == 0) {
        if ((strcMain->unk24 <= 105) || !strcMain->unk26) {
            if (strcMain->unk24 > 20) {
                strcMain->unk26 = sub_805423C(&strcMain->unk0);
            } else {
                sub_80543A4(&strcMain->unk0);
            }
        }
    }
    // _080555AE

    if (++strcMain->unk24 > 225) {
        // _080555BE
        if (strc1->unk0.unk0 == 0) {
            gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON | DISPCNT_OBJWIN_ON);
            gBldRegs.bldCnt = 0;
            gBldRegs.bldY = 0;
        }

        if (IS_MULTI_PLAYER) {
            u32 i;
            for (i = 0; (i < MULTI_SIO_PLAYERS_MAX) && (gMultiplayerPlayerTasks[i] != NULL); i++) {
                MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);
                mpp->unk5C &= ~0x2;
            }

            gPlayer.timerInvulnerability = TIME(0, 2);
        }
        // _08055622

        gStageFlags &= ~STAGE_FLAG__ACT_START;
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        gPartner.moveState &= ~MOVESTATE_IGNORE_INPUT;

        gFinalBossActive = gCurrentLevel;

        gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__80;
        gStageFlags &= ~STAGE_FLAG__DISABLE_PAUSE_MENU;

        if (gCurrentLevel == LEVEL_INDEX(ZONE_4, ACT_1) || gCurrentLevel == LEVEL_INDEX(ZONE_4, ACT_2)) {
            LoadPalette423Anim();
            InitWaterPalettes();
        }

        TaskDestroy(strcMain->task20);
        TaskDestroy(strcMain->task1C);
        TaskDestroy(strcMain->task18);
        TaskDestroy(strcMain->task14);
        TaskDestroy(strcMain->task10);
        TaskDestroy(strcMain->taskC);
        TaskDestroy(gCurTask);

        if (IS_SINGLE_PLAYER | (gGameMode == GAME_MODE_RACE) || (gGameMode == GAME_MODE_MULTI_PLAYER)) {
            CreateStageUI();
        } else {
            CreateChaoHuntHUD();
        }

        if (IS_EXTRA_STAGE(gCurrentLevel)) {
            sub_804A5D8(Q(DISPLAY_CENTER_X), Q(DISPLAY_CENTER_Y));
        }
    } else if (gCurrentLevel == LEVEL_INDEX(ZONE_4, ACT_1) || gCurrentLevel == LEVEL_INDEX(ZONE_4, ACT_2)) {
        //_08055708
        InitWaterPalettes();
    }
}
END_NONMATCH

void Task_8055730(void)
{
    Strc_Ui_24 *strc = TASK_DATA(gCurTask);

    if (strc->unk18 > 215) {
        strc->unk0.qUnkA -= Q(8. / 256.);
    } else if (strc->unk18 > 10) {
        strc->unk0.qUnkA = 0;
    } else if (strc->unk18 > 0) {
        strc->unk0.qUnkA += Q(8. / 256.);
    }

    if (((strc->unk18 >= 0) && (strc->unk18 <= 105)) || !strc->unk20 || (strc->unk21 != 0)) {
        // TODO: Resolve cast!
        sub_8052F78((const char *)gUnknown_086883AC, (void *)strc);
    } else {
        // TODO: Resolve cast!
        sub_80530CC((const char *)gUnknown_086883AC, (void *)strc);
    }
}

// (65.69%) https://decomp.me/scratch/wlHG6
NONMATCH("asm/non_matching/game/sa1/stage/stage_ui__Task_8055798.inc", void Task_8055798(void))
{
    Strc_Ui_24 *strc = TASK_DATA(gCurTask);

    if (strc->unk18 > 215) {
        s32 r5 = 0;
        s16 r6 = -Div((strc->unk18 - 215) << 7, 10);
        s16 r8 = r6;
        const char *r7 = gUnknown_08688394;

        for (; r5 < 4; r8 += 0x20, r6 += 0x20, r7++, r5++) {
            strc->unk0.unkC = r6;

            if (r8 >= -32) {
                if (((strc->unk18 >= 0) && (strc->unk18 <= 105)) || !strc->unk20 || (strc->unk21 != 0)) {
                    sub_8052F78(r7, (void *)strc); // TODO: cast
                } else {
                    sub_80530CC(r7, (void *)strc); // TODO: cast
                }
            }
            // _08055814
        }
    } else if (strc->unk18 > 31) {
        // _08055826 + 0x4
        s32 r5 = 0;

        const char *r6 = gUnknown_08688394;

        for (; r5 < 4; r6++, r5++) {
            strc->unk0.unkC = r5 * 32;

            if (((strc->unk18 >= 0) && (strc->unk18 <= 105)) || !strc->unk20 || (strc->unk21 != 0)) {
                sub_8052F78(r6, (void *)strc); // TODO: cast
            } else {
                sub_80530CC(r6, (void *)strc); // TODO: cast
            }
        }
    } else if (strc->unk18 > 25) {
        // _0805586E + 0x4

        s32 r8 = (Div((strc->unk18 - 215) << 7, 6) - 176) & 0x1FF;

        s32 r5 = 0;
        s16 r2 = r8;
        s32 r6 = r2;
        r8 = r2;
        for (; r5 < 4; r2 += 0x20, r6 += 0x20, r5++) {
            if (r8 > 421) {
                strc->unk0.unkC = r6;

                if (r2 >= -0x20) {
                    if (((strc->unk18 >= 0) && (strc->unk18 <= 105)) || !strc->unk20 || (strc->unk21 != 0)) {
                        sub_8052F78((const char *)&gUnknown_08688394[r5], (void *)strc); // TODO: cast
                    } else {
                        sub_80530CC((const char *)&gUnknown_08688394[r5], (void *)strc); // TODO: cast
                    }
                }
            }
        }
    }
}
END_NONMATCH

void Task_8055904(void)
{
    Strc_Ui_24 *strc = TASK_DATA(gCurTask);

    if (strc->unk18 > 215) {
        if (strc->unk0.unkC < 160) {
            strc->unk0.unkC += 2;
        }
    } else if (strc->unk18 > 35) {
        strc->unk0.qUnkA = Q(180. / 256.);
        strc->unk0.unkC = 144;
        strc->unk0.unkE = 6;
    } else if (strc->unk18 > 30) {
        if (strc->unk0.unkC > 144) {
            strc->unk0.unkC -= 3;
        }
    }

    if (gCurrentLevel <= LEVEL_INDEX(ZONE_6, ACT_2)) {
        if (((strc->unk18 >= 0) && (strc->unk18 <= 105)) || !strc->unk20 || (strc->unk21 != 0)) {
            sub_8052F78((const char *)&gUnknown_086883B0[0], (void *)strc); // TODO: cast
        } else {
            sub_80530CC((const char *)&gUnknown_086883B0[0], (void *)strc); // TODO: cast
        }
    }
}

void Task_8055998(void)
{
    Strc_Ui_24 *strc = TASK_DATA(gCurTask);

    if (strc->unk18 > 215) {
        if (strc->unk0.qUnkA < -0x20) {
            strc->unk0.qUnkA += Q(32. / 256.);

            if (strc->unk0.unkE != 0) {
                strc->unk0.unkE--;
            }
        }

        strc->unk0.qUnkA -= Q(26. / 256.);
    } else if (strc->unk18 > 25) {
        strc->unk0.qUnkA = -Q(16. / 256.);
    } else if (strc->unk18 > 15) {
        if (IS_EXTRA_STAGE(gCurrentLevel)) {
            // Extra Stage
            strc->unk0.unkC = 126;
            strc->unk0.qUnkA -= Q(26. / 256);

            if (strc->unk0.qUnkA < -Q(16. / 256.)) {
                strc->unk0.qUnkA = -Q(16. / 256.);
            }
        } else if ((gCurrentLevel < LEVEL_INDEX(ZONE_FINAL, ACT_THE_MOON)) && ((gCurrentLevel & 0x1) != ACT_1)
                   && ((gFinalBossActive) != gCurrentLevel)) {
            // Singleplayer Stage
            strc->unk0.qUnkA = -Q(16. / 256.);
            strc->unk0.unkC += 9;

            if (strc->unk0.unkC > 126) {
                strc->unk0.unkC = 126;
            }
        } else {
            // Multiplayer Stage
            strc->unk0.unkC = 126;
            strc->unk0.qUnkA -= Q(26. / 256);

            if (strc->unk0.qUnkA < -Q(16. / 256.)) {
                strc->unk0.qUnkA = -Q(16. / 256.);
            }
        }
    }

    if ((strc->unk18 >= 0 && strc->unk18 <= 105) || !strc->unk20 || (strc->unk21 != 0)) {
        sub_8052F78((const char *)&gUnknown_086883B8[0], (void *)strc);
    } else {
        sub_80530CC((const char *)&gUnknown_086883B8[0], (void *)strc);
    }
}

void Task_8055AA0()
{
    Strc_Ui_24 *strc = TASK_DATA(gCurTask);

    if (strc->unk18 > 215) {
        strc->unk0.qUnkA -= Q(26. / 256.);
    } else if (strc->unk18 > 25) {
        strc->unk0.qUnkA = Q(112 / 256.);

        // TODO: Match without cast!
    } else if ((u16)strc->unk18 > 15) {
        strc->unk0.qUnkA -= Q(26. / 256.);

        if (strc->unk0.qUnkA < Q(112. / 256.)) {
            strc->unk0.qUnkA = Q(112. / 256.);
        }
    }

    if ((strc->unk18 >= 0 && strc->unk18 <= 105) || !strc->unk20 || (strc->unk21 != 0)) {
        sub_8052F78((const char *)&gUnknown_086883C4[0], (void *)strc);
    } else {
        sub_80530CC((const char *)&gUnknown_086883C4[0], (void *)strc);
    }
}

void Task_8055B18()
{
    // TODO: Inline the mem calls!
    // const u8 arr0[16] = { /* data here */ };
    u8 arr0[22 + 5];
    memcpy((void *)arr0, &gUnknown_086883CC[0], sizeof(arr0) - 5);
    memset((void *)(arr0 + 22), 0, 5);

    {
        Strc_Ui_24 *strc = TASK_DATA(gCurTask);

        if (strc->unk18 > 215) {
            u16 qInitialUnkA = strc->unk0.qUnkA;

            strc->unk0.qUnkA -= Q(28. / 256.);

            if (strc->unk0.qUnkA < -Q(31. / 256.)) {
                strc->unk0.unkE--;
                strc->unk0.qUnkA = qInitialUnkA + Q(4. / 256.);
                strc->unk1A = Mod(strc->unk1A + 1, 7);
            }

            if ((strc->unk18 >= 0 && strc->unk18 <= 105) || !strc->unk20 || (strc->unk21 != 0)) {
                sub_8052F78((const char *)&arr0[strc->unk1A], (void *)strc);
            } else {
                sub_80530CC((const char *)&arr0[strc->unk1A], (void *)strc);
            }
        } else if (strc->unk18 > 25) {
            u16 qInitialUnkA = strc->unk0.qUnkA;
            strc->unk0.qUnkA = qInitialUnkA - Q(2. / 256.);
            strc->unk0.unkE = 9;

            if (strc->unk0.qUnkA < -Q(31. / 256.)) {
                strc->unk0.qUnkA = qInitialUnkA + Q(30. / 256.);
                strc->unk1A = Mod(strc->unk1A + 1, 7);
            }

            if ((strc->unk18 >= 0 && strc->unk18 <= 105) || !strc->unk20 || (strc->unk21 != 0)) {
                sub_8052F78((const char *)&arr0[strc->unk1A], (void *)strc);
            } else {
                sub_80530CC((const char *)&arr0[strc->unk1A], (void *)strc);
            }
        } else if (strc->unk18 > 15) {
            // _08055BC0
            u16 qInitialUnkA;
            strc->unk0.unkC = 0x80;

            qInitialUnkA = strc->unk0.qUnkA;

            strc->unk0.qUnkA -= Q(28. / 256.);

            if (strc->unk0.qUnkA < Q(240. / 256.)) {
                strc->unk0.unkE = 9 - (strc->unk0.qUnkA >> 5);

                if (strc->unk0.qUnkA < -Q(31. / 256.)) {
                    strc->unk0.qUnkA = qInitialUnkA + 4;
                    strc->unk1A = Mod(strc->unk1A + 1, 7);
                }

                if ((strc->unk18 >= 0 && strc->unk18 <= 105) || !strc->unk20 || (strc->unk21 != 0)) {
                    sub_8052F78((const char *)&arr0[strc->unk1A], (void *)strc);
                } else {
                    sub_80530CC((const char *)&arr0[strc->unk1A], (void *)strc);
                }
            }
        }
    }
}

void TaskDestructor_8055C38(struct Task *t)
{
    Strc_Ui_24 *strc = TASK_DATA(t);
#ifdef BUG_FIX
    if (strc->unk1C != NULL)
#endif
    {
        VramFree(strc->unk1C);
    }
}

void TaskDestructor_StrcUI28_8055C4C(struct Task *t) { }