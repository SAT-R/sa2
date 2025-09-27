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
    u16 unk60;
    s16 unk62[NUM_PARTICLES][2];
    s16 unkA2[NUM_PARTICLES][2];
    s16 unkE2;
    s16 unkE4;
    u16 fillerE6;
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

    particles->unk60 = 0;
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
        particles->unk62[i][1] = (Random() & 0x7FF) + Q(16);
        if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
#ifndef NON_MATCHING
            u32 z = (u32)gPlayer.rotation << 0x18;
            temp1 = (z + 0xC0000000) >> 0x18;
            asm("" ::: "memory");
#else
            temp1 = gPlayer.rotation + 0xC0;
#endif
            particles->unk62[i][0] = Q_MUL((COS_24_8(((gPlayer.rotation + 128) & 0xFF) * 4)), particles->unk62[i][1]);
            particles->unk62[i][1] = Q_MUL((SIN_24_8(((gPlayer.rotation + 128) & 0xFF) * 4)), particles->unk62[i][1]);

        } else {
            temp1 = gPlayer.rotation + 64;
            particles->unk62[i][0] = Q_MUL(COS_24_8(gPlayer.rotation * 4), particles->unk62[i][1]);
            particles->unk62[i][1] = Q_MUL(SIN_24_8(gPlayer.rotation * 4), particles->unk62[i][1]);
        }
#ifndef NON_MATCHING
        {
            register s32 ip asm("ip");
            rand = ((s32(*)(void))Random)();
            ip = 0x3ff;
            particles->unkA2[i][0] = Q_MUL(COS_24_8(temp1 * 4), (var = (rand & ip) + 512));
            particles->unkA2[i][1] = Q_MUL(SIN_24_8(temp1 * 4), var);
        }
#else
        rand = Random();
        particles->unkA2[i][0] = Q_MUL(COS_24_8(temp1 * 4), ((rand & 0x3FF) + 512));
        particles->unkA2[i][1] = Q_MUL(SIN_24_8(temp1 * 4), var);
#endif
    }
}

void sub_8089E54(void)
{
    s32 i;
    struct BoostModeParticles *particles = TASK_DATA(gCurTask);
    Sprite *s;
    UpdateSpriteAnimation(&particles->unk0);

    for (i = 0; i < 8; i++) {
        if (i & 1) {
            particles->unk62[i][0] += particles->unkA2[i][0];
            particles->unk62[i][1] += particles->unkA2[i][1];
        } else {
            particles->unk62[i][0] -= particles->unkA2[i][0];
            particles->unk62[i][1] -= particles->unkA2[i][1];
        }

        particles->unkA2[i][0] = I(particles->unkA2[i][0] * 200);
        particles->unkA2[i][1] = I(particles->unkA2[i][1] * 200);
        s = &particles->unk0;
        s->x = I(gPlayer.qWorldX) - gCamera.x + I(particles->unk62[i][0]);
        s->y = I(gPlayer.qWorldY) - gCamera.y + I(particles->unk62[i][1]);
        DisplaySprite(s);
    }

    if (particles->unk60++ > 8) {
        s->variant = 1;
        SeedRng(gPlayer.qWorldX, gCamera.x);

        for (i = 0; i < NUM_PARTICLES; i++) {
            u8 temp;
            s16 rand;
            particles->unkE2 = 0x80;
            particles->unkE4 = 0;
            if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
                temp = Random();
                temp += 64;
                particles->unkE2 = (gSineTable[((gPlayer.rotation + 0x80) & 0xFF) * 4 + 0x100] >> 6) << 2;
                particles->unkE4 = (gSineTable[((gPlayer.rotation + 0x80) & 0xFF) * 4] >> 6) << 2;
            } else {
                temp = Random();
                particles->unkE2 = (gSineTable[(gPlayer.rotation * 4) + 0x100] >> 6) << 2;
                particles->unkE4 = (gSineTable[gPlayer.rotation * 4] >> 6) << 2;
            }

            rand = (Random() & 0x3FF);
            particles->unkA2[i][0] = ((gSineTable[temp * 4 + 0x100] >> 6) * (rand + 0x600)) >> 8;
            particles->unkA2[i][1] = ((rand + 0x600) * (gSineTable[temp * 4] >> 6)) >> 8;
        }

        gCurTask->main = sub_808A0A4;
    }
}

void sub_808A0A4(void)
{
    s32 i;
    struct BoostModeParticles *particles = TASK_DATA(gCurTask);
    Sprite *s = &particles->unk0;

    if (particles->unk60++ > 0x18) {
        TaskDestroy(gCurTask);
        return;
    }

    for (i = 0; i < NUM_PARTICLES; i++) {
        particles->unk62[i][0] += particles->unkA2[i][0];
        particles->unk62[i][1] += particles->unkA2[i][1];

        particles->unk62[i][0] -= particles->unkE2;
        particles->unk62[i][1] -= particles->unkE4;

        particles->unkA2[i][0] = (particles->unkA2[i][0] * 200) >> 8;
        particles->unkA2[i][1] = (particles->unkA2[i][1] * 200) >> 8;

        particles->unkE2 = (particles->unkE2 * 0x101) >> 8;
        particles->unkE4 = (particles->unkE4 * 0x101) >> 8;
    }

    for (i = 0; i < 8; i++) {
        s = &particles->unk0;
        if (particles->unk60 & 1) {
            s->x = (I(gPlayer.qWorldX) - gCamera.x) + (particles->unk62[i][0] >> 8);
            s->y = (I(gPlayer.qWorldY) - gCamera.y) + (particles->unk62[i][1] >> 8);
            UpdateSpriteAnimation(s);

        } else {
            s->x = (I(gPlayer.qWorldX) - gCamera.x) + (particles->unk62[i + 8][0] >> 8);
            s->y = (I(gPlayer.qWorldY) - gCamera.y) + (particles->unk62[i + 8][1] >> 8);
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
