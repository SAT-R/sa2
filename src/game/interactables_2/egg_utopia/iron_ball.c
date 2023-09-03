#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "game/interactables_2/egg_utopia/iron_ball.h"

#include "constants/animations.h"

typedef struct {
    SpriteBase base;
    Sprite s;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    s16 unk4C;
    s16 unk4E;
    u16 unk50;
} Sprite_IA95;

static void Task_Interactable095Main(void);

static void sub_807EFC4(Sprite_IA95 *);
static void sub_807F0D8(Sprite_IA95 *);
static bool32 sub_807F17C(Sprite_IA95 *);
static bool32 sub_807F120(Sprite_IA95 *);

static void TaskDestructor_Interactable095(struct Task *);
static void DestroyInteractable095(Sprite_IA95 *);

void CreateEntity_IronBall(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                           u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable095Main, sizeof(Sprite_IA95), 0x2010, 0,
                                TaskDestructor_Interactable095);
    Sprite_IA95 *ia95 = TaskGetStructPtr(t);
    Sprite *s;
    ia95->unk44 = 0;
    ia95->unk48 = 0;

    ia95->base.me = me;
    ia95->base.regionX = spriteRegionX;
    ia95->base.regionY = spriteRegionY;
    ia95->base.spriteX = me->x;
    ia95->base.spriteY = spriteY;

    s = &ia95->s;
    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x2000;
    s->graphics.dest = VramMalloc(0x12);
    s->graphics.anim = SA2_ANIM_IRON_BALL;
    s->variant = 0;
    UpdateSpriteAnimation(s);

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            ia95->unk4C = 4;
            ia95->unk4E = 0;
            ia95->unk50 = 0;
        } else {
            ia95->unk4C = 4;
            ia95->unk4E = 0;
            ia95->unk50 = 0x80;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            ia95->unk4C = 0;
            ia95->unk4E = 4;
            ia95->unk50 = 0;
        } else {
            ia95->unk4C = 0;
            ia95->unk4E = 4;
            ia95->unk50 = 0x80;
        }
    }
    sub_807EFC4(ia95);
    sub_807F0D8(ia95);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807EFC4(Sprite_IA95 *ia95)
{
    MapEntity *me = ia95->base.me;

    if (ia95->unk4C != 0) {
        s32 temp = me->d.uData[2] * 0x800;
        ia95->unk44
            = (temp
               * SIN((ia95->unk4C * ((gStageTime + ia95->unk50) & 0xFF)) & ONE_CYCLE))
            >> 0xF;
    }

    if (ia95->unk4E != 0) {
        s32 temp = (me->d.uData[3] * 0x800);
        ia95->unk48
            = (temp
               * SIN((ia95->unk4E * ((gStageTime + ia95->unk50) & 0xFF)) & ONE_CYCLE))
            >> 0xF;
    }

    ia95->unk3C = TO_WORLD_POS(ia95->base.spriteX, ia95->base.regionX)
        + Q_24_8_TO_INT(ia95->unk44);
    ia95->unk40 = TO_WORLD_POS(me->y, ia95->base.regionY) + Q_24_8_TO_INT(ia95->unk48);
}

static void Task_Interactable095Main(void)
{
    Sprite_IA95 *ia95 = TaskGetStructPtr(gCurTask);

    sub_807EFC4(ia95);

    if (sub_807F17C(ia95)) {
        sub_800CBA4(&gPlayer);
    }

    if (sub_807F120(ia95)) {
        DestroyInteractable095(ia95);
    } else {
        sub_807F0D8(ia95);
    }
}

static void TaskDestructor_Interactable095(struct Task *t)
{
    Sprite_IA95 *ia95 = TaskGetStructPtr(t);
    VramFree(ia95->s.graphics.dest);
}

static void sub_807F0D8(Sprite_IA95 *ia95)
{
    ia95->s.x = ia95->unk3C - gCamera.x;
    ia95->s.y = ia95->unk40 - gCamera.y;
    ia95->s.unk10 &= ~0x400;
    DisplaySprite(&ia95->s);
    ia95->s.unk10 |= 0x400;
    DisplaySprite(&ia95->s);
}

static bool32 sub_807F120(Sprite_IA95 *ia95)
{
    MapEntity *me = ia95->base.me;
    s16 x = ia95->unk3C - gCamera.x;
    s16 y = ia95->unk40 - gCamera.y;

    if (x < -((me->d.uData[2] * 8) + 0x80) || x > (me->d.uData[2] * 8) + 0x170) {
        return TRUE;
    }

    if (y < -((me->d.uData[3] * 8) + 0x80) || y > (me->d.uData[3] * 8) + 0x120) {
        return TRUE;
    }

    return FALSE;
}

static bool32 sub_807F17C(Sprite_IA95 *ia95)
{
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        return FALSE;
    }

    if (sub_800DF38(&ia95->s, ia95->unk3C, ia95->unk40, &gPlayer) & 0xF0000) {
        return TRUE;
    }

    return FALSE;
}

static void DestroyInteractable095(Sprite_IA95 *ia95)
{
    ia95->base.me->x = ia95->base.spriteX;
    TaskDestroy(gCurTask);
}
