#include "core.h"
#include "malloc_vram.h"
#include "flags.h"
#include "task.h"
#include "lib/m4a.h"
#include "game/game_over.h"
#include "game/game.h"
#include "game/time_attack/lobby.h"
#include "game/title_screen.h"
#include "game/screen_fade.h"
#include "game/stage/stage.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    ScreenFade unk0;
    u8 lostLifeCause;
    u8 delay;
} GameOverScreenFade;

void Task_FadeoutToGameOverScreen(void);

void CreateGameOverOrTimeOverScreen(u8 lostLifeCause)
{
    struct Task *t = TaskCreate(Task_FadeoutToGameOverScreen, sizeof(GameOverScreenFade),
                                0x2220, 0, NULL);
    GameOverScreenFade *screen = TASK_DATA(t);

    ScreenFade *fade = &screen->unk0;
    fade->window = SCREEN_FADE_USE_WINDOW_1;
    fade->brightness = Q_24_8(0);
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->speed = Q_24_8(1. / 4.);
    fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);
    fade->bldAlpha = 0;

    screen->lostLifeCause = lostLifeCause;
    screen->delay = 10;

    m4aMPlayFadeOut(&gMPlayInfo_BGM, 8);
    m4aMPlayFadeOut(&gMPlayInfo_SE1, 8);
    m4aMPlayFadeOut(&gMPlayInfo_SE2, 8);
    m4aMPlayFadeOut(&gMPlayInfo_SE3, 8);
}

static void InitGameOverOrTimeOverScreen(u8);

void Task_FadeoutToGameOverScreen(void)
{
    GameOverScreenFade *gameover_fade = TASK_DATA(gCurTask);
    u8 unkC = gameover_fade->lostLifeCause;

    if (gameover_fade->delay != 0) {
        gameover_fade->delay--;
        return;
    }

    if (UpdateScreenFade(&gameover_fade->unk0) != SCREEN_FADE_RUNNING) {
        gBldRegs.bldY = 16;
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
        InitGameOverOrTimeOverScreen(unkC);

        if (unkC & 1) {
            m4aSongNumStart(MUS_GAME_OVER);
        } else {
            m4aSongNumStart(SE_149);
        }
    }
}

typedef struct {
    ScreenFade unk0;
    Sprite unkC;
    Sprite unk3C;
    u32 unk6C;
} GameOverScreen;

void Task_GameOverScreenMain(void);
void sub_8036C38(struct Task *);
void Task_TimeOverScreenMain(void);

static void InitGameOverOrTimeOverScreen(u8 lostLifeCause)
{
    struct Task *t;
    GameOverScreen *screen;
    Sprite *s;
    ScreenFade *fade;

    gWinRegs[4] = 0;
    gWinRegs[5] = 0;
    gWinRegs[0] = 0;
    gWinRegs[2] = 0;
    gWinRegs[1] = 0;
    gWinRegs[3] = 0;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    gBldRegs.bldAlpha = 0;
    gFlags &= ~FLAGS_4;

    memset(gBgPalette, 0, 0x200);
    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;

    if (lostLifeCause & GAMEOVER_CAUSE_ZERO_LIVES) {
        t = TaskCreate(Task_GameOverScreenMain, 0x70, 0x1000, 0, sub_8036C38);
    } else {
        t = TaskCreate(Task_TimeOverScreenMain, 0x70, 0x1000, 0, sub_8036C38);
    }

    screen = TASK_DATA(t);

    if (lostLifeCause & GAMEOVER_CAUSE_ZERO_LIVES) {
        screen->unk6C = 140;
    } else {
        screen->unk6C = 180;
    }

    s = &screen->unkC;
    s->graphics.dest = VramMalloc(0x40);
    if (lostLifeCause & GAMEOVER_CAUSE_ZERO_LIVES) {
        s->graphics.anim = SA2_ANIM_GAME_OVER;
        s->variant = SA2_ANIM_VARIANT_GAME_OVER_GAME;
    } else {
        s->graphics.anim = SA2_ANIM_GAME_OVER;
        s->variant = SA2_ANIM_VARIANT_GAME_OVER_TIME;
    }
    s->prevVariant = -1;
    s->x = 0;
    s->y = DISPLAY_HEIGHT / 2;
    s->unk1A = SPRITE_OAM_ORDER(3);
    s->graphics.size = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10 = 0;
    UpdateSpriteAnimation(s);

    s = &screen->unk3C;
    s->graphics.dest = VramMalloc(0x40);
    s->graphics.anim = SA2_ANIM_GAME_OVER;
    s->variant = SA2_ANIM_VARIANT_GAME_OVER_OVER;
    s->prevVariant = -1;
    s->x = 0;
    s->y = DISPLAY_HEIGHT / 2;
    s->graphics.size = 0;
    s->unk1A = SPRITE_OAM_ORDER(3);
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10 = 0;
    UpdateSpriteAnimation(s);

    fade = &screen->unk0;
    fade->window = SCREEN_FADE_USE_WINDOW_1;
    fade->brightness = Q_24_8(0);
    fade->flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);
    fade->speed = Q_24_8(2.0);
    fade->bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_OBJ);
    fade->bldAlpha = 0;
}

void sub_8036BD4(GameOverScreen *screen);
void sub_80369D8(void);

