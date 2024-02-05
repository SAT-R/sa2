#include "global.h"
#include "rect.h"
#include "sprite.h"
#include "lib/m4a.h"
#include "sakit/globals.h"
#include "sakit/collision.h"
#include "sakit/dust_cloud.h"
#include "sakit/entities_manager.h"
#include "sakit/player.h"
#include "game/cheese.h"
#include "game/entity.h"
#include "game/multiplayer/unknown_1.h"
#include "game/rings_scatter.h"
#include "game/trapped_animals.h"

#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/zones.h"

#define COLL_NONE       0
#define COLL_FLAG_8     0x00000008
#define COLL_FLAG_80000 0x00080000

#define PLAYER_INVULNERABLE_DURATION ZONE_TIME_TO_INT(0, 2)

u32 CheckRectCollision_SpritePlayer(Sprite *s, s32 sx, s32 sy, Player *p,
                                    struct Rect8 *rectPlayer)
{
    u32 result = 0;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0]) || !IS_ALIVE(p)) {
        return result;
    }

    if (RECT_COLLISION(sx, sy, &s->hitboxes[0], Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y),
                       rectPlayer)) {
        result |= COLL_FLAG_80000;
    }

    return result;
}

// (Link included because of register-match)
// (100.00%) https://decomp.me/scratch/0Ro0I
u32 sub_800C060(Sprite *s, s32 sx, s32 sy, Player *p)
{
    s8 rectPlayer[4] = { -p->unk16, -p->unk17, +p->unk16, +p->unk17 };

    u32 result = COLL_NONE;
    bool32 ip = FALSE;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0]) || !IS_ALIVE(p)) {
        return result;
    }

    if ((p->moveState & MOVESTATE_8) && (p->unk3C == s)) {
        p->moveState &= ~MOVESTATE_8;
        ip = TRUE;
    }

    if (RECT_COLLISION_2(sx, sy, &s->hitboxes[0], p->x, p->y, (struct Rect8 *)rectPlayer)
        && (p->speedAirY >= 0)) {

#ifndef NON_MATCHING
        register s32 y asm("r1");
#else
        s32 y;
#endif

        rectPlayer[1] = -p->unk17;
        rectPlayer[3] = +p->unk17;
        p->moveState |= MOVESTATE_8;
        result |= COLL_FLAG_8;

        if (!ip) {
            p->rotation = 0;
        }

        p->unk3C = s;
        p->speedAirY = 0;

        if (GRAVITY_IS_INVERTED) {
            y = s->hitboxes[0].bottom;
            y += sy;
            y += rectPlayer[3];
        } else {
            y = s->hitboxes[0].top;
            y += sy;
            y -= rectPlayer[3];
        }
        y = Q_24_8(y);
        p->y = Q_24_8_FRAC(p->y) + (y);
    } else if (ip && !(p->moveState & MOVESTATE_8)) {
        p->moveState &= ~MOVESTATE_20;
        p->moveState |= MOVESTATE_IN_AIR;
    }

    return result;
}

bool32 sub_800C204(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p, s16 hbIndexPlayer)
{
    PlayerSpriteInfo *psi = p->unk90;
    Sprite *sprPlayer = &psi->s;

    if (!IS_ALIVE(p)) {
        return FALSE;
    }

    if (!HITBOX_IS_ACTIVE(s->hitboxes[hbIndex])) {
        return FALSE;
    }

    if (!HITBOX_IS_ACTIVE(psi->s.hitboxes[hbIndexPlayer])) {
        return FALSE;
    }

    if ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex], Q_24_8_TO_INT(p->x),
                      Q_24_8_TO_INT(p->y), sprPlayer->hitboxes[hbIndexPlayer]))) {
        return TRUE;
    }

    return FALSE;
}

bool32 sub_800C320(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p)
{
    PlayerSpriteInfo *psi = p->unk90;
    Sprite *sprPlayer = &psi->s;

    if (!IS_ALIVE(p)) {
        return FALSE;
    }

    if (!HITBOX_IS_ACTIVE(s->hitboxes[hbIndex])) {
        return FALSE;
    }

    if (!HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1])) {
        return FALSE;
    }

    if ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex], Q_24_8_TO_INT(p->x),
                      Q_24_8_TO_INT(p->y), sprPlayer->hitboxes[1]))) {
        Collision_AdjustPlayerSpeed(p);
        return TRUE;
    }

    return FALSE;
}

