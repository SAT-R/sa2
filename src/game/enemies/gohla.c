#include "global.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/enemies/gohla.h"
#include "malloc_vram.h"
#include "sprite.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
    /* 0x44 */ Sprite s2;
    /* 0x74 */ s32 spawnX;
    /* 0x78 */ s32 spawnY;
    /* 0x7C */ s32 offsetX;
    /* 0x80 */ s32 offsetY;
    /* 0x84 */ s32 unk84;
    /* 0x88 */ s16 unk88;
    /* 0x8A */ s16 unk8A;
    /* 0x8C */ u8 unk8C;
} Sprite_Gohla; /* size: 0x90 */

void sub_8051928(void);

void sub_8051E20(struct Task *);

void CreateEntity_Gohla(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (gGameMode == GAME_MODE_TIME_ATTACK || gDifficultyLevel != 1) {
        struct Task *t
            = TaskCreate(sub_8051928, sizeof(Sprite_Gohla), 0x4040, 0, sub_8051E20);
        Sprite_Gohla *gohla = TaskGetStructPtr(t);
        Sprite *s = &gohla->s;
        gohla->base.regionX = spriteRegionX;
        gohla->base.regionY = spriteRegionY;
        gohla->base.me = me;
        gohla->base.spriteX = me->x;
        gohla->base.spriteY = spriteY;

        if (me->d.sData[1]) {
            gohla->unk8C = 1;
        } else {
            gohla->unk8C = 0;
        }

        gohla->spawnX = Q_24_8(TO_WORLD_POS(me->x, spriteRegionX));
        gohla->spawnY = Q_24_8(TO_WORLD_POS(me->y, spriteRegionY));
        gohla->offsetX = 0;
        gohla->offsetY = Q_24_8(sub_801F07C(Q_24_8_TO_INT(gohla->spawnY),
                                            Q_24_8_TO_INT(gohla->spawnX), gohla->unk8C,
                                            8, NULL, sub_801EE64));
        gohla->unk84 = 0;
        gohla->unk88 = 0;
        gohla->unk8A = 0;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);
        SPRITE_INIT(s, 9, SA2_ANIM_GOHLA, 0, 18, 2);

        s = &gohla->s2;
        s->x = 0;
        s->y = 0;
        SPRITE_INIT(s, 6, SA2_ANIM_GOHLA_PROJ, 0, 17, 2);
    }
}

u8 sub_8051DC8(Sprite_Gohla *gohla);

void sub_8051AF0(void);

void sub_8051CB8(Sprite_Gohla *gohla, s16 x, s16 y, u32);

void sub_8051928(void)
{
#ifndef NON_MATCHING
    register IwramData ref asm("r1") = gCurTask->data;
    Sprite_Gohla *gohla = (void *)IWRAM_START + ref;
    register Sprite *s asm("r5") = &gohla->s;
#else
    Sprite_Gohla *gohla = TaskGetStructPtr(gCurTask);
    Sprite *s = &gohla->s;
#endif
    MapEntity *me = gohla->base.me;
    Vec2_32 pos;

    if (SPRITE_FLAG_GET(s, X_FLIP)) {
        gohla->offsetX += 0x80;
    } else {
        gohla->offsetX -= 0x80;
    }

    ENEMY_CLAMP_TO_GROUND(gohla, gohla->unk8C);

#ifndef NON_MATCHING
    pos.x = ({
        register s32 x asm("r1");
        x = gohla->spawnX;
        x += gohla->offsetX;
        x = Q_24_8_TO_INT(x);
        asm("" ::"r"(x));
        x;
    });
    pos.y = ({
        register s32 y asm("r2");
        y = gohla->spawnY;
        y += gohla->offsetY;
        y = Q_24_8_TO_INT(y);
        asm("" ::"r"(y));
        y;
    });
    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;
#else
    ENEMY_UPDATE_POSITION(gohla, s, pos.x, pos.y);
#endif

    if (sub_8051DC8(gohla) != 0) {
        TaskDestroy(gCurTask);
        return;
    }

    ENEMY_DESTROY_IF_OFFSCREEN(gohla, me, s);
    if (ENEMY_CROSSED_LEFT_BORDER(gohla, me) || ENEMY_CROSSED_RIGHT_BORDER(gohla, me)) {
        gCurTask->main = sub_8051AF0;
        s->graphics.anim = SA2_ANIM_GOHLA;
        s->variant = 1;
        s->prevVariant = -1;
    }
    ENEMY_UPDATE(s, pos.x, pos.y);
    sub_8051CB8(gohla, s->x, s->y - 4, s->unk10);
}
