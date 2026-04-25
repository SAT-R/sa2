#include "global.h"
#include "rect.h"
#include "sprite.h"
#include "lib/m4a/m4a.h"

#include "game/globals.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/dust_cloud.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/player.h"

#include "game/shared/stage/entity.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/rings_scatter.h"

#if (GAME == GAME_SA1)
#include "game/sa1/stage/trapped_animals.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#elif (GAME == GAME_SA2)
#include "game/sa2/stage/trapped_animals.h"
#include "game/sa2/stage/cheese.h"

#include "constants/sa2/animations.h"
#include "constants/sa2/player_transitions.h"
#include "constants/sa2/songs.h"
#endif

// COLLISION 3

#if (GAME == GAME_SA1)
static bool32 Coll_DamageSuperSonic(Player *p);
#endif

#ifndef COLLECT_RINGS_ROM
u32 Coll_Player_Entity_RectIntersection(Sprite *s, CamCoord sx, CamCoord sy, Player *p, Rect8 *rectPlayer)
{
    u32 result = 0;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0]) || !IS_ALIVE(p)) {
        return result;
    }

    if (RECT_COLLISION(sx, sy, &s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), rectPlayer)) {
        result |= COLL_FLAG_80000;
    }

    return result;
}

#if (GAME == GAME_SA1)
u32 Coll_AmyHammer_Spring(Sprite *s, s16 worldX, s16 worldY, Player *p)
{
    bool32 isColliding = FALSE;

    if (p->character == CHARACTER_AMY) {
        if ((p->charState == CHARSTATE_87) || (p->charState == CHARSTATE_88) || (p->charState == CHARSTATE_89)
            || (p->charState == CHARSTATE_90)) {
            if (p->spriteInfoBody->s.hitboxes[1].index != HITBOX_STATE_INACTIVE) {
                if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), p->spriteInfoBody->s.hitboxes[1].b)) {
                    isColliding = TRUE;
                }
            }
        }
    }

    return isColliding;
}

u32 Coll_Player_Spring_Sideways(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p)
{
    s8 rectDataPlayerA[4] = { -(p->spriteOffsetX + 5), (1 - p->spriteOffsetY), (p->spriteOffsetX + 5), (p->spriteOffsetY - 1) };
    s8 rectDataPlayerB[4] = { -(p->spriteOffsetX + 0), (0 - p->spriteOffsetY), (p->spriteOffsetX + 0), (p->spriteOffsetY + 0) };
    Rect8 *rectPlayerB;

    u32 moveState = 0;
    bool32 stoodOnCurrent = 0;

    if (s->hitboxes[0].index == -1) {
        return moveState;
    }

    if (!IS_ALIVE(p)) {
        return moveState;
    }

    moveState = p->moveState & MOVESTATE_IN_AIR;
    rectPlayerB = (Rect8 *)&rectDataPlayerB[0];
    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        moveState |= MOVESTATE_IN_AIR;
        stoodOnCurrent = 1;
    }

    if (moveState & MOVESTATE_IN_AIR) {
        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*rectPlayerB))) {
            if (sub_800C934(s, worldX, worldY, (Rect8 *)&rectDataPlayerB, stoodOnCurrent, p, &moveState)) {
                return moveState;
            }
        } else if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*(Rect8 *)&rectDataPlayerA))) {
            if (I(p->qWorldX) <= worldX) {
                if (p->qSpeedAirX >= 0) {
                    p->qSpeedAirX = 0;
                    p->qWorldX = Q((worldX + s->hitboxes[0].b.left) - rectDataPlayerA[2]);
                    moveState |= MOVESTATE_20000;
                }
            } else if (p->qSpeedAirX <= 0) {
                p->qSpeedAirX = 0;
                p->qWorldX = Q(((worldX + s->hitboxes[0].b.right) - rectDataPlayerA[0]) + 1);
                moveState |= MOVESTATE_40000;
            }
        }
    }

    if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*(Rect8 *)&rectDataPlayerA))) {
        if (I(p->qWorldX) <= worldX) {
            if (p->qSpeedAirX >= 0) {
                moveState |= MOVESTATE_20000;

                if (p->qSpeedAirX > 0) {
                    moveState |= MOVESTATE_20;
                    moveState &= ~MOVESTATE_FACING_LEFT;
                    p->qWorldX = Q((worldX + s->hitboxes[0].b.left) - rectDataPlayerA[2]);
                }
            }
        } else {
            if (p->qSpeedAirX <= 0) {
                moveState |= MOVESTATE_40000;

                if (p->qSpeedAirX < 0) {
                    moveState |= MOVESTATE_20;
                    moveState |= MOVESTATE_FACING_LEFT;
                    p->qWorldX = Q(((worldX + s->hitboxes[0].b.right) - rectDataPlayerA[0]) + 1);
                }
            }
        }
    }

    return moveState;
}

