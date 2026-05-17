#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/sa1/stage/stage_ui.h" // for sub_80549FC

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

/* Platform that falls and slides once the player steps on it */

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
    /* 0x3E */ u16 unk3E;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ u16 unk48;
    /* 0x4A */ u16 unk4A;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ u8 unk50;
} Platform085_089;

void Task_Platform085(void);
void Task_Platform089(void);
void TaskDestructor_Platforms_085_089(Task *t);

const u16 gUnknown_086CEDC0[NUM_LEVEL_IDS][3] = {
    { SA1_ANIM_PLATFORM_HORZ_1, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_1) },
    { SA1_ANIM_PLATFORM_HORZ_1, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_1) },
    { SA1_ANIM_PLATFORM_HORZ_2, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_2) },
    { SA1_ANIM_PLATFORM_HORZ_2, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_2) },
    { SA1_ANIM_PLATFORM_HORZ_3, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_3) },
    { SA1_ANIM_PLATFORM_HORZ_3, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_3) },
    { SA1_ANIM_PLATFORM_SQU_4_PURPLE, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_SQU_4_PURPLE) },
    { SA1_ANIM_PLATFORM_SQU_4_PURPLE, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_SQU_4_PURPLE) },
    { SA1_ANIM_PLATFORM_SQU_ARROW, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_SQU_ARROW) },
    { SA1_ANIM_PLATFORM_SQU_ARROW, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_SQU_ARROW) },
    { SA1_ANIM_PLATFORM_HORZ_6_1, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_6_1) },
    { SA1_ANIM_PLATFORM_HORZ_6_1, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_6_1) },
    { SA1_ANIM_PLATFORM_HORZ_6_1, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_6_1) },
    { SA1_ANIM_PLATFORM_HORZ_6_1, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_6_1) },
    { SA1_ANIM_PLATFORM_HORZ_1, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_1) },
    { SA1_ANIM_PLATFORM_HORZ_2, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_2) },
    { SA1_ANIM_PLATFORM_HORZ_3, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_3) },
    { SA1_ANIM_PLATFORM_HORZ_6_1, 0x0000, MAX_TILES(SA1_ANIM_PLATFORM_HORZ_6_1) },
};

void CreateEntity_Platform_SlowDescent(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Platform085, sizeof(Platform085_089), 0x2000, 0, TaskDestructor_Platforms_085_089);
    Platform085_089 *platform = TASK_DATA(t);
    Sprite *s = &platform->s;

    platform->base.regionX = regionX;
    platform->base.regionY = regionY;
    platform->base.me = me;
    platform->base.meX = me->x;
    platform->base.id = id;

    platform->unk40 = 0;
    platform->unk44 = 0;
    platform->unk50 = 0;
    platform->unk4C = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            platform->unk48 = 4;
            platform->unk3C = 0;
            platform->unk4A = 0;
        } else {
            platform->unk48 = 4;
            platform->unk3C = 0x80;
            platform->unk4A = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            platform->unk48 = 0;
            platform->unk4A = 4;
            platform->unk3C = 0;
        } else {
            platform->unk48 = 0;
            platform->unk4A = 4;
            platform->unk3C = 0x80;
        }
    }

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(gUnknown_086CEDC0[gCurrentLevel][2]);
    s->graphics.anim = gUnknown_086CEDC0[gCurrentLevel][0];
    s->variant = gUnknown_086CEDC0[gCurrentLevel][1];

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

