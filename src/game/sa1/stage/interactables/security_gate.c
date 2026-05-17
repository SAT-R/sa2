#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"

#include "constants/sa1/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s8 unk3C;
    /* 0x3D */ u8 unk3D;
    /* 0x3E */ s16 unk3E;
} SecurityGate;

void Task_SecurityGateMain(void);
void Task_SecurityGate1(void);
void Task_SecurityGate2(void);
void TaskDestructor_SecurityGateMain(Task *t);

// (97.55%) https://decomp.me/scratch/12dTu
NONMATCH("asm/non_matching/game/sa1/stage/interactables/CreateEntity_SecurityGate.inc",
         void CreateEntity_SecurityGate(MapEntity *me, u16 regionX, u16 regionY, u8 id))
{
    Task *t = TaskCreate(Task_SecurityGateMain, sizeof(SecurityGate), 0x2000, 0, TaskDestructor_SecurityGateMain);
    SecurityGate *gate = TASK_DATA(t);
    Sprite *s = &gate->s;

    gate->base.regionX = regionX;
    gate->base.regionY = regionY;
    gate->base.me = me;
    gate->base.meX = me->x;
    gate->base.id = id;

    gate->unk3C = 0;
    gate->unk3D = 0;

    if (me->d.sData[0] == 0) {
        gate->unk3E = me->d.uData[2] * TILE_WIDTH - 10;
    } else {
        gate->unk3E = -10;
    }

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SECURITY_GATE);
    s->graphics.anim = SA1_ANIM_SECURITY_GATE;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    SPRITE_INIT_SCRIPT(s, 1.0);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}
END_NONMATCH

void Task_SecurityGateMain(void)
{
    SecurityGate *gate = TASK_DATA(gCurTask);
    MapEntity *me = gate->base.me;
    Sprite *s = &gate->s;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(gate->base.meX, gate->base.regionX);
    worldY = TO_WORLD_POS(me->y, gate->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (PLAYER_IS_ALIVE && ((worldX - gate->unk3E) <= I(gPlayer.qWorldX))
        && ((worldX - gate->unk3E + me->d.uData[2] * TILE_WIDTH) >= I(gPlayer.qWorldX)) && ((worldY) <= I(gPlayer.qWorldY))
        && ((worldY + me->d.uData[3] * TILE_WIDTH) >= I(gPlayer.qWorldY))) {
        gate->unk3C = 0;
        gate->unk3D = 8;
        gCurTask->main = Task_SecurityGate1;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, gate->base.meX);
        TaskDestroy(gCurTask);
        return;
    } else {
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_SecurityGate1(void)
{
    SecurityGate *gate = TASK_DATA(gCurTask);
    MapEntity *me = gate->base.me;
    Sprite *s = &gate->s;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(gate->base.meX, gate->base.regionX);
    worldY = TO_WORLD_POS(me->y, gate->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y + gate->unk3C;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, gate->base.meX);
        TaskDestroy(gCurTask);
        return;
    } else {
        if (--gate->unk3D == 0) {
            gate->unk3C = 48;
            gCurTask->main = Task_SecurityGate2;
        } else {
            gate->unk3C += 6;
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_SecurityGate2(void)
{
    SecurityGate *gate;
    Sprite *s;
    s16 worldX, worldY;
    MapEntity *me;
    s32 i;

    gate = TASK_DATA(gCurTask);
    me = gate->base.me;
    s = &gate->s;

    worldX = TO_WORLD_POS(gate->base.meX, gate->base.regionX);
    worldY = TO_WORLD_POS(me->y, gate->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y + gate->unk3C;

    i = 0;
    do {
        Player *p = &PLAYER(i);

        if (IS_ALIVE(p)) {
            Coll_Player_Gate(s, worldX, worldY + gate->unk3C, p, 0);
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, gate->base.meX);
        TaskDestroy(gCurTask);
        return;
    } else {
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void TaskDestructor_SecurityGateMain(Task *t)
{
    SecurityGate *gate = TASK_DATA(t);
    VramFree(gate->s.graphics.dest);
}