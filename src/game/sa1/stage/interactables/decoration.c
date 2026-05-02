#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/dust_cloud.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/interactables.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/sa1/zones.h"

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
} Decoration;

typedef struct {
    /* 0x00 */ Sprite s1;
    /* 0x30 */ Sprite s2;
    /* 0x60 */ Sprite s3;
    /* 0x90 */ Sprite s4;
    /* 0xC0 */ SpriteTransform transform1;
    /* 0xCC */ SpriteTransform transform2;
    /* 0xD8 */ SpriteTransform transform3;
    /* 0xE4 */ SpriteTransform transform4;
    /* 0xF0 */ u16 unkF0;
    /* 0xF2 */ s16 qUnkF2;
} DecorationDebris; /* 0xF4 */

void Task_DecorationMain(void);
void CreateDecorationDebris(s16 vecX, s16 vecY);
void Task_DecorationDebrisMain(void);
void TaskDestructor_DecorationDebris(struct Task *t);

void CreateEntity_Decoration(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    struct Task *t = TaskCreate(Task_DecorationMain, sizeof(Decoration), 0x2000, 0, TaskDestructor_EntityShared);
    Decoration *deco = TASK_DATA(t);
    Sprite *s = &deco->shared.s;

    deco->shared.base.regionX = regionX;
    deco->shared.base.regionY = regionY;
    deco->shared.base.me = me;
    deco->shared.base.meX = me->x;
    deco->shared.base.id = id;

    // NOTE: Initializing sprite pos to world pos
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_ROCK);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_ROCK;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;

    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

void Task_DecorationMain(void)
{
    Decoration *deco = TASK_DATA(gCurTask);
    Sprite *s = &deco->shared.s;
    MapEntity *me = deco->shared.base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(deco->shared.base.meX, deco->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, deco->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
        CreateDustCloud(worldX, worldY);
        m4aSongNumStart(SE_ITEM_BOX);

        gSpriteTransformX = s->x;
        gSpriteTransformY = s->y;

        CreateDecorationDebris(worldX - s->x, worldY - s->y - 16);

        if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPlayer.moveState |= MOVESTATE_IN_AIR;
        }

        TaskDestroy(gCurTask);
        return;
    } else {
        if (sub_800C394(s, worldX, worldY, &gPlayer)
            || (gPlayer.character == CHARACTER_AMY && Coll_AmyHammer_Spring(s, worldX, worldY, &gPlayer))
            || ((gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) && sub_800C394(s, worldX, worldY, &gPartner))) {
            CreateDustCloud(worldX, worldY);

            if ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s)) {
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                gPlayer.moveState |= MOVESTATE_IN_AIR;
            }

            if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
                if ((gPartner.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPartner.stoodObj == s)) {
                    gPartner.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    gPartner.moveState |= MOVESTATE_IN_AIR;
                }
            }

            m4aSongNumStart(SE_ITEM_BOX);

            gSpriteTransformX = s->x;
            gSpriteTransformY = s->y;

            CreateDecorationDebris(worldX - s->x, worldY - s->y - 16);

            if (IS_MULTI_PLAYER) {
                RoomEvent_PlatformChange *roomEvent = CreateRoomEvent();
                roomEvent->type = ROOMEVENT_TYPE_PLATFORM_CHANGE;
                roomEvent->x = deco->shared.base.regionX;
                roomEvent->y = deco->shared.base.regionY;
                roomEvent->id = deco->shared.base.id;
                roomEvent->action = 0;
            }

            TaskDestroy(gCurTask);
            return;
        } else {
            Coll_Player_Platform(s, worldX, worldY, &gPlayer);

            if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
                Coll_Player_Platform(s, worldX, worldY, &gPartner);
            }

            if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
                SET_MAP_ENTITY_NOT_INITIALIZED(me, deco->shared.base.meX);
                TaskDestroy(gCurTask);
                return;
            } else {
                DisplaySprite(s);
            }
        }
    }
}

void CreateDecorationDebris(s16 vecX, s16 vecY)
{
    struct Task *t = TaskCreate(Task_DecorationDebrisMain, sizeof(DecorationDebris), 0x2000, 0, TaskDestructor_DecorationDebris);
    DecorationDebris *debris = TASK_DATA(t);
    Sprite *s = &debris->s1;
    SpriteTransform *tf = &debris->transform1;
    s32 tfOffsetY;

    debris->unkF0 = 0;
    debris->qUnkF2 = -Q(2);

    /* Sprite/Transform 1 */
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_ROCK_DEBRIS_S);
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_ROCK_DEBRIS_S;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) | SPRITE_FLAG(ROT_SCALE, 16);

    tf->rotation = 0;
    tf->qScaleX = Q(1);
    tf->qScaleY = Q(1);
    tf->x = vecX;
    tf->y = vecY;
    UpdateSpriteAnimation(s);

    /* Sprite/Transform 2 */
#ifdef BUG_FIX
    DmaCopy16(3, s, &debris->s2, sizeof(debris->s2));
    s = &debris->s2;
    DmaCopy16(3, tf, &debris->transform2, sizeof(debris->transform2));
    tf = &debris->transform2;
#else
    DmaCopy16(3, s, (s = &debris->s2), sizeof(debris->s2));
    DmaCopy16(3, tf, (tf = &debris->transform2), sizeof(debris->transform2));
