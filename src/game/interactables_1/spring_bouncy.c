#include "global.h"
#include "lib/m4a.h"
#include "gba/syscall.h"

#include "malloc_vram.h"

#include "game/game.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
} Sprite_BouncySpring;

static void Task_Interactable_BouncySpring(void);
static void Task_805E02C(void);
static void TaskDestructor_Interactable_BouncySpring(struct Task *);

static const TileInfo gUnknown_080D948C[3] = {
    { 24, SA2_ANIM_SPRING_BOUNCY, 1 },
    { 24, SA2_ANIM_SPRING_BOUNCY, 2 },
    { 24, SA2_ANIM_SPRING_BOUNCY, 3 },
};

static const TileInfo gUnknown_080D94A4[3] = {
    { 16, SA2_ANIM_DRUM, 1 },
    { 16, SA2_ANIM_DRUM, 2 },
    { 16, SA2_ANIM_DRUM, 3 },
};

static const TileInfo gUnknown_080D94BC[3] = {
    { 16, SA2_ANIM_603, 1 },
    { 16, SA2_ANIM_603, 2 },
    { 24, SA2_ANIM_603, 3 },
};

void CreateEntity_BouncySpring(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                               u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_Interactable_BouncySpring, sizeof(Sprite_BouncySpring), 0x2010,
                     0, TaskDestructor_Interactable_BouncySpring);
    Sprite_BouncySpring *spring = TaskGetStructPtr(t);
    Sprite *s = &spring->s;
    u32 variant = 0;

    spring->base.regionX = spriteRegionX;
    spring->base.regionY = spriteRegionY;
    spring->base.me = me;
    spring->base.spriteX = me->x;
    spring->base.spriteY = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
        s->graphics.dest = VramMalloc(16);
        s->graphics.anim = SA2_ANIM_DRUM;
        s->variant = variant;
    } else if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
        s->graphics.dest = VramMalloc(24);
        s->graphics.anim = SA2_ANIM_603;
        s->variant = variant;
    } else {
        s->graphics.dest = VramMalloc(24);
        s->graphics.anim = SA2_ANIM_SPRING_BOUNCY;
        s->variant = variant;
    }

    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = FALSE;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x2000;
}

static void Task_Interactable_BouncySpring()
{
    Sprite_BouncySpring *spring = TaskGetStructPtr(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    s32 screenX, screenY;
    s16 airSpeed;

    screenX = TO_WORLD_POS(spring->base.spriteX, spring->base.regionX);
    screenY = TO_WORLD_POS(me->y, spring->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;
    if (!(gPlayer.moveState & (MOVESTATE_400000 | MOVESTATE_DEAD))) {
        airSpeed = gPlayer.speedAirY;
        if ((sub_800CCB8(s, screenX, screenY, &gPlayer) != 0)) {
            u8 index;

            index = Div(airSpeed, 400);
            if (index > (ARRAY_COUNT(gUnknown_080D948C) - 1))
                index = (ARRAY_COUNT(gUnknown_080D948C) - 1);

            gPlayer.speedAirY = -(airSpeed + (airSpeed >> 3));

            if (gPlayer.speedAirY > Q_8_8(-7.5))
                gPlayer.speedAirY = Q_8_8(-7.5);

            if (gPlayer.speedAirY < Q_8_8(-12))
                gPlayer.speedAirY = Q_8_8(-12);

            gPlayer.unk36 = 3;

            sub_80218E4(&gPlayer);
            sub_8023B5C(&gPlayer, 14);

            gPlayer.unk16 = 6;
            gPlayer.unk17 = 14;

            gPlayer.moveState = (gPlayer.moveState | MOVESTATE_IN_AIR) & ~MOVESTATE_100;

            if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
                s->graphics.anim = gUnknown_080D94A4[index].anim;
                spring->s.variant = gUnknown_080D94A4[index].variant;
                spring->s.prevVariant = -1;
            } else if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                s->graphics.anim = gUnknown_080D94BC[index].anim;
                spring->s.variant = gUnknown_080D94BC[index].variant;
                spring->s.prevVariant = -1;
            } else {
                s->graphics.anim = gUnknown_080D948C[index].anim;
                spring->s.variant = gUnknown_080D948C[index].variant;
                spring->s.prevVariant = -1;
            }

            gPlayer.unk64 = 38;
            gPlayer.transition = PLTRANS_PT7;
            gPlayer.unk66 = -1;

            m4aSongNumStart(SE_SPRINGY_SPRING);

            gCurTask->main = Task_805E02C;
        }
    }
    // _0805DFBA
    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = spring->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_8004558(s);
        sub_80051E8(s);
    }
}

static void Task_805E02C()
{
    Sprite_BouncySpring *spring = TaskGetStructPtr(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    s32 screenX, screenY;
    u32 variant = 0;

    screenX = TO_WORLD_POS(spring->base.spriteX, spring->base.regionX);
    screenY = TO_WORLD_POS(me->y, spring->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = spring->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if (sub_8004558(s) == 0) {
            gCurTask->main = Task_Interactable_BouncySpring;

            if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
                s->graphics.anim = SA2_ANIM_DRUM;
                s->variant = variant;
            } else if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                s->graphics.anim = SA2_ANIM_603;
                s->variant = variant;
            } else {
                s->graphics.anim = SA2_ANIM_SPRING_BOUNCY;
                s->variant = variant;
            }
            s->prevVariant = -1;
        }

        sub_80051E8(s);
    }
}

static void TaskDestructor_Interactable_BouncySpring(struct Task *t)
{
    Sprite_BouncySpring *spring = TaskGetStructPtr(t);
    VramFree(spring->s.graphics.dest);
}
