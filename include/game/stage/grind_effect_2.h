#ifndef GUARD_GAME_2_H
#define GUARD_GAME_2_H

#include "global.h"
#include "sprite.h"

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ u8 fillerC[0x4];
    /* 0x10 */ s16 unk10;
    /* 0x12 */ u16 unk12;
    /* 0x14 */ u16 unk14;
    /* 0x16 */ AnimId playerAnim;
    /* 0x18 */ u16 playerVariant;
    /* 0x1A */ u8 unk1A;
    /* 0x1C */ Sprite s;
    /* 0x4C */ SpriteTransform transform;
} TaskStrc_801F15C; /* size: 0x58 */

extern struct Task *sub_801F15C(s16, s16, u8, s8, TaskMain, TaskDestructor);
extern void TaskDestructor_801F550(struct Task *);

void CreateGrindEffect2(void);

struct Task *CreateStageGoalBonusPointsAnim(s32, s32, u16);
void Task_801F214(void);

#endif // GUARD_GAME_2_H