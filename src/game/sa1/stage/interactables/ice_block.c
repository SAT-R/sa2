#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/dust_cloud.h"
#include "game/shared/stage/entities_manager.h" // TaskDestructor_EntityShared
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/water_effects.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/zones.h"

typedef struct {
    /* 0x00 */ EntityShared shared;
} IceBlock;

typedef struct {
    /* 0x00 */ Sprite sprites[4];
    /* 0xC0 */ SpriteTransform transforms[4];
    /* 0xF0 */ u16 unkF0;
    /* 0xF2 */ s16 qUnkF2;
} IceBlockShards; /* 0xF4 */

void Task_IceBlock(void);
void Task_IceBlockShards(void);
void TaskDestructor_IceBlockShards(struct Task *t);
void CreateIceBlockShards(CamCoord worldX, CamCoord worldY);
u32 sub_8091E88(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p);

void CreateEntity_IceBlock(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    struct Task *t = TaskCreate(Task_IceBlock, sizeof(IceBlock), 0x2000, 0, TaskDestructor_EntityShared);
    IceBlock *block = TASK_DATA(t);
    Sprite *s = &block->shared.s;

    block->shared.base.regionX = regionX;
    block->shared.base.regionY = regionY;
    block->shared.base.me = me;
    block->shared.base.meX = me->x;
    block->shared.base.id = id;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_ICE_BLOCK);
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_ICE_BLOCK;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

// (98.28%) https://decomp.me/scratch/DNDs3
NONMATCH("asm/non_matching/game/sa1/stage/interactables/ice_block__Task_IceBlock.inc", void Task_IceBlock(void))
{
    MapEntity *me;
    IceBlock *block;
    s32 i = 0;
    Sprite *s;
    CamCoord worldX, worldY;

    block = TASK_DATA(gCurTask);
    s = &block->shared.s;
    me = block->shared.base.me;

    worldX = TO_WORLD_POS(block->shared.base.meX, block->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, block->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
        CreateDustCloud(worldX, worldY);
        m4aSongNumStart(SE_ITEM_BOX);

        gSpriteTransformX = s->x;
        gSpriteTransformY = s->y;

        CreateIceBlockShards(worldX - s->x, worldY - 16 - s->y);

        TaskDestroy(gCurTask);
        return;
    } else {
        // _080918AC
        // i = 0;
        do {
            // _080918C0_loop
            Player *p = &PLAYER(i);
            if (!(p->moveState & MOVESTATE_DEAD)) {
                bool32 r8 = 0;
                if (p->charState == CHARSTATE_SPINATTACK) {
                    u32 res = Coll_Player_Platform(s, worldX, worldY, p);

                    if (p->character != CHARACTER_AMY) {
                        r8 = (-(res & COLL_FLAG_8)) >> 31;
                    } else {
                        r8 = 0;
                    }
                } else {
#ifndef NON_MATCHING
                    register s32 r3 asm("r3");
                    asm("mov %0, #0\n"
                        ""
                        : "=r"(r3), "=r"(r8));
                    r8 = r3;
#else
                    r8 = 0;
#endif
                }
                // _08091920

                if (sub_800C394(s, worldX, worldY, p) || sub_8091E88(s, worldX, worldY, p) || r8) {
                    // _0809194E
                    s32 j = 0;
                    do {
                        Player *p = &PLAYER(j);
                        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && p->stoodObj == s) {
                            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                            p->moveState |= MOVESTATE_IN_AIR;
                        }
                    } while (++j < gNumSingleplayerCharacters);

                    CreateDustCloud(worldX, worldY);
                    m4aSongNumStart(SE_ITEM_BOX);

                    gSpriteTransformX = s->x;
                    gSpriteTransformY = s->y;

                    CreateIceBlockShards(worldX - s->x, worldY - 16 - s->y);

                    if (IS_MULTI_PLAYER) {
                        RoomEvent_PlatformChange *roomEvent;
                        roomEvent = CreateRoomEvent();
                        roomEvent->type = ROOMEVENT_TYPE_PLATFORM_CHANGE;
                        roomEvent->x = block->shared.base.regionX;
                        roomEvent->y = block->shared.base.regionY;
                        roomEvent->id = block->shared.base.id;
                        roomEvent->action = 0;
                    }

                    m4aSongNumStart(SE_193);
                    TaskDestroy(gCurTask);
                    return;
                }
            }

            Coll_Player_Platform(s, worldX, worldY, p);
        } while (++i < gNumSingleplayerCharacters);
        // _08091A22

        if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, block->shared.base.meX);
            TaskDestroy(gCurTask);
            return;
        }

        DisplaySprite(s);
    }
}
END_NONMATCH

