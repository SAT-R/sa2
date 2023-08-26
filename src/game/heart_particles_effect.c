#include "core.h"
#include "game/heart_particles_effect.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "sprite.h"

#include "constants/animations.h"

#define NUM_HEARTS 4

typedef struct {
    Sprite sprites[NUM_HEARTS];
    u8 unkC0;
    s16 unkC2;
    s32 unkC4[NUM_HEARTS];
    s32 unkD4[NUM_HEARTS];
    u8 unkE4;
} HeartParticles;

static void sub_8086CBC(struct Task *);
static void sub_8086A88(void);
static void sub_8086A0C(HeartParticles *);
static void sub_8086B38(HeartParticles *unk998);
static void sub_8086BE8(u8);

void CreateHeartParticles(void)
{
    u8 i;
    struct Task *t
        = TaskCreate(sub_8086A88, sizeof(HeartParticles), 0x4000, 0, sub_8086CBC);
    HeartParticles *unk998 = TaskGetStructPtr(t);
    unk998->unkC2 = 0;
    unk998->unkE4 = 0;
    unk998->unkC0 = 0;

    for (i = 0; i < NUM_HEARTS; i++) {
        unk998->unkC4[i] = 0;
        unk998->unkD4[i] = 0;
    }

    sub_8086A0C(unk998);
}

static void sub_8086A0C(HeartParticles *unk998)
{
    u8 i;
    Sprite *s;

    for (i = 0; i < 4; i++) {
        s = &unk998->sprites[i];
        s->graphics.dest = VramMalloc(10);
        s->graphics.anim = SA2_ANIM_HEART;
        s->variant = 0;
        s->prevVariant = -1;
        s->x = -20;
        s->y = 0;
        s->unk1A = SPRITE_OAM_ORDER(6);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->unk10 = 0x2000;
    }
}

static void sub_8086A88(void)
{
    u8 i;
    HeartParticles *unk998 = TaskGetStructPtr(gCurTask);
    Sprite *s;

    for (i = 0; i < NUM_HEARTS; i++) {
        s = &unk998->sprites[i];
        s->x = gPlayer.unk90->s.x;
        s->y = gPlayer.unk90->s.y;
    }

    sub_8086B38(unk998);

    if (unk998->unkE4 == 0) {
        if (unk998->unkC2 == 0) {
            sub_8086BE8(0);
        }
        if (unk998->unkC2 == 3) {
            sub_8086BE8(1);
        }
        if (unk998->unkC2 == 7) {
            sub_8086BE8(2);
        }
        if (unk998->unkC2 == 11) {
            sub_8086BE8(3);
        }
    }

    unk998->unkC2++;

    if (unk998->unkC2 == 15) {
        unk998->unkC2 = 0;
    }

    if (gPlayer.unk64 != 0x22) {
        unk998->unkE4 = 1;
    }
}

static void sub_8086B38(HeartParticles *unk998)
{
    u8 i;
    u8 j = 1;
    Sprite *s;

    if (unk998->unkE4 != 0 && unk998->unkC0 == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    for (i = 0; i < NUM_HEARTS; i++) {
        if (unk998->unkC0 & j) {
            s = &unk998->sprites[i];
            s->x = Q_24_8_TO_INT(unk998->unkC4[i]) - gCamera.x;
            s->y = Q_24_8_TO_INT(unk998->unkD4[i]) - gCamera.y;

            if (UpdateSpriteAnimation(s) == 0) {
                unk998->unkC0 &= ~(1 << i);
            } else {
                sub_80051E8(s);
            }
        }
        j <<= 1;
    }
}

static void sub_8086BE8(u8 i)
{
    Sprite *s;
    HeartParticles *unk998 = TaskGetStructPtr(gCurTask);

    unk998->unkC4[i] = gPlayer.x;
    unk998->unkD4[i] = gPlayer.y;

    if (i == 1) {
        unk998->unkD4[1] += 0x800;
    }

    if (i == 3) {
        unk998->unkD4[3] -= 0x800;
    }

    s = &unk998->sprites[i];
    s->prevVariant = -1;
    s->x = Q_24_8_TO_INT(unk998->unkC4[i]) - gCamera.x;
    s->y = Q_24_8_TO_INT(unk998->unkD4[i]) - gCamera.y;

    if (GRAVITY_IS_INVERTED) {
        s->unk10 |= SPRITE_FLAG_MASK_Y_FLIP;
    } else {
        s->unk10 &= ~SPRITE_FLAG_MASK_Y_FLIP;
    }

    UpdateSpriteAnimation(s);
    unk998->unkC0 |= (1 << i);
}

static void sub_8086CBC(struct Task *t)
{
    u8 i;
    HeartParticles *unk998 = TaskGetStructPtr(t);

    for (i = 0; i < 4; i++) {
        VramFree(unk998->sprites[i].graphics.dest);
    }
}
