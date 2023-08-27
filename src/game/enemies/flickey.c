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
    /* 0x3C */ u8 filler3c[0x10];
    /* 0x4C */ Sprite s2;

    u8 filler7C[0x10];

    /* 0x8C */ s32 spawnX;
    /* 0x90 */ s32 spawnY;
    /* 0x94 */ s32 offsetX;
    /* 0x98 */ s32 offsetY;

    // Might be Vec2_16?
    /* 0x9C */ s16 unk9C;
    /* 0x9E */ s16 unk9E;

    u8 unkA0;

    /* 0xA4 */ Vec2_32 positions[64];
    /* 0x2A4 */ u8 unk2A4;
} Sprite_Flickey; /* size: 0x2A8 */

void Task_FlickeyMain(void);
void TaskDestructor_Flickey(struct Task *);

void CreateEntity_Flickey(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                          u8 spriteY)
{
    u8 i;
    s32 x, y;
    Vec2_32 pos;
    if (DIFFICULTY_LEVEL_IS_NOT_EASY) {
        struct Task *t = TaskCreate(Task_FlickeyMain, sizeof(Sprite_Flickey), 0x4040, 0,
                                    TaskDestructor_Flickey);
        Sprite_Flickey *flickey = TaskGetStructPtr(t);
        Sprite *s = &flickey->s;
        flickey->base.regionX = spriteRegionX;
        flickey->base.regionY = spriteRegionY;
        flickey->base.me = me;
        flickey->base.spriteX = me->x;
        flickey->base.spriteY = spriteY;

        ENEMY_SET_SPAWN_POS_FLYING(flickey, me);

        flickey->unk9C = -Q_24_8(1.5);
        flickey->unk9E = -Q_24_8(4.0);
        flickey->unk2A4 = 0;

        x = Q_24_8(flickey->spawnX);
        y = Q_24_8(flickey->spawnY);

        for (i = 0; i < ARRAY_COUNT(flickey->positions); i++) {
            flickey->positions[i].x = Q_24_8_TO_INT(x >> 8);
            flickey->positions[i].y = Q_24_8_TO_INT(y >> 8);
        }

        s->x = 0;
        s->y = 0;
        SET_MAP_ENTITY_INITIALIZED(me);

        SPRITE_INIT(s, 20, SA2_ANIM_FLICKEY, 1, 18, 2);

        s = &flickey->s2;
        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SPRITE_INIT(s, 8, SA2_ANIM_FLICKEY_PROJ, 0, 19, 2);
    }
}

#if 0
// Matches
void Flickey_RenderIronBalls(Sprite_Flickey *flickey)
{
    u8 i;
    Sprite *s = &flickey->s2;
    UpdateSpriteAnimation(s);

    for (i = 0; i < 3; i++) {
        u8 index = (flickey->unk2A4 - (i + 1) * 16) & 0x3F;
        s->x = flickey->positions[index].x - gCamera.x;
        s->y = flickey->positions[index].y - gCamera.y;
        DisplaySprite(s);

        SPRITE_FLAG_FLIP(s, X_FLIP);
        DisplaySprite(s);
    }
}

// Matches
void TaskDestructor_Flickey(struct Task *t)
{
    Sprite_Flickey *flickey = TaskGetStructPtr(t);
    VramFree(flickey->s.graphics.dest);
    VramFree(flickey->s2.graphics.dest);
}
#endif