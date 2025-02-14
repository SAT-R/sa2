#include <string.h> // memcpy

#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"

#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/demo_manager.h"
#include "game/sa1_sa2_shared/player.h"

// TODO: add headers for these into sa1_sa2_shared
// instead of including from the main game
#include "game/save.h"
#include "game/title_screen.h"

#include "constants/animations.h"
#include "constants/anim_sizes.h"

#if (GAME == GAME_SA1)
#define DEMO_SPRITE_PRIO   1
#define DEMO_OAM_ORDER     15
#define DEMO_PLAYBACK_TIME ZONE_TIME_TO_INT(0, 30)
#elif (GAME == GAME_SA2)
#define DEMO_SPRITE_PRIO   0
#define DEMO_OAM_ORDER     1
#define DEMO_PLAYBACK_TIME ZONE_TIME_TO_INT(0, 24.5)
#endif

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
    u8 blendCtrl;
    s8 lang;
    struct Task *t;
    DemoManager *dm;
    Sprite *s;
#if (GAME == GAME_SA1)
    const AnimId arr[2];
    memcpy(&arr, gPressStartTiles, sizeof(arr));
#endif
    blendCtrl = gBldRegs.bldCnt & 0xC0;
#if (GAME == GAME_SA2)
    lang = LOADED_SAVE->language;
#endif
    t = TaskCreate(Task_DemoManagerMain, sizeof(DemoManager), 1, 0, TaskDestructor_DemoManagerMain);
    dm = TASK_DATA(t);

    dm->fadeBlendFactor = 0;
    dm->tFadeout = 0;
    dm->playerPressedStart = FALSE;
    dm->timeLimitDisabled = LOADED_SAVE->timeLimitDisabled;

    gStageFlags |= STAGE_FLAG__DEMO_RUNNING;

    s = &dm->textPressStart;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 2) + 33;

#if (GAME == GAME_SA1)
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_PRESS_START_MSG_JP);
    s->graphics.size = 0;
    s->graphics.anim = arr[LOADED_SAVE->uiLanguage];
    s->variant = 0;
#elif (GAME == GAME_SA2)
    s->graphics.dest = VramMalloc(gPressStartTiles[lang].numTiles);
    s->graphics.size = 0;
    s->graphics.anim = gPressStartTiles[lang].anim;
    s->variant = gPressStartTiles[lang].variant;
#endif

    s->animCursor = 0;
    s->prevVariant = -1;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->oamFlags = SPRITE_OAM_ORDER(DEMO_OAM_ORDER);
    s->frameFlags = SPRITE_FLAG(PRIORITY, DEMO_SPRITE_PRIO);

    if (blendCtrl != BLDCNT_EFFECT_BLEND) {
        s->frameFlags |= SPRITE_FLAG(OBJ_MODE, ST_OAM_OBJ_BLEND);
    }
    UpdateSpriteAnimation(s);

    s = &dm->textDemoPlay;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 2);

#if (GAME == GAME_SA1)
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_DEMO_PLAY);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_DEMO_PLAY;
    s->variant = 0;
#elif (GAME == GAME_SA2)
    s->graphics.dest = ALLOC_TILES(ANIM_DEMO_PLAY);
    s->graphics.size = 0;
    s->graphics.anim = ANIM_DEMO_PLAY;
    s->variant = 0;
#endif

    s->animCursor = 0;
    s->prevVariant = -1;
    s->qAnimDelay = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->oamFlags = SPRITE_OAM_ORDER(DEMO_OAM_ORDER);
    s->frameFlags = SPRITE_FLAG(PRIORITY, DEMO_SPRITE_PRIO);

    if (blendCtrl != BLDCNT_EFFECT_BLEND) {
        s->frameFlags |= SPRITE_FLAG(OBJ_MODE, ST_OAM_OBJ_BLEND);
    }
    UpdateSpriteAnimation(s);
}

