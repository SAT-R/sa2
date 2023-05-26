#include <string.h> // for memcpy

#include "global.h"
#include "task.h"
#include "lib/m4a.h"
#include "malloc_vram.h"

#include "game/entity.h"

#include "constants/animations.h"
#include "constants/interactables.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u32 unk3C[2];
} Sprite_Spikes; /* size: 0x44 */

const u16 sSpikesOfZone[NUM_COURSE_ZONES + 1] = {
    [ZONE_1] = SA2_ANIM_SPIKES, // NOTE: Comment tells formatter to keep this as-is!
    [ZONE_2] = SA2_ANIM_SPIKES,
    [ZONE_3] = SA2_ANIM_SPIKES_MUS_PLA,
    [ZONE_4] = SA2_ANIM_SPIKES,
    [ZONE_5] = SA2_ANIM_SPIKES,
    [ZONE_6] = SA2_ANIM_SPIKES_TEC_BAS,
    [ZONE_7] = SA2_ANIM_SPIKES,
    [ZONE_FINAL] = 0,
};

static void sub_805F810(void);
static void sub_805F928(void);
static void sub_805FBA0(void);
static void Task_805FF68(void);
static void Task_806012C(void);
static bool32 sub_80601F8(Sprite *, MapEntity *, Sprite_Spikes *, Player *);
static bool32 sub_8060440(Sprite *, MapEntity *, Sprite_Spikes *, Player *);
static bool32 sub_8060554(Sprite *, MapEntity *, Sprite_Spikes *, Player *, u32 *);
static bool32 sub_80609B4(Sprite *, MapEntity *, Sprite_Spikes *, Player *, u32 *);
static void TaskDestructor_8060CF4(struct Task *);
static u32 sub_8060D08(Sprite *, s32 x, s32 y, Player *);

void CreateEntity_Spikes_Up(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                            u8 spriteY)
{
    struct Task *t = TaskCreate(sub_805F810, sizeof(Sprite_Spikes), 0x2000, 0, NULL);
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    Sprite *s = &spikes->s;

    spikes->unk3C[1] = 0;
    spikes->unk3C[0] = 0;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.me = me;
    spikes->base.spriteX = me->x;
    spikes->base.spriteY = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = (void *)(OBJ_VRAM0 + 204 * TILE_SIZE_4BPP);

    s->unk1A = 0x440;
    s->graphics.size = 0;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
    } else {
        s->graphics.anim = SA2_ANIM_SPIKES;
    }

    s->variant = SA2_ANIM_VARIANT_SPIKES_UP;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2200;
    sub_8004558(s);
}

void CreateEntity_Spikes_Down(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                              u8 spriteY)
{
    struct Task *t = TaskCreate(sub_805F928, sizeof(Sprite_Spikes), 0x2000, 0, NULL);
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    Sprite *s = &spikes->s;

    spikes->unk3C[1] = 0;
    spikes->unk3C[0] = 0;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.me = me;
    spikes->base.spriteX = me->x;
    spikes->base.spriteY = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = (void *)(OBJ_VRAM0 + 204 * TILE_SIZE_4BPP);

    s->unk1A = 0x440;

    s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];

    s->variant = SA2_ANIM_VARIANT_SPIKES_UP;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2A00;
    sub_8004558(s);
}

static void sub_805F810(void)
{
    Sprite_Spikes *spikes = TaskGetStructPtr(gCurTask);
    Sprite *s = &spikes->s;
    MapEntity *me = spikes->base.me;
    s16 screenX, screenY;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (!GRAVITY_IS_INVERTED) {
        sub_80601F8(s, me, spikes, &gPlayer);
    } else {
        sub_8060440(s, me, spikes, &gPlayer);
    }

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (me->d.sData[0] == 0)
        && (gUnknown_030053E0 == 0)) {
        if (spikes->unk3C[0] & 0xC0000) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        if (spikes->unk3C[0] & 0x10000) {
            gPlayer.moveState &= ~MOVESTATE_8;
        }
    }

    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        me->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            sub_8004558(s);
        }
        sub_80051E8(s);
    }
}

