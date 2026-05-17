#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/collision.h"

#include "constants/sa1/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s8 unk3C;
} WallBumper;

void Task_WallBumper(void)
{
    WallBumper *bumper = TASK_DATA(gCurTask);
    MapEntity *me = bumper->base.me;
    s16 worldX, worldY;
    s32 i;

    worldX = TO_WORLD_POS(bumper->base.meX, bumper->base.regionX);
    worldY = TO_WORLD_POS(me->y, bumper->base.regionY);

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD) && worldX <= I(PLAYER(i).qWorldX)
            && worldX + me->d.uData[2] * TILE_WIDTH >= I(PLAYER(i).qWorldX) && worldY <= I(PLAYER(i).qWorldY)
            && worldY + me->d.uData[3] * TILE_WIDTH >= I(PLAYER(i).qWorldY)) {
            m4aSongNumStart(SE_BUMPER_B);
            PLAYER(i).moveState &= ~MOVESTATE_100;
            PLAYER(i).moveState |= MOVESTATE_IN_AIR;
            PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

            if (bumper->unk3C & 0x1) {
                PLAYER(i).qSpeedAirX = +Q(5);
            } else {
                PLAYER(i).qSpeedAirX = -Q(5);
            }

            // NOTE/BUG(?): Positive and negative are not the same!
            if (bumper->unk3C < 3) {
                PLAYER(i).qSpeedAirY = -Q(7);
            } else {
                PLAYER(i).qSpeedAirY = +Q(6);
            }

            if ((PLAYER(i).character == CHARACTER_TAILS) || (PLAYER(i).character == CHARACTER_KNUCKLES)) {

                if (PLAYER(i).SA2_LABEL(unk61)) {
                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).charState = 5;
                    PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;

                    PLAYERFN_SET_SHIFT_OFFSETS(&PLAYER(i), 6, 9);
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bumper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }
}

void CreateEntity_WallBumper(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_WallBumper, sizeof(WallBumper), 0x2000, 0, NULL);
    WallBumper *bumper = TASK_DATA(t);

    bumper->base.regionX = regionX;
    bumper->base.regionY = regionY;
    bumper->base.me = me;
    bumper->base.meX = me->x;
    bumper->base.id = id;

    bumper->unk3C = me->d.sData[0];

    SET_MAP_ENTITY_INITIALIZED(me);
}