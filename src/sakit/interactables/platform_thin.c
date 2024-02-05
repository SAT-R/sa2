#include "global.h"
#include "core.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "lib/m4a.h"

#include "sakit/collision.h"
#include "sakit/interactables/platform_thin.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/multiplayer/unknown_1.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/zones.h"

#include "constants/songs.h"
#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;

    // unused
    /* 0x48 */ s32 unk48;
    /* 0x4C */ s32 unk4C;
} Sprite_CommonThinPlatform;

typedef struct {
    Sprite unk0;
    Sprite unk30;
    Sprite unk60;
    Sprite unk90;
    SpriteTransform unkC0;
    SpriteTransform unkCC;
    SpriteTransform unkD8;
    SpriteTransform unkE4;
    u16 unkF0;
    s16 unkF2;
} Platform_D1C /* size 0xF4*/;

static void Task_PlatformThinMain(void);
static void TaskDestructor_PlatformThin(struct Task *);

static void Task_PlatformBreakParticlesMain(void);
static void TaskDestructor_PlatformBreakParticles(struct Task *);

static void CreatePlatformBreakParticles(s16, s16);
static u32 sub_80111F0(Sprite *, s32, s32, Player *);

static const ALIGNED(4) u16 sPlatformThinAnimations[][3] = {
    { 24, SA2_ANIM_562, 0 },
    { 24, SA2_ANIM_PLATFORM_HOT_CRA, 1 },
    { 24, SA2_ANIM_PLATFORM_SQUARE_MUS_PLA, 2 },
    { 24, SA2_ANIM_PLATFORM_ICE_PAR, 1 },
    { 24, SA2_ANIM_PLATFORM_SKY_CAN, 0 },
    { 24, SA2_ANIM_PLATFORM_TEC_BAS, 1 },
    { 24, SA2_ANIM_610, 0 },
    { 24, SA2_ANIM_610, 0 },
    { 24, SA2_ANIM_610, 0 },
};

static const u16 sPlatformBreakAnimations[][6] = {
    { 4, SA2_ANIM_563, 0, 1, SA2_ANIM_563, 1 },
    { 2, SA2_ANIM_569, 0, 1, SA2_ANIM_569, 1 },
    { 2, SA2_ANIM_579, 0, 1, SA2_ANIM_579, 1 },
    { 2, SA2_ANIM_583, 0, 1, SA2_ANIM_583, 1 },
    { 4, SA2_ANIM_PLATFORM_587, 0, 1, SA2_ANIM_PLATFORM_587, 1 },
    { 2, SA2_ANIM_602, 0, 1, SA2_ANIM_602, 1 },
    { 4, SA2_ANIM_609, 0, 1, SA2_ANIM_609, 1 },
    { 4, SA2_ANIM_609, 0, 1, SA2_ANIM_609, 1 },
    { 4, SA2_ANIM_609, 0, 1, SA2_ANIM_609, 1 },
};
static const u16 unused = 0;

void CreateEntity_PlatformThin(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                               u8 spriteY)
{
    struct Task *t = TaskCreate(Task_PlatformThinMain, sizeof(Sprite_CommonThinPlatform),
                                0x2010, 0, TaskDestructor_PlatformThin);
    Sprite_CommonThinPlatform *platform = TASK_DATA(t);
    Sprite *s = &platform->s;

    platform->base.regionX = spriteRegionX;
    platform->base.regionY = spriteRegionY;
    platform->base.me = me;
    platform->base.spriteX = me->x;
    platform->base.spriteY = spriteY;

    platform->unk40 = 0;
    platform->unk44 = 0;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest
        = VramMalloc(sPlatformThinAnimations[LEVEL_TO_ZONE(gCurrentLevel)][0]);
    s->graphics.anim = sPlatformThinAnimations[LEVEL_TO_ZONE(gCurrentLevel)][1];
    s->variant = sPlatformThinAnimations[LEVEL_TO_ZONE(gCurrentLevel)][2];

    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x2000;

    UpdateSpriteAnimation(s);
}

