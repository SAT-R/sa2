#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/player_controls.h"
#include "task.h"
#include "core.h"
#include "sprite.h"
#include "trig.h"
#include "game/entity.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    s32 unkC;
} Sprite_Corkscrew3D;

void Task_8061914(void);
void sub_8061AB0(void);
void Task_8061C70(void);
void Task_8061DA4(void);
void Task_8061F60(void);
void Task_8062100(void);
void Task_80622C8(void);
void Task_8062414(void);

void Task_8061914(void)
{
    Sprite_Corkscrew3D *corkscrew = TASK_DATA(gCurTask);
    MapEntity *me = corkscrew->base.me;

    u16 regionX = corkscrew->base.regionX;
    u16 regionY = corkscrew->base.regionY;
    s32 x = TO_WORLD_POS(corkscrew->base.spriteX, regionX);
    s32 y = TO_WORLD_POS(corkscrew->base.me->y, regionY);

    if (PLAYER_IS_ALIVE) {
        if ((x + (me->d.sData[0] * TILE_WIDTH) <= I(gPlayer.x)
             && (x + (me->d.sData[0] * TILE_WIDTH) + (me->d.uData[2] * TILE_WIDTH) >= I(gPlayer.x)))
            && (y + (me->d.sData[1] * TILE_WIDTH) <= I(gPlayer.y)
                && y + (me->d.sData[1] * TILE_WIDTH) + (me->d.uData[3] * TILE_WIDTH) >= I(gPlayer.y))) {
            if (x < I(gPlayer.x) && (corkscrew->base.spriteY & 1)) {
                s32 idx;
                s32 y24_8;
                gPlayer.transition = PLTRANS_PT27;

                idx = ((((I(gPlayer.x) - x) * 930) >> 8) + 256) & ONE_CYCLE;
                gPlayer.x += gPlayer.speedGroundX;
                y24_8 = Q(y);
                gPlayer.y = SIN_24_8(idx) * 24 + y24_8 - Q(28);

                gPlayer.speedAirY = 0;
                gCurTask->main = sub_8061AB0;
            } else if ((x >= I(gPlayer.x)) && gPlayer.speedGroundX > Q_8_8(4) && !(gPlayer.moveState & MOVESTATE_IN_AIR)
                       && !(gPlayer.frameInput & gPlayerControls.jump)) {
                corkscrew->base.spriteY |= 1;
            } else {
                corkscrew->base.spriteY &= ~1;
            }
        } else {
            corkscrew->base.spriteY &= ~1;
        }
    }

    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, x, y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, corkscrew->base.spriteX);
        TaskDestroy(gCurTask);
    }
}

void sub_8061AB0(void)
{
    s32 y24_8, idx;

    Sprite_Corkscrew3D *corkscrew = TASK_DATA(gCurTask);
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

    idx = I((I(player->x) - x) * 930);
    idx = (idx + 256) & ONE_CYCLE;

    player->x += player->speedGroundX;
    y24_8 = Q(y);
    player->y = SIN_24_8(idx) * 24 + y24_8 - Q(28);
    player->speedAirY = 0;

    if ((I(player->x) - x) > 0x8C) {
        player->x = Q(x + 0x8C);

        if (!(player->moveState & MOVESTATE_4)) {
            player->charState = 0x30;
        }
        gCurTask->main = Task_8061C70;
    } else {
        if (player->speedGroundX < corkscrew->unkC) {
            player->charState = 50;
            player->speedAirX = player->speedGroundX;
            player->transition = PLTRANS_PT5;
            gCurTask->main = Task_8061914;
        } else if (player->frameInput & gPlayerControls.jump) {
            player->charState = 50;
            player->speedAirX = player->speedGroundX;
            player->speedAirY = -Q(4.875);
            player->transition = PLTRANS_PT5;
            gCurTask->main = Task_8061914;
        } else if (!(player->moveState & MOVESTATE_4) && player->frameInput & DPAD_DOWN) {
            player->charState = 4;
            sub_8023B5C(player, 9);
            player->spriteOffsetX = 6;
            player->spriteOffsetY = 9;
            player->moveState |= MOVESTATE_4;
            m4aSongNumStart(SE_SPIN_ATTACK);
        } else if (!(player->moveState & MOVESTATE_4)) {
            player->anim = gPlayerCharacterIdleAnims[player->character] + SA2_CHAR_ANIM_68;
            player->variant = Div((idx - 282) & ONE_CYCLE, 94);
        }
    }
}