static void sub_805F928(void)
{
    Sprite_Spikes *spikes = TaskGetStructPtr(gCurTask);
    Sprite *s = &spikes->s;
    MapEntity *me = spikes->base.me;
    s16 screenX, screenY;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (me->d.sData[0] != 0)
        || (gUnknown_030053E0 != 0)) {
        if (!GRAVITY_IS_INVERTED) {
            sub_8060440(s, me, spikes, &gPlayer);
        } else {
            sub_80601F8(s, me, spikes, &gPlayer);
        }
    }

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (me->d.sData[0] == 0)
        && (gUnknown_030053E0 == 0)) {
        if (spikes->unk3C[0] & MOVESTATE_20) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        if (spikes->unk3C[0] & 0x8) {
            gPlayer.moveState &= ~MOVESTATE_8;
        }
    }

    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        me->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
            || (me->d.sData[0] != 0 || gUnknown_030053E0 != 0)) {
            sub_8004558(s);
            sub_80051E8(s);
        }
    }
}

void CreateEntity_Spikes_LeftRight(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                   u8 spriteY)
{
    struct Task *t = TaskCreate(sub_805FBA0, sizeof(Sprite_Spikes), 0x2000, 0,
                                TaskDestructor_8060CF4);
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    Sprite *s = &spikes->s;

    spikes->unk3C[1] = 0;
    spikes->unk3C[0] = 0;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.me = me;
    spikes->base.spriteX = me->x;
    spikes->base.spriteY = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(4 * 4);

    s->unk1A = 0x440;
    s->graphics.size = 0;

    s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];

    s->variant = SA2_ANIM_VARIANT_SPIKES_SIDEWAYS;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2200;

    switch (gGameMode) {
        case GAME_MODE_MULTI_PLAYER_COLLECT_RINGS: {
            if (me->index == IA__SPIKES__NORMAL_LEFT) {
                // X-Flip
                s->unk10 |= 0x400;
            }
        } break;

        default: {
            if (me->index == IA__SPIKES__NORMAL_LEFT) {
                // X-Flip
                s->unk10 |= 0x400;
            }
        } break;
    }

    sub_8004558(s);
}

static void sub_805FBA0(void)
{
    // Decls had to be split to match, for some reason
    s16 screenX, screenY;
    Sprite *s;
    MapEntity *me;
    Sprite_Spikes *spikes;
    spikes = TaskGetStructPtr(gCurTask);
    s = &spikes->s;
    me = spikes->base.me;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS || me->d.sData[0] != 0
        || gUnknown_030053E0 != 0) {
        // _0805FC16
        s32 r4 = sub_800CCB8(s, screenX, screenY, &gPlayer);
#ifdef NON_MATCHING
        u32 gravityInverted;
#else
        register u32 gravityInverted asm("r9");
#endif
        gravityInverted = GRAVITY_IS_INVERTED;
        if (gravityInverted) {
            if (r4 & 0x10000) {
                gPlayer.y += (r4 << 24) >> 16;
                gPlayer.speedAirY = 0;
                gPlayer.moveState &= (~MOVESTATE_8);
                gPlayer.moveState |= MOVESTATE_IN_AIR;
                gPlayer.unk3C = 0;
            }
            // _0805FC6C

            if (r4 & 0x20000) {
                if (sub_8060D08(s, screenX, screenY, &gPlayer) & 0x10000) {
                    gPlayer.y += (r4 << 24) >> 16;
                    gPlayer.speedAirY = 0;
                    gPlayer.moveState |= MOVESTATE_8;
                    gPlayer.moveState &= ~MOVESTATE_IN_AIR;
                    gPlayer.unk3C = s;
                }
            }
        } else {
            // _0805FCC8
            if (r4 & 0x10000) {
                if (sub_8060D08(s, screenX, screenY, &gPlayer) & 0x10000) {
                    gPlayer.y += (r4 << 24) >> 16;
                    gPlayer.speedAirY = gravityInverted; // Q_8_8(0.5) instead?
                }
            }

            if (r4 & 0x20000) {
                gPlayer.y += (r4 << 24) >> 16;
                gPlayer.speedAirY = Q_8_8(0);
            }
        }

        // _0805FD12
        if (r4 & 0x40000) {
#ifdef NON_MATCHING
            u16 iaIndex;
#else
            register u16 iaIndex asm("r0");
#endif
            gPlayer.moveState |= MOVESTATE_20;
            gPlayer.x += (s16)((u32)r4 & 0xFF00);
            gPlayer.speedAirX = 0;
            gPlayer.speedGroundX = 0;

            iaIndex = IA__SPIKES__NORMAL_LEFT;
            if (iaIndex != me->index) {
                if (sub_800CBA4(&gPlayer)) {
                    m4aSongNumStart(SE_SPIKES);
                }
            }
        } else {
            // _0805FD60
            if (r4 & 0x80000) {
#ifdef NON_MATCHING
                u16 iaIndex;
#else
                register u16 iaIndex asm("r0");
#endif
                gPlayer.moveState |= MOVESTATE_20;
                gPlayer.x += (s16)((u32)r4 & 0xFF00);
                gPlayer.speedAirX = 0;
                gPlayer.speedGroundX = 0;

                iaIndex = IA__SPIKES__NORMAL_LEFT;
                if (iaIndex == me->index) {
                    if (sub_800CBA4(&gPlayer)) {
                        m4aSongNumStart(SE_SPIKES);
                    }
                }
            }
        }
    }
    // _0805FDA4

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (me->d.sData[0] == 0)
        && (gUnknown_030053E0 == 0)) {
        if (spikes->unk3C[0] & 0x20) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }
        // _0805FDD8
        if (spikes->unk3C[0] & 0x8) {
            gPlayer.moveState &= ~MOVESTATE_8;
        }
    }
    // _0805FDF0
    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        me->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (me->d.sData[0] != 0)
            || (gUnknown_030053E0 != 0)) {
            sub_8004558(s);
            sub_80051E8(s);
        }
    }
}

