#ifndef GUARD_GAME_BOSSES_COMMON_H
#define GUARD_GAME_BOSSES_COMMON_H

#include "global.h"
#include "core.h"

extern struct Task *gActiveBossTask;
typedef void (*TranslateBossFunction)(s32, s32);

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 posX;
    /* 0x34 */ s32 posY;
    /* 0x38 */ s16 accelX;
    /* 0x3A */ s16 accelY;
    /* 0x3C */ u16 velocityY;
    /* 0x40 */ u8 *numCreatedParts;
} Sprite_ExplosionParts; /* size: 0x44 */

typedef struct {
    /* 0x00 */ void *vram;
    /* 0x04 */ u32 unk4;
    /* 0x08 */ AnimId anim;
    /* 0x0A */ u16 variant;
    /* 0x0C */ u16 rotation;
    /* 0x0E */ u16 speed;
    /* 0x10 */ u8 filler10[0x4];
    /* 0x14 */ s32 spawnX;
    /* 0x18 */ s32 spawnY;
    /* 0x1C */ s16 velocity;
} ExplosionPartsInfo;

void CreateBossParticleWithExplosionUpdate(ExplosionPartsInfo *p0, u8 *numCreatedParts);
void Task_DestroyBossParts(void);
void sub_8039ED4(void);

extern const u32 gUnknown_080D79D0[][3];

#endif // GUARD_GAME_BOSSES_COMMON_H