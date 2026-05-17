#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/mp_event_mgr.h"

#include "constants/sa1/animations.h"

/* Blocks that fall down after stepping on them, in X-Zone */

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 qUnk44; //
    /* 0x48 */ s16 qUnk48; // worldX?
    /* 0x4A */ s16 qUnk4A; // worldY?
    /* 0x4C */ u16 unk4C;
} SmallFallBlock;

void Task_SmallFallBlockMain(void);
void Task_SmallFallBlock1(void);
void Task_SmallFallBlock2(void);
void TaskDestructor_SmallFallBlock(Task *t);

void CreateEntity_SmallFallBlock(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t;
    SmallFallBlock *block;
    Sprite *s;

    t = TaskCreate(Task_SmallFallBlockMain, sizeof(SmallFallBlock), 0x2000, 0, TaskDestructor_SmallFallBlock);

    block = TASK_DATA(t);
    s = &block->s;

    block->base.regionX = regionX;
    block->base.regionY = regionY;
    block->base.me = me;
    block->base.meX = me->x;
#ifdef BUG_FIX
    // NOTE(Jace): In Task_SmallFallBlock1() a Multiplayer-Event gets triggered,
    //             but without this fix, block->base.id never gets set.
    //
    //             So the call will just trigger the event for a random ID,
    //             instead of the specific one this entity is referred to.
    //
    // This bug could be the reason why these blocks only appear in the X-Zone.
    block->base.id = id;
#endif

    block->unk40 = 0;
    block->qUnk44 = 0;
    block->unk4C = 0;
    block->qUnk48 = 0;
    block->qUnk4A = 0;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_FALLING_BRICK_XZONE);
    s->variant = 0;
    s->graphics.anim = SA1_ANIM_FALLING_BRICK_XZONE;

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;

    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;

    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

void Task_SmallFallBlockMain(void)
{
    SmallFallBlock *block = TASK_DATA(gCurTask);
    Sprite *s = &block->s;
    CamCoord worldX, worldY;
    MapEntity *me = block->base.me;
    u32 res;

    worldX = TO_WORLD_POS(block->base.meX, block->base.regionX);
    worldY = TO_WORLD_POS(me->y, block->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    res = Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPlayer);

    if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
        res |= Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPartner);
    }

    if ((res & COLL_FLAG_8) && (gPlayer.stoodObj == s)) {
        gCurTask->main = Task_SmallFallBlock1;
        block->unk3C = 30;
    }

    if (IS_MULTI_PLAYER) {
        block->unk3C = 0;
        gCurTask->main = Task_SmallFallBlock2;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, block->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s))
        || ((gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX)
            && ((gPartner.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPartner.stoodObj == s)))) {
        if (block->unk4C != 0x100) {
            block->unk4C += 0x10;
        }
    } else {
        if (block->unk4C != 0) {
            block->unk4C -= 0x10;
        }
    }

    s->y += (SIN(block->unk4C) >> 12);

    DisplaySprite(s);
}

void Task_SmallFallBlock1(void)
{
    SmallFallBlock *block = TASK_DATA(gCurTask);
    Sprite *s = &block->s;
    CamCoord worldX, worldY;
    MapEntity *me = block->base.me;

    worldX = TO_WORLD_POS(block->base.meX, block->base.regionX);
    worldY = TO_WORLD_POS(me->y, block->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPlayer);

    if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
        Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPartner);
    }

    if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
        block->unk3C = 0;
        gCurTask->main = Task_SmallFallBlock2;
    } else if (--block->unk3C == 0) {
        block->unk3C = 0;
        gCurTask->main = Task_SmallFallBlock2;

        if (IS_MULTI_PLAYER) {
            RoomEvent_PlatformChange *roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_PLATFORM_CHANGE;
            roomEvent->x = block->base.regionX;
            roomEvent->y = block->base.regionY;
            roomEvent->id = block->base.id;
            roomEvent->action = 1;
        }
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, block->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s))
        || ((gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX)
            && ((gPartner.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPartner.stoodObj == s)))) {
        if (block->unk4C != 0x100) {
            block->unk4C += 0x10;
        }
    } else {
        if (block->unk4C != 0) {
            block->unk4C -= 0x10;
        }
    }

    s->y += (SIN(block->unk4C) >> 12);

    DisplaySprite(s);
}

void Task_SmallFallBlock2(void)
{
    SmallFallBlock *block = TASK_DATA(gCurTask);
    Sprite *s = &block->s;
    CamCoord worldX, worldY;
    MapEntity *me = block->base.me;
    u32 res;
    s32 i;

    block->qUnk4A += 0x2A;
    block->qUnk44 += block->qUnk4A;

    worldX = TO_WORLD_POS(block->base.meX, block->base.regionX);
    worldY = TO_WORLD_POS(me->y, block->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y + I(block->qUnk44);
    block->unk3C++;

    i = 0;
    do {
        Player *p = &PLAYER(i);

        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            if (block->unk3C > 32) {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                p->qSpeedAirY = block->qUnk4A;
            } else {
                p->qWorldX += block->qUnk48;
                p->qWorldY += Q(1) + block->qUnk4A;
            }
        }

        if (block->unk3C < 32) {
            Coll_Player_PlatformCrumbling(s, worldX, worldY + I(block->qUnk44), p);
        }

    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, block->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s))
        || ((gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX)
            && ((gPartner.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPartner.stoodObj == s)))) {
        if (block->unk4C != 0x100) {
            block->unk4C += 0x10;
        }
    } else {
        if (block->unk4C != 0) {
            block->unk4C -= 0x10;
        }
    }

    s->y += (SIN(block->unk4C) >> 12);

    DisplaySprite(s);
}

void TaskDestructor_SmallFallBlock(Task *t)
{
    SmallFallBlock *block = TASK_DATA(t);
    VramFree(block->s.graphics.dest);
}