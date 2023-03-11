#include "global.h"
#include "lib/m4a.h"
#include "game/entity.h"

#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 spriteX;
    /* 0x09 */ u8 kind;
} Sprite_GrindRail;

#define RAIL_KIND_1 0x1
#define RAIL_KIND_2 0x2

#define StructMemberOffset(_struct, member)                                             \
    (((void *)&(_struct)->member) - (void *)&(_struct))
#define GetStructMember(type, _struct, member)                                          \
    {                                                                                   \
        /* TODO */                                                                      \
    }

#define INITIALIZE_RAIL(type)                                                           \
    initSprite_Interactable_GrindRail(me, spriteRegionX, spriteRegionY, spriteY, type)
#define INITIALIZE_RAIL_AIR(type)                                                       \
    initSprite_Interactable_GrindRail_Air(me, spriteRegionX, spriteRegionY, spriteY,    \
                                          type)

extern void initSprite_Interactable_GrindRail(MapEntity *me, u16 spriteRegionX,
                                              u16 spriteRegionY, u8 spriteY,
                                              u8 railType);

void Task_GrindRail(void);
void sub_8010464(void);

// https://decomp.me/scratch/Wvuov
NONMATCH("asm/non_matching/Task_GrindRail_Air.inc", void Task_GrindRail_Air(void))
{
    Player *player = &gPlayer;
    Sprite_GrindRail *rail = TaskGetStructPtr(gCurTask);
    MapEntity *me = rail->me;
    s32 right, bottom;
    u8 smolRight;
    s16 left, top;

    // This pointer madness seems to be necessary for matching
    u8 *pSpriteX = &rail->spriteX;
    u8 stackSpriteX = *pSpriteX;
    u16 *pRegX = &rail->regionX;
    u16 regionX = *pRegX;
    u16 *pRegY = &rail->regionY;
    u16 regionY = *pRegY;
    u8 *pRailKind = &rail->kind;
    u8 kind = *pRailKind;

    left = SpriteGetScreenPos(stackSpriteX, regionX);
    top = SpriteGetScreenPos(me->y, regionY);

    if (!(player->moveState & MOVESTATE_DEAD)) {
        // _080101AA
        s32 someX, someWidth, someY, otherY;
        right = (left + (me->d.uData[0] * TILE_WIDTH));

        if (right <= Q_24_8_TO_INT(player->x)) {
            someWidth = me->d.uData[2] * TILE_WIDTH;
            if ((right + someWidth) >= Q_24_8_TO_INT(player->x)) {

                someY = top + me->d.sData[1] * TILE_WIDTH;

                if (someY <= Q_24_8_TO_INT(player->y)) {

                    otherY = someY + me->d.uData[3] * TILE_WIDTH;
                    if (otherY >= Q_24_8_TO_INT(player->y)) {

                        // __080101FC
                        if ((player->moveState & MOVESTATE_1000000)) {

                            if (kind & RAIL_KIND_1) {
                                if ((gPlayer.moveState & MOVESTATE_FACING_LEFT)) {
                                    if (left < right + (someWidth >> 1)
                                        || ((player->unk5C & gPlayerControls.jump)
                                            && (kind & RAIL_KIND_2))) {
                                        if ((kind & RAIL_KIND_2))
                                            player->unk6D = 13;
                                        else
                                            player->unk6D = 12;
                                    }
                                }
                            }
                            if (!(kind & RAIL_KIND_1)) {
                                if (!(player->moveState & MOVESTATE_FACING_LEFT)) {
                                    s32 playerX = Q_24_8_TO_INT(player->x);
                                    s32 newLeft = left;
                                    newLeft += me->d.uData[0] * 8;
                                    newLeft += me->d.uData[2] * 4;

                                    if (playerX > newLeft
                                        || ((player->unk5C & gPlayerControls.jump)
                                            && (kind & RAIL_KIND_2))) {
                                        if ((kind & RAIL_KIND_2))
                                            player->unk6D = 13;
                                        else
                                            player->unk6D = 12;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    left -= gCamera.x;
    top -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(left, top)) {
        me->x = stackSpriteX;
        TaskDestroy(gCurTask);
    }
}
END_NONMATCH

void initSprite_Interactable_GrindRail(MapEntity *me, u16 spriteRegionX,
                                       u16 spriteRegionY, u8 spriteY, u8 railType)
{
#ifdef NON_MATCHING
    struct Task *t
        = TaskCreate(Task_GrindRail, sizeof(Sprite_GrindRail), 0x2010, 0, NULL);
    Sprite_GrindRail *rail = TaskGetStructPtr(t);
    rail->kind = railType;
    rail->regionX = spriteRegionX;
    rail->regionY = spriteRegionY;
    rail->me = me;
    rail->spriteX = me->x;
#else
    struct Task *t = TaskCreate(Task_GrindRail, 10, 0x2010, 0, NULL);
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
    struct Task *t
        = TaskCreate(Task_GrindRail_Air, sizeof(Sprite_GrindRail), 0x2010, 0, NULL);
    Sprite_GrindRail *rail = TaskGetStructPtr(t);
    rail->kind = railType;
    rail->regionX = spriteRegionX;
    rail->regionY = spriteRegionY;
    rail->me = me;
    rail->spriteX = me->x;
#else
    struct Task *t = TaskCreate(Task_GrindRail_Air, 10, 0x2010, 0, NULL);
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
