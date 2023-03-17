#include "global.h"
#include "core.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_0/platform_thin.h"
#include "zones.h"

#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite sprite;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
} Sprite_CommonThinPlatform;

void sub_8010AB4(void);
void sub_80111C0(struct Task *);

extern const u16 gUnknown_080D5468[][3];

void initSprite_Interactable_CommonThinPlatform(MapEntity *me, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_8010AB4, 0x50, 0x2010, 0, sub_80111C0);
    Sprite_CommonThinPlatform *platform = TaskGetStructPtr(t);
    Sprite *sprite = &platform->sprite;

    platform->base.regionX = spriteRegionX;
    platform->base.regionY = spriteRegionY;
    platform->base.me = me;
    platform->base.spriteX = me->x;
    platform->base.spriteY = spriteY;

    platform->unk40 = 0;
    platform->unk44 = 0;

    sprite->x = SpriteGetScreenPos(me->x, spriteRegionX);
    sprite->y = SpriteGetScreenPos(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    sprite->graphics.dest
        = VramMalloc(gUnknown_080D5468[LEVEL_TO_ZONE(gCurrentLevel)][0]);
    sprite->graphics.anim = gUnknown_080D5468[LEVEL_TO_ZONE(gCurrentLevel)][1];
    sprite->variant = gUnknown_080D5468[LEVEL_TO_ZONE(gCurrentLevel)][2];

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

void sub_8010D1C(s16, s16);

u32 sub_80111F0(Sprite *, s32, s32, Player *);

void sub_8010AB4(void)
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
    x = SpriteGetScreenPos(platform->base.spriteX, platform->base.regionX);
    y = SpriteGetScreenPos(me->y, platform->base.regionY);

    sprite->x = x - gCamera.x;
    sprite->y = y - gCamera.y;

    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode) && (s8)me->x == -3) {
        sub_8010D1C(x, y);

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
                        sub_8010D1C(x, y);
                        something = TRUE;
                        break;
                    }
                    player->y += (s16)(temp2 << 8);
                    player->speedAirY = 0;
                    break;
                case CHARACTER_SONIC:
                case CHARACTER_AMY: {
                    unk68 -= PlayerCharacterIdleAnims[player->character];
                    if (unk64 == 0x24 && unk68 == 0x33 && unk6A == 1
                        && player->speedAirY > 0) {
                        player->moveState &= ~MOVESTATE_8;
                        sub_8010D1C(x, y);
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
        if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
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

typedef struct {
    Sprite unk0;
    Sprite unk30;
    Sprite unk60;
    Sprite unk90;
    struct UNK_808D124_UNK180 unkC0;
    struct UNK_808D124_UNK180 unkCC;
    struct UNK_808D124_UNK180 unkD8;
    struct UNK_808D124_UNK180 unkE4;
    s16 unkF0;
    s16 unkF2;
} Platform_D1C /* size 0xF4*/;

void sub_8010F78(void);
void sub_80111D4(struct Task *);

extern const u16 gUnknown_080D549E[][6];

NONMATCH("asm/non_matching/sub_8010D1C.inc", void sub_8010D1C(s16 x, s16 y))
{
    struct Task *t = TaskCreate(sub_8010F78, 0xF4, 0x2011, 0, sub_80111D4);
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
            = VramMalloc(gUnknown_080D549E[LEVEL_TO_ZONE(gCurrentLevel)][0]);
        r7->graphics.anim = gUnknown_080D549E[LEVEL_TO_ZONE(gCurrentLevel)][1];
        r7->variant = gUnknown_080D549E[LEVEL_TO_ZONE(gCurrentLevel)][2];

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
            = VramMalloc(gUnknown_080D549E[LEVEL_TO_ZONE(gCurrentLevel)][3]);
        r7->graphics.anim = gUnknown_080D549E[LEVEL_TO_ZONE(gCurrentLevel)][4];
        r7->variant = gUnknown_080D549E[LEVEL_TO_ZONE(gCurrentLevel)][5];
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