void CreateEntity_Spikes_HidingUp(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    struct Task *t = TaskCreate(Task_805FF68, sizeof(Sprite_Spikes), 0x2000, 0,
                                TaskDestructor_8060CF4);
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    Sprite *s = &spikes->s;

    spikes->unk3C[1] = 0;
    spikes->unk3C[0] = 0;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.me = me;
    spikes->base.spriteX = me->x;
    spikes->base.spriteY = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(4 * 4);

    s->unk1A = 0x440;

    s->graphics.size = 0;
    s->graphics.anim = -1;

    s->variant = 0xFF;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2200;
}

static void Task_805FF68(void)
{
    s16 screenX, screenY;
    u32 someParam = 0;
    Sprite_Spikes *spikes = TaskGetStructPtr(gCurTask);
    Sprite *s = &spikes->s;
    MapEntity *me = spikes->base.me;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        me->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        bool32 procResult;
        if (!GRAVITY_IS_INVERTED) {
            procResult = sub_8060554(s, me, spikes, &gPlayer, &someParam);
        } else {
            procResult = sub_80609B4(s, me, spikes, &gPlayer, &someParam);
        }

        if (procResult) {
            sub_8004558(s);
            sub_80051E8(s);
        }
    }
}

void CreateEntity_Spikes_HidingDown(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                    u8 spriteY)
{
    struct Task *t = TaskCreate(Task_806012C, sizeof(Sprite_Spikes), 0x2000, 0,
                                TaskDestructor_8060CF4);
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    Sprite *s = &spikes->s;

    spikes->unk3C[1] = 0;
    spikes->unk3C[0] = 0;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.me = me;
    spikes->base.spriteX = me->x;
    spikes->base.spriteY = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(4 * 4);

    s->unk1A = 0x440;

    s->graphics.size = 0;
    s->graphics.anim = -1;

    s->variant = 0xFF;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2A00;
}

static void Task_806012C(void)
{
    s16 screenX, screenY;
    u32 someParam = 0;
    Sprite_Spikes *spikes = TaskGetStructPtr(gCurTask);
    Sprite *s = &spikes->s;
    MapEntity *me = spikes->base.me;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        me->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        bool32 procResult;
        if (!GRAVITY_IS_INVERTED) {
            procResult = sub_80609B4(s, me, spikes, &gPlayer, &someParam);
        } else {
            procResult = sub_8060554(s, me, spikes, &gPlayer, &someParam);
        }

        if (procResult) {
            sub_8004558(s);
            sub_80051E8(s);
        }
    }
}

