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
    Sprite *sprite;

    for (i = 0; i < 4; i++) {
        sprite = &unk998->sprites[i];
        sprite->graphics.dest = VramMalloc(10);
        sprite->graphics.anim = SA2_ANIM_HEART;
        sprite->variant = 0;
        sprite->unk21 = 0xFF;
        sprite->x = -20;
        sprite->y = 0;
        sprite->unk1A = 0x180;
        sprite->graphics.size = 0;
        sprite->animCursor = 0;
        sprite->unk1C = 0;
        sprite->unk22 = 0x10;
        sprite->palId = 0;
        sprite->unk10 = 0x2000;
    }
}

static void sub_8086A88(void)
{
    u8 i;
    HeartParticles *unk998 = TaskGetStructPtr(gCurTask);
    Sprite *sprite;

    for (i = 0; i < NUM_HEARTS; i++) {
        sprite = &unk998->sprites[i];
        sprite->x = gPlayer.unk90->s.x;
        sprite->y = gPlayer.unk90->s.y;
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
    Sprite *sprite;

    if (unk998->unkE4 != 0 && unk998->unkC0 == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    for (i = 0; i < NUM_HEARTS; i++) {
        if (unk998->unkC0 & j) {
            sprite = &unk998->sprites[i];
            sprite->x = Q_24_8_TO_INT(unk998->unkC4[i]) - gCamera.x;
            sprite->y = Q_24_8_TO_INT(unk998->unkD4[i]) - gCamera.y;

            if (sub_8004558(sprite) == 0) {
                unk998->unkC0 &= ~(1 << i);
            } else {
                sub_80051E8(sprite);
            }
        }
        j <<= 1;
    }
}

static void sub_8086BE8(u8 i)
{
    Sprite *sprite;
    HeartParticles *unk998 = TaskGetStructPtr(gCurTask);

    unk998->unkC4[i] = gPlayer.x;
    unk998->unkD4[i] = gPlayer.y;

    if (i == 1) {
        unk998->unkD4[1] += 0x800;
    }

    if (i == 3) {
        unk998->unkD4[3] -= 0x800;
    }

    sprite = &unk998->sprites[i];
    sprite->unk21 = -1;
    sprite->x = Q_24_8_TO_INT(unk998->unkC4[i]) - gCamera.x;
    sprite->y = Q_24_8_TO_INT(unk998->unkD4[i]) - gCamera.y;

    if (GRAVITY_IS_INVERTED) {
        sprite->unk10 |= SPRITE_FLAG_MASK_Y_FLIP;
    } else {
        sprite->unk10 &= ~SPRITE_FLAG_MASK_Y_FLIP;
    }

    sub_8004558(sprite);
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
