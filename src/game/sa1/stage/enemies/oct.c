#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ s32 qUnk3C;
    /* 0x40 */ s16 qUnk40;
    /* 0x42 */ s16 unk42;
    /* 0x44 */ s16 unk44;
    /* 0x46 */ bool8 unk46;
} Oct;

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 qUnk30;
    /* 0x34 */ s32 qUnk34;
    /* 0x38 */ u8 filler38[2];
    /* 0x3A */ s16 qSpeedY;
} OctProjectile;

void Task_OctInit(void);
void Task_OctInit(void);
void sub_807033C(void);
void sub_807051C(void);
void sub_80706F0(void);
void CreateOctProjectile(CamCoord worldX, CamCoord worldY);
void Task_OctProjectile(void);

void CreateEntity_Oct(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_OctInit, sizeof(Oct), 0x2000, 0, TaskDestructor_EntityShared);
    Oct *oct = TASK_DATA(t);
    Sprite *s = &oct->shared.s;

    oct->shared.base.regionX = regionX;
    oct->shared.base.regionY = regionY;
    oct->shared.base.me = me;
    oct->shared.base.meX = me->x;
    oct->shared.base.id = id;

    oct->qUnk40 = -Q(0.75);
    oct->qUnk3C = 0;
    oct->unk42 = 0;
    oct->unk44 = 0;
    oct->unk46 = 0;

    // NOTE: x|y set to world- not screen-pos!
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_OCT);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->prevVariant = -1;
    s->graphics.anim = SA1_ANIM_OCT;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

void Task_OctInit(void)
{
    Oct *oct = TASK_DATA(gCurTask);
    Sprite *s = &oct->shared.s;
    MapEntity *me = oct->shared.base.me;
    s16 worldX, worldY;
    s32 worldX2, worldY2;
    s16 offsetWorldX;

    worldX = TO_WORLD_POS(oct->shared.base.meX, oct->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, oct->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, oct->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }
    // _08073704

    if ((worldX - 120 < I(gPlayer.qWorldX)) && (worldX + 120 > I(gPlayer.qWorldX))) {
        s->variant = 0;

        gCurTask->main = sub_807033C;
    }

    UpdateSpriteAnimation(s);

    DisplaySprite(s);
    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, X_FLIP);
}

void sub_807033C(void)
{
    Oct *oct = TASK_DATA(gCurTask);
    Sprite *s = &oct->shared.s;
    MapEntity *me = oct->shared.base.me;
    s16 worldX, worldY;
    s32 worldX2, worldY2;
    s16 offsetWorldX;

    worldX = TO_WORLD_POS(oct->shared.base.meX, oct->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, oct->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    oct->qUnk3C += oct->qUnk40;

    worldX += I(oct->qUnk3C);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, oct->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    if (I(oct->qUnk3C) <= (me->d.sData[0]) * TILE_WIDTH) {
        if (oct->unk46 == FALSE) {
            oct->unk46 = TRUE;
            oct->qUnk40 = +Q(0.75);
            oct->unk42 = 0;
            gCurTask->main = sub_807051C;
        }
    } else if (I(oct->qUnk3C) >= (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH) {
        if (oct->unk46 == FALSE) {
            oct->unk46 = TRUE;
            oct->qUnk40 = -Q(0.75);
            oct->unk42 = 0;
            gCurTask->main = sub_807051C;
        }
    } else {
        oct->unk46 = FALSE;

        if (oct->unk44 != 0) {
            oct->unk44--;
        } else {
            oct->unk44 = 60;
            oct->unk42 = 0;
            s->variant = 1;
            gCurTask->main = sub_80706F0;
        }
    }

    DisplaySprite(s);
    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, X_FLIP);
}

void sub_807051C(void)
{
    Oct *oct = TASK_DATA(gCurTask);
    Sprite *s = &oct->shared.s;
    MapEntity *me = oct->shared.base.me;
    s16 worldX, worldY;
    s32 worldX2, worldY2;
    s16 offsetWorldX;

    worldX = TO_WORLD_POS(oct->shared.base.meX, oct->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, oct->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    if (oct->qUnk40 < 0) {
        oct->qUnk3C += Div(SIN((Div(0x400, 30) * oct->unk42)), 55);
    } else {
        oct->qUnk3C -= Div(SIN((Div(0x400, 30) * oct->unk42)), 55);
    }

    worldX += I(oct->qUnk3C);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, oct->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    if (++oct->unk42 >= 30) {
        s->prevVariant = -1;
        s->graphics.anim = 433;
        s->variant = 0;
        gCurTask->main = sub_807033C;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, X_FLIP);
}

void sub_80706F0(void)
{
    Oct *oct = TASK_DATA(gCurTask);
    Sprite *s = &oct->shared.s;
    MapEntity *me = oct->shared.base.me;
    s16 worldX, worldY;
    s32 worldX2, worldY2;
    s16 offsetWorldX;

    worldX = TO_WORLD_POS(oct->shared.base.meX, oct->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, oct->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    worldX += I(oct->qUnk3C);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, oct->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    if (++oct->unk42 == 20) {
        CreateOctProjectile(worldX, worldY - 2);
    }
    if (oct->unk42 == 26) {
        s->prevVariant = -1;
        s->graphics.anim = 433;
        s->variant = 0;
        gCurTask->main = sub_807033C;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, X_FLIP);
}

void CreateOctProjectile(CamCoord worldX, CamCoord worldY)
{
    Task *t = TaskCreate(Task_OctProjectile, sizeof(OctProjectile), 0x3000, 0, NULL);
    OctProjectile *proj = TASK_DATA(t);
    Sprite *s = &proj->s;

    proj->qUnk30 = Q(worldX);
    proj->qUnk34 = Q(worldY);
    proj->qSpeedY = Q(2);

    // NOTE: x|y set to world- not screen-pos!
    s->x = worldX;
    s->y = worldY;

    s->graphics.dest = VRAM_RESERVED_EN_OCT_PROJ;
    s->oamFlags = SPRITE_OAM_ORDER(9);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_OCT_PROJ;
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

void Task_OctProjectile(void)
{
    OctProjectile *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    CamCoord oldWorldX, oldWorldY;
    u32 unk36;

    s->x = I(proj->qUnk30);
    proj->qUnk34 += proj->qSpeedY;

    s->y = I(proj->qUnk34);
    oldWorldX = proj->s.x;
    oldWorldY = proj->s.y;

    Coll_Player_Projectile(s, oldWorldX, oldWorldY);

    // WorldPos -> ScreenPos
    s->x -= gCamera.x;
    s->y -= gCamera.y;

    // TODO:
    //   if(IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, 40))
    if ((((u16)(s->x + (40 / 2)) > DISPLAY_WIDTH + 36) || (s->y + (40 / 2) < 0) || (s->y > DISPLAY_HEIGHT + 80))) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s->x = oldWorldX;
    s->y = oldWorldY;
}
