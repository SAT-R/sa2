#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/water_effects.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/sa1/zones.h"

#define BOULDER_SPAWN_RATE TIME(0, 2)

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C[0x74];
    /* 0xB0 */ u8 unkB0;
    /* 0xB1 */ u8 unkB1;
    /* 0xB2 */ u8 fillerB2[0x2];
    /* 0xB4 */ u8 fillerB4[0x7];
    /* 0xBB */ u8 unkBB;
} BoulderSpawner; /* 0xBC */

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 filler3C[0x60];
    /* 0x9C */ s32 qUnk9C;
    /* 0xA0 */ s32 qUnkA0;
    /* 0xA4 */ s32 qUnkA4;
    /* 0xA8 */ s32 qUnkA8;
    /* 0xAC */ s32 qUnkAC;
    /* 0xB0 */ u8 unkB0;
    /* 0xB1 */ u8 unkB1;
    /* 0xB2 */ s16 unkB2;
    /* 0xB4 */ s16 unkB4;
    /* 0x3C */ u8 fillerB6[0x6];
} Boulder; /* 0xBC */

typedef struct {
    /* 0x00 */ Sprite sprites[4];
    /* 0xC0 */ SpriteTransform transforms[4];
    /* 0xF0 */ u16 unkF0;
    /* 0xF2 */ s16 qUnkF2;
} BoulderDebris; /* 0xF4 */

void Task_BoulderMain(void);
void Task_BoulderDebris(void);
void Task_BoulderSpawnerMain(void);
void TaskDestructor_Boulder(struct Task *t);
void TaskDestructor_BoulderDebris(struct Task *t);
void CreateBoulderDebris(s32 x, s32 y);

void Task_BoulderSpawnerMain(void)
{
    CamCoord worldX, worldY;
    BoulderSpawner *spawner;
    MapEntity *me;

    spawner = TASK_DATA(gCurTask);
    me = spawner->base.me;

    worldX = TO_WORLD_POS(spawner->base.meX, spawner->base.regionX);
    worldY = TO_WORLD_POS(me->y, spawner->base.regionY);

    if (Mod(gStageTime, BOULDER_SPAWN_RATE) == 0) {
        struct Task *t = TaskCreate(Task_BoulderMain, sizeof(Boulder), 0x2000, 0, TaskDestructor_Boulder);

        Boulder *boulder = TASK_DATA(t);
        Sprite *s = &boulder->s;

        boulder->base.regionX = spawner->base.regionX;
        boulder->base.regionY = spawner->base.regionY;
        boulder->base.meX = spawner->base.meX;
        // TODO: Isn't this reading undefined memory?
        boulder->base.id = spawner->unkBB;
        boulder->qUnk9C = Q(0);
        boulder->qUnkA0 = Q(0.25);
        boulder->qUnkA4 = Q(0);
        boulder->qUnkA8 = Q(0);
        boulder->qUnkAC = Q(0);
        boulder->unkB0 = 0;
        boulder->unkB1 = spawner->unkB1;

        boulder->unkB2 = s->x = worldX;
        boulder->unkB4 = s->y = worldY;

        s->graphics.dest = ALLOC_TILES(SA1_ANIM_FALLING_BOULDER);
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_FALLING_BOULDER;
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

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spawner->base.meX);
        TaskDestroy(gCurTask);
        return;
    }
}

