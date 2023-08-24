#include "global.h"
#include "core.h"
#include "flags.h"
#include "game/game.h"
#include "game/stage/spot_light.h"

#include "constants/tilemaps.h"

extern const Background gUnknown_080D5864[4];

void StageInit_Zone4(void)
{
    Background *background = &gUnknown_03005850.unk0;
    const Background *templates;
    gBgCntRegs[0] = 0x1B0F;

    *background = gUnknown_080D5864[3];

    background->tilemapId = TM_SPOTLIGHT_SNOW;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->tilesVram = (void *)BG_SCREEN_ADDR(27);
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->flags = BACKGROUND_UPDATE_PALETTE | BACKGROUND_FLAGS_BG_ID(3);
    sub_8002A3C(background);

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;

    if (IS_SINGLE_PLAYER) {
        CreateSpotLightBeams();
    }
}

struct UNK_801CDF0 {
    u8 unk0[0x40A];
    s16 unk40A;
};

void StageBgUpdateZone4Acts12(s32 a, s32 b)
{
    Player *player = &gPlayer;

    if ((player->moveState & MOVESTATE_8000000) && gUnknown_030054F4 > 6) {
        struct UNK_801CDF0 *unkDF0 = (void *)IWRAM_START;
        if (unkDF0->unk40A == 0) {
            unkDF0->unk40A = a;
        }
        unkDF0->unk40A += player->speedGroundX >> 8;
        a = unkDF0->unk40A;
    } else {
        struct UNK_801CDF0 *unkDF0 = (void *)IWRAM_START;
        unkDF0->unk40A = 0;
    }

    if (IS_SINGLE_PLAYER && !(gUnknown_03005424 & 0x100)) {
        gWinRegs[5] = 0x3e;
        gWinRegs[4] = 0x3f3f;
        gWinRegs[0] = 0xf0;
        gWinRegs[2] = 0xa0;
        gWinRegs[1] = 0xf0;
        gWinRegs[3] = 0xa0;
        gBldRegs.bldY = 7;
        gBldRegs.bldCnt = 0x3f41;
        gBldRegs.bldAlpha = 0xc0c;
    }

    sub_8002A3C(&gUnknown_03005850.unk0);
    UpdateBgAnimationTiles(&gUnknown_03005850.unk0);

    if (!(gUnknown_03005590 & 0xF)) {
        gBgScrollRegs[0][0] = (gBgScrollRegs[0][0] - 1) & 0xff;
        gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xff;
    }
    gBgScrollRegs[3][0] = a >> 4;
    gBgScrollRegs[3][1] = b >> 6;
}
