#include "global.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/player.h"
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

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/zones.h"

struct Task *gActiveBossTask = NULL;

const VoidFn sBossCreationFuncs[] = {
    CreateEggHammerTankII, CreateEggBomberTank, CreateEggTotem,      CreateAeroEgg,        CreateEggSaucer,
    CreateEggGoRound,      CreateEggFrog,       CreateSuperEggRoboZ, CreateTrueArea53Boss,
};

// NOTE:
// "Super Egg Robo Z" does not having a 'Move' function, because it's static.
const TranslateBossFunction MoveBossPositionFuncs[] = {
    EggHammerTankIIMove, EggBomberTankMove, EggTotemMove, AeroEggMove, EggSaucerMove, EggGoRoundMove, EggFrogMove, TrueArea53BossMove,
};

// Anims for screws etc.
const u32 gTileInfoBossScrews[][3] = {
    { 412, 620, 0 }, { 416, 620, 1 }, { 420, 621, 0 }, { 436, 621, 1 }, { 448, 622, 0 }, { 449, 622, 1 },
};

void CreateZoneBoss(u8 boss)
{
    if (boss < ARRAY_COUNT(sBossCreationFuncs)) {
        gStageFlags &= ~(STAGE_FLAG__DISABLE_PAUSE_MENU | STAGE_FLAG__ACT_START);
        sBossCreationFuncs[boss]();
    }
}

void sub_8039ED4(void)
{
    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        gPlayer.moveState &= ~MOVESTATE_GOAL_REACHED;
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        PLAYERFN_SET(Player_TouchGround);
        gPlayer.transition = PLTRANS_NONE;
    }
}

// Moves the bosses' position back when close to the end of the map.
void sub_8039F14(s32 p0, s32 p1)
{
    if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) && (gActiveBossTask != NULL)) {
        MoveBossPositionFuncs[LEVEL_TO_ZONE(gCurrentLevel)](p0, p1);
    }
}

void sub_8039F50(s32 p0, u8 p1)
{
    if ((p1 < ZONE_FINAL) && (gActiveBossTask != NULL)) {
        MoveBossPositionFuncs[p1](p0, 0);
    }
}

void Task_DestroyBossParts(void)
{
    Sprite_ExplosionParts *parts = TASK_DATA(gCurTask);
    (*parts->numCreatedParts)--;
    TaskDestroy(gCurTask);
}