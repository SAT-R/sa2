#include "engine/core.h"
#include "game/game_over.h"
#include "game/game.h"
#include "game/time_attack/lobby.h"
#include "game/title_screen.h"
#include "engine/task.h"
#include "transition.h"
#include "lib/m4a.h"
#include "engine/malloc_vram.h"
#include "constants/songs.h"

typedef struct {
    struct UNK_802D4CC_UNK270 unk0;
    u8 unkC;
    u8 unkD;
} GameOverScreenTransition;

void sub_80366F0(void);

void CreateGameOverScreen(u8 type)
{
    struct Task *t = TaskCreate(sub_80366F0, 0x10, 0x2220, 0, NULL);
    GameOverScreenTransition *transition = TaskGetStructPtr(t);

    struct UNK_802D4CC_UNK270 *transitionConfig = &transition->unk0;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk2 = 1;
    transitionConfig->unk6 = 0x40;
    transitionConfig->unk8 = 0x3FFF;
    transitionConfig->unkA = 0;

    transition->unkC = type;
    transition->unkD = 10;

    m4aMPlayFadeOut(&gMPlayInfo_BGM, 8);
    m4aMPlayFadeOut(&gMPlayInfo_SE1, 8);
    m4aMPlayFadeOut(&gMPlayInfo_SE2, 8);
    m4aMPlayFadeOut(&gMPlayInfo_SE3, 8);
}

void sub_8036780(u8);

void sub_80366F0(void)
{
    GameOverScreenTransition *transition = TaskGetStructPtr(gCurTask);
    u8 unkC = transition->unkC;

    if (transition->unkD != 0) {
        transition->unkD--;
        return;
    }

    if (sub_802D4CC(&transition->unk0) != 0) {
        gBldRegs.bldY = 0x10;
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
        sub_8036780(unkC);

        if (unkC & 1) {
            m4aSongNumStart(MUS_GAME_OVER);
        } else {
            m4aSongNumStart(SE_149);
        }
    }
}

typedef struct {
    struct UNK_802D4CC_UNK270 unk0;
    Sprite unkC;
    Sprite unk3C;
    u32 unk6C;
} GameOverScreen;

void sub_8036918(void);
void sub_8036C38(struct Task *);
void sub_8036A44(void);

void sub_8036780(u8 unkC)
{
    struct Task *t;
    GameOverScreen *screen;
    Sprite *sprite;
    struct UNK_802D4CC_UNK270 *transitionConfig;

    gWinRegs[4] = 0;
    gWinRegs[5] = 0;
    gWinRegs[0] = 0;
    gWinRegs[2] = 0;
    gWinRegs[1] = 0;
    gWinRegs[3] = 0;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    gBldRegs.bldAlpha = 0;
    gFlags &= ~0x4;
    memset(gBgPalette, 0, 0x200);
    gFlags |= 0x1;

    if (unkC & 1) {
        t = TaskCreate(sub_8036918, 0x70, 0x1000, 0, sub_8036C38);
    } else {
        t = TaskCreate(sub_8036A44, 0x70, 0x1000, 0, sub_8036C38);
    }

    screen = TaskGetStructPtr(t);

    if (unkC & 1) {
        screen->unk6C = 0x8C;
    } else {
        screen->unk6C = 0xB4;
    }

    sprite = &screen->unkC;
    sprite->graphics.dest = VramMalloc(0x40);
    if (unkC & 1) {
        sprite->graphics.anim = 731;
        sprite->variant = 0;
    } else {
        sprite->graphics.anim = 731;
        sprite->variant = 4;
    }
    sprite->unk21 = 0xFF;
    sprite->x = 0;
    sprite->y = 80;
    sprite->unk1A = 0xC0;
    sprite->graphics.size = 0;
    sprite->unk1C = 0;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk10 = 0;
    sub_8004558(sprite);

    sprite = &screen->unk3C;
    sprite->graphics.dest = VramMalloc(0x40);
    sprite->graphics.anim = 731;
    sprite->variant = 1;
    sprite->unk21 = 0xFF;
    sprite->x = 0;
    sprite->y = 80;
    sprite->graphics.size = 0;
    sprite->unk1A = 0xC0;
    sprite->unk1C = 0;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk10 = 0;
    sub_8004558(sprite);

    transitionConfig = &screen->unk0;
    transitionConfig->unk0 = 1;
    transitionConfig->unk4 = 0;
    transitionConfig->unk2 = 2;
    transitionConfig->unk6 = 0x200;
    transitionConfig->unk8 = 0x3FD0;
    transitionConfig->unkA = 0;
}

void sub_8036BD4(GameOverScreen *screen);
void sub_80369D8(void);