bool32 sub_80601F8(Sprite *s, MapEntity *me, Sprite_Spikes *spikes, Player *player)
{
    s16 screenX, screenY;

#ifndef NON_MATCHING
    ++s;
    --s;
#endif

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (me->d.sData[0] == 0)
        && (gUnknown_030053E0 == 30)) {
        u32 flags = sub_800CCB8(s, screenX, screenY, player);

        if (flags) {
            u32 v = ((u8)player->unk16 + 5);
            s8 sp00[4] = { -v, 1 - player->unk17, v, player->unk17 - 1 };

            if (flags & 0xC0000) {
                player->moveState |= MOVESTATE_20;
            }

            if (!GRAVITY_IS_INVERTED) {
                player->y = Q_24_8(screenY + s->unk28->unk5 - sp00[3]);
            } else {
                player->y = Q_24_8(screenY + s->unk28->unk7 + sp00[3]);
            }

            if (sub_800CBA4(player)) {
                m4aSongNumStart(SE_SPIKES);
                return TRUE;
            }
        }
    }

    {
        u32 r7, r8;
        Sprite *sp08;
        u32 flags;

        r7 = (player->moveState >> 3) & (MOVESTATE_8 >> 3);
        r8 = (player->moveState >> 1) & (MOVESTATE_IN_AIR >> 1);
        sp08 = player->unk3C;

        flags = sub_800CCB8(s, screenX, screenY, player);
        if (flags) {
            if (flags & 0x30000) {

                u32 gravityInverted = GRAVITY_IS_INVERTED;

#ifndef NON_MATCHING
                if (gravityInverted)
                    gravityInverted = GRAVITY_IS_INVERTED;
                else
                    gravityInverted = GRAVITY_IS_INVERTED;

                gravityInverted = GRAVITY_IS_INVERTED;
#endif

                if (gravityInverted) {
                    if (flags & 0x20000) {
                        player->speedAirY = 0;
                        player->y = Q_24_8(screenY + s->unk28->unk7 + player->unk17);
                        player->moveState |= MOVESTATE_8;
                        player->moveState &= ~MOVESTATE_IN_AIR;
                        player->unk3C = s;
                        player->speedGroundX = player->speedAirX;
                        // _080603BC
                        if (sub_800CBA4(player)) {
                            m4aSongNumStart(SE_SPIKES);
                            return TRUE;
                        }
                    }
                } else {
                    // _0806038C
                    if (flags & 0x10000) {
                        flags = sub_8060D08(s, screenX, screenY, player);

                        if (flags & 0x10000) {
                            player->y += Q_8_8(flags);
                            player->speedAirY = 0;

                            // _080603BC
                            if (sub_800CBA4(player)) {
                                m4aSongNumStart(SE_SPIKES);
                                return TRUE;
                            }
                        } else {
                            // _080603D0
                            if (r7) {
                                player->moveState |= MOVESTATE_8;
                            } else {
                                player->moveState &= ~MOVESTATE_8;
                            }

                            if (r8) {
                                player->moveState |= MOVESTATE_IN_AIR;
                            } else {
                                player->moveState &= ~MOVESTATE_IN_AIR;
                            }

                            player->unk3C = sp08;
                        }
                    }
                }
            } else if (flags & 0x0C0000) {
                // _08060404
                player->moveState |= MOVESTATE_20;
                player->x += (s16)(flags & 0xFF00);
                player->speedAirX = 0;
                player->speedGroundX = 0;
            }
        }
    }

    return FALSE;
}

static bool32 sub_8060440(Sprite *s, MapEntity *me, Sprite_Spikes *spikes,
                          Player *player)
{

    s16 screenX, screenY;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (!(player->moveState & MOVESTATE_400000)) {
        u32 flags = sub_800CCB8(s, screenX, screenY, player);
        if (flags) {
            if ((flags & 0x20000) && !GRAVITY_IS_INVERTED) {
                player->y = Q_24_8((screenY + s->unk28->unk7) + player->unk17 + 1);
                player->speedAirY = 0;
                player->speedGroundX = 0;

                if (sub_800CBA4(player)) {
                    m4aSongNumStart(SE_SPIKES);
                    return TRUE;
                }
            } else if ((flags & 0x10000) && GRAVITY_IS_INVERTED) {
                // _080604D0
                player->y = Q_24_8((screenY + s->unk28->unk5) - player->unk17 - 1);
                player->speedAirY = 0;
                player->speedGroundX = 0;

                if (sub_800CBA4(player)) {
                    m4aSongNumStart(SE_SPIKES);
                    return TRUE;
                }
            } else if (flags & 0xC0000) {
                player->moveState |= MOVESTATE_20;
                player->x += (s16)(flags & 0xFF00);
                player->speedAirX = 0;
                player->speedGroundX = 0;
            }
        }
    }

    return FALSE;
}

