#include <string.h> // memset

#include "core.h"
#include "malloc_vram.h"
#include "flags.h"
#include "task.h"
#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/game_over.h"
#include "game/time_attack/lobby.h"
#include "game/title_screen.h"

#include "game/stage/screen_fade.h"
#include "game/stage/stage.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    ScreenFade unk0;
    LostLifeCause lostLifeCause;
    u8 delay;
} GameOverScreenFade;

typedef struct {
    ScreenFade unk0;
    Sprite sprGameOrTime;
    Sprite sprOver;
    u32 framesUntilDone;
} GameOverScreen;

void Task_FadeoutToOverScreen(void);
void DisplayOverScreenTextSprites(GameOverScreen *screen);
void sub_80369D8(void);
static void InitOverScreen(LostLifeCause lostLifeCause);
void Task_GameOverScreenMain(void);
void TaskDestructor_GameOverTimeOverScreen(struct Task *);
void Task_TimeOverScreenMain(void);
void sub_8036B70(void);
void UpdateTimeOverScreenSprites(GameOverScreen *screen);
void sub_8036B30(void);

void CreateGameOverScreen(LostLifeCause lostLifeCause)
{
    struct Task *t = TaskCreate(Task_FadeoutToOverScreen, sizeof(GameOverScreenFade), 0x2220, 0, NULL);
    GameOverScreenFade *screen = TASK_DATA(t);

    ScreenFade *fade = &screen->unk0;
    fade->window = SCREEN_FADE_USE_WINDOW_1;
    fade->brightness = Q(0);
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->speed = Q(1. / 4.);
    fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);
    fade->bldAlpha = 0;

    screen->lostLifeCause = lostLifeCause;
    screen->delay = 10;

    m4aMPlayFadeOut(&gMPlayInfo_BGM, 8);
    m4aMPlayFadeOut(&gMPlayInfo_SE1, 8);
    m4aMPlayFadeOut(&gMPlayInfo_SE2, 8);
    m4aMPlayFadeOut(&gMPlayInfo_SE3, 8);
}

void Task_FadeoutToOverScreen(void)
{
    GameOverScreenFade *gameover_fade = TASK_DATA(gCurTask);
    LostLifeCause lostLifeCause = gameover_fade->lostLifeCause;

    if (gameover_fade->delay != 0) {
        gameover_fade->delay--;
        return;
    }

    if (UpdateScreenFade(&gameover_fade->unk0) != SCREEN_FADE_RUNNING) {
        gBldRegs.bldY = 16;
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        InitOverScreen(lostLifeCause);

        if (lostLifeCause & OVER_CAUSE_ZERO_LIVES) {
            m4aSongNumStart(MUS_GAME_OVER);
        } else {
            m4aSongNumStart(SE_TIME_UP);
        }
    }
}

static void InitOverScreen(LostLifeCause lostLifeCause)
{
    struct Task *t;
    GameOverScreen *screen;
    Sprite *s;
    ScreenFade *fade;

    gWinRegs[WINREG_WININ] = WIN_RANGE(0, 0);
    gWinRegs[WINREG_WINOUT] = WIN_RANGE(0, 0);
    gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, 0);
    gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, 0);
    gWinRegs[WINREG_WIN1H] = WIN_RANGE(0, 0);
    gWinRegs[WINREG_WIN1V] = WIN_RANGE(0, 0);
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    gBldRegs.bldAlpha = 0;
    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;

    memset(gBgPalette, 0, sizeof(gBgPalette));
    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;

    if (lostLifeCause & OVER_CAUSE_ZERO_LIVES) {
        t = TaskCreate(Task_GameOverScreenMain, sizeof(GameOverScreen), 0x1000, 0, TaskDestructor_GameOverTimeOverScreen);
    } else {
        t = TaskCreate(Task_TimeOverScreenMain, sizeof(GameOverScreen), 0x1000, 0, TaskDestructor_GameOverTimeOverScreen);
    }

    screen = TASK_DATA(t);

    if (lostLifeCause & OVER_CAUSE_ZERO_LIVES) {
        screen->framesUntilDone = 140;
    } else {
        screen->framesUntilDone = 180;
    }

    s = &screen->sprGameOrTime;
    s->graphics.dest = VramMalloc(0x40);
    if (lostLifeCause & OVER_CAUSE_ZERO_LIVES) {
        s->graphics.anim = SA2_ANIM_GAME_OVER;
        s->variant = SA2_ANIM_VARIANT_GAME_OVER_GAME;
    } else {
        s->graphics.anim = SA2_ANIM_GAME_OVER;
        s->variant = SA2_ANIM_VARIANT_GAME_OVER_TIME;
    }
    s->prevVariant = -1;
    s->x = 0;
    s->y = DISPLAY_HEIGHT / 2;
    s->oamFlags = SPRITE_OAM_ORDER(3);
    s->graphics.size = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &screen->sprOver;
    s->graphics.dest = VramMalloc(0x40);
    s->graphics.anim = SA2_ANIM_GAME_OVER;
    s->variant = SA2_ANIM_VARIANT_GAME_OVER_OVER;
    s->prevVariant = -1;
    s->x = 0;
    s->y = DISPLAY_HEIGHT / 2;
    s->graphics.size = 0;
    s->oamFlags = SPRITE_OAM_ORDER(3);
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    fade = &screen->unk0;
    fade->window = SCREEN_FADE_USE_WINDOW_1;
    fade->brightness = Q(0);
    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);
    fade->speed = Q(2.0);
    fade->bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_OBJ);
    fade->bldAlpha = 0;
}