void Task_8061C70(void)
{
    Sprite_Corkscrew3D *corkscrew = TASK_DATA(gCurTask);
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

    player->speedGroundX++;

    player->x = x = Q(x + 0x8C);
    player->y += player->speedGroundX;
    player->speedAirY = 0;

    if ((I(player->y) - y) > 0xBE) {
        player->y = Q(y + 0xBE);

        if (!(player->moveState & MOVESTATE_4)) {
            player->charState = 0x2F;
        }
        gCurTask->main = Task_8061DA4;
    } else {
        if (player->speedGroundX < corkscrew->unkC) {
            player->charState = 50;
            player->speedAirX = 0;
            player->speedAirY = player->speedGroundX;
            player->transition = PLTRANS_PT5;
            gCurTask->main = Task_8061914;
        } else if (player->frameInput & gPlayerControls.jump) {
            player->charState = 50;
            player->speedAirX = 0;
            player->speedAirY = -Q(4.875);
            player->transition = PLTRANS_PT5;
            gCurTask->main = Task_8061914;
        } else if (!(player->moveState & MOVESTATE_4) && player->frameInput & DPAD_DOWN) {
            player->charState = 4;
            sub_8023B5C(player, 9);
            player->spriteOffsetX = 6;
            player->spriteOffsetY = 9;
            player->moveState |= MOVESTATE_4;
            m4aSongNumStart(SE_SPIN_ATTACK);
        }
    }
}

void Task_8061DA4(void)
{
    s32 y24_8, idx;

    Sprite_Corkscrew3D *corkscrew = TASK_DATA(gCurTask);
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

    if (I(player->x) - x > 0x1A8) {
        if (player->moveState & MOVESTATE_4) {
            player->transition = PLTRANS_PT2;
        } else {
            player->transition = PLTRANS_PT1;
        }
        gCurTask->main = Task_8061914;
        return;
    }

    y += 190;

    idx = I((I(player->x) - x) * 930);
    idx = (idx + 768) & ONE_CYCLE;

    player->x += player->speedGroundX;
    y24_8 = Q(y);
    player->y = SIN_24_8(idx) * 24 + y24_8 - Q(28);
    player->speedAirY = 0;

    if (player->speedGroundX < corkscrew->unkC) {
        player->charState = 50;
        player->speedAirX = player->speedGroundX;
        player->transition = PLTRANS_PT5;
        gCurTask->main = Task_8061914;
    } else if (player->frameInput & gPlayerControls.jump) {
        player->charState = 50;
        player->speedAirX = player->speedGroundX;
        player->speedAirY = -Q(4.875);
        player->transition = PLTRANS_PT5;
        gCurTask->main = Task_8061914;
    } else if (!(player->moveState & MOVESTATE_4) && player->frameInput & DPAD_DOWN) {
        player->charState = 4;
        sub_8023B5C(player, 9);
        player->spriteOffsetX = 6;
        player->spriteOffsetY = 9;
        player->moveState |= MOVESTATE_4;
        m4aSongNumStart(SE_SPIN_ATTACK);
    } else if (!(player->moveState & MOVESTATE_4)) {
        player->anim = gPlayerCharacterIdleAnims[player->character] + SA2_CHAR_ANIM_68;
        player->variant = Div((idx - 282) & ONE_CYCLE, 94);
    }
}

