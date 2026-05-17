#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/sa1/save.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

#define NUM_STORED_POSITIONS 64

typedef struct {
    /* 0x000 */ SpriteBase base;
    /* 0x00C */ Sprite s;
    /* 0x03C */ u8 filler3C[0xC];
    /* 0x048 */ Sprite s2;
    /* 0x078 */ u8 filler78[0xC];
    /* 0x084 */ Sprite s3;
    /* 0x0B4 */ s32 qUnkB4;
    /* 0x0B4 */ s32 unkB8;
    /* 0x0BC */ s16 unkBC;
    /* 0x0BE */ s16 qUnkBE;
    /* 0x0C0 */ s16 worldXs[NUM_STORED_POSITIONS];
    /* 0x140 */ s16 worldYs[NUM_STORED_POSITIONS];
    /* 0x1C0 */ bool8 unk1C0;
    /* 0x1C1 */ u8 unk1C1;
} Wamu;

void Task_Wamu(void);
void TaskDestructor_Wamu(Task *);

void CreateEntity_Wamu(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Wamu, sizeof(Wamu), 0x2000, 0, TaskDestructor_Wamu);
    Wamu *wamu = TASK_DATA(t);
    Sprite *s = &wamu->s;
#ifdef BUG_FIX
    CamCoord worldX, worldY;
#endif
    u8 i;

    wamu->base.regionX = regionX;
    wamu->base.regionY = regionY;
    wamu->base.me = me;
    wamu->base.meX = me->x;
    wamu->base.id = id;

    wamu->qUnkBE = -Q(0.625);
    wamu->qUnkB4 = Q(0);
    wamu->unkB8 = 0;
    wamu->unkBC = 100;
    wamu->unk1C0 = TRUE;

    /* Head */

    // NOTE: x|y set to world- not screen-pos!
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

#ifdef BUG_FIX
    // Assuming it is wanted behavior to set s->x|y to world pos on init, as this happens a lot,
    // we reserve the actual values, so that s2 and s3 can be set to them, too.
    worldX = s->x;
    worldY = s->y;
#endif

    for (i = 0; i < 64; i++) {
        wamu->worldXs[i] = s->x;
        wamu->worldYs[i] = s->y;
    }

    wamu->unk1C1 = 0;

#ifndef BUG_FIX
    SET_MAP_ENTITY_INITIALIZED(me);
#endif

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_WAMU);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_WAMU;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);

    /* Body */

    s = &wamu->s2;
#ifndef BUG_FIX
    s->x = TO_WORLD_POS(me->x, regionX); // BUG:  These are WRONG!
    s->y = TO_WORLD_POS(me->y, regionY); // NOTE: SET_MAP_ENTITY_INITIALIZED() is called before,
                                         //        so me->x is -1, not its initial value.
#else
    s->x = worldX;
    s->y = worldY;
#endif

#ifndef BUG_FIX
    SET_MAP_ENTITY_INITIALIZED(me);
#endif

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_WAMU);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_WAMU;
    s->variant = 1;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);

    /* Tail */
    s = &wamu->s3;

#ifndef BUG_FIX
    s->x = TO_WORLD_POS(me->x, regionX); // BUG:  These are WRONG!
    s->y = TO_WORLD_POS(me->y, regionY); // NOTE: SET_MAP_ENTITY_INITIALIZED() is called before,
                                         //        so me->x is -1, not its initial value.
#else
    s->x = worldX;
    s->y = worldY;
#endif

    // BUG-Prevention: Only call this after all s->x|ys were set.
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_WAMU);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_WAMU;
    s->variant = 2;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

