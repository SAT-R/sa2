#include <string.h> // for memcpy

#include "global.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "malloc_vram.h"

#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/globals.h"

#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/animations.h"
#include "constants/interactables.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u32 playerMoveState[2];
} Sprite_Spikes; /* size: 0x44 */

const u16 sSpikesOfZone[NUM_COURSE_ZONES + 1] = {
    [ZONE_1] = SA2_ANIM_SPIKES, // NOTE: Comment tells formatter to keep this as-is!
    [ZONE_2] = SA2_ANIM_SPIKES,         [ZONE_3] = SA2_ANIM_SPIKES_MUS_PLA, [ZONE_4] = SA2_ANIM_SPIKES, [ZONE_5] = SA2_ANIM_SPIKES,
    [ZONE_6] = SA2_ANIM_SPIKES_TEC_BAS, [ZONE_7] = SA2_ANIM_SPIKES,         [ZONE_FINAL] = 0,
};

static void Task_SpikesUpMain(void);
static void Task_SpikesDownMain(void);
static void Task_SpikesLeftRightMain(void);
static void Task_SpikesHidingUpMain(void);
static void Task_SpikesHidingDownMain(void);
static bool32 HandleSpikeMovementUp(Sprite *, MapEntity *, Sprite_Spikes *, Player *);
static bool32 HandleSpikeMovementDown(Sprite *, MapEntity *, Sprite_Spikes *, Player *);
static bool32 HandleSpikeMovementHidingUp(Sprite *, MapEntity *, Sprite_Spikes *, Player *, u32 *);
static bool32 HandleSpikeMovementHidingDown(Sprite *, MapEntity *, Sprite_Spikes *, Player *, u32 *);
static void TaskDestructor_Spikes(struct Task *);
static u32 HandleSpikePlayerCollision(Sprite *, s32 x, s32 y, Player *);

void CreateEntity_Spikes_Up(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_SpikesUpMain, sizeof(Sprite_Spikes), 0x2000, 0, NULL);
    Sprite_Spikes *spikes = TASK_DATA(t);
    Sprite *s = &spikes->s;

    spikes->playerMoveState[0] = spikes->playerMoveState[1] = 0x00;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.me = me;
    spikes->base.spriteX = me->x;
    spikes->base.id = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = (void *)(OBJ_VRAM0 + 204 * TILE_SIZE_4BPP);

    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->graphics.size = 0;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
    } else {
        s->graphics.anim = SA2_ANIM_SPIKES;
    }

    s->variant = SA2_ANIM_VARIANT_SPIKES_UP;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2200;
    UpdateSpriteAnimation(s);
}

void CreateEntity_Spikes_Down(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_SpikesDownMain, sizeof(Sprite_Spikes), 0x2000, 0, NULL);
    Sprite_Spikes *spikes = TASK_DATA(t);
    Sprite *s = &spikes->s;

    spikes->playerMoveState[0] = spikes->playerMoveState[1] = 0x00;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.me = me;
    spikes->base.spriteX = me->x;
    spikes->base.id = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = (void *)(OBJ_VRAM0 + 204 * TILE_SIZE_4BPP);

    s->oamFlags = SPRITE_OAM_ORDER(17);

    s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];

    s->variant = SA2_ANIM_VARIANT_SPIKES_UP;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2A00;
    UpdateSpriteAnimation(s);
}

static void Task_SpikesUpMain(void)
{
    Sprite_Spikes *spikes = TASK_DATA(gCurTask);
    Sprite *s = &spikes->s;
    MapEntity *me = spikes->base.me;
    s16 screenX, screenY;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (!GRAVITY_IS_INVERTED) {
        HandleSpikeMovementUp(s, me, spikes, &gPlayer);
    } else {
        HandleSpikeMovementDown(s, me, spikes, &gPlayer);
    }

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (me->d.sData[0] == 0) && (gUnknown_030053E0 == 0)) {
        if (spikes->playerMoveState[0] & (MOVESTATE_40000 | MOVESTATE_80000)) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        if (spikes->playerMoveState[0] & MOVESTATE_10000) {
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }
    }

    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        me->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            UpdateSpriteAnimation(s);
        }
        DisplaySprite(s);
    }
}

