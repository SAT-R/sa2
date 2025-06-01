#include "global.h"
#include "core.h"
#include "flags.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/camera.h"
#include "game/stage/background/callbacks.h"
#include "game/stage/player.h"

#include "constants/tilemaps.h"

// TODO: make this static!
extern const u8 gUnknown_080D5B20[16][3];

const u8 gUnknown_080D5B20[16][3] = {
    { 14, 0, 1 }, //
    { 22, 0, 3 }, //
    { 30, 0, 2 }, //
    { 38, 0, 1 }, //
    { 46, 0, 3 }, //
    { 62, 0, 1 }, //
    { 70, 0, 2 }, //
    { 86, 0, 1 }, //
    { 94, 0, 2 }, //
    { 126, 0, 1 }, //
    { 168, 1, 1 }, //
    { 174, 1, 2 }, //
    { 182, 2, 3 }, //
    { 198, 3, 4 }, //
    { 222, 4, 5 }, //
    { 255, 5, 6 }, //
};

// TODO: This data is unused in this module
//       But the place that references this is
//       further down in code than the .rodata after this.
const u8 gUnknown_080D5B50[DISPLAY_HEIGHT] = {
    // 0-105
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 10, //
    10, 10, 8, //
    8, 8, 8, //
    7, 7, 7, //
    7, 6, 6, //

    // 106-159 | This data appears to be unused
    6, 6, 6, //
    6, 6, 6, //
    5, 5, 5, //
    5, 5, 5, //
    5, 5, 4, //
    4, 4, 4, //
    4, 4, 4, //
    4, 3, 3, //
    3, 3, 3, //
    3, 3, 3, //
    3, 3, 3, //
    3, 3, 3, //
    3, 3, 2, //
    2, 2, 2, //
    2, 2, 2, //
    2, 2, 2, //
    2, 2, 2, //
    2, 2, 2, //

    // Maybe padding?
    0
};

static s16 sUnknown_03000408 = 0;

void CreateStageBg_Zone3(void)
{
    Background *background = &gStageBackgroundsRam.unk0;
    gDispCnt |= 0x100;
    gBgCntRegs[0] = 0x1B0F;

    *background = gStageCameraBgTemplates[3];

    background->tilemapId = TM_MUSIC_PLANT_MOVING_STARS;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->layoutVram = (void *)BG_SCREEN_ADDR(27);
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    DrawBackground(background);

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[3][0] = 0;
    gBgScrollRegs[3][1] = 0;
}

// (85.02%) https://decomp.me/scratch/Esyzr
#if 01
NONMATCH("asm/non_matching/game/stage/background/StageBgUpdate_Zone3Acts12.inc", void StageBgUpdate_Zone3Acts12(s32 a, s32 b))
#else
void StageBgUpdate_Zone3Acts12(s32 a, s32 b)
#endif
{
    s16 r6;
    u8 i;
    u8 sp40;
    Vec2_16 sp[16];
    Vec2_16 *cursorStack;
    u8 *cursor;
    s32 pFlags;
#ifndef NON_MATCHING
    register s16 sl asm("sl") = 0;
    register u16 *bgBuffer asm("r5") = gBgOffsetsHBlank;
    register s16 r3 asm("r3") = (Div(b, 60) << 16) >> 16;
#else
    s16 sl = 0;
    u16 *bgBuffer = gBgOffsetsHBlank;
    s16 r3 = (Div(b, 60) << 16) >> 16;
#endif

    gBgScrollRegs[0][1] = r3;
    gBgScrollRegs[3][1] = r3;

    if (IS_SINGLE_PLAYER) {
        if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
            if (sUnknown_03000408 == 0) {
                sUnknown_03000408 = a;
            }
            sUnknown_03000408 += I(gPlayer.qSpeedGround);
            a = sUnknown_03000408;
        } else {
            sUnknown_03000408 = 0;
        }
        // _0801CC72
        i = 0;

        {
            s32 r6 = r3;
            cursor = (u8 *)gUnknown_080D5B20;
            sp40 = r3;

            while (r6 >= cursor[i * 3]) {
                if (++i >= ARRAY_COUNT(gUnknown_080D5B20)) {
                    break;
                }
                {
                    sl = i;
                }
            }
        }
        //_0801CCA8:

        for (i = 0; i < ARRAY_COUNT(gUnknown_080D5B20); i++) {
            sp[i].x = (((gUnknown_080D5B20[i][1] * a) >> 5) & 0xFF);
            sp[i].y = (((gUnknown_080D5B20[i][2] * a) >> 5) & 0xFF);
        }
        // __0801CCF0

        cursorStack = &sp[sl];
        cursor = (u8 *)gUnknown_080D5B20[sl];
        for (i = 0; (u8)i < DISPLAY_HEIGHT - 1; sp40++, i++) {
            *bgBuffer = cursorStack->y;
            bgBuffer++;

            *bgBuffer = cursorStack->x;
            bgBuffer++;

            if (sp40 >= *cursor) {
                cursor += 3;
                cursorStack++;
            }
        }

        // __0801CD2C
        gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCB_801E454;
        gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
    }
}
#if 01
END_NONMATCH
#endif
