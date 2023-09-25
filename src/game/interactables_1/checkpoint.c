#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a.h"

#include "core.h"
#include "data.h"
#include "data/sprite_data.h"
#include "flags.h"
#include "sprite.h"
#include "task.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/stage/palette_loader.h"

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
static void Task_8062FD8(void);
static void Task_8063108(void);
static void Task_806319C(void);
static void TaskDestructor_8063214(struct Task *);
static void Task_8063228(struct Task *);

extern u32 gCheckpointTime;
extern const struct SpriteTables *gUnknown_03002794;
extern const u32 gUnknown_080D63FC[34][2];

extern s32 **const gAnimations[];

#define CHECKPOINT_BALL_TILE_COUNT 4

/* [0] = animId
 * [1] = variant
 *
 * Using a struct doesn't match */
static const u16 sAnimIdsCheckpoint[NUM_COURSE_ZONES + 1][2] = {
    [ZONE_1] = { SA2_ANIM_898, 0 }, [ZONE_2] = { SA2_ANIM_899, 0 },
    [ZONE_3] = { SA2_ANIM_903, 0 }, [ZONE_4] = { SA2_ANIM_902, 0 },
    [ZONE_5] = { SA2_ANIM_904, 0 }, [ZONE_6] = { SA2_ANIM_947, 0 },
    [ZONE_7] = { SA2_ANIM_905, 0 }, [ZONE_FINAL] = { SA2_ANIM_899, 0 },
};

void CreateEntity_Checkpoint(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                             u8 spriteY)
{
    struct Task *t;
    Sprite_Checkpoint *chkPt;
    Sprite *s;
    u8 zone;
    u16 anim;
    u8 variant;
    if (gUnknown_030055B0 == 0) {
        t = TaskCreate(Task_8062FD8, sizeof(Sprite_Checkpoint), 0x2010, 0,
                       TaskDestructor_8063214);
    } else {
        t = TaskCreate(Task_806319C, sizeof(Sprite_Checkpoint), 0x2010, 0,
                       TaskDestructor_8063214);
    }

    chkPt = TaskGetStructPtr(t);
    s = &chkPt->s;

    chkPt->base.regionX = spriteRegionX;
    chkPt->base.regionY = spriteRegionY;
    chkPt->base.me = me;
    chkPt->base.spriteX = me->x;
    chkPt->base.spriteY = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(CHECKPOINT_BALL_TILE_COUNT);
    s->graphics.anim = SA2_ANIM_CHECKPOINT;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x2000;

    zone = LEVEL_TO_ZONE(gCurrentLevel);
    anim = sAnimIdsCheckpoint[zone][0];
    variant = sAnimIdsCheckpoint[zone][1];

    chkPt->task = CreatePaletteLoaderTask(0x2000, anim, variant, Task_8063228);
}

void Task_8062FD8(void)
{
    Sprite_Checkpoint *chkPt = TaskGetStructPtr(gCurTask);
    Sprite *s = &chkPt->s;
    MapEntity *me = chkPt->base.me;
    s32 posX, posY;
    posX = TO_WORLD_POS(chkPt->base.spriteX, chkPt->base.regionX);
    posY = TO_WORLD_POS(me->y, chkPt->base.regionY);

    s->x = posX - gCamera.x;
    s->y = posY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = chkPt->base.spriteX;
        TaskDestroy(chkPt->task);
        TaskDestroy(gCurTask);
    } else {
        if (!(gPlayer.moveState & (MOVESTATE_400000 | MOVESTATE_DEAD))
            && posX <= Q_24_8_TO_INT(gPlayer.x)) {
            gPlayer.checkPointX = gUnknown_080D63FC[gCurrentLevel][0];
            gPlayer.checkPointY = gUnknown_080D63FC[gCurrentLevel][1];
            gPlayer.checkpointTime = gCheckpointTime;

            if (gUnknown_030055B0 == 0)
                gUnknown_030055B0++;

            s->graphics.anim = SA2_ANIM_CHECKPOINT;
            s->variant = SA2_ANIM_VARIANT_CHECKPOINT_HIT;
            s->prevVariant = -1;

            gCurTask->main = Task_8063108;

            m4aSongNumStart(SE_CHECKPOINT);
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_8063108(void)
{
    Sprite_Checkpoint *chkPt = TaskGetStructPtr(gCurTask);
    Sprite *s = &chkPt->s;
    MapEntity *me = chkPt->base.me;
    s32 posX, posY;
    posX = TO_WORLD_POS(chkPt->base.spriteX, chkPt->base.regionX);
    posY = TO_WORLD_POS(me->y, chkPt->base.regionY);

    s->x = posX - gCamera.x;
    s->y = posY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = chkPt->base.spriteX;
        TaskDestroy(chkPt->task);
        TaskDestroy(gCurTask);
    } else {
        if (UpdateSpriteAnimation(s) == 0) {
            gCurTask->main = Task_806319C;
        }

        DisplaySprite(s);
    }
}

void Task_806319C(void)
{
    Sprite_Checkpoint *chkPt = TaskGetStructPtr(gCurTask);
    Sprite *s = &chkPt->s;
    MapEntity *me = chkPt->base.me;
    s32 posX, posY;
    posX = TO_WORLD_POS(chkPt->base.spriteX, chkPt->base.regionX);
    posY = TO_WORLD_POS(me->y, chkPt->base.regionY);

    s->x = posX - gCamera.x;
    s->y = posY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = chkPt->base.spriteX;
        TaskDestroy(chkPt->task);
        TaskDestroy(gCurTask);
    }
}

