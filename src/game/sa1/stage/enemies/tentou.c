#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/sa1/save.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

#define NUM_PROJECTILES             2
#define TENTOU_ATTACK_INIT_DISTANCE 80

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 unk30;
    /* 0x34 */ s32 unk34;
    /* 0x36 */ s16 unk38;
} TentouProj; /* 0x3C */

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ s32 qUnk3C;
    /* 0x40 */ s32 qUnk40;
    /* 0x44 */ s16 unk44;
    /* 0x46 */ s16 unk46;
    /* 0x48 */ s32 unk48;
    /* 0x4C */ u8 unk4C;
    /* 0x4E */ u16 unk4E;
    /* 0x50 */ s32 unk50;
    /* 0x54 */ s32 unk54;
    /* 0x58 */ s16 unk58;
    /* 0x5A */ s16 unk5A;
} Tentou;

void Task_TentouMain(void);
void sub_8074928(void);
void CreateTentouProjectiles(s16 x, s16 y);
void sub_8074C50(void);
void TaskDestructor_TentouProjectiles(Task *);

void CreateEntity_Tentou(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_TentouMain, sizeof(Tentou), 0x2000, 0, TaskDestructor_EntityShared);
    Tentou *tentou = TASK_DATA(t);
    Sprite *s = &tentou->shared.s;

    tentou->shared.base.regionX = regionX;
    tentou->shared.base.regionY = regionY;
    tentou->shared.base.me = me;
    tentou->shared.base.meX = me->x;
    tentou->shared.base.id = id;

    tentou->qUnk3C = -Q(0.625);
    tentou->qUnk40 = Q(0);
    tentou->unk44 = 0;
    tentou->unk46 = 0;
    tentou->unk48 = 0;
    tentou->unk4C = me->d.sData[1];
    tentou->unk50 = 0;
    tentou->unk54 = 0;

    // NOTE: x|y set to world- not screen-pos!
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_TENTOU);
    s->graphics.anim = SA1_ANIM_TENTOU;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (I(gPlayer.qWorldX) >= TO_WORLD_POS(tentou->shared.base.meX, tentou->shared.base.regionX)) {
        tentou->qUnk3C = +Q(0.625);
        tentou->unk48 |= 0x400;
    }

    if (me->d.sData[0] >= 0) {
        tentou->unk58 = 8;
        tentou->unk4E = 0;
        tentou->unk5A = 0;
    } else {
        tentou->unk58 = 8;
        tentou->unk4E = 0x40;
        tentou->unk5A = 0;
    }

    // NOTE: *sigh* Why did they even set this in the if-else above?
    tentou->unk5A = 8;

    tentou->unk4E = 0;

    UpdateSpriteAnimation(s);
}

// (91.64%) https://decomp.me/scratch/CVrOt
NONMATCH("asm/non_matching/game/sa1/stage/enemies/Tentou__Task_TantouMain.inc", void Task_TentouMain(void))
{
    Tentou *tentou;
    // register Sprite *s asm("r5");
    Sprite *s;
    MapEntity *me;
    s32 worldX;
    s32 worldY;
    s32 worldX2, worldY2;
    s16 offsetWorldX;
    s32 dtUnk50;
    s32 dtUnk54;
    s32 dtUnk50Shift;
    s32 dtUnk54Shift;
    s32 v;

    tentou = TASK_DATA(gCurTask);
    s = &tentou->shared.s;
    me = tentou->shared.base.me;

    worldX = TO_WORLD_POS(tentou->shared.base.meX, tentou->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, tentou->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    dtUnk50 = tentou->unk50;
    tentou->unk50 = QS(me->d.uData[2] * TILE_WIDTH) * SIN((tentou->unk58 * (tentou->unk4E & 0x7F)) & ONE_CYCLE) >> 14;
    dtUnk50Shift = tentou->unk50 - dtUnk50;

    dtUnk54 = tentou->unk54;
    tentou->unk54 = QS(me->d.uData[3] * TILE_WIDTH) * COS((tentou->unk5A * (tentou->unk4E & 0x3F)) & ONE_CYCLE) >> 14;
    dtUnk54Shift = tentou->unk54 - dtUnk54;

    tentou->unk4E++;
    if (tentou->unk4E == 0x40 || tentou->unk4E == 0x80) {
        tentou->unk46 = 0;
        tentou->shared.s.variant = 0;
        gCurTask->main = sub_8074928;
    }
    tentou->unk4E = tentou->unk4E & 0x7F;

    s->x = worldX2 - gCamera.x + (dtUnk50 = (dtUnk50Shift >> 5));

    if ((s->y = Mod(dtUnk54Shift >> 4, 0x40)) != 0x3F) {
        s->y = worldY2 - gCamera.y - Mod(dtUnk54Shift >> 4, 0x40);

        if (Coll_Player_Enemy_Attack(s, worldX + dtUnk50, worldY - (dtUnk54Shift >> 4))) {
            // Enemy defeated
            TaskDestroy(gCurTask);
            return;
        }
    } else {
        if (Coll_Player_Enemy_Attack(s, worldX + dtUnk50, worldY)) {
            // Enemy defeated
            TaskDestroy(gCurTask);
            return;
        }
        s->y = worldY2 - gCamera.y;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, tentou->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);

    DisplaySprite(s);
    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, X_FLIP);
}
END_NONMATCH

