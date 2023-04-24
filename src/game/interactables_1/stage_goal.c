#include "global.h"
#include "lib/m4a.h"
#include "gba/syscall.h"

#include "malloc_vram.h"

#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_1/stage_goal.h"

#include "sprite.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite sprite;
} Sprite_StageGoal;

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_StageGoalToggle;

static void Task_StageGoalMain(void);
static void TaskDestructor_8062E7C(struct Task *);
static void Task_StageGoalAnimate(void);
static void sub_8062D44(void);
static void StageGoalToggle_HandleMultiplayerFinish(void);

#define GOAL_LEVER_TILES 4

void initSprite_Interactable_StageGoal(MapEntity *me, u16 spriteRegionX,
                                       u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_StageGoalMain, sizeof(Sprite_StageGoal), 0x2010, 0,
                                TaskDestructor_8062E7C);
    Sprite_StageGoal *stageGoal = TaskGetStructPtr(t);
    Sprite *sprite = &stageGoal->sprite;

    stageGoal->base.regionX = spriteRegionX;
    stageGoal->base.regionY = spriteRegionY;
    stageGoal->base.me = me;
    stageGoal->base.spriteX = me->x;
    stageGoal->base.spriteY = spriteY;

    sprite->x = SpriteGetScreenPos(me->x, spriteRegionX);
    sprite->y = SpriteGetScreenPos(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    sprite->graphics.dest = VramMalloc(GOAL_LEVER_TILES);
    sprite->graphics.anim = SA2_ANIM_GOAL_LEVER;
    sprite->variant = 1;
    sprite->unk21 = -1;
    sprite->unk1A = 0x100;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk22 = 0x10;
    sprite->focused = FALSE;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x1000;
    sub_8004558(sprite);
}

static void Task_StageGoalMain(void)
{
    Sprite_StageGoal *stageGoal = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &stageGoal->sprite;
    MapEntity *me = stageGoal->base.me;

    s32 x = SpriteGetScreenPos(stageGoal->base.spriteX, stageGoal->base.regionX);
    s32 y = SpriteGetScreenPos(me->y, stageGoal->base.regionY);

    sprite->x = x - gCamera.x;
    sprite->y = y - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
        me->x = stageGoal->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    if (PLAYER_IS_ALIVE && !(gPlayer.moveState & MOVESTATE_400000)) {
        if (sub_800C204(sprite, x, y, 0, &gPlayer, 0) == 1) {
            sprite->graphics.anim = SA2_ANIM_GOAL_LEVER;
            sprite->variant = 0;
            sprite->unk21 = -1;
            gCurTask->main = Task_StageGoalAnimate;
        }
    }
    sub_80051E8(sprite);
}

static void Task_StageGoalAnimate(void)
{
    Sprite_StageGoal *stageGoal = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &stageGoal->sprite;
    MapEntity *me = stageGoal->base.me;

    s32 x = SpriteGetScreenPos(stageGoal->base.spriteX, stageGoal->base.regionX);
    s32 y = SpriteGetScreenPos(me->y, stageGoal->base.regionY);

    sprite->x = x - gCamera.x;
    sprite->y = y - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
        me->x = stageGoal->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    sub_8004558(sprite);
    sub_80051E8(sprite);
}

