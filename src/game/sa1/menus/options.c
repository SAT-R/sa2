#include "global.h"
#include "core.h"
#include "flags.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "data/sa1/ui_graphics.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/sa1/menus/options_screen.h"
#include "game/sa1/save.h"
#include "game/sa1/stage/stage_ui.h"
#include "game/sa1/menus/title_screen.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/anim_sizes.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/text.h" // for UILANG_COUNT

typedef struct {
    /* 0x000 */ Sprite s0;
    /* 0x030 */ Sprite sprites30[8];
    /* 0x1B0 */ Sprite s1B0;
    /* 0x1E0 */ Sprite s1E0;
    /* 0x210 */ Sprite s210;
    /* 0x240 */ Sprite s240;
    /* 0x270 */ Sprite s270;
    /* 0x2A0 */ Sprite s2A0;
    /* 0x2D0 */ Sprite s2D0;
    /* 0x300 */ Sprite s300;
    /* 0x330 */ StrcUi_805423C unk330;
    /* 0x33C */ u16 unk33C;
    /* 0x33E */ u8 unk33E;
    /* 0x33F */ u8 unk33F;
    /* 0x340 */ u8 filler340[0x4];
} OptionsMenu; /* 0x344 */

void Task_OptionsMenuMain(void);
void sub_8010CB4(void);
void sub_8011104(void);
void sub_801123C(void);
void sub_801176C(void);
void TaskDestructor_OptionsMenu(struct Task *t);

extern void sub_8012F6C();
extern void CreatePlayerDataMenu(void);
extern void CreateSoundTest(void);
extern void CreateEmptySaveGame(void);

extern u16 gUnknown_086CC774[16];
extern u8 gUnknown_086CC794[0xA0];
extern u8 gUnknown_086CC834[0x500];

const AnimId gUnknown_080BB36C[2] = { 866, 863 };
const u8 gUnknown_080BB370[8] = { 0, 1, 2, 3, 4, 5, 6, 7 };
const AnimId gUnknown_080BB378[2] = { SA1_ANIM_OPTS_PLDAT_LANG_JP, SA1_ANIM_OPTS_PLDAT_LANG_EN };
const u8 gUnknown_080BB37C[2] = { 11, 12 };
const u8 gUnknown_080BB37E[2] = { 8, 9 };
const u8 gUnknown_080BB380[2] = { 13, 14 };
const u8 gUnknown_080BB382[8] = { 0x1A, 0x0C, 0x10, 0x18, 0x14, 0x1E, 0x24, 0x08 };
const u8 gUnknown_080BB38A[4] = { 2, 0, 3, 1 };

// TODO: Can accesses to this match when it's a winreg_t[2][2][2]?
const winreg_t gUnknown_080BB38E[4][2] = {
    { WIN_RANGE(80, 110), WIN_RANGE(86, 102) },
    { WIN_RANGE(122, 158), WIN_RANGE(86, 102) },
    { WIN_RANGE(83, 116), WIN_RANGE(86, 102) },
    { WIN_RANGE(130, 156), WIN_RANGE(86, 102) },
};

/* These functions get called when pressing A inside the options menu main screen */
extern void OptionsSelectPlayerData(void);
extern void OptionsSelectDifficulty(void);
extern void OptionsSelectTimeUp(void);
extern void OptionsSelectSoundTest(void);
extern void OptionsSelectLanguage(void);
extern void OptionsSelectButtonConfig(void);
extern void OptionsSelectDeleteGameData(void);
extern void OptionsSelectEnd(void);
const VoidFn sOptionsSelectFuncs[] = {
    OptionsSelectPlayerData, OptionsSelectDifficulty,   OptionsSelectTimeUp,         OptionsSelectSoundTest,
    OptionsSelectLanguage,   OptionsSelectButtonConfig, OptionsSelectDeleteGameData, OptionsSelectEnd,
};

