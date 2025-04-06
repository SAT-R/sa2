#include "global.h"
#include "lib/m4a/m4a.h"
#include "gba/syscall.h"

#include "malloc_vram.h"

#include "game/sa1_sa2_shared/collision.h"
#include "game/entity.h"
#include "game/stage/camera.h"
#include "game/stage/mp_sprite_task.h"
#include "game/stage/player.h"

#include "game/interactables_1/stage_goal.h"

#include "game/multiplayer/mp_player.h"
#include "game/multiplayer/multiplayer_event_mgr.h"
#include "game/multiplayer/finish.h"

#include "sprite.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
} Sprite_StageGoal;

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_StageGoalToggle;

static void Task_StageGoalMain(void);
static void TaskDestructor_StageGoal(struct Task *);
static void Task_StageGoalAnimate(void);
static void StageGoalToggle_PlayerReachedGoal(void);
static void StageGoalToggle_HandleMultiplayerFinish(void);

#define GOAL_LEVER_TILES 4

void CreateEntity_StageGoal(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_StageGoalMain, sizeof(Sprite_StageGoal), 0x2010, 0, TaskDestructor_StageGoal);
    Sprite_StageGoal *stageGoal = TASK_DATA(t);
    Sprite *s = &stageGoal->s;

    stageGoal->base.regionX = spriteRegionX;
    stageGoal->base.regionY = spriteRegionY;
    stageGoal->base.me = me;
    stageGoal->base.spriteX = me->x;
    stageGoal->base.id = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(GOAL_LEVER_TILES);
    s->graphics.anim = SA2_ANIM_GOAL_LEVER;
    s->variant = 1;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = FALSE;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x1000;
    UpdateSpriteAnimation(s);
}

static void Task_StageGoalMain(void)
{
    Sprite_StageGoal *stageGoal = TASK_DATA(gCurTask);
    Sprite *s = &stageGoal->s;
    MapEntity *me = stageGoal->base.me;

    s32 x = TO_WORLD_POS(stageGoal->base.spriteX, stageGoal->base.regionX);
    s32 y = TO_WORLD_POS(me->y, stageGoal->base.regionY);

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = stageGoal->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    if (PLAYER_IS_ALIVE && !(gPlayer.moveState & MOVESTATE_IA_OVERRIDE)) {
        if (Coll_Sprite_Player_HitboxIntersecting(s, x, y, 0, &gPlayer, 0) == 1) {
            s->graphics.anim = SA2_ANIM_GOAL_LEVER;
            s->variant = 0;
            s->prevVariant = -1;
            gCurTask->main = Task_StageGoalAnimate;
        }
    }
    DisplaySprite(s);
}

