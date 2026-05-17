#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/zones.h"

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ s32 qUnk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s16 qUnk44;
    /* 0x46 */ s16 unk46;
    /* 0x48 */ s16 unk48;
} Hanabii;

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 unk30;
    /* 0x34 */ s16 qUnk34;
    /* 0x36 */ u8 unk36;
} HanabiiProjectile;

void Task_HanabiiInit(void);
void Task_806D804(void);

void CreateHanabiiProjectile(s16 a, s16 b);
void Task_HanabiiProjectile(void);
void Task_HanabiiProjectile2(void);
void TaskDestructor_HanabiiProjectile(Task *t);

void CreateEntity_Hanabii(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_HanabiiInit, sizeof(Hanabii), 0x2000, 0, TaskDestructor_EntityShared);
    Hanabii *hanabii = TASK_DATA(t);
    Sprite *s = &hanabii->shared.s;

    hanabii->shared.base.regionX = regionX;
    hanabii->shared.base.regionY = regionY;
    hanabii->shared.base.me = me;
    hanabii->shared.base.meX = me->x;
    hanabii->shared.base.id = id;

    hanabii->qUnk44 = -Q(0.625);
    hanabii->qUnk3C = Q(0);
    hanabii->unk40 = 0;
    hanabii->unk46 = 0;
    hanabii->unk48 = 0;

    // NOTE: x|y set to world- not screen-pos!
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_HANABII);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_HANABII;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

