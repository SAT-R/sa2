#include "global.h"
#include "core.h"
#include "game/game.h"
#include "game/rings_scatter.h"

#include "constants/animations.h"

typedef struct {
    /* 0x000 */ Sprite sprRing;
    /* 0x030 */ u16 unk30[0x140];
    /* 0x2B0 */ u32 unk2B0;
    /* 0x2B4 */ u16 unk2B4;
    /* 0x2B6 */ u16 unk2B6;
} RingsScatter; /* size: 0x2B8 */

void Task_RingsScatter_Singleplayer(void);
void Task_RingsScatter_MP_Singlepak(void);
void Task_RingsScatter_MP_Multipak(void);
void TaskDestructor_80213B4(struct Task *);

// Called on Stage Initialization
void InitPlayerHitRingsScatter(void)
{
#ifndef NON_MATCHING
    register TaskMain taskFn asm("r0");
#else
    TaskMain taskFn;
#endif
    RingsScatter *rs;
    Sprite *s;
    struct Task **tgtTask;
    struct Task *t;
    u16 *dmaDest;
    u32 size;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (IS_SINGLE_PLAYER) {
            tgtTask = &gRingsScatterTask;
            taskFn = Task_RingsScatter_Singleplayer;
        } else {
            tgtTask = &gRingsScatterTask;
            taskFn = Task_RingsScatter_MP_Multipak;
        }
    } else {
        tgtTask = &gRingsScatterTask;
        taskFn = Task_RingsScatter_MP_Singlepak;
    }

    size = sizeof(RingsScatter);

#ifndef NON_MATCHING
    asm("" :);
#endif

    t = TaskCreate(taskFn, size, 0x2001, 0, TaskDestructor_80213B4);

    *tgtTask = t;

    rs = TASK_DATA(t);

    s = &rs->sprRing;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x1F00);
    s->unk1A = SPRITE_OAM_ORDER(20);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_RING;
    s->variant = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(2.0);
    s->palId = 0;
    s->unk10
        = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_18 | SPRITE_FLAG_MASK_MOSAIC);
    rs->unk2B6 = 0;
    rs->unk2B4 = 0x94;
    rs->unk2B0 = 0x12;

    dmaDest = rs->unk30;
    DmaFill16(3, 0, dmaDest, sizeof(rs->unk30));
}