#include "global.h"
#include "lib/m4a/m4a.h"

#include "core.h"
#include "malloc_vram.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/save.h"
#include "game/time_attack/lobby.h"
#include "game/title_screen.h"
#include "game/water_effects.h"

#include "constants/animations.h"
#include "flags.h"
#include "constants/songs.h"
#include "constants/text.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Sprite s2;
    /* 0x60 */ u16 unk60;
    /* 0x62 */ u8 cursor;
    /* 0x63 */ u8 flags; // bitarray
    /* 0x64 */ u16 pal64[0x3];
    /* 0x64 */ u16 pal6A[0x3];
} PauseMenu; /* size: 0x70 */

typedef struct {
    u32 size;
    AnimId anim;
    u8 variant;
} AnimInfoPauseMenu;

const AnimInfoPauseMenu sAnimInfoPauseMenu[] = {
    { 40, SA2_ANIM_PAUSE_MENU_JP, 0 }, { 40, SA2_ANIM_PAUSE_MENU_EN, 0 }, { 40, SA2_ANIM_PAUSE_MENU_DE, 0 },
    { 40, SA2_ANIM_PAUSE_MENU_FR, 0 }, { 40, SA2_ANIM_PAUSE_MENU_ES, 0 }, { 40, SA2_ANIM_PAUSE_MENU_IT, 0 },
};

#define PMCURSOR_CONTINUE 0
#define PMCURSOR_QUIT     1

#define PMFLAG_A_BUTTON_RELEASED               0x1
#define PMFLAG_HOLDING_A_BUTTON_SINCE_CREATION 0x2

void Task_PauseMenuInit(void);
void TaskDestructor_PauseMenu(struct Task *);

void CreatePauseMenu(void)
{
    s8 lang = gLoadedSaveGame->language - 1;

    if (lang < LANG_DEFAULT)
        lang = LANG_JAPANESE - 1;

    if (!(gStageFlags & STAGE_FLAG__DISABLE_PAUSE_MENU)) {
        void *vramTiles = VramMalloc(sAnimInfoPauseMenu[lang].size);

        if (vramTiles != ewram_end) {
            struct Task *t = TaskCreate(Task_PauseMenuInit, sizeof(PauseMenu), 0xFFFE, 4, TaskDestructor_PauseMenu);
            PauseMenu *pm = TASK_DATA(t);
            Sprite *s = &pm->s;

            pm->unk60 = 0;
            pm->cursor = PMCURSOR_CONTINUE;

            if (gInput & A_BUTTON) {
                pm->flags = PMFLAG_HOLDING_A_BUTTON_SINCE_CREATION;
            } else {
                pm->flags = PMFLAG_A_BUTTON_RELEASED;
            }

            s->graphics.dest = vramTiles;
            s->oamFlags = SPRITE_OAM_ORDER(1);
            s->graphics.size = 0;
            s->graphics.anim = sAnimInfoPauseMenu[lang].anim;
            s->variant = sAnimInfoPauseMenu[lang].variant;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = 0x10;
            s->palId = 0;

            s->x = (DISPLAY_WIDTH / 2);
            s->y = (DISPLAY_HEIGHT / 2);

            s->frameFlags = 0;

            UpdateSpriteAnimation(s);
        }
    }
}

