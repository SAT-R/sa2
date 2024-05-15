#ifndef GUARD_GAME_BOSS_9_H
#define GUARD_GAME_BOSS_9_H

extern void CreateTrueArea53Boss(void);
extern bool32 ExtraBossIsDead(void);
extern void sub_804D594(s32, s32);

typedef struct {
    void *func;
    void *ref;
    u16 unk4;
} TA53_Data0;

typedef struct {
    u8 filler0[0x10];
    // flags
    u16 unk10;
} Sprite_TrueArea53Boss; /* size: 0x940 */

#endif // GUARD_GAME_BOSS_9_H