// Identical to sub_8061088
void Task_8061F60(void)
{
    Sprite_Corkscrew3D *corkscrew = TASK_DATA(gCurTask);
    MapEntity *me = corkscrew->base.me;

    u16 regionX = corkscrew->base.regionX;
    u16 regionY = corkscrew->base.regionY;
    s32 x = TO_WORLD_POS(corkscrew->base.spriteX, regionX);
    s32 y = TO_WORLD_POS(corkscrew->base.me->y, regionY);

    if (PLAYER_IS_ALIVE) {
        if ((x + (me->d.sData[0] * TILE_WIDTH) <= I(gPlayer.x)
             && (x + (me->d.sData[0] * TILE_WIDTH) + (me->d.uData[2] * TILE_WIDTH) >= I(gPlayer.x)))
            && (y + (me->d.sData[1] * TILE_WIDTH) <= I(gPlayer.y)
                && y + (me->d.sData[1] * TILE_WIDTH) + (me->d.uData[3] * TILE_WIDTH) >= I(gPlayer.y))) {
            if (x > I(gPlayer.x) && (corkscrew->base.spriteY & 1)) {
                s32 idx;
                s32 y24_8;
                gPlayer.transition = PLTRANS_PT27;

                idx = ((((I(gPlayer.x) - x) * 930) >> 8) + 256) & ONE_CYCLE;
                gPlayer.x += gPlayer.speedGroundX;
                y24_8 = Q(y);
                gPlayer.y = SIN_24_8(idx) * 24 + y24_8 - Q(28);

                gPlayer.speedAirY = 0;
                gCurTask->main = Task_8062100;
            } else if ((x <= I(gPlayer.x)) && gPlayer.speedGroundX < -Q_8_8(4) && !(gPlayer.moveState & MOVESTATE_IN_AIR)
                       && !(gPlayer.frameInput & gPlayerControls.jump)) {
                corkscrew->base.spriteY |= 1;
            } else {
                corkscrew->base.spriteY &= ~1;
            }
        } else {
            corkscrew->base.spriteY &= ~1;
        }
    }

    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, x, y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, corkscrew->base.spriteX);
        TaskDestroy(gCurTask);
    }
}

void Task_8062100(void)
{
    s32 y24_8, idx;

    Sprite_Corkscrew3D *corkscrew = TASK_DATA(gCurTask);
    MapEntity *me = corkscrew->base.me;

    u16 regionX = corkscrew->base.regionX;
    u16 regionY = corkscrew->base.regionY;
    Player *player = &gPlayer;
    s32 x = TO_WORLD_POS(corkscrew->base.spriteX, regionX);
    s32 y = TO_WORLD_POS(me->y, regionY);

    if (!PLAYER_IS_ALIVE) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, corkscrew->base.spriteX);
        TaskDestroy(gCurTask);
    } else {
        idx = I((I(player->x) - x) * 930);
        idx = (idx + 256) & ONE_CYCLE;

        player->x += player->speedGroundX;
        y24_8 = Q(y);
        player->y = SIN_24_8(idx) * 24 + y24_8 - Q(28);
        player->speedAirY = 0;

        if ((I(player->x) - x) < -288) {
            player->x = Q(x + -288);

            if (!(player->moveState & MOVESTATE_4)) {
                player->charState = 0x31;
            }

            gCurTask->main = Task_80622C8;
        } else if (player->speedGroundX > -corkscrew->unkC) {
            player->charState = 50;
            player->speedAirX = player->speedGroundX;
            player->transition = PLTRANS_PT5;
            gCurTask->main = Task_8061F60;
        } else if (player->frameInput & gPlayerControls.jump) {
            player->charState = 50;
            player->speedAirX = player->speedGroundX;
            player->speedAirY = -Q(4.875);
            player->transition = PLTRANS_PT5;
            gCurTask->main = Task_8061F60;
        } else if (!(player->moveState & MOVESTATE_4) && player->frameInput & DPAD_DOWN) {
            player->charState = 4;
            sub_8023B5C(player, 9);
            player->spriteOffsetX = 6;
            player->spriteOffsetY = 9;
            player->moveState |= MOVESTATE_4;
            m4aSongNumStart(SE_SPIN_ATTACK);
        } else if (!(player->moveState & MOVESTATE_4)) {
            player->anim = gPlayerCharacterIdleAnims[player->character] + SA2_CHAR_ANIM_68;
            player->variant = Div((idx - 282) & ONE_CYCLE, 94);
        }
    }
}

void Task_80622C8(void)
{
    Sprite_Corkscrew3D *corkscrew = TASK_DATA(gCurTask);
    MapEntity *me = corkscrew->base.me;

    u16 regionX = corkscrew->base.regionX;
    u16 regionY = corkscrew->base.regionY;
    Player *player = &gPlayer;
    s32 x = TO_WORLD_POS(corkscrew->base.spriteX, regionX);
    s32 y = TO_WORLD_POS(me->y, regionY);

    if (!PLAYER_IS_ALIVE) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, corkscrew->base.spriteX);
        TaskDestroy(gCurTask);
    } else {
        player->speedGroundX++;

        player->x = Q(x - 288);
        player->y += player->speedGroundX;
        player->speedAirY = 0;

        if ((I(player->y) - y) < -255) {
            player->y = Q(y - 255);

            if (!(player->moveState & MOVESTATE_4)) {
                player->charState = 0x2F;
            }

            gCurTask->main = Task_8062414;
        } else if (player->speedGroundX > -corkscrew->unkC) {
            player->charState = 50;
            player->speedAirX = 0;
            player->speedAirY = player->speedGroundX;
            player->transition = PLTRANS_PT5;
            gCurTask->main = Task_8061F60;
        } else if (player->frameInput & gPlayerControls.jump) {
            player->charState = 50;
            player->speedAirX = 0;
            player->speedAirY = -Q(4.875);
            player->transition = PLTRANS_PT5;
            gCurTask->main = Task_8061F60;
        } else if (!(player->moveState & MOVESTATE_4) && player->frameInput & DPAD_DOWN) {
            player->charState = 4;
            sub_8023B5C(player, 9);
            player->spriteOffsetX = 6;
            player->spriteOffsetY = 9;
            player->moveState |= MOVESTATE_4;
            m4aSongNumStart(SE_SPIN_ATTACK);
        }
    }
}

