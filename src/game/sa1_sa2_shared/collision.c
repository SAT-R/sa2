#include "global.h"
#include "rect.h"
#include "sprite.h"
#include "lib/m4a/m4a.h"
#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/dust_cloud.h"
#include "game/sa1_sa2_shared/entities_manager.h"
#include "game/sa1_sa2_shared/player.h"

#include "game/cheese.h"
#include "game/entity.h"
#include "game/multiplayer/multiplayer_event_mgr.h"
#include "game/stage/rings_scatter.h"
#include "game/stage/trapped_animals.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

#ifndef COLLECT_RINGS_ROM
u32 Coll_Player_Entity_RectIntersection(Sprite *s, s32 sx, s32 sy, Player *p, Rect8 *rectPlayer)
{
    u32 result = 0;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0]) || !IS_ALIVE(p)) {
        return result;
    }

    if (RECT_COLLISION(sx, sy, &s->hitboxes[0], I(p->qWorldX), I(p->qWorldY), rectPlayer)) {
        result |= COLL_FLAG_80000;
    }

    return result;
}

// (Link included because of register-match)
// (100.00%) https://decomp.me/scratch/0Ro0I
u32 Coll_Player_PlatformCrumbling(Sprite *s, s32 sx, s32 sy, Player *p)
{
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    u32 result = COLL_NONE;
    bool32 ip = FALSE;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0]) || !IS_ALIVE(p)) {
        return result;
    }

    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        ip = TRUE;
    }

    if (RECT_COLLISION_2(sx, sy, &s->hitboxes[0], p->qWorldX, p->qWorldY, (Rect8 *)rectPlayer) && (p->qSpeedAirY >= 0)) {

#ifndef NON_MATCHING
        register s32 y asm("r1");
#else
        s32 y;
#endif

        rectPlayer[1] = -p->spriteOffsetY;
        rectPlayer[3] = +p->spriteOffsetY;
        p->moveState |= MOVESTATE_STOOD_ON_OBJ;
        result |= COLL_FLAG_8;

        if (!ip) {
            p->rotation = 0;
        }

        p->stoodObj = s;
        p->qSpeedAirY = 0;

        if (GRAVITY_IS_INVERTED) {
            y = s->hitboxes[0].bottom;
            y += sy;
            y += rectPlayer[3];
        } else {
            y = s->hitboxes[0].top;
            y += sy;
            y -= rectPlayer[3];
        }
        y = Q(y);
        p->qWorldY = Q_24_8_FRAC(p->qWorldY) + (y);
    } else if (ip && !(p->moveState & MOVESTATE_STOOD_ON_OBJ)) {
        p->moveState &= ~MOVESTATE_20;
        p->moveState |= MOVESTATE_IN_AIR;
    }

    return result;
}
#endif

bool32 Coll_Player_Entity_HitboxN(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p, s16 hbIndexPlayer)
{
    PlayerSpriteInfo *psi = p->spriteInfoBody;
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

    if ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex], I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[hbIndexPlayer]))) {
        return TRUE;
    }

    return FALSE;
}

#ifndef COLLECT_RINGS_ROM
bool32 Coll_Player_Boss_Attack(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p)
{
    PlayerSpriteInfo *psi = p->spriteInfoBody;
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

    if ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex], I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[1]))) {
        Coll_Player_Enemy_AdjustSpeed(p);
        return TRUE;
    }

    return FALSE;
}

bool32 Coll_Cheese_Enemy_Attack(Sprite *sprTarget, s32 sx, s32 sy, s16 hbIndex, Player *p)
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

        if ((HB_COLLISION(sx, sy, sprTarget->hitboxes[hbIndex], I(cheese->posX), I(cheese->posY), cheese->s.hitboxes[1]))) {
            return TRUE;
        }
    }

    return FALSE;
}

