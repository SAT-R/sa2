#include <string.h>
#include "global.h"
#include "core.h"
#include "game/game.h"
#include "game/stage/camera.h"

#include "constants/tilemaps.h"

const s16 gUnknown_080D5C62[8][2] = {
    { -Q_8_8(3.00), -Q_8_8(0.25) }, //
    { -Q_8_8(1.50), +Q_8_8(0.00) }, //

    { -Q_8_8(3.00), -Q_8_8(0.25) }, //
    { -Q_8_8(1.00), -Q_8_8(0.0859375) }, //

    { -Q_8_8(3.00), -Q_8_8(0.25) }, //
    { -Q_8_8(1.50), +Q_8_8(0.00) }, //

    { -Q_8_8(3.00), -Q_8_8(0.25) }, //
    { -Q_8_8(0.75), -Q_8_8(0.125) }, //

};

const u16 gUnknown_080D5C82[16] = INCBIN_U16("graphics/080D5C82.gbapal");

void CreateStageBg_Zone7(void)
{
    Background *bg = &gUnknown_03005850.unk0;
    const Background *src;
    gDispCnt = DISPCNT_OBJ_ON | DISPCNT_BG2_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_1D_MAP
        | DISPCNT_MODE_0;

    gBgCntRegs[0] = 0x160F;

    src = gUnknown_080D5864;
    memcpy(bg, &src[3], sizeof(Background));

    bg->tilemapId = TM_UNK_SPACE_BG;
    bg->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    bg->tilesVram = (void *)BG_SCREEN_ADDR(22);
    bg->unk26 = 32;
    bg->unk28 = 20;
    sub_8002A3C(bg);

    gBgCntRegs[3] &= ~BGCNT_PRIORITY(3);
    gBgCntRegs[3] |= BGCNT_PRIORITY(3);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
}