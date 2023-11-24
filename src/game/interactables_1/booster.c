#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "task.h"

#include "game/entity.h"
#include "game/stage/camera.h"
#include "sprite.h"
#include "game/game.h"
#include "sakit/entities_manager.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
} Sprite_Booster;

static void Task_Interactable_Booster(void);

const TileInfo sBoosterAnimationData[2][6] = {
    {
        { 8, SA2_ANIM_BOOSTER, 0 },
        { 12, SA2_ANIM_BOOSTER, 1 },
        { 12, SA2_ANIM_BOOSTER, 2 },
        { 16, SA2_ANIM_BOOSTER, 3 },
        { 12, SA2_ANIM_BOOSTER, 4 },
        { 8, SA2_ANIM_BOOSTER, 5 },
    },
    {
        { 8, SA2_ANIM_DIR_ARROW_TEC_BAS, 0 },
        { 12, SA2_ANIM_DIR_ARROW_TEC_BAS, 1 },
        { 12, SA2_ANIM_DIR_ARROW_TEC_BAS, 2 },
        { 16, SA2_ANIM_DIR_ARROW_TEC_BAS, 3 },
        { 16, SA2_ANIM_DIR_ARROW_TEC_BAS, 4 },
        { 8, SA2_ANIM_DIR_ARROW_TEC_BAS, 5 },
    },
};

#define BOOSTER_SPEED 3072

// Look left and accelerate
#define BOOSTER_ACCEL_LEFT(player)                                                      \
    (player).moveState |= MOVESTATE_FACING_LEFT;                                        \
    if (gPlayer.speedGroundX > -BOOSTER_SPEED)                                          \
        gPlayer.speedGroundX = -BOOSTER_SPEED;

// Look right and accelerate
#define BOOSTER_ACCEL_RIGHT(player)                                                     \
    (player).moveState &= ~MOVESTATE_FACING_LEFT;                                       \
    if (gPlayer.speedGroundX < BOOSTER_SPEED)                                           \
        gPlayer.speedGroundX = BOOSTER_SPEED;

void CreateEntity_Booster(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                          u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_Booster, sizeof(Sprite_Booster),
                                0x2000, 0, TaskDestructor_80095E8);
    Sprite_Booster *booster = TASK_DATA(t);
    Sprite *s = &booster->s;
    u32 value;

    booster->base.regionX = spriteRegionX;
    booster->base.regionY = spriteRegionY;
    booster->base.me = me;
    booster->base.spriteX = me->x;
    booster->base.spriteY = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6)
        value = 1;
    else
        value = 0;

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(sBoosterAnimationData[value][me->d.sData[0]].numTiles);
    s->graphics.anim = sBoosterAnimationData[value][me->d.sData[0]].anim;
    s->variant = sBoosterAnimationData[value][me->d.sData[0]].variant;
    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x2000;

    if (me->d.uData[2] != 0) {
        s->unk10 |= 0x800;
    }

    if (me->d.sData[1] != 0) {
        s->unk10 |= 0x400;
    }
}

void Task_Interactable_Booster(void)
{
    Sprite_Booster *booster = TASK_DATA(gCurTask);
    Sprite *s = &booster->s;
    MapEntity *me = booster->base.me;

    s16 screenX, screenY;

    screenX = TO_WORLD_POS(booster->base.spriteX, booster->base.regionX);
    screenY = TO_WORLD_POS(me->y, booster->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (!(gPlayer.moveState & (MOVESTATE_DEAD | MOVESTATE_IN_AIR))
        && (sub_800C204(s, screenX, screenY, 0, &gPlayer, 0) == 1)) {
        sub_80218E4(&gPlayer);

        if (gPlayer.moveState & MOVESTATE_4) {
            sub_8023B5C(&gPlayer, 9);
            gPlayer.unk16 = 6;
            gPlayer.unk17 = 9;
        } else {
            sub_8023B5C(&gPlayer, 14);
            gPlayer.unk16 = 6;
            gPlayer.unk17 = 14;
        }

        m4aSongNumStart(SE_SPEED_BOOSTER);

        gPlayer.unk62 = 0;
        gPlayer.unk5A = 1;

        if (GRAVITY_IS_INVERTED) {
            if ((s->unk10 & 0x800) == 0) {
                if ((s->unk10 & 0x400) == 0) {
                    BOOSTER_ACCEL_LEFT(gPlayer);
                } else {
                    BOOSTER_ACCEL_RIGHT(gPlayer);
                }
            } else {
                if ((s->unk10 & 0x400) != 0) {
                    BOOSTER_ACCEL_LEFT(gPlayer);
                } else {
                    BOOSTER_ACCEL_RIGHT(gPlayer);
                }
            }
        } else {
            if ((s->unk10 & 0x800) != 0) {
                if ((s->unk10 & 0x400) == 0) {
                    BOOSTER_ACCEL_LEFT(gPlayer);
                } else {
                    BOOSTER_ACCEL_RIGHT(gPlayer);
                }
            } else {
                if ((s->unk10 & 0x400) != 0) {
                    BOOSTER_ACCEL_LEFT(gPlayer);
                } else {
                    BOOSTER_ACCEL_RIGHT(gPlayer);
                }
            }
        }
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = booster->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}