static void Task_PlatformThinMain(void)
{
    // Have to be declared in this order to match
    Player *player;
    Sprite *s;
    MapEntity *me;
    Sprite_CommonThinPlatform *platform;
    s16 x, y;
    bool32 something;

    player = &gPlayer;
    something = FALSE;
    platform = TASK_DATA(gCurTask);
    s = &platform->s;
    me = platform->base.me;
    x = TO_WORLD_POS(platform->base.spriteX, platform->base.regionX);
    y = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (IS_MULTI_PLAYER && (s8)me->x == -3) {
        CreatePlatformBreakParticles(x, y);

        if (player->moveState & MOVESTATE_8 && player->unk3C == s) {
            player->moveState &= ~MOVESTATE_8;
            player->moveState |= 2;
        }
        TaskDestroy(gCurTask);
        return;
    }

    if (!(player->moveState & (MOVESTATE_400000 | MOVESTATE_DEAD))) {
        u32 temp2 = sub_800CCB8(s, x, y, player);
        if (temp2 & 0xC0000) {
            if (sub_80111F0(s, x, y, player) & 0xC0000) {
                player->x += (s16)(temp2 & 0xFF00);
                player->speedAirX = 0;
            }
        }

        if (temp2 & 0x30000) {
            s16 unk64 = player->unk64;
            s16 anim = player->anim;
            s16 variant = player->variant;
            switch (player->character) {
                case CHARACTER_KNUCKLES:
                    if (unk64 == 0x6B) {
                        player->moveState &= ~0x8;
                        player->moveState |= 2;
                        player->speedAirY = player->speedAirY >> 1;
                        CreatePlatformBreakParticles(x, y);
                        something = TRUE;
                        break;
                    }
                    player->y += (s16)(temp2 << 8);
                    player->speedAirY = 0;
                    break;
                case CHARACTER_SONIC:
                case CHARACTER_AMY: {
                    anim -= gPlayerCharacterIdleAnims[player->character];
                    if (unk64 == 0x24 && anim == 0x33 && variant == 1
                        && player->speedAirY > 0) {
                        player->moveState &= ~MOVESTATE_8;
                        CreatePlatformBreakParticles(x, y);
                        something = TRUE;
                    }
                }
                default:
                    player->y += (s16)(temp2 << 8);
                    player->speedAirY = 0;
                    break;
            }
        }
    }
    if (something) {
        if (IS_MULTI_PLAYER) {
            struct UNK_3005510 *unk5510 = sub_8019224();
            unk5510->unk0 = 1;
            unk5510->unk1 = platform->base.regionX;
            unk5510->unk2 = platform->base.regionY;
            unk5510->unk3 = platform->base.spriteY;
            unk5510->unk4 = 0;
        }
        TaskDestroy(gCurTask);
        return;
    }

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, x - gCamera.x, y - gCamera.y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
    return;
}
// (95.35%) https://decomp.me/scratch/8xD3v
NONMATCH("asm/non_matching/sakit/interactables/CreatePlatformBreakParticles.inc",
         static void CreatePlatformBreakParticles(s16 x, s16 y))
{
    struct Task *t = TaskCreate(Task_PlatformBreakParticlesMain, sizeof(Platform_D1C),
                                0x2011, 0, TaskDestructor_PlatformBreakParticles);
    Platform_D1C *platform = TASK_DATA(t);

    // Hack for better match
    register s32 r6 asm("r6");

    {
        Sprite *s = &platform->unk0;
        SpriteTransform *transform = &platform->unkC0;
        platform->unkF0 = 0;
        platform->unkF2 = 0xFE00;
        x -= 128;
        y -= 50;

        // Init base 1
        s->graphics.dest
            = VramMalloc(sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][0]);
        s->graphics.anim = sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][1];
        s->variant = sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][2];

        s->unk1A = SPRITE_OAM_ORDER(8);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->unk10 = 0x70;

        // Init transform
        transform->rotation = 0;
        transform->width = 0x100;
        transform->height = 0x100;
        transform->x = x;
        transform->y = y;

        UpdateSpriteAnimation(s);

        // copy base 1
        DmaCopy16(3, &platform->unk0, &platform->unk30, 0x30);
        s = &platform->unk30;

        // copy transform
        DmaCopy16(3, &platform->unkC0, &platform->unkCC, 0xC);

        // Set the new params
        s->unk10 = 0x71;

        transform = &platform->unkCC;
        transform->y = y - 0x10;
    }

    {
        Sprite *s;
        SpriteTransform *transform;
        // init base 2
        s = &platform->unk60;

        // Copy the transform
        DmaCopy16(3, &platform->unkC0, &platform->unkD8, 0xC);

        s->graphics.dest
            = VramMalloc(sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][3]);
        s->graphics.anim = sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][4];
        s->variant = sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][5];
        s->unk1A = SPRITE_OAM_ORDER(8);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->unk10 = 0x72;

        transform = &platform->unkD8;
        // Set the transform props
        transform->y = y;

        UpdateSpriteAnimation(s);

        // Copy base 2
        DmaCopy16(3, &platform->unk60, &platform->unk90, 0x30);
        s = &platform->unk90;

        // Copy the transform
        DmaCopy16(3, &platform->unkD8, &platform->unkE4, 0xC);
        transform = &platform->unkE4;

        // Update props
        s->unk10 = 0x73;

        // used to help match atm
        r6 = y - 0x10;
        transform->y = r6;
    }

    m4aSongNumStart(SE_278);
}
END_NONMATCH

