#include "global.h"
#include "core.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ u8 fillerC[0x30];
    /* 0x3C */ s8 type;
} ConveyorBeltMvt;

void Task_ConveyorBeltMvt(void);
void Task_SlowingSnow(void);

#define CONVEYOR_BELT_SPEED (0.625)

void Task_ConveyorBeltMvt(void)
{
    ConveyorBeltMvt *mvt = TASK_DATA(gCurTask);
    CamCoord x, y;
    MapEntity *me = mvt->base.me;
    s32 res;
    s32 qRes;
    s32 i;

    // x/y: World-Pos
    x = TO_WORLD_POS(mvt->base.meX, mvt->base.regionX);
    y = TO_WORLD_POS(me->y, mvt->base.regionY);

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if ((x <= I(PLAYER(i).qWorldX)) && (x + me->d.uData[2] * TILE_WIDTH >= I(PLAYER(i).qWorldX)) && (y <= I(PLAYER(i).qWorldY))
                && (y + me->d.uData[3] * TILE_WIDTH >= I(PLAYER(i).qWorldY)) && !(PLAYER(i).moveState & MOVESTATE_IN_AIR)) {
                if (mvt->type != 0) {
                    PLAYER(i).qWorldX += Q(CONVEYOR_BELT_SPEED);

                    res = SA2_LABEL(sub_801F100)(I(PLAYER(i).qWorldX) + 8, I(PLAYER(i).qWorldY), PLAYER(i).layer, +8,
                                                 SA2_LABEL(sub_801EB44));

                    if (res < 0) {
                        qRes = Q(SA2_LABEL(sub_801F100)(I(PLAYER(i).qWorldX) + 8, I(PLAYER(i).qWorldY), PLAYER(i).layer, +8,
                                                        SA2_LABEL(sub_801EB44)));
                        PLAYER(i).qWorldX += qRes;
                    }
                } else {
                    PLAYER(i).qWorldX -= Q(CONVEYOR_BELT_SPEED);
                }

                res = (SA2_LABEL(sub_801F100)(I(PLAYER(i).qWorldX) - 8, I(PLAYER(i).qWorldY), PLAYER(i).layer, -8, SA2_LABEL(sub_801EB44)));

                if (res < 0) {
                    qRes = Q(SA2_LABEL(sub_801F100)(I(PLAYER(i).qWorldX) - 8, I(PLAYER(i).qWorldY), PLAYER(i).layer, -8,
                                                    SA2_LABEL(sub_801EB44)));

                    if (i != 0) {
                        PLAYER(i).qWorldX -= qRes;
                    } else {
                        PLAYER(i).qWorldX -= qRes;
                    }
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    // x/y: Screen-Pos
    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(x, y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mvt->base.meX);

        TaskDestroy(gCurTask);
        return;
    }
}

void Task_SlowingSnow(void)
{
    ConveyorBeltMvt *mvt = TASK_DATA(gCurTask);
    MapEntity *me = mvt->base.me;
    CamCoord x, y;
    s32 i;

    // x/y: World-Pos
    x = TO_WORLD_POS(mvt->base.meX, mvt->base.regionX);
    y = TO_WORLD_POS(me->y, mvt->base.regionY);

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if ((x <= I(PLAYER(i).qWorldX)) && (x + me->d.uData[2] * TILE_WIDTH >= I(PLAYER(i).qWorldX)) && (y <= I(PLAYER(i).qWorldY))
                && (y + me->d.uData[3] * TILE_WIDTH >= I(PLAYER(i).qWorldY)) && !(PLAYER(i).moveState & MOVESTATE_IN_AIR)) {
                // Reduce Player's speed by 5% each frame
                s32 qSpeed = Div(PLAYER(i).qSpeedGround * 95, 100);
                PLAYER(i).qSpeedGround = qSpeed;
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    // x/y: Screen-Pos
    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(x, y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, mvt->base.meX);

        TaskDestroy(gCurTask);
        return;
    }
}

void CreateEntity_ConveyorBelt(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t;
    ConveyorBeltMvt *mvt;
    u8 zone;

    zone = LEVEL_TO_ZONE(gCurrentLevel);
    if (zone == ZONE_4) {
        t = TaskCreate(Task_SlowingSnow, sizeof(ConveyorBeltMvt), 0x2000, 0, NULL);
    } else {
        t = TaskCreate(Task_ConveyorBeltMvt, sizeof(ConveyorBeltMvt), 0x2000, 0, NULL);
    }

    mvt = TASK_DATA(t);

    mvt->base.regionX = regionX;
    mvt->base.regionY = regionY;
    mvt->base.me = me;
    mvt->base.meX = me->x;
    mvt->base.id = id;
    mvt->type = me->d.sData[0];

    SET_MAP_ENTITY_INITIALIZED(me);
}