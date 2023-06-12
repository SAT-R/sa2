#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"

// TODO(Jace): Maybe call this module "Points Summary" instead?

typedef struct {
    /*  0x00 */ u8 filler0[0xC];
    /*  0x0C */ Sprite s1[3];
    /*  0x9C */ Sprite s4;
    /*  0xCC */ Sprite s5;
    /*  0xFC */ Sprite s6;
    /* 0x12C */ Sprite s7;
    /* 0x15C */ u8 filler15C[0xC];
    /* 0x168 */ s32 unk168;
    /* 0x16C */ u8 filler16C[0x8];
} StageOutro;

const u16 gUnknown_080D71CC[3] = { 0, 69, 173 };

void sub_8031314(void)
{
    StageOutro *outro = TaskGetStructPtr(gCurTask);
    u32 unk168 = outro->unk168;

    if (unk168 > 28) {
        u32 r0;

        if (unk168 < 45) {
            r0 = (u16)(240 - ((unk168 - 29) * 15));
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