// (99.92%) https://decomp.me/scratch/GFpFd
NONMATCH("asm/non_matching/game/shared/stage/collision__Coll_Player_Itembox.inc",
         u32 Coll_Player_Itembox(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p))
{
    s8 rectDataPlayerA[4] = { -(p->spriteOffsetX + 5), (1 - p->spriteOffsetY), (p->spriteOffsetX + 5), (p->spriteOffsetY - 1) };
    s8 rectDataPlayerB[4] = { -(p->spriteOffsetX + 0), (0 - p->spriteOffsetY), (p->spriteOffsetX + 0), (p->spriteOffsetY + 0) };
    Rect8 *rectPlayerB = (Rect8 *)&rectDataPlayerB[0];

    u32 result;
    s32 middleX;
    s32 middleY;

    result = 0;
    if (s->hitboxes[0].index == -1) {
        return result;
    }

    if (!IS_ALIVE(p)) {
        return result;
    }

    if (p->spriteInfoBody->s.hitboxes[1].index != -1) {
        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), p->spriteInfoBody->s.hitboxes[1].b)) {
            result |= 0x20;
            if (p->moveState & MOVESTATE_IN_AIR) {
                if (p->qSpeedAirY > 0) {
                    p->qSpeedAirY = -p->qSpeedAirY;
                }
            }
        }
    }

    if (p->moveState & MOVESTATE_IN_AIR) {
        middleX = worldX + ((s->hitboxes[0].b.left + s->hitboxes[0].b.right) >> 1);
        middleY = worldY + ((s->hitboxes[0].b.top + s->hitboxes[0].b.bottom) >> 1);

        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*rectPlayerB))) {
            if ((!GRAVITY_IS_INVERTED && (I(p->qWorldY) <= middleY)) || (GRAVITY_IS_INVERTED && (I(p->qWorldY) >= middleY))) {
                if ((p->character == 1) && (p->SA2_LABEL(unk61) != 0)) {
                    Coll_Player_Platform(s, worldX, worldY, p);
                    return 0;
                } else if (p->qSpeedAirY >= 0) {
                    result |= 8;

                    if (p->qSpeedAirY > 0) {
                        p->qSpeedAirY = -p->qSpeedAirY;
                    }
                }
            } else if (p->qSpeedAirY < 0) {
                p->qSpeedAirY = 0;

                if (!GRAVITY_IS_INVERTED) {
                    p->qWorldY = p->qWorldY + (Q((worldY + s->hitboxes[0].b.bottom) - rectDataPlayerB[1]) - (0xFFFFFF00 & p->qWorldY));
                } else {
                    p->qWorldY = p->qWorldY - (Q((worldY + s->hitboxes[0].b.bottom) - rectDataPlayerB[1]) - (0xFFFFFF00 & p->qWorldY));
                }

                result |= 0x10000;
            }
        } else if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*(Rect8 *)&rectDataPlayerA[0]))) {
            if (I(p->qWorldX) <= middleX) {
                if (p->qSpeedAirX > 0) {
                    p->qSpeedAirX = 0;
                    p->qWorldX = Q(worldX + s->hitboxes[0].b.left - rectDataPlayerA[2]);
                }
            } else {
                if (p->qSpeedAirX < 0) {
                    p->qSpeedAirX = 0;
                    p->qWorldX = Q((worldX + s->hitboxes[0].b.right - rectDataPlayerA[0]) + 1);
                }
            }
        }
    }

    return result;
}
END_NONMATCH

