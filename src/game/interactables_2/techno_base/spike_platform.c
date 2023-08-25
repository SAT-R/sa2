#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/techno_base/spike_platform.h"
#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
} Sprite_IA78;

static void Task_Interactable078(void);
static void TaskDestructor_Interactable078(struct Task *);
static void sub_807ACF4(Sprite_IA78 *, u32);
static bool32 sub_807B028(Sprite_IA78 *);
static void sub_807B004(Sprite_IA78 *);
static void sub_807B070(Sprite_IA78 *);

static const u16 gUnknown_080E00B4[][2] = {
    { SA2_ANIM_SPIKE_PLATFORM, 2 }, { SA2_ANIM_SPIKE_PLATFORM, 3 },
    { SA2_ANIM_SPIKE_PLATFORM, 4 }, { SA2_ANIM_SPIKE_PLATFORM, 5 },
    { SA2_ANIM_SPIKE_PLATFORM, 6 }, { SA2_ANIM_SPIKE_PLATFORM, 7 },
    { SA2_ANIM_SPIKE_PLATFORM, 8 }, { SA2_ANIM_SPIKE_PLATFORM, 9 },
};

static const u16 gUnknown_080E00D4[][2] = {
    { 0, 0 },  { 2, 2 },  { 4, 4 },  { 6, 6 },  { 12, 0 },
    { 18, 6 }, { 21, 0 }, { 27, 6 }, { 33, 4 }, { 35, 0 },
};

static const u16 gUnknown_080E00FC[][2] = {
    { 0, 0 },  { 6, 4 },  { 8, 6 },  { 38, 0 }, { 44, 6 },
    { 47, 0 }, { 53, 6 }, { 59, 4 }, { 51, 2 }, { 53, 0 },
};

