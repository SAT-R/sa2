#include "global.h"
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

const VoidFn sBossCreationFuncs[] = {
    CreateEggHammerTankII, CreateEggBomberTank, CreateEggTotem,
    CreateAeroEgg,         CreateEggSaucer,     CreateEggGoRound,
    CreateEggFrog,         CreateSuperEggRoboZ, CreateTrueArea53Boss,
};

const UnknownBossFunc gUnknown_080D79B0[] = {
    sub_803C80C, sub_803E3EC, sub_803FA84, sub_80425F0,
    sub_8043FD0, sub_8047224, sub_8048EB4, sub_804D594,
};