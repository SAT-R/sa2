#include "global.h"
#include "game/entity.h"
#include "game/enemies/gohla.h"

#include "game/sa1_sa2_shared/collision.h"

#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;

    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;

    /* 0x44 */ Sprite proj;

    /* 0x74 */ s32 spawnX;
    /* 0x78 */ s32 spawnY;
    /* 0x7C */ s32 offsetX;
    /* 0x80 */ s32 offsetY;

    /* 0x84 */ s32 projX;
    /* 0x88 */ s16 projY;
    /* 0x8A */ s16 projZ;

    /* 0x8C */ bool8 unk8C;
} Sprite_Gohla; /* size: 0x90 */

static void sub_8051928(void);
static bool8 CheckPlayerHit(Sprite_Gohla *gohla, s32 x, s32 y);
static void sub_8051AF0(void);
static void RenderProjectiles(Sprite_Gohla *gohla, s16 x, s16 y, u32);
static void TaskDestructor_Gohla(struct Task *);

void CreateEntity_Gohla(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (gGameMode == GAME_MODE_TIME_ATTACK || gDifficultyLevel != 1) {
        struct Task *t = TaskCreate(sub_8051928, sizeof(Sprite_Gohla), 0x4040, 0, TaskDestructor_Gohla);
        Sprite_Gohla *gohla = TASK_DATA(t);
        Sprite *s = &gohla->s;
        gohla->base.regionX = spriteRegionX;
        gohla->base.regionY = spriteRegionY;
        gohla->base.me = me;
        gohla->base.meX = me->x;
        gohla->base.id = spriteY;

        if (me->d.sData[1]) {
            gohla->unk8C = TRUE;
        } else {
            gohla->unk8C = FALSE;
        }

        gohla->spawnX = Q(TO_WORLD_POS(me->x, spriteRegionX));
        gohla->spawnY = Q(TO_WORLD_POS(me->y, spriteRegionY));
        gohla->offsetX = 0;
        gohla->offsetY = Q(sub_801F07C(I(gohla->spawnY), I(gohla->spawnX), gohla->unk8C, 8, NULL, sub_801EE64));
        gohla->projX = 0;
        gohla->projY = 0;
        gohla->projZ = 0;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);
        SPRITE_INIT(s, 9, SA2_ANIM_GOHLA, 0, 18, 2);

        s = &gohla->proj;
        s->x = 0;
        s->y = 0;
        SPRITE_INIT(s, 6, SA2_ANIM_GOHLA_PROJ, 0, 17, 2);
    }
}

static void sub_8051928(void)
{
#ifndef NON_MATCHING
    register IwramData ref asm("r1") = gCurTask->data;
    Sprite_Gohla *gohla = (Sprite_Gohla *)IWRAM_PTR(ref);
    register Sprite *s asm("r5") = &gohla->s;
#else
    Sprite_Gohla *gohla = TASK_DATA(gCurTask);
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

    ENEMY_UPDATE_POSITION(gohla, s, pos.x, pos.y);
    if (CheckPlayerHit(gohla, pos.x, pos.y)) {
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
    RenderProjectiles(gohla, s->x, s->y - 4, s->frameFlags);
}

static void sub_8051AF0(void)
{
    Sprite_Gohla *gohla = TASK_DATA(gCurTask);
    Sprite *s = &gohla->s;
    MapEntity *me = gohla->base.me;
    Vec2_32 pos;

    s32 delta = ENEMY_CLAMP_TO_GROUND_INNER(gohla, gohla->unk8C, sub_801EC3C);

    if (delta < 0) {
        gohla->offsetY += Q(delta);
        delta = ENEMY_CLAMP_TO_GROUND_INNER(gohla, gohla->unk8C, sub_801EC3C);
    }

    if (delta > 0) {
        gohla->offsetY += Q(delta);
    }

    ENEMY_UPDATE_POSITION(gohla, s, pos.x, pos.y);

    if (CheckPlayerHit(gohla, pos.x, pos.y)) {
        TaskDestroy(gCurTask);
        return;
    }

    ENEMY_DESTROY_IF_OFFSCREEN(gohla, me, s);

    Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));
    if (UpdateSpriteAnimation(s) == 0) {
        ENEMY_TURN_AROUND(s);
        s->graphics.anim = SA2_ANIM_GOHLA;
        s->variant = 0;
        s->prevVariant = -1;
        gCurTask->main = sub_8051928;
    }

    DisplaySprite(s);
    RenderProjectiles(gohla, s->x, s->y - 4, s->frameFlags);
}

static void RenderProjectiles(Sprite_Gohla *gohla, s16 x, s16 y, u32 flags)
{
    u8 i;
    Sprite *proj = &gohla->proj;

    UpdateSpriteAnimation(proj);

    gohla->projY = (gohla->projY + 24) & ONE_CYCLE;
    gohla->projZ = (gohla->projZ + 32) & ONE_CYCLE;

    if (flags & SPRITE_FLAG_MASK_X_FLIP) {
        SPRITE_FLAG_SET(proj, X_FLIP);
    } else {
        SPRITE_FLAG_CLEAR(proj, X_FLIP);
    }

    for (i = 0; i < 4; i++) {
        u16 pos[2];
        pos[0] = ((i * 256) + gohla->projY) & 0x3FF;
        pos[1] = ((i * 384) + gohla->projZ) & 0x3FF;

        proj->x = x + (COS(pos[0]) >> 10);
        proj->y = y + (SIN(pos[1]) >> 13);

        if (pos[0] >= 0x200) {
            proj->oamFlags = SPRITE_OAM_ORDER(17);
        } else {
            proj->oamFlags = SPRITE_OAM_ORDER(19);
        }
        DisplaySprite(proj);
    }
}

static bool8 CheckPlayerHit(Sprite_Gohla *gohla, s32 x, s32 y)
{
    Sprite *s = &gohla->s;
    bool8 ret = FALSE;
    if (Coll_Player_Enemy_Attack(s, x, y, 0) != 0) {
        ret = TRUE;
    } else {
        Coll_Player_Enemy(s, x, y, 0, &gPlayer);
        Coll_Player_Enemy(s, x, y, 1, &gPlayer);
    }

    return ret;
}

static void TaskDestructor_Gohla(struct Task *t)
{
    Sprite_Gohla *gohla = TASK_DATA(t);
    VramFree(gohla->s.graphics.dest);
    VramFree(gohla->proj.graphics.dest);
}