void Task_GameOverScreenMain(void)
{
    GameOverScreen *screen = TASK_DATA(gCurTask);
    Sprite *s = &screen->sprGameOrTime;
    Sprite *sprite2 = &screen->sprOver;

    gBldRegs.bldCnt = 0x3FEF;

    if (screen->framesUntilDone == 60) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q(0);
        screen->unk0.flags = SCREEN_FADE_FLAG_LIGHTEN;
        screen->unk0.speed = Q(4.0);
        screen->unk0.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_OBJ);
        screen->unk0.bldAlpha = 0;
    }

    if (screen->framesUntilDone == 50) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q(0);
        screen->unk0.flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);
        screen->unk0.speed = Q(4.0);
        screen->unk0.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_OBJ);
        screen->unk0.bldAlpha = 0;
    }

    if (screen->framesUntilDone >= 61) {
        s16 temp = screen->framesUntilDone + 60;
        s->x = temp;
        sprite2->x = temp;
    } else {
        s->x = (DISPLAY_WIDTH / 2);
        sprite2->x = (DISPLAY_WIDTH / 2);
    }

    UpdateScreenFade(&screen->unk0);

    if (--screen->framesUntilDone == 0) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q(0);
        screen->unk0.flags = SCREEN_FADE_FLAG_LIGHTEN;
        screen->unk0.speed = Q(1. / 4.);
        screen->unk0.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_BD | BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2
                               | BLDCNT_TGT1_BG3 | BLDCNT_TGT2_ALL);
        screen->unk0.bldAlpha = 0;

        screen->framesUntilDone = 120;
        gCurTask->main = sub_80369D8;
    }

    DisplayOverScreenTextSprites(screen);
}

void sub_80369D8(void)
{
    GameOverScreen *screen = TASK_DATA(gCurTask);
    UpdateScreenFade(&screen->unk0);

    if (--screen->framesUntilDone == 0) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q(0);
        screen->unk0.flags = (SCREEN_FADE_FLAG_LIGHTEN);
        screen->unk0.speed = Q(1.0);
        screen->unk0.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);
        screen->unk0.bldAlpha = 0;
        memset(gBgPalette, RGB16(31, 7, 0), sizeof(gBgPalette));
        gFlags |= 0x1;
        gCurTask->main = sub_8036B30;
    }

    DisplayOverScreenTextSprites(screen);
}

void Task_TimeOverScreenMain(void)
{
    GameOverScreen *screen = TASK_DATA(gCurTask);
    Sprite *s = &screen->sprGameOrTime;
    Sprite *sprite2 = &screen->sprOver;

    gBldRegs.bldCnt = 0x3FEF;

    if (screen->framesUntilDone == 150) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q(0);
        screen->unk0.flags = SCREEN_FADE_FLAG_LIGHTEN;
        screen->unk0.speed = Q(4.0);
        screen->unk0.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_OBJ);
        screen->unk0.bldAlpha = 0;
    }

    if (screen->framesUntilDone == 140) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q(0);
        screen->unk0.flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);
        screen->unk0.speed = Q(2.0);
        screen->unk0.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_OBJ);
        screen->unk0.bldAlpha = 0;
    }

    if (screen->framesUntilDone == 30) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q(0);
        screen->unk0.flags = SCREEN_FADE_FLAG_LIGHTEN;
        screen->unk0.speed = Q(2.0);
        screen->unk0.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_OBJ);
        screen->unk0.bldAlpha = 0;
    }

    UpdateScreenFade(&screen->unk0);

    if (--screen->framesUntilDone == 0) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        gRingCount = 0;

        if (gGameMode == GAME_MODE_TIME_ATTACK) {
            CreateTimeAttackLobbyScreen();
        } else {
            CreateGameStage();
        }
        return;
    }

    UpdateTimeOverScreenSprites(screen);
}

void sub_8036B30(void)
{
    GameOverScreen *screen = TASK_DATA(gCurTask);

    if (UpdateScreenFade(&screen->unk0) != 0) {
        screen->framesUntilDone = 140;
        UpdateScreenFade(&screen->unk0);
        gCurTask->main = sub_8036B70;
    }

    DisplayOverScreenTextSprites(screen);
}

void sub_8036B70(void)
{
    GameOverScreen *screen = TASK_DATA(gCurTask);

    if (--screen->framesUntilDone == 0) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        CreateTitleScreen();
    } else {
        DisplayOverScreenTextSprites(screen);
    }
}

void DisplayOverScreenTextSprites(GameOverScreen *screen)
{
    Sprite *s = &screen->sprGameOrTime;
    Sprite *sprite2 = &screen->sprOver;
    DisplaySprite(s);
    DisplaySprite(sprite2);
}

void UpdateTimeOverScreenSprites(GameOverScreen *screen)
{
    Sprite *s = &screen->sprGameOrTime;
    Sprite *sprite2 = &screen->sprOver;
    if (screen->framesUntilDone > 140) {
        s16 temp = (screen->framesUntilDone * 2) - 160;
        s->x = temp;
        sprite2->x = temp;
    } else if (screen->framesUntilDone > 40) {
        s->x = (DISPLAY_WIDTH / 2);
        sprite2->x = (DISPLAY_WIDTH / 2);
    } else if (screen->framesUntilDone > 0) {
        s16 temp = (DISPLAY_WIDTH / 2) - ((40 - screen->framesUntilDone) * 2);
        s->x = temp;
        sprite2->x = temp;
    } else {
        return;
    }

    DisplaySprite(s);
    DisplaySprite(sprite2);
}

void TaskDestructor_GameOverTimeOverScreen(struct Task *t)
{
    GameOverScreen *screen = TASK_DATA(t);

    VramFree(screen->sprGameOrTime.graphics.dest);
    VramFree(screen->sprOver.graphics.dest);
}
