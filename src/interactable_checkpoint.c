#include "global.h"
#include "malloc_vram.h"
#include "m4a.h"

#include "game.h"
#include "task.h"

#include "interactable.h"
#include "sprite.h"

#include "constants/animations.h"
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
extern void Task_Interactable_Toggle_Checkpoint(void);



//const static TileInfoCheckpoint sCheckpointTileInfo[8] = { {} };

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