#include "global.h"
#include "core.h"
#include "flags.h"
#include "game/game.h"

#include "constants/tilemaps.h"

extern const Background gStageCameraBgTemplates[4];

void CreateStageBg_Zone6_Boss(void);

const s16 gUnknown_080D5BF0[] = {
    Q_8_8(0.00),  Q_8_8(0.25),  Q_8_8(2.25), Q_8_8(2.50), Q_8_8(3.50),
    Q_8_8(3.625), Q_8_8(5.625), Q_8_8(5.75), Q_8_8(6.75),
};

const u8 gUnknown_080D5C02[] = {
    0x1F, 0x00, 0x1F, //
    0x01, 0x07, 0x14, //
    0x01, 0x09, 0x14, //
    0x00, 0x0A, 0x13, //
    0x00, 0x0C, 0x13, //
    0x00, 0x0D, 0x12, //
    0x00, 0x0F, 0x12, //
    0x00, 0x10, 0x11, //
    0x00, 0x12, 0x10, //
    0x00, 0x13, 0x10, //
    0x00, 0x15, 0x0F, //
    0x00, 0x16, 0x0F, //
    0x00, 0x18, 0x0E, //
    0x00, 0x19, 0x0E, //
    0x00, 0x1B, 0x0D, //
    0x1F, 0x07, 0x00, //
    0x1F, 0x00, 0x00, //
    0x0F, 0x00, 0x1B, //
    0x0E, 0x00, 0x19, //
    0x0D, 0x01, 0x17, //
    0x0C, 0x01, 0x15, //
    0x0B, 0x02, 0x13, //
    0x0A, 0x02, 0x11, //
    0x08, 0x03, 0x0F, //
    0x07, 0x03, 0x0D, //
    0x06, 0x04, 0x0B, //
    0x05, 0x04, 0x09, //
    0x04, 0x05, 0x07, //
    0x03, 0x05, 0x05, //
    0x02, 0x06, 0x03, //
    0x01, 0x06, 0x01, //
    0x00, 0x07, 0x00, //
};

void CreateStageBg_Zone6_Acts(void)
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
    gStageTime = 0x380;

    if (IS_MULTI_PLAYER) {
        CreateStageBg_Zone6_Boss();
    }
    gBgCntRegs[3] &= ~(1 | 2);
    gBgCntRegs[3] |= 2;
}

void CreateStageBg_Zone6_Boss(void)
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

    *background = gStageCameraBgTemplates[3];
    background->tilemapId = TM_TECHNO_BASE_BG_CIRCUIT_MASK;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->layoutVram = (void *)BG_SCREEN_ADDR(26);
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;

    sub_8002A3C(background);
}
