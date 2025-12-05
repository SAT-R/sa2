#include "global.h"

#include "trig.h"
#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/interactables_2/sky_canyon/propeller_spring.h"
#include "game/interactables_2/sky_canyon_init.h"

#include "game/stage/player_controls.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 unk3C;
    s32 unk40;
    s16 unk44;
    s16 unk46;
    u8 unk48;
    u8 unk49;
} Sprite_IA85;

static bool32 sub_807C424(Sprite_IA85 *);
static void sub_807C4A0(Sprite_IA85 *);
static bool32 sub_807C598(Sprite_IA85 *);
static void sub_807C5E0(Sprite_IA85 *);
static void sub_807C614(void);
static void sub_807C558(Sprite_IA85 *);
static void TaskDestructor_Interactable085(struct Task *);

static void Task_Interactable085(void)
{
    Sprite_IA85 *ia85 = TASK_DATA(gCurTask);
    ia85->unk46 = SIN_24_8(ia85->unk49 * 4) * 2;
    ia85->unk49 += 2;
    if (sub_807C424(ia85)) {
        sub_807C4A0(ia85);
    }

    if (sub_807C598(ia85)) {
        sub_807C5E0(ia85);
    } else {
        sub_807C614();
        sub_807C558(ia85);
    }
}

static void sub_807C52C(Sprite_IA85 *);
static void sub_807C4EC(Sprite_IA85 *);

static void sub_807C2E0(void)
{
    s16 r1;
    Sprite_IA85 *ia85 = TASK_DATA(gCurTask);
    ia85->unk46 = SIN_24_8(ia85->unk49 * 4) * 16;
    sub_807C52C(ia85);

    r1 = (0x40 - ia85->unk49) >> 2;

    if (r1 > 3) {
        if (r1 > 6) {
            r1 = 6;
        }
    } else {
#ifndef NON_MATCHING
        do
            r1 = 4;
        while (0);
#else
        r1 = 4;
#endif
    }
    ia85->unk49 += r1;
    if (ia85->unk49 > 63) {
        sub_807C4EC(ia85);
    }
    sub_807C614();
    sub_807C558(ia85);
}

static void sub_807C504(Sprite_IA85 *);

static void sub_807C360(void)
{
    Sprite_IA85 *ia85 = TASK_DATA(gCurTask);
    ia85->unk49 += 8;
    if (ia85->unk49 == 0x80) {
        sub_807C504(ia85);
    } else if (ia85->unk49 > 0x80) {
        ia85->unk46 = SIN_24_8(ia85->unk49 * 4) * 6;
    } else {
        ia85->unk46 = SIN_24_8(ia85->unk49 * 4) * 3;
    }

    sub_807C614();
    sub_807C558(ia85);
}

static void sub_807C3DC(Sprite_IA85 *ia85)
{
    if (gPlayer.frameInput & gPlayerControls.jump) {
        if (!(ia85->unk48 & 2)) {
            if (!(ia85->unk48 & 1)) {
                ia85->unk48 |= 1;
            } else {
                ia85->unk48 &= ~0x1;
                ia85->unk48 |= 2;
            }
        }
    }
}

static bool32 sub_807C424(Sprite_IA85 *ia85)
{
    s16 temp, temp2, temp3, temp4;
    if (gPlayer.moveState & 0x80 || gPlayer.qSpeedAirY <= 0) {
        return 0;
    }

    temp = ia85->unk3C - gCamera.x;
    temp3 = ia85->unk40 - gCamera.y;
    temp2 = I(gPlayer.qWorldX) - gCamera.x;
    temp4 = I(gPlayer.qWorldY) - gCamera.y;
    if (temp - 0x14 <= temp2 && temp + 0x14 >= temp2) {
        if (temp3 - 0xC <= temp4 && temp3 + 0xC >= temp4) {
            return 1;
        }
    }

    return 0;
}

static void sub_807C4A0(Sprite_IA85 *ia85)
{
    gPlayer.transition = PLTRANS_PROPELLER_SPRING;
    if (ia85->unk48 & 1)
        gPlayer.qSpeedAirY = -Q(5.5);
    else
        gPlayer.qSpeedAirY = -Q(5.5);
    ia85->unk49 = 0;
    ia85->unk48 = 0;
    m4aSongNumStart(SE_284);
    gCurTask->main = sub_807C2E0;
}

