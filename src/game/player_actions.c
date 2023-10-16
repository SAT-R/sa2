#include "global.h"
#include "core.h"
#include "game/game.h"
#include "game/player_actions.h"

#include "constants/animations.h"

// TODO: Rename struct!
typedef struct {
    AnimId anim;
    u16 variant;
    s32 oldUnk10;
    s32 moveState;
    u16 unkC;
    u8 animSpeed;
} PlActions;

extern PlActions gUnknown_030056B0[16];
extern u8 gUnknown_03005830;

void sub_801561C(void)
{
    s16 i;
    AnimId oldPlayerAnim = gPlayer.anim; // sp00
    u16 oldPlayerVariant = gPlayer.variant; // sl
    u32 oldPlayerMovestate = gPlayer.moveState;
    UNK_3005A70 *unk5A70 = gPlayer.unk90;
    u32 oldPlayerAnimSpeed = unk5A70->s.animSpeed; // ip
    u32 oldPlayerUnk10 = unk5A70->s.unk10; // sp04
    u16 r6 = unk5A70->unk0[0];
    u8 *first;

    oldPlayerMovestate &= ~MOVESTATE_80000000;

    if (GRAVITY_IS_INVERTED) {
        oldPlayerMovestate |= MOVESTATE_80000000;
    }

    // _08015666
    for (i = 0; i < 16; i++) {
        gUnknown_030056B0[i].anim = oldPlayerAnim;
        gUnknown_030056B0[i].variant = oldPlayerVariant;
        gUnknown_030056B0[i].moveState = oldPlayerMovestate;
        gUnknown_030056B0[i].animSpeed = oldPlayerAnimSpeed;
        gUnknown_030056B0[i].oldUnk10 = oldPlayerUnk10;
        gUnknown_030056B0[i].unkC = r6;
    }

    gUnknown_03005830 = 0;
}
