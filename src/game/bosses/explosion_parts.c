#include "global.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
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

void Task_BossParticleWithExplosionUpdate(void);
void Task_BossParticleStatic(void);
void Task_DestroyExplosionParts(void);

#define BOSS_PARTS_DIMENSION 32

void CreateBossParticleWithExplosionUpdate(ExplosionPartsInfo *info, u8 *numCreatedParts)
{
    if (!(info->unk4 & 1) || *numCreatedParts < 16) {
        struct Task *t = TaskCreate(Task_BossParticleWithExplosionUpdate, sizeof(Sprite_ExplosionParts), 0x5432, 0, NULL);
        Sprite_ExplosionParts *parts = TASK_DATA(t);
        Sprite *s = &parts->s;
        s32 cos, sin;

        parts->posX = Q(info->spawnX);
        parts->posY = Q(info->spawnY);

        cos = COS(info->rotation & ONE_CYCLE) * info->speed;
        parts->accelX = cos >> 14;

        sin = SIN(info->rotation & ONE_CYCLE) * info->speed;
        parts->accelY = sin >> 14;

        parts->velocityY = info->velocity;
        parts->numCreatedParts = numCreatedParts;
        (*numCreatedParts)++;

        s->x = 0;
        s->y = 0;
        s->graphics.dest = info->vram;
        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->graphics.anim = info->anim;
        s->variant = info->variant;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
    }
}

void Task_BossParticleWithExplosionUpdate(void)
{
    Sprite_ExplosionParts *parts = TASK_DATA(gCurTask);
    Sprite *s = &parts->s;

    if (s->graphics.anim == SA2_ANIM_EXPLOSION) {
        parts->accelX -= Q(1.0);
    }

    parts->accelY += parts->velocityY;
    parts->posX += parts->accelX;
    parts->posY += parts->accelY;

    s->x = I(parts->posX);
    s->y = I(parts->posY);

    if (((s->x < -BOSS_PARTS_DIMENSION) && (parts->accelX < 0)) || ((s->x > (DISPLAY_WIDTH + BOSS_PARTS_DIMENSION)) && (parts->accelX > 0))
        || ((s->y < -BOSS_PARTS_DIMENSION) && (parts->accelY < 0))
        || ((s->y > (DISPLAY_HEIGHT + BOSS_PARTS_DIMENSION)) && (parts->accelY > 0))) {
        gCurTask->main = Task_DestroyBossParts;
    }

    if (UpdateSpriteAnimation(s) == 0) {
        gCurTask->main = Task_DestroyBossParts;
    }

    DisplaySprite(s);
}

void CreateBossParticleStatic(ExplosionPartsInfo *info, u8 *numCreatedParts)
{
    if (!(info->unk4 & 1) || *numCreatedParts < 16) {
        struct Task *t = TaskCreate(Task_BossParticleStatic, sizeof(Sprite_ExplosionParts), 0x5432, 0, NULL);
        Sprite_ExplosionParts *parts = TASK_DATA(t);
        Sprite *s = &parts->s;
        s32 cos, sin;

        parts->posX = Q(info->spawnX);
        parts->posY = Q(info->spawnY);

        cos = COS(info->rotation & ONE_CYCLE) * info->speed;
        parts->accelX = cos >> 14;

        sin = SIN(info->rotation & ONE_CYCLE) * info->speed;
        parts->accelY = sin >> 14;

        parts->velocityY = info->velocity;
        parts->numCreatedParts = numCreatedParts;
        (*numCreatedParts)++;

        s->x = 0;
        s->y = 0;
        s->graphics.dest = info->vram;
        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->graphics.anim = info->anim;
        s->variant = info->variant;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
    }
}

void Task_BossParticleStatic(void)
{
    Sprite_ExplosionParts *parts = TASK_DATA(gCurTask);
    Sprite *s = &parts->s;

    parts->accelY += parts->velocityY;
    parts->posX += parts->accelX;
    parts->posY += parts->accelY;

    s->x = I(parts->posX) - gCamera.x;
    s->y = I(parts->posY) - gCamera.y;

    if (((s->x < -BOSS_PARTS_DIMENSION) && (parts->accelX < 0)) || ((s->x > (DISPLAY_WIDTH + BOSS_PARTS_DIMENSION)) && (parts->accelX > 0))
        || ((s->y < -BOSS_PARTS_DIMENSION) && (parts->accelY < 0))
        || ((s->y > (DISPLAY_HEIGHT + BOSS_PARTS_DIMENSION)) && (parts->accelY > 0))) {
        gCurTask->main = Task_DestroyBossParts;
    }

    if (UpdateSpriteAnimation(s) == 0) {
        gCurTask->main = Task_DestroyBossParts;
    }

    DisplaySprite(s);
}
