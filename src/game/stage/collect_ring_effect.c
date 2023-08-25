#include "global.h"
#include "task.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/stage/rings_manager.h"

#include "constants/animations.h"

typedef struct {
    Sprite s;
    u8 unk30;
    u8 unk31;
} RingEffect;

void Task_CollectRingEffect(void);

extern struct SongHeader se_ring_copy;

void CreateCollectRingEffect(s16 x, s16 y)
{
    if (gUnknown_0300540C < 8) {
        struct Task *t
            = TaskCreate(Task_CollectRingEffect, sizeof(RingEffect), 0x2000, 0, NULL);
        RingEffect *re = TaskGetStructPtr(t);
        Sprite *s = &re->s;

        re->unk31 = 0;

        s->x = x;
        s->y = y;
        s->graphics.dest = RESERVED_RING_EFFECT_TILES_VRAM;
        s->unk1A = 0x3C0;
        s->graphics.size = 0;
        s->graphics.anim = SA2_ANIM_RING_COLLECT;
        s->variant = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);

        re->unk30 = gRingCount & 1;
        if (re->unk30) {
            MPlayStart(&gMPlayInfo_SE2, &se_ring_copy);
            m4aMPlayImmInit(&gMPlayInfo_SE2);
            m4aMPlayVolumeControl(&gMPlayInfo_SE2, 0xFFFF, 128);
            m4aMPlayPanpotControl(&gMPlayInfo_SE2, 0xFFFF, -64);
        } else {
            MPlayStart(&gMPlayInfo_SE1, &se_ring_copy);
            m4aMPlayImmInit(&gMPlayInfo_SE1);
            m4aMPlayVolumeControl(&gMPlayInfo_SE1, 0xFFFF, 128);
            m4aMPlayPanpotControl(&gMPlayInfo_SE1, 0xFFFF, +64);
        }

        gUnknown_0300540C++;
    }
}

void Task_CollectRingEffect(void)
{
    RingEffect *re = TaskGetStructPtr(gCurTask);
    Sprite *s = &re->s;

    s16 playerX = s->x;
    s16 playerY = s->y;

    s->x -= gCamera.x;
    s->y -= gCamera.y;
    if (sub_8004558(s) == 0) {
        sub_80051E8(s);

        gUnknown_0300540C--;

        TaskDestroy(gCurTask);
    }

    sub_80051E8(s);

    s->x = playerX;
    s->y = playerY;
}