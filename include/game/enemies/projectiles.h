#ifndef GUARD_ENEMY_PROJECTILE_H
#define GUARD_ENEMY_PROJECTILE_H

/* TODO: move to projectile file */
typedef struct {
    /* 0x00 */ u16 numTiles;
    /* 0x02 */ AnimId anim;
    /* 0x04 */ u8 variant;
    /* 0x06 */ u16 rot;
    /* 0x08 */ s16 speed;
    /* 0x0C */ s32 x;
    /* 0x10 */ s32 y;
} ProjInit;
extern void CreateProjectile(ProjInit *init);

#endif // GUARD_ENEMY_PROJECTILE_H