// Used by Security Gate and Breakable Wall.
u32 Coll_Player_Gate(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p, u32 arg4)
{
    u32 result = 0;
    s8 rectPlayer[4] = { -(p->spriteOffsetX + 5), (1 - p->spriteOffsetY), (p->spriteOffsetX + 5), (p->spriteOffsetY - 1) };

    if (s->hitboxes[0].index == -1) {
        return result;
    }

    if (!IS_ALIVE(p)) {
        return result;
    }

    if (arg4 != 0) {
        if (p->spriteInfoBody->s.hitboxes[1].index != -1) {
            if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), p->spriteInfoBody->s.hitboxes[1].b)
                || HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*(Rect8 *)&rectPlayer[0]))) {

                result |= 8;
                if ((p->moveState & MOVESTATE_IN_AIR) && (p->qSpeedAirY > 0)) {
                    p->qSpeedAirY = -p->qSpeedAirY;
                }

                return result;
            }
        }
    }

    sub_800CBBC(s, worldX, worldY, (Rect8 *)&rectPlayer, 0, p, &result);
    return result;
}

u32 Coll_Player_SkatingStone(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p)
{
    s32 moveState;
    s32 var_sb;

    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    u32 result;

    result = 0;
    var_sb = 0;

    if ((s->hitboxes[0].index == -1) || (((0x80 & p->moveState) != 0))) {
        return 0U;
    }

    moveState = p->moveState & MOVESTATE_IN_AIR;
    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        p->moveState = p->moveState & ~MOVESTATE_STOOD_ON_OBJ;
        moveState |= MOVESTATE_IN_AIR;
        var_sb = 1;
    }

    if (((moveState == 0) || !sub_800C934(s, worldX, worldY, (Rect8 *)rectPlayer, var_sb, p, &result))
        && !sub_800C934(s, worldX, worldY, (Rect8 *)rectPlayer, var_sb, p, &result)) {
        if (var_sb) {
            if (!(p->moveState & MOVESTATE_STOOD_ON_OBJ)) {
                p->moveState = (p->moveState & ~MOVESTATE_20) | MOVESTATE_IN_AIR;
            }
        }
    }

    return result;
}
#endif

// (Links included because of register-match)
// SA1: https://decomp.me/scratch/LcYA5
// SA2: https://decomp.me/scratch/0Ro0I
u32 Coll_Player_PlatformCrumbling(Sprite *s, CamCoord sx, CamCoord sy, Player *p)
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

    if (RECT_COLLISION_2(sx, sy, &s->hitboxes[0].b, p->qWorldX, p->qWorldY, (Rect8 *)rectPlayer) && (p->qSpeedAirY >= 0)) {
#ifndef NON_MATCHING
#if (GAME == GAME_SA1)
        register s32 y asm("r0");
        s32 mask = 0xFFFFFF00;
#elif (GAME == GAME_SA2)
        register s32 y asm("r1");
#endif
#else
        s32 y;
#endif

        rectPlayer[1] = -p->spriteOffsetY;
        rectPlayer[3] = +p->spriteOffsetY;
        p->moveState |= MOVESTATE_STOOD_ON_OBJ;
        result |= COLL_FLAG_8;

#if (GAME == GAME_SA1)
        if (((p->character != CHARACTER_KNUCKLES) || (p->SA2_LABEL(unk61) != 1 && p->SA2_LABEL(unk61) != 3))
            && ((p->character != CHARACTER_AMY) || !(p->moveState & MOVESTATE_4000000) || (p->SA2_LABEL(unk62) == 0))) {
            p->moveState &= ~MOVESTATE_IN_AIR;
        }

#endif

        if (!ip) {
#if (GAME == GAME_SA1)
            if ((p->character != CHARACTER_KNUCKLES) || ((p->SA2_LABEL(unk61) != 1) && (p->SA2_LABEL(unk61) != 3))) {
                SA2_LABEL(sub_8021BE0)(p);
                p->qSpeedGround = p->qSpeedAirX;
            }
#endif
            p->rotation = 0;
        }

        p->stoodObj = s;
        p->qSpeedAirY = 0;

#if (GAME == GAME_SA1)
        if (!GRAVITY_IS_INVERTED) {
            y = Q((sy + s->hitboxes[0].b.top) - rectPlayer[3]);
        } else {
            y = Q((sy + s->hitboxes[0].b.bottom) + rectPlayer[3]);
        }
#elif (GAME == GAME_SA2)
        if (GRAVITY_IS_INVERTED) {
            y = Q((sy + s->hitboxes[0].b.bottom) + rectPlayer[3]);
        } else {
            y = Q((sy + s->hitboxes[0].b.top) - rectPlayer[3]);
        }
#endif
#if (GAME == GAME_SA1) && !defined(NON_MATCHING)
        p->qWorldY = ((p->qWorldY & ~mask)) + (y);
#else
        p->qWorldY = Q_24_8_FRAC(p->qWorldY) + (y);
#endif
    } else if (ip && !(p->moveState & MOVESTATE_STOOD_ON_OBJ)) {
        p->moveState &= ~MOVESTATE_20;
        p->moveState |= MOVESTATE_IN_AIR;
    }

    return result;
}
#endif

