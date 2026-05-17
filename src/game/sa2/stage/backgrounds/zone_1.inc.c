#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"

#include "constants/sa2/tilemaps.h"
#include "constants/zones.h"
#include "constants/sa2/move_states.h"

void CreateStageBg_Zone1(void)
{
    Background *background = &gStageBackgroundsRam.unk0;
    gDispCnt |= DISPCNT_BG0_ON;
    gBgCntRegs[0] = BGCNT_SCREENBASE(27) | BGCNT_CHARBASE(3) | BGCNT_PRIORITY(3);

#ifndef COLLECT_RINGS_ROM
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        const Background *templates = gStageCameraBgTemplates;
        memcpy(background, &templates[3], sizeof(Background));

        background->tilemapId = TM_STAGE_1_BG_0_COPY;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->layoutVram = (void *)BG_SCREEN_ADDR(27);

        background->targetTilesX = 256 / TILE_WIDTH;
        background->targetTilesY = 256 / TILE_WIDTH;
    } else
#endif
    {
        const Background *templates = gStageCameraBgTemplates;
        memcpy(background, &templates[3], sizeof(Background));
        background->tilemapId = TM_LEVEL_BG(LEVEL_INDEX(ZONE_1, ACT_1));

        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->layoutVram = (void *)BG_SCREEN_ADDR(27);

        background->targetTilesX = 256 / TILE_WIDTH;
        background->targetTilesY = 240 / TILE_WIDTH;
    }

    DrawBackground(background);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
}

#ifndef COLLECT_RINGS_ROM
void StageBgUpdate_Zone1Acts12(s32 UNUSED a, s32 UNUSED b)
{
    s32 i;
    s32 initial1, initial2;
    s16 camY;
    u16 bgScroll;
    u16 *cursor;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
            s32 temp, val;
            temp = (gPlayer.moveState & MOVESTATE_4000000) ? 7 : 0xF;

            val = gBgScrollRegs[0][0];
            if ((gStageTime & temp) == temp) {
                val++;
            }
            gBgScrollRegs[0][0] = val;
            gBgScrollRegs[0][0] &= 0xFF;
        } else {
            gBgScrollRegs[0][0] = gCamera.x >> 6;
            gBgScrollRegs[0][0] &= 0xFF;
        }

        gBgScrollRegs[0][1] = gCamera.y >> 9;
        gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
        gHBlankCopyTarget = (void *)REG_ADDR_BG3HOFS;
        gHBlankCopySize = 4;
        cursor = gBgOffsetsHBlankPrimary;
        initial1 = 0;

        if ((gPlayer.moveState & MOVESTATE_GOAL_REACHED) && gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
            s32 temp, val;
            temp = (gPlayer.moveState & MOVESTATE_4000000) ? 0xF : 0x1F;

            val = gBgScrollRegs[3][0];
            if ((gStageTime & temp) == temp) {
                val++;
            }
            gBgScrollRegs[3][0] = val;
            gBgScrollRegs[3][0] &= 0xFF;
            bgScroll = gBgScrollRegs[3][0];
        } else {
            bgScroll = gCamera.x >> 7;
            gBgScrollRegs[3][0] = bgScroll;
        }

        camY = gCamera.y >> 8;
        initial2 = 0;

#ifdef BUG_FIX
        if (cursor != NULL)
#endif
        {
            for (i = 71; i >= 0; i--) {
                *cursor++ = initial1;
                *cursor++ = initial2;
            }

            for (i = 86; i >= 0; i--) {
                *cursor++ = bgScroll;
                *cursor++ = camY;
            }
        }
    }
}
#endif
