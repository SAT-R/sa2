#include "global.h"
#include "core.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_0/platform_thin.h"
#include "constants/zones.h"

#include "constants/songs.h"
#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite sprite;
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
    struct UNK_808D124_UNK180 unkC0;
    struct UNK_808D124_UNK180 unkCC;
    struct UNK_808D124_UNK180 unkD8;
    struct UNK_808D124_UNK180 unkE4;
    u16 unkF0;
    s16 unkF2;
} Platform_D1C /* size 0xF4*/;

static void Task_CommonPlatformThinMain(void);
static void TaskDestructor_CommonPlatformThin(struct Task *);

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

void initSprite_Interactable_CommonThinPlatform(MapEntity *me, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_CommonPlatformThinMain, sizeof(Sprite_CommonThinPlatform),
                     0x2010, 0, TaskDestructor_CommonPlatformThin);
    Sprite_CommonThinPlatform *platform = TaskGetStructPtr(t);
    Sprite *sprite = &platform->sprite;

    platform->base.regionX = spriteRegionX;
    platform->base.regionY = spriteRegionY;
    platform->base.me = me;
    platform->base.spriteX = me->x;
    platform->base.spriteY = spriteY;

    platform->unk40 = 0;
    platform->unk44 = 0;

    sprite->x = TO_WORLD_POS(me->x, spriteRegionX);
    sprite->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    sprite->graphics.dest
        = VramMalloc(sPlatformThinAnimations[LEVEL_TO_ZONE(gCurrentLevel)][0]);
    sprite->graphics.anim = sPlatformThinAnimations[LEVEL_TO_ZONE(gCurrentLevel)][1];
    sprite->variant = sPlatformThinAnimations[LEVEL_TO_ZONE(gCurrentLevel)][2];

    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;

    sub_8004558(sprite);
}

static void Task_CommonPlatformThinMain(void)
{
    // Have to be declared in this order to match
    Player *player;
    Sprite *sprite;
    MapEntity *me;
    Sprite_CommonThinPlatform *platform;
    s16 x, y;
    bool32 something;

    player = &gPlayer;
    something = FALSE;
    platform = TaskGetStructPtr(gCurTask);
    sprite = &platform->sprite;
    me = platform->base.me;
    x = TO_WORLD_POS(platform->base.spriteX, platform->base.regionX);
    y = TO_WORLD_POS(me->y, platform->base.regionY);

    sprite->x = x - gCamera.x;
    sprite->y = y - gCamera.y;

    if (IS_MULTI_PLAYER && (s8)me->x == -3) {
        CreatePlatformBreakParticles(x, y);

        if (player->moveState & MOVESTATE_8 && player->unk3C == sprite) {
            player->moveState &= ~MOVESTATE_8;
            player->moveState |= 2;
        }
        TaskDestroy(gCurTask);
        return;
    }

    if (!(player->moveState & (MOVESTATE_400000 | MOVESTATE_DEAD))) {
        u32 temp2 = sub_800CCB8(sprite, x, y, player);
        if (temp2 & 0xC0000) {
            if (sub_80111F0(sprite, x, y, player) & 0xC0000) {
                player->x += (s16)(temp2 & 0xFF00);
                player->speedAirX = 0;
            }
        }

        if (temp2 & 0x30000) {
            s16 unk64 = player->unk64;
            s16 unk68 = player->unk68;
            s16 unk6A = player->unk6A;
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
                    unk68 -= gPlayerCharacterIdleAnims[player->character];
                    if (unk64 == 0x24 && unk68 == 0x33 && unk6A == 1
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

    sub_80051E8(sprite);
    return;
}

NONMATCH("asm/non_matching/sub_8010D1C.inc",
         static void CreatePlatformBreakParticles(s16 x, s16 y))
{
    struct Task *t = TaskCreate(Task_PlatformBreakParticlesMain, sizeof(Platform_D1C),
                                0x2011, 0, TaskDestructor_PlatformBreakParticles);
    Platform_D1C *platform = TaskGetStructPtr(t);

    // Hack for better match
    register s32 r6 asm("r6");

    {
        Sprite *r7 = &platform->unk0;
        struct UNK_808D124_UNK180 *r2 = &platform->unkC0;
        platform->unkF0 = 0;
        platform->unkF2 = 0xFE00;
        x -= 128;
        y -= 50;

        // Init base 1
        r7->graphics.dest
            = VramMalloc(sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][0]);
        r7->graphics.anim = sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][1];
        r7->variant = sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][2];

        r7->unk1A = 0x200;
        r7->graphics.size = 0;
        r7->unk14 = 0;
        r7->unk1C = 0;
        r7->unk21 = -1;
        r7->unk22 = 0x10;
        r7->focused = 0;
        r7->unk10 = 0x70;

        // Init transformer
        r2->unk0 = 0;
        r2->unk2 = 0x100;
        r2->unk4 = 0x100;
        r2->unk6[0] = x;
        r2->unk6[1] = y;

        sub_8004558(r7);

        // copy base 1
        DmaCopy16(3, &platform->unk0, &platform->unk30, 0x30);
        r7 = &platform->unk30;

        // copy transformer
        DmaCopy16(3, &platform->unkC0, &platform->unkCC, 0xC);

        // Set the new params
        r7->unk10 = 0x71;

        r2 = &platform->unkCC;
        r2->unk6[1] = y - 0x10;
    }

    {
        Sprite *r7;
        struct UNK_808D124_UNK180 *r2;
        // init base 2
        r7 = &platform->unk60;

        // Copy the transformer
        DmaCopy16(3, &platform->unkC0, &platform->unkD8, 0xC);

        r7->graphics.dest
            = VramMalloc(sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][3]);
        r7->graphics.anim = sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][4];
        r7->variant = sPlatformBreakAnimations[LEVEL_TO_ZONE(gCurrentLevel)][5];
        r7->unk1A = 0x200;
        r7->graphics.size = 0;
        r7->unk14 = 0;
        r7->unk1C = 0;
        r7->unk21 = -1;
        r7->unk22 = 0x10;
        r7->focused = 0;
        r7->unk10 = 0x72;

        r2 = &platform->unkD8;
        // Set the transformer props
        r2->unk6[1] = y;

        sub_8004558(r7);

        // Copy base 2
        DmaCopy16(3, &platform->unk60, &platform->unk90, 0x30);
        r7 = &platform->unk90;

        // Copy the transformer
        DmaCopy16(3, &platform->unkD8, &platform->unkE4, 0xC);
        r2 = &platform->unkE4;

        // Update props
        r7->unk10 = 0x73;

        // used to help match atm
        r6 = y - 0x10;
        r2->unk6[1] = r6;
    }

    m4aSongNumStart(SE_278);
}
END_NONMATCH

