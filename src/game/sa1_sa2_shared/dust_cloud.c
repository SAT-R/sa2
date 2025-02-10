#include "global.h"
#include "sprite.h"
#include "task.h"
#include "game/stage/camera.h"

#include "constants/animations.h"

static void Task_CreateDustCloud(void);

// Create cloud that appears when defeating enemies / opening item boxes
void CreateDustCloud(s16 x, s16 y)
{
    struct Task *t = TaskCreate(Task_CreateDustCloud, sizeof(Sprite), 0x2000, 0, NULL);
    Sprite *s = TASK_DATA(t);

    s->x = x;
    s->y = y;
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x1000);
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_DUST_CLOUD;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

static void Task_CreateDustCloud(void)
{
    Sprite *s = TASK_DATA(gCurTask);
    s16 oldX, oldY;

    oldX = s->x;
    oldY = s->y;

    s->x -= gCamera.x;
    s->y -= gCamera.y;

    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        DisplaySprite(s);
        TaskDestroy(gCurTask);
#ifdef BUG_FIX
        // Without this return, we essentially have a "use-after-free".
        return;
#endif
    }

    DisplaySprite(s);

    s->x = oldX;
    s->y = oldY;
}