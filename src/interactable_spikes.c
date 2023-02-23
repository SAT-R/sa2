#include "global.h"
#include "task.h"
#include "m4a.h"
#include "malloc_vram.h"

#include "interactable.h"

#include "constants/animations.h"
#include "constants/interactables.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 unk3C;
    /* 0x3C */ s32 unk40;
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

extern void sub_805F810(void);
extern void sub_805F928(void);
extern void sub_805FBA0(void);
extern void Task_805FF68(void);
extern bool32 sub_80601F8(Sprite *, Interactable *, Sprite_Spikes *, Player *);
extern bool32 sub_8060440(Sprite *, Interactable *, Sprite_Spikes *, Player *);
extern bool32 sub_8060554(Sprite *, Interactable *, Sprite_Spikes *, Player *, u32 *);
extern bool32 sub_80609B4(Sprite *, Interactable *, Sprite_Spikes *, Player *, u32 *);
extern void TaskDestructor_8060CF4(struct Task *);

extern void Task_806012C(void);

// TODO: Include header this belongs to
extern u32 sub_800CCB8(Sprite *, s32 x, s32 y, Player *);

extern u32 sub_8060D08(Sprite *, s32 x, s32 y, Player *);

void initSprite_Interactable_Spikes_Up(Interactable *ia, u16 spriteRegionX,
                                       u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_805F810, sizeof(Sprite_Spikes), 0x2000, 0, NULL);
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    Sprite *s = &spikes->s;

    spikes->unk40 = 0;
    spikes->unk3C = 0;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.ia = ia;
    spikes->base.spriteX = ia->x;
    spikes->base.spriteY = spriteY;

    s->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    s->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    s->graphics.dest = (void *)(OBJ_VRAM0 + 204 * TILE_SIZE_4BPP);

    s->unk1A = 0x440;
    s->graphics.size = 0;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
    } else {
        s->graphics.anim = SA2_ANIM_SPIKES;
    }

    s->variant = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2200;
    sub_8004558(s);
}

void initSprite_Interactable_Spikes_Down(Interactable *ia, u16 spriteRegionX,
                                         u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_805F928, sizeof(Sprite_Spikes), 0x2000, 0, NULL);
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    Sprite *s = &spikes->s;

    spikes->unk40 = 0;
    spikes->unk3C = 0;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.ia = ia;
    spikes->base.spriteX = ia->x;
    spikes->base.spriteY = spriteY;

    s->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    s->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    s->graphics.dest = (void *)(OBJ_VRAM0 + 204 * TILE_SIZE_4BPP);

    s->unk1A = 0x440;

    s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];

    s->variant = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2A00;
    sub_8004558(s);
}

void sub_805F810(void)
{
    Sprite_Spikes *spikes = TaskGetStructPtr(gCurTask);
    Sprite *s = &spikes->s;
    Interactable *ia = spikes->base.ia;
    s16 screenX, screenY;

    screenX = SpriteGetScreenPos(spikes->base.spriteX, spikes->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (!(gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)) {
        sub_80601F8(s, ia, spikes, &gPlayer);
    } else {
        sub_8060440(s, ia, spikes, &gPlayer);
    }

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (ia->d.sData[0] == 0)
        && (gUnknown_030053E0 == 0)) {
        if (spikes->unk3C & 0xC0000) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        if (spikes->unk3C & 0x10000) {
            gPlayer.moveState &= ~MOVESTATE_8;
        }
    }

    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        ia->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            sub_8004558(s);
        }
        sub_80051E8(s);
    }
}

void sub_805F928(void)
{
    Sprite_Spikes *spikes = TaskGetStructPtr(gCurTask);
    Sprite *s = &spikes->s;
    Interactable *ia = spikes->base.ia;
    s16 screenX, screenY;

    screenX = SpriteGetScreenPos(spikes->base.spriteX, spikes->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (ia->d.sData[0] != 0)
        || (gUnknown_030053E0 != 0)) {
        if (!(gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)) {
            sub_8060440(s, ia, spikes, &gPlayer);
        } else {
            sub_80601F8(s, ia, spikes, &gPlayer);
        }
    }

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (ia->d.sData[0] == 0)
        && (gUnknown_030053E0 == 0)) {
        if (spikes->unk3C & MOVESTATE_20) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        if (spikes->unk3C & 0x8) {
            gPlayer.moveState &= ~MOVESTATE_8;
        }
    }

    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        ia->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
            || (ia->d.sData[0] != 0 || gUnknown_030053E0 != 0)) {
            sub_8004558(s);
            sub_80051E8(s);
        }
    }
}

