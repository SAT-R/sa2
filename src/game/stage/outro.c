#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "game/game.h"
#include "game/stage/ui.h"

#include "constants/zones.h"

// TODO(Jace): Maybe call this module "Points Summary" instead?

typedef struct {
    /*  0x00 */ u8 filler0[0xC];
    /*  0x0C */ Sprite s1[3];
    /*  0x9C */ Sprite s4;
    /*  0xCC */ Sprite s5;
    /*  0xFC */ Sprite s6;
    /* 0x12C */ Sprite s7;
    /* 0x15C */ s32 unk15C; // Time Bonus?
    /* 0x160 */ s32 unk160; // Ring Bonus?
    /* 0x164 */ s32 unk164; // SP-Ring Bonus?
    /* 0x168 */ s32 counter;
    /* 0x16C */ u8 filler16C[0x8];
} StageOutro;

const u16 gUnknown_080D71CC[3] = { 0, 69, 173 };

void sub_80310F0(void)
{
    StageOutro *outro = TaskGetStructPtr(gCurTask);
    u32 counter = outro->counter;
    Sprite *s = &outro->s7;

    if (counter <= 15) {
        s->x = (16 - counter) * 15;
        s->y = 100;
    } else if (counter <= 23) {
        s->y = 100;
    } else if (counter <= 28) {
        s->y -= 7;
    }
}

// (90.87%) https://decomp.me/scratch/ju0GI
NONMATCH("asm/non_matching/game/stage/outro/sub_8031138.inc", void sub_8031138(u16 p0))
{
    StageOutro *outro = TaskGetStructPtr(gCurTask);
    u32 counter = outro->counter;
    u32 i;
    Sprite *s;
    s32 bonusVal;
    s16 xPos;
    s16 r4;

    if (counter < 24) {
        s32 x;
        s = &outro->s7;
        x = 0;

        if (counter <= 16) {
            x = (16 - counter) * 24;
        }

        x = x - p0;

        for (i = 0; i < 8; i++) {
            s->x = x + i * 32;
            DisplaySprite(s);
        }
    } else {
        // _08031198
        s = &outro->s7;

        for (i = 0; i < 8; i++) {
            s->x = -p0 + i * 32;
            DisplaySprite(s);
        }
    }
    // _080311B2

    if (counter > 28) {
        u32 cmp = (ACT_INDEX(gCurrentLevel) == ACT_BOSS) ? 2 : 3;

        for (i = 0; i < cmp; i++) {
            s = &outro->s1[i];
            s->x -= p0;
            DisplaySprite(s);
        }
    }
    // _080311F4

    if (counter >= 39) {

        s = &outro->s4;

        if (counter < 56) {
            s32 innerX = DISPLAY_WIDTH - ((counter - 39) * 12);
            r4 = innerX;
        } else {
            r4 = 48;
        }
        s->x = r4 - p0;
        DisplaySprite(s);

        bonusVal = outro->unk15C;
        xPos = p0;
        xPos -= 144;
        StageUI_PrintIntegerAt(bonusVal, (r4 - xPos), 90, 0);
    }
    // _0803124C

    if (counter >= 49) {
        s = &outro->s5;

        if (counter <= 65) {
            r4 = DISPLAY_WIDTH - ((counter - 49) * 12);
        } else {
            r4 = 48;
        }
        s->x = r4 - p0;
        DisplaySprite(s);

        bonusVal = outro->unk160;
        xPos = p0;
        xPos -= 144;
        StageUI_PrintIntegerAt(bonusVal, (r4 - xPos), 110, 0);
    }
    // _0803129C

    if ((ACT_INDEX(gCurrentLevel) != ACT_BOSS)
        && (gCurrentLevel < LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE))
        && (counter >= 59)) {
        s = &outro->s6;

        if (counter <= 75) {
            s32 innerX = DISPLAY_WIDTH - ((counter - 59) * 12);
            r4 = innerX;
        } else {
            r4 = 48;
        }

        s->x = r4 - p0;
        DisplaySprite(s);

        bonusVal = outro->unk164;
        xPos = p0;
        xPos -= 144;
        StageUI_PrintIntegerAt(bonusVal, (r4 - xPos), 130, 0);
    }
}
END_NONMATCH

void sub_8031314(void)
{
    StageOutro *outro = TaskGetStructPtr(gCurTask);
    u32 counter = outro->counter;

    if (counter > 28) {
        u32 r0;

        if (counter < 45) {
            r0 = (u16)(240 - ((counter - 29) * 15));
        } else {
            r0 = 3;
        }

        {
            s32 i = 0;
            s32 r4 = (s16)r0;
            for (; i < ARRAY_COUNT(gUnknown_080D71CC); i++) {
                Sprite *s = &outro->s1[i];
                s32 match = gUnknown_080D71CC[i];
                s->x = r4 + match;
            }
        }
    }
}

void TaskDestructor_UpdateGotThroughScreen(struct Task *t)
{
    StageOutro *outro = TaskGetStructPtr(t);
    if (outro->s7.graphics.dest != NULL) {
        VramFree(outro->s7.graphics.dest);
        VramFree(outro->s1[0].graphics.dest);
        VramFree(outro->s1[1].graphics.dest);
        VramFree(outro->s1[2].graphics.dest);
        VramFree(outro->s4.graphics.dest);
        VramFree(outro->s5.graphics.dest);
        VramFree(outro->s6.graphics.dest);
    }
}

void sub_80313D0(void)
{
    StageOutro *outro = TaskGetStructPtr(gCurTask);
    if (outro->s7.graphics.dest != NULL) {
        VramFree(outro->s7.graphics.dest);
        VramFree(outro->s1[0].graphics.dest);
        VramFree(outro->s1[1].graphics.dest);
        VramFree(outro->s1[2].graphics.dest);
        VramFree(outro->s4.graphics.dest);
        VramFree(outro->s5.graphics.dest);
        VramFree(outro->s6.graphics.dest);

        outro->s7.graphics.dest = NULL;
    }
}