static void Task_SpikesDownMain(void)
{
    Sprite_Spikes *spikes = TASK_DATA(gCurTask);
    Sprite *s = &spikes->s;
    MapEntity *me = spikes->base.me;
    s16 screenX, screenY;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (me->d.sData[0] != 0) || (gUnknown_030053E0 != 0)) {
        if (!GRAVITY_IS_INVERTED) {
            HandleSpikeMovementDown(s, me, spikes, &gPlayer);
        } else {
            HandleSpikeMovementUp(s, me, spikes, &gPlayer);
        }
    }

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (me->d.sData[0] == 0) && (gUnknown_030053E0 == 0)) {
        if (spikes->playerMoveState[0] & MOVESTATE_20) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }

        if (spikes->playerMoveState[0] & MOVESTATE_STOOD_ON_OBJ) {
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }
    }

    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        me->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (me->d.sData[0] != 0 || gUnknown_030053E0 != 0)) {
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void CreateEntity_Spikes_LeftRight(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_SpikesLeftRightMain, sizeof(Sprite_Spikes), 0x2000, 0, TaskDestructor_Spikes);
    Sprite_Spikes *spikes = TASK_DATA(t);
    Sprite *s = &spikes->s;

    spikes->playerMoveState[0] = spikes->playerMoveState[1] = 0x00;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.me = me;
    spikes->base.spriteX = me->x;
    spikes->base.id = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(4 * 4);

    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->graphics.size = 0;

    s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];

    s->variant = SA2_ANIM_VARIANT_SPIKES_SIDEWAYS;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2200;

    switch (gGameMode) {
        case GAME_MODE_MULTI_PLAYER_COLLECT_RINGS: {
            if (me->index == IA__SPIKES__NORMAL_LEFT) {
                // X-Flip
                s->frameFlags |= 0x400;
            }
        } break;

        default: {
            if (me->index == IA__SPIKES__NORMAL_LEFT) {
                // X-Flip
                s->frameFlags |= 0x400;
            }
        } break;
    }

    UpdateSpriteAnimation(s);
}

static void Task_SpikesLeftRightMain(void)
{
    // Decls had to be split to match, for some reason
    s16 screenX, screenY;
    Sprite *s;
    MapEntity *me;
    Sprite_Spikes *spikes;
    spikes = TASK_DATA(gCurTask);
    s = &spikes->s;
    me = spikes->base.me;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS || me->d.sData[0] != 0 || gUnknown_030053E0 != 0) {
        // _0805FC16
        s32 r4 = Player_PlatformCollision(s, screenX, screenY, &gPlayer);
#ifdef NON_MATCHING
        u32 gravityInverted;
#else
        register u32 gravityInverted asm("r9");
#endif
        gravityInverted = GRAVITY_IS_INVERTED;
        if (gravityInverted) {
            if (r4 & 0x10000) {
                gPlayer.qWorldY += (r4 << 24) >> 16;
                gPlayer.qSpeedAirY = 0;
                gPlayer.moveState &= (~MOVESTATE_STOOD_ON_OBJ);
                gPlayer.moveState |= MOVESTATE_IN_AIR;
                gPlayer.stoodObj = 0;
            }
            // _0805FC6C

            if (r4 & 0x20000) {
                if (HandleSpikePlayerCollision(s, screenX, screenY, &gPlayer) & 0x10000) {
                    gPlayer.qWorldY += (r4 << 24) >> 16;
                    gPlayer.qSpeedAirY = 0;
                    gPlayer.moveState |= MOVESTATE_STOOD_ON_OBJ;
                    gPlayer.moveState &= ~MOVESTATE_IN_AIR;
                    gPlayer.stoodObj = s;
                }
            }
        } else {
            // _0805FCC8
            if (r4 & 0x10000) {
                if (HandleSpikePlayerCollision(s, screenX, screenY, &gPlayer) & 0x10000) {
                    gPlayer.qWorldY += (r4 << 24) >> 16;
                    gPlayer.qSpeedAirY = gravityInverted; // Q_8_8(0.5) instead?
                }
            }

            if (r4 & 0x20000) {
                gPlayer.qWorldY += (r4 << 24) >> 16;
                gPlayer.qSpeedAirY = Q_8_8(0);
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
            gPlayer.qWorldX += (s16)((u32)r4 & 0xFF00);
            gPlayer.qSpeedAirX = 0;
            gPlayer.qSpeedGround = 0;

            iaIndex = IA__SPIKES__NORMAL_LEFT;
            if (iaIndex != me->index) {
                if (Player_CollisionDamage(&gPlayer)) {
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
                gPlayer.qWorldX += (s16)((u32)r4 & 0xFF00);
                gPlayer.qSpeedAirX = 0;
                gPlayer.qSpeedGround = 0;

                iaIndex = IA__SPIKES__NORMAL_LEFT;
                if (iaIndex == me->index) {
                    if (Player_CollisionDamage(&gPlayer)) {
                        m4aSongNumStart(SE_SPIKES);
                    }
                }
            }
        }
    }
    // _0805FDA4

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (me->d.sData[0] == 0) && (gUnknown_030053E0 == 0)) {
        if (spikes->playerMoveState[0] & MOVESTATE_20) {
            gPlayer.moveState &= ~MOVESTATE_20;
        }
        // _0805FDD8
        if (spikes->playerMoveState[0] & MOVESTATE_STOOD_ON_OBJ) {
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }
    }
    // _0805FDF0
    if (IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, (CAM_REGION_WIDTH))) {
        me->x = spikes->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (me->d.sData[0] != 0) || (gUnknown_030053E0 != 0)) {
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void CreateEntity_Spikes_HidingUp(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_SpikesHidingUpMain, sizeof(Sprite_Spikes), 0x2000, 0, TaskDestructor_Spikes);
    Sprite_Spikes *spikes = TASK_DATA(t);
    Sprite *s = &spikes->s;

    spikes->playerMoveState[0] = spikes->playerMoveState[1] = 0x00;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.me = me;
    spikes->base.spriteX = me->x;
    spikes->base.id = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(4 * 4);

    s->oamFlags = SPRITE_OAM_ORDER(17);

    s->graphics.size = 0;
    s->graphics.anim = -1;

    s->variant = 0xFF;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2200;
}

