#include "global.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"

#include "constants/sa1/animations.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
} Torch;

static void Task_TorchMain(void);
static void TaskDestructor_Torch(Task *);

// Cosmic Angel: Antigravity field elements
//               (They kind of look like torches, I guess?)

void CreateEntity_Torch(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_TorchMain, sizeof(Torch), 0x2000, 0, TaskDestructor_Torch);
    Torch *torch = TASK_DATA(t);
    Sprite *s = &torch->s;

    torch->base.regionX = regionX;
    torch->base.regionY = regionY;
    torch->base.me = me;

    torch->base.meX = me->x;
    torch->base.id = id;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) || (gCurrentLevel == ACT_CHAO_HUNT_D)) {
        // Allocate sprites for Cosmic Angel-themed stages

        if (me->d.sData[0] != 0) {
            // Single "antigrav" unit
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_TORCH6_1);
            s->graphics.anim = SA1_ANIM_TORCH6_1;
            s->variant = 0;
        } else {
            // Double "antigrav" units
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_TORCH6_2);
            s->graphics.anim = SA1_ANIM_TORCH6_2;
            s->variant = 0;
        }
    } else {
        // Allocate sprites for Angel Island stages
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_TORCH5);
        s->graphics.anim = SA1_ANIM_TORCH5;
        s->variant = 0;
    }

    s->oamFlags = SPRITE_OAM_ORDER(28);
    s->graphics.size = 0;
    SPRITE_INIT_SCRIPT(s, 1.0);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

static void Task_TorchMain(void)
{
    Torch *torch = TASK_DATA(gCurTask);
    Sprite *s = &torch->s;
    MapEntity *me = torch->base.me;

    s16 screenX, screenY;
    screenX = TO_WORLD_POS(torch->base.meX, torch->base.regionX);
    screenY = TO_WORLD_POS(me->y, torch->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, torch->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void TaskDestructor_Torch(Task *t)
{
    Torch *torch = TASK_DATA(t);
    VramFree(torch->s.graphics.dest);
}