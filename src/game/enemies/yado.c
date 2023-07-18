#include "global.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/entity.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite_UNK28 reserved;
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;
    /* 0x4C */ u8 unk4C;
    /* 0x4D */ bool8 clampParam;
    /* 0x4E */ u8 filler4E[0x2];
} Sprite_Yado;

void Task_YadoMain(void);
void TaskDestructor_Yado(struct Task *);

void CreateEntity_Yado(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    s32 regX, regY;
    ENTITY_INIT(Sprite_Yado, yado, Task_YadoMain, 0x4090, 0, TaskDestructor_Yado);

    if (me->d.sData[1] != 0) {
        yado->clampParam = TRUE;
    } else {
        yado->clampParam = FALSE;
    }

    ENEMY_SET_SPAWN_POS_STATIC(yado, me);

    regX = spriteRegionX;
    regY = spriteRegionY;
    s->x = TO_WORLD_POS(me->x, regX);
    s->y = TO_WORLD_POS(me->y, regY);

    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT_EXCEPT_POS(s, 12, SA2_ANIM_YADO, 0, 0x480, 2);
}