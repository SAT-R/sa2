#include "global.h"
#include "game/game.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 x;
    /* 0x34 */ s32 y;
    /* 0x38 */ s16 speedX;
    /* 0x3A */ s16 speedY;
    /* 0x3C */ s16 accX;
    /* 0x3E */ s16 accY;
    /* 0x40 */ u16 unk40;
} Sprite_StageSprUnknown;

void sub_800A5F8(void);

// Seems to create the given animation on the screen in a fixed position
// and despawns once it leaves player range?
struct Task *sub_800A544(u16 taskPrio, void *vramTiles, AnimId anim, u8 variant,
                         TaskDestructor dtor)
{
    struct Task *t
        = TaskCreate(sub_800A5F8, sizeof(Sprite_StageSprUnknown), taskPrio, 0, dtor);

    Sprite_StageSprUnknown *su = TaskGetStructPtr(t);
    su->x = 0;
    su->y = 0;
    su->speedX = 0;
    su->speedY = 0;
    su->accX = 0;
    su->accY = 0;
    su->unk40 = 0;

    su->s.x = 0;
    su->s.y = 0;
    su->s.graphics.dest = vramTiles;
    su->s.unk1A = 0;
    su->s.graphics.size = 0;
    su->s.graphics.anim = anim;
    su->s.variant = variant;
    su->s.unk14 = 0;
    su->s.unk1C = 0;
    su->s.unk21 = 0xFF;
    su->s.unk22 = 0x10;
    su->s.palId = 0;
    su->s.unk28->unk0 = -1;
    su->s.unk10 = 0;

    return t;
}

void sub_800A5F8(void)
{
    Sprite_StageSprUnknown *su = TaskGetStructPtr(gCurTask);
    su->speedX += su->accX;
    su->speedY += su->accY;

    su->x += su->speedX;
    su->y += su->speedY;

    su->s.x = Q_24_8_TO_INT(su->x) - gCamera.x;
    su->s.y = Q_24_8_TO_INT(su->y) - gCamera.y;

    if (su->unk40 != 0) {
        su->unk40--;
    }

    if (((u16)(su->s.x + 32) > (DISPLAY_WIDTH + 2 * 32))
        || (((su->s.y - 32) > DISPLAY_HEIGHT))) {
        TaskDestroy(gCurTask);
    } else if (sub_8004558(&su->s) == 0 && su->unk40 == 0) {
        TaskDestroy(gCurTask);
    } else {
        sub_80051E8(&su->s);
    }
}

void TaskDestructor_800A694(struct Task *t)
{
    Sprite_StageSprUnknown *su = TaskGetStructPtr(t);
    VramFree(su->s.graphics.dest);
}
