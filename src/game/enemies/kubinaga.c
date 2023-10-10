#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a.h"

#include "game/entity.h"
#include "game/enemies/kubinaga.h"
#include "game/stage/entities_manager.h"
#include "game/enemies/projectiles.h"
#include "trig.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite s2;
    /* 0x6C */ Sprite s3;
    /* 0x9C */ s32 unk9C;
    /* 0xA0 */ s32 unkA0;
    /* 0xA4 */ s32 unkA4;
    /* 0xA8 */ s32 spawnX;
    /* 0xAC */ s32 spawnY;
    /* 0xB0 */ s32 offsetX;
    /* 0xB4 */ s32 offsetY;
    /* 0xB8 */ u16 unkB8;
    /* 0xBA */ s16 unkBA;
    /* 0xBC */ s16 unkBC;
    /* 0xBE */ s16 unkBE;
    /* 0xC0 */ u8 unkC0;
} Sprite_Kubinaga; /* size: 0x5C */

void sub_80524D0(void);
void sub_8052F70(struct Task *);

extern const u16 gUnknown_080D8F30[][2];

void CreateEntity_Kubinaga(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                           u8 spriteY)
{
    struct Task *t = TaskCreate(sub_80524D0, 0xC4, 0x4060, 0, sub_8052F70);
    Sprite_Kubinaga *k = TaskGetStructPtr(t);
    Sprite *s = &k->s;

    k->unkB8 = 0;
    k->unkBA = 0;
    k->unkBE = 0;
    k->offsetX = 0;
    k->offsetY = 0;
    k->unkC0 = 0;

    k->base.regionX = spriteRegionX;
    k->base.regionY = spriteRegionY;
    k->base.me = me;
    k->base.spriteX = me->x;
    k->base.spriteY = spriteY;

    ENEMY_SET_SPAWN_POS_STATIC(k, me);
    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);

    SPRITE_INIT(s, 6, gUnknown_080D8F30[me->d.uData[0] & 1][0],
                gUnknown_080D8F30[me->d.uData[0] & 1][1], 18, 2);

    if (me->d.uData[0] & 1) {
        if (me->d.sData[1]) {
            k->unkC0 = 1;
            SPRITE_FLAG_SET(s, X_FLIP);
        } else {
            k->unkC0 = 2;
        }
    }
    UpdateSpriteAnimation(s);

    s = &k->s3;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 4, SA2_ANIM_KUBINAGA_NECK, 0, 20, 2);
    UpdateSpriteAnimation(s);

    s = &k->s2;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(0x10);
    SPRITE_INIT_ANIM(s, SA2_ANIM_KUBINAGA, 1, 19);
    SPRITE_INIT_SCRIPT(s, 1.0)
    s->unk10 = gUnknown_030054B8++ | 0x2060;
    UpdateSpriteAnimation(s);
    SET_MAP_ENTITY_INITIALIZED(me);
}

void sub_80526C8(void);

void sub_80524D0(void)
{
    Sprite_Kubinaga *k = TaskGetStructPtr(gCurTask);
    Sprite *s = &k->s;
    MapEntity *me = k->base.me;
    Vec2_32 pos;

    ENEMY_UPDATE_POSITION_STATIC(k, s, pos.x, pos.y);
    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_OFFSCREEN_RAW(k, me, s, pos.x, pos.y);

    sub_80122DC(k->spawnX, k->spawnY);
    if (k->unkB8 != 0) {
        k->unkB8--;
    } else if (gPlayer.x > k->spawnX - 0x7800 && gPlayer.x < k->spawnX + 0x7800
               && gPlayer.y > k->spawnY - 0x6400 && gPlayer.y < k->spawnY + 0x6400) {
        k->unkBE = 0;
        if (k->unkC0 == 0) {
            k->unkBA = sub_8004418((Q_24_8_TO_INT(gPlayer.y) - pos.y) + 10,
                                   Q_24_8_TO_INT(gPlayer.x) - pos.x);
        } else if ((k->unkC0 & 1)) {
            k->unkBA = sub_8004418((Q_24_8_TO_INT(gPlayer.y) - pos.y),
                                   (Q_24_8_TO_INT(gPlayer.x) - pos.x) + 10);
        } else {
            k->unkBA = sub_8004418((Q_24_8_TO_INT(gPlayer.y) - pos.y),
                                   (Q_24_8_TO_INT(gPlayer.x) - pos.x) - 10);
        }

        k->offsetX = k->spawnX;
        k->offsetY = k->spawnY;
        gCurTask->main = sub_80526C8;
    }

    DisplaySprite(s);

    if (s->variant == 0) {
        s->unk10 ^= SPRITE_FLAG_MASK_X_FLIP;
        DisplaySprite(s);
    } else {
        s->unk10 ^= SPRITE_FLAG_MASK_Y_FLIP;
        DisplaySprite(s);
    }
}