#if (GAME == GAME_SA2)
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

    if ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[hbIndexPlayer].b))) {
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

    if ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[1].b))) {
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

        if ((HB_COLLISION(sx, sy, sprTarget->hitboxes[hbIndex].b, I(cheese->posX), I(cheese->posY), cheese->s.hitboxes[1].b))) {
            return TRUE;
        }
    }

    return FALSE;
}
#endif
#endif

#ifndef COLLECT_RINGS_ROM
#if (GAME == GAME_SA1)
bool32 Coll_Player_Enemy_Attack(Sprite *s, CamCoord sx, CamCoord sy)
#else
bool32 Coll_Player_Enemy_Attack(Sprite *s, CamCoord sx, CamCoord sy, u8 hbIndex)
#endif
{
    Player *player = &gPlayer;
    Sprite *sprPlayer = &player->spriteInfoBody->s;
    EnemyBase *eb;
    s32 i = 0;
#if (GAME == GAME_SA1)
    const int hbIndex = 0;
#endif
    if (!HITBOX_IS_ACTIVE(s->hitboxes[hbIndex])) {
        return FALSE;
    }

    eb = TASK_DATA(gCurTask);
#if (GAME == GAME_SA1)
    do
#endif
    {
        player = &PLAYER(i);
        sprPlayer = &player->spriteInfoBody->s;

        if (!(player->moveState & MOVESTATE_DEAD)) {
            if (IS_MULTI_PLAYER && ((s8)eb->base.me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
                CreateDustCloud(sx, sy);
                CreateTrappedAnimal(sx, sy);
                return TRUE;
            }

#if (GAME == GAME_SA2)
            if (!(player->moveState & MOVESTATE_IN_SCRIPTED))
#endif
            {
                if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1])) {
                    if (HB_COLLISION(sx, sy, s->hitboxes[hbIndex].b, I(player->qWorldX), I(player->qWorldY), sprPlayer->hitboxes[1].b)) {
                        if (IS_MULTI_PLAYER) {
                            RoomEvent_EnemyDestroy *roomEvent = CreateRoomEvent();
                            roomEvent->type = ROOMEVENT_TYPE_ENEMY_DESTROYED;
                            roomEvent->x = eb->base.regionX;
                            roomEvent->y = eb->base.regionY;
                            roomEvent->id = eb->base.id;
                        }

#if (GAME == GAME_SA1)
                        if (player->qSpeedAirY > 0) {
                            player->qSpeedAirY = -player->qSpeedAirY;
                        }
#else
                        Coll_Player_Enemy_AdjustSpeed(player);
#endif

                        CreateDustCloud(sx, sy);
                        CreateTrappedAnimal(sx, sy);
                        CreateEnemyDefeatScoreAndManageLives(sx, sy);

                        return TRUE;
                    }
                }

                if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0])
                    && (HB_COLLISION(sx, sy, s->hitboxes[hbIndex].b, I(player->qWorldX), I(player->qWorldY), sprPlayer->hitboxes[0].b))) {
                    if (player->itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY) {
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
                    } else {
                        Coll_DamagePlayer(player);
                    }
                }
            }

