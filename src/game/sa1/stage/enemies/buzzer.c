#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/sa1/save.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef struct {
    EntityShared shared;
    s32 qUnk3C;
    u8 unk40;
    u8 unk41;
    s16 qUnk42;
    s16 qUnk44;
} Buzzer;

typedef struct {
    Sprite s;
    s32 qUnk30;
    s32 qUnk34;
    s16 qUnk38;
    s16 qUnk3A;
    u8 filler3c[4];
} BuzzerProjectile;

void Task_BuzzerInit(void);
void Task_801E034(void);
void Task_Buzzer_801E190(void);
void CreateBuzzerProjectile(CamCoord worldX, CamCoord worldY);
void Task_BuzzerProjectileMain(void);

void CreateEntity_Buzzer(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    if (LEVEL_TO_ZONE(gCurrentLevel) != ZONE_1 || LOADED_SAVE->difficultyLevel == DIFFICULTY_NORMAL) {
        Task *t = TaskCreate(Task_BuzzerInit, sizeof(Buzzer), 0x2000, 0, TaskDestructor_EntityShared);
        Buzzer *buzzer = TASK_DATA(t);
        Sprite *s = &buzzer->shared.s;

        buzzer->shared.base.regionX = regionX;
        buzzer->shared.base.regionY = regionY;
        buzzer->shared.base.me = me;
        buzzer->shared.base.meX = me->x;
        buzzer->shared.base.id = id;

        buzzer->unk40 = 0;
        buzzer->unk41 = 0;
        buzzer->qUnk42 = -Q(1);
        buzzer->qUnk3C = Q(0);
        buzzer->unk40 = 0;

        // NOTE: x|y set to world- not screen-pos!
        s->x = TO_WORLD_POS(me->x, regionX);
        s->y = TO_WORLD_POS(me->y, regionY);

        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = ALLOC_TILES(SA1_ANIM_BUZZER);
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_BUZZER;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        if (I(gPlayer.qWorldX) >= TO_WORLD_POS(buzzer->shared.base.meX, buzzer->shared.base.regionX)) {
            buzzer->qUnk42 = Q(1);
            SPRITE_FLAG_SET(s, X_FLIP);
        }

        UpdateSpriteAnimation(s);
    }
}

void Task_BuzzerInit(void)
{
    Buzzer *buzzer = TASK_DATA(gCurTask);
    Sprite *s = &buzzer->shared.s;
    MapEntity *me = buzzer->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;

    worldX = TO_WORLD_POS(buzzer->shared.base.meX, buzzer->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, buzzer->shared.base.regionY);

    buzzer->qUnk3C += buzzer->qUnk42;

    worldX += I(buzzer->qUnk3C);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, buzzer->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (I(buzzer->qUnk3C) <= me->d.sData[0] * TILE_WIDTH) {
        buzzer->qUnk42 = +Q(1.00);
        s->prevVariant = -1;
        s->variant = 2;
        gCurTask->main = Task_Buzzer_801E190;
        SPRITE_FLAG_SET(s, X_FLIP);
    } else if (I(buzzer->qUnk3C) >= (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH) {
        buzzer->qUnk42 = -Q(1.00);
        s->prevVariant = -1;
        s->variant = 2;
        gCurTask->main = Task_Buzzer_801E190;
        SPRITE_FLAG_CLEAR(s, X_FLIP);
    } else if (buzzer->unk41 == 0) {
        if ((worldY <= I(gPlayer.qWorldY)) && (worldY + 96 >= I(gPlayer.qWorldY))) {
            s16 r8 = I(gPlayer.qWorldY) - worldY;
            s32 playerX = I(gPlayer.qWorldX);
            s16 r2;
            s16 r6;
            playerX = worldX - playerX;
            r6 = playerX * 17 / 10;
            r2 = playerX * 10 / 17;

            // TODO: Is the &= a @BUG ?
            if (s->frameFlags &= SPRITE_FLAG_MASK_X_FLIP) {
                r2 = -r2;
                r6 = -r6;
            }

            if ((r6 >= r8) && (r2 <= r8)) {
                s->prevVariant = -1;
                s->variant = 1;

                buzzer->qUnk44 = 0;
                gCurTask->main = Task_801E034;
            }
        }
    }
}

void Task_801E034(void)
{
    Buzzer *buzzer = TASK_DATA(gCurTask);
    Sprite *s = &buzzer->shared.s;
    MapEntity *me = buzzer->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;

    worldX = TO_WORLD_POS(buzzer->shared.base.meX, buzzer->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, buzzer->shared.base.regionY);

    worldX += I(buzzer->qUnk3C);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (++buzzer->qUnk44 == 10) {
        CreateBuzzerProjectile(worldX, worldY + 6);
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, buzzer->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    if (buzzer->qUnk44 >= 30) {
        s->prevVariant = -1;
        s->variant = 0;
        gCurTask->main = Task_BuzzerInit;
        buzzer->unk41 = 1;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_Buzzer_801E190(void)
{
    Buzzer *buzzer = TASK_DATA(gCurTask);
    Sprite *s = &buzzer->shared.s;
    MapEntity *me = buzzer->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;

    worldX = TO_WORLD_POS(buzzer->shared.base.meX, buzzer->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, buzzer->shared.base.regionY);

    worldX += I(buzzer->qUnk3C);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, buzzer->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    buzzer->unk41 = 0;
    buzzer->unk40 = 0;

    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        s->variant = 0;
        gCurTask->main = Task_BuzzerInit;
    }

    DisplaySprite(s);
}

void CreateBuzzerProjectile(CamCoord worldX, CamCoord worldY)
{
    s32 i;

    Task *t = TaskCreate(Task_BuzzerProjectileMain, sizeof(BuzzerProjectile), 0x9000, 0, NULL);
    BuzzerProjectile *proj = TASK_DATA(t);
    Sprite *s = &proj->s;
    s16 res;

    res = SA2_LABEL(sub_8004418)(I(gPlayer.qWorldY) - worldY, I(gPlayer.qWorldX) - worldX);
    proj->qUnk38 = Div(COS(res), 38);
    proj->qUnk3A = Div(SIN(res), 38);

    proj->qUnk30 = Q(worldX);
    proj->qUnk34 = Q(worldY);
    s->x = worldX;
    s->y = worldY;

    s->graphics.dest = VRAM_RESERVED_EN_BUZZER_PROJ;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BUZZER_PROJ;
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

void Task_BuzzerProjectileMain(void)
{
    BuzzerProjectile *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    s32 oldWorldX, oldWorldY;
    s16 screenX, screenY;
    s32 worldX;

    proj->qUnk30 += proj->qUnk38;
    proj->qUnk34 += proj->qUnk3A;

    s->x = I(proj->qUnk30);
    s->y = I(proj->qUnk34);

    oldWorldX = proj->s.x;
    oldWorldY = proj->s.y;

    Coll_Player_Projectile(s, oldWorldX, oldWorldY);

    // WorldPos -> ScreenPos
    proj->s.x -= gCamera.x;
    proj->s.y -= gCamera.y;

    // TODO:
    //   if(IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, 40))
    if ((((u16)(s->x + (80 / 2)) > DISPLAY_WIDTH + 80) || (s->y + (80 / 2) < 0) || (s->y > DISPLAY_HEIGHT + 40))) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
