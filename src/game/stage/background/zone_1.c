#include <string.h> // memcpy

#include "global.h"
#include "core.h"
#include "flags.h"
#include "sprite.h"
#include "trig.h"

#include "sakit/globals.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/tilemaps.h"
#include "constants/zones.h"

extern const Background gStageCameraBgTemplates[4];

void CreateStageBg_Zone1(void)
{
    Background *background = &gStageBackgroundsRam.unk0;
    gDispCnt |= 0x100;
    gBgCntRegs[0] = 0x1B0F;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        const Background *templates = gStageCameraBgTemplates;
        memcpy(background, &templates[3], 0x40);

        background->tilemapId = TM_STAGE_1_BG_0_COPY;
        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->layoutVram = (void *)BG_SCREEN_ADDR(27);

        background->targetTilesX = 0x20;
        background->targetTilesY = 0x20;
    } else {
        const Background *templates = gStageCameraBgTemplates;
        memcpy(background, &templates[3], 0x40);
        background->tilemapId = TM_LEVEL_BG(LEVEL_INDEX(ZONE_1, ACT_1));

        background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
        background->layoutVram = (void *)BG_SCREEN_ADDR(27);

        background->targetTilesX = 0x20;
        background->targetTilesY = 0x1E;
    }

    DrawBackground(background);
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
}

void StageBgUpdate_Zone1Acts12(s32 UNUSED a, s32 UNUSED b)
{

    s32 i;
    s32 initial1, initial2;
    s16 camY;
    u16 bgScroll;
    u16 *cursor;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if ((gPlayer.moveState & MOVESTATE_8000000) && gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
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
        gFlags |= 4;
        gUnknown_03002878 = (void *)REG_ADDR_BG3HOFS;
        gUnknown_03002A80 = 4;
        cursor = gBgOffsetsHBlank;
        initial1 = 0;

        if ((gPlayer.moveState & MOVESTATE_8000000) && gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT) {
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