bool32 IsColliding_Cheese(Sprite *sprTarget, s32 sx, s32 sy, s16 hbIndex, Player *p)
{
    if (!IS_ALIVE(p)) {
        return FALSE;
    }

    if (!HITBOX_IS_ACTIVE(sprTarget->hitboxes[hbIndex])) {
        return FALSE;
    }

    if (gCheese) {
        Cheese *cheese = gCheese;

        if (!HITBOX_IS_ACTIVE(cheese->s.hitboxes[1])) {
            return FALSE;
        }

        if ((HB_COLLISION(sx, sy, sprTarget->hitboxes[hbIndex],
                          Q_24_8_TO_INT(cheese->posX), Q_24_8_TO_INT(cheese->posY),
                          cheese->s.hitboxes[1]))) {
            return TRUE;
        }
    }

    return FALSE;
}

// (92.68%) https://decomp.me/scratch/CcZm5
NONMATCH("asm/non_matching/sakit/coll__sub_800C4FC.inc",
         bool32 sub_800C4FC(Sprite *s, s32 sx, s32 sy, u8 hbIndex))
{
    PlayerSpriteInfo *psi = gPlayer.unk90;
    Sprite *sprPlayer = &psi->s;
    EnemyBase *eb;
    u32 movestate;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[hbIndex])) {
        return FALSE;
    }

    eb = TASK_DATA(gCurTask);

    movestate = gPlayer.moveState;
    if (PLAYER_IS_ALIVE) {
        if (IS_MULTI_PLAYER
            && ((s8)eb->base.me->x == (s8)MAP_ENTITY_STATE_MINUS_THREE)) {
            // _0800C550 + 0x1C
            CreateDustCloud(sx, sy);
            CreateTrappedAnimal(sx, sy);

            return TRUE;
        }
        if (!(movestate & MOVESTATE_IN_SCRIPTED)) {
            if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1])) {
                // _0800C5A4 + 0xC

                if (HB_COLLISION(sx, sy, s->hitboxes[hbIndex], Q_24_8_TO_INT(gPlayer.x),
                                 Q_24_8_TO_INT(gPlayer.y), sprPlayer->hitboxes[1])) {
                    // _0800C648
                    if (IS_MULTI_PLAYER) {
                        struct UNK_3005510 *v = sub_8019224();
                        v->unk0 = 3;
                        v->unk1 = eb->base.regionX;
                        v->unk2 = eb->base.regionY;
                        v->unk3 = eb->base.spriteY;
                    }

                    Collision_AdjustPlayerSpeed(&gPlayer);

                    CreateDustCloud(sx, sy);
                    CreateTrappedAnimal(sx, sy);
                    CreateEnemyDefeatScoreAndManageLives(sx, sy);

                    return TRUE;
                }
            }
            // _0800C674:

            if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0])
                && (HB_COLLISION(sx, sy, s->hitboxes[hbIndex], Q_24_8_TO_INT(gPlayer.x),
                                 Q_24_8_TO_INT(gPlayer.y), sprPlayer->hitboxes[0]))) {
                if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                    sub_800CBA4(&gPlayer);
                } else {
                    if (IS_MULTI_PLAYER) {
                        struct UNK_3005510 *v = sub_8019224();
                        v->unk0 = 3;
                        v->unk1 = eb->base.regionX;
                        v->unk2 = eb->base.regionY;
                        v->unk3 = eb->base.spriteY;
                    }

                    CreateDustCloud(sx, sy);
                    CreateTrappedAnimal(sx, sy);
                    CreateEnemyDefeatScoreAndManageLives(sx, sy);

                    return TRUE;
                }
            }
        }

        if (gCheese != NULL) {
            Cheese *cheese = gCheese;
            if (cheese->s.hitboxes[1].index != -1
                && ((HB_COLLISION(
                    sx, sy, s->hitboxes[hbIndex], Q_24_8_TO_INT(cheese->posX),
                    Q_24_8_TO_INT(cheese->posY), cheese->s.hitboxes[1])))) {
                if (IS_MULTI_PLAYER) {
                    struct UNK_3005510 *v = sub_8019224();
                    v->unk0 = 3;
                    v->unk1 = eb->base.regionX;
                    v->unk2 = eb->base.regionY;
                    v->unk3 = eb->base.spriteY;
                }

                CreateDustCloud(sx, sy);
                CreateTrappedAnimal(sx, sy);
                CreateEnemyDefeatScoreAndManageLives(sx, sy);

                return TRUE;
            }
        }
    }

    return FALSE;
}
END_NONMATCH

