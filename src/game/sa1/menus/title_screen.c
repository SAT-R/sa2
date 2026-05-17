#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "bg_triangles.h"
#include "lib/m4a/m4a.h"
#include "game/sa1/ui/character_select.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/menus/mp_mode_select.h"
#include "game/sa1/menus/options_screen.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/demo_manager.h"
#include "game/sa1/save.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/stage.h"
#include "game/sa1/stage/stage_ui.h"
#include "game/sa1/menus/time_attack.h"
#include "game/sa1/menus/title_screen.h"
#include "game/shared/stage/water_effects.h"

#include "data/sa1/recordings.h"

// LoadTinyChaoGarden
#include "../chao_garden/include/program_params.h"
#include "game/sa1/assets/compressed/roms.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/tilemaps.h"
#include "constants/zones.h"

#define MENU_ITEMS_TOP_Y    93
#define MENU_ITEMS_SPACE    14
#define NUM_MAIN_MENU_ITEMS 5

void TaskDestructor_TitleScreen(Task *t);
void Task_800D268();
void Task_800D450();
void Task_MainMenu_Select(void);
void Task_LoadGameLogo();
void Task_MainMenuInit();
void Task_SegaLogoInit();
void Task_SetSegaLogoTask();
void Task_SonicTeamLogoInit();
void Task_SwitchTo_Task_MainMenu_Select();
void Task_800D11C();
void sub_800D364();
void sub_800D3E0();
void SwitchToSonicTeamLogo();
void sub_800D498();
void Task_800D4B0();
void Task_800D7EC();
void sub_800D878();
void Task_800DE44();
void Task_800DEE4();
void Task_SwitchToDemoInit();
void Task_SwitchToMainMenu();

extern void CreateIntroAnimation(void);

const ALIGNED(4) AnimId gUnknown_080BB310[UILANG_COUNT] = { SA1_ANIM_PRESS_START_MSG_JP, SA1_ANIM_PRESS_START_MSG_EN };
const u8 gUnknown_080BB314[] = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5 };
const u8 sTitlescreenFrameTileSizes[] = { 28, 16, 28, 20, 40 };
const u8 gUnknown_080BB323[] = { 0, 2, 4, 6 };
const u8 gUnknown_080BB327[] = { 0, 1, 3, 2, 0 };
const VoidFn sMainMenuSecondaryItems[NUM_MAIN_MENU_ITEMS - 1]
    = { CreateMultiplayerModeSelectScreen, CreateTimeAttackMenu, CreateOptionsMenu, LoadTinyChaoGarden };

typedef struct {
    u16 unk0;
    Background bg;
} SegaLogo; /* 0x44 */

typedef struct {
    u16 unk0;
    Background bg;
    s16 qFade;
} SonicTeamLogo; /* 0x48 */

typedef struct {
    /* 0x000 */ Sprite s;
    /* 0x030 */ Sprite items[NUM_MAIN_MENU_ITEMS];
    /* 0x120 */ Background bg120;
    /* 0x160 */ Background bg160;
    /* 0x1A0 */ StrcUi_805423C unk1A0;
    /* 0x1AC */ u16 unk1AC;
    /* 0x1AE */ u8 selectedItem;
    /* 0x1AF */ u8 unk1AF;
    /* 0x1B0 */ s16 unk1B0;
} MainMenu;

void CreateSegaLogo(void)
{
    Task *t;
    SegaLogo *logo;
    Background *bg;

    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    gFlags |= 0x8000;
    gDispCnt = DISPCNT_OBJ_1D_MAP;
    gBgCntRegs[2] = 0x5E01;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;

    DmaFill32(3, 0, VRAM, 64);

    gBgSprites_Unknown1[2] = 0;
    gBgSprites_Unknown2[2][0] = 0;
    gBgSprites_Unknown2[2][1] = 0;
    gBgSprites_Unknown2[2][2] = 0xFF;
    gBgSprites_Unknown2[2][3] = 0x40;

    t = TaskCreate(Task_SetSegaLogoTask, sizeof(SegaLogo), 0x2000, 0, NULL);

    logo = TASK_DATA(t);
    logo->unk0 = 0;

    bg = &logo->bg;
    bg->graphics.dest = (void *)BG_CHAR_ADDR(0);
    bg->graphics.anim = 0;
    bg->layoutVram = (void *)BG_SCREEN_ADDR(30);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = TM_INTRO_PRESENTED_BY_SEGA;
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 5;
    bg->unk24 = 5;
    bg->targetTilesX = 20;
    bg->targetTilesY = 10;
    bg->paletteOffset = 0;
    bg->flags = BACKGROUND_FLAGS_BG_ID(2);

    DrawBackground(bg);
}