void sub_80528AC(void);

void sub_8052CC8(Sprite_Kubinaga *k);

void sub_80526C8(void)
{
    Sprite_Kubinaga *k = TaskGetStructPtr(gCurTask);
    Sprite *s = &k->s;
    Sprite *s2 = &k->s2;
    MapEntity *me = k->base.me;
    Vec2_32 pos;
    Vec2_32 pos2;

    pos.x = Q_24_8_TO_INT(k->spawnX);
    pos.y = Q_24_8_TO_INT(k->spawnY);
    pos2.x = Q_24_8_TO_INT(k->offsetX);
    pos2.y = Q_24_8_TO_INT(k->offsetY);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    s2->x = pos2.x - gCamera.x;
    // BUG: this doesn't make sense to be pos.x but it doesn't appear to have any effect
    s2->y = pos2.x - gCamera.y;

    k->unkBE += 0x200;

    ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
    ENEMY_DESTROY_IF_PLAYER_HIT_2(s2, pos2);

    ENEMY_DESTROY_IF_OFFSCREEN_RAW(k, me, s, pos.x, pos.y);

    sub_80122DC(k->spawnX, k->spawnY);

    if (k->unkBE > 0x43FF) {
        k->unkB8 = 0x20;
        k->unkBE = 0x4400;
        gCurTask->main = sub_80528AC;
    }

    DisplaySprite(s);

    if (s->variant == 0) {
        s->unk10 ^= SPRITE_FLAG_MASK_X_FLIP;
        DisplaySprite(s);
    } else {
        s->unk10 ^= SPRITE_FLAG_MASK_Y_FLIP;
        DisplaySprite(s);
    }

    sub_8052CC8(k);
}

void sub_8052AEC(void);

// void sub_80528AC(void)
// {
//     Sprite_Kubinaga *k = TaskGetStructPtr(gCurTask);
//     Sprite *s = &k->s;
//     Sprite *s2 = &k->s2;
//     MapEntity *me = k->base.me;
//     Vec2_32 pos;
//     Vec2_32 pos2;

//     pos.x = Q_24_8_TO_INT(k->spawnX);
//     pos.y = Q_24_8_TO_INT(k->spawnY);
//     pos2.x = Q_24_8_TO_INT(k->offsetX);
//     pos2.y = Q_24_8_TO_INT(k->offsetY);

//     s->x = pos.x - gCamera.x;
//     s->y = pos.y - gCamera.y;

//     s2->x = pos2.x - gCamera.x;
//     // BUG: this doesn't make sense to be pos.x but it doesn't appear to have any
//     effect s2->y = pos2.x - gCamera.y;

//     ENEMY_DESTROY_IF_PLAYER_HIT_2(s, pos);
//     ENEMY_DESTROY_IF_PLAYER_HIT_2(s2, pos2);

//     ENEMY_DESTROY_IF_OFFSCREEN_RAW(k, me, s, pos.x, pos.y);

//     sub_80122DC(k->spawnX, k->spawnY);

//     if (k->unkB8 == 0) {
//         gCurTask->main = sub_8052AEC;
//     } else {
//         k->unkBE--;

//         if (k->unkBE == 0x11) {
//             ProjInit init;
//             init.numTiles = 0;
//             init.anim = SA2_ANIM_KUBINAGA_PROJ;
//             init.variant = 0;
//             init.rot = k->unkBC;
//             init.speed = 0x140;
//             if (k->unkC0 == 0) {
//                 init.x = k->spawnX;
//                 init.y = k->spawnY - 0xA00;
//             } else {
//                 if ((k->unkC0 & 1) == 0) {
//                     init.x = (k->spawnX) - 0xA00;
//                 } else {
//                     init.x = k->spawnX + 0xA00;
//                 }
//                 init.y = k->spawnY;
//             }
//             CreateProjectile(&init);
//         }
//     }

//     DisplaySprite(s);

//     if (s->variant == 0) {
//         s->unk10 ^= SPRITE_FLAG_MASK_X_FLIP;
//         DisplaySprite(s);
//     } else {
//         s->unk10 ^= SPRITE_FLAG_MASK_Y_FLIP;
//         DisplaySprite(s);
//     }

//     sub_8052CC8(k);
// }
