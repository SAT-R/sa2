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
} PlayerState;

#define PL_ACTIONS_BUFFER_SIZE 16

#define PL_ACTIONS_RING_INDEX(_bufferName, _num)                                        \
    ((_bufferName##Index + (_num)) % (unsigned)ARRAY_COUNT(_bufferName))

#define ADD_PL_ACTIONS_INDEX(_bufferName, _num)                                         \
    _bufferName##Index = PL_ACTIONS_RING_INDEX(_bufferName, (_num))

#define INC_PL_ACTIONS_INDEX(_bufferName) ADD_PL_ACTIONS_INDEX(_bufferName, 1)

#define DEC_PL_ACTIONS_INDEX(_bufferName) ADD_PL_ACTIONS_INDEX(_bufferName, -1)

// Ring Buffers storing the
extern PlayerState sPlayerStateBuffer[PL_ACTIONS_BUFFER_SIZE];
extern Vec2_32 sPlayerPosBuffer[PL_ACTIONS_BUFFER_SIZE];
extern u8 sPlayerStateBufferIndex;
extern u8 sPlayerPosBufferIndex;

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

    for (i = 0; i < (s32)ARRAY_COUNT(sPlayerStateBuffer); i++) {
        sPlayerStateBuffer[i].anim = oldPlayerAnim;
        sPlayerStateBuffer[i].variant = oldPlayerVariant;
        sPlayerStateBuffer[i].moveState = oldPlayerMovestate;
        sPlayerStateBuffer[i].animSpeed = oldPlayerAnimSpeed;
        sPlayerStateBuffer[i].flags = oldPlayerUnk10;
        sPlayerStateBuffer[i].unkC = r6;
    }

    sPlayerStateBufferIndex = 0;
}

void sub_80156D0(void)
{
    Player *p = &gPlayer;
    u32 oldMovestate = p->moveState;
    u32 i;

    INC_PL_ACTIONS_INDEX(sPlayerStateBuffer);
    i = sPlayerStateBufferIndex;

    oldMovestate &= ~MOVESTATE_80000000;

    if (GRAVITY_IS_INVERTED) {
        oldMovestate |= MOVESTATE_80000000;
    }

    sPlayerStateBuffer[i].anim = p->anim;
    sPlayerStateBuffer[i].variant = p->variant;
    sPlayerStateBuffer[i].moveState = oldMovestate;
    sPlayerStateBuffer[i].animSpeed = p->unk90->s.animSpeed;
    sPlayerStateBuffer[i].flags = p->unk90->s.unk10;
    sPlayerStateBuffer[i].unkC = p->unk90->unk0[0];
}

void sub_8015750(void)
{
    s32 playerX = gPlayer.x;
    s32 playerY = gPlayer.y;
    s16 i;

    for (i = 0; i < (s32)ARRAY_COUNT(sPlayerPosBuffer); i++) {
        sPlayerPosBuffer[i].x = playerX;
        sPlayerPosBuffer[i].y = playerY;
    }

    sPlayerPosBufferIndex = 0;
}

void sub_8015790(void)
{
    u32 index;

    INC_PL_ACTIONS_INDEX(sPlayerPosBuffer);
    index = sPlayerPosBufferIndex;
    sPlayerPosBuffer[index].x = gPlayer.x;
    sPlayerPosBuffer[index].y = gPlayer.y;
}

void GetPreviousPlayerPos(Vec2_32 *pos, u8 pastFrameDelta)
{
    s32 index = PL_ACTIONS_RING_INDEX(sPlayerPosBuffer, -pastFrameDelta);
    pos->x = sPlayerPosBuffer[index].x;
    pos->y = sPlayerPosBuffer[index].y;
}

void GetPreviousFramePlayerState(PlayerState *state, u8 pastFrameDelta)
{
    s32 index = PL_ACTIONS_RING_INDEX(sPlayerStateBuffer, -pastFrameDelta);
    state->anim = sPlayerStateBuffer[index].anim;
    state->variant = sPlayerStateBuffer[index].variant;
    state->moveState = sPlayerStateBuffer[index].moveState;
    state->animSpeed = sPlayerStateBuffer[index].animSpeed;
    state->flags = sPlayerStateBuffer[index].flags;
    state->unkC = sPlayerStateBuffer[index].unkC;
}