#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/interactables.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u32 movestateBuffer[NUM_SINGLEPLAYER_CHARS_MAX];
} Spikes;

void Task_Spikes_Up(void);
void Task_Spikes_Down(void);
void Task_Spikes_Horizontal(void);
void Task_Spikes_HidingUp(void);
void Task_Spikes_HidingDown(void);

bool32 sub_8020D44(Sprite *s, MapEntity *me, Spikes *spikes, Player *p);
bool32 sub_8020E98(Sprite *s, MapEntity *me, Spikes *spikes, Player *p);
bool32 sub_8020F2C(Sprite *s, MapEntity *me, Spikes *spikes, Player *p, bool32 *out);
bool32 sub_8021208(Sprite *s, MapEntity *me, Spikes *spikes, Player *p, bool32 *out);

void TaskDestructor_Spikes(Task *t);

void CreateEntity_Spikes_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Spikes_Up, sizeof(Spikes), 0x2000, 0, NULL);
    Spikes *spikes = TASK_DATA(t);
    Sprite *s = &spikes->s;
    CamCoord worldX, worldY;

    spikes->movestateBuffer[PLAYER_2] = 0;
    spikes->movestateBuffer[PLAYER_1] = 0;

    spikes->base.regionX = regionX;
    spikes->base.regionY = regionY;
    spikes->base.me = me;
    spikes->base.meX = me->x;
    spikes->base.id = id;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VRAM_RESERVED_SPIKES;
    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_SPIKES;
    s->variant = 2;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

void CreateEntity_Spikes_Down(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Spikes_Down, sizeof(Spikes), 0x2000, 0, NULL);
    Spikes *spikes = TASK_DATA(t);
    Sprite *s = &spikes->s;
    CamCoord worldX, worldY;

    spikes->movestateBuffer[PLAYER_2] = 0;
    spikes->movestateBuffer[PLAYER_1] = 0;

    spikes->base.regionX = regionX;
    spikes->base.regionY = regionY;
    spikes->base.me = me;
    spikes->base.meX = me->x;
    spikes->base.id = id;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VRAM_RESERVED_SPIKES;
    s->oamFlags = SPRITE_OAM_ORDER(17);
#ifdef BUG_FIX
    // TODO: I'm confused.
    //       The Up-Spikes set this, but not the Down-Spikes?
    s->graphics.size = 0;
#endif
    s->graphics.anim = SA1_ANIM_SPIKES;
    s->variant = 2;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(Y_FLIP, 1);
    UpdateSpriteAnimation(s);
}

void Task_Spikes_Up(void)
{
    Spikes *spikes = TASK_DATA(gCurTask);
    Sprite *s = &spikes->s;
    MapEntity *me = spikes->base.me;
    CamCoord worldX, worldY;
    s32 i, j;

    worldX = TO_WORLD_POS(spikes->base.meX, spikes->base.regionX);
    worldY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (me->d.sData[0] != 0) || (gSpikesUnknownTimer != 0)) {
        i = 0;
        do {
            // This if-else is the only diff between Up/Down
            if (!GRAVITY_IS_INVERTED) {
                sub_8020D44(s, me, spikes, &PLAYER(i));
            } else {
                sub_8020E98(s, me, spikes, &PLAYER(i));
            }
        } while (++i < gNumSingleplayerCharacters);
    }

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (me->d.sData[0] == 0) && (gSpikesUnknownTimer == 0)) {
        j = 0;
        do {
            if (spikes->movestateBuffer[j] & 0x20) {
                PLAYER(j).moveState &= ~MOVESTATE_20;
            }

            if (spikes->movestateBuffer[j] & 0x8) {
                PLAYER(j).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            }
        } while (++j < gNumSingleplayerCharacters);
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spikes->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (me->d.sData[0] != 0) || (gSpikesUnknownTimer != 0)) {
        DisplaySprite(s);
    }
}