void Task_8062414(void)
{
    s32 y24_8, idx;

    Sprite_Corkscrew3D *corkscrew = TASK_DATA(gCurTask);
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

    if (I(player->x) - x < -424) {
        if (player->moveState & MOVESTATE_4) {
            player->transition = PLTRANS_PT2;
        } else {
            player->transition = PLTRANS_PT1;
        }
        gCurTask->main = Task_8061F60;
        return;
    }

    y -= 0xC3;

    idx = I((I(player->x) - x) * 930);
    idx = (idx + 768) & ONE_CYCLE;

    player->x += player->speedGroundX;
    y24_8 = Q(y);
    player->y = SIN_24_8(idx) * 24 + y24_8 - Q(28);
    player->speedAirY = 0;

    if (player->speedGroundX > -corkscrew->unkC) {
        player->charState = 50;
        player->speedAirX = player->speedGroundX;
        player->transition = PLTRANS_PT5;
        gCurTask->main = Task_8061F60;
    } else if (player->frameInput & gPlayerControls.jump) {
        player->charState = 50;
        player->speedAirX = player->speedGroundX;
        player->speedAirY = -Q(4.875);
        player->transition = PLTRANS_PT5;
        gCurTask->main = Task_8061F60;
    } else if (!(player->moveState & MOVESTATE_4) && player->frameInput & DPAD_DOWN) {
        player->charState = 4;
        sub_8023B5C(player, 9);
        player->spriteOffsetX = 6;
        player->spriteOffsetY = 9;
        player->moveState |= MOVESTATE_4;
        m4aSongNumStart(SE_SPIN_ATTACK);
    } else if (!(player->moveState & MOVESTATE_4)) {
        player->anim = gPlayerCharacterIdleAnims[player->character] + SA2_CHAR_ANIM_68;
        player->variant = Div((idx - 282) & ONE_CYCLE, 94);
    }
}

void CreateEntity_Corkscrew3D_Start(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_8061914, sizeof(Sprite_Corkscrew3D), 0x2000, 0, NULL);
    Sprite_Corkscrew3D *corkscrew = TASK_DATA(t);
    corkscrew->base.regionX = spriteRegionX;
    corkscrew->base.regionY = spriteRegionY;
    corkscrew->base.me = me;
    corkscrew->base.spriteX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);

    // Direction?
    corkscrew->base.spriteY = 0;
    corkscrew->unkC = +Q(4);
}

void CreateEntity_Corkscrew3D_End(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_8061F60, sizeof(Sprite_Corkscrew3D), 0x2000, 0, NULL);
    Sprite_Corkscrew3D *corkscrew = TASK_DATA(t);
    corkscrew->base.regionX = spriteRegionX;
    corkscrew->base.regionY = spriteRegionY;
    corkscrew->base.me = me;
    corkscrew->base.spriteX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);

    corkscrew->base.spriteY = 0;
    corkscrew->unkC = +Q(4);
}

// Unused, maybe inlined somewhere?
s32 sub_806267C(s32 x, s32 y, s16 p2)
{
    Player *p = &gPlayer;

    s32 py;

#ifndef NON_MATCHING
    register s32 px asm("r0") = ((I(p->x) - x) * 930) >> 8;
#else
    s32 px = ((I(p->x) - x) * 930) >> 8;
#endif

    px = (px + p2) & ONE_CYCLE;
    p->x += p->speedGroundX;

    py = Q(y);
    p->y = SIN_24_8(px) * 24 + py - Q(28);

    p->speedAirY = 0;

    return px;
}