static void Task_SpikesHidingUpMain(void)
{
    s16 screenX, screenY;
    u32 someParam = 0;
    Sprite_Spikes *spikes = TASK_DATA(gCurTask);
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
            procResult = HandleSpikeMovementHidingUp(s, me, spikes, &gPlayer, &someParam);
        } else {
            procResult = HandleSpikeMovementHidingDown(s, me, spikes, &gPlayer, &someParam);
        }

        if (procResult) {
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void CreateEntity_Spikes_HidingDown(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_SpikesHidingDownMain, sizeof(Sprite_Spikes), 0x2000, 0, TaskDestructor_Spikes);
    Sprite_Spikes *spikes = TASK_DATA(t);
    Sprite *s = &spikes->s;

    spikes->playerMoveState[0] = spikes->playerMoveState[1] = 0x00;
    spikes->base.regionX = spriteRegionX;
    spikes->base.regionY = spriteRegionY;
    spikes->base.me = me;
    spikes->base.spriteX = me->x;
    spikes->base.id = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(4 * 4);

    s->oamFlags = SPRITE_OAM_ORDER(17);

    s->graphics.size = 0;
    s->graphics.anim = -1;

    s->variant = 0xFF;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2A00;
}

static void Task_SpikesHidingDownMain(void)
{
    s16 screenX, screenY;
    u32 someParam = 0;
    Sprite_Spikes *spikes = TASK_DATA(gCurTask);
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
            procResult = HandleSpikeMovementHidingDown(s, me, spikes, &gPlayer, &someParam);
        } else {
            procResult = HandleSpikeMovementHidingUp(s, me, spikes, &gPlayer, &someParam);
        }

        if (procResult) {
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

bool32 HandleSpikeMovementUp(Sprite *s, MapEntity *me, Sprite_Spikes *spikes, Player *player)
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

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (me->d.sData[0] == 0) && (gUnknown_030053E0 == 30)) {
        u32 flags = Player_PlatformCollision(s, screenX, screenY, player);

        if (flags) {
            u32 v = ((u8)player->spriteOffsetX + 5);
            s8 sp00[4] = { -v, 1 - player->spriteOffsetY, v, player->spriteOffsetY - 1 };

            if (flags & 0xC0000) {
                player->moveState |= MOVESTATE_20;
            }

            if (!GRAVITY_IS_INVERTED) {
                player->qWorldY = Q(screenY + s->hitboxes[0].top - sp00[3]);
            } else {
                player->qWorldY = Q(screenY + s->hitboxes[0].bottom + sp00[3]);
            }

            if (Player_CollisionDamage(player)) {
                m4aSongNumStart(SE_SPIKES);
                return TRUE;
            }
        }
    }

    {
        u32 r7, r8;
        Sprite *sp08;
        u32 flags;

        r7 = (player->moveState >> 3) & (MOVESTATE_STOOD_ON_OBJ >> 3);
        r8 = (player->moveState >> 1) & (MOVESTATE_IN_AIR >> 1);
        sp08 = player->stoodObj;

        flags = Player_PlatformCollision(s, screenX, screenY, player);
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
                        player->qSpeedAirY = 0;
                        player->qWorldY = Q(screenY + s->hitboxes[0].bottom + player->spriteOffsetY);
                        player->moveState |= MOVESTATE_STOOD_ON_OBJ;
                        player->moveState &= ~MOVESTATE_IN_AIR;
                        player->stoodObj = s;
                        player->qSpeedGround = player->qSpeedAirX;
                        // _080603BC
                        if (Player_CollisionDamage(player)) {
                            m4aSongNumStart(SE_SPIKES);
                            return TRUE;
                        }
                    }
                } else {
                    // _0806038C
                    if (flags & 0x10000) {
                        flags = HandleSpikePlayerCollision(s, screenX, screenY, player);

                        if (flags & 0x10000) {
                            player->qWorldY += Q_8_8(flags);
                            player->qSpeedAirY = 0;

                            // _080603BC
                            if (Player_CollisionDamage(player)) {
                                m4aSongNumStart(SE_SPIKES);
                                return TRUE;
                            }
                        } else {
                            // _080603D0
                            if (r7) {
                                player->moveState |= MOVESTATE_STOOD_ON_OBJ;
                            } else {
                                player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                            }

                            if (r8) {
                                player->moveState |= MOVESTATE_IN_AIR;
                            } else {
                                player->moveState &= ~MOVESTATE_IN_AIR;
                            }

                            player->stoodObj = sp08;
                        }
                    }
                }
            } else if (flags & 0x0C0000) {
                // _08060404
                player->moveState |= MOVESTATE_20;
                player->qWorldX += (s16)(flags & 0xFF00);
                player->qSpeedAirX = 0;
                player->qSpeedGround = 0;
            }
        }
    }

    return FALSE;
}