void Task_SegaLogoInit(void)
{
    SegaLogo *logo;

    logo = TASK_DATA(gCurTask);
    gDispCnt |= DISPCNT_BG2_ON;
    logo->unk0++;
    SA2_LABEL(sub_8007858)(2U, 0U, (160 - logo->unk0), gBgScrollRegs[2][0], (gBgScrollRegs[2][1] + 160) - logo->unk0);
    SA2_LABEL(sub_80078D4)(2U, (160 - logo->unk0), 160, (u16)gBgScrollRegs[2][0], gBgScrollRegs[2][1]);

    if (logo->unk0 == 160) {
        gCurTask->main = sub_800D3E0;
        logo->unk0 = 0U;
    }
}

void Task_800D11C(void)
{
    SegaLogo *logo;

    logo = TASK_DATA(gCurTask);
    logo->unk0++;
    SA2_LABEL(sub_80078D4)(2U, 0U, (160 - logo->unk0), gBgScrollRegs[2][0], gBgScrollRegs[2][1]);
    SA2_LABEL(sub_8007858)
    (2U, (160 - logo->unk0), 160, gBgScrollRegs[2][0], (gBgScrollRegs[2][1] + 160) - logo->unk0);

    if (logo->unk0 == 160) {
        gFlags &= ~0x8000;
        SwitchToSonicTeamLogo();
    }
}

void CreateSonicTeamLogo(void)
{
    Task *t;
    SonicTeamLogo *logo;
    Background *bg;

    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    gDispCnt = DISPCNT_OBJ_1D_MAP;
    gBgCntRegs[2] = 0x5E01;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;

    DmaFill32(3, 0, VRAM, 64);

    gBgSprites_Unknown1[2] = 0;
    gBgSprites_Unknown2[2][0] = 0;
    gBgSprites_Unknown2[2][1] = 0;
    gBgSprites_Unknown2[2][2] = 0xFF;
    gBgSprites_Unknown2[2][3] = 0x40;

    t = TaskCreate(Task_SonicTeamLogoInit, sizeof(SonicTeamLogo), 0x2000, 0, NULL);

    logo = TASK_DATA(t);
    logo->unk0 = 0;

    bg = &logo->bg;
    bg->graphics.dest = (void *)BG_CHAR_ADDR(0);
    bg->graphics.anim = 0;
    bg->layoutVram = (void *)BG_SCREEN_ADDR(30);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = TM_INTRO_CREATED_BY_SONIC_TEAM;
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 5;
    bg->unk24 = 5;
    bg->targetTilesX = 20;
    bg->targetTilesY = 10;
    bg->paletteOffset = 0;
    bg->flags = BACKGROUND_FLAGS_BG_ID(2);

    DrawBackground(bg);
}

void Task_800D268(void)
{
    s32 temp_r0;
    s32 temp_r6;
    u16 temp_r0_2;
    SonicTeamLogo *logo;

    logo = TASK_DATA(gCurTask);
    gDispCnt |= DISPCNT_BG2_ON;

    logo->unk0 += 2;
    if (logo->unk0 < 280) {
        SA2_LABEL(sub_80078D4)(2, 0, 40, gBgScrollRegs[2][0], gBgScrollRegs[2][1]);
        SA2_LABEL(sub_80078D4)(2, 120, 160, gBgScrollRegs[2][0], gBgScrollRegs[2][1]);

#if !PORTABLE
        // BUG: For some reason this currently overwrites memory it shouldn't be able to access.
        //      Task memory gets fuzzed and the game crashes.
        //      (In the 2nd call to SA2_LABEL(sub_8007958) )
        if (logo->unk0 < 200) {
            SA2_LABEL(sub_8007958)(2U, 40, 120, (s16)(280 - logo->unk0), -1, gBgScrollRegs[2][0], gBgScrollRegs[2][1]);
        } else {
            SA2_LABEL(sub_8007958)(2U, 40, (64 - logo->unk0), (280 - logo->unk0), -1, gBgScrollRegs[2][0], gBgScrollRegs[2][1]);
            SA2_LABEL(sub_80078D4)(2U, (64 - logo->unk0), 120, gBgScrollRegs[2][0], gBgScrollRegs[2][1]);
        }
#endif
    } else {
        m4aSongNumStart(SE_RING);
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        gCurTask->main = Task_800D450;
        logo->unk0 = 0U;
    }
}

