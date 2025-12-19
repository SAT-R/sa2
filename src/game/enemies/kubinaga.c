#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "trig.h"
#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/entity.h"
#include "game/enemies/kubinaga.h"

#include "game/enemies/projectiles.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite sBase;
    /* 0x3C */ Sprite sHead;
    /* 0x6C */ Sprite sNeck;
    /* 0x9C */ SpriteTransform transform;
    /* 0xA8 */ s32 spawnX;
    /* 0xAC */ s32 spawnY;
    /* 0xB0 */ s32 headX;
    /* 0xB4 */ s32 headY;
    /* 0xB8 */ u16 unkB8;
    /* 0xBA */ u16 unkBA;
    /* 0xBC */ s16 unkBC;
    /* 0xBE */ s16 unkBE;
    /* 0xC0 */ u8 unkC0;
} Sprite_Kubinaga;

static void sub_80524D0(void);
static void sub_8052F70(struct Task *);
static void sub_8052AEC(void);
static void sub_80528AC(void);
static void sub_8052CC8(Sprite_Kubinaga *k);
static void sub_80526C8(void);

static const u16 gUnknown_080D8F30[][2] = {
    { SA2_ANIM_KUBINAGA_BASE, 0 },
    { SA2_ANIM_KUBINAGA_BASE, 1 },
};

void CreateEntity_Kubinaga(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_80524D0, sizeof(Sprite_Kubinaga), 0x4060, 0, sub_8052F70);
    Sprite_Kubinaga *k = TASK_DATA(t);
    Sprite *s = &k->sBase;

    k->unkB8 = 0;
    k->unkBA = 0;
    k->unkBE = 0;
    k->headX = 0;
    k->headY = 0;
    k->unkC0 = 0;

    k->base.regionX = spriteRegionX;
    k->base.regionY = spriteRegionY;
    k->base.me = me;
    k->base.meX = me->x;
    k->base.id = spriteY;

    ENEMY_SET_SPAWN_POS_STATIC(k, me);
    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);

    SPRITE_INIT(s, 6, gUnknown_080D8F30[me->d.uData[0] & 1][0], gUnknown_080D8F30[me->d.uData[0] & 1][1], 18, 2);

    if (me->d.uData[0] & 1) {
        if (me->d.sData[1]) {
            k->unkC0 = 1;
            SPRITE_FLAG_SET(s, X_FLIP);
        } else {
            k->unkC0 = 2;
        }
    }
    UpdateSpriteAnimation(s);

    s = &k->sNeck;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 4, SA2_ANIM_KUBINAGA_NECK, 0, 20, 2);
    UpdateSpriteAnimation(s);

    s = &k->sHead;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(0x10);
    SPRITE_INIT_ANIM(s, SA2_ANIM_KUBINAGA, 1, 19);
    SPRITE_INIT_SCRIPT(s, 1.0)
    s->frameFlags = gOamMatrixIndex++ | SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1) | SPRITE_FLAG(ROT_SCALE_ENABLE, 1);
    UpdateSpriteAnimation(s);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_80524D0(void)
{
    Sprite_Kubinaga *k = TASK_DATA(gCurTask);
    Sprite *s = &k->sBase;
    MapEntity *me = k->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(k, s, pos.x, pos.y);
    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN_RAW(k, me, s, pos.x, pos.y);

    Player_UpdateHomingPosition(k->spawnX, k->spawnY);
    if (k->unkB8 != 0) {
        k->unkB8--;
    } else if (gPlayer.qWorldX > k->spawnX - 0x7800 && gPlayer.qWorldX < k->spawnX + 0x7800 && gPlayer.qWorldY > k->spawnY - 0x6400
               && gPlayer.qWorldY < k->spawnY + 0x6400) {
        k->unkBE = 0;
        if (k->unkC0 == 0) {
            k->unkBA = sub_8004418((I(gPlayer.qWorldY) - pos.y) + 10, I(gPlayer.qWorldX) - pos.x);
        } else if ((k->unkC0 & 1)) {
            k->unkBA = sub_8004418((I(gPlayer.qWorldY) - pos.y), (I(gPlayer.qWorldX) - pos.x) + 10);
        } else {
            k->unkBA = sub_8004418((I(gPlayer.qWorldY) - pos.y), (I(gPlayer.qWorldX) - pos.x) - 10);
        }

        k->headX = k->spawnX;
        k->headY = k->spawnY;
        gCurTask->main = sub_80526C8;
    }

    DisplaySprite(s);

    if (s->variant == 0) {
        s->frameFlags ^= SPRITE_FLAG_MASK_X_FLIP;
        DisplaySprite(s);
    } else {
        s->frameFlags ^= SPRITE_FLAG_MASK_Y_FLIP;
        DisplaySprite(s);
    }
}

