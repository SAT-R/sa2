#ifndef GUARD_GAME_BOSSES_COMMON_H
#define GUARD_GAME_BOSSES_COMMON_H

#include "global.h"
#include "core.h"

extern struct Task *gActiveBossTask;
typedef void (*TranslateBossFunction)(s32, s32);

typedef enum {
    BOSS_EGG_HAMMER_TANK_II = 0,
    BOSS_EGG_BOMBER_TANK = 1,
    BOSS_EGG_TOTEM = 2,
    BOSS_AERO_EGG = 3,
    BOSS_EGG_SAUCER = 4,
    BOSS_EGG_GO_ROUND = 5,
    BOSS_EGG_FROG = 6,
    BOSS_SUPER_EGG_ROBO_Z = 7,
    BOSS_TRUE_AREA_53_BOSS = 8
} EBoss;

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
} ExplosionPartsInfo; /* size: 0x20 */

// Use EBoss enum when calling with constants
void CreateZoneBoss(u8 boss);
void CreateBossParticleWithExplosionUpdate(ExplosionPartsInfo *p0, u8 *numCreatedParts);
void Task_DestroyBossParts(void);
void sub_8039ED4(void);

extern const u32 gTileInfoBossScrews[][3];

#endif // GUARD_GAME_BOSSES_COMMON_H