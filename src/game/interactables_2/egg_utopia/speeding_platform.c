#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_2/egg_utopia/speeding_platform.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 x;
    s32 y;
    s32 unk44;
    s32 unk48;

    bool32 unk4C;
    s16 unk50;
    s16 unk52;

    s32 unk54;
    s16 unk58;
    s16 unk5A;
    s16 unk5C;
    u8 unk5E;
    s32 unk60[3][2];
} Sprite_SpeedingPlatform; /* size 0x78 */

static void Task_Interactable097(void);
static void TaskDestructor_Interactable097(struct Task *);
static void sub_807FF04(Sprite_SpeedingPlatform *);
static void sub_807FB1C(Sprite_SpeedingPlatform *);
static bool32 sub_807FE90(Sprite_SpeedingPlatform *);
static void sub_807FEEC(Sprite_SpeedingPlatform *);
static void RenderPlatform(Sprite_SpeedingPlatform *);
static bool32 sub_807FC9C(Sprite_SpeedingPlatform *);
static u32 sub_807FD0C(Sprite_SpeedingPlatform *platform);
static void sub_807FE34(Sprite_SpeedingPlatform *);
static void sub_807FF20(void);
static void sub_807FF88(Sprite_SpeedingPlatform *);
static void sub_807FFB0(void);