static bool32 HandleSpikeMovementDown(Sprite *s, MapEntity *me, Sprite_Spikes *spikes, Player *player)
{

    s16 screenX, screenY;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    if (!(player->moveState & MOVESTATE_IA_OVERRIDE)) {
        u32 flags = Player_PlatformCollision(s, screenX, screenY, player);
        if (flags) {
            if ((flags & 0x20000) && !GRAVITY_IS_INVERTED) {
                player->qWorldY = Q((screenY + s->hitboxes[0].bottom) + player->spriteOffsetY + 1);
                player->qSpeedAirY = 0;
                player->qSpeedGround = 0;

                if (Player_CollisionDamage(player)) {
                    m4aSongNumStart(SE_SPIKES);
                    return TRUE;
                }
            } else if ((flags & 0x10000) && GRAVITY_IS_INVERTED) {
                // _080604D0
                player->qWorldY = Q((screenY + s->hitboxes[0].top) - player->spriteOffsetY - 1);
                player->qSpeedAirY = 0;
                player->qSpeedGround = 0;

                if (Player_CollisionDamage(player)) {
                    m4aSongNumStart(SE_SPIKES);
                    return TRUE;
                }
            } else if (flags & 0xC0000) {
                player->moveState |= MOVESTATE_20;
                player->qWorldX += (s16)(flags & 0xFF00);
                player->qSpeedAirX = 0;
                player->qSpeedGround = 0;
            }
        }
    }

    return FALSE;
}

