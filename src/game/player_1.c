#include "global.h"
#include "gba/io_reg.h"
#include "lib/m4a.h"
#include "sakit/globals.h"
#include "sakit/music_manager.h"
#include "sakit/player.h"
#include "game/item_tasks.h"

#include "constants/songs.h"

#if 0
// https://decomp.me/scratch/U9MyE
void sub_8023708(Player *p)
{
    u16 speed = p->speedAirY;
    if (speed >= (u16)Q_8_8(189)) {
        s16 airX  = p->speedAirX;
        s16 airX2 = (p->speedAirX >> 6);
        s16 diff;

		if (airX2 < 0) {
            diff = (airX - airX2);
            if (diff <= 0) {
                p->speedAirX = diff;
            } else {
                p->speedAirX = 0;
            }
		} else if(airX2 > 0) {
            diff = (airX - airX2);
            
			// _08023730
            if (diff < 0) {
                p->speedAirX = 0;
            } else {
                p->speedAirX = diff;
            }
		}
	}
}
#endif

// Unused?
void sub_8023748(Player *p)
{
    if (p->itemEffect == PLAYER_ITEM_EFFECT__NONE)
        return;

    if ((p->itemEffect & PLAYER_ITEM_EFFECT__SPEED_UP) && (--p->timerSpeedup == 0)) {
        m4aMPlayTempoControl(&gMPlayInfo_BGM, 0x100);
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__SPEED_UP;
    }

    if ((p->itemEffect & PLAYER_ITEM_EFFECT__10) && (--p->timerSpeedup == 0)) {
        m4aMPlayTempoControl(&gMPlayInfo_BGM, 0x100);
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__10;
    }
    // _080237AA

    if ((p->itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)
        && (--p->timerInvincibility == 0)) {
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__INVINCIBILITY;

        if (p->itemEffect & PLAYER_ITEM_EFFECT__SHIELD_NORMAL) {
            CreateItemTask_Shield_Normal(gPlayer.unk60);
        } else if (p->itemEffect & PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC) {
            CreateItemTask_Shield_Magnetic(gPlayer.unk60);
        }

        // TODO: This could be a macro: IS_ACTICE_SONG(id)
        if (gMPlayTable[0].info->songHeader == gSongTable[MUS_INVINCIBILITY].header) {
            m4aSongNumStartOrContinue(gLevelSongs[gCurrentLevel]);
        }
    }

    if ((p->itemEffect & PLAYER_ITEM_EFFECT__20) && (--p->unk34 == 0)) {
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__20;
        gDispCnt &= ~DISPCNT_OBJWIN_ON;
        gWinRegs[WINREG_WINOUT] = WIN_RANGE(0, 63);
    }
}