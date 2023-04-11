#include "global.h"
#include "trig.h"
#include "lib/m4a.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/playercb_cmds.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

/* NOTE: We consider Player Callbacks to be all procedures
 *       that are passed to the first member of the Player struct.
 *       So even if there are procedures that only take a Player,
 *       if they are only called directly in the code, those are NOT callbacks.
 */

void Task_8012034(void);
extern void TaskDestructor_80124B8(struct Task *);

// For Sonic's Down-Trick "Bound"
struct Task *sub_8011C98(s32 x, s32 y)
{
    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        return NULL;
    } else {
        struct Task *t = TaskCreate(Task_8012034, sizeof(TaskStrc_8011C98), 0x4001, 0,
                                    TaskDestructor_80124B8);

        TaskStrc_8011C98 *strc = TaskGetStructPtr(t);
        Sprite *s = &strc->s;

        s16 i;
        for (i = 0; i < 5; i++) {
            strc->px[i] = x;
            strc->py[i] = y;
        }

        strc->unk28 = 0;
        s->graphics.dest = VramMalloc(16);
        s->graphics.size = 0;
        s->graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_SONIC);
        s->variant = 3;
        s->unk21 = -1;
        s->unk1A = 0x440;
        s->unk1C = 0;
        s->unk22 = 0x10;
        s->focused = 0;
        s->unk10 = SPRITE_FLAG_PRIORITY(2);

        return t;
    }
}