#if (GAME == GAME_SA2)
            if (gCheese != NULL) {
                Cheese *cheese = gCheese;
                if (cheese->s.hitboxes[1].index != -1
                    && ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex].b, I(cheese->posX), I(cheese->posY), cheese->s.hitboxes[1].b)))) {
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
#endif
        }
    }
#if (GAME == GAME_SA1)
    while (++i < gNumSingleplayerCharacters);
#endif

    return FALSE;
}

bool32 Coll_Player_Projectile(Sprite *s, CamCoord sx, CamCoord sy)
{
    Player *p;
    Sprite *sprPlayer;
    bool32 result = FALSE;
    s32 i;

#if (GAME == GAME_SA2)
    if (gPlayer.moveState & MOVESTATE_IN_SCRIPTED) {
        return result;
    }
#endif

    if (HITBOX_IS_ACTIVE(s->hitboxes[0])) {
        i = 0;
#if (GAME == GAME_SA1)
        do
#endif
        {
            p = &PLAYER(i);
            sprPlayer = &p->spriteInfoBody->s;

            if (!IS_ALIVE(p) || !HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0])) {
#if (GAME == GAME_SA1)
                continue;
#elif (GAME == GAME_SA2)
                return result;
#endif
            }

            if ((HB_COLLISION(sx, sy, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0].b))) {
                Coll_DamagePlayer(p);
                result = TRUE;
            }
        }
#if (GAME == GAME_SA1)
        while (++i < gNumSingleplayerCharacters);
#endif
    }

    return result;
}
#endif

#if (GAME == GAME_SA2)
// Completely different to SA1, and the function was moved
bool32 Coll_Player_ItemBox(Sprite *s, CamCoord sx, CamCoord sy)
{
    bool32 result = FALSE;

    Player *p = &gPlayer;
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprPlayer = &psi->s;

    if (PLAYER_IS_ALIVE && HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1]) && (HITBOX_IS_ACTIVE(s->hitboxes[0]))) {
        if (HB_COLLISION(sx, sy, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[1].b)) {
            result = TRUE;
        }
    }

    return result;
}
#endif

#ifndef COLLECT_RINGS_ROM
#if (GAME == GAME_SA1)
EHit Coll_Player_Enemy(Sprite *s, CamCoord sx, CamCoord sy, Player *p)
#elif (GAME == GAME_SA2)
bool32 Coll_Player_Enemy(Sprite *s, CamCoord sx, CamCoord sy, s16 hbIndex, Player *p)
#endif
{
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprPlayer = &psi->s;
#if (GAME == GAME_SA1)
    const int hbIndex = 0;

    if (HITBOX_IS_ACTIVE(s->hitboxes[hbIndex]))
#endif
    {
        if (IS_ALIVE(p)) {
#if (GAME == GAME_SA2)
            if (HITBOX_IS_ACTIVE(s->hitboxes[hbIndex]))
#endif
            {
#if (GAME == GAME_SA1)
                if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1])
                    && HB_COLLISION(sx, sy, s->hitboxes[hbIndex].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[1].b)) {
                    if (p->character != CHARACTER_AMY) {
                        p->qSpeedAirX = -p->qSpeedAirX;
                        p->qSpeedAirY = -p->qSpeedAirY;
                    } else {
                        p->qSpeedAirX >>= 1;
                        p->qSpeedAirY = -p->qSpeedAirY;
                    }

                    return HIT_ENEMY;
                }
#endif
                if ((HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0]))
                    && HB_COLLISION(sx, sy, s->hitboxes[hbIndex].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0].b)) {
                    Coll_DamagePlayer(p);
#if (GAME == GAME_SA1)
                    return HIT_PLAYER;
#elif (GAME == GAME_SA2)
                    return TRUE;
#endif
                }
            }
        }
    }

    return FALSE;
}

