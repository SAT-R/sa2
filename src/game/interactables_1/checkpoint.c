#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "flags.h"
#include "sprite.h"
#include "task.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/palette_loader.h"

#include "game/entity.h"
#include "game/stage/spawn_positions.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "data/sprite_data.h"

#include "constants/animations.h"
#include "constants/anim_commands.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ struct Task *task;
} Sprite_Checkpoint;

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
} Sprite_Toggle_Checkpoint;

static void Task_Interactable_Toggle_Checkpoint(void);
static void Task_CheckpointMain_Idle(void);
static void Task_StageCheckpointMain_Activated(void);
static void Task_CheckpointMain_Used(void);
static void TaskDestructor_Checkpoint(struct Task *);
static void TaskDestructor_PaletteLoader_Checkpoint(struct Task *);

extern u32 gCheckpointTime;

#define CHECKPOINT_BALL_TILE_COUNT 4

/* [0] = animId
 * [1] = variant
 *
 * Using a struct doesn't match */
static const u16 sAnimIdsCheckpoint[NUM_COURSE_ZONES + 1][2] = {
    [ZONE_1] = { SA2_ANIM_898, 0 }, [ZONE_2] = { SA2_ANIM_899, 0 }, [ZONE_3] = { SA2_ANIM_903, 0 }, [ZONE_4] = { SA2_ANIM_902, 0 },
    [ZONE_5] = { SA2_ANIM_904, 0 }, [ZONE_6] = { SA2_ANIM_947, 0 }, [ZONE_7] = { SA2_ANIM_905, 0 }, [ZONE_FINAL] = { SA2_ANIM_899, 0 },
};

void CreateEntity_Checkpoint(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t;
    Sprite_Checkpoint *chkPt;
    Sprite *s;
    u8 zone;
    u16 anim;
    u8 variant;
    if (gBossIndex == 0) {
        t = TaskCreate(Task_CheckpointMain_Idle, sizeof(Sprite_Checkpoint), 0x2010, 0, TaskDestructor_Checkpoint);
    } else {
        t = TaskCreate(Task_CheckpointMain_Used, sizeof(Sprite_Checkpoint), 0x2010, 0, TaskDestructor_Checkpoint);
    }

    chkPt = TASK_DATA(t);
    s = &chkPt->s;

    chkPt->base.regionX = spriteRegionX;
    chkPt->base.regionY = spriteRegionY;
    chkPt->base.me = me;
    chkPt->base.meX = me->x;
    chkPt->base.id = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(CHECKPOINT_BALL_TILE_COUNT);
    s->graphics.anim = SA2_ANIM_CHECKPOINT;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    zone = LEVEL_TO_ZONE(gCurrentLevel);
    anim = sAnimIdsCheckpoint[zone][0];
    variant = sAnimIdsCheckpoint[zone][1];

    chkPt->task = CreatePaletteLoaderTask(0x2000, anim, variant, TaskDestructor_PaletteLoader_Checkpoint);
}