void CreateEntity_SpikePlatform(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    Sprite *sprite;
    struct Task *t = TaskCreate(Task_Interactable078, sizeof(Sprite_IA78), 0x2010, 0,
                                TaskDestructor_Interactable078);
    Sprite_IA78 *ia78 = TaskGetStructPtr(t);

    ia78->base.me = me;
    ia78->base.regionX = spriteRegionX;
    ia78->base.regionY = spriteRegionY;
    ia78->base.spriteX = me->x;
    ia78->base.spriteY = spriteY;

    ia78->unk3C = TO_WORLD_POS(me->x, spriteRegionX);
    ia78->unk40 = TO_WORLD_POS(me->y, spriteRegionY);

    sprite = &ia78->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->animCursor = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->hitboxes[0].index = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = VramMalloc(42);
    sprite->graphics.anim = -1;
    sprite->variant = -1;
    sub_807ACF4(ia78, 1);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807ACF4(Sprite_IA78 *ia78, u32 p2)
{
    u8 i;
    Sprite *sprite = &ia78->sprite;
    u32 temp = gUnknown_03005590 % 286;

    if (temp <= 119) {
        temp &= 15;

        if (p2 != 0) {
            if (temp < 8) {
                sprite->graphics.anim = SA2_ANIM_SPIKE_PLATFORM;
                sprite->variant = 8;
                sub_8004558(sprite);
            } else {
                sprite->graphics.anim = SA2_ANIM_SPIKE_PLATFORM;
                sprite->variant = 9;
                sub_8004558(sprite);
            }
        } else {
            if (temp == 0) {
                sprite->graphics.anim = SA2_ANIM_SPIKE_PLATFORM;
                sprite->variant = 8;
                sub_8004558(sprite);
            } else if (temp == 8) {
                sprite->graphics.anim = SA2_ANIM_SPIKE_PLATFORM;
                sprite->variant = 9;
                sub_8004558(sprite);
            }
        }

        ia78->unk44 = 0;
    } else if (temp < 185) {
        temp -= 120;
        for (i = 1; i < 10; i++) {
            if (temp < gUnknown_080E00FC[i][0]) {
                break;
            }
        }
        i--;
        sprite->graphics.anim = gUnknown_080E00B4[gUnknown_080E00FC[i][1]][0];
        sprite->variant = gUnknown_080E00B4[gUnknown_080E00FC[i][1]][1];
        sub_8004558(sprite);
        ia78->unk44 = 0;
    } else if (temp <= 244) {
        temp = (temp - 185) & 15;

        if (p2 != 0) {
            if (temp >= 8) {
                sprite->graphics.anim = SA2_ANIM_SPIKE_PLATFORM;
                sprite->variant = 3;
                sub_8004558(sprite);
            } else {
                sprite->graphics.anim = SA2_ANIM_SPIKE_PLATFORM;
                sprite->variant = 2;
                sub_8004558(sprite);
            }
        } else {
            if (temp == 0) {
                sprite->graphics.anim = SA2_ANIM_SPIKE_PLATFORM;
                sprite->variant = 2;
                sub_8004558(sprite);
            } else if (temp == 8) {
                sprite->graphics.anim = SA2_ANIM_SPIKE_PLATFORM;
                sprite->variant = 3;
                sub_8004558(sprite);
            }
        }

        ia78->unk44 = 1;
    } else {
        temp -= 245;
        for (i = 1; i < 10; i++) {
            if (temp < gUnknown_080E00D4[i][0]) {
                break;
            }
        };
        i--;
        sprite->graphics.anim = gUnknown_080E00B4[gUnknown_080E00D4[i][1]][0];
        sprite->variant = gUnknown_080E00B4[gUnknown_080E00D4[i][1]][1];
        sub_8004558(sprite);
        ia78->unk44 = 0;
    }
}

static u32 sub_807AE60(Sprite_IA78 *ia78)
{
    if (PLAYER_IS_ALIVE) {
        Sprite *sprite = &ia78->sprite;
        u32 temp = sub_800CCB8(sprite, ia78->unk3C, ia78->unk40, &gPlayer);
        if (temp != 0) {
            if (temp & 0x10000) {
                gPlayer.y += Q_8_8(temp);
                gPlayer.speedAirY = 0;
                return 2;
            }
            if (temp & 0x40000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                gPlayer.speedAirX = 0;
                return 1;
            }
            if (temp & 0x80000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                gPlayer.speedAirX = 0;
                return 3;
            }
            if (temp & 0x20000) {
                gPlayer.y += Q_8_8(temp);
                gPlayer.speedAirY = 0;
                return 4;
            }
        }
    }
    return 0;
}

static u32 sub_807AF0C(Sprite_IA78 *ia78)
{
    if (PLAYER_IS_ALIVE) {
        u32 temp;
        ia78->sprite.hitboxes[0].top -= 16;
        ia78->sprite.hitboxes[0].bottom += 16;

        temp = sub_800CDBC(&ia78->sprite, ia78->unk3C, ia78->unk40, &gPlayer);

        ia78->sprite.hitboxes[0].top += 16;
        ia78->sprite.hitboxes[0].bottom -= 16;

        if (temp != 0) {
            if (temp & 0x10000) {
                return 2;
            }

            if (temp & 0x40000) {
                return 1;
            }

            if (temp & 0x80000) {
                return 3;
            }

            if (temp & 0x20000) {
                return 4;
            }
        }
    }

    return 0;
}

static void Task_Interactable078(void)
{
    Sprite_IA78 *ia78 = TaskGetStructPtr(gCurTask);
    sub_807ACF4(ia78, 0);
    sub_807AE60(ia78);

    if (ia78->unk44) {
        if (sub_807AF0C(ia78) & 6) {
            sub_800CBA4(&gPlayer);
        }
    }

    if (sub_807B028(ia78)) {
        sub_807B070(ia78);
    } else {
        sub_807B004(ia78);
    }
}

static void TaskDestructor_Interactable078(struct Task *t)
{
    Sprite_IA78 *ia78 = TaskGetStructPtr(t);
    VramFree(ia78->sprite.graphics.dest);
}

static void sub_807B004(Sprite_IA78 *ia78)
{
    ia78->sprite.x = ia78->unk3C - gCamera.x;
    ia78->sprite.y = ia78->unk40 - gCamera.y;
    sub_80051E8(&ia78->sprite);
}

static bool32 sub_807B028(Sprite_IA78 *ia78)
{
    s32 temp1, temp;
    s16 temp2, temp3;
    temp1 = ia78->unk3C;
    temp1 -= gCamera.x;
    temp = ia78->unk40;
    temp -= gCamera.y;

    temp2 = temp1;
    temp3 = temp;
    if (temp2 < -128 || temp2 > 368 || temp3 < -128 || temp3 >= 289) {
        return TRUE;
    }

    return FALSE;
}

static void sub_807B070(Sprite_IA78 *ia78)
{
    ia78->base.me->x = ia78->base.spriteX;
    TaskDestroy(gCurTask);
}
