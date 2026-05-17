#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "data/sa1/ui_graphics.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/sa1/save.h"
#include "game/sa1/stage/stage_ui.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/anim_sizes.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/text.h" // for UILANG_COUNT

typedef enum EPDM_Options {
    PDM_OPTION_SELECT_NAME,
    PDM_OPTION_SELECT_VS_RECORD,
    PDM_OPTION_SELECT_OK,

    PDM_OPTION_COUNT
} EPDM_Options;

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Sprite s2[PDM_OPTION_COUNT + 1];
    /* 0xF0 */ StrcUi_805423C strcF0;
    /* 0xFC */ GameOverB unkFC;
    /* 0x114 */ u16 pressedKeys;
    /* 0x116 */ u16 unk116;
    /* 0x118 */ u8 unk118;
    /* 0x119 */ u8 unk119;
} PlayerDataMenu; /* 0x11C */

void CreatePlayerDataMenu();
void Task_PlayerDataMenuInit(void);
void TaskDestructor_PlayerDataMenu(struct Task *t);
void sub_8011C94(void);

extern void CreateOptionsMenu();
extern void CreatePlayerNameInputMenu();
extern void CreateVsRecord();

void PlayerDataSelectName(void);
void PlayerDataSelectVsRecord(void);
void PlayerDataSelectOK(void);

const AnimId sPlayerDataMenuAnims[UILANG_COUNT] = { SA1_ANIM_VS_RECORD_TEXTS_JP, SA1_ANIM_VS_RECORD_TEXTS_EN };
const u8 sPlayerDataMenuVariants[PDM_OPTION_COUNT] = { 1, 0, 2 };
const u8 sPlayerDataMenuYOffsets[PDM_OPTION_COUNT] = { 0x41, 0x59, 0x81 };
const u8 sPlayerDataMenuTileCounts[PDM_OPTION_COUNT] = { 8, 18, 14 };
const VoidFn gUnknown_080BB3D0[PDM_OPTION_COUNT] = {
    PlayerDataSelectName,
    PlayerDataSelectVsRecord,
    PlayerDataSelectOK,
};
const AnimId gPressStartTiles[UILANG_COUNT] = { SA1_ANIM_PRESS_START_MSG_JP, SA1_ANIM_PRESS_START_MSG_EN };

extern const u8 gPalette_086CCD34[0x20];
extern const u8 gTiles_086CCD54[0xBA0];
extern const u8 gLayout_086CD8F4[0x500];
extern const u8 gLayout_086CDDF4[0x500];

void CreatePlayerDataMenu()
{
    Strc_80528AC sp4;
    const UiGraphics *sp40;
    Sprite *s;
    StrcUi_805423C *temp_r4;
    u8 i;

    struct Task *t;
    PlayerDataMenu *menu;

    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x1B04;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldAlpha = 0;
    gBldRegs.bldY = 0;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    t = TaskCreate(Task_PlayerDataMenuInit, 0x11CU, 0x2000U, 0U, TaskDestructor_PlayerDataMenu);

    menu = TASK_DATA(t);
    s = &menu->s;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(22);
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = 857;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    for (i = 0; i < PDM_OPTION_COUNT; i++) {
        s = &menu->s2[i];
        s->x = 25;
        s->y = sPlayerDataMenuYOffsets[i];
        s->graphics.dest = VramMalloc(sPlayerDataMenuTileCounts[i]);
        s->oamFlags = SPRITE_OAM_ORDER(15);
        s->graphics.size = 0;
        s->graphics.anim = sPlayerDataMenuAnims[LOADED_SAVE->uiLanguage];
        s->variant = sPlayerDataMenuVariants[i];
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = 0xFF;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->frameFlags = 0;
        UpdateSpriteAnimation(s);
    }

    menu->unk116 = 0;
    menu->unk118 = 0;
    menu->unk119 = 0;
    menu->pressedKeys = 0;

    sub_80535FC();

    UiGfxStackInit();

    sp4.uiGfxID = 128;
    sp4.unk2B = 0;
    sp4.tiles = (void *)&gTiles_086CCD54;
    sp4.tilesSize = sizeof(gTiles_086CCD54);
    sp4.palette = (void *)&gPalette_086CCD34;
    sp4.paletteSize = sizeof(gPalette_086CCD34);
    if (LOADED_SAVE->uiLanguage == 0) {
        sp4.layout = gLayout_086CDDF4;
        sp4.layoutSize = sizeof(gLayout_086CDDF4);
    } else {
        sp4.layout = gLayout_086CD8F4;
        sp4.layoutSize = sizeof(gLayout_086CD8F4);
    }
    sp4.unk28 = 0;
    sp4.unk29 = 0;
    sp4.unk2A = 0x15;
    sub_80528AC(&sp4);

    sp4.uiGfxID = UIGFX_ASCII_CHARS;
    sp4.unk2B = 1;
    sp4.tiles = gUiGraphics[sp4.uiGfxID].tiles;
    sp4.palette = gUiGraphics[sp4.uiGfxID].palette;
    sp4.vramC = VramMalloc(0xE0U);
    sp4.tilesSize = 0x1C00;
    sp4.paletteSize = 0x20;
    sp4.unk28 = 1;
    sp4.unk2A = 0xD;
    sp4.unk0.unk4 = gUiGraphics[sp4.uiGfxID].unk8;
    sp4.unk0.unk8 = gUiGraphics[sp4.uiGfxID].unkC;
    sp4.unk0.unk9 = gUiGraphics[sp4.uiGfxID].unk10;
    sp4.unk0.unkA = gUiGraphics[sp4.uiGfxID].unk14;
    sp4.unk0.unkB = gUiGraphics[sp4.uiGfxID].unk18;
    sub_80528AC(&sp4);

    s = &menu->s2[3];
    s->graphics.dest = sp4.vramC;
    sp4.uiGfxID = 60;
    sp4.unk2B = 2;
    sp4.tiles = gUiGraphics[sp4.uiGfxID].tiles;
    sp4.palette = gUiGraphics[sp4.uiGfxID].palette;
    sp4.vramC = s->graphics.dest;
    sp4.tilesSize = 0x20;
    sp4.paletteSize = 0x20;
    sp4.unk28 = 1;
    sp4.unk2A = 0xC;
    sp4.unk0.unk4 = gUiGraphics[sp4.uiGfxID].unk8;
    sp4.unk0.unk8 = gUiGraphics[sp4.uiGfxID].unkC;
    sp4.unk0.unk9 = gUiGraphics[sp4.uiGfxID].unk10;
    sp4.unk0.unkA = gUiGraphics[sp4.uiGfxID].unk14;
    sp4.unk0.unkB = gUiGraphics[sp4.uiGfxID].unk18;
    sub_80528AC(&sp4);

    menu->unkFC.qUnkA = 0x8C;
    menu->unkFC.unkC = 0x3D;
    menu->unkFC.unkE = 1;
    menu->unkFC.unk10 = 1;
    menu->unkFC.unk12 = 1;
    menu->unkFC.unk16 = 1;
    menu->unkFC.unk8 = 0;

    i = 0;
    temp_r4 = &menu->strcF0;
    for (i = 0; i < 6; i++) {
        if ((u8)(LOADED_SAVE->playerName[i] - 0x20) > 105) {
            LOADED_SAVE->playerName[i] = 0x20;
        }
    }

    temp_r4->unk0 = 0;
    temp_r4->unk2 = 1;
    temp_r4->unk4 = 2;
    temp_r4->unk6 = 0;
    temp_r4->unk8 = 0x100;
    temp_r4->unkA = 0x10;
    sub_805423C(temp_r4);
    m4aSongNumStart(MUS_PLAYER_DATA);
}