void Task_Spikes_Down(void)
{
    Spikes *spikes = TASK_DATA(gCurTask);
    Sprite *s = &spikes->s;
    MapEntity *me = spikes->base.me;
    CamCoord worldX, worldY;
    s32 i, j;

    worldX = TO_WORLD_POS(spikes->base.meX, spikes->base.regionX);
    worldY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (me->d.sData[0] != 0) || (gSpikesUnknownTimer != 0)) {
        i = 0;
        do {
            // This if-else is the only diff between Up/Down
            if (!GRAVITY_IS_INVERTED) {
                sub_8020E98(s, me, spikes, &PLAYER(i));
            } else {
                sub_8020D44(s, me, spikes, &PLAYER(i));
            }
        } while (++i < gNumSingleplayerCharacters);
    }

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (me->d.sData[0] == 0) && (gSpikesUnknownTimer == 0)) {
        j = 0;
        do {
            if (spikes->movestateBuffer[j] & MOVESTATE_20) {
                PLAYER(j).moveState &= ~MOVESTATE_20;
            }

            if (spikes->movestateBuffer[j] & MOVESTATE_STOOD_ON_OBJ) {
                PLAYER(j).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            }
        } while (++j < gNumSingleplayerCharacters);
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spikes->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (me->d.sData[0] != 0) || (gSpikesUnknownTimer != 0)) {
        DisplaySprite(s);
    }
}

void CreateEntity_Spikes_Horizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Spikes_Horizontal, sizeof(Spikes), 0x2000, 0, TaskDestructor_Spikes);
    Spikes *spikes = TASK_DATA(t);
    Sprite *s = &spikes->s;
    CamCoord worldX, worldY;

    spikes->movestateBuffer[PLAYER_2] = 0;
    spikes->movestateBuffer[PLAYER_1] = 0;

    spikes->base.regionX = regionX;
    spikes->base.regionY = regionY;
    spikes->base.me = me;
    spikes->base.meX = me->x;
    spikes->base.id = id;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPIKES);
    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_SPIKES;
    s->variant = 3;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (gGameMode == 6) {
        if (me->index == 2) {
            s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
        }
    } else {
        if (me->index == 3) {
            s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
        }
    }
    UpdateSpriteAnimation(s);
}

void Task_Spikes_Horizontal(void)
{
    Spikes *spikes = TASK_DATA(gCurTask);
    Sprite *s = &spikes->s;
    MapEntity *me = spikes->base.me;
    CamCoord worldX, worldY;
    s32 i, j;

    worldX = TO_WORLD_POS(spikes->base.meX, spikes->base.regionX);
    worldY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (me->d.sData[0] != 0) || (gSpikesUnknownTimer != 0)) {
        i = 0;
        do {
            u32 res = Coll_Player_Platform(s, worldX, worldY, &PLAYER(i));
            s32 r2;

            if (res & 0x10008) {
                continue;
            }

            r2 = 3;
            if (gGameMode == 6) {
                r2 = 2;
            }

            if (res & 0x20000) {
                if (r2 == me->index) {
                    if (Coll_DamagePlayer(&PLAYER(i))) {
                        m4aSongNumStart(SE_171);
                    }
                } else {
                    s8 arr[4] = { -(PLAYER(i).spriteOffsetX + 5), -(PLAYER(i).spriteOffsetY + 1), +(PLAYER(i).spriteOffsetX + 5),
                                  +(PLAYER(i).spriteOffsetY + 1) };

                    PLAYER(i).qWorldX = Q(worldX + s->hitboxes[0].b.right - arr[0] + 1);
                }
            } else if (res & 0x40000) {
                if ((r2 + 1) == me->index) {
                    if (Coll_DamagePlayer(&PLAYER(i))) {
                        m4aSongNumStart(SE_171);
                    }
                } else {
                    s8 arr[4] = { -(PLAYER(i).spriteOffsetX + 5), -(PLAYER(i).spriteOffsetY + 1), +(PLAYER(i).spriteOffsetX + 5),
                                  +(PLAYER(i).spriteOffsetY + 1) };

                    PLAYER(i).qWorldX = Q(worldX + s->hitboxes[0].b.left - arr[2] - 1);
                }
            }
        } while (++i < gNumSingleplayerCharacters);
    }

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (me->d.sData[0] == 0) && (gSpikesUnknownTimer == 0)) {
        j = 0;
        do {
            if (spikes->movestateBuffer[j] & MOVESTATE_20) {
                PLAYER(j).moveState &= ~MOVESTATE_20;
            }

            if (spikes->movestateBuffer[j] & MOVESTATE_STOOD_ON_OBJ) {
                PLAYER(j).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            }
        } while (++j < gNumSingleplayerCharacters);
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spikes->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if ((gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) || (me->d.sData[0] != 0) || (gSpikesUnknownTimer != 0)) {
        DisplaySprite(s);
    }
}