#endif

    s->frameFlags = SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) | SPRITE_FLAG(ROT_SCALE, 17);
    tf->y = vecY - 16;

    /* Sprite/Transform 3 */
    s = &debris->s3;
#ifndef NON_MATCHING
    DmaCopy16(3, tf, (tf = &debris->transform3), sizeof(*tf));
#else
    DmaCopy16(3, tf, &debris->transform3, sizeof(*tf));
    tf = &debris->transform3;
#endif

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_ROCK_DEBRIS_L);
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_ROCK_DEBRIS_L;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) | SPRITE_FLAG(ROT_SCALE, 18);

    tf->y = vecY;
    UpdateSpriteAnimation(s);

    /* Sprite/Transform 4 */
#ifdef BUG_FIX
    DmaCopy16(3, s, &debris->s4, sizeof(debris->s4));
    s = &debris->s4;
    DmaCopy16(3, tf, &debris->transform4, sizeof(debris->transform4));
    tf = &debris->transform4;
#else
    DmaCopy16(3, s, (s = &debris->s4), sizeof(debris->s4));
    DmaCopy16(3, tf, (tf = &debris->transform4), sizeof(debris->transform4));
#endif

    s->frameFlags = SPRITE_FLAG(ROT_SCALE_ENABLE, 1) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) | SPRITE_FLAG(ROT_SCALE, 19);
    tf->y = vecY - 16;
}

void Task_DecorationDebrisMain(void)
{
    DecorationDebris *debris = TASK_DATA(gCurTask);
    Sprite *s = &debris->s1;
    SpriteTransform *tf;
    u16 oldTransformX, oldTransformY;
    s16 qScale;

    if (debris->unkF0++ > 60) {
        TaskDestroy(gCurTask);
        return;
    }
    // _080236D8

    debris->qUnkF2 += Q(40. / 256.);

    tf = &debris->transform1;
    tf->y += I(debris->qUnkF2);
    oldTransformX = tf->x;
    oldTransformY = tf->y;
    tf->x -= gCamera.x;
    tf->y -= gCamera.y;
    tf->x -= debris->unkF0 * 2;

    qScale = tf->qScaleX + 8;

    if (qScale > Q(2)) {
        qScale = Q(2);
    }

    tf->qScaleX = qScale;
    tf->qScaleY = qScale;
    tf->rotation -= 42;

    SPRITE_FLAG_CLEAR(s, ROT_SCALE);
    SPRITE_FLAG_SET_VALUE(s, ROT_SCALE, gOamMatrixIndex++);

    SA2_LABEL(sub_8004E14)(s, tf);
    DisplaySprite(s);

    tf->x = oldTransformX;
    tf->y = oldTransformY;

    /* Sprite/Transform 2 */
    s = &debris->s2;
    tf = &debris->transform2;
    tf->y += I(debris->qUnkF2);
    oldTransformX = tf->x;
    oldTransformY = tf->y;
    tf->x -= gCamera.x;
    tf->y -= gCamera.y;
    tf->x += debris->unkF0;

    tf->qScaleX = qScale;
    tf->qScaleY = qScale;
    tf->rotation += 42;

    SPRITE_FLAG_CLEAR(s, ROT_SCALE);
    SPRITE_FLAG_SET_VALUE(s, ROT_SCALE, gOamMatrixIndex++);

    SA2_LABEL(sub_8004E14)(s, tf);
    DisplaySprite(s);

    tf->x = oldTransformX;
    tf->y = oldTransformY;

    /* Sprite/Transform 3 */
    s = &debris->s3;
    tf = &debris->transform3;
    tf->y += I(debris->qUnkF2);
    oldTransformX = tf->x;
    oldTransformY = tf->y;
    tf->x -= gCamera.x;
    tf->y -= gCamera.y;
    tf->x += debris->unkF0 * 2;

    tf->qScaleX = qScale;
    tf->qScaleY = qScale;
    tf->rotation += 14;

    SPRITE_FLAG_CLEAR(s, ROT_SCALE);
    SPRITE_FLAG_SET_VALUE(s, ROT_SCALE, gOamMatrixIndex++);

    SA2_LABEL(sub_8004E14)(s, tf);
    DisplaySprite(s);

    tf->x = oldTransformX;
    tf->y = oldTransformY;

    /* Sprite/Transform 4 */
    s = &debris->s4;
    tf = &debris->transform4;
    tf->y += I(debris->qUnkF2);
    oldTransformX = tf->x;
    oldTransformY = tf->y;
    tf->x -= gCamera.x;
    tf->y -= gCamera.y;
    tf->x -= debris->unkF0;

    tf->qScaleX = qScale;
    tf->qScaleY = qScale;
    tf->rotation -= 14;

    SPRITE_FLAG_CLEAR(s, ROT_SCALE);
    SPRITE_FLAG_SET_VALUE(s, ROT_SCALE, gOamMatrixIndex++);

    SA2_LABEL(sub_8004E14)(s, tf);
    DisplaySprite(s);

    tf->x = oldTransformX;
    tf->y = oldTransformY;
}

void TaskDestructor_DecorationDebris(struct Task *t)
{
    DecorationDebris *debris = TASK_DATA(t);
    VramFree(debris->s1.graphics.dest);
    VramFree(debris->s3.graphics.dest);
}
