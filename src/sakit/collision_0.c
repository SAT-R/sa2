#include "global.h"
#include "rect.h"
#include "sprite.h"
#include "sakit/globals.h"
#include "sakit/collision.h"
#include "sakit/dust_cloud.h"
#include "sakit/entities_manager.h"
#include "sakit/player.h"
#include "game/cheese.h"
#include "game/entity.h"
#include "game/multiplayer/unknown_1.h"
#include "game/trapped_animals.h"

#define COLL_NONE       0
#define COLL_FLAG_8     0x00000008
#define COLL_FLAG_80000 0x00080000

u32 CheckRectCollision_SpritePlayer(Sprite *s, s32 sx, s32 sy, Player *p,
                                    struct Rect8 *rectPlayer)
{
    u32 result = 0;

    if ((s->hitboxes[0].index == HITBOX_INACTIVE) || !IS_ALIVE(p)) {
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

    if ((s->hitboxes[0].index == HITBOX_INACTIVE) || !IS_ALIVE(p)) {
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

    if (s->hitboxes[hbIndex].index == HITBOX_INACTIVE) {
        return FALSE;
    }

    if (psi->s.hitboxes[hbIndexPlayer].index == HITBOX_INACTIVE) {
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

    if (s->hitboxes[hbIndex].index == HITBOX_INACTIVE) {
        return FALSE;
    }

    if (sprPlayer->hitboxes[1].index == HITBOX_INACTIVE) {
        return FALSE;
    }

    if ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex], Q_24_8_TO_INT(p->x),
                      Q_24_8_TO_INT(p->y), sprPlayer->hitboxes[1]))) {
        sub_800CB18(p);
        return TRUE;
    }

    return FALSE;
}

bool32 IsColliding_Cheese(Sprite *sprTarget, s32 sx, s32 sy, s16 hbIndex, Player *p)
{
    if (!IS_ALIVE(p)) {
        return FALSE;
    }

    if (sprTarget->hitboxes[hbIndex].index == HITBOX_INACTIVE) {
        return FALSE;
    }

    if (gCheese) {
        Cheese *cheese = gCheese;

        if (cheese->s.hitboxes[1].index == HITBOX_INACTIVE) {
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

#if 001
// (70.55%) https://decomp.me/scratch/qE8dy
bool32 sub_800C4FC(Sprite *s, s32 sx, s32 sy, u8 hbIndex)
{
    PlayerSpriteInfo *psi = gPlayer.unk90;
    Sprite *sprPlayer = &psi->s;
    EnemyBase *eb;
    u32 movestate;
    
    if(s->hitboxes[hbIndex].index == HITBOX_INACTIVE) {
        return FALSE;
    }

    eb = TASK_DATA(gCurTask);

    movestate = gPlayer.moveState;
    if(PLAYER_IS_ALIVE) {

        if(IS_MULTI_PLAYER && ((s8)eb->base.me->x == (s8)MAP_ENTITY_STATE_MINUS_THREE)) {
            // _0800C550 + 0x1C
            CreateDustCloud(sx, sy);
            CreateTrappedAnimal(sx, sy);

            return TRUE;
        }
        if(movestate & MOVESTATE_IN_SCRIPTED) {
            return FALSE;            
        }
        // _0800C5A4

        if(sprPlayer->hitboxes[1].index != HITBOX_INACTIVE) {
            // _0800C5A4 + 0xC

            if(HB_COLLISION(sx, sy, s->hitboxes[hbIndex], Q_24_8_TO_INT(gPlayer.x), Q_24_8_TO_INT(gPlayer.y), sprPlayer->hitboxes[1])) {
                // _0800C648
                if(IS_MULTI_PLAYER) {
                    struct UNK_3005510 *v = sub_8019224();
                    v->unk0 = 3;
                    v->unk1 = eb->base.regionX;
                    v->unk2 = eb->base.regionY;
                    v->unk3 = eb->base.spriteY;
                }

                sub_800CB18(&gPlayer);
            
                // goto sub_800C4FC_CreateAnimal
                CreateDustCloud(sx, sy);
                CreateTrappedAnimal(sx, sy);
                CreateEnemyDefeatScoreAndManageLives(sx, sy);

                return TRUE;
            }
        }
        _0800C674:
        
        if(sprPlayer->hitboxes[0].index != HITBOX_INACTIVE) {
            if(HB_COLLISION(sx, sy, s->hitboxes[hbIndex], Q_24_8_TO_INT(gPlayer.x), Q_24_8_TO_INT(gPlayer.y), sprPlayer->hitboxes[0])) {
                sub_800CBA4(&gPlayer);
                if(gCheese && IS_MULTI_PLAYER) {
                    struct UNK_3005510 *v = sub_8019224();
                    v->unk0 = 3;
                    v->unk1 = eb->base.regionX;
                    v->unk2 = eb->base.regionY;
                    v->unk3 = eb->base.spriteY;
                }

                // goto sub_800C4FC_CreateAnimal
                CreateDustCloud(sx, sy);
                CreateTrappedAnimal(sx, sy);
                CreateEnemyDefeatScoreAndManageLives(sx, sy);

                return TRUE;
            }
        }
        
    }

    return FALSE;
}
#endif