static void sub_80526C8(void)
{
    Sprite_Kubinaga *k = TASK_DATA(gCurTask);
    Sprite *sBase = &k->sBase;
    Sprite *sHead = &k->sHead;
    MapEntity *me = k->base.me;
    Vec2_32 pos;
    Vec2_32 pos2;

    pos.x = I(k->spawnX);
    pos.y = I(k->spawnY);
    pos2.x = I(k->headX);
    pos2.y = I(k->headY);

    sBase->x = pos.x - gCamera.x;
    sBase->y = pos.y - gCamera.y;

    sHead->x = pos2.x - gCamera.x;
    // BUG: this doesn't make sense to be pos.x but it doesn't appear to have any effect
    sHead->y = pos2.x - gCamera.y;

    k->unkBE += 0x200;

    ENEMY_DESTROY_IF_PLAYER_HIT_2(sBase, pos);
    ENEMY_DESTROY_IF_PLAYER_HIT_2(sHead, pos2);

    ENEMY_DESTROY_IF_OFFSCREEN_RAW(k, me, sBase, pos.x, pos.y);

    Player_UpdateHomingPosition(k->spawnX, k->spawnY);

    if (k->unkBE > 0x43FF) {
        k->unkB8 = 0x20;
        k->unkBE = 0x4400;
        gCurTask->main = sub_80528AC;
    }

    DisplaySprite(sBase);

    if (sBase->variant == 0) {
        sBase->frameFlags ^= SPRITE_FLAG_MASK_X_FLIP;
        DisplaySprite(sBase);
    } else {
        sBase->frameFlags ^= SPRITE_FLAG_MASK_Y_FLIP;
        DisplaySprite(sBase);
    }

    sub_8052CC8(k);
}

static void sub_80528AC(void)
{
    Sprite_Kubinaga *k = TASK_DATA(gCurTask);
    Sprite *sBase = &k->sBase;
    Sprite *sHead = &k->sHead;
    MapEntity *me = k->base.me;
    Vec2_32 pos;
    Vec2_32 pos2;

    pos.x = I(k->spawnX);
    pos.y = I(k->spawnY);
    pos2.x = I(k->headX);
    pos2.y = I(k->headY);

    sBase->x = pos.x - gCamera.x;
    sBase->y = pos.y - gCamera.y;

    sHead->x = pos2.x - gCamera.x;
#ifndef BUG_FIX
    // BUG: this doesn't make sense to be pos.x but it doesn't appear to have any effect
    sHead->y = pos2.x - gCamera.y;
#else
    sHead->y = pos2.y - gCamera.y;
#endif

    ENEMY_DESTROY_IF_PLAYER_HIT_2(sBase, pos);
    ENEMY_DESTROY_IF_PLAYER_HIT_2(sHead, pos2);

    ENEMY_DESTROY_IF_OFFSCREEN_RAW(k, me, sBase, pos.x, pos.y);

    Player_UpdateHomingPosition(k->spawnX, k->spawnY);

    if (k->unkB8 != 0) {

        if (k->unkB8-- == 0x11) {
            ProjInit init;
            init.numTiles = 1;
            init.anim = SA2_ANIM_KUBINAGA_PROJ;
            init.variant = 0;
            init.rot = k->unkBC;
            init.speed = 0x140;
            if (k->unkC0 == 0) {
                init.x = k->headX;
                init.y = k->headY - 0xA00;
            } else {
                if ((k->unkC0 & 1)) {
                    init.x = k->headX + 0xA00;
                } else {
                    init.x = (k->headX) - 0xA00;
                }
                init.y = k->headY;
            }
            CreateProjectile(&init);
        }
    } else {
        gCurTask->main = sub_8052AEC;
    }

    DisplaySprite(sBase);

    if (sBase->variant == 0) {
        sBase->frameFlags ^= SPRITE_FLAG_MASK_X_FLIP;
        DisplaySprite(sBase);
    } else {
        sBase->frameFlags ^= SPRITE_FLAG_MASK_Y_FLIP;
        DisplaySprite(sBase);
    }

    sub_8052CC8(k);
}

