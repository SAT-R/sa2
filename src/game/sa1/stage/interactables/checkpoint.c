#include "global.h"
#include "core.h"
#include "flags.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/entities_manager.h"
#include "game/sa1/stage/egg_rocket_transitions.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/move_states.h"
#include "constants/zones.h"

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
} Checkpoint; /* 0x3C */

void Task_CheckpointMain(void);
void Task_Checkpoint1(void);
void Task_Checkpoint2(void);

void CreateEntity_Checkpoint(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t;
    Checkpoint *checkpoint;
    Sprite *s;

    if (me->d.sData[0] <= gBossIndex) {
        t = TaskCreate(Task_Checkpoint2, sizeof(Checkpoint), 0x2000, 0, TaskDestructor_EntityShared);
    } else {
        t = TaskCreate(Task_CheckpointMain, sizeof(Checkpoint), 0x2000, 0, TaskDestructor_EntityShared);
    }

    checkpoint = TASK_DATA(t);

    checkpoint->shared.base.regionX = regionX;
    checkpoint->shared.base.regionY = regionY;
    checkpoint->shared.base.me = me;
    checkpoint->shared.base.meX = me->x;
    checkpoint->shared.base.id = id;

    s = &checkpoint->shared.s;
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_CHECKPOINT);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_CHECKPOINT;

    if (me->d.sData[0] <= gBossIndex) {
        s->variant = 2;
    } else {
        s->variant = 0;
    }

    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

void Task_CheckpointMain(void)
{
    Checkpoint *checkpoint = TASK_DATA(gCurTask);
    Sprite *s = &checkpoint->shared.s;
    MapEntity *me = checkpoint->shared.base.me;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(checkpoint->shared.base.meX, checkpoint->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, checkpoint->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (((gCurrentLevel != LEVEL_INDEX(ZONE_6, ACT_1)) && (HB_LEFT(worldX, checkpoint->shared.s.hitboxes[0].b) <= I(gPlayer.qWorldX))
         && (HB_RIGHT(worldX, checkpoint->shared.s.hitboxes[0].b) >= I(gPlayer.qWorldX))
         && (HB_TOP(worldY, checkpoint->shared.s.hitboxes[0].b) <= I(gPlayer.qWorldY))
         && (HB_BOTTOM(worldY, checkpoint->shared.s.hitboxes[0].b) >= I(gPlayer.qWorldY)))
        || ((gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1))
            && (((me->d.sData[0] == 1) && (I(gPlayer.qWorldX) > worldX))
                || ((me->d.sData[0] != 1) && (I(gPlayer.qWorldY) + gPlayer.spriteOffsetY < worldY + 4))))) {
        if (!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE)) {
            gBossIndex = me->d.sData[0];
            gPlayer.checkPointX = worldX;
            gPlayer.checkPointY = worldY - gPlayer.spriteOffsetY;
            gPlayer.checkpointTime = gCheckpointTime;

            s->variant = 1;

            gCurTask->main = Task_Checkpoint1;
            gCurTask->main();

            if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1)) {
                if (gBossIndex == 1) {
                    gPlayer.qSpeedAirX = 0;
                    gPlayer.qSpeedGround = 0;
                    CreateEggRocketLaunchScreenShakeEffect();
                }

                if (gBossIndex == 2) {
                    if (gGameMode == GAME_MODE_SINGLE_PLAYER) {
                        gStageFlags |= STAGE_FLAG__ACT_START;
                    }

                    CreateEggRocketStageSeparation((58 * METATILE_DIM) - 1);
                }

                if (gBossIndex == 3) {
                    if (gGameMode == GAME_MODE_SINGLE_PLAYER) {
                        gStageFlags |= STAGE_FLAG__ACT_START;
                    }

                    CreateEggRocketStageSeparation((34 * METATILE_DIM) - 1);
                }
            }
        }
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, checkpoint->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (gCurrentLevel != LEVEL_INDEX(ZONE_6, ACT_1)) {
        // In Egg Rocket, checkpoints are invisible
        // Screen shakes indicate the Player they reached one, instead.
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_Checkpoint1(void)
{
    Checkpoint *checkpoint = TASK_DATA(gCurTask);
    Sprite *s = &checkpoint->shared.s;
    MapEntity *me = checkpoint->shared.base.me;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(checkpoint->shared.base.meX, checkpoint->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, checkpoint->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, checkpoint->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1) || UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        s->variant = 2;
        gCurTask->main = Task_Checkpoint2;
    }

    if (gCurrentLevel != LEVEL_INDEX(ZONE_6, ACT_1)) {
        // In Egg Rocket, checkpoints are invisible
        // Screen shakes indicate the Player they reached one, instead.
        DisplaySprite(s);
    }
}

void Task_Checkpoint2(void)
{
    Checkpoint *checkpoint = TASK_DATA(gCurTask);
    Sprite *s = &checkpoint->shared.s;
    MapEntity *me = checkpoint->shared.base.me;
    s16 worldX, worldY;

    worldX = TO_WORLD_POS(checkpoint->shared.base.meX, checkpoint->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, checkpoint->shared.base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, checkpoint->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (gCurrentLevel != LEVEL_INDEX(ZONE_6, ACT_1)) {
        // In Egg Rocket, checkpoints are invisible
        // Screen shakes indicate the Player they reached one, instead.
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}
