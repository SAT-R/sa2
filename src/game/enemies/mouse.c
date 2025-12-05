#include "global.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/entity.h"
#include "game/enemies/mouse.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "malloc_vram.h"
#include "sprite.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 spawnX;
    /* 0x40 */ s32 spawnY;
    /* 0x44 */ s32 offsetX;
    /* 0x48 */ s32 offsetY;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ u8 unk50;
    /* 0x51 */ u8 unk51;
    /* 0x52 */ u8 unk52;
} Sprite_Mouse; /* size: 0x54*/

static void sub_8057348(void);
static void sub_8057618(void);

void CreateEntity_Mouse(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (gGameMode == GAME_MODE_TIME_ATTACK || gDifficultyLevel != 1) {
        struct Task *t = TaskCreate(sub_8057348, sizeof(Sprite_Mouse), 0x4040, 0, TaskDestructor_80095E8);
        Sprite_Mouse *mouse = TASK_DATA(t);
        Sprite *s = &mouse->s;
        mouse->base.regionX = spriteRegionX;
        mouse->base.regionY = spriteRegionY;
        mouse->base.me = me;
        mouse->base.meX = me->x;
        mouse->base.id = spriteY;

        if (me->d.sData[1] != 0) {
            mouse->unk50 = 1;
        } else {
            mouse->unk50 = 0;
        }

        mouse->spawnX = Q(TO_WORLD_POS(me->x, spriteRegionX));
        mouse->spawnY = Q(TO_WORLD_POS(me->y, spriteRegionY));

        mouse->offsetX = 0;

        if (me->d.uData[3] != 0) {
            mouse->unk51 = 1;
        } else {
            mouse->unk51 = 0;
        }

        if (mouse->unk51) {
            mouse->offsetY = Q(sub_801F07C(I(mouse->spawnY), I(mouse->spawnX), mouse->unk50, 8, 0, sub_801EE64));
        } else {
            mouse->offsetY = Q(sub_801F07C(I(mouse->spawnY), I(mouse->spawnX), mouse->unk50, 8, 0, sub_801EE64));
        }
        mouse->unk4C = 0;
        mouse->unk52 = 0;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        SPRITE_INIT(s, 15, SA2_ANIM_MOUSE, 0, 18, 2);

        if (mouse->unk51) {
            SPRITE_FLAG_SET(s, Y_FLIP);
        }
    }
}

static void sub_8057348(void)
{
    Sprite_Mouse *mouse = TASK_DATA(gCurTask);

    Sprite *s = &mouse->s;
    MapEntity *me = mouse->base.me;

    Vec2_32 pos;

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        if (mouse->unk52) {
            mouse->offsetX += 0x200;
        } else {
            mouse->offsetX += 0x80;
        }
    } else {
        if (mouse->unk52) {
            mouse->offsetX -= 0x200;
        } else {
            mouse->offsetX -= 0x80;
        }
    }

    if (mouse->unk51) {
        ENEMY_CLAMP_TO_GROUND_2(mouse, mouse->unk50);
        pos.x = I(mouse->spawnX + mouse->offsetX) + 8;
        pos.y = I(mouse->spawnY + mouse->offsetY) + 8;

    } else {
        ENEMY_CLAMP_TO_GROUND(mouse, mouse->unk50);
        pos.x = I(mouse->spawnX + mouse->offsetX);
        pos.y = I(mouse->spawnY + mouse->offsetY);
    }

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;
    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(mouse, me, s);

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        if (gPlayer.qWorldX > QS(pos.x) && gPlayer.qWorldX < QS(pos.x + 100)) {
            mouse->unk52 = 1;
        }
    } else {
        if (gPlayer.qWorldX < QS(pos.x) && gPlayer.qWorldX > QS(pos.x - 100)) {
            mouse->unk52 = 1;
        }
    }

    if (I(mouse->offsetX) <= (me->d.sData[0] * TILE_WIDTH) && !(s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)) {
        gCurTask->main = sub_8057618;
        s->graphics.anim = SA2_ANIM_MOUSE;
        s->variant = 1;
        s->prevVariant = -1;
    } else if ((I(mouse->offsetX) >= ((me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH) && s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)) {
        gCurTask->main = sub_8057618;
        s->graphics.anim = SA2_ANIM_MOUSE;
        s->variant = 1;
        s->prevVariant = -1;
    }

    Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void sub_8057618(void)
{
    Sprite_Mouse *mouse = TASK_DATA(gCurTask);

    Sprite *s = &mouse->s;
    MapEntity *me = mouse->base.me;

    Vec2_32 pos;

    if (mouse->unk51) {
        ENEMY_CLAMP_TO_GROUND_2(mouse, mouse->unk50);
        pos.x = I(mouse->spawnX + mouse->offsetX) + 8;
        pos.y = I(mouse->spawnY + mouse->offsetY) + 8;
    } else {
        ENEMY_CLAMP_TO_GROUND(mouse, mouse->unk50);
        pos.x = I(mouse->spawnX + mouse->offsetX);
        pos.y = I(mouse->spawnY + mouse->offsetY);
    }

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN(mouse, me, s);

    Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));

    if (UpdateSpriteAnimation(s) == 0) {
        mouse->unk52 = 0;

        ENEMY_TURN_AROUND(s);

        s->graphics.anim = SA2_ANIM_MOUSE;
        s->variant = 0;
        s->prevVariant = -1;

        gCurTask->main = sub_8057348;
    }

    DisplaySprite(s);
}
