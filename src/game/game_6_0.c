#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/dust_effect_braking.h"
#include "game/player_callbacks_1.h"
#include "game/playerfn_cmds.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/player_transitions.h"

extern u16 gUnknown_080D6736[115][2];

typedef struct {
    /* 0x00 */ u8 unk0;
    /* 0x04 */ u32 unk4; // TODO: Check the type!
} Game_6_0_Task; /* size: 0x8 */

extern void sub_800E16C(void);
void Task_8023FC0(void);
extern void sub_801FC2C(void);
void sub_8021490(Player *, UNK_3005A70 *);
void sub_8021554(Player *, UNK_3005A70 *);
void sub_8021694(Player *);
void TaskDestructor_802A07C(struct Task *);

void sub_80213C0(u32 UNUSED characterId, u32 UNUSED levelId, Player *player)
{
#ifndef NON_MATCHING
    register Player *p asm("r5") = player;
#else
    Player *p = player;
#endif

    s32 unk60 = p->unk60;
    struct Task *t;
    Game_6_0_Task *gt;
    s32 mode;

    t = TaskCreate(Task_8023FC0, sizeof(Game_6_0_Task), 0x3000, 0,
                   TaskDestructor_802A07C);
    p->spriteTask = t;
    gt = TaskGetStructPtr(t);
    gt->unk0 = unk60;
    gt->unk4 = 0;

    if (IS_MULTI_PLAYER) {
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            gRingCount = 1;
        } else {
            gRingCount = 0;
        }
    }
    // _0802141C

    sub_8021694(p);

    PLAYERFN_SET(PlayerCB_8025318);

    sub_801F754();
    sub_801FC2C();

    mode = gInputRecorder.mode;

    if ((mode == RECORDER_RECORD)) {
        InputRecorderLoadTape();
        gInputRecorder.mode = mode;
    } else if (mode == RECORDER_PLAYBACK) {
        InputRecorderLoadTape();
        gInputRecorder.mode = mode;
    }

    gStageGoalX = 0;
    gUnknown_030054FC = 0;
    gUnknown_030054E0 = 0;

    sub_800E16C();
    sub_8021490(p, p->unk90);
    sub_8021554(p, p->unk94);
}

void sub_8021490(Player *p, UNK_3005A70 *param2)
{
    s32 unk60 = p->unk60;
    Sprite *s = &param2->s;

    if (unk60 == 0) {
        s->graphics.dest = (void *)OBJ_VRAM0;
    } else {
        s->graphics.dest = VramMalloc(64);
    }

    s->graphics.size = 0;
    s->graphics.anim = p->anim;
    s->variant = p->variant;
    s->prevVariant = -1;
    s->x = Q_24_8_TO_INT(p->x);
    s->y = Q_24_8_TO_INT(p->y);
    s->unk1A = SPRITE_OAM_ORDER(16 + unk60);
    s->timeUntilNextFrame = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);

    if (IS_MULTI_PLAYER) {
        s->palId = SIO_MULTI_CNT->id;
    } else {
        s->palId = 0;
    }

    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    if (IS_MULTI_PLAYER) {
        s->unk10 |= (SPRITE_FLAG_MASK_18 | SPRITE_FLAG_MASK_19);
    }
    SPRITE_FLAG_SET(s, ROT_SCALE_ENABLE);
    s->unk10 |= unk60;

    s->hitboxes[0].index = -1;
    s->hitboxes[1].index = -1;

    param2->unk0[0] = 0;
    param2->unk0[1] = 0x100;
    param2->unk0[2] = 0x100;
    param2->unk0[3] = 0;
    param2->unk0[4] = 0;
}

#if 01
#endif