void Task_PlayerDataMenuInit()
{
    StrcUi_805423C *temp_r5;
    s16 temp_r7;
    s32 temp_r0;
    s32 temp_r0_2;
    u16 temp_r1_3;
    u16 temp_r6;
    u8 *temp_r1;
    u8 *temp_r1_2;

    PlayerDataMenu *menu = TASK_DATA(gCurTask);

    temp_r5 = &menu->strcF0;
    if (sub_805423C(temp_r5) != 0) {
        if (temp_r5->unk4 == 2) {
            if (0x40 & gRepeatedKeys) {
                m4aSongNumStart(0x6CU);
                --menu->unk118;
                if (menu->unk118 > 2U) {
                    menu->unk118 = (u8)2;
                }
            } else if (0x80 & gRepeatedKeys) {
                m4aSongNumStart(0x6CU);
                menu->unk118++;
                if (menu->unk118 > 2U) {
                    menu->unk118 = (u8)0;
                }
            }
            if (gPressedKeys & (A_BUTTON | B_BUTTON)) {
                menu->pressedKeys = gPressedKeys;
                temp_r5->unk4 = 1;
                temp_r5->unk6 = 0;
                if (gPressedKeys & A_BUTTON) {
                    m4aSongNumStart(0x6AU);
                } else {
                    m4aSongNumStart(0x6BU);
                }
            }
        } else {
            if (1 & menu->pressedKeys) {
                menu->unk119 = 1;
                gUnknown_080BB3D0[menu->unk118]();
                return;
            } else {
                if (2 & menu->pressedKeys) {
                    PlayerDataSelectOK();
                    return;
                }
            }
        }
    }

    sub_8011C94();
}

void sub_8011C94()
{
    Sprite *s;
    u16 *temp_r6;
    u8 *temp_r1;
    u8 i;

    PlayerDataMenu *menu = TASK_DATA(gCurTask);
    s = &menu->s;

    s->x = 9;
    s->y = sPlayerDataMenuYOffsets[menu->unk118] + (s16)-2;
    DisplaySprite(s);

    for (i = 0; i < PDM_OPTION_COUNT; i++) {
        s = &menu->s2[i];
        if (menu->unk118 == i) {
            s->x = 30;

            if (menu->unk119 != 0) {
                s->palId = 1;
            } else {
                s->palId = 0;
            }
        } else {
            s->x = 25;
        }
        s->y = sPlayerDataMenuYOffsets[i];

        DisplaySprite(s);
    }

    for (i = 0; i < 6; i++) {
        menu->unkFC.qUnkA = (u16)((i * 8) + 0x9F);
        menu->unkFC.unkC = 60;

        if ((u8)(LOADED_SAVE->playerName[i] - 0x70) <= 25) {
            menu->unkFC.unkC = 0x44;
        }

        sub_8052F78((const char *)&LOADED_SAVE->playerName[i], &menu->unkFC);
    }
}

void PlayerDataSelectName(void)
{
    TaskDestroy(gCurTask);
    CreatePlayerNameInputMenu();
}

void PlayerDataSelectVsRecord(void)
{
    TaskDestroy(gCurTask);
    CreateVsRecord();
}

void PlayerDataSelectOK(void)
{
    TaskDestroy(gCurTask);
    CreateOptionsMenu();
}

void TaskDestructor_PlayerDataMenu(struct Task *t)
{
    PlayerDataMenu *menu;
    u8 i;

    menu = TASK_DATA(t);
    VramFree(menu->s.graphics.dest);

    for (i = 0; i < ARRAY_COUNT(menu->s2); i++) {
        VramFree(menu->s2[i].graphics.dest);
    }
}
