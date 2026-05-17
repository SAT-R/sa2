#include "global.h"
#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/sa1/stage/some_task_manager.h"

#include "constants/sa1/move_states.h"

void sub_804CD80(SomeTaskManager_60 *taskData, GfxInfo *gfx);
void sub_804CF5C(SomeTaskManager_7C *taskData, GfxInfo *gfx);

void sub_804CD80(SomeTaskManager_60 *taskData, GfxInfo *gfx)
{
    Sprite *s;
    SpriteTransform *transform;

    taskData->unk0 = 0;
    taskData->unk2 = 0;
    taskData->unk3 = 0;
    taskData->unk4 = 0;
    taskData->unk8 = 0;

    taskData->qUnk50 = 0;
    taskData->qUnk54 = 0;
    taskData->qUnk58 = 0;
    taskData->qUnk5A = 0;
    taskData->qUnk5C = 0;
    taskData->qUnk5E = 0;

    s = &taskData->s;
    transform = &taskData->transform;

    s->graphics.dest = gfx->vram;
    s->graphics.anim = gfx->tileInfo.anim;
    s->variant = gfx->tileInfo.variant;
    s->oamFlags = 0;
    s->frameFlags = 0;
    s->graphics.size = 0;
    s->prevVariant = -1;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;

    transform->rotation = 0;
    transform->qScaleX = Q(1.0);
    transform->qScaleY = Q(1.0);
    transform->x = 0;
    transform->y = 0;

    s->hitboxes[1].index = HITBOX_STATE_INACTIVE;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
}

void sub_804CDF8(void)
{
    SomeTaskManager_60 *taskData = TASK_DATA(gCurTask);
    Sprite *s = &taskData->s;
    SpriteTransform *transform = &taskData->transform;
    Camera *cam = &gCamera;
    s32 screenX, screenY;

    screenX = I(taskData->qUnk50) - cam->x;
    screenY = I(taskData->qUnk54) - cam->y;

    // TODO: Proper range check for Y!
    if ((screenX < -32 || screenX >= DISPLAY_WIDTH + 32) || (screenY >= DISPLAY_HEIGHT + 64)) {
        TaskDestroy(gCurTask);
        return;
    }

    transform->x = screenX;
    transform->y = screenY;

    s->frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;

    s->frameFlags |= SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | gOamMatrixIndex++;

    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);

    { // TODO: inline of sub_804CFA0?
        taskData->qUnk50 += taskData->qUnk58;
        taskData->qUnk54 += taskData->qUnk5A;
        taskData->qUnk58 += taskData->qUnk5C;
        taskData->qUnk5A += taskData->qUnk5E;
    }
}

Task *CreateSomeTaskManager_60_Task(GfxInfo *gfx, TaskMain proc, TaskDestructor dtor)
{
    Task *t = TaskCreate(proc, sizeof(SomeTaskManager_60), gCurTask->priority + 1, 0, dtor);

    sub_804CD80(TASK_DATA(t), gfx);

    return t;
}

Task *CreateSomeTaskManager_7C_Task(GfxInfo *gfx, TaskMain proc, TaskDestructor dtor)
{
    Task *t = TaskCreate(proc, sizeof(SomeTaskManager_7C), gCurTask->priority + 1, 0, dtor);

    sub_804CF5C(TASK_DATA(t), gfx);

    return t;
}

void sub_804CF5C(SomeTaskManager_7C *taskData, GfxInfo *gfx)
{
    sub_804CD80(&taskData->unk0, gfx);

    taskData->unk60 = 0;
    taskData->unk64 = 0;
    taskData->unk68 = 0;
    taskData->unk6C = 0;
    taskData->unk70 = 0;
    taskData->unk72 = 0;
    taskData->unk74 = 0;
    taskData->unk76 = 0;
}

void TaskDestructor_SomeTaskManager_60_Common(Task *t)
{
    SomeTaskManager_60 *taskData = TASK_DATA(t);
    Sprite *s = &taskData->s;
    VramFree(s->graphics.dest);
}

void sub_804CFA0(SomeTaskManager_60 *taskData)
{
    taskData->qUnk50 += taskData->qUnk58;
    taskData->qUnk54 += taskData->qUnk5A;
}

void sub_804CFC0(SomeTaskManager_60 *taskData)
{
    taskData->qUnk58 += taskData->qUnk5C;
    taskData->qUnk5A += taskData->qUnk5E;
}

bool32 sub_804CFE0(u16 *param0, u16 param1, u16 param2)
{
    s32 v = *param0;

    if (param1 != v) {
        if ((param1 - v) << 16 >= 0) {
            s32 v2 = param2 + v;
            *param0 = v2;

            if ((param1 - v2) << 16 < 0) {
                *param0 = param1;
                return TRUE;
            }
        } else {
            // _0804D00E
            s32 v2 = v - param2;
            *param0 = v2;

            if ((param1 - v2) << 16 >= 0) {
                *param0 = param1;
                return TRUE;
            }
        }

        return FALSE;
    }

    return TRUE;
}