static void Task_PlatformBreakParticlesMain(void)
{
    s16 x, y;
    Platform_D1C *platform = TASK_DATA(gCurTask);
    Sprite *s;
    s16 width;
    SpriteTransform *transform;
    if (platform->unkF0++ >= 0x3D) {
        TaskDestroy(gCurTask);
        return;
    }

    platform->unkF2 += 0x28;

    //
    s = &platform->unk0;
    transform = &platform->unkC0;

    transform->y += Q_24_8_TO_INT(platform->unkF2);

    x = transform->x;
    y = transform->y;

    transform->x -= gCamera.x;
    transform->y -= gCamera.y;

    transform->x -= platform->unkF0 * 2;

    width = transform->width + 8;
    if (width > 0x200) {
        width = 0x200;
    }
    transform->width = width;
    transform->height = width;
    transform->rotation -= 0x2A;

    s->unk10 &= ~0x1F;
    s->unk10 |= gUnknown_030054B8++;
    sub_8004E14(s, transform);
    DisplaySprite(s);

    transform->x = x;
    transform->y = y;

    //
    s = &platform->unk30;
    transform = &platform->unkCC;

    transform->y += Q_24_8_TO_INT(platform->unkF2);

    x = transform->x;
    y = transform->y;

    transform->x -= gCamera.x;
    transform->y -= gCamera.y;

    transform->x += platform->unkF0;

    transform->width = width;
    transform->height = width;
    transform->rotation += 0x2A;

    s->unk10 &= ~0x1F;
    s->unk10 |= gUnknown_030054B8++;
    sub_8004E14(s, transform);
    DisplaySprite(s);

    transform->x = x;
    transform->y = y;

    //
    s = &platform->unk60;
    transform = &platform->unkD8;

    transform->y += Q_24_8_TO_INT(platform->unkF2);

    x = transform->x;
    y = transform->y;

    transform->x -= gCamera.x;
    transform->y -= gCamera.y;
    transform->x += platform->unkF0 * 2;

    transform->width = width;
    transform->height = width;
    transform->rotation += 0xE;

    s->unk10 &= ~0x1F;
    s->unk10 |= gUnknown_030054B8++;
    sub_8004E14(s, transform);
    DisplaySprite(s);

    transform->x = x;
    transform->y = y;

    //
    s = &platform->unk90;
    transform = &platform->unkE4;

    transform->y += Q_24_8_TO_INT(platform->unkF2);

    x = transform->x;
    y = transform->y;

    transform->x -= gCamera.x;
    transform->y -= gCamera.y;
    transform->x -= platform->unkF0;

    transform->width = width;
    transform->height = width;
    transform->rotation -= 0xE;

    s->unk10 &= ~0x1F;
    s->unk10 |= gUnknown_030054B8++;
    sub_8004E14(s, transform);
    DisplaySprite(s);

    transform->x = x;
    transform->y = y;
}

static void TaskDestructor_PlatformThin(struct Task *t)
{
    Sprite_CommonThinPlatform *platform = TASK_DATA(t);

    VramFree(platform->s.graphics.dest);
}

static void TaskDestructor_PlatformBreakParticles(struct Task *t)
{
    Platform_D1C *platform = TASK_DATA(t);
    VramFree(platform->unk0.graphics.dest);
    VramFree(platform->unk60.graphics.dest);
}

static u32 sub_80111F0(Sprite *s, s32 x, s32 y, Player *player)
{
    u32 result;
    s->hitboxes[0].top += 1;
    s->hitboxes[0].bottom -= 1;

    result = sub_800CCB8(s, x, y, player);

    s->hitboxes[0].top -= 1;
    s->hitboxes[0].bottom += 1;
    return result;
}