bool32 Coll_Player_Enemy_Attack(Sprite *s, s32 sx, s32 sy, u8 hbIndex)
{
    Player *player = &gPlayer;
    Sprite *sprPlayer = &player->spriteInfoBody->s;

    bool32 dead;
    u32 movestate;
    EnemyBase *eb;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[hbIndex])) {
        return FALSE;
    }

    eb = TASK_DATA(gCurTask);
    dead = player->moveState & MOVESTATE_DEAD;
    movestate = player->moveState;

    if (!dead) {
        if (IS_MULTI_PLAYER && ((s8)eb->base.me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
            CreateDustCloud(sx, sy);
            CreateTrappedAnimal(sx, sy);
            return TRUE;
        }

        if (!(movestate & MOVESTATE_IN_SCRIPTED)) {
            if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1])) {
                if (HB_COLLISION(sx, sy, s->hitboxes[hbIndex], I(player->qWorldX), I(player->qWorldY), sprPlayer->hitboxes[1])) {
                    if (IS_MULTI_PLAYER) {
                        RoomEvent_EnemyDestroy *roomEvent = CreateRoomEvent();
                        roomEvent->type = ROOMEVENT_TYPE_ENEMY_DESTROYED;
                        roomEvent->x = eb->base.regionX;
                        roomEvent->y = eb->base.regionY;
                        roomEvent->id = eb->base.id;
                    }

                    Coll_Player_Enemy_AdjustSpeed(player);

                    CreateDustCloud(sx, sy);
                    CreateTrappedAnimal(sx, sy);
                    CreateEnemyDefeatScoreAndManageLives(sx, sy);

                    return TRUE;
                }
            }

            if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0])
                && (HB_COLLISION(sx, sy, s->hitboxes[hbIndex], I(player->qWorldX), I(player->qWorldY), sprPlayer->hitboxes[0]))) {
                if (!(player->itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                    Coll_DamagePlayer(player);
                } else {
                    if (IS_MULTI_PLAYER) {
                        RoomEvent_EnemyDestroy *roomEvent = CreateRoomEvent();
                        roomEvent->type = ROOMEVENT_TYPE_ENEMY_DESTROYED;
                        roomEvent->x = eb->base.regionX;
                        roomEvent->y = eb->base.regionY;
                        roomEvent->id = eb->base.id;
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
                && ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex], I(cheese->posX), I(cheese->posY), cheese->s.hitboxes[1])))) {
                if (IS_MULTI_PLAYER) {
                    RoomEvent_EnemyDestroy *roomEvent = CreateRoomEvent();
                    roomEvent->type = ROOMEVENT_TYPE_ENEMY_DESTROYED;
                    roomEvent->x = eb->base.regionX;
                    roomEvent->y = eb->base.regionY;
                    roomEvent->id = eb->base.id;
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

bool32 Coll_Player_Projectile(Sprite *s, s32 sx, s32 sy)
{
    Player *p;
    Sprite *sprPlayer;
    bool32 result = FALSE;

    if (gPlayer.moveState & MOVESTATE_IN_SCRIPTED) {
        return result;
    }

    if (HITBOX_IS_ACTIVE(s->hitboxes[0])) {
        p = &gPlayer;
        sprPlayer = &p->spriteInfoBody->s;

        if ((!PLAYER_IS_ALIVE) || !HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0])) {
            return result;
        }

        if ((HB_COLLISION(sx, sy, s->hitboxes[0], I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0]))) {
            Coll_DamagePlayer(p);
            result = TRUE;
        }
    }

    return result;
}
#endif

bool32 Coll_Player_ItemBox(Sprite *s, s32 sx, s32 sy)
{
    bool32 result = FALSE;

    Player *p = &gPlayer;
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprPlayer = &psi->s;

    if (PLAYER_IS_ALIVE && HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1]) && (HITBOX_IS_ACTIVE(s->hitboxes[0]))) {
        if (HB_COLLISION(sx, sy, s->hitboxes[0], I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[1])) {
            result = TRUE;
        }
    }

    return result;
}

#ifndef COLLECT_RINGS_ROM
bool32 Coll_Player_Enemy(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p)
{
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprPlayer = &psi->s;

    if (IS_ALIVE(p) && (HITBOX_IS_ACTIVE(s->hitboxes[hbIndex]) && HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0]))) {
        if (HB_COLLISION(sx, sy, s->hitboxes[hbIndex], I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0])) {
            Coll_DamagePlayer(p);
            return TRUE;
        }
    }

    return FALSE;
}

