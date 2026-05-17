#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/water_effects.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
    /* 0x40 */ s32 qUnk40;
    /* 0x44 */ s32 qUnk44;
    /* 0x48 */ s16 qUnk48;
    /* 0x4A */ s16 qUnk4A;
    /* 0x4C */ u16 unk4C;
} PlatformThin;

void Task_PlatformThin(void);
void Task_PlatformThin_Falling(void);
void Task_802473C(void);
void Task_802492C(void);
void TaskDestructor_PlatformThin(Task *t);

const AnimId sPlatformThinAnims[NUM_LEVEL_IDS] = {
    SA1_ANIM_PLATFORM_HORZ_1,   SA1_ANIM_PLATFORM_HORZ_1, // Zone 1
    SA1_ANIM_PLATFORM_HORZ_2,   SA1_ANIM_PLATFORM_HORZ_2, // Zone 2
    SA1_ANIM_PLATFORM_HORZ_3,   SA1_ANIM_PLATFORM_HORZ_3, // Zone 3
    SA1_ANIM_PLATFORM_HORZ_4,   SA1_ANIM_PLATFORM_HORZ_4, // Zone 4
    SA1_ANIM_PLATFORM_HORZ_5,   SA1_ANIM_PLATFORM_HORZ_5, // Zone 5
    SA1_ANIM_PLATFORM_HORZ_6_1, SA1_ANIM_PLATFORM_HORZ_6_2, // Zone 6
    SA1_ANIM_PLATFORM_HORZ_7_1, SA1_ANIM_PLATFORM_HORZ_6_1, // Zone 7
    SA1_ANIM_PLATFORM_HORZ_1,   SA1_ANIM_PLATFORM_HORZ_2, // MP 1, 2
    SA1_ANIM_PLATFORM_HORZ_3,   SA1_ANIM_PLATFORM_HORZ_6_2, // MP 3, 4
};

void CreateEntity_PlatformThin(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_PlatformThin, sizeof(PlatformThin), 0x2010, 0, TaskDestructor_PlatformThin);
    PlatformThin *platform = TASK_DATA(t);
    SpriteBase *base = &platform->base;
    Sprite *s = &platform->s;

    base->regionX = regionX;
    base->regionY = regionY;
    base->me = me;
    base->meX = me->x;
    base->id = id;

    platform->qUnk40 = 0;
    platform->qUnk44 = 0;
    platform->unk4C = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            platform->qUnk48 = 4;
            platform->unk3C = 0;
            platform->qUnk4A = 0;
        } else {
            platform->qUnk48 = 4;
            platform->unk3C = 0x80;
            platform->qUnk4A = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            platform->qUnk48 = 0;
            platform->qUnk4A = 4;
            platform->unk3C = 0;
        } else {
            platform->qUnk48 = 0;
            platform->qUnk4A = 4;
            platform->unk3C = 0x80;
        }
    }

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_PLATFORM_HORZ_1);

    s->variant = 0;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
#ifdef BUG_FIX
        // Prevent overflow
        s->graphics.anim = sPlatformThinAnims[gCurrentLevel % ARRAY_COUNT(sPlatformThinAnims)];
#else
        s->graphics.anim = sPlatformThinAnims[gCurrentLevel];
#endif
    } else {
        s->graphics.anim = SA1_ANIM_PLATFORM_HORZ_1;
    }
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

// TODO: Fake-match
void Task_PlatformThin(void)
{
    s32 sp00 = 0;
    s32 sp04 = 0;
    s32 i = 0;
    PlatformThin *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    MapEntity *me = platform->base.me;
    CamCoord worldX, worldY;
    s32 diff;
    s32 qUnk4A;

    if (platform->qUnk48 != 0) {
#ifndef NON_MATCHING
        register s32 diff asm("r5") = platform->qUnk40;
#else
        s32 diff = platform->qUnk40;
#endif
        platform->qUnk40 = (((me->d.uData[2] << 11) * SIN(platform->qUnk48 * (((gStageTime + platform->unk3C) & 0xFF)) & 0x3FF)) >> 14);
        diff = platform->qUnk40 - diff;
        asm("" ::"r"(diff));
        sp00 = diff;
    }

    if (platform->qUnk4A != 0) {
#ifndef NON_MATCHING
        register s32 diff asm("r5") = platform->qUnk44;
#else
        s32 diff = platform->qUnk44;
#endif
        platform->qUnk44 = (((me->d.uData[3] << 11) * SIN(platform->qUnk4A * (((gStageTime + platform->unk3C) & 0xFF)) & 0x3FF)) >> 14);
        diff = platform->qUnk44 - diff;
        asm("" ::"r"(diff));
        sp04 = diff;
    }

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = worldX - gCamera.x + I(platform->qUnk40);
    s->y = worldY - gCamera.y + I(platform->qUnk44);

    i = 0;
    do {
        Player *p = &PLAYER(i);

        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            p->qWorldX += sp00;

            if (!GRAVITY_IS_INVERTED) {
                p->qWorldY += +Q(1) + sp04;
            } else {
                p->qWorldY += -Q(2) + sp04;
            }
        }

        if (!(p->moveState & MOVESTATE_IA_OVERRIDE)) {
            Coll_Player_PlatformCrumbling(s, worldX + I(platform->qUnk40), worldY + I(platform->qUnk44), p);
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE)) {
        if (((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s))
            || ((gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) && (gPartner.moveState & MOVESTATE_STOOD_ON_OBJ)
                && (gPartner.stoodObj == s))) {
            if (platform->unk4C != 0x100) {
                platform->unk4C += 0x10;
            }
        } else {
            if (platform->unk4C != 0) {
                platform->unk4C -= 0x10;
            }
        }

        if (!GRAVITY_IS_INVERTED) {
            s->y += SIN(platform->unk4C) >> 12;
        } else {
            s->y -= SIN(platform->unk4C) >> 12;
        }
    }

    DisplaySprite(s);
}

