#include "global.h"
#include "gba/types.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_ClearPipe;

extern void Task_80106E8(void);
extern void Task_80107EC(void);

extern void sub_802A004(void);

void Task_80107EC(void) {
    Sprite_ClearPipe *pipe = TaskGetStructPtr(gCurTask);
    Interactable *ia = pipe->base.ia;
    s32 screenX, screenY;

    screenX = SpriteGetScreenPos(pipe->base.spriteX, pipe->base.regionX);
    screenY = SpriteGetScreenPos(ia->y, pipe->base.regionY);

    if(!(gPlayer.moveState & MOVESTATE_DEAD)
    && (screenX <= Q_24_8_TO_INT(gPlayer.x))
    && ((screenX + 24) >= Q_24_8_TO_INT(gPlayer.x))
    && (screenY <= Q_24_8_TO_INT(gPlayer.y))
    && ((screenY + 24) >= Q_24_8_TO_INT(gPlayer.y))
    && (gPlayer.moveState & MOVESTATE_80000)) {
        gPlayer.moveState &= ~(MOVESTATE_80000 | MOVESTATE_200 | MOVESTATE_IN_AIR);
        
        gPlayer.unk90->unk1C &= ~(FLAG_3005A70_x1C__1000 | FLAG_3005A70_x1C__2000);
        gPlayer.unk90->unk1C |= FLAG_3005A70_x1C__2000;

        gPlayer.unk38 = FLAG_PLAYER_x38__LAYER_FOREGROUND;
        if (ia->d.sData[0]) {
            gPlayer.unk38 = FLAG_PLAYER_x38__LAYER_BACKGROUND;
        }
        
        // Clears MOVESTATE_INSIDE_PIPE
        sub_802A004();
    }
    
    screenX -= gCamera.x;
    screenY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        ia->x = pipe->base.spriteX;
        TaskDestroy(gCurTask);
    }
}

void initSprite_Interactable_ClearPipe_Start(Interactable *ia, u16 spriteRegionX,
                                             u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_80106E8, sizeof(Sprite_ClearPipe), 0x2010, 0, NULL);

    Sprite_ClearPipe *pipe = TaskGetStructPtr(t);
    pipe->base.regionX = spriteRegionX;
    pipe->base.regionY = spriteRegionY;
    pipe->base.ia = ia;
    pipe->base.spriteX = ia->x;
    SET_SPRITE_INITIALIZED(ia);
}

void initSprite_Interactable_ClearPipe_End(Interactable *ia, u16 spriteRegionX,
                                             u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_80107EC, sizeof(Sprite_ClearPipe), 0x2010, 0, NULL);

    Sprite_ClearPipe *pipe = TaskGetStructPtr(t);
    pipe->base.regionX = spriteRegionX;
    pipe->base.regionY = spriteRegionY;
    pipe->base.ia = ia;
    pipe->base.spriteX = ia->x;
    SET_SPRITE_INITIALIZED(ia);
}
