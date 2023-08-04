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
    /* 0x40 */ u8 *numCreatedParts;
} Sprite_BossParts; /* size: 0x44 */

typedef struct {
    /* 0x00 */ void *vram;
    /* 0x04 */ u32 unk4;
    /* 0x08 */ AnimId anim;
    /* 0x0A */ u16 variant;
    /* 0x0C */ u16 unkC;
    /* 0x0E */ u16 unkE;
    /* 0x10 */ u8 filler10[0x4];
    /* 0x14 */ s32 unk14;
    /* 0x18 */ s32 unk18;
    /* 0x1C */ s16 unk1C;
} BossParts;

void sub_8039B54(BossParts *p0, u8 *p1);

#endif // GUARD_GAME_BOSSES_COMMON_H