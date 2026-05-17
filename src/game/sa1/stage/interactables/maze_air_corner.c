#include "global.h"
#include "core.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/vram_hardcoded.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
} TrackAirCorner;

void Task_TrackAirCorner(void);

u32 Coll_Player_PlatformCrumbling(Sprite *s, s16 worldX, s16 worldY, Player *p);

void CreateEntity_TrackAirCorner(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_TrackAirCorner, sizeof(TrackAirCorner), 0x2000, 0, NULL);
    TrackAirCorner *ia = TASK_DATA(t);
    Sprite *s = &ia->s;

    ia->base.regionX = regionX;
    ia->base.regionY = regionY;
    ia->base.me = me;
    ia->base.meX = me->x;
    ia->base.id = id;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VRAM_RESERVED_TRACK_AIR_CORNER;
    s->graphics.anim = SA1_ANIM_MAZE_AIR_CORNER;
    s->variant = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (me->d.sData[0] == 1) {
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
    } else if (me->d.sData[0] == 2) {
        s->frameFlags |= SPRITE_FLAG(Y_FLIP, 1);
    } else if (me->d.sData[0] == 3) {
        s->frameFlags |= SPRITE_FLAG(Y_FLIP, 1);
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
    }

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    UpdateSpriteAnimation(s);
}

void Task_TrackAirCorner(void)
{
    TrackAirCorner *ia = TASK_DATA(gCurTask);
    Sprite *s = &ia->s;
    MapEntity *me = ia->base.me;
    s16 worldX, worldY;
    s32 i;

    worldX = TO_WORLD_POS(ia->base.meX, ia->base.regionX);
    worldY = TO_WORLD_POS(me->y, ia->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (!(PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE)) {
                u32 res = Coll_Player_PlatformCrumbling(s, worldX, worldY, &PLAYER(i));

                if (res & 0x8) {
                    PLAYER(i).qWorldY += Q(2);
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, ia->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}