void Task_CheckpointMain_Idle(void)
{
    Sprite_Checkpoint *chkPt = TASK_DATA(gCurTask);
    Sprite *s = &chkPt->s;
    MapEntity *me = chkPt->base.me;
    s32 posX, posY;
    posX = TO_WORLD_POS(chkPt->base.meX, chkPt->base.regionX);
    posY = TO_WORLD_POS(me->y, chkPt->base.regionY);

    s->x = posX - gCamera.x;
    s->y = posY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = chkPt->base.meX;
        TaskDestroy(chkPt->task);
        TaskDestroy(gCurTask);
    } else {
        if (!(gPlayer.moveState & (MOVESTATE_IA_OVERRIDE | MOVESTATE_DEAD)) && posX <= I(gPlayer.qWorldX)) {
            gPlayer.checkPointX = gCheckpointPositions[gCurrentLevel].x;
            gPlayer.checkPointY = gCheckpointPositions[gCurrentLevel].y;
            gPlayer.checkpointTime = gCheckpointTime;

            if (gBossIndex == 0)
                gBossIndex++;

            s->graphics.anim = SA2_ANIM_CHECKPOINT;
            s->variant = SA2_ANIM_VARIANT_CHECKPOINT_HIT;
            s->prevVariant = -1;

            gCurTask->main = Task_StageCheckpointMain_Activated;

            m4aSongNumStart(SE_CHECKPOINT);
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_StageCheckpointMain_Activated(void)
{
    Sprite_Checkpoint *chkPt = TASK_DATA(gCurTask);
    Sprite *s = &chkPt->s;
    MapEntity *me = chkPt->base.me;
    s32 posX, posY;
    posX = TO_WORLD_POS(chkPt->base.meX, chkPt->base.regionX);
    posY = TO_WORLD_POS(me->y, chkPt->base.regionY);

    s->x = posX - gCamera.x;
    s->y = posY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = chkPt->base.meX;
        TaskDestroy(chkPt->task);
        TaskDestroy(gCurTask);
    } else {
        if (UpdateSpriteAnimation(s) == 0) {
            gCurTask->main = Task_CheckpointMain_Used;
        }

        DisplaySprite(s);
    }
}

void Task_CheckpointMain_Used(void)
{
    Sprite_Checkpoint *chkPt = TASK_DATA(gCurTask);
    Sprite *s = &chkPt->s;
    MapEntity *me = chkPt->base.me;
    s32 posX, posY;
    posX = TO_WORLD_POS(chkPt->base.meX, chkPt->base.regionX);
    posY = TO_WORLD_POS(me->y, chkPt->base.regionY);

    s->x = posX - gCamera.x;
    s->y = posY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = chkPt->base.meX;
        TaskDestroy(chkPt->task);
        TaskDestroy(gCurTask);
    }
}

// static
void TaskDestructor_Checkpoint(struct Task *t)
{
    Sprite_Checkpoint *chkPt = TASK_DATA(t);
    void *gfx = chkPt->s.graphics.dest;
    VramFree(gfx);
}

void TaskDestructor_PaletteLoader_Checkpoint(struct Task *unused)
{
    u8 zone = LEVEL_TO_ZONE(gCurrentLevel);
    s32 animId = sAnimIdsCheckpoint[zone][0];
    const ACmd **anim = gAnimations[animId];
    const s32 *cmd = (const s32 *)anim[0];
    u32 palId;
    u32 numColors;
    u32 offset;

    if (*cmd++ == ANIM_CMD__PALETTE) {
        palId = *cmd++;
        numColors = *cmd;
        offset = numColors >> 16;
        numColors %= 256;

        DmaCopy32(3, &gRefSpriteTables->palettes[palId * 16], &gBgPalette[offset], numColors * sizeof(u16));

        gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
    }
}

static void Task_Interactable_Toggle_Checkpoint(void)
{
    Sprite_Toggle_Checkpoint *toggle = TASK_DATA(gCurTask);
    MapEntity *me = toggle->base.me;
    s32 posX, posY;
    s16 screenX, screenY;

    posX = TO_WORLD_POS(toggle->base.meX, toggle->base.regionX);
    posY = TO_WORLD_POS(me->y, toggle->base.regionY);

    screenX = posX - gCamera.x;
    screenY = posY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        me->x = toggle->base.meX;
        TaskDestroy(gCurTask);
    } else if (!(gPlayer.moveState & (MOVESTATE_IA_OVERRIDE | MOVESTATE_DEAD)) && posX <= I(gPlayer.qWorldX)) {
        gPlayer.checkPointX = gCheckpointPositions[gCurrentLevel].x;
        gPlayer.checkPointY = gCheckpointPositions[gCurrentLevel].y;
        gPlayer.checkpointTime = gCheckpointTime;

        if (gBossIndex == 0)
            gBossIndex++;

        TaskDestroy(gCurTask);
    } else {
        if (gBossIndex != 0)
            TaskDestroy(gCurTask);
    }
}

void CreateEntity_Toggle_Checkpoint(MapEntity *in_ia, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (gBossIndex == 0) {
        struct Task *t = TaskCreate(Task_Interactable_Toggle_Checkpoint, sizeof(Sprite_Toggle_Checkpoint), 0x2010, 0, NULL);

        Sprite_Toggle_Checkpoint *toggle = TASK_DATA(t);
        toggle->base.regionX = spriteRegionX;
        toggle->base.regionY = spriteRegionY;
        toggle->base.me = in_ia;
        toggle->base.meX = in_ia->x;
        toggle->base.id = spriteY;
    }

    SET_MAP_ENTITY_INITIALIZED(in_ia);
}