#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

#define NUM_SPARKS          2
#define FIREBALL_SPAWN_RATE TIME(0, 4)

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ s16 unk4;
    /* 0x06 */ u8 meX;
    /* 0x08 */ u16 regionX;
    /* 0x0A */ u16 regionY;
} FireballSpawner;

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ s16 qUnk3C;
    /* 0x3E */ s16 unk3E;
    /* 0x40 */ s16 unk40;
    /* 0x44 */ s32 unk44;
} Fireball; /* 0x48 */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s16 unk30;
    /* 0x32 */ u16 unk32;
    /* 0x34 */ s16 qUnk34;
    /* 0x36 */ u16 unk36;
} FireballSpark; /* 0x38 */

void Task_Fireball(void);
void Task_FireballSpark(void);
void CreateFireballSparks(s16 screenX, s16 screenY);
void Task_FireballUpdateRise(void);
void Task_FireballExtinguish(void);

void Task_Fireball(void)
{
    FireballSpawner *spawner = TASK_DATA(gCurTask);
    MapEntity *me = spawner->me;
    CamCoord worldX, worldY;
    s32 sb;

    worldX = TO_WORLD_POS(spawner->meX, spawner->regionX);
    worldY = TO_WORLD_POS(me->y, spawner->regionY);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spawner->meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Mod(gStageTime + spawner->unk4, FIREBALL_SPAWN_RATE) == 0) {
        Task *t = TaskCreate(Task_FireballUpdateRise, sizeof(Fireball), 0x2000, 0, TaskDestructor_EntityShared);
        Fireball *fireball = TASK_DATA(t);
        Sprite *s = &fireball->shared.s;
        fireball->shared.base.regionX = spawner->regionX;
        fireball->shared.base.regionY = spawner->regionY;
        fireball->shared.base.me = spawner->me;
        fireball->shared.base.meX = spawner->meX;
        fireball->qUnk3C = -Q(6);
        fireball->unk3E = worldX;
        fireball->unk40 = worldY + 24;
        fireball->unk44 = fireball->unk40;

        s->x = TO_WORLD_POS(me->x, spawner->regionX);
        s->y = TO_WORLD_POS(me->y, spawner->regionY);

        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = ALLOC_TILES(SA1_ANIM_FIREBALL);
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_FIREBALL;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        UpdateSpriteAnimation(s);
    }
}

void Task_FireballUpdateRise(void)
{
    Fireball *fireball = TASK_DATA(gCurTask);
    Sprite *s = &fireball->shared.s;
    MapEntity *me = fireball->shared.base.me;

    s->x = fireball->unk3E - gCamera.x;
    fireball->qUnk3C += Q(0.25);
    fireball->unk40 += I(fireball->qUnk3C);
    s->y = fireball->unk40 - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(fireball->unk3E, fireball->unk44) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, fireball->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (IS_ALIVE(&gPlayer)) {
        if (Coll_Player_Entity_Intersection(s, fireball->unk3E, fireball->unk40, &gPlayer)) {
            Coll_DamagePlayer(&gPlayer);
        }
    }

    if (fireball->qUnk3C >= Q(0)) {
        CreateFireballSparks(fireball->unk3E, fireball->unk40 - 16);
        s->prevVariant = -1;
        s->variant = 1;
        gCurTask->main = Task_FireballExtinguish;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, X_FLIP);
}

// TODO: One of the Destroy calls is likely bugged?
//       One has a SET_MAP_ENTITY_NOT_INITIALIZED() call, one does not.
void Task_FireballExtinguish(void)
{
    Fireball *fireball = TASK_DATA(gCurTask);
    Sprite *s = &fireball->shared.s;
    MapEntity *me = fireball->shared.base.me;

    s->x = fireball->unk3E - gCamera.x;
    fireball->qUnk3C += Q(0.25);
    fireball->unk40 += I(fireball->qUnk3C);
    s->y = fireball->unk40 - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(fireball->unk3E, fireball->unk44) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, fireball->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (IS_ALIVE(&gPlayer)) {
        if (Coll_Player_Entity_Intersection(s, fireball->unk3E, fireball->unk40, &gPlayer)) {
            Coll_DamagePlayer(&gPlayer);
        }
    }

    if (fireball->qUnk3C >= Q(2)) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, X_FLIP);
}

// Reg-swap
// (99.61%) https://decomp.me/scratch/MmGb6
NONMATCH("asm/non_matching/game/sa1/stage/enemies/fireball__CreateFireballSparks.inc", void CreateFireballSparks(s16 screenX, s16 screenY))
{
    Task *t;
    FireballSpark *spark;
    Sprite *s;
    s32 i;
    s32 v;

    for (i = 0; i < NUM_SPARKS; i++) {
        t = TaskCreate(Task_FireballSpark, sizeof(FireballSpark), 0x3000, 0, NULL);
        spark = TASK_DATA(t);
        s = &spark->s;

        v = screenX * 4;
        spark->unk30 = v;
        spark->qUnk34 = -Q(2);
        spark->unk32 = 6;

        if (i != 0) {
            s32 six = -spark->unk32;
            spark->unk32 = six;
            s->x = screenX - 8;
        } else {
            spark->unk30 = screenX * 4;
            s->x = screenX + 8;
        }

        s->y = screenY;

        s->graphics.dest = VRAM_RESERVED_EN_FIREBALL_SPARK;
        s->oamFlags = SPRITE_OAM_ORDER(9);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_FIREBALL_PROJ;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        UpdateSpriteAnimation(s);
    }
}
END_NONMATCH

void Task_FireballSpark(void)
{
    FireballSpark *fireball = TASK_DATA(gCurTask);
    Sprite *s = &fireball->s;
    CamCoord oldWorldX, oldWorldY;
    s32 worldX;

    fireball->unk30 += fireball->unk32;

    worldX = fireball->unk30;
    if (worldX < 0) {
        worldX += 3;
    }

    s->x = worldX >> 2;

    fireball->qUnk34 += Q(40. / 256.);
    s->y += I(fireball->qUnk34);
    oldWorldX = fireball->s.x;
    oldWorldY = fireball->s.y;

    Coll_Player_Projectile(s, oldWorldX, oldWorldY);

    // WorldPos -> ScreenPos
    fireball->s.x -= gCamera.x;
    fireball->s.y -= gCamera.y;

    // TODO:
    //   if(IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, 40))
    if ((((u16)(s->x + (40 / 2)) > DISPLAY_WIDTH + 36) || (s->y + (40 / 2) < 0) || (s->y > DISPLAY_HEIGHT + 80))) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s->x = oldWorldX;
    s->y = oldWorldY;
}

void CreateEntity_Fireball(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Fireball, sizeof(FireballSpawner), 0x2000, 0, NULL);
    FireballSpawner *spawner = TASK_DATA(t);

    spawner->me = me;
    spawner->unk4 = 0;
    spawner->meX = me->x;
    spawner->regionX = regionX;
    spawner->regionY = regionY;

    SET_MAP_ENTITY_INITIALIZED(me);
}