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
    /* 0x88 */ s16 unk88;
} Sprite_Circus; /* size: 0x6C */

void Task_CircusMain(void);
void Task_8055AB8(void);
void Task_8055C0C(void);
void Task_8055D7C(void);
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

void Task_CircusMain(void)
{
    Sprite_Circus *circus = TaskGetStructPtr(gCurTask);
    Sprite *s = &circus->s;
    Sprite *s2 = &circus->s2;
    MapEntity *me = circus->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(circus, s, pos.x, pos.y);

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);

    ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(circus, me, s);

    if (--circus->unk84 == 0) {
        circus->unk88 = -Q_24_8(5.0);
        circus->unk86 = -Q_24_8(8.0);
        circus->unk84 = 30;

        gCurTask->main = Task_8055AB8;
        s->graphics.anim = SA2_ANIM_CIRCUS;
        s->variant = 1;
        s->unk21 = -1;
    }

    ENEMY_UPDATE_EX_RAW(s, circus->spawnX, circus->spawnY, {});
    s2->x = s->x;
    s2->y = s->y - Q_24_8(0.125);

    sub_800C84C(s2, pos.x, pos.y - 0x20);
    sub_80051E8(s2);
}

void Task_8055AB8(void)
{
    Sprite_Circus *circus = TaskGetStructPtr(gCurTask);
    Sprite *s = &circus->s;
    Sprite *s2 = &circus->s2;
    MapEntity *me = circus->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(circus, s, pos.x, pos.y);

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);

    ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(circus, me, s);

    sub_80122DC(circus->spawnX, circus->spawnY);

    if (sub_8004558(s) == 0) {
        sub_80051E8(s);
        sub_8004558(s2);
        sub_80051E8(s2);

        circus->unk84 = 50;

        s->graphics.anim = SA2_ANIM_CIRCUS;
        s->variant = 2;
        s->unk21 = -1;
        gCurTask->main = Task_8055C0C;
        return;
    }

    sub_80051E8(s);
    s2->x = s->x;
    s2->y = s->y - Q_24_8(0.125);

    sub_800C84C(s2, pos.x, pos.y - 0x20);
    sub_80051E8(s2);
}

void Task_8055C0C(void)
{
    MapEntity *me;
    Sprite_Circus *circus = TaskGetStructPtr(gCurTask);
    Sprite *s = &circus->s;
    Sprite *s2 = &circus->s2;
    Vec2_32 pos;
    me = circus->base.me;

    ENEMY_UPDATE_POSITION_STATIC(circus, s, pos.x, pos.y);

    circus->unk88 += 0x31;
    circus->unk86 += circus->unk88;
    s2->y = (s->y + Q_24_8_TO_INT(circus->unk86)) - Q_24_8(0.125);

    s2->x = s->x;

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);

    sub_800C84C(s2, pos.x, pos.y + Q_24_8_TO_INT(circus->unk86) - 0x20);

    ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(circus, me, s);

    sub_80122DC(circus->spawnX, circus->spawnY);

    sub_8004558(s);
    sub_80051E8(s);
    sub_8004558(s2);
    sub_80051E8(s2);

    if (--circus->unk84 == 0) {
        s->graphics.anim = SA2_ANIM_CIRCUS;
        s->variant = 3;
        s->unk21 = -1;
        gCurTask->main = Task_8055D7C;
    }
}

void Task_8055D7C(void)
{
    Sprite_Circus *circus = TaskGetStructPtr(gCurTask);
    Sprite *s = &circus->s;
    Sprite *s2 = &circus->s2;
    MapEntity *me = circus->base.me;
    Vec2_32 pos;

    pos.x = Q_24_8_TO_INT(circus->spawnX);
    pos.y = Q_24_8_TO_INT(circus->spawnY);
    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);

    ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(circus, me, s);

    sub_80122DC(circus->spawnX, circus->spawnY);

    if (sub_8004558(s) == 0) {
        sub_80051E8(s);

        circus->unk84 = 30;

        s->graphics.anim = SA2_ANIM_CIRCUS;
        s->variant = 0;
        s->unk21 = -1;
        gCurTask->main = Task_CircusMain;
    } else {
        sub_80051E8(s);
    }

    s2->x = s->x;
    s2->y = s->y - Q_24_8(0.125);

    sub_800C84C(s2, pos.x, pos.y - 0x20);
    sub_80051E8(s2);
}

void TaskDestructor_Circus(struct Task *t)
{
    Sprite_Circus *circus = TaskGetStructPtr(t);
    VramFree(circus->s.graphics.dest);
    VramFree(circus->s2.graphics.dest);
}