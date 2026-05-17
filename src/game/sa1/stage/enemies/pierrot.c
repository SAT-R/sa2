#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/move_states.h"
#include "constants/zones.h"

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ Hitbox ball;
    /* 0x44 */ s32 qUnk44;
    /* 0x48 */ s16 qUnk48;
    /* 0x4A */ s16 unk4A;
} Pierrot;

void Task_Pierrot(void);

void CreateEntity_Pierrot(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t;
    Pierrot *pierrot;
    Sprite *s;

    t = TaskCreate(Task_Pierrot, sizeof(Pierrot), 0x2000, 0, TaskDestructor_EntityShared);

    pierrot = TASK_DATA(t);
    s = &pierrot->shared.s;

    pierrot->shared.base.regionX = regionX;
    pierrot->shared.base.regionY = regionY;
    pierrot->shared.base.me = me;
    pierrot->shared.base.meX = me->x;
    pierrot->shared.base.id = id;
    pierrot->qUnk48 = -Q(0.625);
    pierrot->qUnk44 = 0;
    pierrot->unk4A = 0;

    // NOTE: x|y set to world- not screen-pos!
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_PIERROT);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_PIERROT;
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

// (96.18%) https://decomp.me/scratch/pMzfF
NONMATCH("asm/non_matching/game/sa1/stage/enemies/Task_Pierrot.inc", void Task_Pierrot(void))
{
    Pierrot *pierrot = TASK_DATA(gCurTask);
    Sprite *s = &pierrot->shared.s;
    MapEntity *me = pierrot->shared.base.me;
    s32 worldX32, worldY32;
    s16 worldX, worldY;
    u8 sp08[4];

    worldX32 = TO_WORLD_POS(pierrot->shared.base.meX, pierrot->shared.base.regionX);
    worldY32 = TO_WORLD_POS(me->y, pierrot->shared.base.regionY);

    worldX = worldX32;
    worldY = worldY32;

    pierrot->qUnk44 += pierrot->qUnk48;
    worldX += I(pierrot->qUnk44);
    worldY += pierrot->unk4A;
    worldY -= Q(0.1875);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pierrot->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }
    // _0806DE7C

    if (PLAYER_IS_ALIVE) {
        if (s->hitboxes[1].index != HITBOX_STATE_INACTIVE) {
            // _0806DEA0
            if (HB_COLLISION(worldX, worldY, s->hitboxes[1].b, I(gPlayer.qWorldX), I(gPlayer.qWorldY), gPlayerBodyPSI.s.hitboxes[0].b)) {
                if (gPlayer.moveState & MOVESTATE_SPIN_ATTACK) {
                    if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
                        if (gPlayer.qSpeedGround > 0) {
                            gPlayer.qWorldX += gPlayer.qSpeedGround;
                        } else {
                            gPlayer.qWorldX -= gPlayer.qSpeedGround;
                        }

                        gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
                    } else {
                        // _0806DF7C
                        if (gPlayer.qSpeedGround < 0) {
                            gPlayer.qWorldX += gPlayer.qSpeedGround;
                        } else {
                            gPlayer.qWorldX -= gPlayer.qSpeedGround;
                        }

                        gPlayer.moveState |= MOVESTATE_FACING_LEFT;
                    }

                    NEGATE(gPlayer.qSpeedGround);
                    NEGATE(gPlayer.qSpeedAirX);
                } else {
                    // _0806DFB0
                    Coll_DamagePlayer(&gPlayer);
                }
            }
        }

        if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
            TaskDestroy(gCurTask);
            return;
        }
    }
    // _0806DFB6

    pierrot->unk4A += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, 8, sp08, SA2_LABEL(sub_801EE64));

    if (I(pierrot->qUnk44) <= me->d.sData[0] * TILE_WIDTH) {
        pierrot->qUnk48 = +Q(0.625);
        SPRITE_FLAG_SET(s, X_FLIP);
    } else if (I(pierrot->qUnk44) >= (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH) {
        // _0806E024
        pierrot->qUnk48 = -Q(0.625);
        SPRITE_FLAG_CLEAR(s, X_FLIP);
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
END_NONMATCH