void sub_800D364(void)
{
    SonicTeamLogo *logo = TASK_DATA(gCurTask);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        gCurTask->main = Task_800D4B0;
        return;
    }

    logo->qFade += Q(0.5);

    if (logo->qFade > Q(16)) {
        gBldRegs.bldY = Q(16);
        sub_800D498();
        return;
    }
    gBldRegs.bldY = I(logo->qFade);
}

void Task_SetSegaLogoTask(void)
{
    gCurTask->main = Task_SegaLogoInit;
    gCurTask->main();
}

void sub_800D3E0(void)
{
    SegaLogo *logo = TASK_DATA(gCurTask);

    if (++logo->unk0 == 120) {
        gCurTask->main = Task_800D11C;
        logo->unk0 = 0U;
    }
}

void SwitchToSonicTeamLogo(void)
{
    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
    TaskDestroy(gCurTask);
    CreateSonicTeamLogo();
}

void Task_SonicTeamLogoInit(void)
{
    gCurTask->main = Task_800D268;
    gCurTask->main();
}

void Task_800D450(void)
{
    SonicTeamLogo *logo = TASK_DATA(gCurTask);

    if (logo->unk0++ > 120) {
        logo->qFade = 0;
        gCurTask->main = sub_800D364;
        gBldRegs.bldCnt = 0xFF;
        gBldRegs.bldY = 0;
    }
}

void sub_800D498(void)
{
    TaskDestroy(gCurTask);
    CreateIntroAnimation();
}

void Task_800D4B0(void)
{
    gFlags &= ~FLAGS_8000;
    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
    TaskDestroy(gCurTask);
    CreateTitleScreen(1);
}

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Sprite s2;
    /* 0x60 */ Background bg;
    /* 0xA0 */ Background bg2;
    /* 0xE0 */ s16 qBlend;
    /* 0xE2 */ u16 unkE2;
    /* 0xE4 */ s16 unkE4;
    /* 0xE6 */ u16 unkE6;
    /* 0xE8 */ bool8 playMusic;
} TitleScreen;

