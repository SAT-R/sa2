#include "global.h"
#include "malloc_vram.h"
#include "game/entity.h"
#include "game/game.h"
#include "game/stage/entities_manager.h"
#include "task.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite_UNK28 reserved;
    /* 0x44 */ Sprite s2;
    /* 0x74 */ Sprite_UNK28 reserved2;
    /* 0x7C */ s32 spawnX;
    /* 0x80 */ s32 spawnY;
    /* 0x84 */ u8 unk84;
    /* 0x85 */ bool8 clampParam;
    /* 0x86 */ s16 unk86;
    /* 0x88 */ u16 unk88;
} Sprite_Circus; /* size: 0x6C */

void Task_CircusMain(void);
void TaskDestructor_Circus(struct Task *);

void CreateEntity_Circus(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    Sprite *s2;
    ENTITY_INIT(Sprite_Circus, circus, Task_CircusMain, 0x4090, 0,
                TaskDestructor_Circus);

    if (me->d.sData[1] != 0) {
        circus->clampParam = TRUE;
    } else {
        circus->clampParam = FALSE;
    }

    ENEMY_SET_SPAWN_POS_STATIC(circus, me);

    circus->unk84 = 1;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    SPRITE_INIT_EXCEPT_POS(s, 20, SA2_ANIM_CIRCUS, 0, 0x480, 2);

    s = &circus->s2;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT_EXCEPT_POS(s, 16, SA2_ANIM_CIRCUS_PROJ, 2, 0x480, 2);

    sub_8004558(s);
}