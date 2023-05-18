#include "global.h"
#include "game/game.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "malloc_vram.h"

#include "constants/animations.h"
#include "constants/interactables.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s16 unk48;
    /* 0x4A */ s16 unk4A;
    /* 0x4C */ s16 unk4C;
    /* 0x4E */ u8 filler4E[2];
    /* 0x50 */ s32 unk50[3][2];
} Sprite_IA081; /* size: 0x68 */

extern void Task_800F38C(void);
extern void TaskDestructor_800F964(struct Task *);
extern void sub_800F978(void);
extern void sub_800F990(Sprite_IA081*);

const u16 gUnknown_080D5430[9][3] = {
    { 36, SA2_ANIM_SQ_PLATFORM_613, 0 },         { 36, SA2_ANIM_SQ_PLATFORM_613, 0 },
    { 36, SA2_ANIM_PLATFORM_SQUARE_MUS_PLA, 1 }, { 36, SA2_ANIM_PLATFORM_ICE_PAR, 2 },
    { 36, SA2_ANIM_PLATFORM_SQUARE_SKY_CAN, 0 }, { 36, SA2_ANIM_PLATFORM_TEC_BAS, 2 },
    { 36, SA2_ANIM_SQ_PLATFORM_613, 0 },         { 36, SA2_ANIM_SQ_PLATFORM_613, 0 },
    { 36, SA2_ANIM_SQ_PLATFORM_613, 0 },
};

void initSprite_Interactable081(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_800F38C, sizeof(Sprite_IA081), 0x2010, 0,
                                TaskDestructor_800F964);
    Sprite_IA081 *ia081 = TaskGetStructPtr(t);
    Sprite *s = &ia081->s;

    ia081->base.regionX = spriteRegionX;
    ia081->base.regionY = spriteRegionY;
    ia081->base.me = me;
    ia081->base.spriteX = me->x;
    ia081->base.spriteY = spriteY;
    ia081->unk40 = 0;
    ia081->unk44 = 0;
    ia081->unk4C = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            ia081->unk48 = 0x4;
            ia081->unk3C = 0;
            ia081->unk4A = 0;
        } else {
            ia081->unk48 = 0x4;
            ia081->unk3C = 0x80;
            ia081->unk4A = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            ia081->unk48 = 0;
            ia081->unk4A = 0x4;
            ia081->unk3C = 0;
        } else {
            ia081->unk48 = 0;
            ia081->unk4A = 0x4;
            ia081->unk3C = 0x80;
        }
    }

    {
        s32 i;
        s32 tileCount, anim, variant;

        for (i = 0; i < ARRAY_COUNT(ia081->unk50); i++) {
            ia081->unk50[i][0] = ia081->unk40;
            ia081->unk50[i][1] = ia081->unk44;
        }

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        tileCount = gUnknown_080D5430[LEVEL_TO_ZONE(gCurrentLevel)][0];
        s->graphics.dest = VramMalloc(tileCount);

        anim = gUnknown_080D5430[LEVEL_TO_ZONE(gCurrentLevel)][1];
        s->graphics.anim = anim;

        variant = gUnknown_080D5430[LEVEL_TO_ZONE(gCurrentLevel)][2];
        s->variant = variant;

        s->unk1A = 0x480;
        s->graphics.size = 0;
        s->unk14 = 0;
        s->unk1C = 0;
        s->unk21 = 0xFF;
        s->unk22 = 0x10;
        s->focused = 0;
        s->unk28->unk0 = -1;
        s->unk10 = SPRITE_FLAG_PRIORITY(2);
        sub_8004558(s);
    }
}

