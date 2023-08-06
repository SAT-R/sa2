#include "global.h"
#include "core.h"
#include "flags.h"
#include "game/game.h"

#include "constants/tilemaps.h"

extern const Background gUnknown_080D5864[4];

void StageInit_Zone6_Boss(void);

void StageInit_Zone6_Acts(void)
{
    gDispCnt |= DISPCNT_BG0_ON;
    gBgCntRegs[0] = 0x1a0f;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 32;
    DmaFill32(3, 0, BG_SCREEN_ADDR(24), 64);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
    gUnknown_03005590 = 0x380;

    if (IS_MULTI_PLAYER) {
        StageInit_Zone6_Boss();
    }
    gBgCntRegs[3] &= ~(1 | 2);
    gBgCntRegs[3] |= 2;
}

void StageInit_Zone6_Boss(void)
{
    Background *background = &gUnknown_03005850.unk0;
    gDispCnt |= DISPCNT_BG0_ON;
    gBgCntRegs[0] = 0x1a0f;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xff;
    gUnknown_03002280[0][3] = 32;
    DmaFill32(3, 0, BG_SCREEN_ADDR(24), 64);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    *background = gUnknown_080D5864[3];
    background->tilemapId = TM_TECHNO_BASE_BG_CIRCUIT_MASK;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->tilesVram = (void *)BG_SCREEN_ADDR(26);
    background->unk26 = 0x20;
    background->unk28 = 0x20;

    sub_8002A3C(background);
}
