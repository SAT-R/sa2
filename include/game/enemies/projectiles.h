#ifndef GUARD_ENEMY_PROJECTILE_H
#define GUARD_ENEMY_PROJECTILE_H

/* TODO: move to projectile file */
typedef struct {
    u16 numTiles;
    AnimId anim;
    u8 variant;
    u16 unk6;
    s16 unk8;
    u16 unkA;
    s32 x;
    s32 y;
} ProjInit;
extern void CreateProjectile(ProjInit *init);

#endif // GUARD_ENEMY_PROJECTILE_H