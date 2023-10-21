#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "game/game.h"
#include "game/amy_attack_heart_effect.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u16 unkA;
    /* 0x0C */ u8 count;
} AmyHeartParams; /* size: 0x10 */

typedef struct {
    /* 0x000 */ Sprite sprHearts[AMY_ATTACK_HEART_COUNT];
    /* 0x0C0 */ AmyHeartParams params[AMY_ATTACK_HEART_COUNT];
    /* 0x100 */ u16 unk100;
    /* 0x102 */ u16 unk102;
    /* 0x104 */ u16 kind;
    /* 0x106 */ u16 unk106;
    /* 0x108 */ u16 unk108;
    /* 0x10A */ u16 unk10A;
} AmyAtkHearts; /* size: 0x10C */

void Task_8015CE4(void);
void sub_8015E28(u16);
void TaskDestructor_8015FF0(struct Task *);

ALIGNED(4)
const s16 sHeartOffsets[4][8][3] = {
    [AMY_ATTACK_EFFECT_KIND_A] = {
        { 10, 0, -27 },
        { 12, 13, -22 },
        { 14, 23, -13 },
        { 16, 26, 0 },
        { -1, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
    },
    [AMY_ATTACK_EFFECT_KIND_B] = {
        { 10, 7, -27 },
        { 12, 20, -22 },
        { 14, 30, -13 },
        { 16, 33, 0 },
        { -1, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 0, 0, 0 },
    },
    [AMY_ATTACK_EFFECT_KIND_C] = {
        { 0, -10, -26 },
        { 4, 8, -27 },
        { 8, 22, -17 },
        { 12, 28, -1 },
        { 16, 23, 16 },
        { 20, 10, 26 },
        { -1, 0, 0 },
        { 0, 0, 0 },
    },
    [AMY_ATTACK_EFFECT_KIND_D] = {
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
        AmyAtkHearts *hearts = TASK_DATA(t);

        hearts->unk100 = gUnknown_080D6736[gPlayer.unk64][0];
        hearts->unk102 = gUnknown_080D6736[gPlayer.unk64][1];

        if (gPlayer.unk64 < 80) {
            hearts->unk100 += gPlayerCharacterIdleAnims[gPlayer.character];
        }

        hearts->kind = kind;
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
void Task_8015CE4(void)
{
#ifndef NON_MATCHING
    register struct Task *t asm("r2") = gCurTask;
#else
    struct Task *t = gCurTask;
#endif
    AmyAtkHearts *hearts = TASK_DATA(t);
    u8 i;

    // TODO: Fix horrible cast!
    if ((!PLAYER_IS_ALIVE)
        || ((*(u32 *)&hearts->unk100 != *(u32 *)&gPlayer.anim)
            && (*(u32 *)&gPlayer.anim != 0x0001019F))) {
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

                if (s->unk10 & SPRITE_FLAG_MASK_ANIM_OVER) {
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
                hearts->unk106 += gPlayer.unk90->s.animSpeed;

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
                    s32 camX, camY;
#ifndef NON_MATCHING
                    register s32 index asm("r0") = i;
                    index *= sizeof(Sprite);
                    s = ((void *)&hearts->sprHearts) + index;
#else
                    s = &hearts->sprHearts[i];
#endif
                    x = Q_24_8(hearts->params[i].x);
                    y = Q_24_8(hearts->params[i].y);

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
        hearts->params[i].x = gPlayer.x;
        hearts->params[i].y = gPlayer.y;

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
        s->unk1A = 0x400;
        s->graphics.size = 0;
        s->graphics.anim = SA2_ANIM_HEART;
        s->variant = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = gPlayer.unk90->s.animSpeed;
        s->palId = 0;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);

        if (GRAVITY_IS_INVERTED) {
            SPRITE_FLAG_SET(s, Y_FLIP);
        } else {
            SPRITE_FLAG_SET_VALUE(s, PRIORITY, 2);
        }
    }
}

void TaskDestructor_8015FF0(struct Task *t)
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