void CreateTitleScreen(u32 playMusic)
{
    Task *t;
    TitleScreen *title;
    Sprite *s;
    Background *bg;
    AnimId animsPressStart[UILANG_COUNT] = { SA1_ANIM_PRESS_START_MSG_JP, SA1_ANIM_PRESS_START_MSG_EN };

    gDispCnt = 0x41;
    gBgCntRegs[2] = 0x568C | BGCNT_PRIORITY(1);
    gBgCntRegs[0] = 0x1480 | BGCNT_PRIORITY(2);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgSprites_Unknown1[0] = 0;
    gBgSprites_Unknown2[0][0] = 0;
    gBgSprites_Unknown2[0][1] = 0;
    gBgSprites_Unknown2[0][2] = 0xFF;
    gBgSprites_Unknown2[0][3] = 0x20;
    gBgSprites_Unknown1[2] = 0xFF;
    gBgSprites_Unknown2[2][0] = 0;
    gBgSprites_Unknown2[2][1] = 0;
    gBgSprites_Unknown2[2][2] = -1;
    gBgSprites_Unknown2[2][3] = 0x20;

    DmaFill32(3, 0, BG_VRAM, 64);
    DmaFill32(3, 0, BG_VRAM + 0xFFC0, 0x80); // TODO: This spills into OBJ VRAM!

    t = TaskCreate(Task_LoadGameLogo, sizeof(TitleScreen), 0x2000U, 0U, TaskDestructor_TitleScreen);
    title = TASK_DATA(t);
    s = &title->s;
    title->unkE2 = 0;
    title->qBlend = Q(16);
    title->playMusic = playMusic;
    gBldRegs.bldCnt = 0x20A5;
    gBldRegs.bldY = I(title->qBlend);
    s->x = 120;
    s->y = 113;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_PRESS_START_MSG_JP); // NOTE: Technically MAX(SA1_ANIM_PRESS_START_MSG_JP,
                                                                 // SA1_ANIM_PRESS_START_MSG_EN), but JP is the bigger one.
    s->graphics.size = 0;
    s->graphics.anim = animsPressStart[LOADED_SAVE->uiLanguage];
    s->variant = 0;
    s->animCursor = 0;
    s->prevVariant = -1;
    s->qAnimDelay = Q(0);
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->oamFlags = 0x400;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);
    s = &title->s2;
    s->x = 0;
    s->y = 134;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_TITLE_COPYRIGHT);
    s->graphics.size = 0;
    s->graphics.anim = 780;
    s->variant = UILANG_DEFAULT; // 0: Japan 2001, 1: International (2002)
    s->animCursor = 0;
    s->prevVariant = -1;
    s->qAnimDelay = Q(0);
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->oamFlags = 0x400;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);
    bg = &title->bg;
    bg->graphics.dest = (void *)BG_CHAR_ADDR(0);
    bg->graphics.anim = 0;
    bg->layoutVram = (void *)BG_SCREEN_ADDR(20);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = TM_SA1_TITLE_BG;
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 0;
    bg->unk24 = 0;
    bg->targetTilesX = 30;
    bg->targetTilesY = 20;
    bg->paletteOffset = 0;
    bg->flags = BACKGROUND_FLAGS_BG_ID(0) | BACKGROUND_FLAG_4;
    DrawBackground(bg);

    if (title->playMusic) {
        m4aSongNumStart(MUS_TITLE_FANFARE);
    }
}

void Task_LoadGameLogo(void)
{
    TitleScreen *title;
    Background *bg;
    s16 *temp_r5;
    s16 temp_r0_2;

    gDispCnt |= DISPCNT_BG0_ON | DISPCNT_OBJ_ON;
    title = TASK_DATA(gCurTask);

    if (title->qBlend == Q(16)) {
        bg = &title->bg2;
        bg->graphics.dest = (void *)BG_CHAR_ADDR(3);
        bg->graphics.anim = 0;
        bg->layoutVram = (void *)BG_SCREEN_ADDR(22);
        bg->unk18 = 0;
        bg->unk1A = 0;
        bg->tilemapId = (TM_SA1_TITLE_LOGO_JP + LOADED_SAVE->uiLanguage);
        bg->unk1E = 0;
        bg->unk20 = 0;
        bg->unk22 = 0;
        bg->unk24 = 0;
        bg->targetTilesX = 24;
        bg->targetTilesY = 10;
        title->bg2.paletteOffset = 0;
        bg->flags = BACKGROUND_FLAGS_BG_ID(2) | BACKGROUND_FLAG_4;
        DrawBackground(bg);
    }
    title->qBlend -= 0x55;

    gBldRegs.bldY = I(title->qBlend);

    if (title->qBlend <= 0) {
        title->unkE4 = 0x400;
        title->unkE6 = 0xFFF0;
        gBldRegs.bldY = 0;
        gCurTask->main = Task_800D7EC;
    }
}

void Task_800D7EC(void)
{
    TitleScreen *title = TASK_DATA(gCurTask);

    gDispCnt |= DISPCNT_BG2_ON;

    title->unkE4 += title->unkE6;
    title->unkE6 -= 8;
    if (title->unkE4 < 0x100) {
        title->unkE4 = 0x100;
        title->unkE2 = 0;
        gCurTask->main = sub_800D878;
    }

    SA2_LABEL(sub_8003EE4)(0, title->unkE4, title->unkE4, 0x8D, 0x1A, 0xC0, 30, gBgAffineRegs);
}