/* NOTE: Ice Shard code almost entirely code-pasted from boulder_spawner.c
         We might be able to inline them?
*/

void CreateIceBlockShards(CamCoord x, CamCoord y)
{
    struct Task *t = TaskCreate(Task_IceBlockShards, sizeof(IceBlockShards), 0x2000, 0, TaskDestructor_IceBlockShards);
    IceBlockShards *debris = TASK_DATA(t);

    Sprite *s;
    SpriteTransform *tf;

    {
        s = &debris->sprites[0];
        tf = &debris->transforms[0];

        debris->unkF0 = 0;
        debris->qUnkF2 = -Q(2);
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_ICE_BLOCK_SHARDS_S);
        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_ICE_BLOCK_SHARDS_S;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG(ROT_SCALE, 16);

        tf->rotation = 0;
        tf->qScaleX = Q(1);
        tf->qScaleY = Q(1);
        tf->x = x;
        tf->y = y;

        UpdateSpriteAnimation(s);

#ifdef BUG_FIX
        DmaCopy16(3, s, &debris->sprites[1], sizeof(debris->sprites[1]));
        s = &debris->sprites[1];
        DmaCopy16(3, tf, &debris->transforms[1], sizeof(debris->transforms[1]));
        tf = &debris->transforms[1];
#else
        DmaCopy16(3, s, (s = &debris->sprites[1]), sizeof(*s));
        DmaCopy16(3, tf, (tf = &debris->transforms[1]), sizeof(*tf));
#endif

        s->frameFlags = SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG(ROT_SCALE, 17);
        tf->y = y - 16;
    }

    s = &debris->sprites[2];

#ifdef BUG_FIX
    DmaCopy16(3, tf, &debris->transforms[2], sizeof(debris->transforms[1]));
    tf = &debris->transforms[2];
#else
    DmaCopy16(3, tf, (tf = &debris->transforms[2]), sizeof(*tf));
#endif
    {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_ICE_BLOCK_SHARDS_L);
        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_ICE_BLOCK_SHARDS_L;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG(ROT_SCALE, 18);

        tf->y = y;

        UpdateSpriteAnimation(s);

#ifdef BUG_FIX
        DmaCopy16(3, s, &debris->sprites[3], sizeof(debris->sprites[3]));
        s = &debris->sprites[3];
        DmaCopy16(3, tf, &debris->transforms[3], sizeof(debris->transforms[3]));
        tf = &debris->transforms[3];
#else
        DmaCopy16(3, s, (s = &debris->sprites[3]), sizeof(*s));
        DmaCopy16(3, tf, (tf = &debris->transforms[3]), sizeof(*tf));
#endif

        s->frameFlags = SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG(ROT_SCALE, 19);
        tf->y = y - 16;
    }
}

