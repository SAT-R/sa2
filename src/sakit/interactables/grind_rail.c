#include "global.h"
#include "core.h"

#include "game/player_controls.h"
#include "game/entity.h"
#include "sakit/interactables/grind_rail.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "lib/m4a.h"

#include "constants/songs.h"
#include "constants/player_transitions.h"

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

#define INITIALIZE_RAIL(type)                                                           \
    CreateEntity_GrindRail(me, spriteRegionX, spriteRegionY, spriteY, type)
#define INITIALIZE_RAIL_AIR(type)                                                       \
    CreateEntity_GrindRail_Air(me, spriteRegionX, spriteRegionY, spriteY, type)

extern void CreateEntity_GrindRail(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                   u8 spriteY, u8 railType);

void Task_GrindRail(void);
void sub_8010464(void);

// (79.90%) https://decomp.me/scratch/ncgh4
NONMATCH("asm/non_matching/sakit/interactables/Task_GrindRail.inc",
         void Task_GrindRail(void))
{
    Player *player = &gPlayer;

    s32 r7 = GRAVITY_IS_INVERTED ? Q_24_8_TO_INT(player->y) - player->unk17
                                 : Q_24_8_TO_INT(player->y) + player->unk17;

    // _0800FE78
    Sprite_GrindRail *rail = TASK_DATA(gCurTask);
    MapEntity *me = rail->me;
    u8 *pSpriteX = &rail->spriteX;
    u8 stackSpriteX = *pSpriteX;
    u16 *pRegX = &rail->regionX;
    u16 regionX = *pRegX;
    u16 *pRegY = &rail->regionY;
    u16 regionY = *pRegY;
    u8 *pRailKind = &rail->kind;
    u8 railKind = *pRailKind;
    s16 posX = TO_WORLD_POS(stackSpriteX, regionX);
    s16 posY = TO_WORLD_POS(me->y, regionY);

    if (!(player->moveState & MOVESTATE_DEAD)) {
        void *newRail; // for matching
        s32 left = posX + me->d.sData[0] * TILE_WIDTH;
        if ((left <= Q_24_8_TO_INT(player->x))
            && (left + me->d.uData[2] * TILE_WIDTH >= Q_24_8_TO_INT(player->x))
            && ((posY + me->d.sData[1] * TILE_WIDTH) <= r7)
            && (((posY + me->d.sData[1] * TILE_WIDTH) + me->d.uData[3] * TILE_WIDTH)
                >= r7)) {
            bool32 r6 = FALSE;

            if (GRAVITY_IS_INVERTED) {
                if (r7 >= posX)
                    r6 = TRUE;
            } else {
                if (r7 <= posX)
                    r6 = TRUE;
            }
            //_0800FF52
            if ((player->speedAirY >= 0) && (r6) && !(railKind & RAIL_KIND_80)) {
                // _0800FF6E
                if (player->moveState & MOVESTATE_1000000) {
                    if (!(railKind & RAIL_KIND_1)) {
                        if (player->moveState & MOVESTATE_FACING_LEFT) {
                            s32 newPlayerX = Q_24_8_TO_INT(player->x);
                            s32 width = me->d.sData[0] * TILE_WIDTH;
                            s32 r0 = width + me->d.uData[2] * 4;
                            if (newPlayerX >= r0) {
                                if ((!(player->unk5C & gPlayerControls.jump)
                                     || !(railKind & RAIL_KIND_2))
                                    && !(railKind & RAIL_KIND_1))
                                    goto _080100B0;
                            }
                            // _0800FFB8
                            if ((railKind & RAIL_KIND_2))
                                player->transition = PLTRANS_PT13;
                            else
                                player->transition = PLTRANS_PT12;

                            {
                                newRail = TASK_DATA(gCurTask);
                                newRail += 9;
                                *(u8 *)newRail |= RAIL_KIND_80;
                                // goto _080100B0; // This is supposed to go here, but
                                // the optimizer kicks in
                            }
                        }
                        if (!(railKind & RAIL_KIND_1)) {
                            goto _080100B0;
                        }
                    }
                    // _0800FFF0
                    if (!(player->moveState & MOVESTATE_FACING_LEFT)) {
                        s32 playerX = Q_24_8_TO_INT(player->x);
                        s32 rightP = posX + me->d.sData[0] * TILE_WIDTH;
                        rightP += me->d.uData[2] * 4;
                        if (playerX <= rightP) {
                            if ((!(player->unk5C & gPlayerControls.jump))
                                || !(railKind & RAIL_KIND_2))
                                goto _080100B0;
                        }
                        // _08010028

                        if ((railKind & RAIL_KIND_2))
                            player->transition = PLTRANS_PT13;
                        else
                            player->transition = PLTRANS_PT12;

                        // _0801004E
                        {
                            void *newRail = TASK_DATA(gCurTask);
                            newRail += 9;
                            *(u8 *)newRail |= RAIL_KIND_80;
                        }
                    }
                } else {
                    // _08010060
                    if (railKind & RAIL_KIND_1) {
                        s32 playerX = Q_24_8_TO_INT(player->x);
                        s32 rightP = posX + me->d.sData[0] * TILE_WIDTH;
                        rightP += me->d.uData[2] * 4;
                        if (playerX < rightP)
                            goto _08010096;
                        else
                            goto _080100B0;
                    } else {
                        // _08010080
                        s32 playerX = Q_24_8_TO_INT(player->x);
                        s32 rightP = posX + me->d.sData[0] * TILE_WIDTH;
                        rightP += me->d.uData[2] * 4;
                        if (playerX <= rightP)
                            goto _080100B0;
                    }
                _08010096:
                    player->transition = 11;
                    player->unk6E = 0;

                    if (railKind & RAIL_KIND_1)
                        player->unk6E = 1;
                }
            }

        _080100B0 : {
            void *newRail;
            {
                newRail = TASK_DATA(gCurTask);
                newRail += 9;
                *(u8 *)newRail &= 0x7F;
            }
        }
        } else {
            // _080100C4
            void *newRail;
            newRail = TASK_DATA(gCurTask);
            newRail += 9;
            *(u8 *)newRail &= 0x7F;
        }
    }
    // _080100D6
    posX -= gCamera.x;
    posY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(posX, posY)) {
        me->x = rail->spriteX;
        TaskDestroy(gCurTask);
    }
}
END_NONMATCH