// https://decomp.me/scratch/C1std
void Task_800F38C(void)
{
    Player *p = &gPlayer;

    // Maybe platform pos delta?
    s32 sp08 = 0, sp0C = 0;

    Sprite_IA081 *ia081 = TaskGetStructPtr(gCurTask);
    Sprite *s = &ia081->s;
    MapEntity *me = ia081->base.me;

    s16 posX;
    s16 posY;

    if(IS_MULTI_PLAYER) {
        sub_800F990(ia081);
    }

    if(ia081->unk48 != 0) {
        s32 oldUnk40 = ia081->unk40;
        s32 meUdata2 = (me->d.uData[2] << 11);
        
        ia081->unk40 = (SIN((((gUnknown_03005590 + ia081->unk3C) & 0xFF) * ia081->unk48) & ONE_CYCLE) * meUdata2) >> 14;
        sp08 = ia081->unk40 - oldUnk40;
    }
    // _0800F40E

    
    if(ia081->unk4A != 0) {
        s32 oldUnk44 = ia081->unk44;
        s32 meUdata3 = (me->d.uData[3] << 11);
        ia081->unk44 = (SIN((((gUnknown_03005590 + ia081->unk3C) & 0xFF) * ia081->unk4A) & ONE_CYCLE) * meUdata3);
        sp0C = ia081->unk44 - oldUnk44;
    }
    // _0800F450

    posX = TO_WORLD_POS(ia081->base.spriteX, ia081->base.regionX);
    posY = TO_WORLD_POS(me->y, ia081->base.regionY);

    if(IS_SINGLE_PLAYER) {
        s->x = posX - gCamera.x + Q_24_8_TO_INT(ia081->unk50[1][0]);
        s->y = posY - gCamera.y + Q_24_8_TO_INT(ia081->unk50[1][1]);
    } else {
        // _0800F4CC
        s->x = posX - gCamera.x + Q_24_8_TO_INT(ia081->unk40);
        s->y = posY - gCamera.y + Q_24_8_TO_INT(ia081->unk44);
    }

    if((p->moveState & MOVESTATE_8) && (p->unk3C == s)) {
        s32 res, temp, temp2;
        // _0800F50A
        p->x += sp08;

        if(!GRAVITY_IS_INVERTED) {
            p->y += sp0C + Q_24_8(1.0);
        } else {
            // _0800F534
            p->y += sp0C - Q_24_8(2.0);
        }

        res = sub_801F100(Q_24_8_TO_INT(gPlayer.y) + gPlayer.unk17,
                          Q_24_8_TO_INT(gPlayer.x) + gPlayer.unk16,
                          gPlayer.unk38,
                          +8,
                          sub_801EC3C);
        if(res < 0) {
            gPlayer.y += Q_24_8(res);

            p->moveState &= ~MOVESTATE_8;
            p->moveState |= MOVESTATE_IN_AIR;
            p->unk3C = 0;
        }
        // _0800F584

        temp = Q_24_8_TO_INT(p->x) + 2;
        res = sub_801F100(temp + p->unk16,
                          Q_24_8_TO_INT(p->y),
                          p->unk38,
                          +8,
                          sub_801EB44);

        if(res < 0) {
            p->x += Q_24_8(res);
        }
        // _0800F5B0

        temp2 = Q_24_8_TO_INT(p->x) - 2;
        res = sub_801F100(temp2 - p->unk16,
                          Q_24_8_TO_INT(p->y),
                          p->unk38,
                          -8,
                          sub_801EB44);

        if(res < 0) {
            p->x -= Q_24_8(res);
        }
        // _0800F5D8

        res = sub_801F100(Q_24_8_TO_INT(p->y) + p->unk17,
                          Q_24_8_TO_INT(p->x) - p->unk16,
                          p->unk38,
                          +8,
                          sub_801EC3C);

        if(res < 0) {
            p->y += Q_24_8(res);
            
            p->moveState &= ~MOVESTATE_8;
            p->moveState |= MOVESTATE_IN_AIR;
            p->unk3C = 0;
        }
    }
    // _0800F614

    if(!(p->moveState & MOVESTATE_400000)) {
        s32 x, y;
        s32 result;
        s32 res;
        s32 movStateCopy = p->moveState;
        s32 resShifted;

        s->unk28->unk5 -= 3;
        x = ((Q_24_8_TO_INT(posX) >> 8) + Q_24_8_TO_INT(ia081->unk40));
        y = ((Q_24_8_TO_INT(posY) >> 8) + Q_24_8_TO_INT(ia081->unk44));
        result = sub_800CCB8(s, x, y, p);

        if(result & 0x30000) {
            // _0800F660
            if(gPlayer.character == CHARACTER_KNUCKLES) {
                s16 aVal = gPlayer.unk64;
                if(aVal > 99) {
                    if(aVal <= 105) {
                        gPlayer.unk6D = 4;
                    }
                }
            }
            // _0800F688

            resShifted = (result << 24);
            p->y += resShifted >> 16;

            if(result & 0x20000) {
                if(p->speedAirY <= 0)
                    p->speedAirY = 0;

                if(GRAVITY_IS_INVERTED) {
                    p->moveState |= MOVESTATE_8;
                    p->moveState &= ~MOVESTATE_IN_AIR;
                    p->unk3C = s;
                    p->speedAirY = 0;
                }

                res = sub_801F100(Q_24_8_TO_INT(p->y) + p->unk17,
                                  Q_24_8_TO_INT(p->x),
                                  p->unk38,
                                  8,
                                  sub_801EC3C);

                if((res < 0) && (sp0C > 0)) {
                    sub_800F978();
                }
            }
            // _0800F6F8
            
            if(result & 0x10000) {
                s32 otherRes;
                // _0800F706
                if(GRAVITY_IS_INVERTED) {
                    // _0800F718
                    p->y -= resShifted >> 16;
                    s->unk28->unk4 += 16;
                    s->unk28->unk6 -= 16;

                    otherRes = sub_800CCB8(s,
                        (Q_24_8_TO_INT(posX) >> 8) + Q_24_8(ia081->unk40),
                        (Q_24_8_TO_INT(posY) >> 8) + Q_24_8(ia081->unk44),
                        p);

                    s->unk28->unk4 -= 16;
                    s->unk28->unk6 += 16;

                    p->y += resShifted;
                    p->moveState = movStateCopy;

                    if(otherRes & 0xC0000) {
                        s32 tempXX = otherRes & 0xFF00;
                        s16 value = tempXX;
                        if(value < 0) {
                            p->x += -Q_24_8(16.0) + value;
                        }

                        if(value > 0) {
                            p->x += +Q_24_8(16.0) + value;
                        }

                        p->speedAirX = 0;
                        p->speedGroundX = 0;
                    }
                    // _0800F7AA

                    if(otherRes & 0x10000) {
                        s32 newRes = sub_801F100(Q_24_8_TO_INT(p->y) - p->unk17,
                                                 Q_24_8_TO_INT(p->x),
                                                 p->unk38,
                                                 -8,
                                                 sub_801EC3C);

                        if(newRes < 0) {
                            if(sp0C < 0) {
                                sub_800F978();
                            } else {
                                // _0800F7FC
                                p->y -= (result << 24) >> 16;
                                p->speedGroundX = 0;
                            }
                        } else {
                            // _0800F80C
                            p->y -= (result << 24) >> 16;
                            p->speedGroundX = 0;
                            p->speedAirX = 0;
                            p->speedAirY = 0;
                        }
                    } else {
                        // _0800F820
                        p->y -= (result << 24) >> 16;
                    }
                } else {
                    // _0800F82C
                    s32 newRes;
                    p->speedAirY = 0;
                    newRes = sub_801F100(Q_24_8_TO_INT(p->y) - p->unk17,
                                         Q_24_8_TO_INT(p->x),
                                         p->unk38,
                                         -8,
                                         sub_801EC3C);

                    if((newRes < 0) && (sp0C < 0)) {
                        sub_800F978();
                    }
                }
            }
        }
        // _0800F85C

        if((result & 0xC0000) && (p->moveState & MOVESTATE_8) && (p->unk3C == s)) {
            s32 tempXX = result & 0xFF00;
            s16 tempX = tempXX;
            p->x += tempX;
            p->speedAirX = 0;
            p->speedGroundX = 0;

            if(result & 0x40000) {
                s32 tempXVal = Q_24_8_TO_INT(p->x) + 2;
                if(sub_801F100(tempXVal + p->unk16,
                               Q_24_8_TO_INT(p->y),
                               p->unk38,
                               -8,
                               sub_801EB44) < 0) {
                    sub_800F978();
                }
            }
            // _0800F8C2
            
            if(result & 0x80000) {
                s32 tempXVal = Q_24_8_TO_INT(p->x) - 2;
                if(sub_801F100(tempXVal - p->unk16,
                               Q_24_8_TO_INT(p->y),
                               p->unk38,
                               +8,
                               sub_801EB44) < 0) {
                    sub_800F978();
                }
            }
        }
        // _0800F8F6
        s->unk28->unk5 += 3;
    }
    // _0800F8FE
    {
        if(IS_OUT_OF_CAM_RANGE_TYPED(u32, posX - gCamera.x, posY - gCamera.y)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, ia081->base.spriteX);
            TaskDestroy(gCurTask);
        } else {
            sub_80051E8(s);
        }
    }
}

void TaskDestructor_800F964(struct Task *t)
{
    Sprite_IA081 *ia081 = TaskGetStructPtr(t);
    VramFree(ia081->s.graphics.dest);
}

void sub_800F978(void)
{
    gPlayer.speedGroundX = 0;
    gPlayer.speedAirX = 0;
    gPlayer.moveState |= MOVESTATE_DEAD;
}

void sub_800F990(Sprite_IA081* ia081)
{
    ia081->unk50[2][0] = ia081->unk50[1][0];
    ia081->unk50[2][1] = ia081->unk50[1][1];
    ia081->unk50[1][0] = ia081->unk50[0][0];
    ia081->unk50[1][1] = ia081->unk50[0][1];
    ia081->unk50[0][0] = ia081->unk40;
    ia081->unk50[0][1] = ia081->unk44;
}

// Seems to be unused
u32 sub_800F9AC(Sprite* s, s32 x, s32 y, Player *p)
{
    u32 result;

    s->unk28->unk5++;
    s->unk28->unk7--;

    result = sub_800CCB8(s, x, y, p);

    s->unk28->unk5--;
    s->unk28->unk7++;

    return result;
}