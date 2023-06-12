#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "game/save.h"
#include "game/title_screen.h"
#include "lib/m4a.h"
#include "game/stage/demo_manager.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ Sprite textPressStart;
    /* 0x30 */ Sprite textDemoPlay;
    /* 0x60 */ u16 unk60;
    /* 0x62 */ u16 unk62;
    /* 0x64 */ bool8 playerPressedStart;
    /* 0x65 */ bool8 timeLimitDisabled;
} DemoManager;

typedef struct {
    /* 0x00 */ u16 volume;
    /* 0x02 */ u16 unk2;
} DemoMusicFadeout;

void Task_800A110(void);
void Task_800A310(void);
void CreateMusicFadeoutTask(u16);
void TaskDestructor_800A350(struct Task *);
void Task_800A3D4(void);

void CreateDemoManager(void)
{
    u8 blendCtrl = gBldRegs.bldCnt & 0xC0;
    s8 lang = gLoadedSaveGame->language;
    struct Task *t
        = TaskCreate(Task_800A110, sizeof(DemoManager), 1, 0, TaskDestructor_800A350);
    DemoManager *dm = TaskGetStructPtr(t);
    Sprite *s;

    dm->unk60 = 0;
    dm->unk62 = 0;
    dm->playerPressedStart = FALSE;
    dm->timeLimitDisabled = gLoadedSaveGame->timeLimitDisabled;

    gUnknown_03005424 |= EXTRA_STATE__DEMO_RUNNING;

    s = &dm->textPressStart;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 2) + 33;

    s->graphics.dest = VramMalloc(gPressStartTiles[lang].numTiles);
    s->graphics.size = 0;
    s->graphics.anim = gPressStartTiles[lang].anim;
    s->variant = gPressStartTiles[lang].variant;

    s->unk14 = 0;
    s->unk21 = 0xFF;
    s->unk1C = 0;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk1A = 0x40;
    s->unk10 = 0;

    if (blendCtrl != BLDCNT_EFFECT_BLEND) {
        s->unk10 = SPRITE_FLAG(OBJ_MODE, ST_OAM_OBJ_BLEND);
    }
    sub_8004558(s);

    s = &dm->textDemoPlay;
    s->x = (DISPLAY_WIDTH / 2);
    s->y = (DISPLAY_HEIGHT / 2);

    s->graphics.dest = VramMalloc(28);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_DEMO_PLAY;
    s->variant = 0;

    s->unk14 = 0;
    s->unk21 = 0xFF;
    s->unk1C = 0;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk1A = 0x40;
    s->unk10 = 0;

    if (blendCtrl != BLDCNT_EFFECT_BLEND) {
        s->unk10 = SPRITE_FLAG(OBJ_MODE, ST_OAM_OBJ_BLEND);
    }
    sub_8004558(s);
}

void Task_800A110(void)
{
    DemoManager *dm = TaskGetStructPtr(gCurTask);

    if (gPhysicalInput & START_BUTTON) {
        gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
        gPlayer.unk5C = 0;

        gUnknown_030054E4 = 1;

        dm->playerPressedStart = TRUE;

        gCurTask->main = Task_800A310;

        gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        gBldRegs.bldY = 0;

        gUnknown_030054A8.unk0 = 0xFF;
        CreateMusicFadeoutTask(64);
    } else if (gCheckpointTime > (u32)ZONE_TIME_TO_INT(0, 24.5)) {
        dm->playerPressedStart = FALSE;

        gCurTask->main = Task_800A310;

        gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        gBldRegs.bldY = 0;

        gUnknown_030054A8.unk0 = 0xFF;
        CreateMusicFadeoutTask(64);
    }

    if (!(gUnknown_03005424 & EXTRA_STATE__100)) {
        Sprite *s = &dm->textPressStart;

        if (gUnknown_03005590 & 0x20) {
            if (gBldRegs.bldY != 0) {
                s->unk10 |= SPRITE_FLAG(OBJ_MODE, ST_OAM_OBJ_BLEND);
            } else {
                s->unk10 &= ~SPRITE_FLAG_MASK_OBJ_MODE;
            }

            sub_8004558(s);
            sub_80051E8(s);
        }

        if (gBldRegs.bldY != 0) {
            dm->textDemoPlay.unk10 |= SPRITE_FLAG(OBJ_MODE, ST_OAM_OBJ_BLEND);
        } else {
            dm->textDemoPlay.unk10 &= ~SPRITE_FLAG_MASK_OBJ_MODE;
        }

        sub_80051E8(&dm->textDemoPlay);
    }
}

void Task_800A24C(void)
{
    DemoManager *dm = TaskGetStructPtr(gCurTask);
    dm->unk62++;

    m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, 0);
    m4aMPlayVolumeControl(&gMPlayInfo_SE1, 0xFFFF, 0);
    m4aMPlayVolumeControl(&gMPlayInfo_SE2, 0xFFFF, 0);
    m4aMPlayVolumeControl(&gMPlayInfo_SE3, 0xFFFF, 0);

    if (dm->unk62 >= 0x30) {
        gLoadedSaveGame->timeLimitDisabled = dm->timeLimitDisabled;
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;

        if (!dm->playerPressedStart) {
            CreateTitleScreen();
        } else {
            CreateTitleScreenAtPlayModeMenu();
        }
    }
}

void Task_800A310(void)
{
    DemoManager *dm = TaskGetStructPtr(gCurTask);
    dm->unk60 += Q_24_8(0.25);

    gBldRegs.bldY = dm->unk60 >> 8;

    if (dm->unk60 >= Q_24_8(16.0)) {
        gCurTask->main = Task_800A24C;
    }
}

void TaskDestructor_800A350(struct Task *t)
{
    DemoManager *dm = TaskGetStructPtr(t);
    VramFree(dm->textPressStart.graphics.dest);
    VramFree(dm->textDemoPlay.graphics.dest);

    gUnknown_030054E4 = 0;
    gUnknown_03005424 &= ~EXTRA_STATE__DEMO_RUNNING;
}

void CreateMusicFadeoutTask(u16 factor)
{
    struct Task *t = TaskCreate(Task_800A3D4, sizeof(DemoMusicFadeout), 0xFFFE, 0, NULL);
    DemoMusicFadeout *mf = TaskGetStructPtr(t);
    mf->volume = 0x100;
    mf->unk2 = (s32)mf->volume / factor;
    gUnknown_030054A8.unk0 = 0xFF;
}

void Task_800A3D4(void)
{
    DemoMusicFadeout *mf = TaskGetStructPtr(gCurTask);

    m4aMPlayVolumeControl(&gMPlayInfo_BGM, 0xFFFF, mf->volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE1, 0xFFFF, mf->volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE2, 0xFFFF, mf->volume);
    m4aMPlayVolumeControl(&gMPlayInfo_SE3, 0xFFFF, mf->volume);

    mf->volume -= mf->unk2;
    if ((s16)mf->volume < 0) {
        mf->volume = 0;
    }
}