void CreateEntity_Spikes_HidingUp(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Spikes_HidingUp, sizeof(Spikes), 0x2000, 0, TaskDestructor_Spikes);
    Spikes *spikes = TASK_DATA(t);
    Sprite *s = &spikes->s;
    CamCoord worldX, worldY;

    spikes->movestateBuffer[PLAYER_2] = 0;
    spikes->movestateBuffer[PLAYER_1] = 0;

    spikes->base.regionX = regionX;
    spikes->base.regionY = regionY;
    spikes->base.me = me;
    spikes->base.meX = me->x;
    spikes->base.id = id;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPIKES);
    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->graphics.size = 0;
    s->graphics.anim = -1;
    s->variant = -1;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

void Task_Spikes_HidingUp(void)
{
    bool32 sp04 = 0;
    Spikes *spikes = TASK_DATA(gCurTask);
    Sprite *s = &spikes->s;
    MapEntity *me = spikes->base.me;
    CamCoord worldX, worldY;
    s32 i, j;

    worldX = TO_WORLD_POS(spikes->base.meX, spikes->base.regionX);
    worldY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spikes->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    {
        bool32 res;
        i = 0;
        do {
            // This if-else is the only diff between Up/Down
            if (!GRAVITY_IS_INVERTED) {
                res = sub_8020F2C(s, me, spikes, &PLAYER(i), &sp04);
            } else {
                res = sub_8021208(s, me, spikes, &PLAYER(i), &sp04);
            }
        } while (++i < gNumSingleplayerCharacters);

        if (res) {
            DisplaySprite(s);
        }
    }
}

void CreateEntity_Spikes_HidingDown(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Spikes_HidingDown, sizeof(Spikes), 0x2000, 0, TaskDestructor_Spikes);
    Spikes *spikes = TASK_DATA(t);
    Sprite *s = &spikes->s;
    CamCoord worldX, worldY;

    spikes->movestateBuffer[PLAYER_2] = 0;
    spikes->movestateBuffer[PLAYER_1] = 0;

    spikes->base.regionX = regionX;
    spikes->base.regionY = regionY;
    spikes->base.me = me;
    spikes->base.meX = me->x;
    spikes->base.id = id;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPIKES);
    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->graphics.size = 0;
    s->graphics.anim = -1;
    s->variant = -1;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(Y_FLIP, 1);
}

void Task_Spikes_HidingDown(void)
{
    bool32 sp04 = 0;
    Spikes *spikes = TASK_DATA(gCurTask);
    Sprite *s = &spikes->s;
    MapEntity *me = spikes->base.me;
    CamCoord worldX, worldY;
    s32 i, j;

    worldX = TO_WORLD_POS(spikes->base.meX, spikes->base.regionX);
    worldY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spikes->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    {
        bool32 res;
        i = 0;
        do {
            // This if-else is the only diff between Up/Down
            if (!GRAVITY_IS_INVERTED) {
                res = sub_8021208(s, me, spikes, &PLAYER(i), &sp04);
            } else {
                res = sub_8020F2C(s, me, spikes, &PLAYER(i), &sp04);
            }
        } while (++i < gNumSingleplayerCharacters);

        if (res) {
            DisplaySprite(s);
        }
    }
}

bool32 sub_8020D44(Sprite *s, MapEntity *me, Spikes *spikes, Player *p)
{
    s32 tempPlayerID = p->playerID;
    CamCoord worldX, worldY;
    u32 movestate;
    s32 i;

    worldX = TO_WORLD_POS(spikes->base.meX, spikes->base.regionX);
    worldY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) && (me->d.sData[0] == 0) && (gSpikesUnknownTimer == 30)
        && (Coll_Player_Entity_Intersection(s, worldX, worldY, p) == 0x80000)) {
        s8 arr[4] = { -(p->spriteOffsetX + 5), (1 - p->spriteOffsetY), +(p->spriteOffsetX + 5), (p->spriteOffsetY - 1) };

        if (!GRAVITY_IS_INVERTED) {
            p->qWorldY = Q(worldY + s->hitboxes[0].b.top - arr[3]);
        } else {
            p->qWorldY = Q(worldY + s->hitboxes[0].b.bottom + arr[3]);
        }

        if (Coll_DamagePlayer(p)) {
            m4aSongNumStart(SE_171);
            return TRUE;
        }
    }

    movestate = Coll_Player_Platform(s, worldX, worldY, p);
    spikes->movestateBuffer[tempPlayerID] = movestate;

    if (movestate & MOVESTATE_STOOD_ON_OBJ) {
        if (Coll_DamagePlayer(p)) {
            m4aSongNumStart(SE_171);
            return TRUE;
        }
    }

    return FALSE;
}

