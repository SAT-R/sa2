#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"

#include "game/amy_attack_heart_effect.h"
#include "game/sa1_sa2_shared/globals.h"
#include "game/stage/camera.h"
#include "game/stage/player.h"

#include "constants/animations.h"
#if (GAME == GAME_SA2)
#include "constants/char_states.h"
#endif

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u16 unkA;
    /* 0x0C */ u8 count;
} AmyHeartParams; /* size: 0x10 */

typedef struct {
    /* 0x000 */ Sprite sprHearts[AMY_ATTACK_HEART_SPRITE_COUNT];
    /* 0x0C0 */ AmyHeartParams params[AMY_ATTACK_HEART_SPRITE_COUNT];
#if (GAME == GAME_SA1)
    /* 0x100 */ s8 unk100;
    /* 0x101 */ s8 kind;
#elif (GAME == GAME_SA2)
    /* 0x100 */ u16 unk100;
    /* 0x102 */ u16 unk102;
    /* 0x104 */ u16 kind;
#endif
    /* 0x106 */ u16 unk106;
    /* 0x108 */ u16 unk108;
    /* 0x10A */ u16 unk10A;
} AmyAtkHearts; /* size: 0x10C */

void Task_AmyAttackHeartEffect(void);
void sub_8015E28(u16);
void TaskDestructor_AmyAttackHeartEffect(struct Task *);

