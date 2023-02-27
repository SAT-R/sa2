#include "global.h"
#include "gba/types.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "interactable.h"
#include "engine/sprite.h"
#include "engine/task.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
} Sprite_ClearPipe;

typedef struct {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    /* 0x03 */ s8 unk3;
    /* 0x04 */ s8 unk4;
    /* 0x05 */ u8 unused[INTERACTABLE_DATA_SIZE - 2];
} Interactable_PipeStart PACKED;

typedef struct {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    /* 0x03 */ s8 exitOnBackLayer;
    /* 0x04 */ s8 unk4;
    /* 0x05 */ u8 unused[INTERACTABLE_DATA_SIZE - 2];
} Interactable_PipeEnd PACKED;

static void Task_ClearPipe_Start(void)
{
    Sprite_ClearPipe *pipe = TaskGetStructPtr(gCurTask);
    SpriteBase *base = &pipe->base;
    Interactable_PipeStart *ia = (Interactable_PipeStart *)base->ia;

    u8 spriteX = base->spriteX;
    s32 regionX = base->regionX;
    s32 regionY = base->regionY;

    s32 screenX, screenY;
    screenX = SpriteGetScreenPos(spriteX, regionX);
    screenY = SpriteGetScreenPos(ia->y, regionY);

    if (!(gPlayer.moveState & MOVESTATE_DEAD) && (screenX <= Q_24_8_TO_INT(gPlayer.x))
        && ((screenX + 24) >= Q_24_8_TO_INT(gPlayer.x))
        && (screenY <= Q_24_8_TO_INT(gPlayer.y))
        && ((screenY + 24) >= Q_24_8_TO_INT(gPlayer.y))
        && (!(gPlayer.moveState & MOVESTATE_80000))) {
        u8 flag;

        gPlayer.unk6D = 0x19;

        flag = (ia->unk3 & 0x03) << 4;
        flag |= ia->unk4 & 0x0F;
        gPlayer.unk6E = flag;

        gPlayer.x = Q_24_8(screenX + 12);
        gPlayer.y = Q_24_8(screenY + 12);

        Player_SetMovestate_IsInScriptedSequence();

        gPlayer.unk37 &= ~(0x10);
        gPlayer.unk30 = 0;

        m4aMPlayTempoControl(&gMPlayInfo_BGM, 0x100);
    }

    screenX -= gCamera.x;
    screenY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

static void Task_ClearPipe_End(void)
{
    Sprite_ClearPipe *pipe = TaskGetStructPtr(gCurTask);
    SpriteBase *base = &pipe->base;
    Interactable_PipeEnd *ia = (Interactable_PipeEnd *)base->ia;

    u8 spriteX = base->spriteX;
    s32 regionX = base->regionX;
    s32 regionY = base->regionY;

    s32 screenX, screenY;
    screenX = SpriteGetScreenPos(spriteX, regionX);
    screenY = SpriteGetScreenPos(ia->y, regionY);

    if (!(gPlayer.moveState & MOVESTATE_DEAD) && (screenX <= Q_24_8_TO_INT(gPlayer.x))
        && ((screenX + 24) >= Q_24_8_TO_INT(gPlayer.x))
        && (screenY <= Q_24_8_TO_INT(gPlayer.y))
        && ((screenY + 24) >= Q_24_8_TO_INT(gPlayer.y))
        && (gPlayer.moveState & MOVESTATE_80000)) {
        gPlayer.moveState &= ~(MOVESTATE_80000 | MOVESTATE_200 | MOVESTATE_IN_AIR);

        gPlayer.unk90->unk1C &= ~(FLAG_3005A70_x1C__1000 | FLAG_3005A70_x1C__2000);
        gPlayer.unk90->unk1C |= FLAG_3005A70_x1C__2000;

        gPlayer.unk38 = FLAG_PLAYER_x38__LAYER_FOREGROUND;
        if (ia->exitOnBackLayer) {
            gPlayer.unk38 = FLAG_PLAYER_x38__LAYER_BACKGROUND;
        }

        gPlayer.unk6D = 0x1C;
        if (ia->unk4 != 0) {
            gPlayer.unk6D = 0x5;
        }

        Player_ClearMovestate_IsInScriptedSequence();
    }

    screenX -= gCamera.x;
    screenY -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX, screenY)) {
        ia->x = spriteX;
        TaskDestroy(gCurTask);
    }
}

void initSprite_Interactable_ClearPipe_Start(Interactable *ia, u16 spriteRegionX,
                                             u16 spriteRegionY, u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_ClearPipe_Start, sizeof(Sprite_ClearPipe), 0x2010, 0, NULL);

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
    struct Task *t
        = TaskCreate(Task_ClearPipe_End, sizeof(Sprite_ClearPipe), 0x2010, 0, NULL);

    Sprite_ClearPipe *pipe = TaskGetStructPtr(t);
    pipe->base.regionX = spriteRegionX;
    pipe->base.regionY = spriteRegionY;
    pipe->base.ia = ia;
    pipe->base.spriteX = ia->x;
    SET_SPRITE_INITIALIZED(ia);
}
