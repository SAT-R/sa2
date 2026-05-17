#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"

typedef struct {
    EntityShared shared;
    s32 qUnk3C;
    s16 qUnk40;
    s16 unk42;
    s16 qUnk44; // Q() ?
    u8 unk46;
    u8 unk47;
    s16 unk48;
    s16 unk4A;
} KeroKero;

void Task_KeroKeroInit(void);
void Task_806D804(void);
void Task_806D124(void);
void Task_806D2B8(void);

void CreateEntity_KeroKero(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_KeroKeroInit, sizeof(KeroKero), 0x2000, 0, TaskDestructor_EntityShared);
    KeroKero *kerokero = TASK_DATA(t);
    Sprite *s = &kerokero->shared.s;

    kerokero->shared.base.regionX = regionX;
    kerokero->shared.base.regionY = regionY;
    kerokero->shared.base.me = me;
    kerokero->shared.base.meX = me->x;
    kerokero->shared.base.id = id;

    kerokero->qUnk40 = -Q(1);
    kerokero->qUnk3C = Q(0);
    kerokero->unk42 = 0;
    kerokero->qUnk44 = Q(0);
    kerokero->unk46 = 0;
    kerokero->unk47 = 0;
    kerokero->unk48 = 0;
    kerokero->unk4A = me->d.uData[3];

    // NOTE: x|y set to world- not screen-pos!
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_KEROKERO);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_KEROKERO;
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

void Task_KeroKeroInit(void)
{
    const u8 arr[8] = { 54, 43, 34, 32, 12, 100, 25, 32 };
    KeroKero *kerokero = TASK_DATA(gCurTask);
    Sprite *s = &kerokero->shared.s;
    MapEntity *me = kerokero->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    u8 sp10;

    worldX = TO_WORLD_POS(kerokero->shared.base.meX, kerokero->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, kerokero->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    worldX = worldX + I(kerokero->qUnk3C);
    worldY = worldY + kerokero->unk42;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, kerokero->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    kerokero->unk48++;

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        TaskDestroy(gCurTask);
        return;
    }

    if (kerokero->unk4A != 0) {
        kerokero->unk42 += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, +8, &sp10, SA2_LABEL(sub_801EE64));
    } else {
        kerokero->unk42 += SA2_LABEL(sub_801F07C)(worldY, worldX, 0, +8, &sp10, SA2_LABEL(sub_801EE64));
    }

    if (I(gPlayer.qWorldX) > worldX) {
        SPRITE_FLAG_SET(s, X_FLIP);
    } else {
        SPRITE_FLAG_CLEAR(s, X_FLIP);
    }

    if (kerokero->unk48 > 250) {
        kerokero->unk46 = 0;
        kerokero->unk48 -= 250;
        s->variant = 1;
        gCurTask->main = Task_806D124;
    } else if (kerokero->unk46 != 0) {
        kerokero->unk46--;
    } else {
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            if ((I(kerokero->qUnk3C) <= (me->d.sData[0] + me->d.uData[2] - 8) * TILE_WIDTH) && (I(gPlayer.qWorldX) >= worldX)
                && (worldX + 80 >= I(gPlayer.qWorldX))) {
                kerokero->qUnk44 = -Q(5);
                s->variant = 0;
                gCurTask->main = Task_806D2B8;

                kerokero->unk48 += arr[kerokero->unk47++];
                kerokero->unk47 &= 0x7;
            }
        } else if (I(kerokero->qUnk3C) >= ((me->d.sData[0] + 8) * TILE_WIDTH) && (I(gPlayer.qWorldX) <= worldX)
                   && (worldX - 80 <= I(gPlayer.qWorldX))) {
            {
                kerokero->qUnk44 = -Q(5);
                s->variant = 0;
                gCurTask->main = Task_806D2B8;
                kerokero->unk48 += arr[kerokero->unk47++];
                kerokero->unk47 &= 0x7;
            }
        }
    }

    DisplaySprite(s);
}

void Task_806D124(void)
{
    KeroKero *kerokero = TASK_DATA(gCurTask);
    Sprite *s = &kerokero->shared.s;
    MapEntity *me = kerokero->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    u8 sp10;

    worldX = TO_WORLD_POS(kerokero->shared.base.meX, kerokero->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, kerokero->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    worldX = worldX + I(kerokero->qUnk3C);
    worldY = worldY + kerokero->unk42;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, kerokero->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        TaskDestroy(gCurTask);
        return;
    }

    if (kerokero->unk4A != 0) {
        kerokero->unk42 += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, +8, &sp10, SA2_LABEL(sub_801EE64));
    } else {
        kerokero->unk42 += SA2_LABEL(sub_801F07C)(worldY, worldX, 0, +8, &sp10, SA2_LABEL(sub_801EE64));
    }

    if (++kerokero->unk46 > 60) {
        kerokero->unk46 = 0;
        s->variant = 0;
        gCurTask->main = Task_KeroKeroInit;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_806D2B8(void)
{
    KeroKero *kerokero = TASK_DATA(gCurTask);
    Sprite *s = &kerokero->shared.s;
    MapEntity *me = kerokero->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    u8 sp10;
    s32 res;

    worldX = TO_WORLD_POS(kerokero->shared.base.meX, kerokero->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, kerokero->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    kerokero->qUnk44 += Q(0.25);
    kerokero->unk42 += Div(kerokero->qUnk44, Q(1));

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        kerokero->qUnk3C += Q(1);
    } else {
        kerokero->qUnk3C -= Q(1);
    }

    worldX = worldX + I(kerokero->qUnk3C);
    worldY = worldY + kerokero->unk42;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, kerokero->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        TaskDestroy(gCurTask);
        return;
    }

    if (kerokero->unk4A != 0) {
        res = SA2_LABEL(sub_801F07C)(worldY, worldX, 1, +8, &sp10, SA2_LABEL(sub_801EE64));
    } else {
        res = SA2_LABEL(sub_801F07C)(worldY, worldX, 0, +8, &sp10, SA2_LABEL(sub_801EE64));
    }

    if (res <= 0) {
        kerokero->unk46 = 5;
        kerokero->unk42 += res;

        s->variant = 1;
        UpdateSpriteAnimation(s);
        s->variant = 0;
        gCurTask->main = Task_KeroKeroInit;

        if (I(gPlayer.qWorldX) > worldX) {
            SPRITE_FLAG_SET(s, X_FLIP);
        } else {
            SPRITE_FLAG_CLEAR(s, X_FLIP);
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}