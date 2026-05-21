#include "global.h"
#include "core.h"
#include "flags.h"
#include "malloc_vram.h"
#include "background.h"

#include "lib/m4a/m4a.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/menus/options_screen.h" // contains EditLanguageScreen
#include "game/sa1/save.h"
#include "game/sa1/stage/stage_ui.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/tilemaps.h"

#define LANGSCRN_BG_SCREENBASE 30

#if !WIDESCREEN_HACK
typedef u8 CoordELS;
#else
typedef u16 CoordELS;
#endif

extern const AnimId gUnknown_0868B6D4[NUM_LANGSCRN_SPRITES_TYPE_1][2];
extern const AnimId gUnknown_0868B6EC[][NUM_LANGSCRN_SPRITES_TYPE_2][2];
extern const u8 gUnknown_0868B704[NUM_LANGSCRN_SPRITES_TYPE_1][2];
extern const u8 gUnknown_0868B710[2][NUM_LANGSCRN_SPRITES_TYPE_2][2];
extern const u8 gUnknown_0868B71C[NUM_LANGSCRN_SPRITES_TYPE_1];
extern const u8 gUnknown_0868B722[2][NUM_LANGSCRN_SPRITES_TYPE_2];
extern const CoordELS gUnknown_0868B728[NUM_LANGSCRN_SPRITES_TYPE_1][2];
extern const CoordELS gUnknown_0868B734[][NUM_LANGSCRN_SPRITES_TYPE_2][2];
extern const VoidFn sLangScreenReturnProcs[2];
extern const CoordELS gUnknown_0868B760[][2];
void Task_EditLanguageScreenInit(void);
void Task_806ABD4(void);
void sub_806AD44(void);
void Task_806AF04(void);
void TaskDestructor_EditLanguageScreen(Task *t);

void CreateEditLanguageScreen(u8 param0)
{
    Task *t;
    EditLanguageScreen *screen;
    StrcUi_805423C *unk280;
    Background *bg;
    Sprite *s;
    u8 i;
    for (i = 0; i < 10; i++) {
        gKeysFirstRepeatIntervals[i] = 0x14;
        gKeysContinuedRepeatIntervals[i] = 0x8;
    }

    gDispCnt = DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP;
    gBgCntRegs[0] = BGCNT_SCREENBASE(LANGSCRN_BG_SCREENBASE) | BGCNT_PRIORITY(3);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    t = TaskCreate(Task_EditLanguageScreenInit, sizeof(EditLanguageScreen), 0x2000, 0, TaskDestructor_EditLanguageScreen);
    screen = TASK_DATA(t);

    unk280 = &screen->unk280;
    screen->unk28C = param0;
    screen->unk28D = LOADED_SAVE->language;
    screen->spr250.graphics.dest = NULL;

    for (i = 0; i < NUM_LANGSCRN_SPRITES_TYPE_1; i++) {
        s = &screen->sprites[i];
        s->graphics.dest = VramMalloc(gUnknown_0868B71C[i]);

        s->graphics.anim = gUnknown_0868B6D4[i][(screen->unk28D == 0) ? 0 : 1];
        s->variant = gUnknown_0868B704[i][(screen->unk28D == 0) ? 0 : 1];

        s->x = gUnknown_0868B728[i][0];
        s->y = gUnknown_0868B728[i][1];

        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
        UpdateSpriteAnimation(s);
    }

    for (; i < NUM_LANGSCRN_SPRITES_TYPE_1 + NUM_LANGSCRN_SPRITES_TYPE_2; i++) {
        s = &screen->sprites[i];
        s->graphics.dest = VramMalloc(gUnknown_0868B722[screen->unk28C][i - NUM_LANGSCRN_SPRITES_TYPE_1]);
        s->graphics.anim = gUnknown_0868B6EC[screen->unk28C][i - NUM_LANGSCRN_SPRITES_TYPE_1][(screen->unk28D != 0) ? 1 : 0];
        s->variant = gUnknown_0868B710[screen->unk28C][i - NUM_LANGSCRN_SPRITES_TYPE_1][(screen->unk28D != 0) ? 1 : 0];
        s->x = gUnknown_0868B734[screen->unk28C * 3][i - NUM_LANGSCRN_SPRITES_TYPE_1][0];
        s->y = gUnknown_0868B734[screen->unk28C * 3][i - NUM_LANGSCRN_SPRITES_TYPE_1][1];
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
        UpdateSpriteAnimation(s);
    }

    s = &screen->spr1F0;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_MENU_CURSOR);
    s->graphics.anim = SA1_ANIM_MENU_CURSOR;
    s->variant = 0;
    s->x = 33;
    s->y = 25;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);

    bg = &screen->bg;
    bg->graphics.dest = (void *)BG_VRAM;
    bg->graphics.anim = 0;
    bg->layoutVram = (void *)BG_SCREEN_ADDR(LANGSCRN_BG_SCREENBASE);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = TM_TILEMAP_89;
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 0;
    bg->unk24 = 0;
    bg->targetTilesX = 30;
    bg->targetTilesY = 20;
    bg->paletteOffset = 0;
    bg->flags = 0;
    DrawBackground(bg);

    unk280->unk0 = 0;
    unk280->unk2 = 1;
    unk280->unk4 = 2;
    unk280->unk6 = 0;
    unk280->unk8 = 0x100;
    unk280->unkA = 0x10;
    sub_805423C(unk280);
}

