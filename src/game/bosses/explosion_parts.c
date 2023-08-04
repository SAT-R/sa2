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
void Task_DestroyExplosionParts(void);

void sub_8039B54(ExplosionParts *p0, u8 *numCreatedParts)
{
    if (!(p0->unk4 & 1) || *numCreatedParts < 16) {
        struct Task *t
            = TaskCreate(Task_8039C4C, sizeof(Sprite_ExplosionParts), 0x5432, 0, NULL);
        Sprite_ExplosionParts *bc = TaskGetStructPtr(t);
        Sprite *s = &bc->s;
        s32 cos, sin;

        bc->posX = Q_24_8(p0->unk14);
        bc->posY = Q_24_8(p0->unk18);

        cos = COS(p0->unkC & ONE_CYCLE) * p0->unkE;
        bc->dirX = cos >> 14;

        sin = SIN(p0->unkC & ONE_CYCLE) * p0->unkE;
        bc->dirY = sin >> 14;

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
    Sprite_ExplosionParts *bc = TaskGetStructPtr(gCurTask);
    Sprite *s = &bc->s;

    if (s->graphics.anim == SA2_ANIM_EXPLOSION) {
        bc->dirX -= 0x100;
    }

    bc->dirY += bc->unk3C;
    bc->posX += bc->dirX;
    bc->posY += bc->dirY;

    s->x = Q_24_8_TO_INT(bc->posX);
    s->y = Q_24_8_TO_INT(bc->posY);

    if (((s->x < -32) && (bc->dirX < 0))
        || ((s->x > (DISPLAY_WIDTH + 32)) && (bc->dirX > 0))
        || ((s->y < -32) && (bc->dirY < 0))
        || ((s->y > (DISPLAY_HEIGHT + 32)) && (bc->dirY > 0))) {
        gCurTask->main = Task_DestroyBossParts;
    }

    if (sub_8004558(s) == 0) {
        gCurTask->main = Task_DestroyBossParts;
    }

    sub_80051E8(s);
}

void sub_8039D04(ExplosionParts *p0, u8 *numCreatedParts)
{
    if (!(p0->unk4 & 1) || *numCreatedParts < 16) {
        struct Task *t
            = TaskCreate(Task_8039DFC, sizeof(Sprite_ExplosionParts), 0x5432, 0, NULL);
        Sprite_ExplosionParts *bc = TaskGetStructPtr(t);
        Sprite *s = &bc->s;
        s32 cos, sin;

        bc->posX = Q_24_8(p0->unk14);
        bc->posY = Q_24_8(p0->unk18);

        cos = COS(p0->unkC & ONE_CYCLE) * p0->unkE;
        bc->dirX = cos >> 14;

        sin = SIN(p0->unkC & ONE_CYCLE) * p0->unkE;
        bc->dirY = sin >> 14;

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
    Sprite_ExplosionParts *bc = TaskGetStructPtr(gCurTask);
    Sprite *s = &bc->s;

    bc->dirY += bc->unk3C;
    bc->posX += bc->dirX;
    bc->posY += bc->dirY;

    s->x = Q_24_8_TO_INT(bc->posX) - gCamera.x;
    s->y = Q_24_8_TO_INT(bc->posY) - gCamera.y;

    if (((s->x < -32) && (bc->dirX < 0))
        || ((s->x > (DISPLAY_WIDTH + 32)) && (bc->dirX > 0))
        || ((s->y < -32) && (bc->dirY < 0))
        || ((s->y > (DISPLAY_HEIGHT + 32)) && (bc->dirY > 0))) {
        gCurTask->main = Task_DestroyBossParts;
    }

    if (sub_8004558(s) == 0) {
        gCurTask->main = Task_DestroyBossParts;
    }

    sub_80051E8(s);
}
