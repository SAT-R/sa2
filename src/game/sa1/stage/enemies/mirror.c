#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"
#include "game/sa1/save.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef enum {
    DIR_LEFT = 0,
    DIR_RIGHT = 1,
} MirrorDir;

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ s32 qUnk3C;
    /* 0x40 */ s16 qUnk40;
    /* 0x42 */ s16 frames;
    /* 0x44 */ u16 unk44;
    /* 0x46 */ s16 unk46;
} Mirror; /* 0x48 */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 qWorldX;
    /* 0x34 */ s16 qSpeed;
} MirrorProjectile; /* 0x48 */

void Task_Mirror(void);
void Task_MirrorShoot(void);

void CreateMirrorProjectile(CamCoord worldX, CamCoord worldY, u8);
void Task_MirrorProjectile(void);

#define PROJ_SPEED Q(2)

void CreateEntity_Mirror(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    if ((LEVEL_TO_ZONE(gCurrentLevel) != ZONE_6) || (LOADED_SAVE->difficultyLevel == DIFFICULTY_NORMAL)) {
        Task *t = TaskCreate(Task_Mirror, sizeof(Mirror), 0x2000, 0, TaskDestructor_EntityShared);
        Mirror *mirror = TASK_DATA(t);
        Sprite *s = &mirror->shared.s;

        mirror->shared.base.regionX = regionX;
        mirror->shared.base.regionY = regionY;

        mirror->shared.base.me = me;
        mirror->shared.base.meX = me->x;
        mirror->shared.base.id = id;

        mirror->qUnk40 = -Q(0.625);
        mirror->qUnk3C = Q(0);
        mirror->unk44 = 0;
        mirror->frames = 0;
        mirror->unk46 = 0;

        s->x = TO_WORLD_POS(me->x, regionX);
        s->y = TO_WORLD_POS(me->y, regionY);

        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = ALLOC_TILES(SA1_ANIM_MIRROR);
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_MIRROR;
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
}

void Task_Mirror(void)
{
    Mirror *mirror = TASK_DATA(gCurTask);
    Sprite *s = &mirror->shared.s;
    MapEntity *me = mirror->shared.base.me;
    s32 prevWorldX, prevWorldY;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(mirror->shared.base.meX, mirror->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, mirror->shared.base.regionY);

    prevWorldX = worldX;
    prevWorldY = worldY;

    mirror->qUnk3C += mirror->qUnk40;

    worldX += I(mirror->qUnk3C);
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(prevWorldX, prevWorldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mirror->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (s->hitboxes[0].index != HITBOX_STATE_INACTIVE) {
        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(gPlayer.qWorldX), I(gPlayer.qWorldY), gPlayerBodyPSI.s.hitboxes[0].b)) {
            Coll_DamagePlayer(&gPlayer);
        }
    }

    if (I(mirror->qUnk3C) <= me->d.sData[0] * TILE_WIDTH) {
        mirror->qUnk40 = +Q(0.625);
    } else if (I(mirror->qUnk3C) >= (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH) {
        mirror->qUnk40 = -Q(0.625);
    } else if (mirror->unk46 != 0) {
        mirror->unk46--;
    } else {
        if (I(gPlayer.qWorldX) > worldX) {
            SPRITE_FLAG_SET(s, X_FLIP);
        } else {
            SPRITE_FLAG_CLEAR(s, X_FLIP);
        }

        mirror->unk46 = 90;
        mirror->frames = 0;
        s->variant = 1;
        gCurTask->main = Task_MirrorShoot;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_MirrorShoot(void)
{
    Mirror *mirror = TASK_DATA(gCurTask);
    Sprite *s = &mirror->shared.s;
    MapEntity *me = mirror->shared.base.me;
    s32 prevWorldX, prevWorldY;
    s16 screenX, screenY;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(mirror->shared.base.meX, mirror->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, mirror->shared.base.regionY);

    prevWorldX = worldX;
    prevWorldY = worldY;

    screenX = s->x;
    screenY = s->y;

    worldX += I(mirror->qUnk3C);
    s->x = (worldX)-gCamera.x;
    s->y = (prevWorldY)-gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(prevWorldX, prevWorldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mirror->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY) != 0) {
        TaskDestroy(gCurTask);
        return;
    }

    if (++mirror->frames == 20) {
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            CreateMirrorProjectile(worldX + 8, worldY - 16, DIR_RIGHT);
        } else {
            CreateMirrorProjectile(worldX - 8, worldY - 16, DIR_LEFT);
        }
    }

    if (mirror->frames == TIME(0, 1)) {
        s->variant = 0;
        gCurTask->main = Task_Mirror;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void CreateMirrorProjectile(CamCoord worldX, CamCoord worldY, u8 dir)
{
    Task *t = TaskCreate(Task_MirrorProjectile, sizeof(MirrorProjectile), 0x3000, 0, NULL);
    MirrorProjectile *proj = TASK_DATA(t);
    Sprite *s = &proj->s;

    if (dir != DIR_LEFT) {
        s->x = worldX;
        proj->qSpeed = +PROJ_SPEED;
    } else {
        s->x = worldX;
        proj->qSpeed = -PROJ_SPEED;
    }

    proj->qWorldX = Q(worldX);
    s->y = worldY;

    s->graphics.dest = VRAM_RESERVED_EN_MIRROR_PROJ;
    s->oamFlags = SPRITE_OAM_ORDER(9);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_MIRROR_PROJ;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 0);

    UpdateSpriteAnimation(s);
}

void Task_MirrorProjectile(void)
{
    MirrorProjectile *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    s16 oldWorldX, oldWorldY;
    s16 screenX, screenY;
    s32 worldX;

    proj->qWorldX += proj->qSpeed;

    s->x = I(proj->qWorldX);

    oldWorldX = proj->s.x;
    oldWorldY = proj->s.y;

    // WorldPos -> ScreenPos
    proj->s.x -= gCamera.x;
    proj->s.y -= gCamera.y;

    Coll_Player_Projectile(s, oldWorldX, oldWorldY);

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