static bool32 HandleSpikeMovementHidingUp(Sprite *s, MapEntity *me, Sprite_Spikes *spikes, Player *player, u32 *param4) //)
{
    s16 screenX, screenY;
    u32 stageTimer[1] = { gStageTime & 0x7F };
    s32 playerID = player->playerID;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    // TODO: Replace magic numbers in if statements
    if (stageTimer[0] < 60) {
        if ((player->moveState & MOVESTATE_STOOD_ON_OBJ) && (player->stoodObj == s)) {
            player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->playerMoveState[playerID] & MOVESTATE_20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->playerMoveState[playerID] = 0x00;
        }

        return FALSE;
    } else if (stageTimer[0] < 62) {
        if ((player->moveState & MOVESTATE_STOOD_ON_OBJ) && (player->stoodObj == s)) {
            player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->playerMoveState[playerID] & MOVESTATE_20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->playerMoveState[playerID] = 0x00;
        }

        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_LOW;
        UpdateSpriteAnimation(s);
    } else if (stageTimer[0] < 64) {
        if ((player->moveState & MOVESTATE_STOOD_ON_OBJ) && (player->stoodObj == s)) {
            player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->playerMoveState[playerID] & MOVESTATE_20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->playerMoveState[playerID] = 0x00;
        }
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_MID;
        UpdateSpriteAnimation(s);
    } else if (stageTimer[0] < 124) {
        if ((s->variant != SA2_ANIM_VARIANT_SPIKES_UP) || ((player->playerID != 0) && (*param4 != 0))) {
            if (player->playerID == 0) {
                // TODO: Replace magic number
                *param4 = 1;
            }

            s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
            s->variant = SA2_ANIM_VARIANT_SPIKES_UP;
            UpdateSpriteAnimation(s);

            if (Player_IsSpriteColliding(s, screenX, screenY, player) == 0x80000) {
                if ((HandleSpikePlayerCollision(s, screenX, screenY, player) & 0xD0000) != 0) {
                    u32 v = ((u8)player->spriteOffsetX + 5);
                    s8 sp00[4] = { -v, 1 - player->spriteOffsetY, v, player->spriteOffsetY - 1 };

                    if (!GRAVITY_IS_INVERTED) {
                        player->qWorldY = Q((screenY + s->hitboxes[0].top) - sp00[3]);
                    } else {
                        player->qWorldY = Q((screenY + s->hitboxes[0].bottom) + sp00[3]);
                    }
                    if (Player_CollisionDamage(player)) {
                        m4aSongNumStart(SE_SPIKES);
                        return TRUE;
                    }
                }
            } else {
                u32 flags = Player_PlatformCollision(s, screenX, screenY, player);
                if (flags) {
                    if (flags & 0x10000) {
                        flags = HandleSpikePlayerCollision(s, screenX, screenY, player);

                        if (flags & 0x10000) {
                            if (Player_CollisionDamage(player)) {
                                m4aSongNumStart(SE_SPIKES);
                                return TRUE;
                            }
                        }
                    } else if (flags & 0xC0000) {
                        player->moveState |= MOVESTATE_20;
                        player->qWorldX += (s16)(flags & 0xFF00);
                        player->qSpeedAirX = 0;
                        player->qSpeedGround = 0;
                    }
                }
            }
        } else {
            u32 flags = Player_PlatformCollision(s, screenX, screenY, player);
            if (flags) {
                if ((flags & 0x10000) && !GRAVITY_IS_INVERTED) {
                    flags = HandleSpikePlayerCollision(s, screenX, screenY, player);

                    if ((flags & 0x10000) && Player_CollisionDamage(player)) {
                        m4aSongNumStart(SE_SPIKES);
                        return TRUE;
                    }
                } else if ((flags & 0x20000) && GRAVITY_IS_INVERTED) {
                    player->qWorldY = Q(screenY + s->hitboxes[0].bottom + player->spriteOffsetY);
                    player->moveState |= MOVESTATE_STOOD_ON_OBJ;
                    player->moveState &= ~MOVESTATE_IN_AIR;
                    player->stoodObj = s;
                    player->qSpeedGround = player->qSpeedAirX;

                    if (Player_CollisionDamage(player)) {
                        m4aSongNumStart(SE_SPIKES);
                        return TRUE;
                    }
                } else if (flags & 0xC0000) {
                    player->moveState |= MOVESTATE_20;
                    player->qWorldX += (s16)(flags & 0xFF00);
                    player->qSpeedAirX = 0;
                    player->qSpeedGround = 0;
                }
            }

            // TODO: WHY!?
            spikes->playerMoveState[playerID] = player->moveState;
        }
    } else if (stageTimer[0] < 126) {

        if ((player->moveState & MOVESTATE_STOOD_ON_OBJ) && (player->stoodObj == s)) {
            player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->playerMoveState[playerID] & MOVESTATE_20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->playerMoveState[playerID] = 0x00;
        }
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_MID;
        UpdateSpriteAnimation(s);
    } else {
        if ((player->moveState & MOVESTATE_STOOD_ON_OBJ) && (player->stoodObj == s)) {
            player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->playerMoveState[playerID] & MOVESTATE_20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->playerMoveState[playerID] = 0x00;
        }
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_LOW;
        UpdateSpriteAnimation(s);
    }

    return TRUE;
}

