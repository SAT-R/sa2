#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "game/game.h"

#include "constants/animations.h"

#define AMY_ATTACK_HEART_COUNT 4

typedef struct {
    s32 unk0;
    s32 unk4;
    u8 filler8[0x4];
    u8 count;
} AmyHeartParams;

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

extern const s16 sHeartOffsets[4][8][3];
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
        AmyAtkHearts *hearts = TaskGetStructPtr(t);

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
    AmyAtkHearts *hearts = TaskGetStructPtr(t);
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
                    x = Q_24_8(hearts->params[i].unk0);
                    y = Q_24_8(hearts->params[i].unk4);

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

#if 0 // Matches
void TaskDestructor_8015FF0(struct Task *t)
{
    AmyAtkHearts *hearts = TaskGetStructPtr(t);
    
    u8 i;
    for(i = 0; i < ARRAY_COUNT(hearts->params); i++) {
        if(hearts->params[i].count != 0) {
            Sprite *s = &hearts->sprHearts[i];
            VramFree(s->graphics.dest);
        }
    }
}
#endif