#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "game/sa1/ui/character_select.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/sa1/save.h"
#include "game/sa1/menus/title_screen.h" // CreateMainMenu
#include "game/sa1/stage/stage_ui.h" // sub_805423C

#include "constants/sa1/songs.h"
#include "constants/sa1/text.h"

typedef struct {
    StrcUi_805423C unk0;
    Sprite s;
    Sprite s2;
    s16 unk6C;
    s32 unk70;
    u8 unk74;
    s16 unk76;
} TimeAttackMenu;

void Task_TimeAttackMenu(void);

extern const u16 gUnknown_0869CAF4[0x100];
extern const u8 gUnknown_0869CCF4[0x1C40];
extern const u8 gUnknown_0869E934[0x500];
extern const u16 gUnknown_0869EE34[0x100];
extern const u8 gUnknown_0869F034[0x20C0];
extern const u8 gUnknown_086A10F4[0x500];

void Task_80103C4(void);
void sub_8010580(void);
void TimeAttack_CreateStartMenu(void);
void TimeAttack_CreateRecordsMenu(void);

extern void CreateCourseSelect(u8 param0);

const AnimId gUnknown_080BB35C[UILANG_COUNT] = { 882, 881 };
const u8 gUnknown_080BB360[2][UILANG_COUNT] = { { 1, 1 }, { 0, 0 } };
const VoidFn gUnknown_080BB364[2] = { TimeAttack_CreateStartMenu, TimeAttack_CreateRecordsMenu };

void CreateTimeAttackMenu(void)
{
    Strc_80528AC sp4;
    s32 var_r0;
    struct Task *t;
    TimeAttackMenu *menu;
    Sprite *s;

    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0xF84;
    gBgScrollRegs[0][1] = 0;

    t = TaskCreate(Task_TimeAttackMenu, sizeof(TimeAttackMenu), 0x2000U, 0U, NULL);
    menu = TASK_DATA(t);
    menu->unk70 = 0;
    menu->unk6C = 0;
    menu->unk74 = 0;
    menu->unk76 = 0;

    s = &menu->s;
    s->x = 0xE0;
    s->y = 0x40;
    s->graphics.dest = (void *)OBJ_VRAM0;
    s->oamFlags = 0x3C0;
    s->graphics.size = 0;
    s->graphics.anim = gUnknown_080BB35C[LOADED_SAVE->uiLanguage];
    s->variant = gUnknown_080BB360[0][LOADED_SAVE->uiLanguage];
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &menu->s2;
    s->x = 0;
    s->y = 0x40;
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2000);
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = 0x35C;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    sub_80535FC();
    UiGfxStackInit();
    sp4.uiGfxID = 0x80;
    sp4.unk2B = 0;

    if (LOADED_SAVE->uiLanguage != 0) {
        sp4.tiles = gUnknown_0869F034;
        sp4.palette = gUnknown_0869EE34;
        sp4.layout = gUnknown_086A10F4;
        sp4.tilesSize = sizeof(gUnknown_0869F034);
        sp4.paletteSize = sizeof(gUnknown_0869EE34);
        sp4.layoutSize = sizeof(gUnknown_086A10F4);
    } else {
        sp4.tiles = gUnknown_0869CCF4;
        sp4.palette = gUnknown_0869CAF4;
        sp4.layout = gUnknown_0869E934;
        sp4.tilesSize = sizeof(gUnknown_0869CCF4);
        sp4.paletteSize = sizeof(gUnknown_0869CAF4);
        sp4.layoutSize = sizeof(gUnknown_0869E934);
    }

    sp4.unk28 = 0;
    sp4.unk29 = 0;
    sp4.unk2A = 0x15;
    sub_80528AC(&sp4);

    menu->unk0.unk0 = 0;
    menu->unk0.unk2 = 1;
    menu->unk0.unk4 = 2;
    menu->unk0.unk6 = 0;
    menu->unk0.unk8 = 0x200;
    menu->unk0.unkA = 0x10;
    sub_805423C((StrcUi_805423C *)menu);

    m4aSongNumStartOrContinue(MUS_CHARACTER_SELECTION);
}

