#include "global.h"
#include "core.h"
#include "task.h"
#include "malloc_vram.h"
#include "gba/io_reg.h"
#include "sakit/globals.h"
#include "sakit/player.h"
#include "game/bosses/common.h"
#include "game/stage/screen_fade.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ s32 qUnk0;
    /* 0x04 */ s32 qUnk4;
    /* 0x08 */ u8 livesCockpit;
    /* 0x09 */ u8 livesArmLeft;
    /* 0x0A */ u8 livesArmRight;
    /* 0x0B */ u8 unkB;
    /* 0x0C */ u8 unkC;
    /* 0x0E */ u16 unkE;
    /* 0x10 */ u16 unk10;
    /* 0x14 */ u32 unk14;
    /* 0x18 */ u8 filler16[0x2C];
    /* 0x44 */ void *tilesUnk44;
    /* 0x48 */ ScreenFade fade;
    /* 0x54 */ u8 filler54[0xF4];
} SuperEggRoboZ; /* size: 0x148 */

void Task_SuperEggRoboZMain(void);
void TaskDestructor_SuperEggRoboZMain(struct Task *);

// TODO: Remove once boss_run.h has its own prototype for this function.
//       (or once it is integrated into this module, if it makes sense)
extern sub_8049D20(void *vramTiles, SuperEggRoboZ *boss);

#if 01
void CreateSuperEggRoboZ(void)
{
    struct Task *t;
    SuperEggRoboZ *boss;
    ScreenFade *fade;
    u8 r4;

    gBgCntRegs[0] = (BGCNT_TXT512x512 | BGCNT_SCREENBASE(20) | BGCNT_CHARBASE(3) | BGCNT_PRIORITY(2));
    gBgCntRegs[2] = (BGCNT_TXT256x256 | BGCNT_SCREENBASE(31) | BGCNT_CHARBASE(0) | BGCNT_PRIORITY(1));
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xFF;
    gUnknown_03002280[0][3] = 0x40;
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    sub_8039ED4();
    gPseudoRandom = gStageTime;
    gUnknown_03005AF0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    gUnknown_03005AF0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);
    gUnknown_03005AA0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    gUnknown_03005AA0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);

    t = TaskCreate(Task_SuperEggRoboZMain, sizeof(SuperEggRoboZ), 0x4000, 0, TaskDestructor_SuperEggRoboZMain);
    gActiveBossTask = t;
    boss = TASK_DATA(t);
    fade = &boss->fade;

    if(gDifficultyLevel != DIFFICULTY_NORMAL) {
        boss->livesCockpit = 6;
        boss->livesArmLeft = 4;
        boss->livesArmRight = 4;
    } else {
        boss->livesCockpit = 8;
        boss->livesArmLeft = 6;
        boss->livesArmRight = 6;
    }

    boss->qUnk0 = Q(42876);
    boss->qUnk4 = Q(370);
    boss->unkE = 360;
    boss->unk10 = 512;
    boss->unkB = 0;
    boss->unkC = 0;
    boss->unk14 = 30;
    boss->tilesUnk44 = VramMalloc(32);
    sub_8049D20(boss->tilesUnk44, boss);

    for(r4 = 0; r4 < 2; r4++) {
        // _0804A832

    }
}
#endif