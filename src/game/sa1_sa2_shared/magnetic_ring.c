#include "global.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/collect_ring_effect.h"
#include "game/sa1_sa2_shared/rings_manager.h"
#include "game/sa1_sa2_shared/camera.h"
#include "game/sa1_sa2_shared/player.h"

#include "constants/animations.h"
#include "constants/zones.h"

typedef struct {
    Sprite s;
    s16 speed;
} StageRing;

void Task_MagneticRing(void);

void CreateMagneticRing(s16 x, s16 y)
{
    struct Task *t = TaskCreate(Task_MagneticRing, sizeof(StageRing), 0x2000, 0, NULL);
    StageRing *ring = TASK_DATA(t);
    Sprite *s;

    ring->speed = 0;

    s = &ring->s;
    s->x = x;
    s->y = y;

    s->graphics.dest = RESERVED_RING_TILES_VRAM;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_RING;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = (SPRITE_FLAG_MASK_19 | SPRITE_FLAG_MASK_18 | SPRITE_FLAG(PRIORITY, 2));
}

void Task_MagneticRing(void)
{
    StageRing *ring = TASK_DATA(gCurTask);
    Player *p = &gPlayer;
    s32 ringToPlayerX = I(p->qWorldX) - (u16)ring->s.x;
    s32 ringToPlayerY = I(p->qWorldY) - (u16)ring->s.y;

    s16 sinVal = sub_8004418(ringToPlayerY, ringToPlayerX);
    s16 ringX, ringY;

    ring->speed += Q(0.25);

    ring->s.x += (ring->speed * COS(sinVal)) >> 22;
    ring->s.y += (ring->speed * SIN(sinVal)) >> 22;

    ringY = ring->s.y;
    ringX = ring->s.x;

    if (HB_TOUCHING_RING(I(gPlayer.qWorldX), I(gPlayer.qWorldY), ringX, ringY, gPlayerBodyPSI.s.hitboxes[0])) {
        if (PLAYER_IS_ALIVE) {
            INCREMENT_RINGS(1);

            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                if (gRingCount > 255)
                    gRingCount = 255;
            }

            CreateCollectRingEffect(ringX, ringY);
        }
        TaskDestroy(gCurTask);
        return;
    }

    ring->s.x -= gCamera.x;
    ring->s.y -= gCamera.y;
    UpdateSpriteAnimation(&ring->s);
    DisplaySprite(&ring->s);
    ring->s.x = ringX;
    ring->s.y = ringY;
}