static void Task_StageGoalToggleMain(void)
{
    Sprite_StageGoalToggle *stageGoalToggle = TaskGetStructPtr(gCurTask);
    MapEntity *me = stageGoalToggle->base.me;

    u8 spriteX = stageGoalToggle->base.spriteX;
    u16 regionX = stageGoalToggle->base.regionX;
    u16 regionY = stageGoalToggle->base.regionY;
    s32 x = SpriteGetScreenPos(spriteX, regionX);
    s32 y = SpriteGetScreenPos(me->y, regionY);

    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
        if (x <= Q_24_8_TO_INT(gPlayer.x)
            && !(gPlayer.moveState & (MOVESTATE_8000000 | MOVESTATE_8))) {
            gPlayer.unk6D = 10;
            gUnknown_030054D0 = x;
            StageGoalToggle_HandleMultiplayerFinish();
        }
    } else if (x <= Q_24_8_TO_INT(gPlayer.x)
               && !(gPlayer.moveState & MOVESTATE_8000000)) {
        gPlayer.unk6D = 10;
        gUnknown_03005424 |= 0x21;
        gUnknown_030054D0 = x;

        if (gGameMode == GAME_MODE_SINGLE_PLAYER
            && !(gPlayer.moveState & MOVESTATE_IN_AIR) && gPlayer.speedGroundX > 0x280) {
            u32 temp;
            if (gPlayer.speedGroundX < 0x401) {
                temp = 200;
            } else if (gPlayer.speedGroundX < 0x901) {
                temp = 300;
            } else if (gPlayer.speedGroundX < 0xA01) {
                temp = 500;
            } else {
                temp = 800;
            }

            // Redundant check :/
            if (temp != 0) {
                u32 temp2, temp3;
                u32 prev = gUnknown_03005450;
                gUnknown_03005450 += temp;
                temp2 = Div(gUnknown_03005450, 50000);
                temp3 = Div(prev, 50000);
                if (temp2 != temp3 && gGameMode == GAME_MODE_SINGLE_PLAYER) {
                    u16 numLives = (temp2 - temp3);
                    numLives += gNumLives;

                    if (numLives > 0xFF) {
                        numLives = 0xFF;
                    }

                    gNumLives = numLives;
                    gUnknown_030054A8[3] = 0x10;
                }
                sub_801F3A4(Q_24_8_TO_INT(gPlayer.x), Q_24_8_TO_INT(gPlayer.y), temp);
            }
        }
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
    struct UNK_3005510 *unk5510;
    u32 count = 0;
    struct MultiplayerPlayer *player
        = TaskGetStructPtr(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
    gPlayer.unk37 &= ~0x40;
    gPlayer.unk32 = 0;

    if (!(player->unk5C & 1)) {
        u32 j;
        for (j = 0; j < ARRAY_COUNT(gMultiplayerPlayerTasks)
             && gMultiplayerPlayerTasks[j] != NULL;
             j++) {
            struct MultiplayerPlayer *otherPlayer
                = TaskGetStructPtr(gMultiplayerPlayerTasks[j]);
            if (otherPlayer->unk5C & 1) {
                count++;
            }
        }

        sub_8019CCC(SIO_MULTI_CNT->id, count);
        player->unk5C |= 1;

        if (count == 0) {
            gUnknown_03005424 |= 4;
            gUnknown_03005490 = 3600;
        }

        unk5510 = sub_8019224();
        unk5510->unk0 = 7;
        gCurTask->main = sub_8062D44;
        gCamera.unk50 |= 4;
    }
}

static void sub_8062BD0(void)
{
    u32 thing = 0;
    struct Task **mpTasks = gMultiplayerPlayerTasks;
    struct UNK_3005510 *unk5510;
    u32 j;

    // Required for match
    *SIO_MULTI_CNT;

    gPlayer.unk37 &= ~0x40;
    gPlayer.unk32 = 0;

    for (j = 0; j < ARRAY_COUNT(gMultiplayerPlayerTasks) && mpTasks[j] != NULL; j++) {
        // TODO: make this a macro? What does it even mean
        if ((gMultiplayerConnections & (0x10 << (j))) >> ((j + 4))
                != (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                    >> (SIO_MULTI_CNT->id + 4)
            && gUnknown_030054B4[j] == 0) {
            thing = 1;
            break;
        }
    }

    for (j = 0;
         j < ARRAY_COUNT(gMultiplayerPlayerTasks) && gMultiplayerPlayerTasks[j] != NULL;
         j++) {
        if (gUnknown_030054B4[j] == -1) {
            if ((gMultiplayerConnections & (0x10 << (j))) >> ((j + 4))
                == (gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                    >> (SIO_MULTI_CNT->id + 4)) {
                sub_8019CCC(j, thing);
            } else {
                sub_8019CCC(j, thing ^ 1);
            }
        }
    }

    gUnknown_03005424 |= 4;
    gUnknown_03005490 = 3600;
    unk5510 = sub_8019224();
    unk5510->unk0 = 7;
    gCurTask->main = sub_8062D44;
    gCamera.unk50 |= 4;
}

static void sub_8062D44(void)
{

    u32 id = SIO_MULTI_CNT->id;
    u32 count = 0;

    if (gUnknown_030054B4[id] != -1) {
        u32 j;
        struct Task **tasks;
        for (j = 0, tasks = gMultiplayerPlayerTasks;
             j < ARRAY_COUNT(gMultiplayerPlayerTasks) && tasks[j] != NULL; j++) {
            struct MultiplayerPlayer *otherPlayer = TaskGetStructPtr(tasks[j]);
            if (otherPlayer->unk54 & 0x100) {
                count++;
            }
        }

        if (count != 0 && (count >= (j - 1) || gGameMode == GAME_MODE_TEAM_PLAY)) {
            struct Task **tasks;
            u32 i;
            // Check seems redundant, required for match
            if (gMultiplayerPlayerTasks[0] != NULL) {
                for (i = 0, tasks = gMultiplayerPlayerTasks;
                     i < ARRAY_COUNT(gMultiplayerPlayerTasks) && tasks[i] != NULL; i++) {
                    struct MultiplayerPlayer *otherPlayer = TaskGetStructPtr(tasks[i]);
                    if (!(otherPlayer->unk5C & 1) && gGameMode != GAME_MODE_TEAM_PLAY) {
                        otherPlayer->unk5C |= 1;
                        gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
                        gPlayer.unk5C = 0;
                    }
                }
            }

            sub_8019F08();
            TaskDestroy(gCurTask);
        }
    }
}

void initSprite_Interactable_Toggle_StageGoal(MapEntity *me, u16 spriteRegionX,
                                              u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_StageGoalToggleMain, sizeof(Sprite_StageGoalToggle),
                                0x2010, 0, NULL);
    Sprite_StageGoalToggle *stageGoalToggle = TaskGetStructPtr(t);

    stageGoalToggle->base.regionX = spriteRegionX;
    stageGoalToggle->base.regionY = spriteRegionY;
    stageGoalToggle->base.me = me;
    stageGoalToggle->base.spriteX = me->x;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void TaskDestructor_8062E7C(struct Task *t)
{
    Sprite_StageGoal *stageGoal = TaskGetStructPtr(t);
    VramFree(stageGoal->sprite.graphics.dest);
}
