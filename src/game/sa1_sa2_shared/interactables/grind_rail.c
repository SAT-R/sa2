#include "global.h"
#include "core.h"

#include "game/stage/player_controls.h"
#include "game/entity.h"
#include "game/sa1_sa2_shared/interactables/grind_rail.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "lib/m4a/m4a.h"

#include "constants/songs.h"
#include "constants/player_transitions.h"

// Same def as SpriteBase
typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 spriteX;
    /* 0x09 */ u8 kind;
} Sprite_GrindRail;

#define RAIL_KIND_1  0x1
#define RAIL_KIND_2  0x2
#define RAIL_KIND_80 0x80

#define INITIALIZE_RAIL(type)     CreateEntity_GrindRail(me, spriteRegionX, spriteRegionY, spriteY, type)
#define INITIALIZE_RAIL_AIR(type) CreateEntity_GrindRail_Air(me, spriteRegionX, spriteRegionY, spriteY, type)

static void CreateEntity_GrindRail(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY, u8 railType);
static void GrindRailAudioDelay(void);

#if COLLECT_RINGS_ROM
// https://decomp.me/scratch/K8DDZ (97%)
// it logically matches, just some compiler side effects
NONMATCH("asm/non_matching/game/sa1_sa2_shared/interactables/Task_GrindRail_CollectRings.inc", void Task_GrindRail(void))
#else
static void Task_GrindRail(void)
#endif
{
    Player *p = &gPlayer;
#ifndef COLLECT_RINGS_ROM
    s32 r7 = GRAVITY_IS_INVERTED ? I(p->qWorldY) - p->spriteOffsetY : I(p->qWorldY) + p->spriteOffsetY;
#else
    s32 r7 = I(p->qWorldY) + p->spriteOffsetY;
#endif

    s16 x, y;

    Sprite_GrindRail *rail = TASK_DATA(gCurTask);
    MapEntity *me = rail->me;
    u8 *pSpriteX = &rail->spriteX;
    u8 stackSpriteX = *pSpriteX;
    u16 *pRegX = &rail->regionX;
    u16 regionX = *pRegX;
    u16 *pRegY = &rail->regionY;
    u16 regionY = *pRegY;
    u8 *pRailKind = &rail->kind;
    u8 kind = *pRailKind;

    x = TO_WORLD_POS(stackSpriteX, regionX);
    y = TO_WORLD_POS(me->y, regionY);

    if (!(p->moveState & MOVESTATE_DEAD)) {
        // TODO: create a collision macro for entity data
        if (((x + (me->d.sData[0] * TILE_WIDTH)) <= I(p->qWorldX)
             && ((x + (me->d.sData[0] * TILE_WIDTH)) + (me->d.uData[2] * TILE_WIDTH) >= I(p->qWorldX)))
            && (y + (me->d.sData[1] * TILE_WIDTH) <= r7 && y + (me->d.sData[1] * TILE_WIDTH) + (me->d.uData[3] * TILE_WIDTH) >= r7)) {
            bool32 r6 = FALSE;

#ifndef COLLECT_RINGS_ROM
            if (GRAVITY_IS_INVERTED) {
                if (r7 >= y)
                    r6 = TRUE;
            } else
#endif
            {
                if (r7 <= y)
                    r6 = TRUE;
            }
            if ((p->qSpeedAirY >= 0) && r6 && !(kind & RAIL_KIND_80)) {
                if ((p->moveState & MOVESTATE_1000000)) {
                    if ((!(kind & RAIL_KIND_1) && (p->moveState & MOVESTATE_FACING_LEFT)
                         && (I(p->qWorldX) < x + (me->d.sData[0] * TILE_WIDTH) + ((me->d.uData[2] * (TILE_WIDTH / 2)))
                             || ((p->heldInput & gPlayerControls.jump) && (kind & RAIL_KIND_2))))) {
                        if ((kind & RAIL_KIND_2)) {
                            p->transition = PLTRANS_GRIND_RAIL_END_AIR;

                        } else {
                            p->transition = PLTRANS_GRIND_RAIL_END_GROUND;
                        }
                        *(u8 *)(TASK_DATA(gCurTask) + offsetof(Sprite_GrindRail, kind)) |= RAIL_KIND_80;
                    } else if ((kind & RAIL_KIND_1) && !(p->moveState & MOVESTATE_FACING_LEFT)
                               && (I(p->qWorldX) > x + (me->d.sData[0] * TILE_WIDTH) + ((me->d.uData[2] * (TILE_WIDTH / 2)))
                                   || ((p->heldInput & gPlayerControls.jump) && (kind & RAIL_KIND_2)))) {
                        if ((kind & RAIL_KIND_2)) {
                            p->transition = PLTRANS_GRIND_RAIL_END_AIR;
                        } else {
                            p->transition = PLTRANS_GRIND_RAIL_END_GROUND;
                        }
                        *(u8 *)(TASK_DATA(gCurTask) + offsetof(Sprite_GrindRail, kind)) |= RAIL_KIND_80;
                    }
                } else if (((kind & RAIL_KIND_1)
                            && Q_24_8_TO_INT(p->qWorldX) < (x + (me->d.sData[0] * TILE_WIDTH)) + ((me->d.uData[2] * (TILE_WIDTH / 2))))
                           || (!(kind & RAIL_KIND_1)
                               && Q_24_8_TO_INT(p->qWorldX)
                                   > (x + (me->d.sData[0] * TILE_WIDTH)) + ((me->d.uData[2] * (TILE_WIDTH / 2))))) {
                    p->transition = PLTRANS_GRINDING;
                    p->unk6E = 0;

                    if (kind & RAIL_KIND_1)
                        p->unk6E = 1;
                }
            }
            // BUG: this should not be set if it was set to RAIL_KIND_80 above
            *(u8 *)(TASK_DATA(gCurTask) + offsetof(Sprite_GrindRail, kind)) &= ~RAIL_KIND_80;
        } else {
            *(u8 *)(TASK_DATA(gCurTask) + offsetof(Sprite_GrindRail, kind)) &= ~RAIL_KIND_80;
        }
    }

    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(x, y)) {
        me->x = stackSpriteX;
        TaskDestroy(gCurTask);
    }
}
#if COLLECT_RINGS_ROM
END_NONMATCH
#endif

