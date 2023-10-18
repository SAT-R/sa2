#include "global.h"
#include "core.h"
#include "task.h"
#include "game/game.h"

#include "constants/animations.h"

typedef struct {
    u8 filler0[0xC];
    u8 count;
} AmyHeartParams;

typedef struct {
    /* 0x000 */ Sprite sprHearts[4];
    /* 0x0C0 */ AmyHeartParams params[4];
    /* 0x100 */ u16 unk100;
    /* 0x102 */ u16 unk102;
    /* 0x104 */ u16 kind;
    /* 0x106 */ u16 unk106;
    /* 0x108 */ u16 unk108;
    /* 0x10A */ u16 unk10A;
} AmyAtkHearts; /* size: 0x10C */

void Task_8015CE4(void);
void TaskDestructor_8015FF0(struct Task *);

extern const u16 gUnknown_080D6736[115][2];

void CreateAmyAttackHeartEffect(u16 kind)
{
    u8 i;

    if (IS_MULTI_PLAYER) {
        return;
    }

    if (gPlayer.character != CHARACTER_AMY) {
        return;
    }

    if ((gPlayer.unk64 == SA2_CHAR_ANIM_15)
        || (gPlayer.unk64 == SA2_CHAR_ANIM_INSTA_SHIELD_2)
        || (gPlayer.unk64 == SA2_CHAR_ANIM_36)) {
        struct Task *t = TaskCreate(Task_8015CE4, sizeof(AmyAtkHearts), 0x3001, 0,
                                    TaskDestructor_8015FF0);
        AmyAtkHearts *heart = TaskGetStructPtr(t);

        heart->unk100 = gUnknown_080D6736[gPlayer.unk64][0];
        heart->unk102 = gUnknown_080D6736[gPlayer.unk64][1];

        if (gPlayer.unk64 < 80) {
            heart->unk100 += gPlayerCharacterIdleAnims[gPlayer.character];
        }

        heart->kind = kind;
        heart->unk106 = 0;
        heart->unk108 = 0;
        heart->unk10A = 0;

        for (i = 0; i < 4; i++) {
            heart->params[i].count = 0;
        }
    }
}