static void Task_PlatformBreakParticlesMain(void)
{
    s16 x, y;
    Platform_D1C *platform = TaskGetStructPtr(gCurTask);
    Sprite *sprite;
    s16 width;
    struct UNK_808D124_UNK180 *transform;
    if (platform->unkF0++ >= 0x3D) {
        TaskDestroy(gCurTask);
        return;
    }

    platform->unkF2 += 0x28;

    //
    sprite = &platform->unk0;
    transform = &platform->unkC0;

    transform->unk6[1] += Q_24_8_TO_INT(platform->unkF2);

    x = transform->unk6[0];
    y = transform->unk6[1];

    transform->unk6[0] -= gCamera.x;
    transform->unk6[1] -= gCamera.y;

    transform->unk6[0] -= platform->unkF0 * 2;

    width = transform->unk2 + 8;
    if (width > 0x200) {
        width = 0x200;
    }
    transform->unk2 = width;
    transform->unk4 = width;
    transform->unk0 -= 0x2A;

    sprite->unk10 &= ~0x1F;
    sprite->unk10 |= gUnknown_030054B8++;
    sub_8004E14(sprite, transform);
    sub_80051E8(sprite);

    transform->unk6[0] = x;
    transform->unk6[1] = y;

    //
    sprite = &platform->unk30;
    transform = &platform->unkCC;

    transform->unk6[1] += Q_24_8_TO_INT(platform->unkF2);

    x = transform->unk6[0];
    y = transform->unk6[1];

    transform->unk6[0] -= gCamera.x;
    transform->unk6[1] -= gCamera.y;

    transform->unk6[0] += platform->unkF0;

    transform->unk2 = width;
    transform->unk4 = width;
    transform->unk0 += 0x2A;

    sprite->unk10 &= ~0x1F;
    sprite->unk10 |= gUnknown_030054B8++;
    sub_8004E14(sprite, transform);
    sub_80051E8(sprite);

    transform->unk6[0] = x;
    transform->unk6[1] = y;

    //
    sprite = &platform->unk60;
    transform = &platform->unkD8;

    transform->unk6[1] += Q_24_8_TO_INT(platform->unkF2);

    x = transform->unk6[0];
    y = transform->unk6[1];

    transform->unk6[0] -= gCamera.x;
    transform->unk6[1] -= gCamera.y;
    transform->unk6[0] += platform->unkF0 * 2;

    transform->unk2 = width;
    transform->unk4 = width;
    transform->unk0 += 0xE;

    sprite->unk10 &= ~0x1F;
    sprite->unk10 |= gUnknown_030054B8++;
    sub_8004E14(sprite, transform);
    sub_80051E8(sprite);

    transform->unk6[0] = x;
    transform->unk6[1] = y;

    //
    sprite = &platform->unk90;
    transform = &platform->unkE4;

    transform->unk6[1] += Q_24_8_TO_INT(platform->unkF2);

    x = transform->unk6[0];
    y = transform->unk6[1];

    transform->unk6[0] -= gCamera.x;
    transform->unk6[1] -= gCamera.y;
    transform->unk6[0] -= platform->unkF0;

    transform->unk2 = width;
    transform->unk4 = width;
    transform->unk0 -= 0xE;

    sprite->unk10 &= ~0x1F;
    sprite->unk10 |= gUnknown_030054B8++;
    sub_8004E14(sprite, transform);
    sub_80051E8(sprite);

    transform->unk6[0] = x;
    transform->unk6[1] = y;
}

static void TaskDestructor_CommonPlatformThin(struct Task *t)
{
    Sprite_CommonThinPlatform *platform = TaskGetStructPtr(t);

    VramFree(platform->sprite.graphics.dest);
}

static void TaskDestructor_PlatformBreakParticles(struct Task *t)
{
    Platform_D1C *platform = TaskGetStructPtr(t);
    VramFree(platform->unk0.graphics.dest);
    VramFree(platform->unk60.graphics.dest);
}

static u32 sub_80111F0(Sprite *sprite, s32 x, s32 y, Player *player)
{
    u32 result;
    sprite->unk28[0].unk5 += 1;
    sprite->unk28[0].unk7 -= 1;

    result = sub_800CCB8(sprite, x, y, player);

    sprite->unk28[0].unk5 -= 1;
    sprite->unk28[0].unk7 += 1;
    return result;
}
