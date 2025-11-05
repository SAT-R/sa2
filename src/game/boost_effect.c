#include "global.h"
#include "core.h"
#include "flags.h"
#include "malloc_vram.h"

#include "game/sa1_sa2_shared/globals.h"

#include "data/sprite_data.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/boost_effect.h"

#include "constants/animations.h"
#include "constants/anim_commands.h"
#include "constants/zones.h"

// TODO: Rename struct!
typedef struct {
    /* 0x00 */ AnimId anim;
    /* 0x02 */ u16 variant;
    /* 0x04 */ s32 flags;
    /* 0x08 */ s32 moveState;
    /* 0x0C */ u16 unkC;
    /* 0x0E */ u8 animSpeed;
} PlayerState;

#define BE_BUFFER_SIZE 16

#define BE_RING_INDEX(_bufferName, _num) ((_bufferName##Index + (_num)) % (unsigned)ARRAY_COUNT(_bufferName))

#define ADD_BE_INDEX(_bufferName, _num) _bufferName##Index = BE_RING_INDEX(_bufferName, (_num))

#define INC_BE_INDEX(_bufferName) ADD_BE_INDEX(_bufferName, 1)

#define DEC_BE_INDEX(_bufferName) ADD_BE_INDEX(_bufferName, -1)

// Ring Buffers storing the
static PlayerState ALIGNED(16) sPlayerStateBuffer[BE_BUFFER_SIZE] = { 0 };
static Vec2_32 sPlayerPosBuffer[BE_BUFFER_SIZE] = { 0 };
static u8 ALIGNED(4) sPlayerStateBufferIndex = 0;
static u8 ALIGNED(4) sPlayerPosBufferIndex = 0;

const u8 gUnknown_080D5674[3] = { 2, 4, 6 };

const AnimId sCharacterPalettesBoostEffect[NUM_CHARACTERS] = {
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_BOOST_PALETTE, CHARACTER_SONIC), SA2_ANIM_CHAR(SA2_CHAR_ANIM_BOOST_PALETTE, CHARACTER_CREAM),
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_BOOST_PALETTE, CHARACTER_TAILS), SA2_ANIM_CHAR(SA2_CHAR_ANIM_BOOST_PALETTE, CHARACTER_KNUCKLES),
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_BOOST_PALETTE, CHARACTER_AMY),
};