void Task_IceBlockShards(void)
{
    IceBlockShards *debris = TASK_DATA(gCurTask);
    Sprite *s = &debris->sprites[0];
    SpriteTransform *tf;
    s16 prevTransformX, prevTransformY;
    s16 scale;

    if (debris->unkF0++ > 80) {
        TaskDestroy(gCurTask);
        return;
    }

    debris->qUnkF2 += Q(40. / 256.);

    { // 0
        tf = &debris->transforms[0];
        tf->y += I(debris->qUnkF2);

        prevTransformX = tf->x;
        prevTransformY = tf->y;
        tf->x -= gCamera.x;
        tf->y -= gCamera.y;
        tf->x -= debris->unkF0 * 2;

        scale = tf->qScaleX + Q(1. / 256.);
        if (scale > Q(2)) {
            scale = Q(2);
        }

        tf->qScaleX = scale;
        tf->qScaleY = scale;
        tf->rotation -= Q(42. / 256.);
        SPRITE_FLAG_CLEAR(s, ROT_SCALE);
        s->frameFlags |= gOamMatrixIndex++;
        SA2_LABEL(sub_8004E14)(s, tf);
        DisplaySprite(s);
        tf->x = prevTransformX;
        tf->y = prevTransformY;
    }

    { // 1
        s = &debris->sprites[1];
        tf = &debris->transforms[1];
        tf->y += I(debris->qUnkF2);

        prevTransformX = tf->x;
        prevTransformY = tf->y;
        tf->x -= gCamera.x;
        tf->y -= gCamera.y;
        tf->x += debris->unkF0;

        tf->qScaleX = scale;
        tf->qScaleY = scale;
        tf->rotation += Q(42. / 256.);
        SPRITE_FLAG_CLEAR(s, ROT_SCALE);
        s->frameFlags |= gOamMatrixIndex++;
        SA2_LABEL(sub_8004E14)(s, tf);
        DisplaySprite(s);
        tf->x = prevTransformX;
        tf->y = prevTransformY;
    }

    { // 2
        s = &debris->sprites[2];
        tf = &debris->transforms[2];
        tf->y += I(debris->qUnkF2);

        prevTransformX = tf->x;
        prevTransformY = tf->y;
        tf->x -= gCamera.x;
        tf->y -= gCamera.y;
        tf->x += debris->unkF0 * 2;

        tf->qScaleX = scale;
        tf->qScaleY = scale;
        tf->rotation += Q(14. / 256.);
        SPRITE_FLAG_CLEAR(s, ROT_SCALE);
        s->frameFlags |= gOamMatrixIndex++;
        SA2_LABEL(sub_8004E14)(s, tf);
        DisplaySprite(s);
        tf->x = prevTransformX;
        tf->y = prevTransformY;
    }

    { // 3
        s = &debris->sprites[3];
        tf = &debris->transforms[3];
        tf->y += I(debris->qUnkF2);

        prevTransformX = tf->x;
        prevTransformY = tf->y;
        tf->x -= gCamera.x;
        tf->y -= gCamera.y;
        tf->x -= debris->unkF0;

        tf->qScaleX = scale;
        tf->qScaleY = scale;
        tf->rotation -= Q(14. / 256.);
        SPRITE_FLAG_CLEAR(s, ROT_SCALE);
        s->frameFlags |= gOamMatrixIndex++;
        SA2_LABEL(sub_8004E14)(s, tf);
        DisplaySprite(s);
        tf->x = prevTransformX;
        tf->y = prevTransformY;
    }
}

u32 sub_8091E88(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p)
{
    u32 result = 0;

    if ((p->character == CHARACTER_AMY)
        && (p->charState == 87 || p->charState == 88 || p->charState == 89 || p->charState == 92 || p->charState == 90)
        && (p->spriteInfoBody->s.hitboxes[1].index != HITBOX_STATE_INACTIVE)
        && (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), p->spriteInfoBody->s.hitboxes[1].b))) {
        result = TRUE;
    }

    else if ((p->character == CHARACTER_TAILS)
             && (p->charState == 53 || p->charState == 54 || p->charState == 5 || p->charState == 6 || p->charState == 7)
             && (p->spriteInfoBody->s.hitboxes[1].index != HITBOX_STATE_INACTIVE)
             && (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), p->spriteInfoBody->s.hitboxes[1].b))) {
        result = TRUE;
    }

    else if ((p->character == CHARACTER_SONIC) && (p->charState == 5 || p->charState == 6 || p->charState == 7)
             && (p->spriteInfoBody->s.hitboxes[1].index != HITBOX_STATE_INACTIVE)
             && HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), p->spriteInfoBody->s.hitboxes[1].b)) {
        result = TRUE;
    }

    else if ((p->character == CHARACTER_KNUCKLES)
             && (p->charState == 62 || p->charState == 63 || p->charState == 64 || p->charState == 65 || p->charState == 66
                 || p->charState == 67 || p->charState == 68 || p->charState == 69 || p->charState == 5 || p->charState == 6
                 || p->charState == 7)
             && (p->spriteInfoBody->s.hitboxes[1].index != HITBOX_STATE_INACTIVE)
             && HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), p->spriteInfoBody->s.hitboxes[1].b)) {
        result = TRUE;
    }

    return result;
}

void TaskDestructor_IceBlockShards(struct Task *t)
{
    IceBlockShards *debris = TASK_DATA(t);
    VramFree(debris->sprites[0].graphics.dest);
    VramFree(debris->sprites[2].graphics.dest);
}
