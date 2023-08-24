#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"
#include "lib/m4a.h"
#include "game/entity.h"
#include "game/interactables_2/hot_crater/floating_spring.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
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

void CreateEntity_FloatingSpring_Up(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                    u8 spriteY)
{
    struct Task *t
        = TaskCreate(sub_80750A8, sizeof(Sprite_FloatingSpring), 0x2010, 0, sub_8075140);
    Sprite_FloatingSpring *floatingSpring = TaskGetStructPtr(t);
    Sprite *sprite = &floatingSpring->sprite;

    floatingSpring->unk44 = 0;
    floatingSpring->unk48 = 0;
    floatingSpring->unk50 = FALSE;

    floatingSpring->base.me = me;
    floatingSpring->base.regionX = spriteRegionX;
    floatingSpring->base.regionY = spriteRegionY;
    floatingSpring->base.spriteX = me->x;
    floatingSpring->base.spriteY = spriteY;

    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->hitboxes[0].unk0 = -1;
    sprite->unk10 = 0x2000;

    floatingSpring->unk4C = FALSE;
    sprite->graphics.dest = 0;
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
    sub_8004558(sprite);
    sub_8074E44(floatingSpring);
    sub_80751B4(floatingSpring);

    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_8074E44(Sprite_FloatingSpring *floatingSpring)
{
    MapEntity *me = floatingSpring->base.me;

    if (floatingSpring->unk52 != 0) {
        s32 temp = me->d.uData[2] * 2048;
        floatingSpring->unk44
            = (SIN((floatingSpring->unk52
                    * ((gUnknown_03005590 + floatingSpring->unk56) & 255))
                   & ONE_CYCLE)
               * temp)
            >> 15;
    }

    if (floatingSpring->unk54 != 0) {
        s32 temp = me->d.uData[3] * 2048;
        floatingSpring->unk48
            = (SIN((floatingSpring->unk54
                    * ((gUnknown_03005590 + floatingSpring->unk56) & 255))
                   & ONE_CYCLE)
               * temp)
            >> 15;
    }

    floatingSpring->unk3C
        = TO_WORLD_POS(floatingSpring->base.spriteX, floatingSpring->base.regionX)
        + Q_24_8_TO_INT(floatingSpring->unk44);
    floatingSpring->unk40 = TO_WORLD_POS(me->y, floatingSpring->base.regionY)
        + Q_24_8_TO_INT(floatingSpring->unk48);
}

static u32 sub_8074EF4(Sprite_FloatingSpring *floatingSpring)
{
    if (PLAYER_IS_ALIVE) {
        u32 temp = sub_800CDBC(&floatingSpring->sprite, floatingSpring->unk3C,
                               floatingSpring->unk40, &gPlayer);
        if (temp != 0) {
            if (Q_24_8_TO_INT(gPlayer.y) < floatingSpring->unk40) {
                gPlayer.y += Q_24_8(floatingSpring->sprite.hitboxes[0].unk5);
                if (gPlayer.speedAirY > 0) {
                    gPlayer.speedAirY = 0;
                }
                return 2;
            } else if (temp & 0x10000) {
                gPlayer.y += Q_8_8(temp);
                if (gPlayer.speedAirY > 0) {
                    gPlayer.speedAirY = 0;
                }
                return 2;
            } else if (temp & 0x20000) {
                gPlayer.y += Q_8_8(temp);
                if (gPlayer.speedAirY < 0) {
                    gPlayer.speedAirY = 0;
                }
                return 1;
            } else if (temp & 0x40000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                if (gPlayer.speedAirX < 0) {
                    gPlayer.speedAirX = 0;
                    gPlayer.speedGroundX = 0;
                }
                return 1;
            } else if (temp & 0x80000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                if (gPlayer.speedAirX > 0) {
                    gPlayer.speedAirX = 0;
                    gPlayer.speedGroundX = 0;
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
            floatingSpring->sprite.graphics.anim = SA2_ANIM_SPRING_UNKNOWN;
            floatingSpring->sprite.variant = 0;
        } else {
            floatingSpring->sprite.graphics.anim = SA2_ANIM_SPRING_PLATFORM;
            floatingSpring->sprite.variant = 0;
        }
    } else {
        if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
            floatingSpring->sprite.graphics.anim = SA2_ANIM_SPRING_UNKNOWN;
            floatingSpring->sprite.variant = ZONE_3;
        } else {
            floatingSpring->sprite.graphics.anim = SA2_ANIM_SPRING_PLATFORM;
            floatingSpring->sprite.variant = 2;
        }
    }
}

static void sub_8075048(Sprite_FloatingSpring *floatingSpring)
{
    if (floatingSpring->unk50) {
        if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
            floatingSpring->sprite.graphics.anim = SA2_ANIM_SPRING_UNKNOWN;
            floatingSpring->sprite.variant = 1;
        } else {
            floatingSpring->sprite.graphics.anim = SA2_ANIM_SPRING_PLATFORM;
            floatingSpring->sprite.variant = 1;
        }
    } else {
        if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
            floatingSpring->sprite.graphics.anim = SA2_ANIM_SPRING_UNKNOWN;
            floatingSpring->sprite.variant = 3;
        } else {
            floatingSpring->sprite.graphics.anim = SA2_ANIM_SPRING_PLATFORM;
            floatingSpring->sprite.variant = 3;
        }
    }
}