void Task_EditLanguageScreenInit(void)
{
    EditLanguageScreen *screen = TASK_DATA(gCurTask);
    StrcUi_805423C *unk280 = &screen->unk280;
    u32 inputMask;

    if (sub_805423C(unk280)) {
        if (gRepeatedKeys & DPAD_DOWN) {
            screen->unk28D++;
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);

            if (screen->unk28D > 4) {
                screen->unk28D = 0;
            }
        } else if (gRepeatedKeys & DPAD_UP) {
            screen->unk28D--;
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);

            if (screen->unk28D < 0) {
                screen->unk28D = 4;
            }
        }
    }

    inputMask = (screen->unk28C != 0) ? (A_BUTTON | START_BUTTON) : A_BUTTON;

    if (gPressedKeys & inputMask) {
        m4aSongNumStart(SE_SELECT);

        if (screen->unk28D > 0) {
            LOADED_SAVE->uiLanguage = UILANG_ENGLISH;
        } else {
            LOADED_SAVE->uiLanguage = UILANG_JAPANESE;
        }

        LOADED_SAVE->language = screen->unk28D;

        if (screen->unk28D > 1) {
            Sprite *s = &screen->spr250;
            s->x = DISPLAY_CENTER_X;
            s->y = DISPLAY_CENTER_Y;
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_ONLY_CHAO_MSGBOX);
            s->oamFlags = SPRITE_OAM_ORDER(0);
            s->graphics.size = 0;
            s->graphics.anim = SA1_ANIM_ONLY_CHAO_MSGBOX;
            s->variant = screen->unk28D - 2;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

            UpdateSpriteAnimation(s);

            gCurTask->main = Task_806AF04;
        } else {
            unk280->unk4 = 1;
            unk280->unk6 = 0;
            gCurTask->main = Task_806ABD4;
        }
    } else if ((gPressedKeys & B_BUTTON) && (screen->unk28C == 0)) {
        m4aSongNumStart(SE_RETURN);

        unk280->unk4 = 1;
        unk280->unk6 = 0;
        gCurTask->main = Task_806ABD4;
    }

    sub_806AD44();
}

