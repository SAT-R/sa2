#include "core.h"
#include "malloc_vram.h"

#include "sakit/globals.h"
#include "game/cheese.h"

#include "constants/zones.h"
#include "constants/characters.h"

Cheese *gCheese = NULL;

void sub_801420C(void);
void sub_8015360(struct Task *);

extern const u16 gUnknown_080D5548[][2];

void CreateCheese(Player *player)
{

    Cheese *cheese;
    Sprite *s;
    if (IS_SINGLE_PLAYER) {
        struct Task *t;
        if (IS_EXTRA_STAGE(gCurrentLevel)) {
            gCheese = NULL;
            return;
        }

        if (player->character != CHARACTER_CREAM) {
            return;
        }

        t = TaskCreate(sub_801420C, 0x70, 0x5010, 0, sub_8015360);
        cheese = TASK_DATA(t);
        s = &cheese->s;
        gCheese = cheese;
        cheese->posX = gPlayer.x;
        cheese->posY = gPlayer.y;
    } else {
        struct MultiplayerPlayer *mpp = NULL;
        u8 i;
        u32 j;
        cheese = NULL;
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (gMultiplayerPlayerTasks[i] == NULL) {
                break;
            }
        }

        for (j = 0; j < i; j++) {
            if (gMultiplayerCharacters[j] == CHARACTER_CREAM) {
                struct Task *t;
                mpp = TASK_DATA(gMultiplayerPlayerTasks[j]);
                t = TaskCreate(sub_801420C, 0x70, 0x5010, 0, sub_8015360);
                cheese = TASK_DATA(t);
                cheese->unk6C = mpp;
                break;
            }
        }

        if (mpp == NULL) {
            return;
        }

        s = &cheese->s;
        gCheese = cheese;
        cheese->posX = 0;
        cheese->posY = 0;
    }

    cheese->unk8 = 2;
    cheese->unk9 = 2;
    cheese->unkC = 2;
    cheese->unkE = 0;
    cheese->unk10 = 0;
    s->graphics.dest = VramMalloc(9);
    s->graphics.anim = gUnknown_080D5548[cheese->unk10][0];
    s->variant = gUnknown_080D5548[cheese->unk10][1];
    s->graphics.size = 0;
    s->prevVariant = -1;
    s->unk1A = SPRITE_OAM_ORDER(17);
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);
    s->timeUntilNextFrame = 0;

    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->hitboxes[0].index = -1;
    s->hitboxes[1].index = -1;
}