// (87.88%) https://decomp.me/scratch/Wvuov
NONMATCH("asm/non_matching/sakit/interactables/Task_GrindRail_Air.inc",
         void Task_GrindRail_Air(void))
{
    Player *player = &gPlayer;
    Sprite_GrindRail *rail = TASK_DATA(gCurTask);
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

    left = TO_WORLD_POS(stackSpriteX, regionX);
    top = TO_WORLD_POS(me->y, regionY);

    if (!(player->moveState & MOVESTATE_DEAD)) {
        // _080101AA
        s32 someX, someWidth, someY, otherY;
        right = (left + (me->d.sData[0] * TILE_WIDTH));

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
                                            player->transition = PLTRANS_PT13;
                                        else
                                            player->transition = PLTRANS_PT12;
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
                                            player->transition = PLTRANS_PT13;
                                        else
                                            player->transition = PLTRANS_PT12;
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

void CreateEntity_GrindRail(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                            u8 spriteY, u8 railType)
{
#ifdef NON_MATCHING
    struct Task *t
        = TaskCreate(Task_GrindRail, sizeof(Sprite_GrindRail), 0x2010, 0, NULL);
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

void CreateEntity_GrindRail_Air(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY, u8 railType)
{
#ifdef NON_MATCHING
    struct Task *t
        = TaskCreate(Task_GrindRail_Air, sizeof(Sprite_GrindRail), 0x2010, 0, NULL);
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
void CreateGrindrailAudioTask(void)
{
    struct Task *t = TaskCreate(sub_8010464, sizeof(u16), 0x2010, 0, NULL);
    u16 *audioTimer = TASK_DATA(t);
    *audioTimer = 0;
}

void sub_8010464(void)
{
    u16 *audioTimer = TASK_DATA(gCurTask);
    if (++(*audioTimer) > GBA_FRAMES_PER_SECOND) {
        m4aSongNumStart(SE_GRINDING);
        TaskDestroy(gCurTask);
    }
}

// Enables not only from air, but when running on water aswell
void CreateEntity_GrindRail_StartAir(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                     u8 spriteY)
{
    INITIALIZE_RAIL(2);
}

void CreateEntity_GrindRail_End_ForcedJump(MapEntity *me, u16 spriteRegionX,
                                           u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL(3);
}

void CreateEntity_GrindRail_Start(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    INITIALIZE_RAIL(0);
}

void CreateEntity_GrindRail_EndGround(MapEntity *me, u16 spriteRegionX,
                                      u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL(1);
}

void CreateEntity_GrindRail_EndAir(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                   u8 spriteY)
{
    INITIALIZE_RAIL_AIR(2);
}

void CreateEntity_GrindRail_EndAir_Left(MapEntity *me, u16 spriteRegionX,
                                        u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL_AIR(3);
}

// Might be called "CreateEntity_GrindRail_StartAir" instead?
void CreateEntity_GrindRail_EndAlternate(MapEntity *me, u16 spriteRegionX,
                                         u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL_AIR(0);
}

void CreateEntity_GrindRail_EndGround_Left(MapEntity *me, u16 spriteRegionX,
                                           u16 spriteRegionY, u8 spriteY)
{
    INITIALIZE_RAIL_AIR(1);
}
