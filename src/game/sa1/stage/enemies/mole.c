#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"

#include "constants/sa1/animations.h"
#include "constants/zones.h"

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ s16 frames;
    /* 0x3E */ u8 unk3E;
} Mole;

void Task_Mole(void);
void Task_Mole_8071640(void);
void Task_Mole2(void);

void CreateEntity_Mole(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t;
    Mole *mole;
    Sprite *s;

    if (me->d.sData[1] != 0) {
        t = TaskCreate(Task_Mole, sizeof(Mole), 0x2000, 0, TaskDestructor_EntityShared);
    } else {
        t = TaskCreate(Task_Mole2, sizeof(Mole), 0x2000, 0, TaskDestructor_EntityShared);
    }

    mole = TASK_DATA(t);
    s = &mole->shared.s;

    mole->shared.base.regionX = regionX;
    mole->shared.base.regionY = regionY;
    mole->shared.base.me = me;
    mole->shared.base.meX = me->x;
    mole->shared.base.id = id;
    mole->frames = 0;
    mole->unk3E = 0;

    // NOTE: x|y set to world- not screen-pos!
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_MOLE);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_MOLE;
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

void Task_Mole(void)
{
    Mole *mole = TASK_DATA(gCurTask);
    Sprite *s = &mole->shared.s;
    MapEntity *me = mole->shared.base.me;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(mole->shared.base.meX, mole->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, mole->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mole->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (++mole->frames >= TIME(0, 1)) {
        mole->frames = 0;
        s->variant = 1;

        if (worldX > I(gPlayer.qWorldX)) {
            SPRITE_FLAG_CLEAR(s, X_FLIP);
        } else {
            SPRITE_FLAG_SET(s, X_FLIP);
        }

        gCurTask->main = Task_Mole_8071640;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_Mole_8071640(void)
{
    Mole *mole = TASK_DATA(gCurTask);
    Sprite *s = &mole->shared.s;
    MapEntity *me = mole->shared.base.me;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(mole->shared.base.meX, mole->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, mole->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mole->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (++mole->frames >= TIME(0, 1)) {
        mole->frames = 0;
        s->variant = 0;
        gCurTask->main = Task_Mole;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY) != 0) {
        s->variant = 0;
        me->d.sData[1] = 0;
        gCurTask->main = Task_Mole2;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_Mole2(void)
{
    Mole *mole = TASK_DATA(gCurTask);
    Sprite *s = &mole->shared.s;
    MapEntity *me = mole->shared.base.me;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(mole->shared.base.meX, mole->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, mole->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mole->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