static void sub_80750A8(void)
{
    Sprite_FloatingSpring *floatingSpring = TaskGetStructPtr(gCurTask);

    sub_8074E44(floatingSpring);
    if (sub_8075228(floatingSpring)) {
        if (floatingSpring->unk4C) {
            sub_80752BC(floatingSpring);
        }
    } else {
        if (!floatingSpring->unk4C) {
            sub_8075284(floatingSpring);
            sub_8074FD8(floatingSpring);
            sub_8004558(&floatingSpring->sprite);
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
            sub_80051E8(&floatingSpring->sprite);
        }
    }
}

static void sub_8075140(struct Task *t)
{
    Sprite_FloatingSpring *floatingSpring = TaskGetStructPtr(t);

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
    sub_8004558(&floatingSpring->sprite);
    m4aSongNumStart(SE_SPRING);
    gCurTask->main = sub_80752D8;
}

static void sub_80751B4(Sprite_FloatingSpring *floatingSpring)
{
    floatingSpring->sprite.x = floatingSpring->unk3C - gCamera.x;
    floatingSpring->sprite.y = floatingSpring->unk40 - gCamera.y;
}

bool32 sub_80751CC(Sprite_FloatingSpring *floatingSpring)
{
    MapEntity *me = floatingSpring->base.me;
    s16 x = floatingSpring->unk3C - gCamera.x;
    s16 y = floatingSpring->unk40 - gCamera.y;

    if (x < -((me->d.uData[2] * 8) + 0x80) || x > (me->d.uData[2] * 8) + 0x170) {
        return TRUE;
    }

    if (y < -((me->d.uData[3] * 8) + 0x80) || y > (me->d.uData[3] * 8) + 0x220) {
        return TRUE;
    }

    return FALSE;
}

bool32 sub_8075228(Sprite_FloatingSpring *floatingSpring)
{
    MapEntity *me = floatingSpring->base.me;
    s16 x = floatingSpring->unk3C - gCamera.x;
    s16 y = floatingSpring->unk40 - gCamera.y;

    if (x < -((me->d.uData[2] * 8) + 0x80) || x > (me->d.uData[2] * 8) + 0x170) {
        return TRUE;
    }

    if (y < -((me->d.uData[3] * 8) + 0x80) || y > (me->d.uData[3] * 8) + 0x120) {
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
        floatingSpring->sprite.graphics.dest = VramMalloc(0x1C);
        floatingSpring->sprite.unk1E = -1;
        floatingSpring->sprite.unk21 = -1;
        floatingSpring->unk4C = TRUE;
    }
}

static void sub_80752BC(Sprite_FloatingSpring *floatingSpring)
{
    if (floatingSpring->unk4C) {
        VramFree(floatingSpring->sprite.graphics.dest);
        floatingSpring->sprite.graphics.dest = NULL;
        floatingSpring->unk4C = FALSE;
    }
}

static void sub_80752D8(void)
{
    Sprite_FloatingSpring *floatingSpring = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &floatingSpring->sprite;
    sub_8074E44(floatingSpring);
    sub_80751B4(floatingSpring);

    if (!(sprite->unk10 & 0x4000)) {
        sub_8004558(&floatingSpring->sprite);
    } else {
        sub_8075334(floatingSpring);
    }

    if (sub_8074EF4(floatingSpring) == 2) {
        sub_8075154(floatingSpring);
    }

    sub_80051E8(sprite);
}

static void sub_8075334(Sprite_FloatingSpring *floatingSpring)
{
    floatingSpring->unk50 ^= TRUE;
    sub_8074FD8(floatingSpring);
    sub_8004558(&floatingSpring->sprite);
    sub_80051E8(&floatingSpring->sprite);
    gCurTask->main = sub_80750A8;
}
