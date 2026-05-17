#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/dust_cloud.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/mp_event_mgr.h"
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
    /* 0x3C */ u8 unk3C[2];
    /* 0x3E */ u8 unk3E;
    /* 0x3F */ u8 unk3F[2];
    /* 0x44 */ s32 unk44[2];
    /* 0x4C */ s32 unk4C[2];
    /* 0x54 */ s32 unk54;
    /* 0x58 */ s32 unk58;
    /* 0x5C */ s32 unk5C[2];
    /* 0x64 */ s32 unk64[2];
    /* 0x6C */ u8 unk6C;
} Track;

void Task_Track(void);

void CreateEntity_Track(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Track, sizeof(Track), me->d.uData[3] | 0x2000, 0, NULL);
    Track *track = TASK_DATA(t);

    track->base.regionX = regionX;
    track->base.regionY = regionY;
    track->base.me = me;
    track->base.meX = me->x;
    track->base.id = id;

    track->unk3E = me->d.uData[2];
    track->unk3F[0] = 0;
    track->unk44[0] = 0;
    track->unk4C[0] = 0;
    track->unk5C[0] = 0;
    track->unk64[0] = 0;
    track->unk3F[1] = 0;
    track->unk44[1] = 0;
    track->unk4C[1] = 0;
    track->unk5C[1] = 0;
    track->unk64[1] = 0;

    track->unk54 = me->d.sData[0] * TILE_WIDTH;
    track->unk58 = me->d.sData[1] * TILE_WIDTH;

    track->unk6C = 0;
    track->unk3C[0] = me->d.uData[3];
    track->unk3C[1] = me->d.uData[3];

    SET_MAP_ENTITY_INITIALIZED(me);
}

void Task_Track(void)
{
    CamCoord worldX, worldY;
    s16 screenX, screenY;
    Track *track = TASK_DATA(gCurTask);
    MapEntity *me = track->base.me;
    s32 i;

    worldX = TO_WORLD_POS(track->base.meX, track->base.regionX);
    worldY = TO_WORLD_POS(me->y, track->base.regionY);
    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;

    i = 0;
    do {
        if (GetBit(track->unk6C, i)) {
            if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
                if (PLAYER(i).SA2_LABEL(unk99)[0] == track->unk3C[i]) {
                    s32 resA, resB;
                    resA = Div(track->unk3F[i] * track->unk54, track->unk3E);
                    resB = Div(track->unk3F[i] * track->unk58, track->unk3E);

                    PLAYER(i).qWorldX = Q(track->unk44[i] + resA);
                    PLAYER(i).qWorldY = Q(track->unk4C[i] + resB);
                    PLAYER(i).qSpeedAirY = PLAYER(i).qWorldY - track->unk64[i];
                    PLAYER(i).qSpeedGround = PLAYER(i).qWorldX - track->unk5C[i];
                    PLAYER(i).qSpeedAirX = PLAYER(i).qSpeedGround;
                    track->unk3F[i]++;

                    if ((I(PLAYER(i).qWorldX) == track->unk44[i] + track->unk54)
                        && (I(PLAYER(i).qWorldY) == track->unk4C[i] + track->unk58)) {
                        if (PLAYER(i).SA2_LABEL(unk99)[0] == track->unk3C[i]) {
                            PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                            PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                            PLAYER(i).itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
                        }

                        ClearBit(track->unk6C, i);
                    } else {
                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                        PLAYER(i).moveState &= ~MOVESTATE_FACING_LEFT;
                        PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                        PLAYER(i).charState = CHARSTATE_SPINATTACK;

                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                        SetBit(track->unk6C, i);
                    }

                    track->unk5C[i] = PLAYER(i).qWorldX;
                    track->unk64[i] = PLAYER(i).qWorldY;

                } else {
                    ClearBit(track->unk6C, i);
                }
            } else {
                PLAYER(i).moveState &= ~MOVESTATE_100000;
                PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;

                ClearBit(track->unk6C, i);
            }
        } else {
            if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
                if (PLAYER(i).SA2_LABEL(unk99)[0] < track->unk3C[i] || track->unk3C[i] == 0) {
                    if ((worldX - 10 <= I(PLAYER(i).qWorldX)) && (worldX + 10 >= I(PLAYER(i).qWorldX))
                        && (worldY - 10 <= I(PLAYER(i).qWorldY)) && (worldY + 10 >= I(PLAYER(i).qWorldY))) {
                        track->unk3F[i] = 0;
                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                        PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                        PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                        PLAYER(i).qWorldX = Q(worldX);
                        PLAYER(i).qWorldY = Q(worldY);

                        track->unk44[i] = worldX;
                        track->unk4C[i] = worldY;

                        PLAYER(i).qSpeedAirY = Q(0);
                        PLAYER(i).qSpeedAirX = Q(0);
                        PLAYER(i).qSpeedGround = Q(0);
                        PLAYER(i).charState = CHARSTATE_SPINATTACK;

                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                        do {
                            // For matching
                            m4aSongNumStart(SE_202);
                        } while (0);

                        SetBit(track->unk6C, i);

                        PLAYER(i).SA2_LABEL(unk99)[0] = track->unk3C[i];
                        PLAYER(i).itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
                    }
                }
            } else {
                PLAYER(i).moveState &= ~MOVESTATE_100000;
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (!(track->unk6C & 0x3)) {
        if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, track->base.meX);
            TaskDestroy(gCurTask);
            return;
        }
    }
}