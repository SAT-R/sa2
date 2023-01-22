#include "global.h"
#include "malloc_vram.h"
#include "m4a.h"

#include "game.h"
#include "task.h"
#include "main.h"

#include "data.h"
#include "flags.h"
#include "interactable.h"
#include "sprite.h"

#include "constants/animations.h"
#include "constants/anim_commands.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
} Sprite_Checkpoint;

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
} Sprite_Toggle_Checkpoint;

typedef struct {
    u16 anim;
    u8 variant; // <- TODO: Check that this is really 'variant'!
} TileInfo_Checkpoint;

// TODO: Make static
extern void Task_Interactable_Checkpoint(void);
static void Task_Interactable_Toggle_Checkpoint(void);

extern u32 gUnknown_030053E4;
extern const struct SpriteTables *gUnknown_03002794;
extern u32 gUnknown_080D63FC[34][2];

extern void **gAnimations[];

const TileInfo_Checkpoint gUnknown_080D94F8[NUM_COURSE_ZONES + 1] = {
    [ZONE_1] = { SA2_ANIM_898, 0 }, [ZONE_2] = { SA2_ANIM_899, 0 },
    [ZONE_3] = { SA2_ANIM_903, 0 }, [ZONE_4] = { SA2_ANIM_902, 0 },
    [ZONE_5] = { SA2_ANIM_904, 0 }, [ZONE_6] = { SA2_ANIM_947, 0 },
    [ZONE_7] = { SA2_ANIM_905, 0 }, [ZONE_FINAL] = { SA2_ANIM_899, 0 },
};

// static
void TaskDestructor_8063214(struct Task *t)
{
    Sprite_Checkpoint *chkPt = TaskGetStructPtr(t);
    void *gfx = chkPt->displayed.graphics.dest;
#ifdef UBFIX
    if (gfx)
#endif
    {
        VramFree(gfx);
    }
}

void sub_8063228(void)
{
    u8 zone = LEVEL_TO_ZONE(gCurrentLevel);
    s32 animId = gUnknown_080D94F8[zone].anim;
    s32 **anim = (s32 **)gAnimations[animId];
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
    Interactable *ia = toggle->base.ia;
    s32 posX, posY;
    s16 screenX, screenY;

    posX = SpriteGetScreenPos(toggle->base.spriteX, toggle->base.regionX);
    posY = SpriteGetScreenPos(ia->y, toggle->base.regionY);

    screenX = posX - gCamera.x;
    screenY = posY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        ia->x = toggle->base.spriteX;
        TaskDestroy(gCurTask);
    } else if (!(gPlayer.moveState & (MOVESTATE_400000 | MOVESTATE_DEAD))
               && posX <= Q_24_8_TO_INT(gPlayer.x)) {
        // __0806332C
        gPlayer.checkPointX = gUnknown_080D63FC[gCurrentLevel][0];
        gPlayer.checkPointY = gUnknown_080D63FC[gCurrentLevel][1];
        gPlayer.checkpointTime = gUnknown_030053E4;

        if (gUnknown_030055B0 == 0)
            gUnknown_030055B0++;

        TaskDestroy(gCurTask);
    } else {
        // _08063388
        if (gUnknown_030055B0 != 0)
            TaskDestroy(gCurTask);
    }
}

void initSprite_Interactable_Toggle_Checkpoint(Interactable *in_ia, u16 spriteRegionX,
                                               u16 spriteRegionY, u8 spriteY)
{
    if (gUnknown_030055B0 == 0) {
        struct Task *t = TaskCreate(Task_Interactable_Toggle_Checkpoint,
                                    sizeof(Sprite_Toggle_Checkpoint), 0x2010, 0, NULL);

        Sprite_Toggle_Checkpoint *toggle = TaskGetStructPtr(t);
        toggle->base.regionX = spriteRegionX;
        toggle->base.regionY = spriteRegionY;
        toggle->base.ia = in_ia;
        toggle->base.spriteX = in_ia->x;
        toggle->base.spriteY = spriteY;
    }

    SET_SPRITE_INITIALIZED(in_ia);
}