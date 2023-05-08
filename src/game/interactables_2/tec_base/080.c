#include "global.h"
#include "game/game.h"
#include "game/entity.h"
#include "core.h"
#include "task.h"
#include "lib/m4a.h"
#include "game/interactables_2/tec_base/080.h"
#include "malloc_vram.h"
#include "trig.h"
#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 unk3C;
    s32 unk40;
    s16 unk44;
    s16 unk46;
    u16 unk48;
} Sprite_LightGlobe;

static void Task_Interactable080(void);
static void TaskDestructor_Interactable080(struct Task *);
static void sub_807B2D0(Sprite_LightGlobe *);
static void sub_807B398(Sprite_LightGlobe *);
static void sub_807B318(Sprite_LightGlobe *);
static void sub_807B350(Sprite_LightGlobe *);
static void sub_807B3B0(void);

void initSprite_Interactable080(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable080, sizeof(Sprite_LightGlobe), 0x2010,
                                0, TaskDestructor_Interactable080);
    Sprite_LightGlobe *globe = TaskGetStructPtr(t);
    Sprite *sprite;

    globe->unk44 = 0;
    globe->unk46 = 0;
    globe->unk48 = 0;
    globe->unk3C = TO_WORLD_POS(me->x, spriteRegionX);
    globe->unk40 = TO_WORLD_POS(me->y, spriteRegionY);
    globe->base.regionX = spriteRegionX;
    globe->base.regionY = spriteRegionY;
    globe->base.me = me;
    globe->base.spriteX = me->x;
    globe->base.spriteY = spriteY;

    sprite = &globe->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = VramMalloc(9);
    sprite->graphics.anim = SA2_ANIM_LIGHT_GLOBE;
    sprite->variant = 0;

    SET_MAP_ENTITY_INITIALIZED(me);
}

static bool32 sub_807B190(Sprite_LightGlobe *globe)
{
    s32 temp3, temp4;
    s16 temp5, temp6;

    temp3 = globe->unk3C;
    temp3 -= gCamera.x;
    temp3 += Q_24_8_TO_INT(globe->unk44);

    temp4 = globe->unk40;
    temp4 -= gCamera.y;
    temp4 += Q_24_8_TO_INT(globe->unk46);

    temp5 = temp3;
    temp6 = temp4;

    if (temp5 < -128 || temp5 > 368 || temp6 < -128 || temp6 > 416) {
        return TRUE;
    }
    return FALSE;
}

static bool32 sub_807B1F0(Sprite_LightGlobe *globe)
{
    s32 r3, r2, r0, r1;
    s16 r3_16, r0_16, r2_16, r1_16, temp2, temp4;
    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    }

    r3 = globe->unk3C;
    r3 -= gCamera.x;
    r3 += Q_24_8_TO_INT(globe->unk44);

    r2 = globe->unk40;
    r2 -= gCamera.y;
    r2 += Q_24_8_TO_INT(globe->unk46);

    r0 = Q_24_8_TO_INT(gPlayer.x);
    r0 -= gCamera.x;
    r1 = Q_24_8_TO_INT(gPlayer.y);
    r1 -= gCamera.y;

    r3_16 = r3;
    r0_16 = r0;
    temp2 = r3_16 - r0_16;
    r2_16 = r2;
    r1_16 = r1;
    temp4 = r2_16 - r1_16;

    if (temp2 * temp2 + temp4 * temp4 < 0x241) {
        return TRUE;
    }
    return FALSE;
}

static void Task_Interactable080(void)
{
    Sprite_LightGlobe *globe = TaskGetStructPtr(gCurTask);
    if (sub_807B1F0(globe)) {
        sub_807B2D0(globe);
    }

    if (sub_807B190(globe)) {
        sub_807B398(globe);
    } else {
        sub_807B318(globe);
        sub_807B350(globe);
    }
}

static void TaskDestructor_Interactable080(struct Task *t)
{
    Sprite_LightGlobe *globe = TaskGetStructPtr(t);
    VramFree(globe->sprite.graphics.dest);
}

static void sub_807B2D0(Sprite_LightGlobe *globe)
{
    gPlayer.unk6D = 14;
    gPlayer.unk6E = 0;
    globe->sprite.graphics.anim = SA2_ANIM_LIGHT_GLOBE;
    globe->sprite.variant = 1;
    m4aSongNumStart(SE_297);
    gCurTask->main = sub_807B3B0;
}

static void sub_807B318(Sprite_LightGlobe *globe)
{
    globe->unk44 = 0;
    globe->unk46 = SIN_24_8(globe->unk48);
    globe->unk48 = (globe->unk48 + 0x10) & ONE_CYCLE;
}

static void sub_807B350(Sprite_LightGlobe *globe)
{
    Sprite *sprite = &globe->sprite;
    sprite->x = globe->unk3C - gCamera.x + Q_24_8_TO_INT(globe->unk44);
    sprite->y = globe->unk40 - gCamera.y + Q_24_8_TO_INT(globe->unk46);
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

static void sub_807B398(Sprite_LightGlobe *globe)
{
    globe->base.me->x = globe->base.spriteX;
    TaskDestroy(gCurTask);
}

static void sub_807B3B0(void)
{
    Sprite_LightGlobe *globe = TaskGetStructPtr(gCurTask);

    if (globe->sprite.unk10 & 0x4000) {
        sub_807B398(globe);
    } else {
        sub_807B350(globe);
    }
}