void initSprite_Interactable_Spikes_LeftRight(Interactable *ia, u16 spriteRegionX,
                                              u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_805FBA0, sizeof(Sprite_Spikes), 0x2000, 0,
                                TaskDestructor_8060CF4);
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    Sprite *s = &spikes->s;

    spikes->unk40 = 0;
    spikes->unk3C = 0;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.ia = ia;
    spikes->base.spriteX = ia->x;
    spikes->base.spriteY = spriteY;

    s->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    s->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    s->graphics.dest = VramMalloc(4 * 4);

    s->unk1A = 0x440;
    s->graphics.size = 0;

    s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];

    s->variant = 3;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2200;

    switch (gGameMode) {
        case GAME_MODE_MULTI_PLAYER_COLLECT_RINGS: {
            if (ia->index == IA__SPIKES__NORMAL_LEFT) {
                // X-Flip
                s->unk10 |= 0x400;
            }
        } break;

        default: {
            if (ia->index == IA__SPIKES__NORMAL_LEFT) {
                // X-Flip
                s->unk10 |= 0x400;
            }
        } break;
    }

    sub_8004558(s);
}

void sub_805FBA0(void)
{
    // Decls had to be split to match, for some reason
    s16 screenX, screenY;
    Sprite *s;
    Interactable *ia;
    Sprite_Spikes *spikes;
    spikes = TaskGetStructPtr(gCurTask);
    s = &spikes->s;
    ia = spikes->base.ia;

    screenX = SpriteGetScreenPos(spikes->base.spriteX, spikes->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS || ia->d.sData[0] != 0
        || gUnknown_030053E0 != 0) {
        // _0805FC16
        s32 r4 = sub_800CCB8(s, screenX, screenY, &gPlayer);
#ifdef NON_MATCHING
        u32 gravityInverted;
#else
        register u32 gravityInverted asm("r9");
#endif
        gravityInverted = gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED;
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
            if (iaIndex != ia->index) {
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
                if (iaIndex == ia->index) {
                    if (sub_800CBA4(&gPlayer)) {
                        m4aSongNumStart(SE_SPIKES);
                    }
                }
            }
        }
    }
    // _0805FDA4

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (ia->d.sData[0] == 0)
        && (gUnknown_030053E0 == 0)) {
        if (spikes->unk3C & 0x20) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }
        // _0805FDD8
        if (spikes->unk3C & 0x8) {
            gPlayer.moveState &= ~MOVESTATE_8;
        }
    }
    // _0805FDF0
    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        ia->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (ia->d.sData[0] != 0)
            || (gUnknown_030053E0 != 0)) {
            sub_8004558(s);
            sub_80051E8(s);
        }
    }
}

void initSprite_Interactable_Spikes_HidingUp(Interactable *ia, u16 spriteRegionX,
                                             u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_805FF68, sizeof(Sprite_Spikes), 0x2000, 0,
                                TaskDestructor_8060CF4);
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    Sprite *s = &spikes->s;

    spikes->unk40 = 0;
    spikes->unk3C = 0;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.ia = ia;
    spikes->base.spriteX = ia->x;
    spikes->base.spriteY = spriteY;

    s->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    s->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    s->graphics.dest = VramMalloc(4 * 4);

    s->unk1A = 0x440;

    s->graphics.size = 0;
    s->graphics.anim = -1;

    s->variant = 0xFF;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2200;
}

void Task_805FF68(void)
{
    s16 screenX, screenY;
    u32 someParam = 0;
    Sprite_Spikes *spikes = TaskGetStructPtr(gCurTask);
    Sprite *s = &spikes->s;
    Interactable *ia = spikes->base.ia;

    screenX = SpriteGetScreenPos(spikes->base.spriteX, spikes->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, spikes->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        ia->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        bool32 procResult;
        if (!(gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)) {
            procResult = sub_8060554(s, ia, spikes, &gPlayer, &someParam);
        } else {
            procResult = sub_80609B4(s, ia, spikes, &gPlayer, &someParam);
        }

        if (procResult) {
            sub_8004558(s);
            sub_80051E8(s);
        }
    }
}