void CreateEntity_SpeedingPlatform(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                   u8 spriteY)
{
    u32 i;
    struct Task *t = TaskCreate(Task_Interactable097, sizeof(Sprite_SpeedingPlatform),
                                0x2010, 0, TaskDestructor_Interactable097);
    Sprite_SpeedingPlatform *platform = TaskGetStructPtr(t);
    Sprite *sprite;
    platform->unk54 = 0;
    platform->unk58 = 0;
    platform->unk5A = 0;
    platform->unk5C = 0;
    platform->unk5E = 32;

    platform->x = TO_WORLD_POS(me->x, spriteRegionX);
    platform->y = TO_WORLD_POS(me->y, spriteRegionY);

    platform->unk44 = Q_24_8(32);
    platform->unk48 = Q_24_8(18);

    platform->base.regionX = spriteRegionX;
    platform->base.regionY = spriteRegionY;
    platform->base.me = me;
    platform->base.spriteX = me->x;
    platform->base.spriteY = spriteY;

    for (i = 0; i < 3; i++) {
        platform->unk60[i][0] = platform->unk44;
        platform->unk60[i][1] = platform->unk48;
    }

    sprite = &platform->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->palId = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = SPRITE_FLAG(PRIORITY, 2);
    sprite->graphics.dest = VramMalloc(0x10);
    sprite->graphics.anim = SA2_ANIM_SPEEDING_PLATFORM;
    sprite->variant = 0;
    sub_8004558(sprite);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807F9F0(void)
{
    Sprite_SpeedingPlatform *platform = TaskGetStructPtr(gCurTask);
    if (IS_MULTI_PLAYER) {
        sub_807FF04(platform);
    }

    sub_807FB1C(platform);
    if (platform->unk4C && platform->unk5A > -1) {
        s32 res = sub_801F100(platform->y + Q_24_8_TO_INT(platform->unk48),
                              platform->x + Q_24_8_TO_INT(platform->unk44), 1, 8,
                              sub_801EC3C);
        if (res < 0) {
            platform->unk4C = FALSE;
            gPlayer.transition = PLTRANS_PT3;
            gPlayer.moveState &= ~8;
            gPlayer.unk3C = 0;
        }
    }

    if (sub_807FE90(platform)) {
        sub_807FEEC(platform);
    } else {
        RenderPlatform(platform);
    }
}

static void sub_807FA98(Sprite_SpeedingPlatform *platform)
{
    platform->unk44 = Q_24_8(814);
    platform->unk48 = Q_24_8(576);

    platform->unk5E = 224;
    platform->unk5C = Q_24_8(8);
    platform->unk58 = COS_24_8(platform->unk5E * 4) * 8;
    platform->unk5A = Q_24_8_TO_INT(platform->unk5C * SIN_24_8(platform->unk5E * 4));
    platform->unk54 = 1;
    m4aSongNumStop(SE_288);
    gCurTask->main = sub_807F9F0;
}

static void sub_807FB1C(Sprite_SpeedingPlatform *platform)
{
    if (platform->unk54 == 0) {
        platform->unk5C = platform->unk5C > Q_24_8(15) ? Q_24_8(15) : platform->unk5C;
        platform->unk58 = Q_24_8_TO_INT(platform->unk5C * COS_24_8(platform->unk5E * 4));
        platform->unk5A = Q_24_8_TO_INT(platform->unk5C * SIN_24_8(platform->unk5E * 4));
    } else {
        platform->unk5A += Q_24_8(0.1640625);
        platform->unk5A = platform->unk5A > Q_24_8(8) ? Q_24_8(8) : platform->unk5A;
    }

    platform->unk44 += platform->unk58;
    platform->unk48 += platform->unk5A;

    if (PLAYER_IS_ALIVE && platform->unk4C) {
        gPlayer.x = platform->unk50 + (Q_24_8(platform->x) + platform->unk44);
        gPlayer.y = platform->unk52 + (Q_24_8(platform->y) + platform->unk48)
            - Q_24_8(gPlayer.unk17);
        platform->unk50 += gPlayer.speedAirX;
        platform->unk52 += gPlayer.speedAirY;
    }

    platform->unk4C = sub_807FC9C(platform);
}

static void RenderPlatform(Sprite_SpeedingPlatform *platform)
{
    Sprite *sprite = &platform->sprite;
    if (IS_MULTI_PLAYER) {
        sprite->x = platform->x + Q_24_8_TO_INT(platform->unk60[1][0]) - gCamera.x;
        sprite->y = platform->y + Q_24_8_TO_INT(platform->unk60[1][1]) - gCamera.y;
    } else {
        sprite->x = platform->x + Q_24_8_TO_INT(platform->unk44) - gCamera.x;
        sprite->y = platform->y + Q_24_8_TO_INT(platform->unk48) - gCamera.y;
    }

    sprite->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
    sub_80051E8(sprite);
    sprite->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;
    sub_80051E8(sprite);
}

static bool32 sub_807FC9C(Sprite_SpeedingPlatform *platform)
{
    if (!platform->unk4C) {
        return FALSE;
    }

    if (gPlayer.moveState
        & (MOVESTATE_1000000 | MOVESTATE_400000 | MOVESTATE_IN_AIR | MOVESTATE_DEAD)) {
        gPlayer.moveState &= ~MOVESTATE_8;
        gPlayer.unk3C = NULL;
        return FALSE;
    }

    if (sub_807FD0C(platform) != 2) {
        s16 x = platform->x + Q_24_8_TO_INT(platform->unk44) - gCamera.x - 27;
        s16 playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;

        if (x <= playerX && (x + 54) >= playerX) {
            return TRUE;
        }
    } else {
        return TRUE;
    }

    return FALSE;
}

static u32 sub_807FD0C(Sprite_SpeedingPlatform *platform)
{
    if (PLAYER_IS_ALIVE) {
        u32 temp = sub_800CCB8(&platform->sprite,
                               platform->x + Q_24_8_TO_INT(platform->unk44),
                               platform->y + Q_24_8_TO_INT(platform->unk48), &gPlayer);

        if (temp != 0) {
            if (temp & 0x10000) {
                gPlayer.y += Q_8_8(temp);
                gPlayer.speedAirY = 0;
                return 2;
            }

            if (temp & 0x40000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                gPlayer.speedAirX = 0;
                gPlayer.speedGroundX = 0;
                gPlayer.moveState |= MOVESTATE_20;
                return 1;
            }

            if (temp & 0x80000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                gPlayer.speedAirX = 0;
                gPlayer.speedGroundX = 0;
                gPlayer.moveState |= MOVESTATE_20;
                return 1;
            }

            if (temp & 0x20000) {
                gPlayer.y += Q_8_8(temp);
                gPlayer.speedAirY = 0;
                return 1;
            }
        }
    }

    return 0;
}

static void Task_Interactable097(void)
{
    Sprite_SpeedingPlatform *platform = TaskGetStructPtr(gCurTask);
    if (IS_MULTI_PLAYER) {
        sub_807FF04(platform);
    }

    if (sub_807FD0C(platform) == 2) {
        sub_807FE34(platform);
    }

    if (sub_807FE90(platform)) {
        sub_807FEEC(platform);
    } else {
        RenderPlatform(platform);
    }
}

static void TaskDestructor_Interactable097(struct Task *t)
{
    Sprite_SpeedingPlatform *platform = TaskGetStructPtr(t);
    VramFree(platform->sprite.graphics.dest);
}

static void sub_807FE34(Sprite_SpeedingPlatform *platform)
{
    platform->unk50 = gPlayer.x - (Q_24_8(platform->x) + platform->unk44);
    platform->unk52
        = gPlayer.y - (Q_24_8(platform->y) + platform->unk48) + Q_24_8(gPlayer.unk17);
    platform->unk4C = TRUE;
    m4aSongNumStart(SE_288);
    gCurTask->main = sub_807FF20;
}

static bool32 sub_807FE90(Sprite_SpeedingPlatform *platform)
{
    s16 x = platform->x + Q_24_8_TO_INT(platform->unk44) - gCamera.x;
    s16 y = platform->y + Q_24_8_TO_INT(platform->unk48) - gCamera.y;

    if ((u16)(x + 192) > 624 || y + 32 < -128 || y - 32 >= 289) {
        return TRUE;
    }

    return FALSE;
}

static void sub_807FEEC(Sprite_SpeedingPlatform *platform)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(platform->base.me, platform->base.spriteX);
    TaskDestroy(gCurTask);
}

