#include "global.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/entity.h"
#include "lib/m4a.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite_UNK28 reserved;
    /* 0x44 */ s32 spawnX;
    /* 0x48 */ s32 spawnY;
    /* 0x4C */ u8 unk4C;
    /* 0x4D */ bool8 clampParam;
} Sprite_Yado;

void Task_YadoMain(void);
void Task_8055084(void);
void Task_8055378(void);
void TaskDestructor_Yado(struct Task *);

#define YADO_PLAYER_ACCEL  -Q_24_8(9.0)
#define YADO_PROJ_COOLDOWN (2 * GBA_FRAMES_PER_SECOND)

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

#if 01
void Task_YadoMain(void)
{
    Sprite_Yado *yado = TaskGetStructPtr(gCurTask);
    Sprite *s = &yado->s;
    MapEntity *me = yado->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(yado, s, pos.x, pos.y);

    if (sub_800C204(s, pos.x, pos.y, 0, &gPlayer, 0) == TRUE) {
        m4aSongNumStart(SE_SPRING);
        gPlayer.speedAirY = YADO_PLAYER_ACCEL;
        gPlayer.unk64 = SA2_CHAR_ANIM_50;
        gPlayer.unk6C = 1;
        gPlayer.unk6D = 5;

        // TODO: Why is this called twice?
        m4aSongNumStart(SE_SPRING);
    }

    ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(yado, me, s);

    // BUG(?): yado->unk4C wasn't set in CreateEntity_Yado
    if (--yado->unk4C == 0) {
        yado->unk4C = YADO_PROJ_COOLDOWN;
        gCurTask->main = Task_8055084;
        s->graphics.anim = SA2_ANIM_YADO;
        s->variant = 1;
        s->unk21 = 0xFF;
    } else if (((Q_24_8_TO_INT(gPlayer.x) < pos.x)
                && (s->unk10 & SPRITE_FLAG_MASK_X_FLIP))
               || ((Q_24_8_TO_INT(gPlayer.x) > pos.x)
                   && !(s->unk10 & SPRITE_FLAG_MASK_X_FLIP))) {
        gCurTask->main = Task_8055378;
        s->graphics.anim = SA2_ANIM_YADO;
        s->variant = 3;
        s->unk21 = 0xFF;
    }

    ENEMY_UPDATE_EX_RAW(s, yado->spawnX, yado->spawnY, {});
}
#endif