void Task_GameOverScreenMain(void)
{
    GameOverScreen *screen = TASK_DATA(gCurTask);
    Sprite *s = &screen->unkC;
    Sprite *sprite2 = &screen->unk3C;

    gBldRegs.bldCnt = 0x3FEF;

    if (screen->unk6C == 60) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q_24_8(0);
        screen->unk0.flags = SCREEN_FADE_FLAG_LIGHTEN;
        screen->unk0.speed = Q_24_8(4.0);
        screen->unk0.bldCnt
            = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_OBJ);
        screen->unk0.bldAlpha = 0;
    }

    if (screen->unk6C == 50) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q_24_8(0);
        screen->unk0.flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);
        screen->unk0.speed = Q_24_8(4.0);
        screen->unk0.bldCnt
            = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_OBJ);
        screen->unk0.bldAlpha = 0;
    }

    if (screen->unk6C >= 61) {
        s16 temp = screen->unk6C + 60;
        s->x = temp;
        sprite2->x = temp;
    } else {
        s->x = 120;
        sprite2->x = 120;
    }

    UpdateScreenFade(&screen->unk0);

    if (--screen->unk6C == 0) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q_24_8(0);
        screen->unk0.flags = SCREEN_FADE_FLAG_LIGHTEN;
        screen->unk0.speed = Q_24_8(1. / 4.);
        screen->unk0.bldCnt
            = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_BD | BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1
               | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3 | BLDCNT_TGT2_ALL);
        screen->unk0.bldAlpha = 0;

        screen->unk6C = 120;
        gCurTask->main = sub_80369D8;
    }

    sub_8036BD4(screen);
}

void sub_8036B30(void);

void sub_80369D8(void)
{
    GameOverScreen *screen = TASK_DATA(gCurTask);
    UpdateScreenFade(&screen->unk0);

    if (--screen->unk6C == 0) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q_24_8(0);
        screen->unk0.flags = (SCREEN_FADE_FLAG_LIGHTEN);
        screen->unk0.speed = Q_24_8(1.0);
        screen->unk0.bldCnt
            = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL);
        screen->unk0.bldAlpha = 0;
        memset(gBgPalette, RGB(31, 7, 0), sizeof(gBgPalette));
        gFlags |= 0x1;
        gCurTask->main = sub_8036B30;
    }

    sub_8036BD4(screen);
}

void sub_8036BEC(GameOverScreen *screen);

void Task_TimeOverScreenMain(void)
{
    GameOverScreen *screen = TASK_DATA(gCurTask);
    Sprite *s = &screen->unkC;
    Sprite *sprite2 = &screen->unk3C;

    gBldRegs.bldCnt = 0x3FEF;

    if (screen->unk6C == 0x96) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q_24_8(0);
        screen->unk0.flags = SCREEN_FADE_FLAG_LIGHTEN;
        screen->unk0.speed = Q_24_8(4.0);
        screen->unk0.bldCnt
            = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_OBJ);
        screen->unk0.bldAlpha = 0;
    }

    if (screen->unk6C == 0x8C) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q_24_8(0);
        screen->unk0.flags = (SCREEN_FADE_FLAG_2 | SCREEN_FADE_FLAG_DARKEN);
        screen->unk0.speed = Q_24_8(2.0);
        screen->unk0.bldCnt
            = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_OBJ);
        screen->unk0.bldAlpha = 0;
    }

    if (screen->unk6C == 0x1E) {
        screen->unk0.window = SCREEN_FADE_USE_WINDOW_1;
        screen->unk0.brightness = Q_24_8(0);
        screen->unk0.flags = SCREEN_FADE_FLAG_LIGHTEN;
        screen->unk0.speed = Q_24_8(2.0);
        screen->unk0.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_OBJ);
        screen->unk0.bldAlpha = 0;
    }

    UpdateScreenFade(&screen->unk0);

    if (--screen->unk6C == 0) {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
        gRingCount = 0;

        if (gGameMode == GAME_MODE_TIME_ATTACK) {
            CreateTimeAttackLobbyScreen();
        } else {
            CreateGameStage();
        }
        return;
    }

    sub_8036BEC(screen);
}

void sub_8036B70(void);

void sub_8036B30(void)
{
    GameOverScreen *screen = TASK_DATA(gCurTask);

    if (UpdateScreenFade(&screen->unk0) != 0) {
        screen->unk6C = 140;
        UpdateScreenFade(&screen->unk0);
        gCurTask->main = sub_8036B70;
    }

    sub_8036BD4(screen);
}

void sub_8036B70(void)
{
    GameOverScreen *screen = TASK_DATA(gCurTask);

    if (--screen->unk6C == 0) {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
        CreateTitleScreen();
        return;
    }

    sub_8036BD4(screen);
}

void sub_8036BD4(GameOverScreen *screen)
{
    Sprite *s = &screen->unkC;
    Sprite *sprite2 = &screen->unk3C;
    DisplaySprite(s);
    DisplaySprite(sprite2);
}

void sub_8036BEC(GameOverScreen *screen)
{
    Sprite *s = &screen->unkC;
    Sprite *sprite2 = &screen->unk3C;
    if (screen->unk6C > 140) {
        s16 temp = (screen->unk6C * 2) - 160;
        s->x = temp;
        sprite2->x = temp;
    } else if (screen->unk6C > 40) {
        s->x = 120;
        sprite2->x = 120;
    } else if (screen->unk6C > 0) {
        s16 temp = 120 - ((40 - screen->unk6C) * 2);
        s->x = temp;
        sprite2->x = temp;
    } else {
        return;
    }

    DisplaySprite(s);
    DisplaySprite(sprite2);
}

void sub_8036C38(struct Task *t)
{
    GameOverScreen *screen = TASK_DATA(t);

    VramFree(screen->unkC.graphics.dest);
    VramFree(screen->unk3C.graphics.dest);
}