// static
void TaskDestructor_8063214(struct Task *t)
{
    Sprite_Checkpoint *chkPt = TaskGetStructPtr(t);
    void *gfx = chkPt->s.graphics.dest;
    VramFree(gfx);
}

void Task_8063228(struct Task *unused)
{
    u8 zone = LEVEL_TO_ZONE(gCurrentLevel);
    s32 animId = sAnimIdsCheckpoint[zone][0];
    s32 **anim = gAnimations[animId];
    s32 *cmd = anim[0];
    u32 palId;
    u32 numColors;
    u32 offset;

    if (*cmd++ == ANIM_CMD__GET_PALETTE) {
        palId = *cmd++;
        numColors = *cmd;
        offset = numColors >> 16;
        numColors %= 256;

        DmaCopy32(3, &gUnknown_03002794->palettes[palId * 16], &gBgPalette[offset],
                  numColors * sizeof(u16));

        gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
    }
}

static void Task_Interactable_Toggle_Checkpoint(void)
{
    Sprite_Toggle_Checkpoint *toggle = TaskGetStructPtr(gCurTask);
    MapEntity *me = toggle->base.me;
    s32 posX, posY;
    s16 screenX, screenY;

    posX = TO_WORLD_POS(toggle->base.spriteX, toggle->base.regionX);
    posY = TO_WORLD_POS(me->y, toggle->base.regionY);

    screenX = posX - gCamera.x;
    screenY = posY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        me->x = toggle->base.spriteX;
        TaskDestroy(gCurTask);
    } else if (!(gPlayer.moveState & (MOVESTATE_400000 | MOVESTATE_DEAD))
               && posX <= Q_24_8_TO_INT(gPlayer.x)) {
        gPlayer.checkPointX = gUnknown_080D63FC[gCurrentLevel][0];
        gPlayer.checkPointY = gUnknown_080D63FC[gCurrentLevel][1];
        gPlayer.checkpointTime = gCheckpointTime;

        if (gUnknown_030055B0 == 0)
            gUnknown_030055B0++;

        TaskDestroy(gCurTask);
    } else {
        if (gUnknown_030055B0 != 0)
            TaskDestroy(gCurTask);
    }
}

void CreateEntity_Toggle_Checkpoint(MapEntity *in_ia, u16 spriteRegionX,
                                    u16 spriteRegionY, u8 spriteY)
{
    if (gUnknown_030055B0 == 0) {
        struct Task *t = TaskCreate(Task_Interactable_Toggle_Checkpoint,
                                    sizeof(Sprite_Toggle_Checkpoint), 0x2010, 0, NULL);

        Sprite_Toggle_Checkpoint *toggle = TaskGetStructPtr(t);
        toggle->base.regionX = spriteRegionX;
        toggle->base.regionY = spriteRegionY;
        toggle->base.me = in_ia;
        toggle->base.spriteX = in_ia->x;
        toggle->base.spriteY = spriteY;
    }

    SET_MAP_ENTITY_INITIALIZED(in_ia);
}