void CreateEntity_PlatformThin_Falling(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_PlatformThin_Falling, sizeof(PlatformThin), 0x2000, 0, TaskDestructor_PlatformThin);
    PlatformThin *platform = TASK_DATA(t);
    SpriteBase *base = &platform->base;
    Sprite *s = &platform->s;

    base->regionX = regionX;
    base->regionY = regionY;
    base->me = me;
    base->meX = me->x;
    base->id = id;

    platform->qUnk40 = 0;
    platform->qUnk44 = 0;
    platform->unk4C = 0;
    platform->qUnk48 = 0;
    platform->qUnk4A = 0;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_PLATFORM_HORZ_1);

    s->variant = 0;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
#ifdef BUG_FIX
        // Prevent overflow
        s->graphics.anim = sPlatformThinAnims[gCurrentLevel % ARRAY_COUNT(sPlatformThinAnims)];
#else
        s->graphics.anim = sPlatformThinAnims[gCurrentLevel];
#endif
    } else {
        s->graphics.anim = SA1_ANIM_PLATFORM_HORZ_1;
    }
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

void Task_PlatformThin_Falling(void)
{
    s32 sp00 = 0;
    s32 sp04 = 0;
    s32 i = 0;
    PlatformThin *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    MapEntity *me = platform->base.me;
    CamCoord worldX, worldY;
    s32 diff;
    s32 qUnk4A;

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if ((Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPlayer) & 0x8)
        || (Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPartner) & 0x8)) {
        gCurTask->main = Task_802473C;
        platform->unk3C = 30;
    }
    if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
        platform->unk3C = 0;
        gCurTask->main = Task_802492C;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    // if(!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE))
    {
        if (((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s))
            || ((gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) && (gPartner.moveState & MOVESTATE_STOOD_ON_OBJ)
                && (gPartner.stoodObj == s))) {
            if (platform->unk4C != 0x100) {
                platform->unk4C += 0x10;
            }
        } else {
            if (platform->unk4C != 0) {
                platform->unk4C -= 0x10;
            }
        }

        s->y += SIN(platform->unk4C) >> 12;
    }

    DisplaySprite(s);
}

void Task_802473C(void)
{
    s32 sp00 = 0;
    s32 sp04 = 0;
    s32 i = 0;
    PlatformThin *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    MapEntity *me = platform->base.me;
    CamCoord worldX, worldY;
    s32 diff;
    s32 qUnk4A;

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPlayer);
    Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPartner);

    if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
        platform->unk3C = 0;
        gCurTask->main = Task_802492C;
    } else if (--platform->unk3C == 0) {
        platform->unk3C = 0;
        gCurTask->main = Task_802492C;

        if (IS_MULTI_PLAYER) {
            RoomEvent_PlatformChange *roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_PLATFORM_CHANGE;
            roomEvent->x = platform->base.regionX;
            roomEvent->y = platform->base.regionY;
            roomEvent->id = platform->base.id;
            roomEvent->action = 1;
        }
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    // if(!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE))
    {
        if (((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s))
            || ((gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) && (gPartner.moveState & MOVESTATE_STOOD_ON_OBJ)
                && (gPartner.stoodObj == s))) {
            if (platform->unk4C != 0x100) {
                platform->unk4C += 0x10;
            }
        } else {
            if (platform->unk4C != 0) {
                platform->unk4C -= 0x10;
            }
        }

        s->y += SIN(platform->unk4C) >> 12;
    }

    DisplaySprite(s);
}

void Task_802492C(void)
{
    s32 i = 0;
    PlatformThin *platform = TASK_DATA(gCurTask);
    Sprite *s = &platform->s;
    CamCoord worldX, worldY;
    MapEntity *me;
    s32 diff;
    me = platform->base.me;

    platform->qUnk4A += 42;
    platform->qUnk44 += platform->qUnk4A;

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y + I(platform->qUnk44);

    platform->unk3C++;

    i = 0;
    do {
        Player *p = &PLAYER(i);

        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            if (gPlayer.charState == 14) {
                Player_TransitionCancelFlyingAndBoost(&gPlayer);
                gPlayer.charState = 4;
            }

            if (platform->unk3C > 32) {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                p->qSpeedAirY = platform->qUnk4A;
            } else {
                p->qWorldX += platform->qUnk48;
                p->qWorldY += platform->qUnk4A + Q(1);
            }
        }

        if (platform->unk3C < 32) {
            Coll_Player_PlatformCrumbling(s, worldX, worldY + I(platform->qUnk44), p);
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    // if(!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE))
    {
        if (((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPlayer.stoodObj == s))
            || ((gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) && (gPartner.moveState & MOVESTATE_STOOD_ON_OBJ)
                && (gPartner.stoodObj == s))) {
            if (platform->unk4C != 0x100) {
                platform->unk4C += 0x10;
            }
        } else {
            if (platform->unk4C != 0) {
                platform->unk4C -= 0x10;
            }
        }

        s->y += SIN(platform->unk4C) >> 12;
    }

    DisplaySprite(s);
}

void TaskDestructor_PlatformThin(Task *t)
{
    PlatformThin *platform = TASK_DATA(t);
    VramFree(platform->s.graphics.dest);
}
