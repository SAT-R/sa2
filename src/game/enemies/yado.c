#include "global.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/enemies/projectiles.h"
#include "game/stage/dust_cloud.h"
#include "game/stage/entities_manager.h"
#include "game/trapped_animals.h"
#include "game/multiplayer/unknown_1.h"
#include "lib/m4a.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
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

#define IS_YADO_FACING_PLAYER(_yado, _yadoX, _player)                                   \
    (((Q_24_8_TO_INT(gPlayer.x) < _yadoX) && (s->unk10 & SPRITE_FLAG_MASK_X_FLIP))      \
     || ((Q_24_8_TO_INT(gPlayer.x) > _yadoX) && (~s->unk10 & SPRITE_FLAG_MASK_X_FLIP)))

void CreateEntity_Yado(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    s32 regX, regY;
    struct Task *t
        = TaskCreate(Task_YadoMain, sizeof(Sprite_Yado), 0x4090, 0, TaskDestructor_Yado);
    Sprite_Yado *yado = TaskGetStructPtr(t);
    Sprite *s = &yado->s;
    yado->base.regionX = spriteRegionX;
    yado->base.regionY = spriteRegionY;
    yado->base.me = me;
    yado->base.spriteX = me->x;
    yado->base.spriteY = spriteY;

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

    SPRITE_INIT(s, 12, SA2_ANIM_YADO, 0, 18, 2);
}

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
        gPlayer.transition = PLTRANS_PT5;

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
        s->prevVariant = -1;
    } else if (IS_YADO_FACING_PLAYER(yado, pos.x, &gPlayer)) {
        gCurTask->main = Task_8055378;
        s->graphics.anim = SA2_ANIM_YADO;
        s->variant = 3;
        s->prevVariant = -1;
    }

    ENEMY_UPDATE_EX_RAW(s, yado->spawnX, yado->spawnY, {});
}