void Task_806ABD4(void)
{
    EditLanguageScreen *screen = TASK_DATA(gCurTask);

    if (sub_805423C(&screen->unk280)) {
        gDispCnt &= ~0xE000;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;

#ifndef BUG_FIX
        // BUG: Use after free
        TaskDestroy(gCurTask);
#endif

        if (screen->unk28C == 1) {
            u16 irqEnable, irqMasterEnable, dispStat;
            m4aMPlayAllStop();
            m4aSoundVSyncOff();

            gFlags |= FLAGS_8000;
            irqEnable = REG_IE;
            irqMasterEnable = REG_IME;
            dispStat = REG_DISPSTAT;

            REG_IE = 0;
            REG_IE;
            REG_IME = 0;
            REG_IME;
            REG_DISPSTAT = 0;
            REG_DISPSTAT;
            {
                gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;

                SlowDmaStop(0);
                SlowDmaStop(1);
                SlowDmaStop(2);
                SlowDmaStop(3);
                WriteSaveGame();
            }
            REG_IE = irqEnable;
            REG_IE;
            REG_IME = irqMasterEnable;
            REG_IME;
            REG_DISPSTAT = dispStat;
            REG_DISPSTAT;
            m4aSoundVSyncOn();

            gFlags &= ~FLAGS_8000;
        }

        sLangScreenReturnProcs[screen->unk28C]();

#ifdef BUG_FIX
        TaskDestroy(gCurTask);
#endif
        return;
    }

    sub_806AD44();
}

void sub_806AD44(void)
{
    EditLanguageScreen *screen = TASK_DATA(gCurTask);
    Sprite *s;
    u8 i;
    u8 loopMax;

    for (i = 0; i < NUM_LANGSCRN_SPRITES_TYPE_1; i++) {
        s = &screen->sprites[i];

        s->graphics.anim = gUnknown_0868B6D4[i][(screen->unk28D == 0) ? 0 : 1];
        s->variant = gUnknown_0868B704[i][(screen->unk28D == 0) ? 0 : 1];

        s->x = gUnknown_0868B728[i][0];
        s->y = gUnknown_0868B728[i][1];
        s->prevVariant = -1;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (screen->unk28C == 1) {
        loopMax = 8;
    } else {
        loopMax = 9;
    }

    for (; i < loopMax; i++) {
        s = &screen->sprites[i];
        s->graphics.anim = gUnknown_0868B6EC[screen->unk28C][i - NUM_LANGSCRN_SPRITES_TYPE_1][(screen->unk28D != 0) ? 1 : 0];
        s->variant = gUnknown_0868B710[screen->unk28C][i - NUM_LANGSCRN_SPRITES_TYPE_1][(screen->unk28D != 0) ? 1 : 0];
        s->x = gUnknown_0868B734[screen->unk28C * 3][i - NUM_LANGSCRN_SPRITES_TYPE_1][0];
        s->y = gUnknown_0868B734[screen->unk28C * 3][i - NUM_LANGSCRN_SPRITES_TYPE_1][1];
        s->prevVariant = -1;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &screen->spr1F0;
    s->x = gUnknown_0868B760[screen->unk28D][0];
    s->y = gUnknown_0868B760[screen->unk28D][1];

    DisplaySprite(s);
}

void Task_806AF04(void)
{
    EditLanguageScreen *screen = TASK_DATA(gCurTask);
    Sprite *s = &screen->spr250;
    StrcUi_805423C *unk280;

    DisplaySprite(s);
    sub_806AD44();

    if (gPressedKeys & A_BUTTON) {
        unk280 = &screen->unk280;
        unk280->unk4 = 1;
        unk280->unk6 = 0;

        m4aSongNumStart(SE_SELECT);
        gCurTask->main = Task_806ABD4;
    }
}

void TaskDestructor_EditLanguageScreen(Task *t)
{
    EditLanguageScreen *screen = TASK_DATA(t);
    Sprite *s;
    u8 i;

    for (i = 0; i < (s32)ARRAY_COUNT(screen->sprites); i++) {
        VramFree(screen->sprites[i].graphics.dest);
    }

    VramFree(screen->spr1F0.graphics.dest);

    if (screen->spr250.graphics.dest) {
        VramFree(screen->spr250.graphics.dest);
    }
}