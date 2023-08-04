#ifndef GUARD_GAME_BOSSES_COMMON_H
#define GUARD_GAME_BOSSES_COMMON_H

extern struct Task *gActiveBossTask;
typedef void (*UnknownBossFunc)(s32, s32);

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 unk30;
    /* 0x34 */ s32 unk34;
    /* 0x38 */ s16 unk38;
    /* 0x3A */ s16 unk3A;
    /* 0x3C */ u16 unk3C;
    /* 0x40 */ u8 *p1;
} Sprite_BossCommon; /* size: 0x44 */

#endif // GUARD_GAME_BOSSES_COMMON_H