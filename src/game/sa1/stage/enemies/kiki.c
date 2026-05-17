#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

/* TODO: Streamline all the gamespecific differences (using const etc.) */

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s8 unk3C;
    /* 0x3D */ s8 unk3D;
    /* 0x3E */ u8 unk3E;
    /* 0x3F */ u8 unk3F;
} Sprite_Kiki; /* size: 0x40 */

typedef struct {
    Sprite s;
    u16 unk30;
    s16 unk32;
    s16 unk34;
    s16 unk36;
    s16 unk38;
} Kiki_Proj; /* 0x3C */

static void Task_KikiMain(void);
#if (GAME == GAME_SA1)
static void SA2_LABEL(Task_8053A38)(void);
#elif (GAME == GAME_SA2)
static void SA2_LABEL(Task_8053A38)(void);
#endif

static void CreateKikiProjectile(s16, s16);
static void Task_KikiProjMain(void);
static void Task_KikiProjSplit(void);

static void CreateKikiProjectilePiece(s16, s16);
static void Task_ProjPieceMain(void);

static void TaskDestructor_KikiProj(Task *);

void CreateEntity_Kiki(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
#if (GAME == GAME_SA1)
    const s32 taskPriority = 0x2000;
    const TaskDestructor dtor = TaskDestructor_EntityShared;
#else
    const s32 taskPriority = 0x4020;
    const TaskDestructor dtor = TaskDestructor_EntityShared;
#endif
    Task *t = TaskCreate(Task_KikiMain, sizeof(Sprite_Kiki), taskPriority, 0, dtor);
    Sprite_Kiki *kiki = TASK_DATA(t);
    Sprite *s = &kiki->s;

    kiki->base.regionX = spriteRegionX;
    kiki->base.regionY = spriteRegionY;
    kiki->base.me = me;
#if (GAME == GAME_SA1)
    kiki->base.meX = me->x;
#elif (GAME == GAME_SA2)
    // TODO: Rename
    kiki->base.spriteX = me->x;
#endif
    kiki->base.id = spriteY;

    kiki->unk3C = 1;
    kiki->unk3D = 0;
    kiki->unk3E = 0;
    kiki->unk3F = 0;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

#if (GAME == GAME_SA1)
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_KIKI);
#elif (GAME == GAME_SA2)
    // s->graphics.dest = ALLOC_TILES(SA2_ANIM_KIKI);
    s->graphics.dest = VramMalloc(0x14);
#endif
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
#if (GAME == GAME_SA1)
    s->graphics.anim = SA1_ANIM_KIKI;
    s->variant = 1;
#elif (GAME == GAME_SA2)
    s->graphics.anim = SA2_ANIM_KIKI;
    s->variant = 0;
#endif
    SPRITE_INIT_SCRIPT(s, 1.0);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

