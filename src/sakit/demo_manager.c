#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"

#include "lib/m4a.h"

#include "sakit/demo_manager.h"
#include "sakit/player.h"

// TODO: add headers for these into sakit
// instead of including from the main game
#include "game/save.h"
#include "game/title_screen.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ Sprite textPressStart;
    /* 0x30 */ Sprite textDemoPlay;
    /* 0x60 */ u16 fadeBlendFactor;
    /* 0x62 */ u16 tFadeout;
    /* 0x64 */ bool8 playerPressedStart;
    /* 0x65 */ bool8 timeLimitDisabled;
} DemoManager;

typedef struct {
    /* 0x00 */ u16 volume;
    /* 0x02 */ u16 unk2;
} DemoMusicFadeout;

void Task_DemoManagerMain(void);
void Task_DemoManagerFadeout(void);
void CreateMusicFadeoutTask(u16);
void TaskDestructor_DemoManagerMain(struct Task *);
void Task_DemoManagerMusicFadeout(void);

void CreateDemoManager(void)
{
    u8 blendCtrl = gBldRegs.bldCnt & 0xC0;
    s8 lang = gLoadedSaveGame->language;
    struct Task *t = TaskCreate(Task_DemoManagerMain, sizeof(DemoManager), 1, 0, TaskDestructor_DemoManagerMain);
    DemoManager *dm = TASK_DATA(t);
    Sprite *s;

    dm->fadeBlendFactor = 0;
    dm->tFadeout = 0;
    dm->playerPressedStart = FALSE;
    dm->timeLimitDisabled = gLoadedSaveGame->timeLimitDisabled;

    gStageFlags |= STAGE_FLAG__DEMO_RUNNING;

    s = &dm->textPressStart;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 2) + 33;

    s->graphics.dest = VramMalloc(gPressStartTiles[lang].numTiles);
    s->graphics.size = 0;
    s->graphics.anim = gPressStartTiles[lang].anim;
    s->variant = gPressStartTiles[lang].variant;

    s->animCursor = 0;
    s->prevVariant = -1;
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->oamFlags = SPRITE_OAM_ORDER(1);
    s->frameFlags = 0;

    if (blendCtrl != BLDCNT_EFFECT_BLEND) {
        s->frameFlags = SPRITE_FLAG(OBJ_MODE, ST_OAM_OBJ_BLEND);
    }
    UpdateSpriteAnimation(s);

    s = &dm->textDemoPlay;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 2);

    s->graphics.dest = VramMalloc(28);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_DEMO_PLAY;
    s->variant = 0;

    s->animCursor = 0;
    s->prevVariant = -1;
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->oamFlags = SPRITE_OAM_ORDER(1);
    s->frameFlags = 0;

    if (blendCtrl != BLDCNT_EFFECT_BLEND) {
        s->frameFlags = SPRITE_FLAG(OBJ_MODE, ST_OAM_OBJ_BLEND);
    }
    UpdateSpriteAnimation(s);
}

void Task_DemoManagerMain(void)
{
    DemoManager *dm = TASK_DATA(gCurTask);

    if (gPhysicalInput & START_BUTTON) {
        gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
        gPlayer.unk5C = 0;

        gUnknown_030054E4 = 1;

        dm->playerPressedStart = TRUE;

        gCurTask->main = Task_DemoManagerFadeout;

        gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        gBldRegs.bldY = 0;

        gUnknown_030054A8.unk0 = 0xFF;
        CreateMusicFadeoutTask(64);
    } else if (gCheckpointTime > (u32)ZONE_TIME_TO_INT(0, 24.5)) {
        dm->playerPressedStart = FALSE;

        gCurTask->main = Task_DemoManagerFadeout;

        gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        gBldRegs.bldY = 0;

        gUnknown_030054A8.unk0 = 0xFF;
        CreateMusicFadeoutTask(64);
    }

    if (!(gStageFlags & STAGE_FLAG__100)) {
        Sprite *s = &dm->textPressStart;

        if (gStageTime & 0x20) {
            if (gBldRegs.bldY != 0) {
                s->frameFlags |= SPRITE_FLAG(OBJ_MODE, ST_OAM_OBJ_BLEND);
            } else {
                s->frameFlags &= ~SPRITE_FLAG_MASK_OBJ_MODE;
            }

            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }

        if (gBldRegs.bldY != 0) {
            dm->textDemoPlay.frameFlags |= SPRITE_FLAG(OBJ_MODE, ST_OAM_OBJ_BLEND);
        } else {
            dm->textDemoPlay.frameFlags &= ~SPRITE_FLAG_MASK_OBJ_MODE;
        }

        DisplaySprite(&dm->textDemoPlay);
    }
}

void Task_DemoManagerEndFadeout(void)
{
    DemoManager *dm = TASK_DATA(gCurTask);
    dm->tFadeout++;

    m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 0);
    m4aMPlayVolumeControl(&gMPlayInfo_SE1, 0xFFFF, 0);
    m4aMPlayVolumeControl(&gMPlayInfo_SE2, 0xFFFF, 0);
    m4aMPlayVolumeControl(&gMPlayInfo_SE3, 0xFFFF, 0);

    if (dm->tFadeout >= 48) {
        gLoadedSaveGame->timeLimitDisabled = dm->timeLimitDisabled;
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        PAUSE_GRAPHICS_QUEUE();

        if (!dm->playerPressedStart) {
            CreateTitleScreen();
        } else {
            CreateTitleScreenAtPlayModeMenu();
        }
    }
}

void Task_DemoManagerFadeout(void)
{
    DemoManager *dm = TASK_DATA(gCurTask);
    dm->fadeBlendFactor += Q(0.25);

    gBldRegs.bldY = dm->fadeBlendFactor >> 8;

    if (dm->fadeBlendFactor >= Q(16.0)) {
        gCurTask->main = Task_DemoManagerEndFadeout;
    }
}

void TaskDestructor_DemoManagerMain(struct Task *t)
{
    DemoManager *dm = TASK_DATA(t);
    VramFree(dm->textPressStart.graphics.dest);
    VramFree(dm->textDemoPlay.graphics.dest);

    gUnknown_030054E4 = 0;
    gStageFlags &= ~STAGE_FLAG__DEMO_RUNNING;
}

void CreateMusicFadeoutTask(u16 factor)
{
    struct Task *t = TaskCreate(Task_DemoManagerMusicFadeout, sizeof(DemoMusicFadeout), 0xFFFE, 0, NULL);
    DemoMusicFadeout *mf = TASK_DATA(t);
    mf->volume = 0x100;
    mf->unk2 = (s32)mf->volume / factor;
    gUnknown_030054A8.unk0 = 0xFF;
}

void Task_DemoManagerMusicFadeout(void)
{
    DemoMusicFadeout *mf = TASK_DATA(gCurTask);

    m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, mf->volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE1, 0xFFFF, mf->volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE2, 0xFFFF, mf->volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE3, 0xFFFF, mf->volume);

    mf->volume -= mf->unk2;
    if ((s16)mf->volume < 0) {
        mf->volume = 0;
    }
}