void CreateOptionsMenu()
{
    Strc_80528AC sp4;
    s8 *sp34;
    Sprite *s;
    StrcUi_805423C *temp_r0_4;
    s8 *temp_r0;
    s8 *temp_r2;
    s8 var_r0;
    u8 *temp_r0_2;
    u8 *temp_r0_3;
    u8 *temp_r1;
    u8 *temp_r1_2;
    u8 i;

    OptionsMenu *menu;

    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x1E03;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    sub_80535FC();
    UiGfxStackInit();
    gDispCnt &= 0x1FFF;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;

    menu = TASK_DATA(TaskCreate(Task_OptionsMenuMain, 0x344U, 0x2000U, 0U, TaskDestructor_OptionsMenu));
    menu->unk33F = 0;
    menu->unk33C = 0;
    menu->unk33E = 0;
    menu->filler340[0] = 1;

    s = &menu->s0;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(0x16U);
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = 0x359;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    for (i = 0; i < ARRAY_COUNT(menu->sprites30); i++) {
        s = &menu->sprites30[i];
        s->x = 25;
        s->y = 38 + (i * 0x10);
        s->graphics.dest = VramMalloc(gUnknown_080BB382[i]);
        s->oamFlags = SPRITE_OAM_ORDER(15);
        s->graphics.size = 0;
        s->graphics.anim = gUnknown_080BB36C[LOADED_SAVE->uiLanguage];
        s->variant = gUnknown_080BB370[i];
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->frameFlags = 0;
        UpdateSpriteAnimation(s);
    }

    s = &menu->s1B0;
    s->x = 220;
    s->y = 54;
    s->graphics.dest = VramMalloc(0x10U);
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = gUnknown_080BB36C[LOADED_SAVE->uiLanguage];
    s->variant = gUnknown_080BB37C[LOADED_SAVE->difficultyLevel];
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant |= ~0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &menu->s1E0;
    s->x = 0xDC;
    s->y = 0x46;
    s->graphics.dest = VramMalloc(8U);
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = gUnknown_080BB36C[LOADED_SAVE->uiLanguage];
    s->variant = gUnknown_080BB37E[LOADED_SAVE->timeLimitDisabled];
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant |= ~0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &menu->s210;
    s->x = 220;
    s->y = 102;
    s->graphics.dest = VramMalloc(18);
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    if (LOADED_SAVE->language > 1U) {
        s->graphics.anim = 878;
        s->variant = LOADED_SAVE->language - 2;
    } else {
        s->graphics.anim = gUnknown_080BB36C[LOADED_SAVE->uiLanguage];
        s->variant = 10;
    }
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &menu->s240;
    s->x = 0xDC;
    s->y = 0x76;
    s->graphics.dest = VramMalloc(0x10U);
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = gUnknown_080BB36C[LOADED_SAVE->uiLanguage];
    s->variant = gUnknown_080BB380[LOADED_SAVE->btnConfig];
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &menu->s270;
    s->x = DISPLAY_CENTER_X;
    s->y = DISPLAY_CENTER_Y;
    s->graphics.dest = VramMalloc(0x90U);
    s->oamFlags = 0;
    s->graphics.size = 0;
    s->graphics.anim = 877;
    s->variant = gUnknown_080BB38A[LOADED_SAVE->uiLanguage];
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &menu->s2A0;
    s->x = 0;
    s->y = 7;
    s->graphics.dest = VramMalloc(12);
    s->oamFlags = 0x40;
    s->graphics.size = 0;
    s->graphics.anim = 867;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &menu->s2D0;
    s->x = 0;
    s->y = 17;
    s->graphics.dest = VramMalloc(0x16U);
    s->oamFlags = 0;
    s->graphics.size = 0;
    s->graphics.anim = gUnknown_080BB378[LOADED_SAVE->uiLanguage];
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &menu->s300;
    s->x = DISPLAY_WIDTH - 1;
    s->y = DISPLAY_HEIGHT - 1;
    s->graphics.dest = VramMalloc(1U);
    s->oamFlags = 0;
    s->graphics.size = 0;
    s->graphics.anim = 0x35F;
    s->variant = 0xF;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x80000;
    UpdateSpriteAnimation(s);

    sp4.uiGfxID = 128;
    sp4.unk2B = 1;
    sp4.tiles = &gUnknown_086CC794[0];
    sp4.tilesSize = sizeof(gUnknown_086CC794);
    sp4.palette = &gUnknown_086CC774[0];
    sp4.paletteSize = sizeof(gUnknown_086CC774);
    sp4.layout = &gUnknown_086CC834[0];
    sp4.layoutSize = sizeof(gUnknown_086CC834);
    sp4.unk28 = 0;
    sp4.unk29 = 0;
    sp4.unk2A = 0x15;
    sub_80528AC(&sp4);

    temp_r0_4 = &menu->unk330;
    temp_r0_4->unk0 = 0;
    temp_r0_4->unk2 = 1;
    temp_r0_4->unk4 = 2;
    temp_r0_4->unk6 = 0;
    temp_r0_4->unk8 = 0x100;
    temp_r0_4->unkA = 0x10;
    sub_805423C(temp_r0_4);

    m4aSongNumStart(MUS_OPTIONS);
}