#if (GAME == GAME_SA2)
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
#endif

#if (GAME == GAME_SA1)
// Exclusively used by Boss 1
EHit Coll_Player_Boss_1(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p)
{
    Sprite *sprPlayer;

    sprPlayer = &p->spriteInfoBody->s;

    if (s->hitboxes[0].index == -1) {
        return HIT_NONE;
    }

    if (s->hitboxes[1].index == -1) {
        return HIT_NONE;
    }

    if (!IS_ALIVE(p)) {
        return HIT_NONE;
    }

    if (sprPlayer->hitboxes[1].index != -1) {
        if (HB_COLLISION(worldX, worldY, s->hitboxes[1].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0].b)) {
            Coll_DamagePlayer(p);
            return 2;
        }

        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[1].b)) {
            if (p->character != CHARACTER_AMY) {
                p->qSpeedAirX = -p->qSpeedAirX;
                p->qSpeedAirY = -p->qSpeedAirY;
            } else {
                p->qSpeedAirX = p->qSpeedAirX >> 1;
                p->qSpeedAirY = -p->qSpeedAirY;
            }

            return HIT_ENEMY;
        }
    }

    if (sprPlayer->hitboxes[0].index != -1) {
        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0].b)) {
            Coll_DamagePlayer(p);
            return HIT_PLAYER;
        }
    }

    return HIT_NONE;
}

// Exclusively used by Bosses 2 and 6
EHit Coll_Player_Bosses_2_6(Sprite *s, s16 worldX, s16 worldY, Player *p)
{
    Sprite *sprPlayer = &p->spriteInfoBody->s;

    if (!IS_ALIVE(p)) {
        return HIT_NONE;
    }

    if ((sprPlayer->hitboxes[1].index != -1) && (s->hitboxes[0].index != -1) && (p->moveState & MOVESTATE_IN_AIR)) {
        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[1].b)) {
            if (p->character != CHARACTER_AMY) {
                p->qSpeedAirX = -p->qSpeedAirX;
                p->qSpeedAirY = -p->qSpeedAirY;
            } else {
                p->qSpeedAirX = p->qSpeedAirX >> 1;
                p->qSpeedAirY = -p->qSpeedAirY;
            }

            return HIT_ENEMY;
        }
    }

    if (sprPlayer->hitboxes[0].index != -1) {
        if (s->hitboxes[0].index != -1) {
            if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0].b)) {
                Coll_DamagePlayer(p);
                return HIT_PLAYER;
            }
        }

        if (s->hitboxes[1].index != -1) {
            if (HB_COLLISION(worldX, worldY, s->hitboxes[1].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0].b)) {
                Coll_DamagePlayer(p);
                return HIT_PLAYER;
            }
        }
    }

    return HIT_NONE;
}

// Exclusively used by SA1 Bosses 3, 5, Egg X and throwback bosses
EHit sub_800BF10(Sprite *s, CamCoord screenX, CamCoord screenY, Player *p)
{
    PlayerSpriteInfo *psiBody = p->spriteInfoBody;
    Sprite *sprBody = &psiBody->s;

    if (HITBOX_IS_ACTIVE(s->hitboxes[0]) && IS_ALIVE(p) && HITBOX_IS_ACTIVE(sprBody->hitboxes[0])) {
        if (HB_COLLISION(screenX, screenY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprBody->hitboxes[0].b)) {
            Coll_DamagePlayer(p);

            return HIT_PLAYER;
        }
    }

    return HIT_NONE;
}