void sub_8036918(void)
{
    GameOverScreen *screen = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &screen->unkC;
    Sprite *sprite2 = &screen->unk3C;

    gBldRegs.bldCnt = 0x3FEF;

    if (screen->unk6C == 0x3C) {
        screen->unk0.unk0 = 1;
        screen->unk0.unk4 = 0;
        screen->unk0.unk2 = 1;
        screen->unk0.unk6 = 0x400;
        screen->unk0.unk8 = 0x3F90;
        screen->unk0.unkA = 0;
    }

    if (screen->unk6C == 0x32) {
        screen->unk0.unk0 = 1;
        screen->unk0.unk4 = 0;
        screen->unk0.unk2 = 2;
        screen->unk0.unk6 = 0x400;
        screen->unk0.unk8 = 0x3F90;
        screen->unk0.unkA = 0;
    }

    if (screen->unk6C >= 0x3D) {
        s16 temp = screen->unk6C + 60;
        sprite->x = temp;
        sprite2->x = temp;
    } else {
        sprite->x = 120;
        sprite2->x = 120;
    }

    sub_802D4CC(&screen->unk0);

    screen->unk6C--;

    if (screen->unk6C == 0) {
        screen->unk0.unk0 = 1;
        screen->unk0.unk4 = 0;
        screen->unk0.unk2 = 1;
        screen->unk0.unk6 = 0x40;
        screen->unk0.unk8 = 0x3FAF;
        screen->unk0.unkA = 0;

        screen->unk6C = 120;
        gCurTask->main = sub_80369D8;
    }

    sub_8036BD4(screen);
}

void sub_8036B30(void);

void sub_80369D8(void)
{
    GameOverScreen *screen = TaskGetStructPtr(gCurTask);
    sub_802D4CC(&screen->unk0);

    if (--screen->unk6C == 0) {
        screen->unk0.unk0 = 1;
        screen->unk0.unk4 = 0;
        screen->unk0.unk2 = 1;
        screen->unk0.unk6 = 0x100;
        screen->unk0.unk8 = 0x3FBF;
        screen->unk0.unkA = 0;
        memset(gBgPalette, 0xFF, 0x200);
        gFlags |= 0x1;
        gCurTask->main = sub_8036B30;
    }

    sub_8036BD4(screen);
}

void sub_8036BEC(GameOverScreen *screen);

void sub_8036A44(void)
{
    GameOverScreen *screen = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &screen->unkC;
    Sprite *sprite2 = &screen->unk3C;

    gBldRegs.bldCnt = 0x3FEF;

    if (screen->unk6C == 0x96) {
        screen->unk0.unk0 = 1;
        screen->unk0.unk4 = 0;
        screen->unk0.unk2 = 1;
        screen->unk0.unk6 = 0x400;
        screen->unk0.unk8 = 0x3F90;
        screen->unk0.unkA = 0;
    }

    if (screen->unk6C == 0x8C) {
        screen->unk0.unk0 = 1;
        screen->unk0.unk4 = 0;
        screen->unk0.unk2 = 2;
        screen->unk0.unk6 = 0x200;
        screen->unk0.unk8 = 0x3F90;
        screen->unk0.unkA = 0;
    }

    if (screen->unk6C == 0x1E) {
        screen->unk0.unk0 = 1;
        screen->unk0.unk4 = 0;
        screen->unk0.unk2 = 1;
        screen->unk0.unk6 = 0x200;
        screen->unk0.unk8 = 0x3FD0;
        screen->unk0.unkA = 0;
    }

    sub_802D4CC(&screen->unk0);

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
    GameOverScreen *screen = TaskGetStructPtr(gCurTask);

    if (sub_802D4CC(&screen->unk0) != 0) {
        screen->unk6C = 140;
        sub_802D4CC(&screen->unk0);
        gCurTask->main = sub_8036B70;
    }

    sub_8036BD4(screen);
}

void sub_8036B70(void)
{
    GameOverScreen *screen = TaskGetStructPtr(gCurTask);

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
    Sprite *sprite = &screen->unkC;
    Sprite *sprite2 = &screen->unk3C;
    sub_80051E8(sprite);
    sub_80051E8(sprite2);
}

void sub_8036BEC(GameOverScreen *screen)
{
    Sprite *sprite = &screen->unkC;
    Sprite *sprite2 = &screen->unk3C;
    if (screen->unk6C > 140) {
        s16 temp = (screen->unk6C * 2) - 160;
        sprite->x = temp;
        sprite2->x = temp;
    } else if (screen->unk6C > 40) {
        sprite->x = 120;
        sprite2->x = 120;
    } else if (screen->unk6C > 0) {
        s16 temp = 120 - ((40 - screen->unk6C) * 2);
        sprite->x = temp;
        sprite2->x = temp;
    } else {
        return;
    }

    sub_80051E8(sprite);
    sub_80051E8(sprite2);
}

void sub_8036C38(struct Task *t)
{
    GameOverScreen *screen = TaskGetStructPtr(t);

    VramFree(screen->unkC.graphics.dest);
    VramFree(screen->unk3C.graphics.dest);
}
