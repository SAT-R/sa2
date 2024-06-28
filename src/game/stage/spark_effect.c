#include "global.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"

#include "constants/animations.h"

typedef struct {
    Sprite s;
} SparkEffect;

void Task_SparkEffect(void);
void TaskDestructor_SparkEffect(struct Task *);

// NOTE: This effect appears to be unused
struct Task *CreateSparkEffect()
{
    struct Task *t = TaskCreate(Task_SparkEffect, sizeof(SparkEffect), 0x2001, 0,
                                TaskDestructor_SparkEffect);

    SparkEffect *spark = TASK_DATA(t);
    Sprite *s = &spark->s;
    s->graphics.dest = VramMalloc(20);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_SPARK_EFFECT;
    s->variant = 0;
    s->prevVariant = -1;
    s->unk1A = SPRITE_OAM_ORDER(8);
    s->timeUntilNextFrame = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

void Task_SparkEffect(void)
{
    Player *p = &gPlayer;

    if (p->spriteTask == NULL || !(p->moveState & MOVESTATE_1000000)) {
        TaskDestroy(gCurTask);
        return;
    } else if ((p->anim == SA2_CHAR_ANIM_55) && (p->variant == 0)) {
        SparkEffect *spark = TASK_DATA(gCurTask);
        Sprite *s = &spark->s;
        struct Camera *cam = &gCamera;
        s->x = I(p->x) - cam->x;
        s->y = (I(p->y) + p->unk17) - cam->y;

        if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
            s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
        } else {
            s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void TaskDestructor_SparkEffect(struct Task *t)
{
    SparkEffect *spark = TASK_DATA(t);
    VramFree(spark->s.graphics.dest);
}