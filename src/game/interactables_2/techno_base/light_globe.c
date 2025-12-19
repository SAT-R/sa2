#include "global.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"
#include "core.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/interactables_2/techno_base/light_globe.h"
#include "malloc_vram.h"
#include "trig.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite s;
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

void CreateEntity_LightGlobe(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable080, sizeof(Sprite_LightGlobe), 0x2010, 0, TaskDestructor_Interactable080);
    Sprite_LightGlobe *globe = TASK_DATA(t);
    Sprite *s;

    globe->unk44 = 0;
    globe->unk46 = 0;
    globe->unk48 = 0;
    globe->unk3C = TO_WORLD_POS(me->x, spriteRegionX);
    globe->unk40 = TO_WORLD_POS(me->y, spriteRegionY);
    globe->base.regionX = spriteRegionX;
    globe->base.regionY = spriteRegionY;
    globe->base.me = me;
    globe->base.meX = me->x;
    globe->base.id = spriteY;

    s = &globe->s;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
    s->graphics.dest = VramMalloc(9);
    s->graphics.anim = SA2_ANIM_LIGHT_GLOBE;
    s->variant = 0;

    SET_MAP_ENTITY_INITIALIZED(me);
}

static bool32 sub_807B190(Sprite_LightGlobe *globe)
{
    s32 temp3, temp4;
    s16 temp5, temp6;

    temp3 = globe->unk3C;
    temp3 -= gCamera.x;
    temp3 += I(globe->unk44);

    temp4 = globe->unk40;
    temp4 -= gCamera.y;
    temp4 += I(globe->unk46);

    temp5 = temp3;
    temp6 = temp4;

    if (temp5 < -128 || temp5 > (DISPLAY_WIDTH + 128) || temp6 < -128 || (temp6 > (DISPLAY_HEIGHT + 128) + 128)) {
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
    r3 += I(globe->unk44);

    r2 = globe->unk40;
    r2 -= gCamera.y;
    r2 += I(globe->unk46);

    r0 = I(gPlayer.qWorldX);
    r0 -= gCamera.x;
    r1 = I(gPlayer.qWorldY);
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
    Sprite_LightGlobe *globe = TASK_DATA(gCurTask);
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
    Sprite_LightGlobe *globe = TASK_DATA(t);
    VramFree(globe->s.graphics.dest);
}

static void sub_807B2D0(Sprite_LightGlobe *globe)
{
    gPlayer.transition = PLTRANS_SPRING_UP;
    gPlayer.unk6E = 0;
    globe->s.graphics.anim = SA2_ANIM_LIGHT_GLOBE;
    globe->s.variant = 1;
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
    Sprite *s = &globe->s;
    s->x = globe->unk3C - gCamera.x + I(globe->unk44);
    s->y = globe->unk40 - gCamera.y + I(globe->unk46);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void sub_807B398(Sprite_LightGlobe *globe)
{
    globe->base.me->x = globe->base.meX;
    TaskDestroy(gCurTask);
}

static void sub_807B3B0(void)
{
    Sprite_LightGlobe *globe = TASK_DATA(gCurTask);

    if (globe->s.frameFlags & 0x4000) {
        sub_807B398(globe);
    } else {
        sub_807B350(globe);
    }
}