void Task_807473C(void)
{
    Tentou *tentou = TASK_DATA(gCurTask);
    Sprite *s = &tentou->shared.s;
    MapEntity *me = tentou->shared.base.me;
    s32 worldX, worldY;
    s32 invUnk50, prevUnk54;
    s32 r6;

    worldX = TO_WORLD_POS(tentou->shared.base.meX, tentou->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, tentou->shared.base.regionY);

    invUnk50 = -tentou->unk50;

    tentou->unk50 = QS(me->d.uData[2] * TILE_WIDTH) * SIN((tentou->unk58 * ((tentou->unk4E - 1) & 0x7F)) & ONE_CYCLE) >> 14;
    prevUnk54 = tentou->unk54;
    tentou->unk54 = QS(me->d.uData[3] * TILE_WIDTH) * COS((tentou->unk5A * ((tentou->unk4E - 1) & 0x3F)) & ONE_CYCLE) >> 14;

    r6 = tentou->unk54 - prevUnk54;

    s->x = worldX - gCamera.x + (invUnk50 >> 5);
    s->y = worldY - gCamera.y - (r6 >> 4);

    if (++tentou->unk46 == 15) {
        CreateTentouProjectiles(worldX + (invUnk50 >> 5), worldY - (r6 >> 4) - 5);
    }
    // _0807482A

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, tentou->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX + (invUnk50 >> 5), worldY - (r6 >> 4))) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }
    // _080748CC

    if (tentou->unk46 > 32) {
        s->variant = 1;
        gCurTask->main = Task_TentouMain;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, X_FLIP);
}

// (90.29%) https://decomp.me/scratch/L6r3C
NONMATCH("asm/non_matching/game/sa1/stage/enemies/Tentou__sub_8074928.inc", void sub_8074928(void))
{
    Tentou *tentou = TASK_DATA(gCurTask);
    Sprite *s = &tentou->shared.s;
    MapEntity *me = tentou->shared.base.me;
    s32 worldX, worldY;
    s32 worldX2, worldY2;
    s32 invUnk50, prevUnk54;
    s32 r6;
    s32 dtPlayerEnX, dtPlayerEnY;

    worldX = TO_WORLD_POS(tentou->shared.base.meX, tentou->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, tentou->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    invUnk50 = -tentou->unk50;

    tentou->unk50 = QS(me->d.uData[2] * TILE_WIDTH) * SIN((tentou->unk58 * ((tentou->unk4E - 1) & 0x7F)) & ONE_CYCLE) >> 14;
    prevUnk54 = tentou->unk54;
    tentou->unk54 = QS(me->d.uData[3] * TILE_WIDTH) * COS((tentou->unk5A * ((tentou->unk4E - 1) & 0x3F)) & ONE_CYCLE) >> 14;

    r6 = tentou->unk54 - prevUnk54;

    s->x = worldX - gCamera.x + (invUnk50 >> 5);
    s->y = worldY - gCamera.y - (r6 >> 4);

    ++tentou->unk46;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, tentou->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX2 + (invUnk50 >> 5), worldY2 - (r6 >> 4))) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    dtPlayerEnX = (I(gPlayer.qWorldX) - gCamera.x) - s->x;
    dtPlayerEnX = SQUARE(dtPlayerEnX);

    dtPlayerEnY = (I(gPlayer.qWorldY) - gCamera.y) - s->y;
    dtPlayerEnY = SQUARE(dtPlayerEnY);

    if (dtPlayerEnX + dtPlayerEnY < SQUARE(TENTOU_ATTACK_INIT_DISTANCE)) {
        tentou->unk46 = 0;
        s->variant = 2;
        gCurTask->main = Task_807473C;
    } else if (tentou->unk46 >= 60) {
        tentou->unk46 = 0;
        s->variant = 1;
        gCurTask->main = Task_TentouMain;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, X_FLIP);
}
END_NONMATCH

// NOTE: Very from to Fireball enemy's projectile creation.
// TODO: Maybe add macros for code sharing?
void CreateTentouProjectiles(s16 screenX, s16 screenY)
{
    TentouProj *proj;
    Task *t;
    Sprite *s;
    s32 i;
    s32 v;

    for (i = 0; i < NUM_PROJECTILES; i++) {
        t = TaskCreate(sub_8074C50, sizeof(TentouProj), 0x3000, 0, TaskDestructor_TentouProjectiles);
        proj = TASK_DATA(t);
        s = &proj->s;

        proj->unk30 = screenX * 4;
        proj->unk38 = 0;
        proj->unk34 = 6;

        if (i != 0) {
            s32 six = -proj->unk34;
            proj->unk34 = six;
            proj->unk30 = (screenX - 6) * 4;
            s->x = screenX - 8;
        } else {
            proj->unk30 = (screenX + 6) * 4;
            s->x = screenX + 8;
        }

        s->y = screenY;

        s->graphics.dest = ALLOC_TILES(SA1_ANIM_GAMIGAMI_PROJ);
        s->oamFlags = SPRITE_OAM_ORDER(9);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_GAMIGAMI_PROJ;
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

void sub_8074C50(void)
{
    TentouProj *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    s32 oldWorldX, oldWorldY;
    s16 screenX, screenY;
    s32 worldX;

    proj->unk30 += proj->unk34;

    worldX = proj->unk30;

    s->x = worldX >> 2;

    proj->unk38 += Q(40. / 256.);
    s->y += I(proj->unk38);
    oldWorldX = s->x;
    oldWorldY = s->y;

    Coll_Player_Projectile(s, oldWorldX, oldWorldY);

    // WorldPos -> ScreenPos
    proj->s.x -= gCamera.x;
    proj->s.y -= gCamera.y;

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

void TaskDestructor_TentouProjectiles(Task *t)
{
    TentouProj *proj = TASK_DATA(t);
    VramFree(proj->s.graphics.dest);
}