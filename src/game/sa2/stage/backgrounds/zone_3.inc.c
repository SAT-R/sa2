#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"

#include "constants/sa2/tilemaps.h"
#include "constants/zones.h"
#include "constants/sa2/move_states.h"

static s16 sUnknown_03000408;

// TODO: make this static!
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

// defined here but used in hblank_callbacks
// NOTE: Only values > 105 appear to be used.
const u8 gUnknown_080D5B50[DISPLAY_HEIGHT] = { // 0-94
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
    10, 10, 8, 8, 8, 8, // 95-98
    7, 7, 7, 7, // 99-102
    6, 6, 6, // 103-104
    /* 105-159 */
    6, 6, //
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

void CreateStageBg_Zone3(void)
{
    Background *background = &gStageBackgroundsRam.unk0;
    gDispCnt |= DISPCNT_BG0_ON;
    gBgCntRegs[0] = BGCNT_SCREENBASE(27) | BGCNT_CHARBASE(3) | BGCNT_PRIORITY(3);

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
NONMATCH("asm/non_matching/game/sa2/stage/background/StageBgUpdate_Zone3Acts12.inc",
         void StageBgUpdate_Zone3Acts12(s32 cameraX, s32 cameraY))
#else
void StageBgUpdate_Zone3Acts12(s32 cameraX, s32 cameraY)
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
    register u16 *bgBuffer asm("r5") = gBgOffsetsHBlankPrimary;
    register s16 camFracY asm("r3") = (Div(cameraY, 60) << 16) >> 16;
#else
    s16 sl = 0;
    u16 *bgBuffer = gBgOffsetsHBlankPrimary;
    s16 camFracY = Div(cameraY, 60);
#endif

    // Prevent wrapping of the background map at the bottom of the screen on high cameraY's
#if WIDESCREEN_HACK
    if (camFracY > 256 - DISPLAY_HEIGHT) {
        camFracY = 256 - DISPLAY_HEIGHT;
    }
#endif

    gBgScrollRegs[0][1] = camFracY;
    gBgScrollRegs[3][1] = camFracY;

    if (IS_SINGLE_PLAYER) {
        if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
            if (sUnknown_03000408 == 0) {
                sUnknown_03000408 = cameraX;
            }
            sUnknown_03000408 += I(gPlayer.qSpeedGround);
            cameraX = sUnknown_03000408;
        } else {
            sUnknown_03000408 = 0;
        }
        // _0801CC72
        i = 0;

        {
            s32 r6 = camFracY;
            cursor = (u8 *)gUnknown_080D5B20;
            sp40 = camFracY;

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
            sp[i].x = (((gUnknown_080D5B20[i][1] * cameraX) >> 5) & 0xFF);
            sp[i].y = (((gUnknown_080D5B20[i][2] * cameraX) >> 5) & 0xFF);
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