bool32 sub_8020E98(Sprite *s, MapEntity *me, Spikes *spikes, Player *p)
{
    s32 tempPlayerID = p->playerID;
    CamCoord worldX, worldY;
    u32 movestate;
    s32 i;

    worldX = TO_WORLD_POS(spikes->base.meX, spikes->base.regionX);
    worldY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (!(p->moveState & MOVESTATE_IA_OVERRIDE)) {
        movestate = Coll_Player_Platform(s, worldX, worldY, p);
        spikes->movestateBuffer[tempPlayerID] = movestate;

        if (movestate & MOVESTATE_10000) {
            if (Coll_DamagePlayer(p)) {
                m4aSongNumStart(SE_171);
                return TRUE;
            }
        }
    }

    return FALSE;
}

bool32 sub_8020F2C(Sprite *s, MapEntity *me, Spikes *spikes, Player *p, bool32 *out)
{
    CamCoord worldX, worldY;
    u32 sp0C;
    s32 tempPlayerID;
    s32 i;

    sp0C = gStageTime % 128u;
    tempPlayerID = p->playerID;

    worldX = TO_WORLD_POS(spikes->base.meX, spikes->base.regionX);
    worldY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (sp0C < 60) {
        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->movestateBuffer[tempPlayerID] & MOVESTATE_20) {
            p->moveState &= ~MOVESTATE_20;
            spikes->movestateBuffer[tempPlayerID] = 0;
        }

        return FALSE;
    } else if (sp0C < 62) {
        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->movestateBuffer[tempPlayerID] & MOVESTATE_20) {
            p->moveState &= ~MOVESTATE_20;
            spikes->movestateBuffer[tempPlayerID] = 0;
        }

        s->graphics.anim = SA1_ANIM_SPIKES;
        s->variant = 0;
        UpdateSpriteAnimation(s);
    } else if (sp0C < 64) {
        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->movestateBuffer[tempPlayerID] & MOVESTATE_20) {
            p->moveState &= ~MOVESTATE_20;
            spikes->movestateBuffer[tempPlayerID] = 0;
        }

        s->graphics.anim = SA1_ANIM_SPIKES;
        s->variant = 1;
        UpdateSpriteAnimation(s);
    } else if (sp0C < 124) {
#ifndef NON_MATCHING
        // TODO: Register fake-match
        register u32 res asm("r0");
#else
        u32 res;
#endif
        u8 variant = s->variant;
        u8 pid = p->playerID;

        if ((variant != 2) || ((pid != PLAYER_1) && (*out))) {
            if (pid == PLAYER_1) {
                {
                    *out = TRUE;
                }
            }

            s->graphics.anim = SA1_ANIM_SPIKES;
            s->variant = 2;
            UpdateSpriteAnimation(s);

            if (Coll_Player_Entity_Intersection(s, worldX, worldY, p) == COLL_FLAG_80000) {
                s8 arr[4] = { -(p->spriteOffsetX + 5), (1 - p->spriteOffsetY), +(p->spriteOffsetX + 5), (p->spriteOffsetY - 1) };

                if (!GRAVITY_IS_INVERTED) {
                    p->qWorldY = Q(worldY + s->hitboxes[0].b.top - arr[3]);
                } else {
                    p->qWorldY = Q(worldY + s->hitboxes[0].b.bottom + arr[3]);
                }

                if (Coll_DamagePlayer(p)) {
                    m4aSongNumStart(SE_171);
                }
            } else {
                res = Coll_Player_Platform(s, worldX, worldY, p);

                if (res & COLL_FLAG_8) {
                    if (Coll_DamagePlayer(p)) {
                        m4aSongNumStart(SE_171);
                    }
                }
            }
        } else {
            res = Coll_Player_Platform(s, worldX, worldY, p);
            spikes->movestateBuffer[tempPlayerID] = res;

        test:
            if (res & COLL_FLAG_8) {
                if (Coll_DamagePlayer(p)) {
                    m4aSongNumStart(SE_171);
                }
            }
        }
    } else if (sp0C < 126) {
        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->movestateBuffer[tempPlayerID] & MOVESTATE_20) {
            p->moveState &= ~MOVESTATE_20;
            spikes->movestateBuffer[tempPlayerID] = 0;
        }

        s->graphics.anim = SA1_ANIM_SPIKES;
        s->variant = 1;
        UpdateSpriteAnimation(s);
    } else {
        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->movestateBuffer[tempPlayerID] & MOVESTATE_20) {
            p->moveState &= ~MOVESTATE_20;
            spikes->movestateBuffer[tempPlayerID] = 0;
        }

        s->graphics.anim = SA1_ANIM_SPIKES;
        s->variant = 0;
        UpdateSpriteAnimation(s);
    }

    return TRUE;
}

