#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/collision.h"

#include "constants/sa1/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite sprShip;
    /* 0x3C */ Sprite sprSegment;
    /* 0x6C */ Sprite sprHook;
    /* 0x9C */ s32 unk9C[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0xA4 */ u8 unkA4;
    /* 0xA5 */ u8 unkA5[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0xA7 */ u8 unkA7;
} ShipSwing;

void Task_ShipSwing(void);
void TaskDestructor_ShipSwing(Task *t);

#define SHIP_SWING_NUM_SEGMENTS 5

void CreateEntity_ShipSwing(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_ShipSwing, sizeof(ShipSwing), 0x7000, 0, TaskDestructor_ShipSwing);
    ShipSwing *swing = TASK_DATA(t);
    Sprite *sprShip = &swing->sprShip;
    Sprite *sprSegment = &swing->sprSegment;
    Sprite *sprHook = &swing->sprHook;
    CamCoord worldX, worldY;

    swing->base.regionX = regionX;
    swing->base.regionY = regionY;
    swing->base.me = me;
    swing->base.meX = me->x;
    swing->base.id = id;

    swing->unkA4 = 0;
    swing->unkA7 = 0;
    swing->unk9C[PLAYER_1] = 0;
    swing->unk9C[PLAYER_2] = 0;
    swing->unkA5[PLAYER_2] = 0;
    swing->unkA5[PLAYER_1] = 0;

    sprShip->x = TO_WORLD_POS(me->x, regionX);
    sprShip->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED_SIMPLE(me);

    sprShip->graphics.dest = ALLOC_TILES(SA1_ANIM_SHIP_SWING);
    sprShip->oamFlags = SPRITE_OAM_ORDER(4);
    sprShip->graphics.size = 0;
    sprShip->graphics.anim = SA1_ANIM_SHIP_SWING;
    sprShip->variant = 0;
    sprShip->animCursor = 0;
    sprShip->qAnimDelay = Q(0);
    sprShip->prevVariant = -1;
    sprShip->animSpeed = SPRITE_ANIM_SPEED(1.0);
    sprShip->palId = 0;
    sprShip->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    sprShip->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    sprHook->graphics.dest = ALLOC_TILES(SA1_ANIM_SHIP_SWING_HOOK);
    sprHook->oamFlags = SPRITE_OAM_ORDER(18);
    sprHook->graphics.size = 0;
    sprHook->graphics.anim = SA1_ANIM_SHIP_SWING_HOOK;
    sprHook->variant = 0;
    sprHook->animCursor = 0;
    sprHook->qAnimDelay = Q(0);
    sprHook->prevVariant = -1;
    sprHook->animSpeed = SPRITE_ANIM_SPEED(1.0);
    sprHook->palId = 0;
    sprHook->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    sprHook->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    sprSegment->graphics.dest = ALLOC_TILES(SA1_ANIM_SHIP_SWING_SEGMENT);
    sprSegment->oamFlags = SPRITE_OAM_ORDER(18);
    sprSegment->graphics.size = 0;
    sprSegment->graphics.anim = SA1_ANIM_SHIP_SWING_SEGMENT;
    sprSegment->variant = 0;
    sprSegment->animCursor = 0;
    sprSegment->qAnimDelay = Q(0);
    sprSegment->prevVariant = -1;
    sprSegment->animSpeed = SPRITE_ANIM_SPEED(1.0);
    sprSegment->palId = 0;
    sprSegment->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    sprSegment->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(sprShip);
    UpdateSpriteAnimation(sprHook);
    UpdateSpriteAnimation(sprSegment);
}

