#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C;
    /* 0x3D */ u8 unk3D;
    /* 0x3E */ u8 unk3E[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x40 */ u16 unk40[NUM_SINGLEPLAYER_CHARS_MAX];
} IA107;

void Task_Interactable107(void);
void TaskDestructor_SmallFallBlock(Task *t);

void CreateEntity_Interactable107(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t;
    IA107 *ia;
    s32 i;

    t = TaskCreate(Task_Interactable107, sizeof(IA107), 0x2000, 0, NULL);

    ia = TASK_DATA(t);

    ia->base.regionX = regionX;
    ia->base.regionY = regionY;
    ia->base.me = me;
    ia->base.meX = me->x;
    ia->base.id = id;

    ia->unk3C = 0;
    ia->unk3D = me->d.sData[0];

    i = 0;
    do {
        ia->unk3E[i] = 0;
        ia->unk40[i] = 0;
    } while (++i < gNumSingleplayerCharacters);

    SET_MAP_ENTITY_INITIALIZED(me);
}

void Task_Interactable107(void)
{
    IA107 *ia = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    s16 screenX, screenY;
    s16 sp10;
    s16 sp14;
    s32 sp18;
    MapEntity *me = ia->base.me;
    s32 i;

    worldX = TO_WORLD_POS(ia->base.meX, ia->base.regionX);
    worldY = TO_WORLD_POS(me->y, ia->base.regionY);

    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;

    i = 0;
    do {
        s16 theta;

        sp10 = 0;
        sp14 = 0;

        if (PLAYER(i).moveState & MOVESTATE_DEAD) {
            continue;
        }

        if (GetBit(ia->unk3C, i)) {
            if (ia->unk3D == 0) {
                sp18 = 4;

                if (PLAYER(i).frameInput & DPAD_RIGHT) {
                    sp10 = Q(9);
                } else if (PLAYER(i).frameInput & DPAD_DOWN) {
                    sp14 = Q(9);
                }
            } else if (ia->unk3D == 1) {
                sp18 = 0;

                if (PLAYER(i).frameInput & DPAD_RIGHT) {
                    sp10 = Q(7);
                    sp14 = Q(8);
                } else if (PLAYER(i).frameInput & DPAD_LEFT) {
                    sp10 = -Q(9);
                    sp14 = Q(7);
                }
            } else if (ia->unk3D == 2) {
                sp18 = 0;

                if (PLAYER(i).frameInput & DPAD_RIGHT) {
                    sp10 = Q(9);
                }
            } else if (ia->unk3D == 3) {
                sp18 = 0;

                if (PLAYER(i).frameInput & DPAD_DOWN) {
                    sp14 = Q(9);
                }
            }

            ia->unk40[i] += 4;

            if (ia->unk40[i] > SIN_PERIOD) {
                s32 theta = -SIN_PERIOD;
                ia->unk40[i] += theta;
            }

            PLAYER(i).qWorldX = Q(worldX) + Div(COS((ia->unk40[i] * 8) & ONE_CYCLE), 16);
            PLAYER(i).qWorldY = Q(worldY - sp18) + Div(SIN((ia->unk40[i] * 8) & ONE_CYCLE), 16);

            Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
            PLAYER(i).charState = CHARSTATE_SPINATTACK;
            PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
            PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
            PLAYER(i).moveState |= MOVESTATE_IN_AIR;
            PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;

            if (sp10 != 0 || sp14 != 0) {
                PLAYER(i).qWorldX = Q(worldX);
                PLAYER(i).qWorldY = Q(worldY);

                ia->unk3E[i] = 20;
                ClearBit(ia->unk3C, i);

                PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                PLAYER(i).rotation = 0;
                PLAYER(i).qSpeedAirY = sp14;
                PLAYER(i).qSpeedAirX = sp10;
                PLAYER(i).qSpeedGround = sp10;
            }
        } else if (ia->unk3E[i] > 0) {
            ia->unk3E[i]--;
        } else {
            if (((worldX - 10 <= I(PLAYER(i).qWorldX)) && (worldX + 10 >= I(PLAYER(i).qWorldX)))
                && ((worldY - 10 <= I(PLAYER(i).qWorldY)) && (worldY + 10 >= I(PLAYER(i).qWorldY)))) {
                PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;

                ia->unk40[i] = 0;
                PLAYER(i).qWorldX = Q(worldX);
                PLAYER(i).qWorldY = Q(worldY);

                PLAYER(i).qSpeedAirY = 0;
                PLAYER(i).qSpeedAirX = 0;
                PLAYER(i).qSpeedGround = 0;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                m4aSongNumStart(SE_SPRING);

                SetBit(ia->unk3C, i);
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if ((ia->unk3C & 0x3) == 0) {
        if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, ia->base.meX);
            TaskDestroy(gCurTask);
            return;
        }
    }
}