#include "global.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "game/game.h"
#include "game/bosses/common.h"
#include "game/bosses/boss_1.h"
#include "game/bosses/boss_2.h"
#include "game/bosses/boss_3.h"
#include "game/bosses/boss_4.h"
#include "game/bosses/boss_5.h"
#include "game/bosses/boss_6.h"
#include "game/bosses/boss_7.h"
#include "game/bosses/boss_8.h"
#include "game/bosses/boss_9.h"
#include "game/playerfn_cmds.h"
#include "game/player_callbacks_1.h"

#include "constants/animations.h"
#include "constants/zones.h"

const VoidFn sBossCreationFuncs[] = {
    CreateEggHammerTankII, CreateEggBomberTank, CreateEggTotem,
    CreateAeroEgg,         CreateEggSaucer,     CreateEggGoRound,
    CreateEggFrog,         CreateSuperEggRoboZ, CreateTrueArea53Boss,
};

// Move position functions (translate(x, y))
const TranslateBossFunction gUnknown_080D79B0[] = {
    sub_803C80C,   sub_803E3EC, sub_803FA84, sub_80425F0,
    EggSaucerMove, sub_8047224, sub_8048EB4, sub_804D594,
};

const u32 gUnknown_080D79D0[][3] = {
    { 412, 620, 0 }, { 416, 620, 1 }, { 420, 621, 0 },
    { 436, 621, 1 }, { 448, 622, 0 }, { 449, 622, 1 },
};

void CreateZoneBoss(u8 boss)
{
    if (boss < ARRAY_COUNT(sBossCreationFuncs)) {
        gUnknown_03005424 &= ~(EXTRA_STATE__DISABLE_PAUSE_MENU | EXTRA_STATE__ACT_START);
        sBossCreationFuncs[boss]();
    }
}

void sub_8039ED4(void)
{
    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        gPlayer.moveState &= ~MOVESTATE_8000000;
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        PLAYERFN_SET(PlayerCB_8025318);
        gPlayer.unk6D = 0;
    }
}

void sub_8039F14(s32 p0, s32 p1)
{
    if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE))
        && (gActiveBossTask != NULL)) {
        gUnknown_080D79B0[LEVEL_TO_ZONE(gCurrentLevel)](p0, p1);
    }
}

void sub_8039F50(s32 p0, u8 p1)
{
    if ((p1 < ZONE_FINAL) && (gActiveBossTask != NULL)) {
        gUnknown_080D79B0[p1](p0, 0);
    }
}

void Task_DestroyBossParts(void)
{
    Sprite_ExplosionParts *parts = TaskGetStructPtr(gCurTask);
    (*parts->numCreatedParts)--;
    TaskDestroy(gCurTask);
}