static bool32 sub_8060554(Sprite *s, MapEntity *me, Sprite_Spikes *spikes,
                          Player *player, u32 *param4) //)
{
    s16 screenX, screenY;
    u32 sp0C[1] = { gUnknown_03005590 & 0x7F };
    s32 sl = player->unk60;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    // TODO: Replace magic numbers in if statements
    if (sp0C[0] < 60) {
        if ((player->moveState & MOVESTATE_8) && (player->unk3C == s)) {
            player->moveState &= ~MOVESTATE_8;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->unk3C[sl] & 0x20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->unk3C[sl] = 0;
        }

        return FALSE;
    } else if (sp0C[0] < 62) {
        if ((player->moveState & MOVESTATE_8) && (player->unk3C == s)) {
            player->moveState &= ~MOVESTATE_8;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->unk3C[sl] & 0x20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->unk3C[sl] = 0;
        }

        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_LOW;
        sub_8004558(s);
    } else if (sp0C[0] < 64) {
        if ((player->moveState & MOVESTATE_8) && (player->unk3C == s)) {
            player->moveState &= ~MOVESTATE_8;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->unk3C[sl] & 0x20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->unk3C[sl] = 0;
        }
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_MID;
        sub_8004558(s);
    } else if (sp0C[0] < 124) {
        if ((s->variant != SA2_ANIM_VARIANT_SPIKES_UP)
            || ((player->unk60 != 0) && (*param4 != 0))) {
            if (player->unk60 == 0) {
                // TODO: Replace magic number
                *param4 = 1;
            }

            s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
            s->variant = SA2_ANIM_VARIANT_SPIKES_UP;
            sub_8004558(s);

            if (sub_800DF38(s, screenX, screenY, player) == 0x80000) {
                if ((sub_8060D08(s, screenX, screenY, player) & 0xD0000) != 0) {
                    u32 v = ((u8)player->unk16 + 5);
                    s8 sp00[4] = { -v, 1 - player->unk17, v, player->unk17 - 1 };

                    if (!GRAVITY_IS_INVERTED) {
                        player->y = Q_24_8((screenY + s->unk28->unk5) - sp00[3]);
                    } else {
                        player->y = Q_24_8((screenY + s->unk28->unk7) + sp00[3]);
                    }
                    if (sub_800CBA4(player)) {
                        m4aSongNumStart(SE_SPIKES);
                        return TRUE;
                    }
                }
            } else {
                u32 flags = sub_800CCB8(s, screenX, screenY, player);
                if (flags) {
                    if (flags & 0x10000) {
                        flags = sub_8060D08(s, screenX, screenY, player);

                        if (flags & 0x10000) {
                            if (sub_800CBA4(player)) {
                                m4aSongNumStart(SE_SPIKES);
                                return TRUE;
                            }
                        }
                    } else if (flags & 0xC0000) {
                        player->moveState |= MOVESTATE_20;
                        player->x += (s16)(flags & 0xFF00);
                        player->speedAirX = 0;
                        player->speedGroundX = 0;
                    }
                }
            }
        } else {
            u32 flags = sub_800CCB8(s, screenX, screenY, player);
            if (flags) {
                if ((flags & 0x10000) && !GRAVITY_IS_INVERTED) {
                    flags = sub_8060D08(s, screenX, screenY, player);

                    if ((flags & 0x10000) && sub_800CBA4(player)) {
                        m4aSongNumStart(SE_SPIKES);
                        return TRUE;
                    }
                } else if ((flags & 0x20000) && GRAVITY_IS_INVERTED) {
                    player->y = Q_24_8(screenY + s->unk28->unk7 + player->unk17);
                    player->moveState |= MOVESTATE_8;
                    player->moveState &= ~MOVESTATE_IN_AIR;
                    player->unk3C = s;
                    player->speedGroundX = player->speedAirX;

                    if (sub_800CBA4(player)) {
                        m4aSongNumStart(SE_SPIKES);
                        return TRUE;
                    }
                } else if (flags & 0xC0000) {
                    player->moveState |= MOVESTATE_20;
                    player->x += (s16)(flags & 0xFF00);
                    player->speedAirX = 0;
                    player->speedGroundX = 0;
                }
            }

            // TODO: WHY!?
            spikes->unk3C[sl] = player->moveState;
        }
    } else if (sp0C[0] < 126) {

        if ((player->moveState & MOVESTATE_8) && (player->unk3C == s)) {
            player->moveState &= ~MOVESTATE_8;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->unk3C[sl] & 0x20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->unk3C[sl] = 0;
        }
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_MID;
        sub_8004558(s);
    } else {
        if ((player->moveState & MOVESTATE_8) && (player->unk3C == s)) {
            player->moveState &= ~MOVESTATE_8;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->unk3C[sl] & 0x20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->unk3C[sl] = 0;
        }
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_LOW;
        sub_8004558(s);
    }

    return TRUE;
}