void Coll_Player_Enemy_AdjustSpeed(Player *p)
{
    if (p->moveState & MOVESTATE_BOOST_EFFECT_ON) {
        // Also triggered on homing-attack.
        // Slight boost upwards for the player.
        p->transition = PLTRANS_HOMING_ATTACK_RECOIL;
        p->qSpeedAirX = 0;
        p->qSpeedAirY = 0;
    } else if (IS_BOSS_STAGE(gCurrentLevel)) {
        s32 speedX = -(p->qSpeedAirX >> 1);
        p->qSpeedAirY = -p->qSpeedAirY;
        // BUG: using the camera DX here is not really fair, since
        // this will throw the player forwards if the camera is moving
        // towards the boss.
        // In reality this should use a fixed value of +Q(5) since that's
        // the boss moving speed
        p->qSpeedAirX = speedX - Q(gCamera.dx);
    } else if (p->qSpeedAirY > 0) {
        // Bounce off of enemies
        p->qSpeedAirY = -p->qSpeedAirY;
    }

    gPlayer.moveState |= MOVESTATE_4000;
}
#endif

// (100.00%) https://decomp.me/scratch/verla
// TODO: Register fake-match
bool32 Coll_DamagePlayer(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return FALSE;
    }

    p->timerInvulnerability = PLAYER_INVULNERABLE_DURATION;

    if (p->moveState & MOVESTATE_1000000) {
        PlayerSpriteInfo *psi;

        p->layer = PLAYER_LAYER__BACK;

        p->moveState &= ~MOVESTATE_1000000;
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

        p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    }

    if (!(p->moveState & MOVESTATE_1000000)) {
        p->transition = PLTRANS_HURT;
    }

    p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

    if (!HAS_SHIELD(p)) {
        if (gRingCount > 0) {
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

            InitScatteringRings(I(p->qWorldX), I(p->qWorldY), rings);

            if (IS_MULTI_PLAYER) {
                RoomEvent_RingLoss *roomEvent = CreateRoomEvent();
                roomEvent->type = ROOMEVENT_TYPE_PLAYER_RING_LOSS;
                roomEvent->ringCount = rings;
            }

            gRingCount -= rings;
        } else if (!(gStageFlags & STAGE_FLAG__DEMO_RUNNING)) {
            p->moveState |= MOVESTATE_DEAD;
        }
    }
#ifndef COLLECT_RINGS_ROM
    else {
        m4aSongNumStart(SE_LIFE_LOST);
        p->itemEffect &= ~(PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC | PLAYER_ITEM_EFFECT__SHIELD_NORMAL);
    }
#endif

    return TRUE;
}

u32 Coll_Player_Platform(Sprite *s, s32 sx, s32 sy, Player *p)
{
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    bool32 stoodOnSprite = FALSE;

    u32 mask;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0])) {
        return COLL_NONE;
    }

    if (!IS_ALIVE(p)) {
        return COLL_NONE;
    }

    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        stoodOnSprite = TRUE;
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        p->moveState |= MOVESTATE_IN_AIR;
    }

    mask = sub_800CE94(s, sx, sy, (Rect8 *)rectPlayer, p);

    if (mask != 0) {
        if (mask & COLL_FLAG_10000) {
            p->moveState |= MOVESTATE_STOOD_ON_OBJ;
            p->moveState &= ~MOVESTATE_IN_AIR;
            p->stoodObj = s;

            if (!stoodOnSprite && s == NULL) {
                p->qSpeedGround = p->qSpeedAirX;
            }
        }
    } else if (stoodOnSprite) {
        if (!(p->moveState & MOVESTATE_STOOD_ON_OBJ)) {
            p->moveState &= ~MOVESTATE_20;
            p->moveState |= MOVESTATE_IN_AIR;
            p->stoodObj = NULL;
#ifndef COLLECT_RINGS_ROM
            if (IS_BOSS_STAGE(gCurrentLevel)) {
                p->qSpeedGround -= Q(gCamera.dx);
            }
#endif
        }
    }

    return mask;
}

/**
 * Different to platform collision as never called in bosses
 * and doesn't handle jumping onto moving platforms etc.
 * Could be called static interactable collision?
 */
u32 Coll_Player_Interactable(Sprite *s, s32 sx, s32 sy, Player *p)
{
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    bool32 stoodOnSprite = FALSE;

    u32 mask;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0])) {
        return COLL_NONE;
    }

    if (!IS_ALIVE(p)) {
        return COLL_NONE;
    }

    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        stoodOnSprite = TRUE;
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
    }

    mask = sub_800CE94(s, sx, sy, (Rect8 *)rectPlayer, p);

    if (mask & COLL_FLAG_10000) {
        p->moveState |= MOVESTATE_STOOD_ON_OBJ;
        p->stoodObj = s;
    } else if (stoodOnSprite) {
        p->stoodObj = NULL;
#ifndef COLLECT_RINGS_ROM
        if (IS_BOSS_STAGE(gCurrentLevel)) {
            p->qSpeedGround -= Q(gCamera.dx);
        }
#endif
    }

    return mask;
}

