#include "global.h"
#include "lib/m4a/m4a.h"

#include "core.h"
#include "flags.h"
#include "malloc_vram.h"

#include "game/globals.h"

#if (GAME == GAME_SA1)
#include "game/sa1/save.h"
#include "game/sa1/ui/time_attack_lobby.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#elif (GAME == GAME_SA2)
#include "game/sa2/save.h"
#include "game/sa2/ui/time_attack_lobby.h"
#include "game/sa2/title_screen.h"

#include "constants/sa2/animations.h"
#include "constants/sa2/songs.h"
#include "constants/sa2/text.h"
#endif

#include "game/shared/stage/water_effects.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Sprite s2;
    /* 0x60 */ u16 frames;
#if (GAME == GAME_SA2)
    /* 0x62 */ u8 cursor;
    /* 0x63 */ u8 flags; // bitarray
    /* 0x64 */ u16 pal64[0x3];
    /* 0x64 */ u16 pal6A[0x3];
#endif
} PauseMenu; /* size: 0x70 */

#if (GAME == GAME_SA2)
const TileInfo sAnimInfoPauseMenu[] = {
    { 40, SA2_ANIM_PAUSE_MENU_JP, 0 }, { 40, SA2_ANIM_PAUSE_MENU_EN, 0 }, { 40, SA2_ANIM_PAUSE_MENU_DE, 0 },
    { 40, SA2_ANIM_PAUSE_MENU_FR, 0 }, { 40, SA2_ANIM_PAUSE_MENU_ES, 0 }, { 40, SA2_ANIM_PAUSE_MENU_IT, 0 },
};

#define PMCURSOR_CONTINUE 0
#define PMCURSOR_QUIT     1

#define PMFLAG_A_BUTTON_RELEASED               0x1
#define PMFLAG_HOLDING_A_BUTTON_SINCE_CREATION 0x2

#endif

void Task_PauseMenuInit(void);
void TaskDestructor_PauseMenu(Task *);

void CreatePauseMenu(void)
{
    Task *t;
    PauseMenu *pm;
    Sprite *s;

#if (GAME == GAME_SA2)
    void *vramTiles;
    s8 lang = LOADED_SAVE->language - 1;

    if (lang < LANG_DEFAULT)
        lang = LANG_JAPANESE - 1;
#endif

    if ((gStageFlags & STAGE_FLAG__DISABLE_PAUSE_MENU)) {
        return;
    }

#if (GAME == GAME_SA2)
    vramTiles = VramMalloc(sAnimInfoPauseMenu[lang].numTiles);
    if (vramTiles == ewram_end) {
        return;
    }
#endif

    t = TaskCreate(Task_PauseMenuInit, sizeof(PauseMenu), -2, TASK_x0004, TaskDestructor_PauseMenu);
    pm = TASK_DATA(t);

#if (GAME == GAME_SA1)
    pm->frames = 0;

    if (gGameMode == GAME_MODE_TIME_ATTACK) {
        // Time Attack
        s = &pm->s;
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_PAUSE_BACKGROUND_TA);
        s->oamFlags = SPRITE_OAM_ORDER(1);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_PAUSE_BACKGROUND_TA;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->x = DISPLAY_CENTER_X;
        s->y = DISPLAY_CENTER_Y;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);

        // TODO: ALLOC_TILES max of SA1_ANIM_PAUSE_TA and SA1_ANIM_PAUSE.
        // NOTE: Defaults to SA1_ANIM_PAUSE, as switches to SA1_ANIM_PAUSE_TA every couple frames.
        s = &pm->s2;
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_PAUSE_TA);
        s->oamFlags = SPRITE_OAM_ORDER(1);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_PAUSE;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->x = DISPLAY_CENTER_X;
        s->y = DISPLAY_CENTER_Y;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);
    } else {
        // Not Time Attack
        s = &pm->s;
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_PAUSE_BACKGROUND);
        s->oamFlags = SPRITE_OAM_ORDER(1);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_PAUSE_BACKGROUND;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->x = DISPLAY_CENTER_X;
        s->y = DISPLAY_CENTER_Y;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);

        // TODO: ALLOC_TILES max of SA1_ANIM_PAUSE_TA and SA1_ANIM_PAUSE.
        s = &pm->s2;
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_PAUSE);
        s->oamFlags = SPRITE_OAM_ORDER(1);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_PAUSE;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->x = DISPLAY_CENTER_X;
        s->y = DISPLAY_CENTER_Y;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);
    }