void Task_BoulderMain(void)
{
    Boulder *boulder = TASK_DATA(gCurTask);
    Sprite *s = &boulder->s;
    s16 unkB2 = boulder->unkB2;
    s16 unkB4 = boulder->unkB4;
    s32 res;
    s32 i;
    u8 sp08[4];

    s->x = unkB2 + I(boulder->qUnkA8) - gCamera.x;
    s->y = unkB4 + I(boulder->qUnkAC) - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(unkB2, unkB4) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        TaskDestroy(gCurTask);
        return;
    }

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (Coll_Player_Entity_Intersection(s, unkB2 + I(boulder->qUnkA8), unkB4 + I(boulder->qUnkAC), &PLAYER(i))) {
                Coll_DamagePlayer(&PLAYER(i));
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (boulder->unkB0) {
        res = SA2_LABEL(sub_801F07C)(unkB4 + I(boulder->qUnkAC), unkB2 + I(boulder->qUnkA8), 1, +8, NULL, SA2_LABEL(sub_801EE64));

        if (res >= 0) {
            boulder->qUnkA4 += 32;
        } else {
            boulder->qUnkA4 = 0;
            boulder->unkB0 = 0;

            if (boulder->unkB0 != 0) {
                boulder->unkB0--;
            } else {
                if (boulder->unkB1 != 0) {
                    boulder->unkB1--;
                } else {
                    gSpriteTransformX = s->x;
                    gSpriteTransformY = s->y;

                    CreateBoulderDebris(unkB2 + I(boulder->qUnkA8) - gSpriteTransformX, unkB4 + I(boulder->qUnkAC) - gSpriteTransformY);

                    if (!IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
                        m4aSongNumStart(SE_EXPLOSION);
                    }

                    TaskDestroy(gCurTask);
                    return;
                }
            }
        }
    } else {
        res = SA2_LABEL(sub_801F07C)(unkB4 + I(boulder->qUnkAC), unkB2 + I(boulder->qUnkA8), 1, +8, sp08, SA2_LABEL(sub_801EE64));

        if (res > 5) {
            boulder->qUnkA4 += ABS2(Div(boulder->qUnkA0 * 2, 5));
            boulder->unkB0 = 1;
        } else {
            boulder->qUnkA0 += Div(COS(sp08[0] * 4), 1250);
            boulder->qUnkAC += Q(res + 2);
        }
    }

    boulder->qUnkA8 += boulder->qUnkA0;
    boulder->qUnkAC += boulder->qUnkA4;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void CreateBoulderDebris(s32 x, s32 y)
{
    struct Task *t = TaskCreate(Task_BoulderDebris, sizeof(BoulderDebris), 0x2000, 0, TaskDestructor_BoulderDebris);
    BoulderDebris *debris = TASK_DATA(t);

    Sprite *s;
    SpriteTransform *tf;

    {
        s = &debris->sprites[0];
        tf = &debris->transforms[0];

        debris->unkF0 = 0;
        debris->qUnkF2 = -Q(2);
#ifdef BUG_FIX
        // BUG: Allocated wrong amount of VRAM data
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_ROCK_DEBRIS_S);
        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_ROCK_DEBRIS_S;
#else
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_ROCK_DEBRIS_L);
        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_ROCK_DEBRIS_S;
#endif
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG(ROT_SCALE, 16);

        tf->rotation = 0;
        tf->qScaleX = Q(1);
        tf->qScaleY = Q(1);
        tf->x = x;
        tf->y = y;

        UpdateSpriteAnimation(s);

#ifdef BUG_FIX
        DmaCopy16(3, s, &debris->sprites[1], sizeof(debris->sprites[1]));
        s = &debris->sprites[1];
        DmaCopy16(3, tf, &debris->transforms[1], sizeof(debris->transforms[1]));
        tf = &debris->transforms[1];
#else
        DmaCopy16(3, s, (s = &debris->sprites[1]), sizeof(*s));
        DmaCopy16(3, tf, (tf = &debris->transforms[1]), sizeof(*tf));
#endif

        s->frameFlags = SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG(ROT_SCALE, 17);
        tf->y = y - 16;
    }

    s = &debris->sprites[2];

#ifdef BUG_FIX
    DmaCopy16(3, tf, &debris->transforms[2], sizeof(debris->transforms[1]));
    tf = &debris->transforms[2];
#else
    DmaCopy16(3, tf, (tf = &debris->transforms[2]), sizeof(*tf));
#endif
    {
#ifdef BUG_FIX
        // BUG: Allocated wrong amount of VRAM data
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_ROCK_DEBRIS_L);
        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_ROCK_DEBRIS_L;
#else
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_ROCK_DEBRIS_S);
        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_ROCK_DEBRIS_L;
#endif
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG(ROT_SCALE, 18);

        tf->y = y;

        UpdateSpriteAnimation(s);

#ifdef BUG_FIX
        DmaCopy16(3, s, &debris->sprites[3], sizeof(debris->sprites[3]));
        s = &debris->sprites[3];
        DmaCopy16(3, tf, &debris->transforms[3], sizeof(debris->transforms[3]));
        tf = &debris->transforms[3];
#else
        DmaCopy16(3, s, (s = &debris->sprites[3]), sizeof(*s));
        DmaCopy16(3, tf, (tf = &debris->transforms[3]), sizeof(*tf));
#endif

        s->frameFlags = SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG(ROT_SCALE, 19);
        tf->y = y - 16;
    }
}