void initSprite_Interactable_Spikes_HidingDown(Interactable *ia, u16 spriteRegionX,
                                               u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_806012C, sizeof(Sprite_Spikes), 0x2000, 0,
                                TaskDestructor_8060CF4);
    Sprite_Spikes *spikes = TaskGetStructPtr(t);
    Sprite *s = &spikes->s;

    spikes->unk40 = 0;
    spikes->unk3C = 0;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.ia = ia;
    spikes->base.spriteX = ia->x;
    spikes->base.spriteY = spriteY;

    s->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    s->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    s->graphics.dest = VramMalloc(4 * 4);

    s->unk1A = 0x440;

    s->graphics.size = 0;
    s->graphics.anim = -1;

    s->variant = 0xFF;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2A00;
}

void Task_806012C(void)
{
    s16 screenX, screenY;
    u32 someParam = 0;
    Sprite_Spikes *spikes = TaskGetStructPtr(gCurTask);
    Sprite *s = &spikes->s;
    Interactable *ia = spikes->base.ia;

    screenX = SpriteGetScreenPos(spikes->base.spriteX, spikes->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, spikes->base.regionY);
    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        ia->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        bool32 procResult;
        if (!(gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)) {
            procResult = sub_80609B4(s, ia, spikes, &gPlayer, &someParam);
        } else {
            procResult = sub_8060554(s, ia, spikes, &gPlayer, &someParam);
        }

        if (procResult) {
            sub_8004558(s);
            sub_80051E8(s);
        }
    }
}

// https://decomp.me/scratch/YbYor
NONMATCH("asm/non_matching/sub_80601F8.inc",
         bool32 sub_80601F8(Sprite *s, Interactable *ia, Sprite_Spikes *spikes,
                            Player *player))
{
    s16 screenX, screenY;
    s8 sp00[4];
    s8 sp04[4];
    Sprite *sp08;
    u32 r7, r8;

    screenX = SpriteGetScreenPos(spikes->base.spriteX, spikes->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (ia->d.sData[0] == 0)
        && (gUnknown_030053E0 == 30)) {
#ifndef NON_MATCHING
        register u32 flags asm("r8") = sub_800CCB8(s, screenX, screenY, player);
#else
        u32 flags = sub_800CCB8(s, screenX, screenY, player);
#endif

        if (flags) {
            s8 *dst, *src;
            s32 value, value0, value1, value2, value3;
            value = (player->unk16 + 5);
            value0 = -value;
            src = sp04;
            *src = value0;

            value1 = (1 - ((u8)player->unk17));
            *(sp04 + 1) = value1;

            value2 = value;
            *(sp04 + 2) = value2;

            value3 = value1 - 1;
            *(sp04 + 3) = value3;

            dst = sp00;
            src = sp04;
            memcpy(dst, src, sizeof(sp04));

            if (flags & 0xC0000) {
                player->moveState |= MOVESTATE_20;
            }

            if (!(gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)) {
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

    // _080602FC
    r7 = (player->moveState >> 3) & (MOVESTATE_8 >> 3);
    r8 = (player->moveState >> 1) & (MOVESTATE_IN_AIR >> 1);
    sp08 = player->unk3C;

    {
        u32 flags = sub_800CCB8(s, screenX, screenY, player);
        if (flags) {
            if (flags & 0x30000) {
                u32 gravityInverted = gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED;
                if (gravityInverted) {
                    if (flags & 0x20000) {
                        player->speedAirY = 0;
                        player->y = Q_24_8(s->unk28->unk7 + screenY + player->unk17);
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
                        u32 localResult = sub_8060D08(s, screenX, screenY, player);

                        if (localResult & 0x10000) {
                            player->y += Q_8_8(localResult);
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
END_NONMATCH

bool32 sub_8060440(Sprite *s, Interactable *ia, Sprite_Spikes *spikes, Player *player)
{

    s16 screenX, screenY;

    screenX = SpriteGetScreenPos(spikes->base.spriteX, spikes->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (!(player->moveState & MOVESTATE_400000)) {
        u32 flags = sub_800CCB8(s, screenX, screenY, player);
        if (flags) {
            if ((flags & 0x20000)
                && !(gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)) {
                player->y = Q_24_8((screenY + s->unk28->unk7) + player->unk17 + 1);
                player->speedAirY = 0;
                player->speedGroundX = 0;

                if (sub_800CBA4(player)) {
                    m4aSongNumStart(SE_SPIKES);
                    return TRUE;
                }
            } else if ((flags & 0x10000)
                       && (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)) {
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