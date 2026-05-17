#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
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
#include "constants/zones.h"

#define LAVA_SPURT_RATE TIME(0, 1.7)

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
    /* 0x44 */ Sprite s2;
    /* 0x74 */ u8 unk74;
    /* 0x78 */ s32 qUnk78;
    /* 0x7C */ s32 qUnk7C;
    /* 0x80 */ s32 unk80;
    /* 0x84 */ s32 unk84;
} UnderwaterLavaPlatform; /* 0x88 */

void Task_UnderwaterLavaPlatform(void);
void Task_80929A0(void);
void TaskDestructor_UnderwaterLavaPlatform(Task *t);

void CreateEntity_UnderwaterLavaPlatform(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_UnderwaterLavaPlatform, sizeof(UnderwaterLavaPlatform), 0x2000, 0, TaskDestructor_UnderwaterLavaPlatform);
    UnderwaterLavaPlatform *platform = TASK_DATA(t);
    Sprite *s = &platform->s;
    Sprite *s2 = &platform->s2;

    platform->base.regionX = regionX;
    platform->base.regionY = regionY;
    platform->base.me = me;
    platform->base.meX = me->x;
    platform->base.id = id;

    platform->qUnk78 = 0;
    platform->qUnk7C = 0;
    platform->unk74 = 0;
    platform->unk80 = 0;
    platform->unk84 = 0;

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_PLATFORM_LAVA_SPURT);
    s->graphics.anim = SA1_ANIM_PLATFORM_LAVA;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    s2->graphics.dest = ALLOC_TILES(SA1_ANIM_PLATFORM_HORZ_4_PURPLE);
    s2->graphics.anim = SA1_ANIM_PLATFORM_HORZ_4_PURPLE;
    s2->variant = 0;
    s2->oamFlags = SPRITE_OAM_ORDER(17);
    s2->graphics.size = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = Q(0);
    s2->prevVariant = -1;
    s2->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s2->palId = 0;
    s2->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s2->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

void Task_UnderwaterLavaPlatform(void)
{
    CamCoord worldX, worldY;
    UnderwaterLavaPlatform *platform;
    MapEntity *me;
    Sprite *s;
    Sprite *s2;
    s32 i;

    platform = TASK_DATA(gCurTask);
    me = platform->base.me;
    s = &platform->s;
    s2 = &platform->s2;

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y - 3;
    s2->x = worldX - gCamera.x;
    s2->y = worldY - gCamera.y;

    i = 0;
    do {
        s32 qPrevPlayerX = PLAYER(i).qWorldX;

        if (Coll_Player_PlatformCrumbling(s2, worldX, worldY, &PLAYER(i)) & COLL_FLAG_8) {
            PLAYER(i).qWorldY = Q(worldY - 27);
            PLAYER(i).moveState &= ~MOVESTATE_IN_AIR;
        }

        PLAYER(i).qWorldX = qPrevPlayerX;

        Coll_Player_Platform(s, worldX, worldY, &PLAYER(i));
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Mod(gStageTime, LAVA_SPURT_RATE) == 0) {
        platform->unk84 = LAVA_SPURT_RATE;
        platform->unk74 = 0;
        platform->qUnk78 = -Q(5);
        platform->qUnk7C = +Q(0);
        platform->unk80 = 3;

        s->graphics.anim = SA1_ANIM_PLATFORM_LAVA_SPURT;
        s->variant = 0;
        s->prevVariant = -1;
        m4aSongNumStart(SE_LAVA_PLATFORM_SPURT);
        gCurTask->main = Task_80929A0;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);
}

// (97.66%) https://decomp.me/scratch/cj6rs
NONMATCH("asm/non_matching/game/sa1/stage/interactables/lava_platform__Task_80929A0.inc", void Task_80929A0(void))
{
    CamCoord worldX, worldY;
    UnderwaterLavaPlatform *platform;
    MapEntity *me;
    Sprite *s;
    Sprite *s2;
    s32 i;

    platform = TASK_DATA(gCurTask);
    me = platform->base.me;
    s = &platform->s;
    s2 = &platform->s2;

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    platform->qUnk78 += Q(37. / 256.);
    platform->qUnk7C += platform->qUnk78;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y - 3;

    s2->x = worldX - gCamera.x;
    s2->y = worldY - gCamera.y + I(platform->qUnk7C);

    i = 0;
    do {
        // _08092A34_loop
        if (GetBit(platform->unk74, i)) {
            if (!Coll_Player_Entity_Intersection(s2, worldX, worldY + I(platform->qUnk7C), &PLAYER(i))) {
                ClearBit(platform->unk74, i);
                // asm("");
            } else {
                PLAYER(i).qWorldY += platform->qUnk78;
            }
        } else {
            // _08092AC8
            if (Coll_Player_PlatformCrumbling(s2, worldX, worldY + I(platform->qUnk7C), &PLAYER(i))) {
                PLAYER(i).qWorldY = Q(worldY + I(platform->qUnk7C) - 27);
                SetBit(platform->unk74, i);

                if (PLAYER(i).moveState & MOVESTATE_IN_AIR) {
                    ClearBit(platform->unk74, i);
                }

                if (PLAYER(i).qSpeedAirY == Q(0)) {
                    if (PLAYER(i).charState != CHARSTATE_WALK_A) {
                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                        PLAYER(i).charState = CHARSTATE_WALK_A;
                    }
                }
            } else {
                ClearBit(platform->unk74, i);
                // asm("");
            }
        }
    } while (++i < gNumSingleplayerCharacters);
    // _08092BF4

    if (--platform->unk84 == 48) {
        s->prevVariant = -1;
        s->graphics.anim = SA1_ANIM_PLATFORM_LAVA;
        s->variant = 0;

        // goto _08092E54;
        UpdateSpriteAnimation(s);
    } else if ((platform->unk84 >= 49) && (platform->unk84 < 96)) {
        // _08092C2E
        i = 0;
        do {
            if (PLAYER_SPR_INFO_HITBOX(i, 0)->index != HITBOX_STATE_INACTIVE) {
                if (HB_COLLISION(worldX, worldY, s->hitboxes[1].b, I(PLAYER(i).qWorldX), I(PLAYER(i).qWorldY),
                                 PLAYER_SPR_INFO_HITBOX(i, 0)->b

                                 )) {
                    Coll_DamagePlayer(&PLAYER(i));
                }
            }
        } while (++i < gNumSingleplayerCharacters);

        UpdateSpriteAnimation(s);

    } else if (platform->unk84 < 48) {
        // _08092E68
        if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
            s->prevVariant = -1;
            s->graphics.anim = SA1_ANIM_PLATFORM_LAVA;
            s->variant = 0;
        }
        UpdateSpriteAnimation(s);
    }
    // _08092E92

    if (platform->qUnk7C >= Q(0)) {
        if (--platform->unk80 != 0) {
            platform->qUnk78 = -Div(platform->qUnk78 * 2, 5);
            platform->unk74 = 0;
            platform->qUnk7C = Q(0);
        } else {
            // _08092EC8
            s->prevVariant = -1;
            s->graphics.anim = SA1_ANIM_PLATFORM_LAVA;
            s->variant = 0;

            gCurTask->main = Task_UnderwaterLavaPlatform;
        }
    }

    // _08092EE6
    DisplaySprite(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);
}
END_NONMATCH

void TaskDestructor_UnderwaterLavaPlatform(Task *t)
{
    UnderwaterLavaPlatform *platform = TASK_DATA(t);
    VramFree(platform->s.graphics.dest);
    VramFree(platform->s2.graphics.dest);
}