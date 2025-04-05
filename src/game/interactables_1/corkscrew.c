#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "task.h"
#include "core.h"
#include "sprite.h"
#include "trig.h"
#include "game/stage/player_controls.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    s32 unkC;
    s32 unk10;
} Sprite_Corkscrew;

void sub_8060ED0(void);

void Task_8060D34(void)
{
    Sprite_Corkscrew *corkscrew = TASK_DATA(gCurTask);
    MapEntity *me = corkscrew->base.me;

    u16 regionX = corkscrew->base.regionX;
    u16 regionY = corkscrew->base.regionY;
    s32 x = TO_WORLD_POS(corkscrew->base.spriteX, regionX);
    s32 y = TO_WORLD_POS(corkscrew->base.me->y, regionY);

    if (PLAYER_IS_ALIVE) {
        if ((x + (me->d.sData[0] * TILE_WIDTH) <= I(gPlayer.qWorldX)
             && (x + (me->d.sData[0] * TILE_WIDTH) + (me->d.uData[2] * TILE_WIDTH) >= I(gPlayer.qWorldX)))
            && (y + (me->d.sData[1] * TILE_WIDTH) <= I(gPlayer.qWorldY)
                && y + (me->d.sData[1] * TILE_WIDTH) + (me->d.uData[3] * TILE_WIDTH) >= I(gPlayer.qWorldY))) {
            if (x < I(gPlayer.qWorldX) && (corkscrew->base.id & 1)) {
                s32 idx;
                s32 y24_8;
                gPlayer.transition = PLTRANS_CORKSCREW;

                idx = ((((I(gPlayer.qWorldX) - x) * 930) >> 8) + 256) & ONE_CYCLE;
                gPlayer.qWorldX += gPlayer.qSpeedGround;
                y24_8 = Q(y);
                gPlayer.qWorldY = SIN_24_8(idx) * 24 + y24_8 - Q(28);

                gPlayer.qSpeedAirY = 0;
                gCurTask->main = sub_8060ED0;
            } else if ((x >= I(gPlayer.qWorldX)) && gPlayer.qSpeedGround > Q_8_8(4) && !(gPlayer.moveState & MOVESTATE_IN_AIR)
                       && !(gPlayer.frameInput & gPlayerControls.jump)) {
                corkscrew->base.id |= 1;
            } else {
                corkscrew->base.id &= ~1;
            }
        } else {
            corkscrew->base.id &= ~1;
        }
    }

    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, x, y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, corkscrew->base.spriteX);
        TaskDestroy(gCurTask);
    }
}

void sub_8060ED0(void)
{
    s32 y24_8, idx;

    Sprite_Corkscrew *corkscrew = TASK_DATA(gCurTask);
    MapEntity *me = corkscrew->base.me;

    u16 regionX = corkscrew->base.regionX;
    u16 regionY = corkscrew->base.regionY;
    Player *player = &gPlayer;
    s32 x = TO_WORLD_POS(corkscrew->base.spriteX, regionX);
    s32 y = TO_WORLD_POS(me->y, regionY);

    if (!PLAYER_IS_ALIVE) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, corkscrew->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (I(player->qWorldX) - x > 0x230) {
        if (player->moveState & MOVESTATE_4) {
            player->transition = PLTRANS_CORKSCREW_END;
        } else {
            player->transition = PLTRANS_TOUCH_GROUND;
        }
        gCurTask->main = Task_8060D34;
        return;
    }

    idx = I((I(player->qWorldX) - x) * 930);
    idx = (idx + 256) & ONE_CYCLE;

    player->qWorldX += player->qSpeedGround;
    y24_8 = Q(y);
    player->qWorldY = SIN_24_8(idx) * 24 + y24_8 - Q(28);
    player->qSpeedAirY = 0;

    if (player->qSpeedGround < corkscrew->unk10) {
        player->charState = CHARSTATE_CURLED_IN_AIR;
        player->qSpeedAirX = player->qSpeedGround;
        player->transition = PLTRANS_UNCURL;
        gCurTask->main = Task_8060D34;
    } else if (player->frameInput & gPlayerControls.jump) {
        player->charState = CHARSTATE_CURLED_IN_AIR;
        player->qSpeedAirX = player->qSpeedGround;
        player->qSpeedAirY = -Q(4.875);
        player->transition = PLTRANS_UNCURL;
        gCurTask->main = Task_8060D34;
    } else if (!(player->moveState & MOVESTATE_4) && player->frameInput & DPAD_DOWN) {
        player->charState = CHARSTATE_SPIN_ATTACK;
        PLAYERFN_CHANGE_SHIFT_OFFSETS(player, 6, 9);
        player->moveState |= MOVESTATE_4;
        m4aSongNumStart(SE_SPIN_ATTACK);
    } else if (!(player->moveState & MOVESTATE_4)) {
        player->anim = gPlayerCharacterIdleAnims[player->character] + SA2_CHAR_ANIM_68;
        player->variant = Div((idx - 282) & ONE_CYCLE, 94);
    }
}

void sub_8061228(void);

