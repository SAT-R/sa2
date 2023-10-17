#include "global.h"
#include "core.h"
#include "game/game.h"
#include "game/player_actions.h"

#include "constants/animations.h"

// TODO: Rename struct!
typedef struct {
    /* 0x00 */ AnimId anim;
    /* 0x02 */ u16 variant;
    /* 0x04 */ s32 flags;
    /* 0x08 */ s32 moveState;
    /* 0x0C */ u16 unkC;
    /* 0x0E */ u8 animSpeed;
} PlActions;

extern PlActions gUnknown_030056B0[16];
extern u8 gUnknown_03005830;

void sub_801561C(void)
{
    s16 i;
    AnimId oldPlayerAnim = gPlayer.anim;
    u16 oldPlayerVariant = gPlayer.variant;
    u32 oldPlayerMovestate = gPlayer.moveState;
    UNK_3005A70 *unk5A70 = gPlayer.unk90;
    u32 oldPlayerAnimSpeed = unk5A70->s.animSpeed;
    u32 oldPlayerUnk10 = unk5A70->s.unk10;
    u16 r6 = unk5A70->unk0[0];

    oldPlayerMovestate &= ~MOVESTATE_80000000;

    if (GRAVITY_IS_INVERTED) {
        oldPlayerMovestate |= MOVESTATE_80000000;
    }

    for (i = 0; i < (s32)ARRAY_COUNT(gUnknown_030056B0); i++) {
        gUnknown_030056B0[i].anim = oldPlayerAnim;
        gUnknown_030056B0[i].variant = oldPlayerVariant;
        gUnknown_030056B0[i].moveState = oldPlayerMovestate;
        gUnknown_030056B0[i].animSpeed = oldPlayerAnimSpeed;
        gUnknown_030056B0[i].flags = oldPlayerUnk10;
        gUnknown_030056B0[i].unkC = r6;
    }

    gUnknown_03005830 = 0;
}

void sub_80156D0(void)
{
    Player *p = &gPlayer;
    u32 oldMovestate = p->moveState;
    u8 i;

    gUnknown_03005830 = (gUnknown_03005830 + 1) & 0xF;
    i = gUnknown_03005830;

    oldMovestate &= ~MOVESTATE_80000000;

    if (GRAVITY_IS_INVERTED) {
        oldMovestate |= MOVESTATE_80000000;
    }

    gUnknown_030056B0[i].anim = p->anim;
    gUnknown_030056B0[i].variant = p->variant;
    gUnknown_030056B0[i].moveState = oldMovestate;
    gUnknown_030056B0[i].animSpeed = p->unk90->s.animSpeed;
    gUnknown_030056B0[i].flags = p->unk90->s.unk10;
    gUnknown_030056B0[i].unkC = p->unk90->unk0[0];
}