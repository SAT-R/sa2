#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/stage/interactables/party_balloon.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/player.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"

void Task_PartyBalloon(void);
void Task_PartyBalloonPopped(void);
void TaskDestructor_PartyBalloon(Task *);

void CreateEntity_PartyBalloon(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_PartyBalloon, sizeof(PartyBalloon), 0x2000, 0, TaskDestructor_PartyBalloon);
    PartyBalloon *balloon = TASK_DATA(t);
    Sprite *s = &balloon->s;

    balloon->base.regionX = regionX;
    balloon->base.regionY = regionY;
    balloon->base.me = me;
    balloon->base.meX = me->x;
    balloon->base.id = id;

    balloon->unk3C = 0;
    balloon->unk40 = 0;

    // NOTE: Initializing sprite pos to world pos
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED_SIMPLE(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BALLOON_BLUE);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;

    switch (me->d.sData[0]) {
        case PBCOLOR_BLUE: {
            s->graphics.anim = SA1_ANIM_BALLOON_BLUE;
        } break;

        case PBCOLOR_RED: {
            s->graphics.anim = SA1_ANIM_BALLOON_RED;
        } break;

        case PBCOLOR_YELLOW: {
            s->graphics.anim = SA1_ANIM_BALLOON_YELLOW;
        } break;
    }

    s->variant = 0;
    SPRITE_INIT_SCRIPT(s, 1.0);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

// (99.96%) https://decomp.me/scratch/hdl15
NONMATCH("asm/non_matching/game/sa1/stage/interactables/Task_PartyBalloon.inc", void Task_PartyBalloon(void))
{
    PartyBalloon *balloon = TASK_DATA(gCurTask);
    Sprite *s = &balloon->s;
    MapEntity *me = balloon->base.me;
    CamCoord worldX, worldY;
    s32 i;
    s32 r9;

    worldX = TO_WORLD_POS(balloon->base.meX, balloon->base.regionX);
    worldY = TO_WORLD_POS(me->y, balloon->base.regionY);

    s->x = (worldX - gCamera.x);
    s->y = (worldY - gCamera.y);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, balloon->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    i = 0;
    do {
#ifndef NON_MATCHING
        asm("mov r0, #1\n"
            "mov %0, r0" ::"r"(r9));
#else
        r9 = 1;
#endif
    loopJmp:
        // _0807EFDE_loop
        if (Coll_Player_Entity_Intersection(s, worldX, worldY, &PLAYER(i))) {
            // _0807EFFA
            if (!(PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE)) {
                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                PLAYER(i).moveState &= ~MOVESTATE_100;
                PLAYER(i).moveState &= ~MOVESTATE_SPIN_ATTACK;
                PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                PLAYER(i).qSpeedAirY = -Q(6);
                PLAYER(i).charState = CHARSTATE_SPRING_B;

                if (i != 0) {
                    gPlayerBodyPSI.s.prevVariant = -1;
                } else {
                    gPartnerBodyPSI.s.prevVariant = -1;
                }

                balloon->unk40 = 0x21;
                s->prevVariant = -1;
                s->variant = r9;
                PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                m4aSongNumStart(SE_BALLOON_POP);
                gCurTask->main = Task_PartyBalloonPopped;

                if (IS_MULTI_PLAYER) {
                    RoomEvent_BalloonPopped *roomEvent = CreateRoomEvent();
                    s32 type = r9;
                    roomEvent->type = type;
                    roomEvent->x = balloon->base.regionX;
                    roomEvent->y = balloon->base.regionY;
                    roomEvent->id = balloon->base.id;
                    type = r9;
                    roomEvent->unk4 = type;
                }
            }
        }
        // _0807F1A0

        if (IS_MULTI_PLAYER && ((s8)me->x == -3)) {
            balloon->unk40 = 33;
            s->prevVariant = -1;
            s->variant = r9;

            m4aSongNumStart(SE_BALLOON_POP);
            gCurTask->main = Task_PartyBalloonPopped;
        }
    } while (++i < gNumSingleplayerCharacters);

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
END_NONMATCH

void Task_PartyBalloonPopped(void)
{
    PartyBalloon *balloon = TASK_DATA(gCurTask);
    Sprite *s = &balloon->s;
    MapEntity *me = balloon->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(balloon->base.meX, balloon->base.regionX);
    worldY = TO_WORLD_POS(me->y, balloon->base.regionY);

    s->x = (worldX - gCamera.x);
    s->y = (worldY - gCamera.y);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, balloon->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (--balloon->unk40 == 0) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, balloon->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void TaskDestructor_PartyBalloon(Task *t)
{
    PartyBalloon *balloon = TASK_DATA(t);
    VramFree(balloon->s.graphics.dest);
}