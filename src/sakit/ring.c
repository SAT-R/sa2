#include "global.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "sakit/globals.h"
#include "sakit/collect_ring_effect.h"
#include "sakit/rings_manager.h"
#include "sakit/camera.h"
#include "sakit/player.h"

#include "constants/animations.h"
#include "constants/zones.h"

typedef struct {
    Sprite s;
    s16 unk30;
} StageRing;

void Task_MagneticRing(void);

void CreateMagneticRing(s16 x, s16 y)
{
    struct Task *t = TaskCreate(Task_MagneticRing, sizeof(StageRing), 0x2000, 0, NULL);
    StageRing *ring = TASK_DATA(t);
    Sprite *s;

    ring->unk30 = 0;

    s = &ring->s;
    s->x = x;
    s->y = y;

    s->graphics.dest = RESERVED_RING_TILES_VRAM;
    s->unk1A = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_RING;
    s->variant = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = (SPRITE_FLAG_MASK_19 | SPRITE_FLAG_MASK_18 | SPRITE_FLAG(PRIORITY, 2));
}

// (88.87%) https://decomp.me/scratch/EmhmV
NONMATCH("asm/non_matching/game/stage/Task_MagneticRing.inc",
         void Task_MagneticRing(void))
{
    StageRing *ring = TASK_DATA(gCurTask);
    Player *p = &gPlayer;
    s32 ringToPlayerX = I(p->x) - (u16)ring->s.x;
    s32 ringToPlayerY = I(p->y) - (u16)ring->s.y;

    s16 sinVal = sub_8004418(ringToPlayerY, ringToPlayerX);
    s16 ringX;
    s16 ringY;

    s32 lvalue, rvalue;

    ring->unk30 += 0x40;

    ring->s.x += (ring->unk30 * COS(sinVal)) >> 22;
    ring->s.y += (ring->unk30 * SIN(sinVal)) >> 22;

    ringY = ring->s.y;
    ringX = ring->s.x;

    lvalue = ring->s.x - 8;
    rvalue = I(p->x) + gUnknown_03005AF0.s.hitboxes[0].left;

    if (((lvalue <= rvalue) && (ring->s.x + 8 < rvalue))
        || ((ringY - 16 > I(gPlayer.y) + gUnknown_03005AF0.s.hitboxes[0].top))
        || ((I(p->y) >= gUnknown_03005AF0.s.hitboxes[0].top)
            || ringY - 16 < gUnknown_03005AF0.s.hitboxes[0].top)) {

    }

    else if (gUnknown_03005AF0.s.hitboxes[0].bottom - gUnknown_03005AF0.s.hitboxes[0].top
             >= I(gPlayer.y) + ringY) {
        // _0800BC36
        if (PLAYER_IS_ALIVE) {
            u16 oldRings = gRingCount;
            gRingCount++;

            if ((gCurrentLevel != COURSE_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53))
                && (Div(gRingCount, 100) != Div(oldRings, 100))
                && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {
                u32 lives = gNumLives;
                if (lives + 1 > 255)
                    gNumLives = 255;
                else
                    gNumLives = lives + 1;

                gUnknown_030054A8.unk3 = 0x10;
            }

            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                if (gRingCount > 255)
                    gRingCount = 255;
            }

            CreateCollectRingEffect(ringX, ringY);
        }
        TaskDestroy(gCurTask);
        return;
    }

    {
        ring->s.x -= gCamera.x;
        ring->s.y -= gCamera.y;
        UpdateSpriteAnimation(&ring->s);
        DisplaySprite(&ring->s);
        ring->s.x = ringX;
        ring->s.y = ringY;
    }
}
END_NONMATCH