static void sub_8052AEC(void)
{
    Sprite_Kubinaga *k = TASK_DATA(gCurTask);
    Sprite *sBase = &k->sBase;
    Sprite *sHead = &k->sHead;
    MapEntity *me = k->base.me;
    Vec2_32 pos;
    Vec2_32 pos2;

    pos.x = I(k->spawnX);
    pos.y = I(k->spawnY);
    pos2.x = I(k->headX);
    pos2.y = I(k->headY);

    sBase->x = pos.x - gCamera.x;
    sBase->y = pos.y - gCamera.y;

    sHead->x = pos2.x - gCamera.x;
#ifndef BUG_FIX
    // BUG: this doesn't make sense to be pos.x but it doesn't appear to have any effect
    sHead->y = pos2.x - gCamera.y;
#else
    sHead->y = pos2.y - gCamera.y;
#endif

    k->unkBE -= 0x200;
    ENEMY_DESTROY_IF_PLAYER_HIT_2(sBase, pos);
    ENEMY_DESTROY_IF_PLAYER_HIT_2(sHead, pos2);

    ENEMY_DESTROY_IF_OFFSCREEN_RAW(k, me, sBase, pos.x, pos.y);

    Player_UpdateHomingPosition(k->spawnX, k->spawnY);

    if (k->unkBE < 0) {
        k->unkBE = 0;
        k->unkB8 = 0x78;
        gCurTask->main = sub_80524D0;
    }

    DisplaySprite(sBase);

    if (sBase->variant == 0) {
        sBase->frameFlags ^= SPRITE_FLAG_MASK_X_FLIP;
        DisplaySprite(sBase);
    } else {
        sBase->frameFlags ^= SPRITE_FLAG_MASK_Y_FLIP;
        DisplaySprite(sBase);
    }

    sub_8052CC8(k);
}

static void sub_8052CC8(Sprite_Kubinaga *k)
{
    Sprite *sHead = &k->sHead;
    Sprite *sNeck = &k->sNeck;
    SpriteTransform *transform = &k->transform;
    s32 cos = (COS(k->unkBA) * 7) >> 5;
    s32 sin = (SIN(k->unkBA) * 7) >> 5;
    Vec2_32 pos;

    u8 val = Div(k->unkBE, 0xE00);
    u8 i;

    for (i = 0; i < val; i++) {

        pos.x = I((i + 1) * cos + k->spawnX);
        pos.y = I((i + 1) * sin + k->spawnY);
        sNeck->x = pos.x - gCamera.x;
        if (k->unkC0 == 0) {
            sNeck->y = (pos.y - gCamera.y) - 10;
        } else {
            sNeck->x = (k->unkC0 & 1) ? sNeck->x + 10 : sNeck->x - 10;
            sNeck->y = pos.y - gCamera.y;
        }

        Coll_Player_Projectile(sNeck, pos.x, pos.y);
        DisplaySprite(sNeck);
    }

    k->headX = ((COS(k->unkBA) * Q_8_8_TO_INT(k->unkBE)) >> 6) + k->spawnX;
    k->headY = ((SIN(k->unkBA) * Q_8_8_TO_INT(k->unkBE)) >> 6) + k->spawnY;

    pos.x = I(k->headX);
    pos.y = I(k->headY);

    sHead->x = pos.x - gCamera.x;

    if (k->unkC0 == 0) {
        sHead->y = (pos.y - gCamera.y) - 10;
        transform->rotation = sub_8004418(I(gPlayer.qWorldY) - pos.y + 10, I(gPlayer.qWorldX) - pos.x);
    } else {
        if (k->unkC0 & 1) {

            sHead->x = sHead->x + 10;
            transform->rotation = sub_8004418(I(gPlayer.qWorldY) - pos.y, (I(gPlayer.qWorldX) - pos.x) + 10);
        } else {

            sHead->x = sHead->x - 10;
            transform->rotation = sub_8004418(I(gPlayer.qWorldY) - pos.y, (I(gPlayer.qWorldX) - pos.x) - 10);
        }
        sHead->y = (pos.y - gCamera.y);
    }

    Coll_Player_Projectile(sHead, pos.x, pos.y);

    transform->qScaleX = Q(1);
    transform->qScaleY = Q(1);
    transform->x = sHead->x;
    transform->y = sHead->y;
    k->unkBC = transform->rotation;

    if ((u16)(transform->rotation - 0x100) > 0x200) {
        sHead->graphics.anim = SA2_ANIM_KUBINAGA;
        sHead->variant = 0;
        sHead->prevVariant = -1;
    } else {
        transform->rotation ^= 0x200;
        sHead->graphics.anim = SA2_ANIM_KUBINAGA;
        sHead->variant = 1;
        sHead->prevVariant = -1;
    }

    sHead->frameFlags
        = gOamMatrixIndex++ | SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE;

    UpdateSpriteAnimation(sHead);
    TransformSprite(sHead, transform);
    DisplaySprite(sHead);
}

static void sub_8052F70(struct Task *t)
{
    Sprite_Kubinaga *k = TASK_DATA(t);
    VramFree(k->sBase.graphics.dest);
    VramFree(k->sHead.graphics.dest);
    VramFree(k->sNeck.graphics.dest);
}