void Task_OptionsMenuMain()
{
    StrcUi_805423C *strc;
    s32 temp_r0;
    s32 temp_r0_2;
    u8 *temp_r1;
    u8 *temp_r1_2;
    u8 *temp_r2;
    u8 temp_r0_3;
    u8 temp_r0_4;
    u8 var_r0;
    u8 var_r0_2;

    OptionsMenu *menu = TASK_DATA(gCurTask);

    strc = &menu->unk330;
    menu->unk33F = 0;
    gBgScrollRegs[0][0] = 0;
    if (sub_805423C(strc) != 0) {
        if (strc->unk4 == 2) {
            if (DPAD_UP & gRepeatedKeys) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);

                if (--menu->unk33E > 7U) {
                    menu->unk33E = 7;
                }
            } else if (DPAD_DOWN & gRepeatedKeys) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);

                if (++menu->unk33E > 7) {
                    menu->unk33E = 0;
                }
            }

            if (A_BUTTON & gPressedKeys) {
                m4aSongNumStart(SE_SELECT);

                if ((menu->unk33E == 0) || (menu->unk33E == 3) || (menu->unk33E == 4)) {
                    strc->unk4 = 1;
                    strc->unk6 = 0;
                } else {
                    menu->unk33F = 1;
                    sOptionsSelectFuncs[menu->unk33E]();
                    return;
                }
            } else if (B_BUTTON & gPressedKeys) {
                m4aSongNumStart(SE_RETURN);
                OptionsSelectEnd();
                return;
            }
        } else if ((menu->unk33E == 0) || (menu->unk33E == 3) || (menu->unk33E == 4)) {
            menu->unk33F = 1;
            sOptionsSelectFuncs[menu->unk33E]();
            return;
        }
    }

    sub_8010CB4();
}

void sub_8010CB4()
{
    s16 var_r0;
    u8 i;

    OptionsMenu *menu = TASK_DATA(gCurTask);
    Sprite *s = &menu->s0;

    s->x = 9;
    s->y = (menu->unk33E * 16) + 28;
    DisplaySprite(s);

    for (i = 0; i < 8; i++) {
        s = &menu->sprites30[i];
        if (menu->unk33E == i) {
            if (menu->unk33F != 0) {
                s->palId = 1;
            } else {
                s->palId = 0;
            }
            s->x = 30;
            s->y = (i * 16) + 38;
        } else {
            s->x = 25;
            s->y = (i * 16) + 38;
        }
        DisplaySprite(s);
    }

    s = &menu->s1B0;
    s->x = 220;
    s->y = 54;
    s->prevVariant = -1;
    s->graphics.anim = gUnknown_080BB36C[LOADED_SAVE->uiLanguage];
    s->variant = gUnknown_080BB37C[LOADED_SAVE->difficultyLevel];
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &menu->s1E0;
    s->x = 220;
    s->y = 70;
    s->prevVariant = -1;
    s->graphics.anim = gUnknown_080BB36C[LOADED_SAVE->uiLanguage];
    s->variant = gUnknown_080BB37E[LOADED_SAVE->timeLimitDisabled];
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &menu->s210;
    s->x = 220;
    s->y = 102;
    DisplaySprite(s);

    s = &menu->s240;
    s->x = 220;
    s->y = 118;
    s->prevVariant = -1;
    s->graphics.anim = gUnknown_080BB36C[LOADED_SAVE->uiLanguage];
    s->variant = gUnknown_080BB380[LOADED_SAVE->btnConfig];
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &menu->s2A0;

    for (i = 0; i < 8; i++) {
        s->x = i * 32;
        s->y = 15;
        DisplaySprite(s);
    }

    s = &menu->s2D0;
    if (++menu->unk33C >= 100) {
        menu->unk33C -= 100;
    }

    for (i = 0; i < 4; i++) {
        s->x = (100 * i) - menu->unk33C;
        s->y = 17;
        DisplaySprite(s);
    }
}

void sub_8010E90(void)
{
    if (gRepeatedKeys & DPAD_LEFT) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        LOADED_SAVE->difficultyLevel = DIFFICULTY_EASY;
    } else if (gRepeatedKeys & DPAD_RIGHT) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        LOADED_SAVE->difficultyLevel = DIFFICULTY_NORMAL;
    }

    sub_8010CB4();

    if (gPressedKeys & (A_BUTTON | B_BUTTON)) {
        m4aSongNumStart(SE_SELECT);
        gCurTask->main = Task_OptionsMenuMain;
    }
}

