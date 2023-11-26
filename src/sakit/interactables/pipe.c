#include "global.h"
#include "gba/types.h"
#include "sprite.h"
#include "task.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "game/entity.h"
#include "sakit/interactables/pipe.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/player_transitions.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_ClearPipe;

typedef struct {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    /* 0x03 */ s8 unk3;
    /* 0x04 */ s8 unk4;
    /* 0x05 */ u8 unused[ENTITY_DATA_SIZE - 2];
} MapEntity_PipeStart PACKED;

typedef struct {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    /* 0x03 */ s8 exitOnBackLayer;
    /* 0x04 */ s8 unk4;
    /* 0x05 */ u8 unused[ENTITY_DATA_SIZE - 2];
} MapEntity_PipeEnd PACKED;

static void Task_Pipe_Start(void)
{
    Sprite_ClearPipe *pipe = TASK_DATA(gCurTask);
    SpriteBase *base = &pipe->base;
    MapEntity_PipeStart *me = (MapEntity_PipeStart *)base->me;

    u8 spriteX = base->spriteX;
    s32 regionX = base->regionX;
    s32 regionY = base->regionY;

    s32 screenX, screenY;
    screenX = TO_WORLD_POS(spriteX, regionX);
    screenY = TO_WORLD_POS(me->y, regionY);

    if (!(gPlayer.moveState & MOVESTATE_DEAD) && (screenX <= Q_24_8_TO_INT(gPlayer.x))
        && ((screenX + 24) >= Q_24_8_TO_INT(gPlayer.x))
        && (screenY <= Q_24_8_TO_INT(gPlayer.y))
        && ((screenY + 24) >= Q_24_8_TO_INT(gPlayer.y))
        && (!(gPlayer.moveState & MOVESTATE_80000))) {
        u8 flag;

        gPlayer.transition = PLTRANS_PT25;

        flag = (me->unk3 & 0x03) << 4;
        flag |= me->unk4 & 0x0F;
        gPlayer.unk6E = flag;

        gPlayer.x = Q_24_8(screenX + 12);
        gPlayer.y = Q_24_8(screenY + 12);

        Player_SetMovestate_IsInScriptedSequence();

        gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__10;
        gPlayer.timerSpeedup = 0;

        m4aMPlayTempoControl(&gMPlayInfo_BGM, 0x100);
    }

    screenX -= gCamera.x;
    screenY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

static void Task_Pipe_End(void)
{
    Sprite_ClearPipe *pipe = TASK_DATA(gCurTask);
    SpriteBase *base = &pipe->base;
    MapEntity_PipeEnd *me = (MapEntity_PipeEnd *)base->me;

    u8 spriteX = base->spriteX;
    s32 regionX = base->regionX;
    s32 regionY = base->regionY;

    s32 screenX, screenY;
    screenX = TO_WORLD_POS(spriteX, regionX);
    screenY = TO_WORLD_POS(me->y, regionY);

    if (!(gPlayer.moveState & MOVESTATE_DEAD) && (screenX <= Q_24_8_TO_INT(gPlayer.x))
        && ((screenX + 24) >= Q_24_8_TO_INT(gPlayer.x))
        && (screenY <= Q_24_8_TO_INT(gPlayer.y))
        && ((screenY + 24) >= Q_24_8_TO_INT(gPlayer.y))
        && (gPlayer.moveState & MOVESTATE_80000)) {
        gPlayer.moveState &= ~(MOVESTATE_80000 | MOVESTATE_200 | MOVESTATE_IN_AIR);

        gPlayer.unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY; // priority bits
        gPlayer.unk90->s.unk10 |= SPRITE_FLAG(PRIORITY, 2);

        gPlayer.unk38 = FLAG_PLAYER_x38__LAYER_FOREGROUND;
        if (me->exitOnBackLayer) {
            gPlayer.unk38 = FLAG_PLAYER_x38__LAYER_BACKGROUND;
        }

        gPlayer.transition = PLTRANS_PT28;
        if (me->unk4 != 0) {
            gPlayer.transition = PLTRANS_PT5;
        }

        Player_ClearMovestate_IsInScriptedSequence();
    }

    screenX -= gCamera.x;
    screenY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

void CreateEntity_Pipe_Start(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                             u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_Pipe_Start, sizeof(Sprite_ClearPipe), 0x2010, 0, NULL);

    Sprite_ClearPipe *pipe = TASK_DATA(t);
    pipe->base.regionX = spriteRegionX;
    pipe->base.regionY = spriteRegionY;
    pipe->base.me = me;
    pipe->base.spriteX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);
}

void CreateEntity_Pipe_End(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                           u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_Pipe_End, sizeof(Sprite_ClearPipe), 0x2010, 0, NULL);

    Sprite_ClearPipe *pipe = TASK_DATA(t);
    pipe->base.regionX = spriteRegionX;
    pipe->base.regionY = spriteRegionY;
    pipe->base.me = me;
    pipe->base.spriteX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);
}