static void Task_StageGoalAnimate(void)
{
    Sprite_StageGoal *stageGoal = TASK_DATA(gCurTask);
    Sprite *s = &stageGoal->s;
    MapEntity *me = stageGoal->base.me;

    s32 x = TO_WORLD_POS(stageGoal->base.spriteX, stageGoal->base.regionX);
    s32 y = TO_WORLD_POS(me->y, stageGoal->base.regionY);

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = stageGoal->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void Task_StageGoalToggleMain(void)
{
    Sprite_StageGoalToggle *stageGoalToggle = TASK_DATA(gCurTask);
    MapEntity *me = stageGoalToggle->base.me;

    u8 spriteX = stageGoalToggle->base.spriteX;
    u16 regionX = stageGoalToggle->base.regionX;
    u16 regionY = stageGoalToggle->base.regionY;
    s32 x = TO_WORLD_POS(spriteX, regionX);
    s32 y = TO_WORLD_POS(me->y, regionY);

    if (IS_MULTI_PLAYER) {
        if (x <= I(gPlayer.qWorldX) && !(gPlayer.moveState & (MOVESTATE_GOAL_REACHED | MOVESTATE_STOOD_ON_OBJ))) {
            gPlayer.transition = PLTRANS_REACHED_GOAL;
            gStageGoalX = x;
            StageGoalToggle_HandleMultiplayerFinish();
        }
    } else if (x <= I(gPlayer.qWorldX) && !(gPlayer.moveState & MOVESTATE_GOAL_REACHED)) {
        gPlayer.transition = PLTRANS_REACHED_GOAL;
        gStageFlags |= STAGE_FLAG__DISABLE_PAUSE_MENU | STAGE_FLAG__ACT_START;
        gStageGoalX = x;

        if (gGameMode == GAME_MODE_SINGLE_PLAYER && !(gPlayer.moveState & MOVESTATE_IN_AIR) && gPlayer.qSpeedGround > Q(2.5)) {
            u32 extraScore;
            if (gPlayer.qSpeedGround <= Q(4.0)) {
                extraScore = 200;
            } else if (gPlayer.qSpeedGround <= Q(9.0)) {
                extraScore = 300;
            } else if (gPlayer.qSpeedGround <= Q(10.0)) {
                extraScore = 500;
            } else {
                extraScore = 800;
            }

            if (extraScore != 0) {
                INCREMENT_SCORE(extraScore);

                CreateStageGoalBonusPointsAnim(I(gPlayer.qWorldX), I(gPlayer.qWorldY), extraScore);
            }
        }

#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
        if (gCurrentLevel == LEVEL_INDEX(ZONE_3, ACT_1)) {
            gPlayer.qSpeedGround = 0;
            gInputRecorder.playbackHead += 1;
        } else if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_2)) {
            gPlayer.qSpeedAirX = 0;
            gInputRecorder.playbackHead += 1;
        }
#endif
    }

    x -= gCamera.x;
    y -= gCamera.y;
    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, x, y)) {
        me->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

static void StageGoalToggle_HandleMultiplayerFinish(void)
{
    RoomEvent *roomEvent;
    u32 count = 0;
    MultiplayerPlayer *player = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
    gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__CONFUSION;
    gPlayer.confusionTimer = 0;

    if (!(player->unk5C & 1)) {
        u32 j;
        for (j = 0; j < ARRAY_COUNT(gMultiplayerPlayerTasks) && gMultiplayerPlayerTasks[j] != NULL; j++) {
            MultiplayerPlayer *otherPlayer = TASK_DATA(gMultiplayerPlayerTasks[j]);
            if (otherPlayer->unk5C & 1) {
                count++;
            }
        }

        sub_8019CCC(SIO_MULTI_CNT->id, count);
        player->unk5C |= 1;

        if (count == 0) {
            gStageFlags |= 4;
            gCourseTime = 3600;
        }

        roomEvent = CreateRoomEvent();
        roomEvent->type = ROOMEVENT_TYPE_REACHED_STAGE_GOAL;

        gCurTask->main = StageGoalToggle_PlayerReachedGoal;
        gCamera.unk50 |= CAM_MODE_SPECTATOR;
    }
}

static UNUSED void StageGoalToggle_ForceMultiplayerFinish(void)
{
    u32 thing = 0;
    struct Task **mpTasks = gMultiplayerPlayerTasks;
    RoomEvent *roomEvent;
    u32 j;

    // Required for match
    u32 id = SIO_MULTI_CNT->id;

    gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__CONFUSION;
    gPlayer.confusionTimer = 0;

    for (j = 0; j < ARRAY_COUNT(gMultiplayerPlayerTasks) && mpTasks[j] != NULL; j++) {
        // TODO: make this a macro? What does it even mean
        if ((gMultiplayerConnections & (0x10 << (j))) >> ((j + 4))
                != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)
            && gUnknown_030054B4[j] == 0) {
            thing = 1;
            break;
        }
    }

    for (j = 0; j < ARRAY_COUNT(gMultiplayerPlayerTasks) && gMultiplayerPlayerTasks[j] != NULL; j++) {
        if (gUnknown_030054B4[j] == -1) {
            if ((gMultiplayerConnections & (0x10 << (j))) >> ((j + 4))
                == (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id))) >> (SIO_MULTI_CNT->id + 4)) {
                sub_8019CCC(j, thing);
            } else {
                sub_8019CCC(j, thing ^ 1);
            }
        }
    }

    gStageFlags |= 4;
    gCourseTime = 3600;
    roomEvent = CreateRoomEvent();
    roomEvent->type = ROOMEVENT_TYPE_REACHED_STAGE_GOAL;
    gCurTask->main = StageGoalToggle_PlayerReachedGoal;
    gCamera.unk50 |= CAM_MODE_SPECTATOR;
}

static void StageGoalToggle_PlayerReachedGoal(void)
{

    u32 id = SIO_MULTI_CNT->id;
    u32 count = 0;

    if (gUnknown_030054B4[id] != -1) {
        u32 j;
        struct Task **tasks;
        for (j = 0, tasks = gMultiplayerPlayerTasks; j < ARRAY_COUNT(gMultiplayerPlayerTasks) && tasks[j] != NULL; j++) {
            MultiplayerPlayer *otherPlayer = TASK_DATA(tasks[j]);
            if (otherPlayer->unk54 & 0x100) {
                count++;
            }
        }

        if (count != 0 && (count >= (j - 1) || gGameMode == GAME_MODE_TEAM_PLAY)) {
            struct Task **tasks;
            u32 i;
            // Check seems redundant, required for match
            if (gMultiplayerPlayerTasks[0] != NULL) {
                for (i = 0, tasks = gMultiplayerPlayerTasks; i < ARRAY_COUNT(gMultiplayerPlayerTasks) && tasks[i] != NULL; i++) {
                    MultiplayerPlayer *otherPlayer = TASK_DATA(tasks[i]);
                    if (!(otherPlayer->unk5C & 1) && gGameMode != GAME_MODE_TEAM_PLAY) {
                        otherPlayer->unk5C |= 1;
                        gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
                        gPlayer.heldInput = 0;
                    }
                }
            }

            sub_8019F08();
            TaskDestroy(gCurTask);
        }
    }
}

void CreateEntity_Toggle_StageGoal(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_StageGoalToggleMain, sizeof(Sprite_StageGoalToggle), 0x2010, 0, NULL);
    Sprite_StageGoalToggle *stageGoalToggle = TASK_DATA(t);

    stageGoalToggle->base.regionX = spriteRegionX;
    stageGoalToggle->base.regionY = spriteRegionY;
    stageGoalToggle->base.me = me;
    stageGoalToggle->base.spriteX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void TaskDestructor_StageGoal(struct Task *t)
{
    Sprite_StageGoal *stageGoal = TASK_DATA(t);
    VramFree(stageGoal->s.graphics.dest);
}
