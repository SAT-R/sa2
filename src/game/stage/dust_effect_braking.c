#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/dust_effect_braking.h"

#include "constants/animations.h"

DustEffectBraking ALIGNED(8) gDustEffectBrakingTask = {};

void Task_801F6E0(void);
void TaskDestructor_801F7A8(struct Task *);
void Task_801F7B4(void);
void TaskDestructor_801F7B8(struct Task *);

/* This generates the Dust Clouds that appear while running and then braking by
 * holding the DPAD in the other direction. */

struct Task *CreateBrakingDustEffect(s32 x, s32 y)
{
    if (gDustEffectBrakingTask.t == NULL || gDustEffectBrakingTask.unk0 == 0) {
        return NULL;
    } else {
        struct Task *t;
        BrakeDustEffect *bde;
        Player *p;
        Sprite *s;

        gDustEffectBrakingTask.unk0--;

        t = TaskCreate(Task_801F6E0, sizeof(BrakeDustEffect), 0x4001, 0, TaskDestructor_801F7B8);

        bde = TASK_DATA(t);
        bde->x = x;
        bde->y = y;
        bde->unk4 = 0;
        bde->unk6 = 0;

        s = &bde->s;
        p = &gPlayer;

        if (p->moveState & MOVESTATE_GOAL_REACHED) {
            s->graphics.dest = VramMalloc(15);
            s->graphics.anim = SA2_ANIM_BRAKING_DUST_EFFECT;
            s->variant = 0;
            s->frameFlags = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(X_FLIP, 1));
        } else {
            // _0801F668
            s->graphics.dest = ((void *)OBJ_VRAM0 + 0x2300);
            s->graphics.anim = SA2_ANIM_SMALL_DUST_PARTICLE;
            s->variant = 0;
            s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

            s->frameFlags |= ((u32)PseudoRandom32() & (SPRITE_FLAG_MASK_Y_FLIP | SPRITE_FLAG_MASK_X_FLIP));
        }

        s->graphics.size = 0;
        s->prevVariant = -1;
        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;

        return t;
    }
}

void Task_801F6E0(void)
{
    DustEffectBraking *unk = &gDustEffectBrakingTask;
    BrakeDustEffect *bde = TASK_DATA(gCurTask);
    Sprite *s = &bde->s;

    if (unk->t == 0 || (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER)) {
        unk->unk0++;
        TaskDestroy(gCurTask);
        return;
    } else {
        s->x = bde->x - gCamera.x;
        s->y = bde->y - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        bde->x += bde->unk4;
        bde->y += bde->unk6;
    }
}

void CreateBrakingDustEffectRelatedTask(void)
{
    if (gDustEffectBrakingTask.t == NULL) {
        struct Task *t = TaskCreate(Task_801F7B4, 0, 0x4000, 0, TaskDestructor_801F7A8);
        gDustEffectBrakingTask.t = t;
        gDustEffectBrakingTask.unk0 = 20;
    }
}

void DestroyBrakingDustEffectRelatedTask(void)
{
    if (gDustEffectBrakingTask.t != NULL) {
        TaskDestroy(gDustEffectBrakingTask.t);
        gDustEffectBrakingTask.t = NULL;
    }
}

void TaskDestructor_801F7A8(struct Task *t) { gDustEffectBrakingTask.t = NULL; }

void Task_801F7B4(void) { }

void TaskDestructor_801F7B8(struct Task *t)
{
    BrakeDustEffect *bde = TASK_DATA(t);
    Sprite *s = &bde->s;

    if (s->graphics.anim == SA2_ANIM_BRAKING_DUST_EFFECT) {
        VramFree(bde->s.graphics.dest);
    }
}