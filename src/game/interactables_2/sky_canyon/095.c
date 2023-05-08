#include "global.h"
#include "core.h"
#include "task.h"
#include "game/interactables_2/sky_canyon/095.h"
#include "malloc_vram.h"
#include "trig.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
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

void initSprite_Interactable095(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable095Main, sizeof(Sprite_IA95), 0x2010, 0,
                                TaskDestructor_Interactable095);
    Sprite_IA95 *ia95 = TaskGetStructPtr(t);
    Sprite *sprite;
    ia95->unk44 = 0;
    ia95->unk48 = 0;

    ia95->base.me = me;
    ia95->base.regionX = spriteRegionX;
    ia95->base.regionY = spriteRegionY;
    ia95->base.spriteX = me->x;
    ia95->base.spriteY = spriteY;

    sprite = &ia95->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = VramMalloc(0x12);
    sprite->graphics.anim = 0x26A;
    sprite->variant = 0;
    sub_8004558(sprite);

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
        ia95->unk44 = (temp
                       * SIN((ia95->unk4C * ((gUnknown_03005590 + ia95->unk50) & 0xFF))
                             & ONE_CYCLE))
            >> 0xF;
    }

    if (ia95->unk4E != 0) {
        s32 temp = (me->d.uData[3] * 0x800);
        ia95->unk48 = (temp
                       * SIN((ia95->unk4E * ((gUnknown_03005590 + ia95->unk50) & 0xFF))
                             & ONE_CYCLE))
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
    VramFree(ia95->sprite.graphics.dest);
}

static void sub_807F0D8(Sprite_IA95 *ia95)
{
    ia95->sprite.x = ia95->unk3C - gCamera.x;
    ia95->sprite.y = ia95->unk40 - gCamera.y;
    ia95->sprite.unk10 &= ~0x400;
    sub_80051E8(&ia95->sprite);
    ia95->sprite.unk10 |= 0x400;
    sub_80051E8(&ia95->sprite);
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

    if (sub_800DF38(&ia95->sprite, ia95->unk3C, ia95->unk40, &gPlayer) & 0xF0000) {
        return TRUE;
    }

    return FALSE;
}

static void DestroyInteractable095(Sprite_IA95 *ia95)
{
    ia95->base.me->x = ia95->base.spriteX;
    TaskDestroy(gCurTask);
}