void sub_8010F00(void)
{
    if (gRepeatedKeys & DPAD_LEFT) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        LOADED_SAVE->timeLimitDisabled = 1;
    } else if (gRepeatedKeys & DPAD_RIGHT) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        LOADED_SAVE->timeLimitDisabled = 0;
    }

    sub_8010CB4();

    if (gPressedKeys & (A_BUTTON | B_BUTTON)) {
        m4aSongNumStart(SE_SELECT);
        gCurTask->main = Task_OptionsMenuMain;
    }
}

void sub_8010F70(void)
{
    if (gRepeatedKeys & DPAD_LEFT) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        LOADED_SAVE->btnConfig = BTNCONFIG_NORMAL;
    } else if (gRepeatedKeys & DPAD_RIGHT) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        LOADED_SAVE->btnConfig = BTNCONFIG_REVERSE;
    }

    sub_8010CB4();

    if (gPressedKeys & (A_BUTTON | B_BUTTON)) {
        m4aSongNumStart(SE_SELECT);
        gCurTask->main = Task_OptionsMenuMain;
    }
}

void sub_8010FDC(void)
{
    if (gRepeatedKeys & DPAD_LEFT) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        LOADED_SAVE->uiLanguage = UILANG_ENGLISH;
    } else if (gRepeatedKeys & DPAD_RIGHT) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        LOADED_SAVE->uiLanguage = UILANG_JAPANESE;
    }

    sub_8010CB4();

    if (gPressedKeys & (A_BUTTON | B_BUTTON)) {
        m4aSongNumStart(SE_SELECT);
        gCurTask->main = Task_OptionsMenuMain;
    }
}

void OptionsSelectDeleteGameData()
{
    OptionsMenu *menu = TASK_DATA(gCurTask);
    Sprite *s = &menu->s270;

    menu->unk33F = 2;
    s->variant = gUnknown_080BB38A[LOADED_SAVE->uiLanguage];
    s->prevVariant = -1;
    UpdateSpriteAnimation(s);
    sub_8010CB4();
    gDispCnt |= 0x4000;

    gBldRegs.bldCnt = 0x3FBF;
    gBldRegs.bldAlpha = 0x10;
    gBldRegs.bldY = 12;
    gWinRegs[WINREG_WIN1H] = gUnknown_080BB38E[LOADED_SAVE->uiLanguage * 2 + 1][0];
    gWinRegs[WINREG_WIN1V] = gUnknown_080BB38E[LOADED_SAVE->uiLanguage * 2 + 1][1];
    gWinRegs[WINREG_WININ] = 0x3F00;
    gWinRegs[WINREG_WINOUT] = 0x1F;

    gCurTask->main = sub_8011104;
}

void sub_8011104()
{
    Sprite *s;
    u8 *temp_r4;
    u8 var_r0;
    s32 value;

    OptionsMenu *menu = TASK_DATA(gCurTask);

    s = &menu->s270;
    if (DPAD_LEFT & gRepeatedKeys) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        menu->unk33F = 1;
    } else if (0x10 & gRepeatedKeys) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        menu->unk33F = 2;
    }

    gWinRegs[WINREG_WIN1H] = gUnknown_080BB38E[(menu->unk33F - 1) + (LOADED_SAVE->uiLanguage * 2)][0];
    gWinRegs[WINREG_WIN1V] = gUnknown_080BB38E[(menu->unk33F - 1) + (LOADED_SAVE->uiLanguage * 2)][1];

    if (!(B_BUTTON & gPressedKeys)) {
        if (A_BUTTON & gPressedKeys) {
            if (menu->unk33F != 1) {
            lbl:
                gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON | DISPCNT_OBJWIN_ON);
                gBldRegs.bldCnt = 0;
                gBldRegs.bldY = 0;
                menu->unk33F = 0;
                m4aSongNumStart(SE_RETURN);
                gCurTask->main = Task_OptionsMenuMain;
            } else {
                s->variant = gUnknown_080BB38A[LOADED_SAVE->uiLanguage + 2];
                s->prevVariant = -1;
                UpdateSpriteAnimation(s);
                menu->unk33F = 2;
                m4aSongNumStart(SE_SELECT);
                gCurTask->main = sub_801123C;
            }
        }
    } else {
        goto lbl;
    }

    DisplaySprite(s);
    sub_8010CB4();
}