static void Task_KikiMain(void)
{
    Sprite_Kiki *kiki = TASK_DATA(gCurTask);
    Sprite *s = &kiki->s;
    MapEntity *me = kiki->base.me;
    s16 x, y;

#if (GAME == GAME_SA1)
    x = TO_WORLD_POS(kiki->base.meX, kiki->base.regionX);
#elif (GAME == GAME_SA2)
    x = TO_WORLD_POS(kiki->base.spriteX, kiki->base.regionX);
#endif
    y = TO_WORLD_POS(me->y, kiki->base.regionY);

    kiki->unk3D += kiki->unk3C;
    y += kiki->unk3D;

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (ENEMY_CROSSED_TOP_BORDER_RAW(kiki, me, kiki->unk3D)) {
        kiki->unk3E++;
        kiki->unk3C = 1;
        if (!(kiki->unk3E & 1)) {
            kiki->unk3F = 0;
#if (GAME == GAME_SA1)
            s->variant = 2;
#elif (GAME == GAME_SA2)
            s->variant = 1;
#endif
            gCurTask->main = sa2__Task_8053A38;
        }
    } else if (ENEMY_CROSSED_BOTTOM_BORDER_RAW(kiki, me, kiki->unk3D)) {
        kiki->unk3C = -1;
    }

#if (GAME == GAME_SA1)
    if (Coll_Player_Enemy_Attack(s, x, y))
#elif (GAME == GAME_SA2)
    if (Coll_Player_Enemy_Attack(s, x, y, 0))
#endif
    {
        TaskDestroy(gCurTask);
        return;
    }

#if (GAME == GAME_SA1)
    if (IS_OUT_OF_CAM_RANGE(s->x, s->y))
#elif (GAME == GAME_SA2)
    if (IS_OUT_OF_CAM_RANGE(s->x, s->y - kiki->unk3D))
#endif
    {
#if (GAME == GAME_SA1)
        SET_MAP_ENTITY_NOT_INITIALIZED(me, kiki->base.meX);
#elif (GAME == GAME_SA2)
        SET_MAP_ENTITY_NOT_INITIALIZED(me, kiki->base.spriteX);
#endif
        TaskDestroy(gCurTask);
        return;
    }

    if (I(gPlayer.qWorldX) < x) {
        SPRITE_FLAG_CLEAR(s, X_FLIP);
    } else {
        SPRITE_FLAG_SET(s, X_FLIP);
#if (GAME == GAME_SA1)
        s->x -= 8;
#elif (GAME == GAME_SA2)
        s->x += 8;
#endif
    }

    ENEMY_UPDATE_EX_RAW(s, QS(x), QS(y), {});
}

static void sa2__Task_8053A38(void)
{
    Sprite_Kiki *kiki = TASK_DATA(gCurTask);
    Sprite *s = &kiki->s;
    MapEntity *me = kiki->base.me;
    s16 x, y;

#if (GAME == GAME_SA1)
    x = TO_WORLD_POS(kiki->base.meX, kiki->base.regionX);
#elif (GAME == GAME_SA2)
    x = TO_WORLD_POS(kiki->base.spriteX, kiki->base.regionX);
#endif
    y = TO_WORLD_POS(me->y, kiki->base.regionY);

    y += kiki->unk3D;

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

#if (GAME == GAME_SA1)
    if (Coll_Player_Enemy_Attack(s, x, y))
#elif (GAME == GAME_SA2)
    if (Coll_Player_Enemy_Attack(s, x, y, 0))
#endif
    {
        TaskDestroy(gCurTask);
        return;
    }

#if (GAME == GAME_SA1)
    if (IS_OUT_OF_CAM_RANGE(s->x, s->y))
#elif (GAME == GAME_SA2)
    if (IS_OUT_OF_CAM_RANGE(s->x, s->y - kiki->unk3D))
#endif
    {
#if (GAME == GAME_SA1)
        SET_MAP_ENTITY_NOT_INITIALIZED(me, kiki->base.meX);
#elif (GAME == GAME_SA2)
        SET_MAP_ENTITY_NOT_INITIALIZED(me, kiki->base.spriteX);
#endif
        TaskDestroy(gCurTask);
        return;
    }

    if (I(gPlayer.qWorldX) < x) {
        SPRITE_FLAG_CLEAR(s, X_FLIP);
    } else {
        SPRITE_FLAG_SET(s, X_FLIP);
#if (GAME == GAME_SA1)
        s->x -= 8;
#elif (GAME == GAME_SA2)
        s->x += 8;
#endif
    }

    kiki->unk3F++;

#if (GAME == GAME_SA1)
    if (kiki->unk3F > 14) {
        gCurTask->main = Task_KikiMain;
        s->variant = 1;

#if (GAME == GAME_SA1)
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            CreateKikiProjectile(x - 18, y - 8);
        } else {
            CreateKikiProjectile(x + 8, y - 8);
        }
#elif (GAME == GAME_SA2)
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            CreateKikiProjectile(x - 4, y + 2);
        } else {
            CreateKikiProjectile(x + 9, y + 2);
        }
#endif
    }
#elif (GAME == GAME_SA2)
    Player_UpdateHomingPosition(QS(x), QS(y));

    if (kiki->unk3F == 0x12) {
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            CreateKikiProjectile(x - 4, y + 2);
        } else {
            CreateKikiProjectile(x + 9, y + 2);
        }
    }