void Task_HanabiiInit(void)
{
    Hanabii *hanabii = TASK_DATA(gCurTask);
    Sprite *s = &hanabii->shared.s;
    MapEntity *me = hanabii->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    CamCoord deltaX, deltaY;
    CamCoord xSquared, ySquared;

    worldX = TO_WORLD_POS(hanabii->shared.base.meX, hanabii->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, hanabii->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    hanabii->qUnk3C += hanabii->qUnk44;

    deltaX = worldX2 + I(hanabii->qUnk3C);
    deltaY = worldY2 + hanabii->unk40;

    s->x = deltaX - gCamera.x;
    s->y = deltaY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, hanabii->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, deltaX, deltaY)) {
        TaskDestroy(gCurTask);
        return;
    }

    hanabii->unk40 += SA2_LABEL(sub_801F07C)(deltaY, deltaX, 1, +8, NULL, SA2_LABEL(sub_801EE64));

    xSquared = I(gPlayer.qWorldX) - deltaX;
    xSquared = xSquared * xSquared;
    ySquared = I(gPlayer.qWorldY) - deltaY;
    ySquared = ySquared * ySquared;

    if (I(hanabii->qUnk3C) <= (me->d.sData[0] + 1) * TILE_WIDTH) {
        if (~s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            SPRITE_FLAG_SET(s, X_FLIP);
            hanabii->qUnk44 = +Q(0.625);
        }
    } else if (I(hanabii->qUnk3C) >= (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH) {
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            SPRITE_FLAG_CLEAR(s, X_FLIP);
            hanabii->qUnk44 = -Q(0.625);
        }
    } else if (hanabii->unk48 != 0) {
        hanabii->unk48--;
    } else {
        if (xSquared + ySquared < 100 * 100) {
            hanabii->unk46 = 0;
            hanabii->unk48 = 100;
            s->variant = 1;
            s->prevVariant = -1;
            gCurTask->main = Task_806D804;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_806D804(void)
{
    Hanabii *hanabii = TASK_DATA(gCurTask);
    Sprite *s = &hanabii->shared.s;
    MapEntity *me = hanabii->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    u8 sp08;
    CamCoord deltaX, deltaY;
    CamCoord xSquared, ySquared;

    worldX = TO_WORLD_POS(hanabii->shared.base.meX, hanabii->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, hanabii->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    deltaX = worldX2 + I(hanabii->qUnk3C);
    deltaY = worldY2 + hanabii->unk40;

    s->x = deltaX - gCamera.x;
    s->y = deltaY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, hanabii->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, deltaX, deltaY)) {
        TaskDestroy(gCurTask);
        return;
    }

    hanabii->unk40 += SA2_LABEL(sub_801F07C)(deltaY, deltaX, 1, +8, &sp08, SA2_LABEL(sub_801EE64));

    if (++hanabii->unk46 == 7) {
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            CreateHanabiiProjectile(deltaX + 4, deltaY - 20);
        } else {
            CreateHanabiiProjectile(deltaX - 6, deltaY - 20);
        }
    }

    if (hanabii->unk46 == 19) {
        hanabii->unk46 = 0;
        s->prevVariant = -1;
        s->variant = 0;
        gCurTask->main = Task_HanabiiInit;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void CreateHanabiiProjectile(CamCoord worldX, CamCoord worldY)
{
    Task *t = TaskCreate(Task_HanabiiProjectile, sizeof(HanabiiProjectile), 0x3000, 0, TaskDestructor_HanabiiProjectile);
    HanabiiProjectile *proj = TASK_DATA(t);
    Sprite *s = &proj->s;

    proj->unk30 = worldX * 4;
    proj->qUnk34 = -Q(3.6875);
    proj->unk36 = 0;

    // NOTE: x|y set to world- not screen-pos!
    s->x = worldX;
    s->y = worldY;

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_HANABII_FIREWORK); /* MAX_TILES(SA1_ANIM_HANABII_FIREWORK, SA1_ANIM_HANABII_PROJ) */
    s->oamFlags = SPRITE_OAM_ORDER(9);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_HANABII_PROJ;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

void Task_HanabiiProjectile(void)
{
    HanabiiProjectile *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    s16 oldWorldX, oldWorldY;
    s32 worldX;

    // proj->unk30 += proj->unk32;

    worldX = proj->unk30;
    if (worldX < 0) {
        worldX += 3;
    }

    s->x = worldX >> 2;

    proj->qUnk34 += Q(44. / 256.);
    s->y += I(proj->qUnk34);
    oldWorldX = proj->s.x;
    oldWorldY = proj->s.y;

    Coll_Player_Projectile(s, oldWorldX, oldWorldY);

    // WorldPos -> ScreenPos
    proj->s.x -= gCamera.x;
    proj->s.y -= gCamera.y;

    // TODO:
    //   if(IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, 40))
    if ((((u16)(s->x + (120 / 2)) > DISPLAY_WIDTH + 120) || (s->y + (120 / 2) < 0) || (s->y > DISPLAY_HEIGHT + 140))) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (proj->qUnk34 > -16) {
        s->graphics.anim = SA1_ANIM_HANABII_FIREWORK;
        s->variant = 0;
        s->prevVariant = -1;
        gCurTask->main = Task_HanabiiProjectile2;
    }

    s->x = oldWorldX;
    s->y = oldWorldY;
}

void Task_HanabiiProjectile2(void)
{
    HanabiiProjectile *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    s16 oldWorldX, oldWorldY;
    s32 worldX;
    u32 unk36;

    // proj->unk30 += proj->unk32;

    worldX = proj->unk30;
    if (worldX < 0) {
        worldX += 3;
    }

    s->x = worldX >> 2;

    s->y += I(proj->qUnk34);
    oldWorldX = proj->s.x;
    oldWorldY = proj->s.y;

    Coll_Player_Projectile(s, oldWorldX, oldWorldY);

    // WorldPos -> ScreenPos
    proj->s.x -= gCamera.x;
    proj->s.y -= gCamera.y;

    unk36 = proj->unk36 + 1;
    proj->unk36 = unk36;

    // TODO:
    //   if(IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, 40))
    if ((((u16)(s->x + (120 / 2)) > DISPLAY_WIDTH + 120) || (s->y + (120 / 2) < 0) || (s->y > DISPLAY_HEIGHT + 140) || ((u8)unk36 > 20))) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s, Y_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, Y_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, X_FLIP);

    s->x = oldWorldX;
    s->y = oldWorldY;
}

void TaskDestructor_HanabiiProjectile(Task *t)
{
    HanabiiProjectile *proj = TASK_DATA(t);
    VramFree(proj->s.graphics.dest);
}