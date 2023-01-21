#include "global.h"
#include "malloc_vram.h"
#include "m4a.h"

#include "game.h"
#include "task.h"

#include "interactable.h"
#include "sprite.h"

#include "constants/animations.h"
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
} TileInfoCheckpoint;

// TODO: Make static
extern void Task_Interactable_Checkpoint(void);
static void Task_Interactable_Toggle_Checkpoint(void);

extern u32 gUnknown_030053E4;
extern u32 gUnknown_080D63FC[34][2];

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