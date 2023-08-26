#include "global.h"
#include "game/game.h"
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

    SparkEffect *spark = TaskGetStructPtr(t);
    Sprite *s = &spark->s;
    s->graphics.dest = VramMalloc(20);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_SPARK_EFFECT;
    s->variant = 0;
    s->prevVariant = -1;
    s->unk1A = SPRITE_OAM_ORDER(8);
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

void Task_SparkEffect(void)
{
    Player *p = &gPlayer;

    if (p->spriteTask == NULL || !(p->moveState & MOVESTATE_1000000)) {
        TaskDestroy(gCurTask);
        return;
    } else if ((p->anim == SA2_CHAR_ANIM_55) && (p->variant == 0)) {
        SparkEffect *spark = TaskGetStructPtr(gCurTask);
        Sprite *s = &spark->s;
        struct Camera *cam = &gCamera;
        s->x = Q_24_8_TO_INT(p->x) - cam->x;
        s->y = (Q_24_8_TO_INT(p->y) + p->unk17) - cam->y;

        if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
            s->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
        } else {
            s->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;
        }

        sub_8004558(s);
        sub_80051E8(s);
    }
}

void TaskDestructor_SparkEffect(struct Task *t)
{
    SparkEffect *spark = TaskGetStructPtr(t);
    VramFree(spark->s.graphics.dest);
}