void sub_801123C()
{
    Sprite *s;

    OptionsMenu *menu = TASK_DATA(gCurTask);

    s = &menu->s270;
    if (DPAD_LEFT & gRepeatedKeys) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        menu->unk33F = 1;
    } else if (DPAD_RIGHT & gRepeatedKeys) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
        menu->unk33F = 2;
    }

    gWinRegs[WINREG_WIN1H] = gUnknown_080BB38E[(menu->unk33F - 1) + (LOADED_SAVE->uiLanguage * 2)][0];
    gWinRegs[WINREG_WIN1V] = gUnknown_080BB38E[(menu->unk33F - 1) + (LOADED_SAVE->uiLanguage * 2)][1];

    if (B_BUTTON & gPressedKeys) {
        goto lbl;
    } else {
        if (A_BUTTON & gPressedKeys) {
            if (menu->unk33F != 1) {
            lbl:
                menu->unk33F = 2;
                s->variant = gUnknown_080BB38A[LOADED_SAVE->uiLanguage];
                s->prevVariant = -1;
                UpdateSpriteAnimation(s);
                m4aSongNumStart(SE_RETURN);
                gCurTask->main = sub_8011104;
            } else {
                u16 prevIME, prevIE, prevDispstat;
                s32 uiLanguage = LOADED_SAVE->uiLanguage;

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

                sub_8012F6C();
                REG_IE = prevIE;
                REG_IE;
                REG_IME = prevIME;
                REG_IME;
                REG_DISPSTAT = prevDispstat;
                REG_DISPSTAT;

                m4aSoundVSyncOn();
                gFlags &= 0xFFFF7FFF;
                m4aSongNumStart(SE_SELECT);
                CreateEmptySaveGame();
                LOADED_SAVE->uiLanguage = uiLanguage;
                gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON | DISPCNT_OBJWIN_ON);
                gBldRegs.bldCnt = 0;
                gBldRegs.bldY = 0;
                menu->unk33F = 0;
                m4aSongNumStart(MUS_OPTIONS);
                gCurTask->main = Task_OptionsMenuMain;
            }
        }
    }

    DisplaySprite(s);
    sub_8010CB4();
}

void sub_80114A0()
{
    u16 prevIME, prevIE, prevDispstat;
    TaskDestroy(gCurTask);
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
    gFlags &= 0xFFFF7FFF;
    gDispCnt &= 0x1FFF;
    gBldRegs.bldCnt = 0xFF;
    gBldRegs.bldY = 0;
    CreateMainMenu(1);
}

void TaskDestructor_OptionsMenu(struct Task *t)
{
    u8 i;

    OptionsMenu *menu = TASK_DATA(t);

    VramFree(menu->s0.graphics.dest);
    for (i = 0; i < 8; i++) {
        VramFree(menu->sprites30[i].graphics.dest);
    }

    VramFree(menu->s1B0.graphics.dest);
    VramFree(menu->s1E0.graphics.dest);
    VramFree(menu->s210.graphics.dest);
    VramFree(menu->s240.graphics.dest);
    VramFree(menu->s270.graphics.dest);
    VramFree(menu->s2A0.graphics.dest);
    VramFree(menu->s2D0.graphics.dest);
    VramFree(menu->s300.graphics.dest);
}

void OptionsSelectPlayerData(void)
{
    TaskDestroy(gCurTask);
    CreatePlayerDataMenu();
}

void OptionsSelectDifficulty(void)
{
    gCurTask->main = sub_8010E90;
    sub_8010CB4();
}

void OptionsSelectTimeUp(void)
{
    gCurTask->main = sub_8010F00;
    sub_8010CB4();
}

void OptionsSelectSoundTest(void)
{
    m4aSongNumStop(3U);
    TaskDestroy(gCurTask);
    CreateSoundTest();
}

void OptionsSelectLanguage(void)
{
    TasksDestroyAll();
    PAUSE_BACKGROUNDS_QUEUE();
    gBgSpritesCount = 0;
    PAUSE_GRAPHICS_QUEUE();
    CreateEditLanguageScreen(0U);
}

void OptionsSelectButtonConfig(void)
{
    gCurTask->main = sub_8010F70;
    sub_8010CB4();
}

void OptionsSelectEnd(void)
{
    OptionsMenu *menu = TASK_DATA(gCurTask);
    StrcUi_805423C *unk330 = &menu->unk330;

    unk330->unk4 = 1;
    unk330->unk6 = 0;
    sub_805423C(unk330);

    gCurTask->main = sub_801176C;
    sub_8010CB4();
}

void sub_801176C(void)
{
    OptionsMenu *menu = TASK_DATA(gCurTask);
    StrcUi_805423C *unk330 = &menu->unk330;

    if (sub_805423C(unk330)) {
        m4aMPlayAllStop();
        m4aSoundVSyncOff();
        gCurTask->main = sub_80114A0;
    }
    sub_8010CB4();
}
