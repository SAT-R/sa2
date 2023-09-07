#include "global.h"
#include "core.h"
#include "game/game.h"
#include "game/stage/background/zone_3.h"

// Unused
void sub_801E3F0(void)
{
    struct Camera *cam = &gCamera;
    if (gStageTime & 0x1) {
        u16 rand = (PseudoRandom32() & 0x70000) >> 16;
        cam->shiftY = rand - 8;
    }
}

void HBlankCB_801E434(int_vcount vcount)
{
    if (vcount == 73) {
        REG_BG3HOFS = gStageTime >> 4;
    }
}

void HBlankCB_801E454(int_vcount vcount)
{
    if (vcount != 0) {
        u16 *p = &gUnknown_030022AC[vcount * 2], *q;
        q = p - 1;

        if (p[1] != *q) {
            REG_BG3HOFS = p[1];
        }

        q = p - 2;
        if (p[0] != q[0]) {
            REG_BG0HOFS = p[0];
        }
    }
}

void nullsub_801E494(void) { }

void HBlankCB_BgUpdateZone5ActBoss(int_vcount vcount)
{
    if (vcount > 105) {
        REG_BG3HOFS = gCourseTime >> (gUnknown_080D5B50[vcount] - 1);
    }
}

void HBlankCB_BgUpdateZoneFinalActXX(int_vcount vcount)
{
    if (vcount == 88) {
        REG_BG3HOFS = (u8)gStageTime;
    }
}