void Task_DemoManagerMain(void)
{
    DemoManager *dm = TASK_DATA(gCurTask);

    if (gPhysicalInput & START_BUTTON) {
        gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
        gPlayer.heldInput = 0;

        gDestroySpotlights = 1;

        dm->playerPressedStart = TRUE;

        gCurTask->main = Task_DemoManagerFadeout;

        gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        gBldRegs.bldY = 0;

        gMusicManagerState.unk0 = 0xFF;
#if (GAME == GAME_SA1)
        m4aMPlayFadeOut(&gMPlayInfo_BGM, 4);
        m4aMPlayFadeOut(&gMPlayInfo_SE1, 4);
        m4aMPlayFadeOut(&gMPlayInfo_SE2, 4);
        m4aMPlayFadeOut(&gMPlayInfo_SE3, 4);
#elif (GAME == GAME_SA2)
        CreateMusicFadeoutTask(64);
#endif
    } else if (gCheckpointTime > (u32)DEMO_PLAYBACK_TIME) {
        dm->playerPressedStart = FALSE;

        gCurTask->main = Task_DemoManagerFadeout;

        gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        gBldRegs.bldY = 0;

        gMusicManagerState.unk0 = 0xFF;
#if (GAME == GAME_SA1)
        m4aMPlayFadeOut(&gMPlayInfo_BGM, 4);
        m4aMPlayFadeOut(&gMPlayInfo_SE1, 4);
        m4aMPlayFadeOut(&gMPlayInfo_SE2, 4);
        m4aMPlayFadeOut(&gMPlayInfo_SE3, 4);
#elif (GAME == GAME_SA2)
        CreateMusicFadeoutTask(64);
#endif
    }

#if (GAME == GAME_SA2)
    if (!(gStageFlags & STAGE_FLAG__100))
#endif
    {
        Sprite *s = &dm->textPressStart;

#if (GAME == GAME_SA1)
        if (gCheckpointTime & 0x20)
#elif (GAME == GAME_SA2)
        if (gStageTime & 0x20)
#endif
        {
            if (gBldRegs.bldY != 0) {
                s->frameFlags |= SPRITE_FLAG(OBJ_MODE, ST_OAM_OBJ_BLEND);
            } else {
                s->frameFlags &= ~SPRITE_FLAG_MASK_OBJ_MODE;
            }

#if (GAME == GAME_SA2)
            UpdateSpriteAnimation(s);
#endif
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

#if (GAME == GAME_SA2)
    m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 0);
    m4aMPlayVolumeControl(&gMPlayInfo_SE1, 0xFFFF, 0);
    m4aMPlayVolumeControl(&gMPlayInfo_SE2, 0xFFFF, 0);
    m4aMPlayVolumeControl(&gMPlayInfo_SE3, 0xFFFF, 0);
#endif

    if (dm->tFadeout >= 48) {
        LOADED_SAVE->timeLimitDisabled = dm->timeLimitDisabled;
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        SA2_LABEL(gUnknown_03005390) = 0;
        PAUSE_GRAPHICS_QUEUE();

#if (GAME == GAME_SA1)
        if (!dm->playerPressedStart) {
            CreateSegaLogo();
        } else {
            CreateTitleScreen(TITLESCREEN_PARAM__PLAY_MUSIC);
        }
#elif (GAME == GAME_SA2)
        if (!dm->playerPressedStart) {
            CreateTitleScreen();
        } else {
            CreateTitleScreenAtPlayModeMenu();
        }
#endif
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

    gDestroySpotlights = 0;
    gStageFlags &= ~STAGE_FLAG__DEMO_RUNNING;
}

#if (GAME == GAME_SA2)
void CreateMusicFadeoutTask(u16 factor)
{
    struct Task *t = TaskCreate(Task_DemoManagerMusicFadeout, sizeof(DemoMusicFadeout), 0xFFFE, 0, NULL);
    DemoMusicFadeout *mf = TASK_DATA(t);
    mf->volume = 0x100;
    mf->unk2 = (s32)mf->volume / factor;
    gMusicManagerState.unk0 = 0xFF;
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
#endif
