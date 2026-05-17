#include "global.h"
#include "core.h"
#include "flags.h"
#include "lib/m4a/m4a.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"
#include "game/sa1/special_stage/main.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 camX;
    /* 0x3E */ u16 camY;
} SpecialSpring;

void Task_SpecialSpringMain(void);
void Task_TransitionSpStage(void);
void TaskDestructor_SpecialSpring(Task *t);

void CreateEntity_SpecialSpring(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    if (gGameMode != GAME_MODE_SINGLE_PLAYER) {
        SET_MAP_ENTITY_INITIALIZED(me);
        return;
    }

    {
        Task *t = TaskCreate(Task_SpecialSpringMain, sizeof(SpecialSpring), 0x2000, 0, TaskDestructor_SpecialSpring);
        SpecialSpring *spring = TASK_DATA(t);
        Sprite *s = &spring->s;

        spring->base.regionX = regionX;
        spring->base.regionY = regionY;
        spring->base.me = me;
        spring->base.meX = me->x;
        spring->base.id = id;

        s->x = TO_WORLD_POS(me->x, regionX);
        s->y = TO_WORLD_POS(me->y, regionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPECIAL_SPRING);
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_SPECIAL_SPRING;
        s->variant = 1;

        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
        UpdateSpriteAnimation(s);
    }
}

void Task_SpecialSpringMain(void)
{
    u32 res = 0; // result of Coll_AmyHammer_Spring()
    SpecialSpring *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(spring->base.meX, spring->base.regionX);
    worldY = TO_WORLD_POS(me->y, spring->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if ((s->variant == 0) && (s->frameFlags & SPRITE_FLAG(ANIM_OVER, 1))) {
        s->variant = 1;
        s->prevVariant = -1;
    }

    if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
        if (Coll_Player_Platform(s, worldX, worldY, &gPartner) & COLL_FLAG_8) {
            SA2_LABEL(sub_8021BE0)(&gPartner);
            gPartner.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPartner.moveState |= MOVESTATE_IN_AIR;
            gPartner.moveState &= ~MOVESTATE_100;
            gPartner.qSpeedAirY = -Q(7.5);
            gPartner.charState = CHARSTATE_SPRING_B;
            s->variant = 0;
            s->prevVariant = -1;
            PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPartner, 6, 14);
            m4aSongNumStart(SE_SPRING);
        }
    }

    if (PLAYER_IS_ALIVE) {
        // NOTE: The 'res =' assignment inside the if is correct!!!
        if ((Coll_Player_Platform(s, worldX, worldY, &gPlayer) & COLL_FLAG_8)
            || (res = Coll_AmyHammer_Spring(s, worldX, worldY, &gPlayer))) {
            SA2_LABEL(sub_8021BE0)(&gPlayer);
            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPlayer.moveState |= MOVESTATE_IN_AIR;
            gPlayer.moveState &= ~MOVESTATE_100;

            gPlayer.qSpeedAirY = -Q(7.5);
            if (res) {
                s16 qSpeed = gPlayer.qSpeedAirY;
                qSpeed += (qSpeed >> 1);
                gPlayer.qSpeedAirY = qSpeed;
            }

            gPlayer.charState = CHARSTATE_SPRING_B;

            spring->camX = gCamera.x;
            spring->camY = gCamera.y;

            if (gPlayer.SA2_LABEL(unk99)[1] == 0) {
                gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
                gStageFlags |= STAGE_FLAG__ACT_START;
            }

            s->variant = 0;
            s->prevVariant = -1;
            PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
            m4aSongNumStart(SE_SPRING);
            gCurTask->main = Task_TransitionSpStage;
        }
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    } else {
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_TransitionSpStage(void)
{
    SpecialSpring *spring = TASK_DATA(gCurTask);
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

    if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
        if (Coll_Player_Platform(s, worldX, worldY, &gPartner) & COLL_FLAG_8) {
            SA2_LABEL(sub_8021BE0)(&gPartner);
            gPartner.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPartner.moveState |= MOVESTATE_IN_AIR;
            gPartner.moveState &= ~MOVESTATE_100;
            gPartner.qSpeedAirY = -Q(7.5);
            gPartner.charState = CHARSTATE_SPRING_B;
            s->variant = 0;
            s->prevVariant = -1;
            PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPartner, 6, 14);
            m4aSongNumStart(SE_SPRING);
        }
    }

    if (gPlayer.SA2_LABEL(unk99)[1] == 0) {
        gCamera.x = spring->camX;
        gCamera.y = spring->camY;

        gPlayer.qWorldY -= Q(7.5);

        if (I(gPlayer.qWorldY) - gCamera.y < -128) {
            gSpecialStageReturnX = gPlayer.checkPointX;
            gSpecialStageReturnY = gPlayer.checkPointY;

            gPlayer.checkPointX = worldX;
            gPlayer.checkPointY = worldY;

            TaskDestroy(gCurTask);
            TasksDestroyAll();

            PAUSE_BACKGROUNDS_QUEUE();
            gBgSpritesCount = 0;
            PAUSE_GRAPHICS_QUEUE();

            CreateSpecialStageIntro();
            return;
        } else {
            UpdateSpriteAnimation(s);
        }
    } else {
        if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
            s->prevVariant = -1;
            s->graphics.anim = SA1_ANIM_SPECIAL_SPRING;
            s->variant = 1;
            gCurTask->main = Task_SpecialSpringMain;
            UpdateSpriteAnimation(s);
        }
    }
    DisplaySprite(s);
}

void TaskDestructor_SpecialSpring(Task *t)
{
    SpecialSpring *spring = TASK_DATA(t);
    VramFree(spring->s.graphics.dest);
}