void Task_BoulderDebris(void)
{
    BoulderDebris *debris = TASK_DATA(gCurTask);
    Sprite *s = &debris->sprites[0];
    SpriteTransform *tf;
    s16 prevTransformX, prevTransformY;
    s16 scale;

    if (debris->unkF0++ > 60) {
        TaskDestroy(gCurTask);
        return;
    }

    debris->qUnkF2 += Q(40. / 256.);

    { // 0
        tf = &debris->transforms[0];
        tf->y += I(debris->qUnkF2);

        prevTransformX = tf->x;
        prevTransformY = tf->y;
        tf->x -= gCamera.x;
        tf->y -= gCamera.y;
        tf->x -= debris->unkF0 * 2;

        scale = tf->qScaleX + Q(8. / 256.);
        if (scale > Q(2)) {
            scale = Q(2);
        }

        tf->qScaleX = scale;
        tf->qScaleY = scale;
        tf->rotation -= Q(42. / 256.);
        SPRITE_FLAG_CLEAR(s, ROT_SCALE);
        s->frameFlags |= gOamMatrixIndex++;
        SA2_LABEL(sub_8004E14)(s, tf);
        DisplaySprite(s);
        tf->x = prevTransformX;
        tf->y = prevTransformY;
    }

    { // 1
        s = &debris->sprites[1];
        tf = &debris->transforms[1];
        tf->y += I(debris->qUnkF2);

        prevTransformX = tf->x;
        prevTransformY = tf->y;
        tf->x -= gCamera.x;
        tf->y -= gCamera.y;
        tf->x += debris->unkF0;

        tf->qScaleX = scale;
        tf->qScaleY = scale;
        tf->rotation += Q(42. / 256.);
        SPRITE_FLAG_CLEAR(s, ROT_SCALE);
        s->frameFlags |= gOamMatrixIndex++;
        SA2_LABEL(sub_8004E14)(s, tf);
        DisplaySprite(s);
        tf->x = prevTransformX;
        tf->y = prevTransformY;
    }

    { // 2
        s = &debris->sprites[2];
        tf = &debris->transforms[2];
        tf->y += I(debris->qUnkF2);

        prevTransformX = tf->x;
        prevTransformY = tf->y;
        tf->x -= gCamera.x;
        tf->y -= gCamera.y;
        tf->x += debris->unkF0 * 2;

        tf->qScaleX = scale;
        tf->qScaleY = scale;
        tf->rotation += Q(14. / 256.);
        SPRITE_FLAG_CLEAR(s, ROT_SCALE);
        s->frameFlags |= gOamMatrixIndex++;
        SA2_LABEL(sub_8004E14)(s, tf);
        DisplaySprite(s);
        tf->x = prevTransformX;
        tf->y = prevTransformY;
    }

    { // 3
        s = &debris->sprites[3];
        tf = &debris->transforms[3];
        tf->y += I(debris->qUnkF2);

        prevTransformX = tf->x;
        prevTransformY = tf->y;
        tf->x -= gCamera.x;
        tf->y -= gCamera.y;
        tf->x -= debris->unkF0;

        tf->qScaleX = scale;
        tf->qScaleY = scale;
        tf->rotation -= Q(14. / 256.);
        SPRITE_FLAG_CLEAR(s, ROT_SCALE);
        s->frameFlags |= gOamMatrixIndex++;
        SA2_LABEL(sub_8004E14)(s, tf);
        DisplaySprite(s);
        tf->x = prevTransformX;
        tf->y = prevTransformY;
    }
}

void CreateEntity_BoulderSpawner(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    struct Task *t = TaskCreate(Task_BoulderSpawnerMain, sizeof(BoulderSpawner), 0x2000, 0, NULL);
    BoulderSpawner *spawner = TASK_DATA(t);

    spawner->base.regionX = regionX;
    spawner->base.regionY = regionY;
    spawner->base.me = me;
    spawner->base.meX = me->x;
    spawner->base.id = id;

    spawner->unkB1 = me->d.sData[0];

    SET_MAP_ENTITY_INITIALIZED(me);
}

void TaskDestructor_Boulder(struct Task *t)
{
    Boulder *boulder = TASK_DATA(t);
    VramFree(boulder->s.graphics.dest);
}

void TaskDestructor_BoulderDebris(struct Task *t)
{
    BoulderDebris *debris = TASK_DATA(t);
    VramFree(debris->sprites[0].graphics.dest);
    VramFree(debris->sprites[2].graphics.dest);
}