// Looks like each byte in the result is one value
// TODO: Remove gotos
u32 sub_800CE94(Sprite *s, s32 sx, s32 sy, Rect8 *inRect, Player *p)
{
    s32 px = I(p->qWorldX);
    s32 py = I(p->qWorldY);
    u32 result = 0;
    s32 r1;
    s32 r3, r6;

    if (RECT_COLLISION(sx, sy, (Rect8 *)&s->hitboxes[0].left, px, py, inRect)) {
        s32 sMidX = (sx + ((s->hitboxes[0].left + s->hitboxes[0].right) >> 1));
        s32 sMidY = (sy + ((s->hitboxes[0].top + s->hitboxes[0].bottom) >> 1));
        if ((sMidX <= px)) {
            r6 = (sx + s->hitboxes[0].right - (px + inRect->left));
            result |= COLL_FLAG_40000;
        } else {
            r6 = (sx + s->hitboxes[0].left - (px + inRect->right));
            result |= COLL_FLAG_80000;
        }

        if (sMidY > py) {
            r3 = sy + s->hitboxes[0].top - (py + inRect->bottom);
            r1 = r3 + 5;

            if ((r1) > 0) {
                r1 = 0;
            }
            result |= COLL_FLAG_10000;
        } else {
            r3 = sy + s->hitboxes[0].bottom - (py + inRect->top);
            r1 = r3 + 2;
            if ((r1) < 0) {
                r1 = 0;
            }
            result |= COLL_FLAG_20000;
        }
        // _0800CF90

        if (ABS(r6) < (ABS(r1))) {
            result &= (COLL_FLAG_40000 | COLL_FLAG_80000);
            goto temp_lbl;
        } else {
            result &= (COLL_FLAG_10000 | COLL_FLAG_20000);

            if (!(result & COLL_FLAG_10000)) {
                goto temp_lbl;
            }
        }

        if (GRAVITY_IS_INVERTED) {
            if (p->qSpeedAirY > 0) {
                return 0;
            }
        } else {
            if (p->qSpeedAirY < 0) {
                return 0;
            }
        }

        if (!(p->moveState & MOVESTATE_IN_AIR)) {
            if ((p->rotation + 0x20) & 0x40) {
                p->qSpeedGround = 0;
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

        if (!(result & (COLL_FLAG_10000 | COLL_FLAG_20000))) {
            result &= ~0xFF;
        }
    }

    return result;
}

NONMATCH(
#ifndef COLLECT_RINGS_ROM
    "asm/non_matching/game/sa1_sa2_shared/collision__sub_800D0A0.inc",
#else
    "asm/non_matching/game/sa1_sa2_shared/collision__sub_800D0A0_collect_rings.inc",
#endif
    u32 sub_800D0A0(Sprite *s, s16 param1, s16 param2, s16 param3, s16 param4, u8 param5, u32 param6))
{
    return 0;
}
END_NONMATCH

// TODO: Maybe wrap sub_800DD54 and sub_800DE44 in a macro(?)
u32 sub_800DA4C(Sprite *opponent, s16 oppX, s16 oppY, UNUSED s32 param3, UNUSED s32 param4, u8 layer)
{
    MultiplayerPlayer *mpp;
    Sprite *mpPlayerSprite;
    u32 res2;
    u32 result = COLL_NONE;

    Player *p = &gPlayer;
    if (!IS_ALIVE(p)) {
        return COLL_NONE;
    }

    if (p->moveState & MOVESTATE_GOAL_REACHED) {
        return COLL_NONE;
    }

    mpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
    mpPlayerSprite = &mpp->s;

    if (layer != p->layer) {
        return COLL_NONE;
    }
    // _0800DABC

    if ((p->qSpeedAirX == 0 && p->qSpeedAirY == 0) && HITBOX_IS_ACTIVE(opponent->hitboxes[1])) {
        if (HB_COLLISION(oppX, oppY, opponent->hitboxes[1], mpp->pos.x, mpp->pos.y, mpPlayerSprite->hitboxes[0])) {
            // _0800DB68
            result |= COLL_FLAG_2;
        }
    }
    // _0800DB70
    if (HITBOX_IS_ACTIVE(mpPlayerSprite->hitboxes[1]) && HITBOX_IS_ACTIVE(opponent->hitboxes[0])
        && HB_COLLISION(oppX, oppY, opponent->hitboxes[0], mpp->pos.x, mpp->pos.y, mpPlayerSprite->hitboxes[1])) {
        // _0800DC34
        if (mpp->pos.x > oppX) {
            result |= COLL_FLAG_40000;
        } else {
            result |= COLL_FLAG_20000;
        }
        // _0800DC66

        if (mpp->pos.y > oppY) {
            result |= COLL_FLAG_10000;
        } else {
            result |= COLL_FLAG_100000;
        }

        result |= COLL_FLAG_1;
    } else if (HITBOX_IS_ACTIVE(mpPlayerSprite->hitboxes[0]) && HITBOX_IS_ACTIVE(opponent->hitboxes[1])
               && HB_COLLISION(oppX, oppY, opponent->hitboxes[1], mpp->pos.x, mpp->pos.y, mpPlayerSprite->hitboxes[0])) {
        result |= COLL_FLAG_2;
    }

    return result;
}

bool32 sub_800DD54(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return FALSE;
    }

    p->timerInvulnerability = PLAYER_INVULNERABLE_DURATION;

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->qSpeedAirX = +Q(1.5);
    } else {
        p->qSpeedAirX = -Q(1.5);
    }

    p->qSpeedAirY = -Q(3.0);

#ifndef COLLECT_RINGS_ROM
    if (p->moveState & MOVESTATE_IN_WATER) {
        HALVE(p->qSpeedAirY);
        HALVE(p->qSpeedAirX);
    }
#endif

    p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_4;
    p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~MOVESTATE_400;
    p->moveState &= ~MOVESTATE_100;

    p->charState = SA2_CHAR_ANIM_20;
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk61 = 0;
    p->unk62 = 0;

    p->transition = 9;

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        RoomEvent_RingLoss *roomEvent;
#ifndef NON_MATCHING
        register u32 rings asm("r4") = gRingCount;
#else
        u32 rings = gRingCount;
#endif

        if (rings > 10) {
            rings = 10;
        }

        InitScatteringRings(I(p->qWorldX), I(p->qWorldY), rings);
        gRingCount -= rings;

        roomEvent = CreateRoomEvent();
        roomEvent->type = ROOMEVENT_TYPE_PLAYER_RING_LOSS;
        roomEvent->ringCount = rings;
    }

    m4aSongNumStart(SE_LIFE_LOST);

    return TRUE;
}