static bool32 HandleSpikeMovementHidingDown(Sprite *s, MapEntity *me, Sprite_Spikes *spikes, Player *player, u32 *param4)
{
    s16 screenX, screenY;
    u32 stageTimer[1] = { gStageTime & 0x7F };
    s32 playerID = player->playerID;

    screenX = TO_WORLD_POS(spikes->base.spriteX, spikes->base.regionX);
    screenY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = screenX - gCamera.x;
    s->y = screenY - gCamera.y;

    // TODO: Replace magic numbers in if statements
    if (stageTimer[0] < 60) {
        if ((player->moveState & MOVESTATE_STOOD_ON_OBJ) && (player->stoodObj == s)) {
            player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->playerMoveState[playerID] & MOVESTATE_20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->playerMoveState[playerID] = 0x00;
        }

        return FALSE;
    } else if (stageTimer[0] < 62) {
        if ((player->moveState & MOVESTATE_STOOD_ON_OBJ) && (player->stoodObj == s)) {
            player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->playerMoveState[playerID] & MOVESTATE_20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->playerMoveState[playerID] = 0x00;
        }

        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_LOW;
        UpdateSpriteAnimation(s);
    } else if (stageTimer[0] < 64) {
        if ((player->moveState & MOVESTATE_STOOD_ON_OBJ) && (player->stoodObj == s)) {
            player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->playerMoveState[playerID] & MOVESTATE_20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->playerMoveState[playerID] = 0x00;
        }
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_MID;
        UpdateSpriteAnimation(s);
    } else if (stageTimer[0] < 124) {
        if ((s->variant != SA2_ANIM_VARIANT_SPIKES_UP) || ((player->playerID != 0) && (*param4 != 0))) {
            if (player->playerID == 0) {
                // TODO: Replace magic number
                *param4 = 1;
            }

            s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
            s->variant = SA2_ANIM_VARIANT_SPIKES_UP;
            UpdateSpriteAnimation(s);

            if ((Player_IsSpriteColliding(s, screenX, screenY, player) == 0x80000)
                && ((HandleSpikePlayerCollision(s, screenX, screenY, player) & 0xD0000) != 0)) {

                u32 v = ((u8)player->spriteOffsetX + 5);
                s8 sp00[4] = { -v, 1 - player->spriteOffsetY, v, player->spriteOffsetY - 1 };

                if (!GRAVITY_IS_INVERTED) {
                    player->qWorldY = Q(s->hitboxes[0].bottom + screenY - sp00[1]);
                } else {
                    player->qWorldY = Q(s->hitboxes[0].top + screenY + sp00[1]);
                }
                if (!Player_CollisionDamage(player)) {
                    return TRUE;
                }
            } else
                return TRUE;
        } else {
            spikes->playerMoveState[playerID] = Player_PlatformCollision(s, screenX, screenY, player);
            if (!(spikes->playerMoveState[playerID] & MOVESTATE_20000) || !Player_CollisionDamage(player)) {
                return TRUE;
            }
        }

        m4aSongNumStart(SE_SPIKES);
    } else if (stageTimer[0] < 126) {

        if ((player->moveState & MOVESTATE_STOOD_ON_OBJ) && (player->stoodObj == s)) {
            player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        // TODO: Replace magic number
        if (spikes->playerMoveState[playerID] & MOVESTATE_20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->playerMoveState[playerID] = 0x00;
        }
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_MID;
        UpdateSpriteAnimation(s);
    } else {
        if ((player->moveState & MOVESTATE_STOOD_ON_OBJ) && (player->stoodObj == s)) {
            player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            player->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->playerMoveState[playerID] & MOVESTATE_20) {
            player->moveState &= ~MOVESTATE_20;
            spikes->playerMoveState[playerID] = 0x00;
        }
        s->graphics.anim = sSpikesOfZone[LEVEL_TO_ZONE(gCurrentLevel)];
        s->variant = SA2_ANIM_VARIANT_SPIKES_UP_LOW;
        UpdateSpriteAnimation(s);
    }

    return TRUE;
}

static void TaskDestructor_Spikes(struct Task *t)
{
    Sprite_Spikes *spikes = TASK_DATA(t);
    VramFree(spikes->s.graphics.dest);
}

static u32 HandleSpikePlayerCollision(Sprite *s, s32 x, s32 y, Player *player)
{
    u32 result;

    s->hitboxes[0].left++;
    s->hitboxes[0].right--;

    result = Player_PlatformCollision(s, x, y, player);

    s->hitboxes[0].left--;
    s->hitboxes[0].right++;

    return result;
}