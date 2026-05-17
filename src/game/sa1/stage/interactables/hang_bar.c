#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/collision.h"
#include "game/sa1/stage/player_controls.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ u8 fillerC[0x30];
    /* 0x3C */ u8 isPlayerOnBits;
    /* 0x40 */ s32 qPlayerWorldX[NUM_SINGLEPLAYER_CHARS_MAX];
} HangBar;

void Task_HangBar(void);

const s8 sBarCharacterYOffsets[NUM_CHARACTERS] = { 16, 16, 16, 16 };

void Task_HangBar(void)
{
    HangBar *bar;
    CamCoord barX, barY;
    MapEntity *me;
    s32 i;

    bar = TASK_DATA(gCurTask);
    me = bar->base.me;

    // World Pos
    barX = TO_WORLD_POS(bar->base.meX, bar->base.regionX);
    barY = TO_WORLD_POS(me->y, bar->base.regionY);

    i = 0;
    do {
        if (GetBit(bar->isPlayerOnBits, i)) {
            if ((PLAYER(i).moveState & MOVESTATE_DEAD)) {
                ClearBit(bar->isPlayerOnBits, i);
                continue;
            }
            // _0808C0D8

            if (PLAYER(i).heldInput & DPAD_RIGHT) {
                PLAYER(i).charState = CHARSTATE_36;
                PLAYER(i).moveState &= ~MOVESTATE_FACING_LEFT;
                PLAYER(i).qWorldX = bar->qPlayerWorldX[i] + Q(2);
            } else if (PLAYER(i).heldInput & DPAD_LEFT) {
                // _0808C1AC
                PLAYER(i).charState = CHARSTATE_36;
                PLAYER(i).moveState |= MOVESTATE_FACING_LEFT;
                PLAYER(i).qWorldX = bar->qPlayerWorldX[i] - Q(2);
            } else {
                PLAYER(i).charState = CHARSTATE_35;
            }
            // _0808C1C6

            PLAYER(i).qWorldY = Q(barY + sBarCharacterYOffsets[PLAYER(i).character]);
            // _0808C206

            bar->qPlayerWorldX[i] = PLAYER(i).qWorldX;

            if ((PLAYER(i).frameInput & gPlayerControls.jump)
                || ((barX + (me->d.sData[0] * TILE_WIDTH) > I(PLAYER(i).qWorldX))
                    || (barX + (me->d.sData[0] * TILE_WIDTH) + (me->d.uData[2] * TILE_WIDTH) < I(PLAYER(i).qWorldX)))) {
                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                PLAYER(i).qSpeedAirY = Q(0);
                PLAYER(i).charState = CHARSTATE_SPINATTACK;

                PLAYER(i).qWorldY = Q(barY) + Q(22);
                PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                PLAYER(i).charState = CHARSTATE_18;
                PLAYER(i).itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

                if (PLAYER(i).heldInput & DPAD_RIGHT) {
                    PLAYER(i).qSpeedGround = +Q(2);
                    PLAYER(i).qSpeedAirX = +Q(2);
                } else if (PLAYER(i).heldInput & DPAD_LEFT) {
                    PLAYER(i).moveState |= MOVESTATE_FACING_LEFT;
                    PLAYER(i).qSpeedGround = -Q(2);
                    PLAYER(i).qSpeedAirX = -Q(2);
                } else {
                    PLAYER(i).qSpeedGround = Q(0);
                    PLAYER(i).qSpeedAirX = Q(0);
                }

                ClearBit(bar->isPlayerOnBits, i);
            }

        } else {
            if (PLAYER(i).moveState & MOVESTATE_DEAD) {
                continue;
            }

            if (PLAYER(i).qSpeedAirY > Q(0)) {
                if ((barX + (me->d.sData[0] * TILE_WIDTH) <= I(PLAYER(i).qWorldX))
                    && (barX + (me->d.sData[0] * TILE_WIDTH) + (me->d.uData[2] * TILE_WIDTH) >= I(PLAYER(i).qWorldX))
                    && (barY + (me->d.sData[1] * TILE_WIDTH) <= I(PLAYER(i).qWorldY))
                    && (barY + (me->d.sData[1] * TILE_WIDTH) + (me->d.uData[3] * TILE_WIDTH) >= I(PLAYER(i).qWorldY))) {
                    PLAYER(i).rotation = 0;
                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                    PLAYER(i).moveState &= ~MOVESTATE_IN_AIR;
                    PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                    PLAYER(i).itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;

                    if (PLAYER(i).heldInput & DPAD_RIGHT) {
                        PLAYER(i).charState = CHARSTATE_36;
                        PLAYER(i).moveState &= ~MOVESTATE_FACING_LEFT;
                    } else if (PLAYER(i).heldInput & DPAD_LEFT) {
                        PLAYER(i).charState = CHARSTATE_36;
                        PLAYER(i).moveState |= MOVESTATE_FACING_LEFT;
                    } else {
                        PLAYER(i).charState = CHARSTATE_35;
                    }

                    PLAYER(i).qWorldY = Q(barY) + Q(18);
                    SetBit(bar->isPlayerOnBits, i);
                    bar->qPlayerWorldX[i] = PLAYER(i).qWorldX;

                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if ((bar->isPlayerOnBits & ((1 << NUM_SINGLEPLAYER_CHARS_MAX) - 1)) == 0) {
        // Screen Pos
        barX -= gCamera.x;
        barY -= gCamera.y;

        if (IS_OUT_OF_CAM_RANGE(barX, barY)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, bar->base.meX);
            TaskDestroy(gCurTask);
            return;
        }
    }
}

void CreateEntity_HangBar(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_HangBar, sizeof(HangBar), 0x8000, 0, NULL);
    HangBar *bar = TASK_DATA(t);

    bar->base.regionX = regionX;
    bar->base.regionY = regionY;
    bar->base.me = me;
    bar->base.meX = me->x;
    bar->base.id = id;

    bar->isPlayerOnBits = 0;

    SET_MAP_ENTITY_INITIALIZED(me);
}
