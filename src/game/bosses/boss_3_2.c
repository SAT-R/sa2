#include "global.h"
#include "global.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a.h"
#include "sakit/collision.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/bosses/common.h"
#include "game/bosses/boss_3.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/parameters/bosses.h"
#include "game/player_callbacks_1.h"
#include "game/save.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/zones.h"

/* TODO: Merge this file with boss_3.c */

void sub_8040D74(EggTotem *totem)
{
    Sprite *s = &totem->spr2A8;

    if (totem->unk35 == 0) {
        // NOTE: This matches, but it'd be better if this worked without 'a'
        u32 a = totem->unk32;

        if (a > 0) {
            totem->unk32 = a - 1;

            if (((a - 1) % 2u) != 0) {
                m4aSongNumStart(SE_143);
            } else {
                m4aSongNumStart(SE_235);
            }

            totem->unk35 = 30;

            if (totem->unk32 == 0) {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 3;
                INCREMENT_SCORE(1000);
            } else {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 2;
            }

            s->prevVariant = -1;
        }

        if (!IS_FINAL_STAGE(gCurrentLevel) && (totem->unk32 == 4)) {
            gUnknown_030054A8.unk1 = 17;
        }
    }
}

void sub_8040E78(EggTotem *totem)
{
    Sprite *s = &totem->spr2A8;

    if (totem->unk35 > 0) {
        totem->unk34 = 0;

        if (--totem->unk35 == 0) {
            if (totem->unk32 == 0) {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 3;
            } else {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 0;
            }

            s->prevVariant = -1;
        }
    } else if (totem->unk34 > 0) {
        if (--totem->unk34 == 0) {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 0;
            s->prevVariant = -1;
        }
    }
}

// (96.85%) https://decomp.me/scratch/GIiSa 
void sub_8040F14(EggTotem *totem)
{
    u8 i;

    if(totem->unk35 != 0) {
        for(i = 0; i < 16; i++) {
            gObjPalette[128 + i] = gUnknown_080D7F14[i*2 + ((gStageTime & 0x2) >> 1) * 32];
        }
    } else {
        // _08040F70
        for(i = 0; i < 16; i++) {
            gObjPalette[128 + i] = gUnknown_080D7F34[i];
        }
    }

    if(totem->unk36 > 0) {
        totem->unk36--;
        
        for(i = 0; i < 16; i++) {
            gObjPalette[176 + i] = gUnknown_080D7F14[i*2 + ((gStageTime & 0x2) >> 1) * 32];
        }
    } else {
        
        for(i = 0; i < 16; i++) {
            gObjPalette[176 + i] = gUnknown_080D7F34[i];
        }
    }

    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
}