void sub_800D878(void)
{
    TitleScreen *title = TASK_DATA(gCurTask);

    if (++title->unkE2 > 60) {
        if (gPressedKeys & START_BUTTON) {
            m4aSongNumStart(SE_SELECT);
            gCurTask->main = Task_SwitchToMainMenu;
            return;
        }

        if (!((title->unkE2 - 60) & 0x20)) {
            DisplaySprite(&title->s);
        }
    }

    DisplaySprite(&title->s2);

    if (title->unkE2 > 900) {
        gCurTask->main = Task_SwitchToDemoInit;
        return;
    }
}

void CreateMainMenu(u32 param0)
{
    StrcUi_805423C *temp_r1_3;
    s8 *temp_r0;

    Task *t;
    MainMenu *menu;
    Sprite *s;
    Background *bg;

    gGameMode = 0;
    SA2_LABEL(gUnknown_0300543C) = 0;
    gDispCnt = 0x1541;
    gBgCntRegs[2] = 0x568D;
    gBgCntRegs[0] = 0x1482;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;

    t = TaskCreate(Task_MainMenuInit, sizeof(MainMenu), 0x2000, 0, NULL);
    menu = TASK_DATA(t);
    s = &menu->s;
    menu->unk1AC = 0;
    menu->unk1AF = param0;

    s->x = DISPLAY_CENTER_X;
    s->y = DISPLAY_CENTER_Y;
    s->graphics.dest = (void *)BG_VRAM + 0x40;
    s->graphics.size = 0;
    s->graphics.anim = 1; // TODO: Why?
    s->variant = 0;
    s->animCursor = 0;
    s->prevVariant = 0xFF;
    s->qAnimDelay = Q(0);
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = 0x10000;

    if (menu->unk1AF != 0) {
        gBgSprites_Unknown1[0] = 0;
        gBgSprites_Unknown2[0][0] = 0;
        gBgSprites_Unknown2[0][1] = 0;
        gBgSprites_Unknown2[0][2] |= ~0;
        gBgSprites_Unknown2[0][3] = 0x20;
        gBgSprites_Unknown1[2] |= ~0;
        gBgSprites_Unknown2[2][0] = 0;
        gBgSprites_Unknown2[2][1] = 0;
        gBgSprites_Unknown2[2][2] |= ~0;
        gBgSprites_Unknown2[2][3] = 0x20;

        DmaFill32(3, 0, BG_CHAR_ADDR_FROM_BGCNT(0), 0x40);
        DmaFill32(3, 0, BG_CHAR_ADDR_FROM_BGCNT(2) + 0x3FC0, 0x80); // NOTE: Overflow to 0x4040!
    }

    menu->selectedItem = 0;
    bg = &menu->bg120;
    bg->graphics.dest = (void *)BG_CHAR_ADDR(0);
    bg->graphics.anim = 0;
    bg->layoutVram = (void *)BG_SCREEN_ADDR(20);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = TM_SA1_TITLE_BG;
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 0;
    bg->unk24 = 0;
    bg->targetTilesX = 30;
    bg->targetTilesY = 20;
    bg->paletteOffset = 0;
    bg->flags = 4;

    if (menu->unk1AF != 0) {
        DrawBackground(bg);
    }

    bg = &menu->bg160;
    bg->graphics.dest = (void *)BG_CHAR_ADDR(3);
    bg->graphics.anim = 0;
    bg->layoutVram = (void *)BG_SCREEN_ADDR(22);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = (TM_SA1_TITLE_LOGO_JP + LOADED_SAVE->uiLanguage);
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 0;
    bg->unk24 = 0;
    bg->targetTilesX = 24;
    bg->targetTilesY = 10;
    bg->paletteOffset = 0;
    bg->flags = 6;

    if (menu->unk1AF != 0) {
        DrawBackground(bg);
    }

    SA2_LABEL(sub_8003EE4)(0U, 0x100, 0x100, 0x8D, 0x1A, 0xC0, 0x1E, gBgAffineRegs);
    temp_r1_3 = &menu->unk1A0;
    temp_r1_3->unk0 = 0;
    temp_r1_3->unk2 = 1;
    temp_r1_3->unk4 = 2;
    temp_r1_3->unk6 = 0;
    temp_r1_3->unk8 = 0x200;
    temp_r1_3->unkA = 1;

    if (menu->unk1AF != 0) {
        sub_805423C(temp_r1_3);
    }
}