static void Task_GrindRail_Air(void)
{
    Player *p = &gPlayer;
    Sprite_GrindRail *rail = TASK_DATA(gCurTask);
    MapEntity *me = rail->me;

    // This pointer madness seems to be necessary for matching
    u8 *pSpriteX = &rail->spriteX;
    u8 stackSpriteX = *pSpriteX;
    u16 *pRegX = &rail->regionX;
    u16 regionX = *pRegX;
    u16 *pRegY = &rail->regionY;
    u16 regionY = *pRegY;
    u8 *pRailKind = &rail->kind;
    u8 kind = *pRailKind;
    s16 x;
    s16 y;

    x = TO_WORLD_POS(stackSpriteX, regionX);
    y = TO_WORLD_POS(me->y, regionY);

    if (!(p->moveState & MOVESTATE_DEAD)) {
        if ((x + (me->d.sData[0] * TILE_WIDTH) <= I(p->qWorldX)
             && (x + (me->d.sData[0] * TILE_WIDTH) + (me->d.uData[2] * TILE_WIDTH) >= I(p->qWorldX)))
            && (y + (me->d.sData[1] * TILE_WIDTH) <= I(p->qWorldY)
                && y + (me->d.sData[1] * TILE_WIDTH) + (me->d.uData[3] * TILE_WIDTH) >= I(p->qWorldY))) {

            if ((p->moveState & MOVESTATE_1000000)) {
                if (((kind & RAIL_KIND_1) && (p->moveState & MOVESTATE_FACING_LEFT)
                     && (I(p->qWorldX) < x + (me->d.sData[0] * TILE_WIDTH) + ((me->d.uData[2] * TILE_WIDTH) >> 1)
                         || ((p->heldInput & gPlayerControls.jump) && (kind & RAIL_KIND_2))))) {
                    if ((kind & RAIL_KIND_2)) {
                        p->transition = PLTRANS_GRIND_RAIL_END_AIR;

                    } else
                        p->transition = PLTRANS_GRIND_RAIL_END_GROUND;
                } else if (!(kind & RAIL_KIND_1) && !(p->moveState & MOVESTATE_FACING_LEFT)
                           && (I(p->qWorldX) > x + (me->d.sData[0] * TILE_WIDTH) + ((me->d.uData[2] * TILE_WIDTH) >> 1)
                               || ((p->heldInput & gPlayerControls.jump) && (kind & RAIL_KIND_2)))) {
                    if ((kind & RAIL_KIND_2)) {
                        p->transition = PLTRANS_GRIND_RAIL_END_AIR;
                    } else
                        p->transition = PLTRANS_GRIND_RAIL_END_GROUND;
                }
            }
        }
    }

    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(x, y)) {
        me->x = stackSpriteX;
        TaskDestroy(gCurTask);
    }
}