static void sub_807FF04(Sprite_SpeedingPlatform *platform)
{
    platform->unk60[2][0] = platform->unk60[1][0];
    platform->unk60[2][1] = platform->unk60[1][1];

    platform->unk60[1][0] = platform->unk60[0][0];
    platform->unk60[1][1] = platform->unk60[0][1];

    platform->unk60[0][0] = platform->unk44;
    platform->unk60[0][1] = platform->unk48;
}

static void sub_807FF20(void)
{
    Sprite_SpeedingPlatform *platform = TaskGetStructPtr(gCurTask);

    if (IS_MULTI_PLAYER) {
        sub_807FF04(platform);
    }

    platform->unk5C += Q_24_8(0.125);
    sub_807FB1C(platform);

    if (platform->unk44 >= Q_24_8(590)) {
        sub_807FF88(platform);
    }

    if (sub_807FE90(platform)) {
        sub_807FEEC(platform);
    } else {
        RenderPlatform(platform);
    }
}

static void sub_807FF88(Sprite_SpeedingPlatform *platform)
{
    platform->unk44 = Q_24_8(590);
    platform->unk48 = Q_24_8(576);
    platform->unk5E = 0;
    gCurTask->main = sub_807FFB0;
}

static void sub_807FFB0(void)
{
    Sprite_SpeedingPlatform *platform = TaskGetStructPtr(gCurTask);

    if (IS_MULTI_PLAYER) {
        sub_807FF04(platform);
    }

    sub_807FB1C(platform);

    if (platform->unk44 >= Q_24_8(814)) {
        sub_807FA98(platform);
    }

    if (sub_807FE90(platform)) {
        sub_807FEEC(platform);
    } else {
        RenderPlatform(platform);
    }
}