void sub_8061088(void)
{
    Sprite_Corkscrew *corkscrew = TASK_DATA(gCurTask);
    MapEntity *me = corkscrew->base.me;

    u16 regionX = corkscrew->base.regionX;
    u16 regionY = corkscrew->base.regionY;
    s32 x = TO_WORLD_POS(corkscrew->base.spriteX, regionX);
    s32 y = TO_WORLD_POS(corkscrew->base.me->y, regionY);

    if (PLAYER_IS_ALIVE) {
        if ((x + (me->d.sData[0] * TILE_WIDTH) <= I(gPlayer.qWorldX)
             && (x + (me->d.sData[0] * TILE_WIDTH) + (me->d.uData[2] * TILE_WIDTH) >= I(gPlayer.qWorldX)))
            && (y + (me->d.sData[1] * TILE_WIDTH) <= I(gPlayer.qWorldY)
                && y + (me->d.sData[1] * TILE_WIDTH) + (me->d.uData[3] * TILE_WIDTH) >= I(gPlayer.qWorldY))) {
            if (x > I(gPlayer.qWorldX) && (corkscrew->base.id & 1)) {
                s32 idx;
                s32 y24_8;
                gPlayer.transition = PLTRANS_CORKSCREW;

                idx = ((((I(gPlayer.qWorldX) - x) * 930) >> 8) + 256) & ONE_CYCLE;
                gPlayer.qWorldX += gPlayer.qSpeedGround;
                y24_8 = Q(y);
                gPlayer.qWorldY = SIN_24_8(idx) * 24 + y24_8 - Q(28);

                gPlayer.qSpeedAirY = 0;
                gCurTask->main = sub_8061228;
            } else if ((x <= I(gPlayer.qWorldX)) && gPlayer.qSpeedGround < -Q_8_8(4) && !(gPlayer.moveState & MOVESTATE_IN_AIR)
                       && !(gPlayer.frameInput & gPlayerControls.jump)) {
                corkscrew->base.id |= 1;
            } else {
                corkscrew->base.id &= ~1;
            }
        } else {
            corkscrew->base.id &= ~1;
        }
    }

    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, x, y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, corkscrew->base.spriteX);
        TaskDestroy(gCurTask);
    }
}

void sub_8061228(void)
{
    s32 y24_8, idx;

    Sprite_Corkscrew *corkscrew = TASK_DATA(gCurTask);
    MapEntity *me = corkscrew->base.me;

    u16 regionX = corkscrew->base.regionX;
    u16 regionY = corkscrew->base.regionY;
    Player *player = &gPlayer;
    s32 x = TO_WORLD_POS(corkscrew->base.spriteX, regionX);
    s32 y = TO_WORLD_POS(me->y, regionY);

    if (!PLAYER_IS_ALIVE) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, corkscrew->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (I(player->qWorldX) - x < -0x230) {
        if (player->moveState & MOVESTATE_4) {
            player->transition = PLTRANS_CORKSCREW_END;
        } else {
            player->transition = PLTRANS_TOUCH_GROUND;
        }
        gCurTask->main = sub_8061088;
        return;
    }

    idx = I((I(player->qWorldX) - x) * 930);
    idx = (idx + 256) & ONE_CYCLE;

    player->qWorldX += player->qSpeedGround;
    y24_8 = Q(y);
    player->qWorldY = SIN_24_8(idx) * 24 + y24_8 - Q(28);
    player->qSpeedAirY = 0;

    if (player->qSpeedGround > corkscrew->unk10) {
        player->charState = CHARSTATE_CURLED_IN_AIR;
        player->qSpeedAirX = player->qSpeedGround;
        player->transition = PLTRANS_UNCURL;
        gCurTask->main = sub_8061088;
    } else if (player->frameInput & gPlayerControls.jump) {
        player->charState = CHARSTATE_CURLED_IN_AIR;
        player->qSpeedAirX = player->qSpeedGround;
        player->qSpeedAirY = -Q(4.875);
        player->transition = PLTRANS_UNCURL;
        gCurTask->main = sub_8061088;
    } else if (!(player->moveState & MOVESTATE_4) && player->frameInput & DPAD_DOWN) {
        player->charState = CHARSTATE_SPIN_ATTACK;
        PLAYERFN_CHANGE_SHIFT_OFFSETS(player, 6, 9);
        player->moveState |= MOVESTATE_4;
        m4aSongNumStart(SE_SPIN_ATTACK);
    } else if (!(player->moveState & MOVESTATE_4)) {
        player->anim = gPlayerCharacterIdleAnims[player->character] + SA2_CHAR_ANIM_68;
        player->variant = Div((idx - 282) & ONE_CYCLE, 94);
    }
}

void CreateEntity_Corkscrew_Start(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_8060D34, sizeof(Sprite_Corkscrew), 0x2000, 0, NULL);
    Sprite_Corkscrew *corkscrew = TASK_DATA(t);
    corkscrew->base.regionX = spriteRegionX;
    corkscrew->base.regionY = spriteRegionY;
    corkscrew->base.me = me;
    corkscrew->base.spriteX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);

    // Direction?
    corkscrew->base.id = 0;
    corkscrew->unk10 = Q(4);
}

void CreateEntity_Corkscrew_End(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_8061088, sizeof(Sprite_Corkscrew), 0x2000, 0, NULL);
    Sprite_Corkscrew *corkscrew = TASK_DATA(t);
    corkscrew->base.regionX = spriteRegionX;
    corkscrew->base.regionY = spriteRegionY;
    corkscrew->base.me = me;
    corkscrew->base.spriteX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);

    corkscrew->unk10 = -Q(4);
}

// Unused calc which could have been re-used for both forwards
// and backwards
UNUSED s32 sub_806148C(s32 x, s32 y)
{
    s32 y24_8;
    s32 idx = ((((I(gPlayer.qWorldX) - x) * 930) >> 8) + 256) & ONE_CYCLE;

    gPlayer.qWorldX += gPlayer.qSpeedGround;
    y24_8 = Q(y);
    gPlayer.qWorldY = SIN_24_8(idx) * 24 + y24_8 - Q(28);
    gPlayer.qSpeedAirY = 0;
    return idx;
}
