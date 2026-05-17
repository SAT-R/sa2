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
#include "constants/sa1/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ u8 fillerC[0x30];
    /* 0x3C */ s16 v1x;
    /* 0x3E */ s16 v1y;
    /* 0x40 */ s16 unk40;
    /* 0x42 */ s16 unk42;
    /* 0x44 */ s16 unk44;
    /* 0x46 */ u16 v2x;
    /* 0x48 */ u16 v2y;
} TeleportOrb;

void Task_TeleportOrb(void);

void CreateEntity_TeleportOrb(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_TeleportOrb, sizeof(TeleportOrb), 0x2000, 0, NULL);
    TeleportOrb *orb = TASK_DATA(t);

    orb->base.regionX = regionX;
    orb->base.regionY = regionY;
    orb->base.me = me;
    orb->base.meX = me->x;
    orb->base.id = id;

    orb->v1x = Q(me->d.sData[0]);
    orb->v1y = Q(me->d.sData[1]);
    orb->v2x = Q(me->d.uData[2]);
    orb->v2y = Q(me->d.uData[3]);

    orb->unk40 = 0;
    orb->unk42 = 0;
    orb->unk44 = 0;

    SET_MAP_ENTITY_INITIALIZED(me);
}

// (98.15%) https://decomp.me/scratch/HjIjG
NONMATCH("asm/non_matching/game/sa1/stage/interactables/TeleportOrb__Task_TeleportOrb.inc", void Task_TeleportOrb(void))
{
    TeleportOrb *orb = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;
    s16 screenX, screenY;
    MapEntity *me;
    s32 i;

    me = orb->base.me;

    worldX = TO_WORLD_POS(orb->base.meX, orb->base.regionX);
    worldY = TO_WORLD_POS(me->y, orb->base.regionY);

    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;

    i = 0;
    do {
        if (GetBit(orb->unk44, i)) {
            // _08084A64
            if ((gCamera.x == orb->unk40 && gCamera.y == orb->unk42) && (gCamera.x <= I(PLAYER(i).qWorldX))
                && (gCamera.x + DISPLAY_WIDTH >= I(PLAYER(i).qWorldX)) && (gCamera.y <= I(PLAYER(i).qWorldY))
                && (gCamera.y + DISPLAY_HEIGHT >= I(PLAYER(i).qWorldY))) {
                // _08084AF0
                PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                ClearBit(orb->unk44, i);
                PLAYER(i).qSpeedAirY = Q(0);
                PLAYER(i).qSpeedAirX = Q(0);
                PLAYER(i).qSpeedGround = Q(0);
                PLAYER(i).itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
            } else {
                // _08084B72
                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                PLAYER(i).qSpeedAirY = Q(0);
                PLAYER(i).qSpeedAirX = Q(0);
                PLAYER(i).qSpeedGround = Q(0);
                PLAYER(i).charState = CHARSTATE_SPINATTACK;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                SetBit(orb->unk44, i);
            }
            // _08084C1A

            if ((PLAYER(i).moveState & MOVESTATE_DEAD)) {
                ClearBit(orb->unk44, i);
                PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;

                if (PLAYER(i).playerID == PLAYER_1) {
                    PLAYER(i).qWorldY = Q(gCamera.y + DISPLAY_CENTER_Y);
                    PLAYER(i).qWorldX = Q(gCamera.x + DISPLAY_CENTER_X);
                    gCamera.SA2_LABEL(unkC) = 0;
                    gCamera.SA2_LABEL(unk8) = 0;
                }
            }
            // _08084CB8

            orb->unk40 = gCamera.x;
            orb->unk42 = gCamera.y;
        } else /* !GetBit(orb->unk44, i) */ {
            // _08084CCC
            if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
                if ((worldX - 12 <= I(PLAYER(i).qWorldX)) && (worldX + 12 >= I(PLAYER(i).qWorldX)) && (worldY - 12 <= I(PLAYER(i).qWorldY))
                    && (worldY + 12 >= I(PLAYER(i).qWorldY))) {
                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                    PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;

                    PLAYER(i).qWorldX = Q(orb->v1x) + orb->v2x;
                    PLAYER(i).qWorldY = Q(orb->v1y) + orb->v2y;
                    PLAYER(i).qSpeedAirY = Q(0);
                    PLAYER(i).qSpeedAirX = Q(0);
                    PLAYER(i).qSpeedGround = Q(0);
                    PLAYER(i).charState = CHARSTATE_SPINATTACK;

                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                    m4aSongNumStart(SE_SPRING);
                    SetBit(orb->unk44, i);
                    PLAYER(i).itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;

                    orb->unk40 = gCamera.x;
                    orb->unk42 = gCamera.y;
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (!(orb->unk44 & 0x3)) {
        if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, orb->base.meX);
            TaskDestroy(gCurTask);
            return;
        }
    }
}
END_NONMATCH