void Task_PauseMenuUpdate(void)
{
    PauseMenu *pm = TASK_DATA(gCurTask);

    /* Handle A-/B-Button */
    if ((gReleasedKeys & A_BUTTON) && (pm->flags & PMFLAG_HOLDING_A_BUTTON_SINCE_CREATION)) {
        pm->flags = PMFLAG_A_BUTTON_RELEASED;
    } else if ((gPressedKeys & START_BUTTON) || ((pm->cursor == PMCURSOR_CONTINUE) && (gReleasedKeys & A_BUTTON))
               || ((gGameMode != GAME_MODE_SINGLE_PLAYER) && (gPressedKeys & B_BUTTON))) {
        // Close the Pause Menu
        gFlags &= ~FLAGS_PAUSE_GAME;
        m4aMPlayContinue(gMPlayTable[0].info);
        TaskDestroy(gCurTask);
        return;
    } else if ((gGameMode != GAME_MODE_SINGLE_PLAYER) && (gReleasedKeys & A_BUTTON)) {
        gFlags &= ~FLAGS_PAUSE_GAME;
        m4aSongNumStart(SE_SELECT);

        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        CreateTimeAttackLobbyScreen();
        return;
    } else if ((gGameMode == GAME_MODE_SINGLE_PLAYER) && (pm->cursor != PMCURSOR_CONTINUE) && (gReleasedKeys & A_BUTTON)) {
        gFlags &= ~FLAGS_PAUSE_GAME;
        m4aSongNumStart(SE_SELECT);

        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        CreateTitleScreenAndSkipIntro();
        return;
    }

    if (gBldRegs.bldY == 0) {
        pm->s2.frameFlags &= ~SPRITE_FLAG_MASK_OBJ_MODE;
        pm->s.frameFlags &= ~SPRITE_FLAG_MASK_OBJ_MODE;
    }

    /* Move the cursor */
    if ((gRepeatedKeys & DPAD_UP) && (pm->cursor != PMCURSOR_CONTINUE)) {
        pm->cursor = PMCURSOR_CONTINUE;
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    } else if ((gRepeatedKeys & DPAD_DOWN) && pm->cursor == PMCURSOR_CONTINUE) {
        pm->cursor = PMCURSOR_QUIT;
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    }

    /* Color CONTINUE/QUIT by copying the correct palette */
    if (pm->cursor != PMCURSOR_CONTINUE) {
        DmaCopy16(3, pm->pal6A, &(((u16 *)OBJ_PLTT)[249]), sizeof(pm->pal6A));
        DmaCopy16(3, pm->pal64, &(((u16 *)OBJ_PLTT)[252]), sizeof(pm->pal64));

        if (gWater.isActive == TRUE) {
            u16 *somePalette = TASK_DATA(gWater.t);

            DmaCopy16(3, pm->pal6A, &somePalette[249], sizeof(pm->pal6A));
            DmaCopy16(3, pm->pal64, &somePalette[252], sizeof(pm->pal64));
        }
    } else {
        DmaCopy16(3, pm->pal6A, &(((u16 *)OBJ_PLTT)[252]), sizeof(pm->pal6A));
        DmaCopy16(3, pm->pal64, &(((u16 *)OBJ_PLTT)[249]), sizeof(pm->pal64));

        if (gWater.isActive == TRUE) {
            u16 *somePalette = TASK_DATA(gWater.t);

            DmaCopy16(3, pm->pal6A, &somePalette[252], sizeof(pm->pal6A));
            DmaCopy16(3, pm->pal64, &somePalette[249], sizeof(pm->pal64));
        }
    }

    pm->unk60 = 0;
    DisplaySprite(&pm->s);
}

void Task_PauseMenuInit(void)
{
    PauseMenu *pm = TASK_DATA(gCurTask);
    u32 i;

    for (i = 0; i < 4; i++) {
        if (i != gSongTable[142].ms) {
            MPlayStop(gMPlayTable[i].info);
        }
    }

    m4aSongNumStart(SE_PAUSE_SCREEN);

    gFlags |= FLAGS_PAUSE_GAME;
    DmaCopy16(3, &gObjPalette[249], pm->pal64, sizeof(pm->pal64));
    DmaCopy16(3, &gObjPalette[252], pm->pal6A, sizeof(pm->pal6A));

    gCurTask->main = Task_PauseMenuUpdate;
}

void TaskDestructor_PauseMenu(struct Task *t)
{
    PauseMenu *pm = TASK_DATA(t);
    VramFree(pm->s.graphics.dest);
}

extern u8 Tileset_zone_1_act_1_fg[];

void sub_800AE58(void)
{
    DmaCopy16(3, &Tileset_zone_1_act_1_fg[(4 * 16 * TILE_SIZE_4BPP) / sizeof(u16)], (void *)(OBJ_VRAM1 + 0x3EC0), 0x140);

    gObjPalette[1] = RGB_WHITE;
    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    gFlags &= ~FLAGS_PAUSE_GAME;
}