#endif

#if (GAME == GAME_SA1)
    UpdateSpriteAnimation(s);
#elif (GAME == GAME_SA2)
    if (UpdateSpriteAnimation(s) == 0) {
        gCurTask->main = Task_KikiMain;
        s->variant = 0;
    };
#endif
    DisplaySprite(s);
}

static void CreateKikiProjectile(s16 x, s16 y)
{
#if (GAME == GAME_SA1)
    const u16 prio = 0x2000;
    const TaskDestructor dtor = NULL;
#elif (GAME == GAME_SA2)
    const u16 prio = 0x4028;
    const TaskDestructor dtor = TaskDestructor_KikiProj;
#endif

    Task *t = TaskCreate(Task_KikiProjMain, sizeof(Kiki_Proj), prio, 0, dtor);
    Kiki_Proj *proj = TASK_DATA(t);
    Sprite *s = &proj->s;

    proj->unk32 = -512;
    proj->unk30 = 0;
    proj->unk36 = 0;
    proj->unk38 = x;
    if (I(gPlayer.qWorldX) < x) {
        proj->unk34 = -Div((x - I(gPlayer.qWorldX)) * 400, 800);
        if (proj->unk34 < -0x3C) {
            proj->unk34 = -60;
        }
    } else {
        proj->unk34 = Div((I(gPlayer.qWorldX) - x) * 400, 800);

        if (proj->unk34 >= 0x3D) {
            proj->unk34 = 60;
        }
    }

    s->x = x;
    s->y = y;

#if (GAME == GAME_SA1)
    s->graphics.dest = VRAM_RESERVED_EN_KIKI_PROJ;
    s->oamFlags = SPRITE_OAM_ORDER(18);
#elif (GAME == GAME_SA2)
    s->graphics.dest = VramMalloc(4);
    s->oamFlags = SPRITE_OAM_ORDER(17);
#endif
    s->graphics.size = 0;
#if (GAME == GAME_SA1)
    s->graphics.anim = SA1_ANIM_KIKI_PROJ;
#elif (GAME == GAME_SA2)
    s->graphics.anim = SA2_ANIM_KIKI;
#endif
    s->variant = 0;
    SPRITE_INIT_SCRIPT(s, 1.0);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

static void Task_KikiProjMain(void)
{
    Kiki_Proj *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    s16 x, y;

    proj->unk32 += 40;
    proj->unk36 += proj->unk34;

    s->x = proj->unk38 + Div(proj->unk36, 0x28);
    s->y += Q_8_8_TO_INT(proj->unk32);

    if (proj->unk32 && proj->unk32 > -1) {
        s32 delta = SA2_LABEL(sub_801F07C)(s->y, s->x, 1, 8, 0, SA2_LABEL(sub_801EE64));
        if (delta < 0) {
            s->y += delta;
            if (proj->unk30 == 0) {
                proj->unk32 = -(proj->unk32 >> 2);
                proj->unk30 += 1;
            } else {
                gCurTask->main = Task_KikiProjSplit;
                proj->unk30 = 0;
                proj->unk32 = 0;
            }
        }
    }

    x = s->x;
    y = s->y;
    if (Coll_Player_Projectile(s, x, y) != 0) {
        s->prevVariant = -1;
#if (GAME == GAME_SA1)
        s->graphics.anim = SA1_ANIM_DUST_CLOUD;
#elif (GAME == GAME_SA2)
        s->graphics.anim = SA2_ANIM_DUST_CLOUD;
#endif
        s->variant = 0;
        CreateKikiProjectilePiece(x, y);
        TaskDestroy(gCurTask);
        return;
    }
    s->x -= gCamera.x;
    s->y -= gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    s->x = x;
    s->y = y;
}

static void Task_KikiProjSplit(void)
{
    Kiki_Proj *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    s16 x, y;

    x = s->x;
    y = s->y;
    if (proj->unk30++ >= 0x60) {
        CreateKikiProjectilePiece(x, y);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Projectile(s, x, y) != 0) {
        CreateKikiProjectilePiece(x, y);
        TaskDestroy(gCurTask);
        return;
    }

    s->x -= gCamera.x;
    s->y -= gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    s->x = x;
    s->y = y;
}

static void CreateKikiProjectilePiece(s16 x, s16 y)
{
    Task *t = TaskCreate(Task_ProjPieceMain, sizeof(Kiki_Proj), 0x2000, 0, TaskDestructor_KikiProj);
    Kiki_Proj *proj = TASK_DATA(t);
    Sprite *s = &proj->s;

    proj->unk32 = -512;
    proj->unk30 = 0;

    if (I(gPlayer.qWorldX) < x) {
        proj->unk34 = -1;
    } else {
        proj->unk34 = 1;
    }

    s->x = x;
    s->y = y;
    s->graphics.dest = VramMalloc(16);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
#if (GAME == GAME_SA1)
    s->graphics.anim = SA1_ANIM_KIKI_PROJ_EXPLOSION;
#elif (GAME == GAME_SA2)
    s->graphics.anim = SA2_ANIM_KIKI_PROJ_EXPLOSION;
#endif
    s->variant = 0;
    SPRITE_INIT_SCRIPT(s, 1.0);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

static void Task_ProjPieceMain(void)
{
    Sprite *s2 = &gPlayerBodyPSI.s;
    Kiki_Proj *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    s16 x, y;

    x = s->x;
    y = s->y;
    if ((s->hitboxes[0].index != -1) && (s2->hitboxes[0].index != -1)) {
        s32 x1, x2;
        // TODO: HITBOX macros!!!
        // TODO: .b struct alignment
#if (GAME == GAME_SA1)
        x1 = x + s->hitboxes[0].b.left;
        x2 = I(gPlayer.qWorldX) + s2->hitboxes[0].b.left;
        if ((x1 <= x2 && x1 + (s->hitboxes[0].b.right - s->hitboxes[0].b.left) >= x2)
            || (x1 >= x2 && x2 + (s2->hitboxes[0].b.right - s2->hitboxes[0].b.left) >= x1)) {
            s32 y1, y2;
            y1 = y + s->hitboxes[0].b.top;
            y2 = I(gPlayer.qWorldY) + s2->hitboxes[0].b.top;
            if ((y1 <= y2 && y1 + (s->hitboxes[0].b.bottom - s->hitboxes[0].b.top) >= y2)
                || (y1 >= y2 && y2 + (s2->hitboxes[0].b.bottom - s2->hitboxes[0].b.top) >= y1)) {
                Coll_DamagePlayer(&gPlayer);
            }
        }
#elif (GAME == GAME_SA2)
        x1 = x + s->hitboxes[0].left;
        x2 = I(gPlayer.qWorldX) + s2->hitboxes[0].left;
        if ((x1 <= x2 && x1 + (s->hitboxes[0].right - s->hitboxes[0].left) >= x2)
            || (x1 >= x2 && x2 + (s2->hitboxes[0].right - s2->hitboxes[0].left) >= x1)) {
            s32 y1, y2;
            y1 = y + s->hitboxes[0].top;
            y2 = I(gPlayer.qWorldY) + s2->hitboxes[0].top;
            if ((y1 <= y2 && y1 + (s->hitboxes[0].bottom - s->hitboxes[0].top) >= y2)
                || (y1 >= y2 && y2 + (s2->hitboxes[0].bottom - s2->hitboxes[0].top) >= y1)) {
                Coll_DamagePlayer(&gPlayer);
            }
        }
#endif
    }
    s->x -= gCamera.x;
    s->y -= gCamera.y;
    if (UpdateSpriteAnimation(s) == 0) {
        TaskDestroy(gCurTask);
        return;
    }
    DisplaySprite(s);
    s->x = x;
    s->y = y;
}

static void TaskDestructor_KikiProj(Task *t)
{
    Kiki_Proj *proj = TASK_DATA(t);
    VramFree(proj->s.graphics.dest);
}