// (86.18%) https://decomp.me/scratch/0Ocix
NONMATCH("asm/non_matching/game/sa1/stage/enemies/Wamu__Task_Wamu.inc", void Task_Wamu(void))
{
    MapEntity *me;
    Wamu *wamu;
    CamCoord worldX, worldY;
    Sprite *s;
    Sprite *s2;
    Sprite *s3;
    bool32 sp0C;
    s32 v;
    s32 worldX2, worldY2;

    sp0C = FALSE;
    wamu = TASK_DATA(gCurTask);
    s = &wamu->s;
    s2 = &wamu->s2;
    s3 = &wamu->s3;
    me = wamu->base.me;

    worldX = TO_WORLD_POS(wamu->base.meX, wamu->base.regionX);
    worldY = TO_WORLD_POS(me->y, wamu->base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    wamu->qUnkB4 += Div(COS(wamu->unkBC & ONE_CYCLE), 80 - me->d.uData[3] * (TILE_WIDTH / 2));
    worldX += I(wamu->qUnkB4);
    wamu->unkB8 += Div(SIN(wamu->unkBC & ONE_CYCLE), 80);
    worldY += I(wamu->unkB8);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        // Facing right
        if (wamu->unk1C0) {
            wamu->unkBC += 5;

            if ((u16)((wamu->unkBC & ONE_CYCLE) - 101) < 823) {
                wamu->unkBC = 100;
                wamu->unk1C0 = FALSE;
                sp0C = TRUE;
            }
        } else {
            // _0806F428
            wamu->unkBC -= 5;

            if ((u16)((wamu->unkBC & ONE_CYCLE) - 101) < 823) {
                wamu->unkBC = 924;
                wamu->unk1C0 = TRUE;
                sp0C = TRUE;
            }
        }
    } else {
        // Facing left
        // _0806F44C
        if (wamu->unk1C0) {
            wamu->unkBC += 5;

            if ((u32)(wamu->unkBC & ONE_CYCLE) > 612) {
                wamu->unkBC = 612;
                wamu->unk1C0 = FALSE;
                sp0C = TRUE;
            }
        } else {
            // _0806F47C
            wamu->unkBC -= 8;

            if ((u32)(wamu->unkBC & ONE_CYCLE) < 412) {
                wamu->unkBC = 412;
                wamu->unk1C0 = TRUE;
                sp0C = TRUE;
            }
        }
    }
    // _0806F49A

    {
        wamu->worldXs[(++wamu->unk1C1) % ARRAY_COUNT(wamu->worldXs)] = worldX;
        wamu->worldYs[(wamu->unk1C1) % ARRAY_COUNT(wamu->worldYs)] = worldY;

        if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, wamu->base.meX);
            TaskDestroy(gCurTask);
            return;
        }

        if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
            // Enemy defeated
            TaskDestroy(gCurTask);
            return;
        }
        // _0806F560

        if (I(wamu->qUnkB4) <= (me->d.sData[0] * TILE_WIDTH)) {
            if ((~s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) && sp0C) {
                wamu->qUnkBE = +Q(0.625);
                SPRITE_FLAG_SET(s, X_FLIP);
                SPRITE_FLAG_SET(s2, X_FLIP);
                SPRITE_FLAG_SET(s3, X_FLIP);

                wamu->unkBC ^= 0x100;
            }
        } else if (I(wamu->qUnkB4) >= ((me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH)) {
            // _0806F5A8
            if ((s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) && sp0C) {
                wamu->qUnkBE = -Q(0.625);
                SPRITE_FLAG_CLEAR(s, X_FLIP);
                SPRITE_FLAG_CLEAR(s2, X_FLIP);
                SPRITE_FLAG_CLEAR(s3, X_FLIP);

                wamu->unkBC ^= 0x100;
            }
        }
        // _0806F5F6

        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        s3->x = s->x - (wamu->worldXs[(wamu->unk1C1 - 24) % ARRAY_COUNT(wamu->worldXs)] - gCamera.x);
        v = (s3->x >> 1);

        s3->x = (wamu->worldXs[(wamu->unk1C1 - 24) % ARRAY_COUNT(wamu->worldXs)] - (s3->x >> 1)) - gCamera.x;
        s3->y = wamu->worldYs[(wamu->unk1C1 - 40) % ARRAY_COUNT(wamu->worldYs)] - gCamera.y;

        UpdateSpriteAnimation(s3);
        DisplaySprite(s3);

        if (HITBOX_IS_ACTIVE(s3->hitboxes[0])) {
            if (HB_COLLISION(worldX, worldY, s3->hitboxes[0].b, I(gPlayer.qWorldX), I(gPlayer.qWorldY), gPlayerBodyPSI.s.hitboxes[0].b)) {
                Coll_DamagePlayer(&gPlayer);
            }
        }
        // _0806F716
    }

    {
        s3->x = s->x - (wamu->worldXs[(wamu->unk1C1 - 19) % ARRAY_COUNT(wamu->worldXs)] - gCamera.x);
        v = (s3->x >> 1);
        s3->x = (wamu->worldXs[(wamu->unk1C1 - 19) % ARRAY_COUNT(wamu->worldXs)] - v) - gCamera.x;
        s3->y = (wamu->worldYs[(wamu->unk1C1 - 30) % ARRAY_COUNT(wamu->worldYs)]) - gCamera.y;

        DisplaySprite(s3);

        if (HITBOX_IS_ACTIVE(s3->hitboxes[0])) {
            if (HB_COLLISION(worldX, worldY, s3->hitboxes[0].b, I(gPlayer.qWorldX), I(gPlayer.qWorldY), gPlayerBodyPSI.s.hitboxes[0].b)) {
                Coll_DamagePlayer(&gPlayer);
            }
        }
        // _0806F716
    }

    {
        s2->x = s->x - (wamu->worldXs[(wamu->unk1C1 - 14) % ARRAY_COUNT(wamu->worldXs)] - gCamera.x);
        v = (s2->x >> 1);
        s2->x = (wamu->worldXs[(wamu->unk1C1 - 14) % ARRAY_COUNT(wamu->worldXs)] - v) - gCamera.x;
        s2->y = (wamu->worldYs[(wamu->unk1C1 - 20) % ARRAY_COUNT(wamu->worldYs)] - gCamera.y);

        UpdateSpriteAnimation(s2);
        DisplaySprite(s2);

        // _0806F5F6

        if (HITBOX_IS_ACTIVE(s2->hitboxes[0])) {
            if (HB_COLLISION(worldX, worldY, s2->hitboxes[0].b, I(gPlayer.qWorldX), I(gPlayer.qWorldY), gPlayerBodyPSI.s.hitboxes[0].b)) {
                Coll_DamagePlayer(&gPlayer);
            }
        }

        s2->x = s->x - (wamu->worldXs[(wamu->unk1C1 - 7) % ARRAY_COUNT(wamu->worldXs)] - gCamera.x);
        v = (s2->x >> 1);
        s2->x = ((wamu->worldXs[(wamu->unk1C1 - 7) % ARRAY_COUNT(wamu->worldXs)]) - v) - gCamera.x;
        s2->y = wamu->worldYs[(wamu->unk1C1 - 10) % ARRAY_COUNT(wamu->worldYs)] - gCamera.y;

        DisplaySprite(s2);

        if (HITBOX_IS_ACTIVE(s2->hitboxes[0])) {
            if (HB_COLLISION(worldX, worldY, s2->hitboxes[0].b, I(gPlayer.qWorldX), I(gPlayer.qWorldY), gPlayerBodyPSI.s.hitboxes[0].b)) {
                Coll_DamagePlayer(&gPlayer);
            }
        }
        // _0806F716
    }
}
END_NONMATCH

void TaskDestructor_Wamu(Task *t)
{
    Wamu *wamu = TASK_DATA(t);

    VramFree(wamu->s.graphics.dest);
    VramFree(wamu->s2.graphics.dest);
    VramFree(wamu->s3.graphics.dest);
}