void Task_Platform085(void)
{
    Platform085_089 *platform;
    Sprite *s;
    CamCoord worldX, worldY;
    MapEntity *me;
    s32 i;
    u32 layer = 0;
    platform = TASK_DATA(gCurTask);
    s = &platform->s;
    me = platform->base.me;

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    i = 0;
    do {
        if ((PLAYER(i).moveState & MOVESTATE_STOOD_ON_OBJ) && (PLAYER(i).stoodObj == s)) {
            s8 sl = SA2_LABEL(sub_801F07C)(worldY + I(platform->unk44) + 22, worldX, PLAYER(i).layer, +8, NULL, SA2_LABEL(sub_801EE64));

            if (!Coll_Player_Entity_Intersection(s, worldX + I(platform->unk40), worldY + I(platform->unk44) - 4, &PLAYER(i))) {
                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                PLAYER(i).stoodObj = NULL;
                ClearBit(platform->unk50, i);
            } else {
                s8 res;
                SetBit(platform->unk50, i);

                if (sl >= 0) {
                    PLAYER(i).qWorldY += Q(0.75);
                }

                res = SA2_LABEL(sub_801F07C)(I(PLAYER(i).qWorldY) + 16, I(PLAYER(i).qWorldX) + 0, PLAYER(i).layer, +8, NULL,
                                             SA2_LABEL(sub_801EE64));

                if (res < 0) {
                    PLAYER(i).qWorldY += Q(res);
                    PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                }
            }
        } else {
            if (Coll_Player_PlatformCrumbling(s, worldX, worldY + I(platform->unk44), &PLAYER(i)) & COLL_FLAG_8) {
                if (!(PLAYER(i).moveState & SPRITE_FLAG(X_FLIP, 1))) {
                    PLAYER(i).qWorldY -= Q(2);
                }
                SetBit(platform->unk50, i);
            } else {
                ClearBit(platform->unk50, i);
            }
        }

        if (i == 0) {
            layer = gPlayer.layer;
        }
    } while (++i < gNumSingleplayerCharacters);

    if (platform->unk50 != 0) {
        s8 res = SA2_LABEL(sub_801F07C)(worldY + I(platform->unk44) + 22, worldX, layer, +8, NULL, SA2_LABEL(sub_801EE64));

        if (res >= 0) {
            platform->unk44 += Q(0.75);
        }
    } else {
        if (platform->unk44 != 0) {
            platform->unk44 -= Q(0.75);
        }
    }

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y + I(platform->unk44);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void CreateEntity_Platform089(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Platform089, sizeof(Platform085_089), 0x2000, 0, TaskDestructor_Platforms_085_089);
    Platform085_089 *platform = TASK_DATA(t);
    Sprite *s = &platform->s;

    platform->base.regionX = regionX;
    platform->base.regionY = regionY;
    platform->base.me = me;
    platform->base.meX = me->x;
    platform->base.id = id;

    platform->unk40 = 0;
    platform->unk44 = 0;
    platform->unk4C = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            platform->unk48 = 4;
            platform->unk3C = 0;
            platform->unk4A = 0;
        } else {
            platform->unk48 = 4;
            platform->unk3C = 0x80;
            platform->unk4A = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            platform->unk48 = 0;
            platform->unk4A = 4;
            platform->unk3C = 0;
        } else {
            platform->unk48 = 0;
            platform->unk4A = 4;
            platform->unk3C = 0x80;
        }
    }

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_PLATFORM_HORZ_4);
    s->graphics.anim = SA1_ANIM_PLATFORM_HORZ_4;
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

    UpdateSpriteAnimation(s);
}

void Task_Platform089(void)
{
    Platform085_089 *platform;
    Sprite *s;
    CamCoord worldX, worldY;
    MapEntity *me;
    s32 i;
    u32 sp0C = 0;
    u32 sp10 = 0;
    platform = TASK_DATA(gCurTask);
    s = &platform->s;
    me = platform->base.me;

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y - I(platform->unk44);

    i = 0;
    do {
        if ((PLAYER(i).moveState & MOVESTATE_STOOD_ON_OBJ) && (PLAYER(i).stoodObj == s)) {
            sp0C = 1;

            if (!Coll_Player_Entity_Intersection(s, worldX + I(platform->unk40), worldY - I(platform->unk44) - 4, &PLAYER(i))) {
                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            } else {
                s8 res;

                PLAYER(i).qWorldY -= Q(0.75);

                if (I(platform->unk44) > me->d.uData[3] * 8) {
                    PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    PLAYER(i).moveState |= MOVESTATE_DEAD;
                }
            }
        } else {
            if (!(Coll_Player_PlatformCrumbling(s, worldX, worldY - I(platform->unk44), &PLAYER(i)) & COLL_FLAG_8)) {
                sp10 = 1;
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (sp0C) {
        {
            platform->unk44 += Q(0.75);
        }
    } else {
        if (sp10) {
            if (platform->unk44 != 0) {
                platform->unk44 -= Q(0.75);
            }
        }
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void TaskDestructor_Platforms_085_089(Task *t)
{
    Platform085_089 *platform = TASK_DATA(t);
    VramFree(platform->s.graphics.dest);
}
