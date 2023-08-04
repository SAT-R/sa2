#include "global.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "game/game.h"
#include "game/bosses/common.h"
#include "game/bosses/boss_1.h"
#include "game/bosses/boss_2.h"
#include "game/bosses/boss_3.h"
#include "game/bosses/boss_4.h"
#include "game/bosses/boss_5.h"
#include "game/bosses/boss_6.h"
#include "game/bosses/boss_7.h"
#include "game/bosses/boss_8.h"
#include "game/bosses/boss_9.h"

#include "constants/animations.h"
#include "constants/zones.h"

void Task_8039C4C(void);
void Task_8039DFC(void);
void Task_DestroyBossParts(void);

void sub_8039B54(BossParts *p0, u8 *numCreatedParts)
{
    if (!(p0->unk4 & 1) || *numCreatedParts < 16) {
        struct Task *t
            = TaskCreate(Task_8039C4C, sizeof(Sprite_BossParts), 0x5432, 0, NULL);
        Sprite_BossParts *bc = TaskGetStructPtr(t);
        Sprite *s = &bc->s;
        s32 cos, sin;

        bc->unk30 = Q_24_8(p0->unk14);
        bc->unk34 = Q_24_8(p0->unk18);

        cos = COS(p0->unkC & ONE_CYCLE) * p0->unkE;
        bc->unk38 = cos >> 14;

        sin = SIN(p0->unkC & ONE_CYCLE) * p0->unkE;
        bc->unk3A = sin >> 14;

        bc->unk3C = p0->unk1C;
        bc->numCreatedParts = numCreatedParts;
        (*numCreatedParts)++;

        s->x = 0;
        s->y = 0;
        s->graphics.dest = p0->vram;
        s->unk1A = 0x100;
        s->graphics.size = 0;
        s->graphics.anim = p0->anim;
        s->variant = p0->variant;
        s->unk14 = 0;
        s->unk1C = 0;
        s->unk21 = -1;
        s->unk22 = 0x10;
        s->palId = 0;
        s->unk28->unk0 = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 1);
    }
}

void Task_8039C4C(void)
{
    Sprite_BossParts *bc = TaskGetStructPtr(gCurTask);
    Sprite *s = &bc->s;

    if (s->graphics.anim == SA2_ANIM_EXPLOSION) {
        bc->unk38 -= 0x100;
    }

    bc->unk3A += bc->unk3C;
    bc->unk30 += bc->unk38;
    bc->unk34 += bc->unk3A;

    s->x = Q_24_8_TO_INT(bc->unk30);
    s->y = Q_24_8_TO_INT(bc->unk34);

    if (((s->x < -32) && (bc->unk38 < 0))
        || ((s->x > (DISPLAY_WIDTH + 32)) && (bc->unk38 > 0))
        || ((s->y < -32) && (bc->unk3A < 0))
        || ((s->y > (DISPLAY_HEIGHT + 32)) && (bc->unk3A > 0))) {
        gCurTask->main = Task_DestroyBossParts;
    }

    if (sub_8004558(s) == 0) {
        gCurTask->main = Task_DestroyBossParts;
    }

    sub_80051E8(s);
}

void sub_8039D04(BossParts *p0, u8 *numCreatedParts)
{
    if (!(p0->unk4 & 1) || *numCreatedParts < 16) {
        struct Task *t
            = TaskCreate(Task_8039DFC, sizeof(Sprite_BossParts), 0x5432, 0, NULL);
        Sprite_BossParts *bc = TaskGetStructPtr(t);
        Sprite *s = &bc->s;
        s32 cos, sin;

        bc->unk30 = Q_24_8(p0->unk14);
        bc->unk34 = Q_24_8(p0->unk18);

        cos = COS(p0->unkC & ONE_CYCLE) * p0->unkE;
        bc->unk38 = cos >> 14;

        sin = SIN(p0->unkC & ONE_CYCLE) * p0->unkE;
        bc->unk3A = sin >> 14;

        bc->unk3C = p0->unk1C;
        bc->numCreatedParts = numCreatedParts;
        (*numCreatedParts)++;

        s->x = 0;
        s->y = 0;
        s->graphics.dest = p0->vram;
        s->unk1A = 0x100;
        s->graphics.size = 0;
        s->graphics.anim = p0->anim;
        s->variant = p0->variant;
        s->unk14 = 0;
        s->unk1C = 0;
        s->unk21 = -1;
        s->unk22 = 0x10;
        s->palId = 0;
        s->unk28->unk0 = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 1);
    }
}

void Task_8039DFC(void)
{
    Sprite_BossParts *bc = TaskGetStructPtr(gCurTask);
    Sprite *s = &bc->s;

    bc->unk3A += bc->unk3C;
    bc->unk30 += bc->unk38;
    bc->unk34 += bc->unk3A;

    s->x = Q_24_8_TO_INT(bc->unk30) - gCamera.x;
    s->y = Q_24_8_TO_INT(bc->unk34) - gCamera.y;

    if (((s->x < -32) && (bc->unk38 < 0))
        || ((s->x > (DISPLAY_WIDTH + 32)) && (bc->unk38 > 0))
        || ((s->y < -32) && (bc->unk3A < 0))
        || ((s->y > (DISPLAY_HEIGHT + 32)) && (bc->unk3A > 0))) {
        gCurTask->main = Task_DestroyBossParts;
    }

    if (sub_8004558(s) == 0) {
        gCurTask->main = Task_DestroyBossParts;
    }

    sub_80051E8(s);
}