#else
    s = &pm->s;

    pm->frames = 0;
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

    s->x = DISPLAY_CENTER_X;
    s->y = DISPLAY_CENTER_Y;

    s->frameFlags = 0;

    UpdateSpriteAnimation(s);
#endif
}

void Task_PauseMenuUpdate(void)
{
    PauseMenu *pm = TASK_DATA(gCurTask);

#if (GAME == GAME_SA1)
    if (gPressedKeys & START_BUTTON) {
        gFlags &= ~FLAGS_PAUSE_GAME;
        m4aMPlayAllContinue();
        TaskDestroy(gCurTask);
        return;
    }

    if ((gGameMode == GAME_MODE_TIME_ATTACK) && (gPressedKeys & A_BUTTON)) {
        gFlags &= ~FLAGS_PAUSE_GAME;
        m4aSongNumStart(SE_SELECT);

        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();

        CreateTimeAttackLobbyScreen();
        return;
    }

    if (gBldRegs.bldY > 0) {
        pm->s2.frameFlags |= SPRITE_FLAG(OBJ_MODE, 1);
        pm->s.frameFlags |= SPRITE_FLAG(OBJ_MODE, 1);
    } else {
        pm->s2.frameFlags &= ~SPRITE_FLAG_MASK_OBJ_MODE;
        pm->s.frameFlags &= ~SPRITE_FLAG_MASK_OBJ_MODE;
    }

    if (gGameMode == GAME_MODE_TIME_ATTACK) {
        if (++pm->frames >= GBA_FRAMES_PER_SECOND) {
            pm->frames = 0;

            if (pm->s2.graphics.anim == SA1_ANIM_PAUSE) {
                pm->s2.graphics.anim = SA1_ANIM_PAUSE_TA;
                pm->s2.variant = LOADED_SAVE->uiLanguage;
            } else {
                pm->s2.graphics.anim = SA1_ANIM_PAUSE;
                pm->s2.variant = 0;
            }

            UpdateSpriteAnimation(&pm->s2);
        }
    }

    DisplaySprite(&pm->s2);
#else
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

    pm->frames = 0;
#endif
    DisplaySprite(&pm->s);
}

void Task_PauseMenuInit(void)
{
    PauseMenu *pm = TASK_DATA(gCurTask);
    u32 i;

    for (i = 0; i < 4; i++) {
        if (i != gSongTable[SE_PAUSE_SCREEN].ms) {
            MPlayStop(gMPlayTable[i].info);
        }
    }

    m4aSongNumStart(SE_PAUSE_SCREEN);

    gFlags |= FLAGS_PAUSE_GAME;

#if (GAME == GAME_SA2)
    DmaCopy16(3, &GET_PALETTE_COLOR_OBJ(15, +9), pm->pal64, sizeof(pm->pal64));
    DmaCopy16(3, &GET_PALETTE_COLOR_OBJ(15, +12), pm->pal6A, sizeof(pm->pal6A));
#endif

    gCurTask->main = Task_PauseMenuUpdate;
}

void TaskDestructor_PauseMenu(Task *t)
{
    PauseMenu *pm = TASK_DATA(t);
#if (GAME == GAME_SA1)
    VramFree(pm->s2.graphics.dest);
#endif
    VramFree(pm->s.graphics.dest);
}

#if (GAME == GAME_SA2)
extern u8 Tileset_zone_1_act_1_fg[];

UNUSED void sub_800AE58(void)
{
    DmaCopy16(3, &Tileset_zone_1_act_1_fg[(4 * 16 * TILE_SIZE_4BPP) / sizeof(u16)], (void *)(OBJ_VRAM1 + 0x3EC0), 0x140);

    GET_PALETTE_COLOR_OBJ(0, 1) = RGB_WHITE;
    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    gFlags &= ~FLAGS_PAUSE_GAME;
}
#endif