void Task_MainMenuInit(void)
{
    s8 *temp_r1_2;
    u16 temp_r1;
    bool32 someBool;
    u8 i;

    MainMenu *menu = TASK_DATA(gCurTask);
    Sprite *s = &menu->s;
    StrcUi_805423C *strc = &menu->unk1A0;

    someBool = TRUE;
    if (menu->unk1AF != 0) {
        someBool = sub_805423C(strc) ? TRUE : FALSE;
    }

    if (someBool) {
        if (s->graphics.size == 0) {
            s->x = 0;
            s->y = 0;
            s->graphics.dest = (void *)BG_CHAR_ADDR(4);
            s->oamFlags = 0x3C0;
            s->graphics.size = 0;
            s->graphics.anim = SA1_ANIM_CHAO_HOVER_SIDE;
            s->variant = 0;
            s->animCursor = 0;
            s->qAnimDelay = Q(0);
            s->prevVariant = 0xFF;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->frameFlags = 0x400;

            gCurTask->main = Task_SwitchTo_Task_MainMenu_Select;
        }

        for (i = 0; i < ARRAY_COUNT(menu->items); i++) {
            s = &menu->items[i];
            s->x = DISPLAY_CENTER_X;
            s->y = (i * MENU_ITEMS_SPACE) + MENU_ITEMS_TOP_Y;
            s->graphics.dest = VramMalloc((u32)sTitlescreenFrameTileSizes[i]);
            s->graphics.size = 0;
            s->graphics.anim = gUnknown_080BB310[LOADED_SAVE->uiLanguage];
            s->variant = gUnknown_080BB314[LOADED_SAVE->uiLanguage + (i * 2)];
            s->oamFlags = 0x3C0;
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = 0xFF;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->frameFlags = 0;
            UpdateSpriteAnimation(s);
        }

        for (i = 0; (i < ARRAY_COUNT(gKeysFirstRepeatIntervals)); i++) {
            gKeysFirstRepeatIntervals[i] = 20;
            gKeysContinuedRepeatIntervals[i] = 8;
        }

        gDispCnt &= 0x9FFF;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
    }
}