ALIGNED(4)
const s16 sHeartOffsets[AMY_HEART_PATTERN_COUNT][8][3] = {
    [AMY_HEART_PATTERN_HAMMER_ATTACK] = {
        { 10, 0, -27 },
        { 12, 13, -22 },
        { 14, 23, -13 },
        { 16, 26, 0 },
        { -1, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
    },
    [AMY_HEART_PATTERN_B] = {
        { 10, 7, -27 },
        { 12, 20, -22 },
        { 14, 30, -13 },
        { 16, 33, 0 },
        { -1, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
    },
    [AMY_HEART_PATTERN_C] = {
        { 0, -10, -26 },
        { 4, 8, -27 },
        { 8, 22, -17 },
        { 12, 28, -1 },
        { 16, 23, 16 },
        { 20, 10, 26 },
        { -1, 0, 0 },
        { 0, 0, 0 },
    },
    [AMY_HEART_PATTERN_STOP_N_SLAM] = {
        { 2, 0, 4 },
        { 6, 19, 6 },
        { 10, 28, 2 },
        { 14, 19, 4 },
        { 18, 0, 6 },
        { 22, -19, 2 },
        { 26, -28, 4 },
        { 30, -19, 6 },
    },
};

#if (GAME == GAME_SA1)
extern void CreateAmyAttackHeartEffect(void)
#elif (GAME == GAME_SA2)
extern void CreateAmyAttackHeartEffect(u16 kind)
#endif
{
    u8 i;

    if (IS_MULTI_PLAYER) {
        return;
    }

    if (gPlayer.character != CHARACTER_AMY) {
        return;
    }

#if (GAME == GAME_SA2)
    if ((gPlayer.charState == CHARSTATE_BOOSTLESS_ATTACK) || (gPlayer.charState == CHARSTATE_SOME_ATTACK)
        || (gPlayer.charState == CHARSTATE_TRICK_DOWN))
#endif
    {
        struct Task *t = TaskCreate(Task_AmyAttackHeartEffect, sizeof(AmyAtkHearts), 0x3001, 0, TaskDestructor_AmyAttackHeartEffect);
        AmyAtkHearts *hearts = TASK_DATA(t);

        // TODO: Remove magic nums!
#if (GAME == GAME_SA1)
        hearts->unk100 = gPlayer.charState;
        hearts->kind = gPlayer.charState - 87;
#elif (GAME == GAME_SA2)
        hearts->unk100 = sCharStateAnimInfo[gPlayer.charState][0];
        hearts->unk102 = sCharStateAnimInfo[gPlayer.charState][1];

        if (gPlayer.charState < 80) {
            hearts->unk100 += gPlayerCharacterIdleAnims[gPlayer.character];
        }

        hearts->kind = kind;
#endif
        hearts->unk106 = 0;
        hearts->unk108 = 0;
        hearts->unk10A = 0;

        for (i = 0; i < ARRAY_COUNT(hearts->params); i++) {
            hearts->params[i].count = 0;
        }
    }
}

// NOTE: Fakematch
// (99.97%) https://decomp.me/scratch/Z3oDP
void Task_AmyAttackHeartEffect(void)
{
#ifndef NON_MATCHING
    register struct Task *t asm("r2") = gCurTask;
#else
    struct Task *t = gCurTask;
#endif
    AmyAtkHearts *hearts = TASK_DATA(t);
    u8 i;

    // TODO: Fix horrible cast!
#if (GAME == GAME_SA1)
    if (hearts->unk100 != gPlayer.charState)
#else
    if ((!PLAYER_IS_ALIVE) || ((*(u32 *)&hearts->unk100 != *(u32 *)&gPlayer.anim) && (*(u32 *)&gPlayer.anim != 0x0001019F)))
#endif
    {
        TaskDestroy(t);
        return;
    } else {
        for (i = 0; i < ARRAY_COUNT(hearts->params); i++) {
            if (hearts->params[i].count != 0) {
#ifndef NON_MATCHING
                register s32 sIndex asm("r0") = i * sizeof(Sprite);
                register Sprite *s asm("r4") = ((void *)&hearts->sprHearts) + sIndex;
#else
                Sprite *s = &hearts->sprHearts[i];
#endif

                if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
                    hearts->params[i].count = 0;
                    VramFree(s->graphics.dest);
                }
            }
        }

        { // _08015D56+0xA
            u16 r2 = sHeartOffsets[hearts->kind][hearts->unk108][0];
            r2 *= 16;

            if (r2 != (u16)-1) {
                u16 old106 = hearts->unk106;
                hearts->unk106 += gPlayer.spriteInfoBody->s.animSpeed;

                if (old106 >= r2) {
                    u32 v;
                    sub_8015E28(hearts->unk108);

                    hearts->unk108 = ((++hearts->unk108) & 0x7);

                    if (hearts->unk108 == 0) {
                        hearts->unk106 = 0;
                    }
                }
            }

            for (i = 0; i < ARRAY_COUNT(hearts->sprHearts); i++) {
                struct Camera *cam = &gCamera;

                if (hearts->params[i].count != 0) {
                    Sprite *s;
                    s32 x, y;
#if (GAME == GAME_SA1)
                    u16 camX, camY;
#elif (GAME == GAME_SA2)
                    s32 camX, camY;
#endif
#ifndef NON_MATCHING
                    register s32 index asm("r0") = i;
                    index *= sizeof(Sprite);
                    s = ((void *)&hearts->sprHearts) + index;
#else
                    s = &hearts->sprHearts[i];
#endif
                    x = Q(hearts->params[i].x);
                    y = Q(hearts->params[i].y);

                    camX = gCamera.x;
                    s->x = (x >> 16) - camX;
                    camY = gCamera.y;
                    s->y = (y >> 16) - camY;

                    UpdateSpriteAnimation(s);
                    DisplaySprite(s);
                }
            }
        }
    }
}

void sub_8015E28(u16 p0)
{
    AmyAtkHearts *hearts = TASK_DATA(gCurTask);
    u8 i = 0;

    while (hearts->params[i].count != 0) {
        if (++i >= ARRAY_COUNT(hearts->params)) {
            return;
        }
    }

    if (i < ARRAY_COUNT(hearts->params)) {
        Sprite *s = &hearts->sprHearts[i];
        hearts->params[i].count = 0xFF;
        hearts->params[i].x = gPlayer.qWorldX;
        hearts->params[i].y = gPlayer.qWorldY;

        if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
            hearts->params[i].x -= sHeartOffsets[hearts->kind][p0][1] << 8;
        } else {
            hearts->params[i].x += sHeartOffsets[hearts->kind][p0][1] << 8;
        }

        if (GRAVITY_IS_INVERTED) {
            hearts->params[i].y -= sHeartOffsets[hearts->kind][p0][2] << 8;
        } else {
            hearts->params[i].y += sHeartOffsets[hearts->kind][p0][2] << 8;
        }

        hearts->params[i].unk8 = 0;
        hearts->params[i].unkA = 0;

        s->graphics.dest = VramMalloc(4);
        s->oamFlags = SPRITE_OAM_ORDER(16);
        s->graphics.size = 0;
#if (GAME == GAME_SA1)
        // TODO: Unify name!
        s->graphics.anim = SA1_ANIM_HEART;
#elif (GAME == GAME_SA2)
        s->graphics.anim = SA2_ANIM_HEART;
#endif
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = gPlayer.spriteInfoBody->s.animSpeed;
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

#if (GAME == GAME_SA2)
        if (GRAVITY_IS_INVERTED) {
            SPRITE_FLAG_SET(s, Y_FLIP);
        } else {
            SPRITE_FLAG_SET_VALUE(s, PRIORITY, 2);
        }
#endif
    }
}

void TaskDestructor_AmyAttackHeartEffect(struct Task *t)
{
    AmyAtkHearts *hearts = TASK_DATA(t);

    u8 i;
    for (i = 0; i < ARRAY_COUNT(hearts->params); i++) {
        if (hearts->params[i].count != 0) {
            Sprite *s = &hearts->sprHearts[i];
            VramFree(s->graphics.dest);
        }
    }
}