#ifndef COLLECT_RINGS_ROM
bool32 sub_800DE44(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return FALSE;
    }

    p->timerInvulnerability = PLAYER_INVULNERABLE_DURATION;

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->qSpeedAirX = -Q(1.5);
    } else {
        p->qSpeedAirX = +Q(1.5);
    }

    p->qSpeedAirY = -Q(3.0);

    if (p->moveState & MOVESTATE_IN_WATER) {
        HALVE(p->qSpeedAirY);
        HALVE(p->qSpeedAirX);
    }

    p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_4;
    p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~MOVESTATE_400;
    p->moveState &= ~MOVESTATE_100;

    p->charState = SA2_CHAR_ANIM_20;
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk61 = 0;
    p->unk62 = 0;

    p->transition = 9;

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        RoomEvent_RingLoss *roomEvent;
#ifndef NON_MATCHING
        register u32 rings asm("r4") = gRingCount;
#else
        u32 rings = gRingCount;
#endif

        if (rings > 5) {
            rings = 5;
        }

        InitScatteringRings(I(p->qWorldX), I(p->qWorldY), rings);
        gRingCount -= rings;

        roomEvent = CreateRoomEvent();
        roomEvent->type = ROOMEVENT_TYPE_PLAYER_RING_LOSS;
        roomEvent->ringCount = rings;
    }

    m4aSongNumStart(SE_LIFE_LOST);

    return TRUE;
}

u32 Coll_Player_Entity_Intersection(Sprite *s, s32 x, s32 y, Player *p)
{
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    return Coll_Player_Entity_RectIntersection(s, x, y, p, (Rect8 *)&rectPlayer);
}
#endif