void Task_TimeAttackMenu(void)
{
    Sprite *s;
    s32 var_r5;
    u8 i;

    TimeAttackMenu *menu = TASK_DATA(gCurTask);

    menu->unk70 += 0x80;
    if (menu->unk70 > 0x8000) {
        menu->unk70 -= 0x8000;
    }

    s = &menu->s;
    s->y = (menu->unk74 * 24) + 64;
    menu->s.variant = gUnknown_080BB360[menu->unk74][LOADED_SAVE->uiLanguage];
    UpdateSpriteAnimation(s);

    for (var_r5 = I(menu->unk70) - 128; ((224 - var_r5) > 0); var_r5 += 128) {
        s->x = 224 - var_r5;
        DisplaySprite(s);
    }

    s = &menu->s2;
    s->y = (menu->unk74 * 24) + 54;

    for (i = 0; i < 8; i++) {
        s->x = i * 32;
        DisplaySprite(s);
    }

    if (sub_805423C(&menu->unk0)) {
        gDispCnt &= ~0xE000;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
        gCurTask->main = Task_80103C4;
    }
}

void Task_80103C4()
{
    Sprite *s;
    Sprite *s2;
    s16 temp_r4;
    s32 var_r5;
    u8 i;

    TimeAttackMenu *menu = TASK_DATA(gCurTask);
    StrcUi_805423C *strc = &menu->unk0;

    temp_r4 = strc->unk4;
    if (temp_r4 != 1) {
        if (DPAD_UP & gRepeatedKeys) {
            menu->unk70 = 0;
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);
            menu->unk74--;
            if (menu->unk74 > 1U) {
                menu->unk74 = 1;
            }
        } else if (DPAD_DOWN & gRepeatedKeys) {
            menu->unk70 = 0;
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);

            menu->unk74++;
            if (menu->unk74 > 1U) {
                menu->unk74 = (s8)0;
            }
        }

        if (gPressedKeys & A_BUTTON) {
            strc->unk4 = 1;
            strc->unk6 = 0;
            menu->unk76 = 1;
            m4aSongNumStart(SE_SELECT);
        } else if (gPressedKeys & B_BUTTON) {
            strc->unk4 = 1;
            strc->unk6 = 0;
            menu->unk76 = 2;
            m4aSongNumStart(SE_RETURN);
        }
    } else if (sub_805423C(&menu->unk0)) {
        temp_r4 &= menu->unk76; // doesn't match without this line...
        if (temp_r4 & menu->unk76) {
            gUnknown_080BB364[menu->unk74]();
            return;
        }

        sub_8010580();
        m4aSongNumStop(MUS_CHARACTER_SELECTION);
        return;
    }

    menu->unk70 += 0x80;

    if (menu->unk70 > 0x8000) {
        menu->unk70 -= 0x8000;
    }

    s = &menu->s;
    s->y = (menu->unk74 * 0x18) + 0x40;
    s->variant = gUnknown_080BB360[menu->unk74][LOADED_SAVE->uiLanguage];
    UpdateSpriteAnimation(s);

    for (var_r5 = I(menu->unk70) - 128; (224 - var_r5) > 0; var_r5 += 128) {
        s->x = 224 - var_r5;
        DisplaySprite(s);
    }

    s = &menu->s2;
    s->y = (menu->unk74 * 24) + 54;

    for (i = 0; i < 8; i++) {
        s->x = i * 32;
        DisplaySprite(s);
    }
}

void sub_8010580(void)
{
    gDispCnt &= 0x1FFF;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    gBgSprites_Unknown1[0] = 0;
    gBgSprites_Unknown2[0][0] = 0;
    gBgSprites_Unknown2[0][1] = 0;
    gBgSprites_Unknown2[0][2] = 0xFF;
    gBgSprites_Unknown2[0][3] = 0x20;
    TaskDestroy(gCurTask);
    CreateMainMenu(1);
}

void TimeAttack_CreateStartMenu(void)
{
    gGameMode = 1;
    TaskDestroy(gCurTask);
    CreateCharacterSelectionScreen(0U);
}

void TimeAttack_CreateRecordsMenu(void)
{
    gGameMode = 0;
    TaskDestroy(gCurTask);
    CreateCourseSelect(1);
}
