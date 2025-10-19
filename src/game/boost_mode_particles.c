#include "global.h"
#include "core.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "game/math.h"
#include "game/boost_mode_particles.h"
#include "trig.h"

#include "constants/animations.h"

#define NUM_PARTICLES 16

struct BoostModeParticles {
    Sprite unk0;
    Sprite unk30;
    u16 frame;
    s16 positions[NUM_PARTICLES][2];
    s16 accelerations[NUM_PARTICLES][2];
    s16 unkE2;
    s16 unkE4;
};

void sub_8089E54(void);
void sub_808A0A4(void);
void sub_808A234(struct Task *);

void CreateBoostModeParticles(void)
{
    s32 i;
    struct Task *t = TaskCreate(sub_8089E54, sizeof(struct BoostModeParticles), 0x5050, 0, sub_808A234);
    struct BoostModeParticles *particles = TASK_DATA(t);
    Sprite *s = &particles->unk0;

    particles->frame = 0;
    s->graphics.dest = VramMalloc(1);
    s->graphics.anim = SA2_ANIM_SONIC_BOOM_PARTICLES;
    s->variant = 0;
    s->graphics.size = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->frameFlags = 0x2000;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    UpdateSpriteAnimation(s);

    s = &particles->unk30;
    s->graphics.dest = VramMalloc(1);
    s->graphics.anim = SA2_ANIM_SONIC_BOOM_PARTICLES;
    s->variant = 1;
    s->graphics.size = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->frameFlags = 0x2000;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;

    SeedRng(gPlayer.qWorldX, gCamera.x);

    for (i = 0; i < NUM_PARTICLES; i++) {
        u8 temp1;
        s32 rand, var;
        particles->positions[i][1] = (Random() & 0x7FF) + Q(16);
        if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
#ifndef NON_MATCHING
            u32 z = (u32)gPlayer.rotation << 0x18;
            temp1 = (z + 0xC0000000) >> 0x18;
            asm("" ::: "memory");
#else
            temp1 = gPlayer.rotation + 192;
#endif
            particles->positions[i][0] = Q_MUL(COS_24_8(((gPlayer.rotation + 128) & 0xFF) * 4), particles->positions[i][1]);
            particles->positions[i][1] = Q_MUL(SIN_24_8(((gPlayer.rotation + 128) & 0xFF) * 4), particles->positions[i][1]);

        } else {
            temp1 = gPlayer.rotation + 64;
            particles->positions[i][0] = Q_MUL(COS_24_8(gPlayer.rotation * 4), particles->positions[i][1]);
            particles->positions[i][1] = Q_MUL(SIN_24_8(gPlayer.rotation * 4), particles->positions[i][1]);
        }
#ifndef NON_MATCHING
        {
            register s32 ip asm("ip");
            rand = ((s32(*)(void))Random)();
            ip = 0x3ff;
            particles->accelerations[i][0] = Q_MUL(COS_24_8(temp1 * 4), (var = (rand & ip) + 512));
            particles->accelerations[i][1] = Q_MUL(SIN_24_8(temp1 * 4), var);
        }
#else
        rand = Random();
        particles->accelerations[i][0] = Q_MUL(COS_24_8(temp1 * 4), ((rand & 0x3FF) + 512));
        particles->accelerations[i][1] = Q_MUL(SIN_24_8(temp1 * 4), var);
#endif
    }
}

void sub_8089E54(void)
{
    s32 i;
    struct BoostModeParticles *particles = TASK_DATA(gCurTask);
    Sprite *s;
    UpdateSpriteAnimation(&particles->unk0);

    for (i = 0; i < NUM_PARTICLES / 2; i++) {
        if (i & 1) {
            particles->positions[i][0] += particles->accelerations[i][0];
            particles->positions[i][1] += particles->accelerations[i][1];
        } else {
            particles->positions[i][0] -= particles->accelerations[i][0];
            particles->positions[i][1] -= particles->accelerations[i][1];
        }

        particles->accelerations[i][0] = Q_MUL(particles->accelerations[i][0], Q(0.78125));
        particles->accelerations[i][1] = Q_MUL(particles->accelerations[i][1], Q(0.78125));
        s = &particles->unk0;
        s->x = I(gPlayer.qWorldX) - gCamera.x + I(particles->positions[i][0]);
        s->y = I(gPlayer.qWorldY) - gCamera.y + I(particles->positions[i][1]);
        DisplaySprite(s);
    }

    if (particles->frame++ > 8) {
        s->variant = 1;
        SeedRng(gPlayer.qWorldX, gCamera.x);

        for (i = 0; i < NUM_PARTICLES; i++) {
            u8 temp;
            s16 rand;
            particles->unkE2 = 128;
            particles->unkE4 = 0;
            if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
                temp = Random();
                temp += 64;
                particles->unkE2 = COS_24_8(((gPlayer.rotation + 128) & 0xFF) * 4) * 4;
                particles->unkE4 = SIN_24_8(((gPlayer.rotation + 128) & 0xFF) * 4) * 4;
            } else {
                temp = Random();
                particles->unkE2 = COS_24_8(gPlayer.rotation * 4) * 4;
                particles->unkE4 = SIN_24_8(gPlayer.rotation * 4) * 4;
            }

            rand = (Random() & 0x3FF);
            particles->accelerations[i][0] = Q_MUL(COS_24_8(temp * 4), (rand + Q(6)));
            particles->accelerations[i][1] = Q_MUL(SIN_24_8(temp * 4), (rand + Q(6)));
        }

        gCurTask->main = sub_808A0A4;
    }
}

void sub_808A0A4(void)
{
    s32 i;
    struct BoostModeParticles *particles = TASK_DATA(gCurTask);
    Sprite *s = &particles->unk0;

    if (particles->frame++ > 24) {
        TaskDestroy(gCurTask);
        return;
    }

    for (i = 0; i < NUM_PARTICLES; i++) {
        particles->positions[i][0] += particles->accelerations[i][0];
        particles->positions[i][1] += particles->accelerations[i][1];

        particles->positions[i][0] -= particles->unkE2;
        particles->positions[i][1] -= particles->unkE4;

        particles->accelerations[i][0] = Q_MUL(particles->accelerations[i][0], Q(0.78125));
        particles->accelerations[i][1] = Q_MUL(particles->accelerations[i][1], Q(0.78125));

        particles->unkE2 = Q_MUL(particles->unkE2, Q(1.00390625));
        particles->unkE4 = Q_MUL(particles->unkE4, Q(1.00390625));
    }

    for (i = 0; i < (NUM_PARTICLES / 2); i++) {
        s = &particles->unk0;
        if (particles->frame & 1) {
            s->x = (I(gPlayer.qWorldX) - gCamera.x) + I(particles->positions[i][0]);
            s->y = (I(gPlayer.qWorldY) - gCamera.y) + I(particles->positions[i][1]);
            UpdateSpriteAnimation(s);

        } else {
            s->x = (I(gPlayer.qWorldX) - gCamera.x) + I(particles->positions[i + (NUM_PARTICLES / 2)][0]);
            s->y = (I(gPlayer.qWorldY) - gCamera.y) + I(particles->positions[i + (NUM_PARTICLES / 2)][1]);
        }
        DisplaySprite(s);
    }
}

void sub_808A234(struct Task *t)
{
    struct BoostModeParticles *particles = TASK_DATA(t);
    Sprite *s = &particles->unk0;
    VramFree(s->graphics.dest);
    s++;
    VramFree(s->graphics.dest);
}