// Exclusively used by SA1 Bosses 4, 5, Egg Drillster, Extra Boss and called in player.c
EHit sub_800BFEC(Sprite *s, CamCoord screenX, CamCoord screenY, Player *p)
{
    PlayerSpriteInfo *psiBody = p->spriteInfoBody;
    Sprite *sprBody = &psiBody->s;

    if (HITBOX_IS_ACTIVE(s->hitboxes[1]) && HITBOX_IS_ACTIVE(sprBody->hitboxes[0]) && IS_ALIVE(p)) {
        if (HB_COLLISION(screenX, screenY, s->hitboxes[1].b, I(p->qWorldX), I(p->qWorldY), sprBody->hitboxes[0].b)) {
            if (!IS_EXTRA_STAGE(gCurrentLevel)) {
                Coll_DamagePlayer(p);
            } else {
                Coll_DamageSuperSonic(p);
            }
            return HIT_PLAYER;
        }
    }

    return HIT_NONE;
}

// Exclusively used by SA1 Boss 5, Extra Boss and called in player.c
EHit sub_800C0E0(Sprite *s, CamCoord screenX, CamCoord screenY, Player *p)
{
    PlayerSpriteInfo *psiBody = p->spriteInfoBody;
    Sprite *sprBody = &psiBody->s;

    if (HITBOX_IS_ACTIVE(s->hitboxes[0]) && HITBOX_IS_ACTIVE(sprBody->hitboxes[1]) && IS_ALIVE(p)) {
        if (HB_COLLISION(screenX, screenY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprBody->hitboxes[1].b)) {
            if (!IS_EXTRA_STAGE(gCurrentLevel)) {
                if (p->character != CHARACTER_AMY) {
                    p->qSpeedAirX = -p->qSpeedAirX;
                    p->qSpeedAirY = -p->qSpeedAirY;
                } else {
                    p->qSpeedAirX >>= 1;
                    p->qSpeedAirY = -p->qSpeedAirY;
                }
            }

            return HIT_ENEMY;
        }
    }

    return HIT_NONE;
}

// (97.67%) https://decomp.me/scratch/e4jLp
NONMATCH("asm/non_matching/game/shared/stage/collision__sub_800C1E8.inc",
         u32 sub_800C1E8(Sprite *inSprite, Rect8 rectB, s16 sx, s16 sy, Player *p))
{
#ifndef NON_MATCHING
    register Sprite *s asm("r4") = inSprite; // NOTE: type isn't certain
#else
    Sprite *s = inSprite; // NOTE: type isn't certain
#endif
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprBody = &psi->s;

    if (IS_ALIVE(p) && (HITBOX_IS_ACTIVE(sprBody->hitboxes[0]))) {
        if (HB_COLLISION(sx, sy, rectB, I(p->qWorldX), I(p->qWorldY), sprBody->hitboxes[0].b)) {
            Coll_DamagePlayer(p);
            return HIT_PLAYER;
        }
    }

    asm("" ::"r"(s));

    return HIT_NONE;
}
END_NONMATCH

EHit sub_800C2B8(Sprite *s, s16 sx, s16 sy, Player *p)
{
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprBody = &psi->s;

    if (HITBOX_IS_ACTIVE(s->hitboxes[0]) && IS_ALIVE(p) && ((p->timerInvulnerability == 0) && (p->timerInvincibility == 0))
        && (HITBOX_IS_ACTIVE(sprBody->hitboxes[0]))) {
        if (HB_COLLISION(sx, sy, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprBody->hitboxes[0].b)) {
            return 2;
        }
    }

    return HIT_NONE;
}

// TODO: Might be in SA3, too!
u32 sub_800C394(Sprite *s, s16 sx, s16 sy, Player *p)
{
    s8 rectPlayer[4] = { -(p->spriteOffsetX + 5), -(p->spriteOffsetY + 1), +(p->spriteOffsetX + 5), +(p->spriteOffsetY + 1) };

    u32 result = COLL_NONE;
    bool32 ip = FALSE;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0]) || !IS_ALIVE(p)) {
        return FALSE;
    }

    if ((((p->moveState & MOVESTATE_JUMPING) == MOVESTATE_JUMPING) && (p->qSpeedAirY > 0)
         && HB_COLLISION(sx, sy, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*(Rect8 *)rectPlayer)))
        || (p->spriteInfoBody->s.hitboxes[1].index != HITBOX_STATE_INACTIVE
            && HB_COLLISION(sx, sy, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), p->spriteInfoBody->s.hitboxes[1].b)
            && !(p->moveState & (MOVESTATE_JUMPING)))) {
        if (p->qSpeedAirY > 0) {
            p->qSpeedAirY = -p->qSpeedAirY;
        }
        return TRUE;
    }

    return FALSE;
}
#endif

