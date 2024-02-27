#include "global.h"
#include "gba/io_reg.h"
#include "lib/m4a.h"
#include "sakit/globals.h"
#include "sakit/music_manager.h"
#include "sakit/player.h"
#include "game/item_tasks.h"

#include "constants/animations.h"
#include "constants/songs.h"

// TODO: Remvoe gotos
// https://decomp.me/scratch/TeU3L
void sub_8023610(Player *p)
{
    s32 r5 = p->unk48 * 2;
    s32 r6 = p->unk44;

    if ((p->unk64 != SA2_CHAR_ANIM_20) && !(p->moveState & MOVESTATE_10)) {
        s16 r0;
        u16 r2 = p->speedAirX;

        if (p->unk5C & DPAD_LEFT) {
            if ((p->unk64 != SA2_CHAR_ANIM_63) && !(p->moveState & MOVESTATE_2000)) {
                p->moveState |= MOVESTATE_FACING_LEFT;
            }

            r0 = r2;
            r2 = r0 - r5;
            r0 = r2;

            if (r0 >= -r6) {
                goto set;
            }

            r2 = r0 + r5;
            r0 = r2;

            if (r0 <= -r6) {
                goto set;
            }

            r2 = -r6;
            goto set;

        } else if (p->unk5C & DPAD_RIGHT) {
            // _0802367C + 0x8
            if ((p->unk64 != SA2_CHAR_ANIM_63) && !(p->moveState & MOVESTATE_2000)) {
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            }

            r0 = r2;
            r2 = r0 + r5;
            r0 = r2;

            if (r0 <= r6) {
                goto set;
            }

            r2 = r0 - r5;
            r0 = r2;

            if (r0 >= r6) {
                goto set;
            }

            r2 = r6;
        }

    set:
        p->speedAirX = r2;
    }
}

void sub_80236C8(Player *p)
{
    s16 airX;
    s16 airX2;
    s16 diff;

    if ((u16)p->speedAirY < (u16)Q_24_8(189))
        return;

    airX = p->speedAirX;
    airX2 = (airX >> 5);

    if (airX2 < 0) {
        airX = (airX - airX2);
        if (airX > 0) {
            airX = 0;
        }
        p->speedAirX = airX;
    } else if (airX2 > 0) {
        airX = (airX - airX2);

        if (airX < 0) {
            airX = 0;
        }

        p->speedAirX = airX;
    }
}

void sub_8023708(Player *p)
{
    s16 airX;
    s16 airX2;
    s16 diff;

    if ((u16)p->speedAirY < (u16)Q_24_8(189))
        return;

    airX = p->speedAirX;
    airX2 = (airX >> 6);

    if (airX2 < 0) {
        airX = (airX - airX2);
        if (airX > 0) {
            airX = 0;
        }
        p->speedAirX = airX;
    } else if (airX2 > 0) {
        airX = (airX - airX2);

        if (airX < 0) {
            airX = 0;
        }

        p->speedAirX = airX;
    }
}

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