// (71.15%) https://decomp.me/scratch/bdODk
NONMATCH("asm/non_matching/Task_Yado_8055084.inc", void Task_8055084(void))
{
    Sprite_Yado *yado = TaskGetStructPtr(gCurTask);
    Sprite *s = &yado->s;
    MapEntity *me = yado->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(yado, s, pos.x, pos.y);

    if (!(gPlayer.moveState & MOVESTATE_IN_AIR)) {
        if (sub_800C4FC(s, pos.x, pos.y, 0) == TRUE) {
            TaskDestroy(gCurTask);
            return;
        } else {
            // _08055100
            if (sub_800C204(s, pos.x, pos.y, 0, &gPlayer, 0) == 1) {
                // _08055134
                gPlayer.speedAirY = YADO_PLAYER_ACCEL;
                gPlayer.unk64 = SA2_CHAR_ANIM_50;
                gPlayer.unk6C = 1;
                gPlayer.transition = PLTRANS_PT5;

                // TODO: Why is this called twice?
                m4aSongNumStart(SE_SPRING);
            }
        }
    } else if (sub_800C204(s, pos.x, pos.y, 0, &gPlayer, 0) == 1) {
        // _08055134
        gPlayer.speedAirY = YADO_PLAYER_ACCEL;
        gPlayer.unk64 = SA2_CHAR_ANIM_50;
        gPlayer.unk6C = 1;
        gPlayer.transition = PLTRANS_PT5;

        // TODO: Why is this called twice?
        m4aSongNumStart(SE_SPRING);
    } else if (gUnknown_030056A4 != NULL) {
        // _08055164
        // TODO: ...why? Is this part of a macro? Copy-paste?
        Sprite_Yado *yado2 = TaskGetStructPtr(gCurTask);

        if (gUnknown_030056A4->unk4C != -1) {
            s32 r2 = s->hitboxes[0].left + pos.x;
            s32 r1 = Q_24_8_TO_INT(gUnknown_030056A4->posX) + gUnknown_030056A4->unk50;
            if (((r2 > r1)
                 && (r1 + (gUnknown_030056A4->unk52 - gUnknown_030056A4->unk50)) >= r2)
                || ((r2 + (s->hitboxes[0].right - s->hitboxes[0].left)) >= r1)
                || ((r2 >= r1)
                    && (r1 + (gUnknown_030056A4->unk52 - gUnknown_030056A4->unk50))
                        >= r2)) {
                // _080551C2
                s32 r3 = s->hitboxes[0].top + pos.y;
                s32 r1
                    = Q_24_8_TO_INT(gUnknown_030056A4->posY) + gUnknown_030056A4->unk51;
                if ((((r3 > r2)
                      && (r2 + (gUnknown_030056A4->unk53 - gUnknown_030056A4->unk51))
                          >= r3))
                    || ((r3 + (s->hitboxes[0].bottom - s->hitboxes[0].top)) >= r2)
                    || ((r3 >= r2)
                        && (r2 + (gUnknown_030056A4->unk53 - gUnknown_030056A4->unk51))
                            >= r3)) {
                    s16 effectX, effectY;
                    if (IS_MULTI_PLAYER) {
                        struct UNK_3005510 *unk = sub_8019224();
                        unk->unk0 = 3;
                        unk->unk1 = yado2->base.regionX;
                        unk->unk2 = yado2->base.regionY;
                        unk->unk3 = yado2->base.spriteY;
                    }

                    effectX = pos.x;
                    effectY = pos.y;
                    CreateDustCloud(effectX, effectY);
                    CreateTrappedAnimal(effectX, effectY);
                    CreateEnemyDefeatScoreAndManageLives(effectX, effectY);

                    TaskDestroy(gCurTask);
                    return;
                }
            }
        }
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, yado->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }
    // _08055298

    sub_80122DC(yado->spawnX, yado->spawnY);

    if (--yado->unk4C == 0) {
        yado->unk4C = YADO_PROJ_COOLDOWN;
        s->graphics.anim = SA2_ANIM_YADO;
        s->variant = 0;
        s->prevVariant = -1;
        gCurTask->main = Task_YadoMain;
    } else if (yado->unk4C == 60) {
        // _080552E4
        ProjInit pinit;
        pinit.numTiles = 4;
        pinit.anim = SA2_ANIM_YADO_PROJ;
        pinit.variant = 0;

        if (s->unk10 & SPRITE_FLAG_MASK_X_FLIP) {
            pinit.x = Q_24_8(yado->spawnX + 6);
            pinit.rot = 0;
        } else {
            pinit.x = Q_24_8(yado->spawnX - 5);
            pinit.rot = Q_24_8(2.0);
        }
        pinit.y = Q_24_8(yado->spawnY - 6);
        pinit.speed = Q_24_8(1.5);

        CreateProjectile(&pinit);
    } else if (yado->unk4C == 6) {
        s->graphics.anim = SA2_ANIM_YADO;
        s->variant = 2;
        s->prevVariant = -1;
    }

    UpdateSpriteAnimation(s);
    sub_80051E8(s);
}
END_NONMATCH

void Task_8055378(void)
{
    Sprite_Yado *yado = TaskGetStructPtr(gCurTask);
    Sprite *s = &yado->s;
    MapEntity *me = yado->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(yado, s, pos.x, pos.y);

    if (sub_800C204(s, pos.x, pos.y, 0, &gPlayer, 0) == TRUE) {
        gPlayer.speedAirY = YADO_PLAYER_ACCEL;
        gPlayer.unk64 = SA2_CHAR_ANIM_50;
        gPlayer.unk6C = 1;
        gPlayer.transition = PLTRANS_PT5;

        m4aSongNumStart(SE_SPRING);
    }

    ENEMY_DESTROY_IF_OUT_OF_CAM_RANGE(yado, me, s);

    sub_80122DC(yado->spawnX, yado->spawnY);

    if (UpdateSpriteAnimation(s) == 0) {
        sub_80051E8(s);

        ENEMY_TURN_AROUND(s);

        s->graphics.anim = SA2_ANIM_YADO;
        s->variant = 0;
        s->prevVariant = -1;
        gCurTask->main = Task_YadoMain;
    } else {
        sub_80051E8(s);
    }
}

void TaskDestructor_Yado(struct Task *t)
{
    Sprite_Yado *yado = TaskGetStructPtr(t);
    VramFree(yado->s.graphics.dest);
}