bool32 sub_800C84C(Sprite *s, s32 sx, s32 sy)
{
    Player *p;
    Sprite *sprPlayer;
    bool32 result = FALSE;

    if (gPlayer.moveState & MOVESTATE_IN_SCRIPTED) {
        return result;
    }

    if (HITBOX_IS_ACTIVE(s->hitboxes[0])) {
        p = &gPlayer;
        sprPlayer = &p->unk90->s;

        if ((!PLAYER_IS_ALIVE) || !HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0])) {
            return result;
        }

        if ((HB_COLLISION(sx, sy, s->hitboxes[0], Q_24_8_TO_INT(p->x),
                          Q_24_8_TO_INT(p->y), sprPlayer->hitboxes[0]))) {
            sub_800CBA4(p);
            result = TRUE;
        }
    }

    return result;
}

bool32 sub_800C944(Sprite *s, s32 sx, s32 sy)
{
    bool32 result = FALSE;

    Player *p = &gPlayer;
    PlayerSpriteInfo *psi = p->unk90;
    Sprite *sprPlayer = &psi->s;

    if (PLAYER_IS_ALIVE && HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1])
        && (HITBOX_IS_ACTIVE(s->hitboxes[0]))) {
        if (HB_COLLISION(sx, sy, s->hitboxes[0], Q_24_8_TO_INT(p->x),
                         Q_24_8_TO_INT(p->y), sprPlayer->hitboxes[1])) {
            result = TRUE;
        }
    }

    return result;
}

bool32 sub_800CA20(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p)
{
    PlayerSpriteInfo *psi = p->unk90;
    Sprite *sprPlayer = &psi->s;

    if (IS_ALIVE(p)
        && (HITBOX_IS_ACTIVE(s->hitboxes[hbIndex])
            && HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0]))) {
        if (HB_COLLISION(sx, sy, s->hitboxes[hbIndex], Q_24_8_TO_INT(p->x),
                         Q_24_8_TO_INT(p->y), sprPlayer->hitboxes[0])) {
            sub_800CBA4(p);
            return TRUE;
        }
    }

    return FALSE;
}

void Collision_AdjustPlayerSpeed(Player *p)
{
    if (p->moveState & MOVESTATE_BOOST_EFFECT_ON) {
        // Also triggered on homing-attack.
        // Slight boost upwards for the player.
        p->transition = PLTRANS_PT8;
        p->speedAirX = 0;
        p->speedAirY = 0;
    } else if (IS_BOSS_STAGE(gCurrentLevel)) {
        s32 speedX = -(p->speedAirX >> 1);
        p->speedAirY = -p->speedAirY;
        p->speedAirX = speedX - Q_24_8(gCamera.unk38);
    } else if (p->speedAirY > 0) {
        // Bounce off of enemies
        p->speedAirY = -p->speedAirY;
    }

    gPlayer.moveState |= MOVESTATE_4000;
}

// (100.00%) https://decomp.me/scratch/verla
// TODO: Register fake-match
bool32 sub_800CBA4(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return FALSE;
    }

    // _0800CBBE
    p->timerInvulnerability = PLAYER_INVULNERABLE_DURATION;

    if (p->moveState & MOVESTATE_1000000) {
        PlayerSpriteInfo *psi;

        p->unk38 = FLAG_PLAYER_x38__LAYER_BACK;

        p->moveState &= ~MOVESTATE_1000000;
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__80;

        p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
        p->unk90->s.unk10 |= SPRITE_FLAG(PRIORITY, 2);
    }

    if (!(p->moveState & MOVESTATE_1000000)) {
        p->transition = PLTRANS_PT9;
    }
    // _0800CC18

    p->itemEffect &= ~PLAYER_ITEM_EFFECT__80;

    if (!HAS_SHIELD(p)) {
        if (gRingCount != 0) {
            u32 rings = gRingCount;
            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
#ifndef NON_MATCHING
                register u32 rings2 asm("r0") = rings;
#else
                u32 rings2 = rings;
#endif
                if (rings > 10) {
                    rings2 = 10;
                }

                rings = rings2;
            }

            InitScatteringRings(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y), rings);

            if (IS_MULTI_PLAYER) {
                struct UNK_3005510 *unk = sub_8019224();
                unk->unk0 = 4;
                unk->unk1 = rings;
            }

            gRingCount -= rings;
        } else {
            // _0800CC80
            if (!(gUnknown_03005424 & EXTRA_STATE__DEMO_RUNNING)) {
                p->moveState |= MOVESTATE_DEAD;
            }
        }
    } else {
        m4aSongNumStart(SE_LIFE_LOST);
        p->itemEffect &= ~(PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC
                           | PLAYER_ITEM_EFFECT__SHIELD_NORMAL);
    }

    return TRUE;
}
#if 01
#endif