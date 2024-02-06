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
#include "game/parameters/characters.h"
#include "game/rings_scatter.h"
#include "game/trapped_animals.h"

#include "constants/player_transitions.h"
#include "constants/songs.h"

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
        } else if (!(gUnknown_03005424 & EXTRA_STATE__DEMO_RUNNING)) {
            p->moveState |= MOVESTATE_DEAD;
        }
    } else {
        m4aSongNumStart(SE_LIFE_LOST);
        p->itemEffect &= ~(PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC
                           | PLAYER_ITEM_EFFECT__SHIELD_NORMAL);
    }

    return TRUE;
}

// Called by: Boss 3,6,7, hammerhead, platform (square),
//            spikes, spring bouncy, speeding platform,
//            arrow platform, spike platform
u32 sub_800CCB8(Sprite *s, s32 sx, s32 sy, Player *p)
{
    s8 rectPlayer[4] = { -p->unk16, -p->unk17, +p->unk16, +p->unk17 };

    bool32 r4 = COLL_NONE;

    u32 mask;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0])) {
        return COLL_NONE;
    }

    if (!IS_ALIVE(p)) {
        return COLL_NONE;
    }

    if ((p->moveState & MOVESTATE_8) && (p->unk3C == s)) {
        r4 = COLL_FLAG_1;
        p->moveState &= ~MOVESTATE_8;
        p->moveState |= MOVESTATE_IN_AIR;
    }

    mask = sub_800CE94(s, sx, sy, (struct Rect8 *)rectPlayer, p);

    if (mask) {
        if (mask & 0x10000) {
            p->moveState |= MOVESTATE_8;
            p->moveState &= ~MOVESTATE_IN_AIR;
            p->unk3C = s;

            if (r4 == 0 && s == NULL) {
                p->speedGroundX = p->speedAirX;
            }
        }
    } else if (r4) {
        if (!(p->moveState & MOVESTATE_8)) {
            p->moveState &= ~MOVESTATE_20;
            p->moveState |= MOVESTATE_IN_AIR;
            p->unk3C = NULL;

            if (IS_BOSS_STAGE(gCurrentLevel)) {
                p->speedGroundX -= Q_24_8(gCamera.unk38);
            }
        }
    }

    return mask;
}

// Called by IAs ramp, spring, floating spring, bounce block, spike platform
u32 sub_800CDBC(Sprite *s, s32 sx, s32 sy, Player *p)
{
    s8 rectPlayer[4] = { -p->unk16, -p->unk17, +p->unk16, +p->unk17 };

    bool32 r4 = COLL_NONE;

    u32 mask;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0])) {
        return COLL_NONE;
    }

    if (!IS_ALIVE(p)) {
        return COLL_NONE;
    }

    if ((p->moveState & MOVESTATE_8) && (p->unk3C == s)) {
        r4 = COLL_FLAG_1;
        p->moveState &= ~MOVESTATE_8;
    }

    mask = sub_800CE94(s, sx, sy, (struct Rect8 *)rectPlayer, p);

    if (mask & 0x10000) {
        p->moveState |= MOVESTATE_8;
        p->unk3C = s;
    } else if (r4) {
        p->unk3C = NULL;

        if (IS_BOSS_STAGE(gCurrentLevel)) {
            p->speedGroundX -= Q_24_8(gCamera.unk38);
        }
    }

    return mask;
}

// Looks like each byte in the result is one value
// TODO: Remove gotos
u32 sub_800CE94(Sprite *s, s32 sx, s32 sy, struct Rect8 *inRect, Player *p)
{
    s32 px = Q_24_8_TO_INT(p->x);
    s32 py = Q_24_8_TO_INT(p->y);
    u32 result = 0;
    s32 r1;
    s32 r3, r6;

    if (RECT_COLLISION(sx, sy, (struct Rect8 *)&s->hitboxes[0].left, px, py, inRect)) {
        s32 sMidX = (sx + ((s->hitboxes[0].left + s->hitboxes[0].right) >> 1));
        s32 sMidY = (sy + ((s->hitboxes[0].top + s->hitboxes[0].bottom) >> 1));
        if ((sMidX <= px)) {
            r6 = (sx + s->hitboxes[0].right - (px + inRect->left));
            result |= 0x40000;
        } else {
            r6 = (sx + s->hitboxes[0].left - (px + inRect->right));
            result |= 0x80000;
        }

        if (sMidY > py) {
            r3 = sy + s->hitboxes[0].top - (py + inRect->bottom);
            r1 = r3 + 5;

            if ((r1) > 0) {
                r1 = 0;
            }
            result |= 0x10000;
        } else {
            r3 = sy + s->hitboxes[0].bottom - (py + inRect->top);
            r1 = r3 + 2;
            if ((r1) < 0) {
                r1 = 0;
            }
            result |= 0x20000;
        }
        // _0800CF90

        if (ABS(r6) < (ABS(r1))) {
            result &= 0xC0000;
            goto temp_lbl;
        } else {
            result &= 0x30000;

            if (!(result & 0x10000)) {
                goto temp_lbl;
            }
        }

        if (GRAVITY_IS_INVERTED) {
            if (p->speedAirY > 0) {
                return 0;
            }
        } else {
            if (p->speedAirY < 0) {
                return 0;
            }
        }

        if (!(p->moveState & MOVESTATE_IN_AIR)) {
            if ((p->rotation + 0x20) & 0x40) {
                p->speedGroundX = 0;
            }
        }

    temp_lbl:
        result |= (((r6 << 8) & 0xFF00) | (r3 & 0xFF));
        if (result & 0xC0000) {
            if (!(result & 0xFF00)) {
                result &= 0xFFF300FF;
            }
        } else {
            result &= 0xFFFF00FF;
        }

        if (!(result & 0x30000)) {
            result &= ~0xFF;
        }
    }

    return result;
}
