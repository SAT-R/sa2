#include "global.h"
#include "sprite.h"
#include "task.h"
#include "game/game.h"

#include "constants/animations.h"

static void Task_800BA58(void);

void sub_800B9B8(s16 x, s16 y)
{
    struct Task *t = TaskCreate(Task_800BA58, sizeof(Sprite), 0x2000, 0, NULL);
    Sprite *s = TaskGetStructPtr(t);

    s->x = x;
    s->y = y;
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x1000);
    s->unk1A = 0x3C0;
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_DUST_CLOUD;
    s->variant = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);
}

static void Task_800BA58(void)
{
    Sprite *s = TaskGetStructPtr(gCurTask);
    s16 oldX, oldY;

    oldX = s->x;
    oldY = s->y;

    s->x -= gCamera.x;
    s->y -= gCamera.y;

    if (sub_8004558(s) == 0) {
        sub_80051E8(s);
        TaskDestroy(gCurTask);
    }

    sub_80051E8(s);

    s->x = oldX;
    s->y = oldY;
}