#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/save.h"
#include "game/title_screen.h"
#include "sprite.h"
#include "task.h"

#include "constants/animations.h"

typedef struct {
    Sprite s;
    Sprite s2;
    u16 unk60;
    u16 unk62;
    u8 unk64;
    u8 unk65;
} DemoManager;

void Task_800A110(void);
void Task_800A310(void);
void CreateMusicFadeoutTask(u16);
void TaskDestructor_800A350(struct Task *);

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
    dm->unk64 = 0;
    dm->unk65 = gLoadedSaveGame->timeLimitEnabled;

    gUnknown_03005424 |= EXTRA_STATE__DEMO_RUNNING;

    s = &dm->s;
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

    s = &dm->s2;
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

        dm->unk64 = 1;

        gCurTask->main = Task_800A310;

        gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        gBldRegs.bldY = 0;

        gUnknown_030054A8.unk0 = 0xFF;
        CreateMusicFadeoutTask(64);
    } else if (gCheckpointTime > (u32)ZONE_TIME_TO_INT(0, 24.5)) {
        dm->unk64 = 0;

        gCurTask->main = Task_800A310;

        gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        gBldRegs.bldY = 0;

        gUnknown_030054A8.unk0 = 0xFF;
        CreateMusicFadeoutTask(64);
    }
    // _0800A1B6

    if (!(gUnknown_03005424 & EXTRA_STATE__100)) {
        Sprite *s = &dm->s;

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
            dm->s2.unk10 |= SPRITE_FLAG(OBJ_MODE, ST_OAM_OBJ_BLEND);
        } else {
            dm->s2.unk10 &= ~SPRITE_FLAG_MASK_OBJ_MODE;
        }

        sub_80051E8(&dm->s2);
    }
}