void Task_MainMenu_Select(void)
{
    AnimCmdResult acmdRes;
    u8 i;

    MainMenu *menu = TASK_DATA(gCurTask);
    Sprite *s = &menu->s;

    if (gRepeatedKeys & DPAD_UP) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        if (--menu->selectedItem > NUM_MAIN_MENU_ITEMS - 1) {
            menu->selectedItem = NUM_MAIN_MENU_ITEMS - 1;
        }
    } else if (gRepeatedKeys & DPAD_DOWN) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        if (++menu->selectedItem > NUM_MAIN_MENU_ITEMS - 1) {
            menu->selectedItem = 0;
        }
    }

    s->x = 72;
    s->y = (menu->selectedItem * MENU_ITEMS_SPACE) + 0x6B;

    while ((acmdRes = UpdateSpriteAnimation(s)) != ACMD_RESULT__RUNNING) {
        if (acmdRes == ACMD_RESULT__ENDED) {
            break;
        }
    }

    for (i = 0; i < ARRAY_COUNT(menu->items); i++) {
        s = &menu->items[i];

        if (i == menu->selectedItem) {
            if (i != 0) {
                s->palId = 1;
            } else {
                s->palId = i;
            }
        } else {
            if (i != 0) {
                s->palId = 0;
            } else {
                s->palId = 255;
            }
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (1 & gPressedKeys) {
        m4aSongNumStart(SE_SELECT);
        gCurTask->main = Task_800DE44;
        menu->unk1B0 = 0;

        if (menu->selectedItem == 4) {
            gBldRegs.bldCnt = 0xBF;
        } else {
            gBldRegs.bldCnt = 0xFF;
        }

        gBldRegs.bldY = 0;
    }
}

void Task_800DE44(void)
{
    u8 i;

    MainMenu *menu = TASK_DATA(gCurTask);

    menu->unk1B0 += 0x55;

    if (menu->unk1B0 >= Q(16)) {
        menu->unk1B0 = Q(16);

        gCurTask->main = Task_800DEE4;

        gBgSprites_Unknown1[0] = 0;
        gBgSprites_Unknown2[0][0] = 0;
        gBgSprites_Unknown2[0][1] = 0;
        gBgSprites_Unknown2[0][2] = 0xFF;
        gBgSprites_Unknown2[0][3] = 0x20;
        gBgSprites_Unknown1[2] = 0;
        gBgSprites_Unknown2[2][0] = 0;
        gBgSprites_Unknown2[2][1] = 0;
        gBgSprites_Unknown2[2][2] = 0xFF;
        gBgSprites_Unknown2[2][3] = 0x20;

        gFlags &= ~4;
    }

    gBldRegs.bldY = I(menu->unk1B0);

    for (i = 0; i < ARRAY_COUNT(menu->items); i++) {
        DisplaySprite(&menu->items[i]);
    };
}

void Task_800DEE4(void)
{
    u8 selectedItem;
    u8 i;

    MainMenu *menu = TASK_DATA(gCurTask);

    selectedItem = menu->selectedItem;

    for (i = 0; i < ARRAY_COUNT(menu->items); i++) {
        VramFree(menu->items[i].graphics.dest);
    }

    TaskDestroy(gCurTask);
    m4aSongNumStart(MUS_BOSS_FIGHT);
    m4aMPlayImmInit(&gMPlayInfo_BGM);
    m4aSongNumStop(MUS_BOSS_FIGHT);

    if (selectedItem == 0) {
        gGameMode = GAME_MODE_SINGLE_PLAYER;
        CreateCharacterSelectionScreen(0);
        return;
    }

    gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    sMainMenuSecondaryItems[selectedItem - 1]();
}

void Task_SwitchToDemoInit(void)
{
    TaskDestroy(gCurTask);

    gInputRecorder.mode = RECORDER_PLAYBACK;
    gInputPlaybackData = gDemoRecordings[gDemoPlayCounter];
    gSelectedCharacter = gUnknown_080BB327[gDemoPlayCounter];
    gCurrentLevel = gUnknown_080BB323[gDemoPlayCounter];
    gDemoPlayCounter = (gDemoPlayCounter + 1) % 4u;
    gGameMode = GAME_MODE_SINGLE_PLAYER;

    CreateDemoManager();
    ApplyGameStageSettingsAndStart();
}

void Task_SwitchToMainMenu(void)
{
    TaskDestroy(gCurTask);
    CreateMainMenu(0);
}

void TaskDestructor_TitleScreen(Task *t)
{
#ifdef BUG_FIX
    // NOTE: This is *technically* not a bug, but it's more coherent like this.
    TitleScreen *title = TASK_DATA(t);
#else
    TitleScreen *title = TASK_DATA(gCurTask);
#endif

    VramFree(title->s.graphics.dest);
    VramFree(title->s2.graphics.dest);
}

void Task_SwitchTo_Task_MainMenu_Select(void)
{
    gCurTask->main = Task_MainMenu_Select;
    Task_MainMenu_Select();
}

void LoadTinyChaoGarden(void)
{
    gFlags |= FLAGS_8000;

#ifdef BUG_FIX
    // NOTE: It also works with the other song for some reason, but this is more correct.
    m4aSongNumStop(MUS_TITLE_FANFARE);
#else
    // MUS_CHARACTER_SELECTION never plays in the main menu.
    m4aSongNumStop(MUS_CHARACTER_SELECTION);
#endif

    m4aSoundVSyncOff();

    LZ77UnCompWram(gMultiBootProgram_TinyChaoGarden, (void *)EWRAM_START);
    TinyChaoGardenConfig[0] = LOADED_SAVE->score;
    TinyChaoGardenConfig[1] = LOADED_SAVE->language;

    TinyChaoGardenConfig[2] = gFrameCount + LOADED_SAVE->checksum;

    SoftResetExram(0U);
}
