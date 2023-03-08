#include "global.h"
#include "lib/m4a.h"
#include "game/entity.h"

#include "constants/songs.h"

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 spriteX;
    /* 0x09 */ u8 kind;
} Sprite_GrindRail;

#define INITIALIZE_RAIL(type)                                                           \
    initSprite_Interactable_GrindRail(me, spriteRegionX, spriteRegionY, spriteY, type)
#define INITIALIZE_RAIL_AIR(type)                                                       \
    initSprite_Interactable_GrindRail_Air(me, spriteRegionX, spriteRegionY, spriteY,    \
                                          type)

extern void initSprite_Interactable_GrindRail(MapEntity *me, u16 spriteRegionX,
                                              u16 spriteRegionY, u8 spriteY,
                                              u8 railType);

void sub_800FE38(void);
void sub_8010144(void);
void sub_8010464(void);

void initSprite_Interactable_GrindRail(MapEntity *me, u16 spriteRegionX,
                                       u16 spriteRegionY, u8 spriteY, u8 railType)
{
#ifdef NON_MATCHING
    struct Task *t = TaskCreate(sub_800FE38, sizeof(Sprite_GrindRail), 0x2010, 0, NULL);
    Sprite_GrindRail *rail = TaskGetStructPtr(t);
    rail->kind = railType;
    rail->regionX = spriteRegionX;
    rail->regionY = spriteRegionY;
    rail->me = me;
    rail->spriteX = me->x;
#else
    struct Task *t = TaskCreate(sub_800FE38, 10, 0x2010, 0, NULL);
    void *rail;
    {
        rail = TaskGetStructPtr(t);
        rail += 9;
        *(u8 *)rail = railType;
    }
    {
        rail = TaskGetStructPtr(t);
        rail += 4;
        *(u16 *)rail = spriteRegionX;
    }
    {
        rail = TaskGetStructPtr(t);
        rail += 6;
        *(u16 *)rail = spriteRegionY;
    }
    {
        MapEntity **rail = TaskGetStructPtr(t);
        rail++;
        rail--;
        *rail = me;
    }
    {
        u8 *rail = TaskGetStructPtr(t);
        rail += 8;
        *rail = me->x;
    }
#endif
    SET_MAP_ENTITY_INITIALIZED(me);
}

void initSprite_Interactable_GrindRail_Air(MapEntity *me, u16 spriteRegionX,
                                           u16 spriteRegionY, u8 spriteY, u8 railType)
{
#ifdef NON_MATCHING
    struct Task *t = TaskCreate(sub_8010144, sizeof(Sprite_GrindRail), 0x2010, 0, NULL);
    Sprite_GrindRail *rail = TaskGetStructPtr(t);
    rail->kind = railType;
    rail->regionX = spriteRegionX;
    rail->regionY = spriteRegionY;
    rail->me = me;
    rail->spriteX = me->x;
#else
    struct Task *t = TaskCreate(sub_8010144, 10, 0x2010, 0, NULL);
    void *rail;
    {
        rail = TaskGetStructPtr(t);
        rail += 9;
        *(u8 *)rail = railType;
    }
    {
        rail = TaskGetStructPtr(t);
        rail += 4;
        *(u16 *)rail = spriteRegionX;
    }
    {
        rail = TaskGetStructPtr(t);
        rail += 6;
        *(u16 *)rail = spriteRegionY;
    }
    {
        MapEntity **rail = TaskGetStructPtr(t);
        rail++;
        rail--;
        *rail = me;
    }
    {
        u8 *rail = TaskGetStructPtr(t);
        rail += 8;
        *rail = me->x;
    }
#endif
    SET_MAP_ENTITY_INITIALIZED(me);
}

// Delays the playback of the grinding sound by 60 frames
void CreateGrindrailAudioTask(void)
{
    struct Task *t = TaskCreate(sub_8010464, sizeof(u16), 0x2010, 0, NULL);
    u16 *audioTimer = TaskGetStructPtr(t);
    *audioTimer = 0;
}

void sub_8010464(void)
{
    u16 *audioTimer = TaskGetStructPtr(gCurTask);
    if (++(*audioTimer) > GBA_FRAMES_PER_SECOND) {
        m4aSongNumStart(SE_GRINDING);
        TaskDestroy(gCurTask);
    }
}

void initSprite_Interactable_GrindRail_StartAir(MapEntity *me, u16 spriteRegionX,
                                                u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL(2);
}

void initSprite_Interactable_GrindRail_End_ForcedJump(MapEntity *me, u16 spriteRegionX,
                                                      u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL(3);
}

void initSprite_Interactable_GrindRail_Start(MapEntity *me, u16 spriteRegionX,
                                             u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL(0);
}

void initSprite_Interactable_GrindRail_EndGround(MapEntity *me, u16 spriteRegionX,
                                                 u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL(1);
}

void initSprite_Interactable_GrindRail_EndAir(MapEntity *me, u16 spriteRegionX,
                                              u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL_AIR(2);
}

void initSprite_Interactable_GrindRail_EndAir_Left(MapEntity *me, u16 spriteRegionX,
                                                   u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL_AIR(3);
}

// Might be called "initSprite_Interactable_GrindRail_StartAir" instead?
void initSprite_Interactable_GrindRail_EndAlternate(MapEntity *me, u16 spriteRegionX,
                                                    u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL_AIR(0);
}

void initSprite_Interactable_GrindRail_EndGround_Left(MapEntity *me, u16 spriteRegionX,
                                                      u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL_AIR(1);
}
