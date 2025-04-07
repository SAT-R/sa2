#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"
#include "lib/m4a/m4a.h"
#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/hot_crater/floating_spring.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    SpriteBase base;
    Sprite s;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    bool32 unk4C;
    bool16 unk50;
    s16 unk52;
    s16 unk54;
    u16 unk56;
} Sprite_FloatingSpring; /* size 0x58 */

static void sub_80750A8(void);
static void sub_8075140(struct Task *);

static void sub_8075284(Sprite_FloatingSpring *);
static void sub_8074FD8(Sprite_FloatingSpring *);
static void sub_8074E44(Sprite_FloatingSpring *);
static void sub_80751B4(Sprite_FloatingSpring *);
static bool32 sub_8075228(Sprite_FloatingSpring *);
static void sub_80752BC(Sprite_FloatingSpring *);
static void sub_8075154(Sprite_FloatingSpring *);
static u32 sub_8074EF4(Sprite_FloatingSpring *);
static bool32 sub_80751CC(Sprite_FloatingSpring *);
static void sub_80752D8(void);
static void sub_8075334(Sprite_FloatingSpring *);

void CreateEntity_FloatingSpring_Up(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_80750A8, sizeof(Sprite_FloatingSpring), 0x2010, 0, sub_8075140);
    Sprite_FloatingSpring *floatingSpring = TASK_DATA(t);
    Sprite *s = &floatingSpring->s;

    floatingSpring->unk44 = 0;
    floatingSpring->unk48 = 0;
    floatingSpring->unk50 = FALSE;

    floatingSpring->base.me = me;
    floatingSpring->base.regionX = spriteRegionX;
    floatingSpring->base.regionY = spriteRegionY;
    floatingSpring->base.spriteX = me->x;
    floatingSpring->base.id = spriteY;

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    floatingSpring->unk4C = FALSE;
    s->graphics.dest = 0;
    sub_8075284(floatingSpring);

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            floatingSpring->unk52 = 4;
            floatingSpring->unk54 = 0;
            floatingSpring->unk56 = 0;
        } else {
            floatingSpring->unk52 = 4;
            floatingSpring->unk54 = 0;
            floatingSpring->unk56 = 0x80;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            floatingSpring->unk52 = 0;
            floatingSpring->unk54 = 4;
            floatingSpring->unk56 = 0;
        } else {
            floatingSpring->unk52 = 0;
            floatingSpring->unk54 = 4;
            floatingSpring->unk56 = 0x80;
        }
    }
    sub_8074FD8(floatingSpring);
    UpdateSpriteAnimation(s);
    sub_8074E44(floatingSpring);
    sub_80751B4(floatingSpring);

    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_8074E44(Sprite_FloatingSpring *floatingSpring)
{
    MapEntity *me = floatingSpring->base.me;

    if (floatingSpring->unk52 != 0) {
        s32 temp = me->d.uData[2] * 2048;
        floatingSpring->unk44 = (SIN((floatingSpring->unk52 * ((gStageTime + floatingSpring->unk56) & 255)) & ONE_CYCLE) * temp) >> 15;
    }

    if (floatingSpring->unk54 != 0) {
        s32 temp = me->d.uData[3] * 2048;
        floatingSpring->unk48 = (SIN((floatingSpring->unk54 * ((gStageTime + floatingSpring->unk56) & 255)) & ONE_CYCLE) * temp) >> 15;
    }

    floatingSpring->unk3C = TO_WORLD_POS(floatingSpring->base.spriteX, floatingSpring->base.regionX) + I(floatingSpring->unk44);
    floatingSpring->unk40 = TO_WORLD_POS(me->y, floatingSpring->base.regionY) + I(floatingSpring->unk48);
}

