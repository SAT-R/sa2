#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"

typedef struct {
    SpriteBase base;
    Sprite s;
} SpringHiding;

void Task_Spring_Hiding(void);
void Task_8095158(void);
bool32 sub_8095224(SpringHiding *spring, Sprite *s, s32 worldX, s32 worldY);
void TaskDestructor_Spring_Hiding(Task *t);

void CreateEntity_Spring_Hiding(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Spring_Hiding, sizeof(SpringHiding), 0x2000, 0, TaskDestructor_Spring_Hiding);
    SpringHiding *spring = TASK_DATA(t);
    Sprite *s = &spring->s;

    spring->base.regionX = regionX;
    spring->base.regionY = regionY;
    spring->base.me = me;
    spring->base.meX = me->x;
    spring->base.id = id;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPRING);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_SPRING;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

void Task_Spring_Hiding(void)
{
    SpringHiding *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(spring->base.meX, spring->base.regionX);
    worldY = TO_WORLD_POS(me->y, spring->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (sub_8095224(spring, s, worldX, worldY)) {
        gCurTask->main = Task_8095158;
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }
}

void Task_8095158(void)
{
    SpringHiding *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(spring->base.meX, spring->base.regionX);
    worldY = TO_WORLD_POS(me->y, spring->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    sub_8095224(spring, s, worldX, worldY);

    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        s->variant = 0;
        UpdateSpriteAnimation(s);
        gCurTask->main = Task_Spring_Hiding;
    }

    DisplaySprite(s);
}

// (93.31%) https://decomp.me/scratch/LSXV2
NONMATCH("asm/non_matching/game/sa1/stage/interactables/spring_hiding__sub_8095224.inc",
         bool32 sub_8095224(SpringHiding *spring, Sprite *s, s32 worldX, s32 worldY))
{
    bool32 result = FALSE;
    MapEntity *me = spring->base.me;
    bool32 sp0C = FALSE;
    s32 i = 0;

    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (!(PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE)) {
                if (!Coll_Player_Entity_Intersection(s, worldX, worldY, &PLAYER(i))) {
                    sp0C = Coll_AmyHammer_Spring(s, worldX, worldY, &PLAYER(i));
                    if (!sp0C) {
                        continue;
                    }
                }

                SA2_LABEL(sub_8021BE0)(&PLAYER(i));

                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                PLAYER(i).moveState &= ~MOVESTATE_100;
                PLAYER(i).SA2_LABEL(unk61) = 0;
                PLAYER(i).qSpeedAirY = -(me->d.uData[1] << 6);
                // _08095360

                if (sp0C) {
                    s16 qSpeed = PLAYER(i).qSpeedAirY >> 1;
                    PLAYER(i).qSpeedAirY += qSpeed;
                }
                // _08095390

                if (me->d.uData[0] & 0x1) {
                    Sprite *infoSprite;
                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).charState = CHARSTATE_SPRING_B;
                    PLAYER_SPR_INFO(i).s.prevVariant = -1;
                    asm("");
                } else {
                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).charState = CHARSTATE_17;
                    PLAYER_SPR_INFO(i).s.prevVariant = -1;
                }

                s->variant = 1;
                s->prevVariant = -1;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                m4aSongNumStart(SE_SPRING);
                result = TRUE;
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    return result;
}
END_NONMATCH

void TaskDestructor_Spring_Hiding(Task *t)
{
    SpringHiding *spring = TASK_DATA(t);
    VramFree(spring->s.graphics.dest);
}