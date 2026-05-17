#include "global.h"
#include "core.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/player.h"
#include "lib/m4a/m4a.h"

#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"

typedef struct {
    // SpriteBase-ish
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 meX;
    /* 0x09 */ u8 incline; // TODO: might just be the ID after all?
} InclineRamp;

#ifndef NON_MATCHING
#define INCLINE_RAMP_DATA_SIZE 0xA
#else
#define INCLINE_RAMP_DATA_SIZE sizeof(InclineRamp)
#endif

// (97.59%) https://decomp.me/scratch/SNEeF
NONMATCH("asm/non_matching/game/sa1/stage/interactables/Task_InclineRamp.inc", void Task_InclineRamp(void))
{
    InclineRamp *ramp = TASK_DATA(gCurTask);
    MapEntity *me = TASK_GET_MEMBER(InclineRamp, gCurTask, MapEntity *, me);
    u8 meX = TASK_GET_MEMBER(InclineRamp, gCurTask, u8, meX);

    u16 regionX = TASK_GET_MEMBER(InclineRamp, gCurTask, u16, regionX);
    u16 regionY = TASK_GET_MEMBER(InclineRamp, gCurTask, u16, regionY);
    u8 incline = TASK_GET_MEMBER(InclineRamp, gCurTask, u8, incline);
    s16 worldX, worldY;
    s16 screenX, screenY;
    s32 i;

    worldX = TO_WORLD_POS(meX, regionX);
    worldY = TO_WORLD_POS(me->y, regionY);

    i = 0;
    do {
        // _08075678_loop
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (worldX > I(PLAYER(i).qWorldX)) {
                continue;
            }
            // _080756E6

            if (worldX + me->d.uData[2] * TILE_WIDTH < I(PLAYER(i).qWorldX)) {
                continue;
            }

            if (worldY > I(PLAYER(i).qWorldY)) {
                continue;
            }

            if (worldY + me->d.uData[3] * TILE_WIDTH < I(PLAYER(i).qWorldY)) {
                continue;
            }

            if (incline != 0) {
                if (PLAYER(i).qSpeedAirX > Q(4)) {
                    PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                    PLAYER(i).moveState &= ~MOVESTATE_100;
                    PLAYER(i).moveState &= ~MOVESTATE_SPIN_ATTACK;

                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                    PLAYER(i).qSpeedAirY = -Q(8);
                    PLAYER(i).qSpeedAirX += +Q(4);

                    if (PLAYER(i).qSpeedAirX > Q(17)) {
                        PLAYER(i).qSpeedAirX = Q(17);
                    }
                    // _08075880

                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).charState = CHARSTATE_17;

                    m4aSongNumStart(SE_SPRING);
                    continue;
                }
            } else if (PLAYER(i).qSpeedAirX < -Q(4)) {
                // _080758AC
                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                PLAYER(i).moveState &= ~MOVESTATE_100;
                PLAYER(i).moveState &= ~MOVESTATE_SPIN_ATTACK;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                PLAYER(i).qSpeedAirY = -Q(8);
                PLAYER(i).qSpeedAirX += -Q(4);

                if (PLAYER(i).qSpeedAirX < -Q(17)) {
                    PLAYER(i).qSpeedAirX = -Q(17);
                }

                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                PLAYER(i).charState = CHARSTATE_17;

                m4aSongNumStart(SE_SPRING);
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;
    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        // _08075A54
        SET_MAP_ENTITY_NOT_INITIALIZED(me, meX);
        TaskDestroy(gCurTask);
        return;
    }
}
END_NONMATCH

void CreateEntity_InclineRamp(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_InclineRamp, INCLINE_RAMP_DATA_SIZE, 0x2000, 0, NULL);

    // *sigh*
    // Don't do this!
    TASK_SET_MEMBER(InclineRamp, t, u16, regionX, regionX);
    TASK_SET_MEMBER(InclineRamp, t, u16, regionY, regionY);
    TASK_SET_MEMBER(InclineRamp, t, MapEntity *, me, me);
    TASK_SET_MEMBER(InclineRamp, t, u8, incline, me->d.sData[0]);
    TASK_SET_MEMBER(InclineRamp, t, u8, meX, me->x);

    SET_MAP_ENTITY_INITIALIZED(me);
}