static u32 sub_8074EF4(Sprite_FloatingSpring *floatingSpring)
{
    if (PLAYER_IS_ALIVE) {
        u32 temp = Coll_Player_Interactable(&floatingSpring->s, floatingSpring->unk3C, floatingSpring->unk40, &gPlayer);
        if (temp != 0) {
            if (I(gPlayer.qWorldY) < floatingSpring->unk40) {
                gPlayer.qWorldY += Q(floatingSpring->s.hitboxes[0].top);
                if (gPlayer.qSpeedAirY > 0) {
                    gPlayer.qSpeedAirY = 0;
                }
                return 2;
            } else if (temp & 0x10000) {
                gPlayer.qWorldY += Q_8_8(temp);
                if (gPlayer.qSpeedAirY > 0) {
                    gPlayer.qSpeedAirY = 0;
                }
                return 2;
            } else if (temp & 0x20000) {
                gPlayer.qWorldY += Q_8_8(temp);
                if (gPlayer.qSpeedAirY < 0) {
                    gPlayer.qSpeedAirY = 0;
                }
                return 1;
            } else if (temp & 0x40000) {
                gPlayer.qWorldX += (s16)(temp & 0xFF00);
                if (gPlayer.qSpeedAirX < 0) {
                    gPlayer.qSpeedAirX = 0;
                    gPlayer.qSpeedGround = 0;
                }
                return 1;
            } else if (temp & 0x80000) {
                gPlayer.qWorldX += (s16)(temp & 0xFF00);
                if (gPlayer.qSpeedAirX > 0) {
                    gPlayer.qSpeedAirX = 0;
                    gPlayer.qSpeedGround = 0;
                }
                return 1;
            }
        }
    }

    return 0;
}

static void sub_8074FD8(Sprite_FloatingSpring *floatingSpring)
{

    if (floatingSpring->unk50) {
        u8 level = gCurrentLevel;
        if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
            floatingSpring->s.graphics.anim = SA2_ANIM_FLOATING_SPRING_3;
            floatingSpring->s.variant = 0;
        } else {
            floatingSpring->s.graphics.anim = SA2_ANIM_SPRING_PLATFORM;
            floatingSpring->s.variant = 0;
        }
    } else {
        if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
            floatingSpring->s.graphics.anim = SA2_ANIM_FLOATING_SPRING_3;
            floatingSpring->s.variant = ZONE_3;
        } else {
            floatingSpring->s.graphics.anim = SA2_ANIM_SPRING_PLATFORM;
            floatingSpring->s.variant = 2;
        }
    }
}

static void sub_8075048(Sprite_FloatingSpring *floatingSpring)
{
    if (floatingSpring->unk50) {
        if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
            floatingSpring->s.graphics.anim = SA2_ANIM_FLOATING_SPRING_3;
            floatingSpring->s.variant = 1;
        } else {
            floatingSpring->s.graphics.anim = SA2_ANIM_SPRING_PLATFORM;
            floatingSpring->s.variant = 1;
        }
    } else {
        if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
            floatingSpring->s.graphics.anim = SA2_ANIM_FLOATING_SPRING_3;
            floatingSpring->s.variant = 3;
        } else {
            floatingSpring->s.graphics.anim = SA2_ANIM_SPRING_PLATFORM;
            floatingSpring->s.variant = 3;
        }
    }
}

static void sub_80750A8(void)
{
    Sprite_FloatingSpring *floatingSpring = TASK_DATA(gCurTask);

    sub_8074E44(floatingSpring);
    if (sub_8075228(floatingSpring)) {
        if (floatingSpring->unk4C) {
            sub_80752BC(floatingSpring);
        }
    } else {
        if (!floatingSpring->unk4C) {
            sub_8075284(floatingSpring);
            sub_8074FD8(floatingSpring);
            UpdateSpriteAnimation(&floatingSpring->s);
        }
    }

    if (sub_8074EF4(floatingSpring) == 2) {
        sub_8075154(floatingSpring);
    }

    if (sub_80751CC(floatingSpring)) {
        floatingSpring->base.me->x = floatingSpring->base.spriteX;
        TaskDestroy(gCurTask);

    } else {
        sub_80751B4(floatingSpring);

        if (floatingSpring->unk4C) {
            DisplaySprite(&floatingSpring->s);
        }
    }
}

static void sub_8075140(struct Task *t)
{
    Sprite_FloatingSpring *floatingSpring = TASK_DATA(t);

    sub_80752BC(floatingSpring);
}