void Task_ShipSwing(void)
{
    Sprite *sprShip;
    Sprite *sprHook;
    Sprite *sprSegment;
    CamCoord worldX, worldY;
    CamCoord worldX2, worldY2;
    s32 dirX, dirY;
    s32 dtDirX;
    s32 dtDirY;
    u32 modRes;
    s16 sinRes;
    s32 theta;
    s8 r3;
    s32 i;
    u8 j;
    MapEntity *me;
    ShipSwing *swing;

    swing = TASK_DATA(gCurTask);
    sprShip = &swing->sprShip;
    sprSegment = &swing->sprSegment;
    sprHook = &swing->sprHook;
    me = swing->base.me;
    dtDirX = 0;
    dtDirY = 0;

    worldX = TO_WORLD_POS(swing->base.meX, swing->base.regionX);
    worldY = TO_WORLD_POS(me->y, swing->base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    modRes = Mod(gStageTime * 2, 0x200);

    if (modRes > 0x100) {
        modRes -= 0x100;
        modRes = 0x100 - modRes;

        r3 = (SIN(modRes * 2) >> 8);
    } else {
        r3 = -(SIN(modRes * 2) >> 8);
    }

    sinRes = SIN(((modRes - 0x7E) & 0x1FF) * 2);
    theta = ((sinRes >> 7) & 0x1FF);
    theta *= 2;
    dirX = SIN(theta);
    dirY = COS(theta) + r3;

    sprShip->x = worldX - gCamera.x;
    sprShip->y = worldY - gCamera.y;
    sprHook->x = worldX - gCamera.x;
    sprHook->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(sprShip->x, sprShip->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, swing->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(sprHook);

    // Inside this loop dtDirX|Y is used for segments,
    // afterwards it's the position-delta of the ship.
    for (j = 0; j < SHIP_SWING_NUM_SEGMENTS; j++) {
        dtDirX += Div(dirX * 110, 100);
        dtDirY += Div(dirY * 110, 100);

        sprSegment->x = worldX - gCamera.x + (dtDirX >> 10);
        sprSegment->y = worldY - gCamera.y + (dtDirY >> 10);

        if (j == SHIP_SWING_NUM_SEGMENTS - 1) {
            sprSegment->oamFlags = SPRITE_OAM_ORDER(3);
        } else {
            sprSegment->oamFlags = SPRITE_OAM_ORDER(18);
        }

        DisplaySprite(sprSegment);
    }

    sprShip->x = sprSegment->x;
    sprShip->y = sprSegment->y;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (Q(worldY - 4) > PLAYER(i).qWorldY) {
                if (Coll_Player_PlatformCrumbling(sprHook, worldX, worldY, &PLAYER(i)) & COLL_FLAG_8) {
                    if (!GetBit(swing->unkA7, i)) {
                        SetBit(swing->unkA7, i);
                    }
                } else {
                    if (GetBit(swing->unkA7, i)) {
                        ClearBit(swing->unkA7, i);
                        PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                        PLAYER(i).moveState &= ~MOVESTATE_20;
                    }
                }
            }

            if (swing->unkA5[i] > 0) {
                swing->unkA5[i]--;
            } else {
                if (Coll_Player_PlatformCrumbling(sprShip, (dtDirX >> 10) + worldX, (dtDirY >> 10) + worldY, &PLAYER(i)) & COLL_FLAG_8) {
                    if (!GetBit(swing->unkA4, i)) {
                        SetBit(swing->unkA4, i);
                    } else {
                        PLAYER(i).qWorldX += Q((worldX + (dtDirX >> 10)) - swing->unk9C[i]);
                        PLAYER(i).qWorldY = Q((worldY - 5 + (dtDirY >> 10)));
                    }

                    swing->unk9C[i] = worldX + (dtDirX >> 10);
                } else {
                    if (GetBit(swing->unkA4, i)) {
                        ClearBit(swing->unkA4, i);
                        swing->unkA5[i] = 5;
                        PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                        PLAYER(i).moveState &= ~MOVESTATE_20;
                    }
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    DisplaySprite(sprShip);
    SPRITE_FLAG_SET(sprShip, X_FLIP);
    DisplaySprite(sprShip);
    SPRITE_FLAG_CLEAR(sprShip, X_FLIP);
}

void TaskDestructor_ShipSwing(Task *t)
{
    ShipSwing *swing = TASK_DATA(t);

    VramFree(swing->sprShip.graphics.dest);
    VramFree(swing->sprSegment.graphics.dest);
    VramFree(swing->sprHook.graphics.dest);
}