static void CreateEntity_GrindRail(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY, u8 railType)
{
#ifdef NON_MATCHING
    struct Task *t = TaskCreate(Task_GrindRail, sizeof(Sprite_GrindRail), 0x2010, 0, NULL);
    Sprite_GrindRail *rail = TASK_DATA(t);
    rail->kind = railType;
    rail->regionX = spriteRegionX;
    rail->regionY = spriteRegionY;
    rail->me = me;
    rail->spriteX = me->x;
#else
    struct Task *t = TaskCreate(Task_GrindRail, 10, 0x2010, 0, NULL);
    void *rail;
    {
        rail = TASK_DATA(t);
        rail += 9;
        *(u8 *)rail = railType;
    }
    {
        rail = TASK_DATA(t);
        rail += 4;
        *(u16 *)rail = spriteRegionX;
    }
    {
        rail = TASK_DATA(t);
        rail += 6;
        *(u16 *)rail = spriteRegionY;
    }
    {
        MapEntity **rail = TASK_DATA(t);
        rail++;
        rail--;
        *rail = me;
    }
    {
        u8 *rail = TASK_DATA(t);
        rail += 8;
        *rail = me->x;
    }
#endif
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void CreateEntity_GrindRail_Air(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY, u8 railType)
{
#ifdef NON_MATCHING
    struct Task *t = TaskCreate(Task_GrindRail_Air, sizeof(Sprite_GrindRail), 0x2010, 0, NULL);
    Sprite_GrindRail *rail = TASK_DATA(t);
    rail->kind = railType;
    rail->regionX = spriteRegionX;
    rail->regionY = spriteRegionY;
    rail->me = me;
    rail->spriteX = me->x;
#else
    struct Task *t = TaskCreate(Task_GrindRail_Air, 10, 0x2010, 0, NULL);
    void *rail;
    {
        rail = TASK_DATA(t);
        rail += 9;
        *(u8 *)rail = railType;
    }
    {
        rail = TASK_DATA(t);
        rail += 4;
        *(u16 *)rail = spriteRegionX;
    }
    {
        rail = TASK_DATA(t);
        rail += 6;
        *(u16 *)rail = spriteRegionY;
    }
    {
        MapEntity **rail = TASK_DATA(t);
        rail++;
        rail--;
        *rail = me;
    }
    {
        u8 *rail = TASK_DATA(t);
        rail += 8;
        *rail = me->x;
    }
#endif
    SET_MAP_ENTITY_INITIALIZED(me);
}

// Delays the playback of the grinding sound by 60 frames
UNUSED static void CreateGrindrailAudioTask(void)
{
    struct Task *t = TaskCreate(GrindRailAudioDelay, sizeof(u16), 0x2010, 0, NULL);
    u16 *audioTimer = TASK_DATA(t);
    *audioTimer = 0;
}

static void GrindRailAudioDelay(void)
{
    u16 *audioTimer = TASK_DATA(gCurTask);
    if (++(*audioTimer) > GBA_FRAMES_PER_SECOND) {
        m4aSongNumStart(SE_GRINDING);
        TaskDestroy(gCurTask);
    }
}

// Enables not only from air, but when running on water aswell
void CreateEntity_GrindRail_StartAir(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY) { INITIALIZE_RAIL(2); }

void CreateEntity_GrindRail_End_ForcedJump(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY) { INITIALIZE_RAIL(3); }

void CreateEntity_GrindRail_Start(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY) { INITIALIZE_RAIL(0); }

void CreateEntity_GrindRail_EndGround(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY) { INITIALIZE_RAIL(1); }

void CreateEntity_GrindRail_EndAir(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY) { INITIALIZE_RAIL_AIR(2); }

void CreateEntity_GrindRail_EndAir_Left(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY) { INITIALIZE_RAIL_AIR(3); }

// Might be called "CreateEntity_GrindRail_StartAir" instead?
void CreateEntity_GrindRail_EndAlternate(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY) { INITIALIZE_RAIL_AIR(0); }

void CreateEntity_GrindRail_EndGround_Left(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY) { INITIALIZE_RAIL_AIR(1); }