static bool32 sub_80609B4(Sprite *s, MapEntity *me, Sprite_Spikes *spikes,
                          Player *player, u32 *param4)
{
    s16 screenX, screenY;
    u32 sp0C[1] = { gUnknown_03005590 & 0x7F };
    s32 sl = player->unk60;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    // TODO: Replace magic numbers in if statements
    if (sp0C[0] < 60) {
        if ((player->moveState & MOVESTATE_8) && (player->unk3C == s)) {
            player->moveState &= ~MOVESTATE_8;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->unk3C[sl] & 0x20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->unk3C[sl] = 0;
        }

        return FALSE;
    } else if (sp0C[0] < 62) {
        if ((player->moveState & MOVESTATE_8) && (player->unk3C == s)) {
            player->moveState &= ~MOVESTATE_8;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->unk3C[sl] & 0x20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->unk3C[sl] = 0;
        }

        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_LOW;
        sub_8004558(s);
    } else if (sp0C[0] < 64) {
        if ((player->moveState & MOVESTATE_8) && (player->unk3C == s)) {
            player->moveState &= ~MOVESTATE_8;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->unk3C[sl] & 0x20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->unk3C[sl] = 0;
        }
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_MID;
        sub_8004558(s);
    } else if (sp0C[0] < 124) {
        if ((s->variant != SA2_ANIM_VARIANT_SPIKES_UP)
            || ((player->unk60 != 0) && (*param4 != 0))) {
            if (player->unk60 == 0) {
                // TODO: Replace magic number
                *param4 = 1;
            }

            s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
            s->variant = SA2_ANIM_VARIANT_SPIKES_UP;
            sub_8004558(s);

            if ((sub_800DF38(s, screenX, screenY, player) == 0x80000)
                && ((sub_8060D08(s, screenX, screenY, player) & 0xD0000) != 0)) {

                u32 v = ((u8)player->unk16 + 5);
                s8 sp00[4] = { -v, 1 - player->unk17, v, player->unk17 - 1 };

                if (!GRAVITY_IS_INVERTED) {
                    player->y = Q_24_8(s->unk28->unk7 + screenY - sp00[1]);
                } else {
                    player->y = Q_24_8(s->unk28->unk5 + screenY + sp00[1]);
                }
                if (!sub_800CBA4(player)) {
                    return TRUE;
                }
            } else
                return TRUE;
        } else {
            spikes->unk3C[sl] = sub_800CCB8(s, screenX, screenY, player);
            if (!(spikes->unk3C[sl] & 0x20000) || !sub_800CBA4(player)) {
                return TRUE;
            }
        }

        m4aSongNumStart(SE_SPIKES);
    } else if (sp0C[0] < 126) {

        if ((player->moveState & MOVESTATE_8) && (player->unk3C == s)) {
            player->moveState &= ~MOVESTATE_8;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->unk3C[sl] & 0x20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->unk3C[sl] = 0;
        }
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_MID;
        sub_8004558(s);
    } else {
        if ((player->moveState & MOVESTATE_8) && (player->unk3C == s)) {
            player->moveState &= ~MOVESTATE_8;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->unk3C[sl] & 0x20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->unk3C[sl] = 0;
        }
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_LOW;
        sub_8004558(s);
    }

    return TRUE;
}

static void TaskDestructor_8060CF4(struct Task *t)
{
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    VramFree(spikes->s.graphics.dest);
}

static u32 sub_8060D08(Sprite *s, s32 x, s32 y, Player *player)
{
    u32 result;

    s->unk28->unk4++;
    s->unk28->unk6--;

    result = sub_800CCB8(s, x, y, player);

    s->unk28->unk4--;
    s->unk28->unk6++;

    return result;
}