void sub_801561C(void)
{
    s16 i;
    AnimId oldPlayerAnim = gPlayer.anim;
    u16 oldPlayerVariant = gPlayer.variant;
    u32 oldPlayerMovestate = gPlayer.moveState;
    PlayerSpriteInfo *unk5A70 = gPlayer.spriteInfoBody;
    u32 oldPlayerAnimSpeed = unk5A70->s.animSpeed;
    u32 oldPlayerUnk10 = unk5A70->s.frameFlags;
    u16 r6 = unk5A70->transform.rotation;

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

void BoostEffect_StorePlayerState(void)
{
    Player *p = &gPlayer;
    u32 oldMovestate = p->moveState;
    u32 i;

    INC_BE_INDEX(sPlayerStateBuffer);
    i = sPlayerStateBufferIndex;

    oldMovestate &= ~MOVESTATE_80000000;

    if (GRAVITY_IS_INVERTED) {
        oldMovestate |= MOVESTATE_80000000;
    }

    sPlayerStateBuffer[i].anim = p->anim;
    sPlayerStateBuffer[i].variant = p->variant;
    sPlayerStateBuffer[i].moveState = oldMovestate;
    sPlayerStateBuffer[i].animSpeed = p->spriteInfoBody->s.animSpeed;
    sPlayerStateBuffer[i].flags = p->spriteInfoBody->s.frameFlags;
    sPlayerStateBuffer[i].unkC = p->spriteInfoBody->transform.rotation;
}

void sub_8015750(void)
{
    s32 playerX = gPlayer.qWorldX;
    s32 playerY = gPlayer.qWorldY;
    s16 i;

    for (i = 0; i < (s32)ARRAY_COUNT(sPlayerPosBuffer); i++) {
        sPlayerPosBuffer[i].x = playerX;
        sPlayerPosBuffer[i].y = playerY;
    }

    sPlayerPosBufferIndex = 0;
}

void BoostEffect_StorePlayerPos(void)
{
    u32 index;

    INC_BE_INDEX(sPlayerPosBuffer);
    index = sPlayerPosBufferIndex;
    sPlayerPosBuffer[index].x = gPlayer.qWorldX;
    sPlayerPosBuffer[index].y = gPlayer.qWorldY;
}

void GetPreviousPlayerPos(Vec2_32 *pos, u8 pastFrameDelta)
{
    s32 index = BE_RING_INDEX(sPlayerPosBuffer, -pastFrameDelta);
    pos->x = sPlayerPosBuffer[index].x;
    pos->y = sPlayerPosBuffer[index].y;
}

void GetPreviousFramePlayerState(PlayerState *state, u8 pastFrameDelta)
{
    s32 index = BE_RING_INDEX(sPlayerStateBuffer, -pastFrameDelta);
    state->anim = sPlayerStateBuffer[index].anim;
    state->variant = sPlayerStateBuffer[index].variant;
    state->moveState = sPlayerStateBuffer[index].moveState;
    state->animSpeed = sPlayerStateBuffer[index].animSpeed;
    state->flags = sPlayerStateBuffer[index].flags;
    state->unkC = sPlayerStateBuffer[index].unkC;
}

typedef struct {
    /* 0x00 */ SpriteTransform transform;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 filler3C[0x8];
    /* 0x44 */ Vec2_32 pos;
    /* 0x4C */ PlayerState plState;
    /* 0x5C */ u8 unk5C;
    /* 0x5D */ u8 unk5D;
} PlayerActions; /* size: 0x60 */

void Task_80159C8(void);
void TaskDestructor_8015B50(struct Task *);

static inline void sub_8015B64_inline(AnimId anim, u16 palId)
{
    const s32 *pAnim = (const s32 *)*gAnimations[anim];

    if (*pAnim++ == ANIM_CMD__PALETTE) {
        u32 animPalId;
        u16 numColors, insertOffset;

        animPalId = *pAnim++;
        insertOffset = (*pAnim >> 16);
#ifndef BUG_FIX
        // This only works on GBA because it's specifically using a 32bit DMA below and for that, addresses are aligned to the last word.
        // We can assume that this was supposed to be 'insertOffset += (palId * 16)', but that is taken care of by the animation data.
        insertOffset += palId;
#endif
        numColors = *pAnim % 256u;

        DmaCopy32(3, &gRefSpriteTables->palettes[animPalId * 16], &gObjPalette[insertOffset], numColors * sizeof(u16));

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    }
}

void CreateBoostEffectTasks(void)
{
    Sprite *s;
    u8 i;

    if (IS_SINGLE_PLAYER && !gUnknown_030055BC && !IS_BOSS_STAGE(gCurrentLevel)) {
        gUnknown_030055BC = TRUE;

        for (i = 0; i < ARRAY_COUNT(gUnknown_080D5674); i++) {
            struct Task *t = TaskCreate(Task_80159C8, sizeof(PlayerActions), 0x4000, 0, TaskDestructor_8015B50);
            PlayerActions *actions = TASK_DATA(t);

            actions->unk5C = i;
            actions->unk5D = 0;

            s = &actions->s;
            s->graphics.dest = VramMalloc(64);
            s->oamFlags = SPRITE_OAM_ORDER(16);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->hitboxes[0].index = -1;
            s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
            s->palId = 1;
            s->graphics.anim = 0;
            s->variant = 0;
            s->x = 0;
            s->y = 0;

            actions->transform.qScaleY = +Q(1);
        }

        if (s->palId != 0) {
            sub_8015B64_inline(sCharacterPalettesBoostEffect[gPlayer.character], s->palId);
        }
    }
}

void Task_80159C8(void)
{
    PlayerActions *actions = TASK_DATA(gCurTask);
    Sprite *s = &actions->s;
    SpriteTransform *transform = &actions->transform;

#ifndef NON_MATCHING
    register u32 r8 asm("r8") = gUnknown_080D5674[actions->unk5C];
#else
    u32 r8 = gUnknown_080D5674[actions->unk5C];
#endif

    if (!(gPlayer.moveState & MOVESTATE_4000000)) {
        if (gPlayer.moveState & MOVESTATE_GOAL_REACHED) {
            TaskDestroy(gCurTask);
            gUnknown_030055BC = FALSE;
            return;
        }
    }

    if (PLAYER_IS_ALIVE) {
        if (gPlayer.isBoosting || (gPlayer.moveState & MOVESTATE_BOOST_EFFECT_ON)) {
#ifndef NON_MATCHING
            register PlayerState *pls asm("r0") = &actions->plState;
#else
            PlayerState *pls = &actions->plState;
#endif
            GetPreviousFramePlayerState(pls, r8);

            s->graphics.anim = actions->plState.anim;
            s->variant = actions->plState.variant;
            s->animSpeed = actions->plState.animSpeed;
            s->frameFlags = actions->plState.flags;

            transform->rotation = actions->plState.unkC;
            s->frameFlags |= SPRITE_FLAG(18, 1);

            GetPreviousPlayerPos(&actions->pos, r8);
            s->x = I(actions->pos.x) - gCamera.x;
            s->y = I(actions->pos.y) - gCamera.y;

            transform->x = s->x;
            transform->y = s->y;
            UpdateSpriteAnimation(s);

            if (SPRITE_FLAG_GET(s, ROT_SCALE_ENABLE)) {
                SPRITE_FLAG_CLEAR(s, ROT_SCALE);
                s->frameFlags |= (gOamMatrixIndex++) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

                if (actions->plState.moveState & MOVESTATE_FACING_LEFT) {
                    transform->qScaleX = +Q(1);
                } else {
                    transform->qScaleX = -Q(1);
                }

                actions->plState.moveState &= MOVESTATE_80000000;

                if (actions->plState.moveState) {
                    transform->qScaleX = -transform->qScaleX;
                }

                TransformSprite(s, transform);
            } else {
                SPRITE_FLAG_CLEAR(s, ROT_SCALE_ENABLE);
            }

            if (++actions->unk5D > 2) {
                actions->unk5D = 0;
            }

            if (actions->unk5D == actions->unk5C) {
                DisplaySprite(s);
            }
        }
    }
}

void TaskDestructor_8015B50(struct Task *t)
{
    PlayerActions *actions = TASK_DATA(t);
    VramFree(actions->s.graphics.dest);
}

void sub_8015B64(AnimId anim, u16 palId) { sub_8015B64_inline(anim, palId); }
