#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/collision.h"
#include "game/sa1/save.h"
#include "game/shared/stage/entities_manager.h"

#include "constants/sa1/animations.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ s16 unk3C;
    /* 0x3E */ s16 unk3E;
    /* 0x40 */ s32 qUnk40;
    /* 0x44 */ s16 unk44;
    /* 0x46 */ s16 unk46;
    /* 0x48 */ s16 qUnk48;
} Senbon; /* 0x4C */

void Task_SenbonInit(void);
void Task_8070CB4(void);

void CreateEntity_Senbon(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t;
    Senbon *senbon;
    Sprite *s;

    if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_2) //
        && (LOADED_SAVE->difficultyLevel != DIFFICULTY_NORMAL)) {
        return;
    }

    t = TaskCreate(Task_SenbonInit, sizeof(Senbon), 0x2000, 0, TaskDestructor_EntityShared);
    senbon = TASK_DATA(t);
    s = &senbon->shared.s;

    senbon->shared.base.regionX = regionX;
    senbon->shared.base.regionY = regionY;
    senbon->shared.base.me = me;
    senbon->shared.base.meX = me->x;
    senbon->shared.base.id = id;

    senbon->qUnk48 = -Q(0.625);
    senbon->qUnk40 = 0;
    senbon->unk3C = 0;
    senbon->unk44 = 0;
    senbon->unk46 = 0;

    // NOTE: x|y set to world- not screen-pos!
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SENBON);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_SENBON;
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

// (93.28%) https://decomp.me/scratch/MhFur
NONMATCH("asm/non_matching/game/sa1/stage/enemies/Senbon__Task_SenbonInit.inc", void Task_SenbonInit(void))
{
    Senbon *senbon = TASK_DATA(gCurTask);
    Sprite *s = &senbon->shared.s;
    MapEntity *me = senbon->shared.base.me;
    s16 worldX, worldY;
    s16 offsetWorldX;

    worldX = TO_WORLD_POS(senbon->shared.base.meX, senbon->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, senbon->shared.base.regionY);

    senbon->qUnk40 += senbon->qUnk48;
    offsetWorldX = worldX + I(senbon->qUnk40);

    s->x = offsetWorldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, senbon->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, offsetWorldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    if (I(senbon->qUnk40) <= ((me->d.sData[0] + 1) * TILE_WIDTH)) {
        senbon->qUnk48 = +Q(0.625); // TODO: DISPLAY_HEIGHT?
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
    } else if (I(senbon->qUnk40) >= ((me->d.sData[0] + me->d.uData[2] - 1) * TILE_WIDTH)) {
        senbon->qUnk48 = -Q(0.625); // TODO: DISPLAY_HEIGHT?
        s->frameFlags &= ~SPRITE_FLAG(X_FLIP, 1);
    } else if (senbon->unk46 != 0) {
        senbon->unk46--;
    } else {
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            if ((I(gPlayer.qWorldX) >= offsetWorldX) //
                && ((offsetWorldX + 80) >= I(gPlayer.qWorldX))) {
                senbon->unk44 = 0;

                s->variant = 1;
                gCurTask->main = Task_8070CB4;
            }
        } else {
            if ((I(gPlayer.qWorldX) <= offsetWorldX) //
                && ((offsetWorldX - 80) <= I(gPlayer.qWorldX))) {
                senbon->unk44 = 0;

                s->variant = 1;
                gCurTask->main = Task_8070CB4;
            }
        }
    }
    // _08070C8C

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
END_NONMATCH

void Task_8070CB4(void)
{
    MapEntity *me;
    Sprite *s;
    s16 screenX, screenY;
    s32 worldX, worldY;
    s32 worldX32, worldY32;

    Senbon *senbon = TASK_DATA(gCurTask);

    s = &senbon->shared.s;
    me = senbon->shared.base.me;
    worldX32 = TO_WORLD_POS(senbon->shared.base.meX, senbon->shared.base.regionX);
    worldY32 = TO_WORLD_POS(me->y, senbon->shared.base.regionY);
    worldX = (CamCoord)worldX32;
    worldY = (CamCoord)worldY32;
    screenX = worldX + I(senbon->qUnk40);
    screenY = worldY + (senbon->unk3C & 0xFFFF);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, senbon->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (s->hitboxes[0].index != -1) {
        if (HB_COLLISION(screenX, screenY, s->hitboxes[0].b, I(gPlayer.qWorldX), I(gPlayer.qWorldY), gPlayerBodyPSI.s.hitboxes[0].b)) {
            Coll_DamagePlayer(&gPlayer);
        }
    }

    if (++senbon->unk44 >= 60) {
        senbon->unk46 = 120;
        s->variant = 0;
        gCurTask->main = Task_SenbonInit;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
