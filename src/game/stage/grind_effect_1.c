#include "global.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/anim_sizes.h"

typedef struct {
    Sprite s;
} GrindEffect;

void Task_GrindEffect(void);
void TaskDestructor_GrindEffect(struct Task *);

// NOTE: This effect is unused in SA2.
//       It is the code for SA1's Grind effect

struct Task *CreateGrindEffect()
{
    struct Task *t = TaskCreate(Task_GrindEffect, sizeof(GrindEffect), 0x2001, 0, TaskDestructor_GrindEffect);

    GrindEffect *spark = TASK_DATA(t);
    Sprite *s = &spark->s;
#if (GAME == GAME_SA1)
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_GRIND_EFFECT);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_GRIND_EFFECT;
#elif (GAME == GAME_SA2)
    s->graphics.dest = ALLOC_TILES(SA2_ANIM_GRIND_EFFECT);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_GRIND_EFFECT;
#endif
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

void Task_GrindEffect(void)
{
    Player *p = &gPlayer;

    if (p->spriteTask == NULL || !(p->moveState & MOVESTATE_1000000)) {
        TaskDestroy(gCurTask);
        return;
#if (GAME == GAME_SA1)
    } else if ((p->anim == SA1_CHAR_ANIM_GRINDING) && (p->variant == 1)) {
#elif (GAME == GAME_SA2)
    } else if ((p->anim == SA2_CHAR_ANIM_GRINDING) && (p->variant == 0)) {
#endif
        GrindEffect *spark = TASK_DATA(gCurTask);
        Sprite *s = &spark->s;
        struct Camera *cam = &gCamera;
        s->x = I(p->qWorldX) - cam->x;
        s->y = (I(p->qWorldY) + p->spriteOffsetY) - cam->y;

        if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
            s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
        } else {
            s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void TaskDestructor_GrindEffect(struct Task *t)
{
    GrindEffect *spark = TASK_DATA(t);
    VramFree(spark->s.graphics.dest);
}