// SA2: https://decomp.me/scratch/verla
bool32 Coll_DamagePlayer(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return FALSE;
    }

    p->timerInvulnerability = PLAYER_INVULNERABLE_DURATION;

#if (GAME == GAME_SA1)
    if ((p->qSpeedAirX < 0) || (p->qSpeedAirX == 0 && (p->moveState & MOVESTATE_FACING_LEFT))) {
        p->qSpeedAirX = +Q(1.5);
    } else {
        p->qSpeedAirX = -Q(1.5);
    }

    p->qSpeedAirY = -Q(3.0);

    if (p->moveState & MOVESTATE_IN_WATER) {
        HALVE(p->qSpeedAirY);
        HALVE(p->qSpeedAirX);
    }

    p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_SPIN_ATTACK;
    p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~MOVESTATE_SPINDASH;
    p->moveState &= ~MOVESTATE_100;

    p->charState = 15;
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    {
#if !NON_MATCHING && (GAME == GAME_SA1)
        u8 *ptr = &p->SA2_LABEL(unk61);
        u32 zero = 0;
        asm("strb %0, [%1]" ::"r"(zero), "r"(ptr));
        asm("add %0, #1" : "=r"(ptr));
        asm("strb %0, [%1]" ::"r"(zero), "r"(ptr));
#else
        p->SA2_LABEL(unk61) = 0;
        p->SA2_LABEL(unk62) = 0;
#endif
    }
#endif

    if (p->moveState & MOVESTATE_1000000) {
#if (GAME == GAME_SA1)
        p->layer ^= PLAYER_LAYER__MASK;
        if (SA2_LABEL(sub_8022F58)(p->rotation + Q(0.5), p) < 4) {
            p->layer ^= PLAYER_LAYER__MASK;
        } else
#endif
        {
#if (GAME == GAME_SA2)
            p->layer = PLAYER_LAYER__BACK;
#endif
            p->moveState &= ~MOVESTATE_1000000;
            p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

            p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
        }
    }

#if (GAME == GAME_SA2)
    if (!(p->moveState & MOVESTATE_1000000)) {
        p->transition = PLTRANS_HURT;
    }
#endif

    p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

#if (GAME == GAME_SA1)
    if (p->playerID == 0)
#endif
    {
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
#if (GAME == GAME_SA1)
                if (gGameMode == 4) {
                    return TRUE;
                }

                if (gGameMode == 5) {
                    return TRUE;
                }
#endif
                p->moveState |= MOVESTATE_DEAD;
            }
        }
#ifndef COLLECT_RINGS_ROM
        else {
            m4aSongNumStart(SE_LIFE_LOST);
            p->itemEffect &= ~(PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC | PLAYER_ITEM_EFFECT__SHIELD_NORMAL);
        }
#endif
    }

    return TRUE;
}

#if (GAME == GAME_SA1)
// Equivalent to Coll_DamagePlayer.
// Super Sonic isn't "damaged" per se, just thrown back a bit.
bool32 Coll_DamageSuperSonic(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return HIT_NONE;
    }

    p->timerInvulnerability = 30;
    p->qSpeedAirX = -Q(3);
    p->qSpeedGround = -Q(3);
    p->qSpeedAirY = -Q(0);
    p->sa2__unk2A = 24;
    p->charState = 4;
    p->SA2_LABEL(unk61) = 0;
    p->SA2_LABEL(unk62) = 0;

    m4aSongNumStart(SE_LIFE_LOST);

    return TRUE;
}
#endif // (GAME == GAME_SA1)