static void sub_8075154(Sprite_FloatingSpring *floatingSpring)
{
    gPlayer.transition = PLTRANS_SPRING_UP;

    if (floatingSpring->unk50) {
        gPlayer.unk6E = 3;
    } else {
        gPlayer.unk6E = 0;
    }

    if (!floatingSpring->unk4C) {
        sub_8075284(floatingSpring);
    }

    sub_8075048(floatingSpring);
    UpdateSpriteAnimation(&floatingSpring->s);
    m4aSongNumStart(SE_SPRING);
    gCurTask->main = sub_80752D8;
}

static void sub_80751B4(Sprite_FloatingSpring *floatingSpring)
{
    floatingSpring->s.x = floatingSpring->unk3C - gCamera.x;
    floatingSpring->s.y = floatingSpring->unk40 - gCamera.y;
}

bool32 sub_80751CC(Sprite_FloatingSpring *floatingSpring)
{
    MapEntity *me = floatingSpring->base.me;
    s16 x = floatingSpring->unk3C - gCamera.x;
    s16 y = floatingSpring->unk40 - gCamera.y;

    // Should be IS_OUT_OF_RANGE_2(x, y, (me->d.uData[2] * TILE_WIDTH) + (CAM_REGION_WIDTH / 2), (me->d.uData[3] * TILE_WIDTH) +
    // (CAM_REGION_WIDTH / 2)) But DISPLAY_HEIGHT + 384 does not match
    if (x < -((me->d.uData[2] * TILE_WIDTH) + (CAM_REGION_WIDTH / 2))
        || x > (me->d.uData[2] * TILE_WIDTH) + (DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)) || y < -((me->d.uData[3] * TILE_WIDTH) + 128)
        || y > (me->d.uData[3] * TILE_WIDTH) + (DISPLAY_HEIGHT + 384)) {
        return TRUE;
    }

    return FALSE;
}

bool32 sub_8075228(Sprite_FloatingSpring *floatingSpring)
{
    MapEntity *me = floatingSpring->base.me;
    s16 x = floatingSpring->unk3C - gCamera.x;
    s16 y = floatingSpring->unk40 - gCamera.y;

    if (IS_OUT_OF_RANGE_2(x, y, (me->d.uData[2] * TILE_WIDTH) + (CAM_REGION_WIDTH / 2),
                          (me->d.uData[3] * TILE_WIDTH) + (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void sub_8075284(Sprite_FloatingSpring *floatingSpring)
{
    if (!floatingSpring->unk4C) {
#ifndef NON_MATCHING
        u32 zone = LEVEL_TO_ZONE(gCurrentLevel);
        asm("" ::"r"(zone));
#endif
        floatingSpring->s.graphics.dest = VramMalloc(28);
        floatingSpring->s.prevAnim = -1;
        floatingSpring->s.prevVariant = -1;
        floatingSpring->unk4C = TRUE;
    }
}

static void sub_80752BC(Sprite_FloatingSpring *floatingSpring)
{
    if (floatingSpring->unk4C) {
        VramFree(floatingSpring->s.graphics.dest);
        floatingSpring->s.graphics.dest = NULL;
        floatingSpring->unk4C = FALSE;
    }
}

static void sub_80752D8(void)
{
    Sprite_FloatingSpring *floatingSpring = TASK_DATA(gCurTask);
    Sprite *s = &floatingSpring->s;
    sub_8074E44(floatingSpring);
    sub_80751B4(floatingSpring);

    if (!(s->frameFlags & 0x4000)) {
        UpdateSpriteAnimation(&floatingSpring->s);
    } else {
        sub_8075334(floatingSpring);
    }

    if (sub_8074EF4(floatingSpring) == 2) {
        sub_8075154(floatingSpring);
    }

    DisplaySprite(s);
}

static void sub_8075334(Sprite_FloatingSpring *floatingSpring)
{
    floatingSpring->unk50 ^= TRUE;
    sub_8074FD8(floatingSpring);
    UpdateSpriteAnimation(&floatingSpring->s);
    DisplaySprite(&floatingSpring->s);
    gCurTask->main = sub_80750A8;
}
