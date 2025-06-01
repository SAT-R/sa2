#include "global.h"
#include "task.h"
#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/collect_ring_effect.h"
#include "game/sa1_sa2_shared/rings_manager.h"

#include "game/sa1_sa2_shared/player.h"
#include "game/sa1_sa2_shared/camera.h"

#include "constants/animations.h"

typedef struct {
    Sprite s;
    u8 bPanSfxLeft;
    u8 unk31;
} RingEffect;

void Task_CollectRingEffect(void);

extern struct MP2KSongHeader se_ring_copy;

void CreateCollectRingEffect(s16 x, s16 y)
{
    if (gActiveCollectRingEffectCount < 8) {
        struct Task *t = TaskCreate(Task_CollectRingEffect, sizeof(RingEffect), 0x2000, 0, NULL);
        RingEffect *re = TASK_DATA(t);
        Sprite *s = &re->s;

        re->unk31 = 0;

        s->x = x;
        s->y = y;
        s->graphics.dest = RESERVED_RING_EFFECT_TILES_VRAM;
        s->oamFlags = SPRITE_OAM_ORDER(15);
        s->graphics.size = 0;
        s->graphics.anim = SA2_ANIM_RING_COLLECT_EFFECT;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        re->bPanSfxLeft = gRingCount & 1;
        if (re->bPanSfxLeft) {
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

        gActiveCollectRingEffectCount++;
    }
}

void Task_CollectRingEffect(void)
{
    RingEffect *re = TASK_DATA(gCurTask);
    Sprite *s = &re->s;

    s16 playerX = s->x;
    s16 playerY = s->y;

    s->x -= gCamera.x;
    s->y -= gCamera.y;
    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        DisplaySprite(s);

        gActiveCollectRingEffectCount--;

        TaskDestroy(gCurTask);
#ifdef BUG_FIX
        // Prevent use-after-free
        return;
#endif
    }

    DisplaySprite(s);

    s->x = playerX;
    s->y = playerY;
}