static void sub_807C6E4(void);

static void sub_807C4EC(Sprite_IA85 *ia85)
{
    ia85->unk49 = 0;
    gCurTask->main = sub_807C6E4;
}

static void sub_807C504(Sprite_IA85 *ia85)
{
    ia85->unk44 = 0;
    ia85->unk46 = 0;
    ia85->unk49 = 0;
    gCurTask->main = Task_Interactable085;
}

static void sub_807C52C(Sprite_IA85 *ia85)
{
    if (gPlayer.frameInput & gPlayerControls.jump) {
        ia85->unk48 |= 2;
    }
}

static Sprite *sub_807C5F8(void);

static void sub_807C558(Sprite_IA85 *ia85)
{
    Sprite *sprite = sub_807C5F8();
    sprite->x = ia85->unk3C - gCamera.x + I(ia85->unk44);
    sprite->y = ia85->unk40 - gCamera.y + I(ia85->unk46);

    DisplaySprite(sprite);
}

static bool32 sub_807C598(Sprite_IA85 *ia85)
{
    s32 temp1, temp;
    s16 temp2, temp3;
    temp1 = ia85->unk3C;
    temp1 -= gCamera.x;
    temp = ia85->unk40;
    temp -= gCamera.y;

    temp2 = temp1;
    temp3 = temp;
    if (temp2 < -128 || temp2 > (DISPLAY_WIDTH + 128) || temp3 < -128 || temp3 > (DISPLAY_HEIGHT + 128)) {
        return 1;
    }

    return 0;
}

static void sub_807C5E0(Sprite_IA85 *ia85)
{
    ia85->base.me->x = ia85->base.meX;
    TaskDestroy(gCurTask);
}

static Sprite *sub_807C5F8(void)
{
    EntitiesManager *em = TASK_DATA(TASK_PARENT(gCurTask));
    Sprite_OnInit_SkyCanyon *level = TASK_DATA(em->preInit);
    return &level->spring;
}

static void sub_807C614(void)
{
    EntitiesManager *em = TASK_DATA(TASK_PARENT(gCurTask));
    Sprite_OnInit_SkyCanyon *level = TASK_DATA(em->preInit);

    level->unk60++;
}

void CreateEntity_PropellerSpring(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable085, sizeof(Sprite_IA85), 0x2010, 0, TaskDestructor_Interactable085);
    Sprite_IA85 *ia85 = TASK_DATA(t);
    ia85->unk3C = TO_WORLD_POS(me->x, spriteRegionX);
    ia85->unk40 = TO_WORLD_POS(me->y, spriteRegionY);

    ia85->unk44 = 0;
    ia85->unk46 = 0;
    ia85->unk49 = 0;

    ia85->base.regionX = spriteRegionX;
    ia85->base.regionY = spriteRegionY;
    ia85->base.me = me;
    ia85->base.meX = me->x;
    ia85->base.id = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807C72C(Sprite_IA85 *);

static void sub_807C6E4(void)
{
    Sprite_IA85 *ia85 = TASK_DATA(gCurTask);
    sub_807C3DC(ia85);

    if (++ia85->unk49 > 0) {
        sub_807C72C(ia85);
    }

    sub_807C614();
    sub_807C558(ia85);
}

static void TaskDestructor_Interactable085(struct Task *t)
{
    // unused
}

static void sub_807C744(void);

static void sub_807C72C(Sprite_IA85 *ia85)
{
    ia85->unk49 = 0x40;
    gCurTask->main = sub_807C744;
}

static void sub_807C7A0(Sprite_IA85 *);

static void sub_807C744(void)
{
    Sprite_IA85 *ia85 = TASK_DATA(gCurTask);
    ia85->unk46 = SIN_24_8(ia85->unk49 * 4) * 16;
    sub_807C3DC(ia85);

    ia85->unk49 += 8;
    if ((s8)ia85->unk49 < 0) {
        sub_807C7A0(ia85);
    }

    sub_807C614();
    sub_807C558(ia85);
}

static void sub_807C7A0(Sprite_IA85 *ia85)
{
    ia85->unk49 = 0x80;
    gCurTask->main = sub_807C360;
}