bool32 sub_8021208(Sprite *s, MapEntity *me, Spikes *spikes, Player *p, bool32 *out)
{
    CamCoord worldX, worldY;
    u32 sp0C;
    s32 tempPlayerID;
    s32 i;

    sp0C = gStageTime % 128u;
    tempPlayerID = p->playerID;

    worldX = TO_WORLD_POS(spikes->base.meX, spikes->base.regionX);
    worldY = TO_WORLD_POS(me->y, spikes->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (sp0C < 60) {
        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->movestateBuffer[tempPlayerID] & MOVESTATE_20) {
            p->moveState &= ~MOVESTATE_20;
            spikes->movestateBuffer[tempPlayerID] = 0;
        }

        return FALSE;
    } else if (sp0C < 62) {
        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->movestateBuffer[tempPlayerID] & MOVESTATE_20) {
            p->moveState &= ~MOVESTATE_20;
            spikes->movestateBuffer[tempPlayerID] = 0;
        }

        s->graphics.anim = SA1_ANIM_SPIKES;
        s->variant = 0;
        UpdateSpriteAnimation(s);
    } else if (sp0C < 64) {
        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->movestateBuffer[tempPlayerID] & MOVESTATE_20) {
            p->moveState &= ~MOVESTATE_20;
            spikes->movestateBuffer[tempPlayerID] = 0;
        }

        s->graphics.anim = SA1_ANIM_SPIKES;
        s->variant = 1;
        UpdateSpriteAnimation(s);
    } else if (sp0C < 124) {
#ifndef NON_MATCHING
        // TODO: Register fake-match
        register u32 res asm("r0");
#else
        u32 res;
#endif
        u8 variant = s->variant;
        u8 pid = p->playerID;

        if ((variant != 2) || ((pid != PLAYER_1) && (*out))) {
            if (pid == PLAYER_1) {
                {
                    *out = TRUE;
                }
            }

            s->graphics.anim = SA1_ANIM_SPIKES;
            s->variant = 2;
            UpdateSpriteAnimation(s);

            if (Coll_Player_Entity_Intersection(s, worldX, worldY, p) == COLL_FLAG_80000) {
                s8 arr[4] = { -(p->spriteOffsetX + 5), (1 - p->spriteOffsetY), +(p->spriteOffsetX + 5), (p->spriteOffsetY - 1) };

                // Change 1 from sub_8020F2C: change Y-offsets
                if (!GRAVITY_IS_INVERTED) {
                    p->qWorldY = Q(worldY + s->hitboxes[0].b.bottom - arr[1]);
                } else {
                    p->qWorldY = Q(worldY + s->hitboxes[0].b.top + arr[1]);
                }

                if (Coll_DamagePlayer(p)) {
                    m4aSongNumStart(SE_171);
                }
            }
            // Change 2 from sub_8020F2C: removed else-block here
        } else {
            res = Coll_Player_Platform(s, worldX, worldY, p);
            spikes->movestateBuffer[tempPlayerID] = res;

            // Change 3 from sub_8020F2C: COLL_FLAG_10000 not COLL_FLAG_8
            if (res & COLL_FLAG_10000) {
                if (Coll_DamagePlayer(p)) {
                    m4aSongNumStart(SE_171);
                }
            }
        }
    } else if (sp0C < 126) {
        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->movestateBuffer[tempPlayerID] & MOVESTATE_20) {
            p->moveState &= ~MOVESTATE_20;
            spikes->movestateBuffer[tempPlayerID] = 0;
        }

        s->graphics.anim = SA1_ANIM_SPIKES;
        s->variant = 1;
        UpdateSpriteAnimation(s);
    } else {
        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState |= MOVESTATE_IN_AIR;
        }

        if (spikes->movestateBuffer[tempPlayerID] & MOVESTATE_20) {
            p->moveState &= ~MOVESTATE_20;
            spikes->movestateBuffer[tempPlayerID] = 0;
        }

        s->graphics.anim = SA1_ANIM_SPIKES;
        s->variant = 0;
        UpdateSpriteAnimation(s);
    }

    return TRUE;
}

void TaskDestructor_Spikes(Task *t)
{
    Spikes *spikes = TASK_DATA(t);
    VramFree(spikes->s.graphics.dest);
}