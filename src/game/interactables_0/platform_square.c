#include "global.h"

#include "core.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "malloc_vram.h"

#include "game/game.h"
#include "game/entity.h"
#include "game/interactables_0/platform_square.h"

#include "constants/animations.h"
#include "constants/interactables.h"
#include "constants/player_transitions.h"
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
    /* 0x50 */ s32 unk50[3][2];
} Sprite_PlatformSquare; /* size: 0x68 */

static void Task_Platform_Square(void);
static void TaskDestructor_Platform_Square(struct Task *);
static void Platform_Square_KillPlayer(void);
static void sub_800F990(Sprite_PlatformSquare *);

static const u16 sAnimsPlatformSquare[9][3] = {
    { 36, SA2_ANIM_PLATFORM_SQUARE_COMMON, 0 },
    { 36, SA2_ANIM_PLATFORM_SQUARE_COMMON, 0 },
    { 36, SA2_ANIM_PLATFORM_SQUARE_MUS_PLA, 1 },
    { 36, SA2_ANIM_PLATFORM_ICE_PAR, 2 },
    { 36, SA2_ANIM_PLATFORM_SQUARE_SKY_CAN, 0 },
    { 36, SA2_ANIM_PLATFORM_TEC_BAS, 2 },
    { 36, SA2_ANIM_PLATFORM_SQUARE_COMMON, 0 },
    { 36, SA2_ANIM_PLATFORM_SQUARE_COMMON, 0 },
    { 36, SA2_ANIM_PLATFORM_SQUARE_COMMON, 0 },
};

void CreateEntity_Platform_Square(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Platform_Square, sizeof(Sprite_PlatformSquare),
                                0x2010, 0, TaskDestructor_Platform_Square);
    Sprite_PlatformSquare *platform = TaskGetStructPtr(t);
    Sprite *s = &platform->s;

    platform->base.regionX = spriteRegionX;
    platform->base.regionY = spriteRegionY;
    platform->base.me = me;
    platform->base.spriteX = me->x;
    platform->base.spriteY = spriteY;
    platform->unk40 = 0;
    platform->unk44 = 0;
    platform->unk4C = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            platform->unk48 = 0x4;
            platform->unk3C = 0;
            platform->unk4A = 0;
        } else {
            platform->unk48 = 0x4;
            platform->unk3C = 0x80;
            platform->unk4A = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            platform->unk48 = 0;
            platform->unk4A = 0x4;
            platform->unk3C = 0;
        } else {
            platform->unk48 = 0;
            platform->unk4A = 0x4;
            platform->unk3C = 0x80;
        }
    }

    {
        s32 i;
        s32 tileCount, anim, variant;

        for (i = 0; i < ARRAY_COUNT(platform->unk50); i++) {
            platform->unk50[i][0] = platform->unk40;
            platform->unk50[i][1] = platform->unk44;
        }

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        tileCount = sAnimsPlatformSquare[LEVEL_TO_ZONE(gCurrentLevel)][0];
        s->graphics.dest = VramMalloc(tileCount);

        anim = sAnimsPlatformSquare[LEVEL_TO_ZONE(gCurrentLevel)][1];
        s->graphics.anim = anim;

        variant = sAnimsPlatformSquare[LEVEL_TO_ZONE(gCurrentLevel)][2];
        s->variant = variant;

        s->unk1A = 0x480;
        s->graphics.size = 0;
        s->animCursor = 0;
        s->unk1C = 0;
        s->prevVariant = -1;
        s->unk22 = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);
        sub_8004558(s);
    }
}

static void Task_Platform_Square(void)
{
    Player *p = &gPlayer;
    s16 posX;
    s16 posY;
    MapEntity *me;
    u32 result;
    s32 deltaX = 0, deltaY = 0;

    Sprite_PlatformSquare *platform = TaskGetStructPtr(gCurTask);
    Sprite *s = &platform->s;
    me = platform->base.me;

    if (IS_MULTI_PLAYER) {
        sub_800F990(platform);
    }

    if (platform->unk48 != 0) {
        s32 oldUnk40 = platform->unk40;
        s32 meUdata2 = (me->d.uData[2] << 11);

        platform->unk40
            = (SIN((platform->unk48 * ((gUnknown_03005590 + platform->unk3C) & 0xFF))
                   & ONE_CYCLE)
               * meUdata2)
            >> 14;
        deltaX = platform->unk40 - oldUnk40;
    }

    if (platform->unk4A != 0) {
#ifdef NON_MATCHING
        s32 r5 = platform->unk44;
#else
        register s32 r5 asm("r5") = platform->unk44;
#endif
        s32 meUdata3 = (me->d.uData[3] << 11);
        platform->unk44
            = (SIN(((platform->unk4A * ((gUnknown_03005590 + platform->unk3C) & 0xFF)))
                   & ONE_CYCLE)
               * meUdata3)
            >> 14;
        r5 = platform->unk44 - r5;
#ifndef NON_MATCHING
        asm("" ::"r"(r5));
#endif
        deltaY = r5;
    }

    posX = TO_WORLD_POS(platform->base.spriteX, platform->base.regionX);
    posY = TO_WORLD_POS(me->y, platform->base.regionY);

    if (IS_MULTI_PLAYER) {
        s->x = posX - gCamera.x + Q_24_8_TO_INT(platform->unk50[1][0]);
        s->y = posY - gCamera.y + Q_24_8_TO_INT(platform->unk50[1][1]);
    } else {
        s->x = posX - gCamera.x + Q_24_8_TO_INT(platform->unk40);
        s->y = posY - gCamera.y + Q_24_8_TO_INT(platform->unk44);
    }

    if ((p->moveState & MOVESTATE_8) && (p->unk3C == s)) {
        s32 res, temp, temp2;
        p->x += deltaX;

        if (!GRAVITY_IS_INVERTED) {
            p->y += deltaY + Q_24_8(1.0);
        } else {
            p->y += deltaY - Q_24_8(2.0);
        }

        res = sub_801F100(Q_24_8_TO_INT(gPlayer.y) + gPlayer.unk17,
                          Q_24_8_TO_INT(gPlayer.x) + gPlayer.unk16, gPlayer.unk38, +8,
                          sub_801EC3C);
        if (res < 0) {
            gPlayer.y += Q_24_8(res);

            p->moveState &= ~MOVESTATE_8;
            p->moveState |= MOVESTATE_IN_AIR;
            p->unk3C = NULL;
        }

        temp = Q_24_8_TO_INT(p->x) + 2;
        res = sub_801F100(temp + p->unk16, Q_24_8_TO_INT(p->y), p->unk38, +8,
                          sub_801EB44);

        if (res < 0) {
            p->x += Q_24_8(res);
        }

        temp2 = Q_24_8_TO_INT(p->x) - 2;
        res = sub_801F100(temp2 - p->unk16, Q_24_8_TO_INT(p->y), p->unk38, -8,
                          sub_801EB44);

        if (res < 0) {
            p->x -= Q_24_8(res);
        }

        res = sub_801F100(Q_24_8_TO_INT(p->y) + p->unk17, Q_24_8_TO_INT(p->x) - p->unk16,
                          p->unk38, +8, sub_801EC3C);

        if (res < 0) {
            p->y += Q_24_8(res);

            p->moveState &= ~MOVESTATE_8;
            p->moveState |= MOVESTATE_IN_AIR;
            p->unk3C = NULL;
        }
    }

    if (!(p->moveState & MOVESTATE_400000)) {
        s32 x, y;
        s32 res;
        u32 otherRes;
        s32 movStateCopy = p->moveState;

        s->hitboxes[0].top -= 3;
        x = (posX + Q_24_8_TO_INT(platform->unk40));
        y = (posY + Q_24_8_TO_INT(platform->unk44));
        result = sub_800CCB8(s, x, y, p);

        if (result & 0x30000) {
            if (gPlayer.character == CHARACTER_KNUCKLES && gPlayer.unk64 > 99
                && gPlayer.unk64 <= 105) {
                p->transition = PLTRANS_PT4;
            }

            p->y += Q_8_8(result);

            if (result & 0x20000) {
                if (p->speedAirY <= 0)
                    p->speedAirY = 0;

                if (GRAVITY_IS_INVERTED) {
                    p->moveState |= MOVESTATE_8;
                    p->moveState &= ~MOVESTATE_IN_AIR;
                    p->unk3C = s;
                    p->speedAirY = 0;
                }

                res = sub_801F100(Q_24_8_TO_INT(p->y) + p->unk17, Q_24_8_TO_INT(p->x),
                                  p->unk38, 8, sub_801EC3C);

                if ((res < 0) && (deltaY > 0)) {
                    Platform_Square_KillPlayer();
                }
            }

            if (result & 0x10000) {
                if (GRAVITY_IS_INVERTED) {
                    p->y -= Q_8_8(result);
                    s->hitboxes[0].left += 16;
                    s->hitboxes[0].right -= 16;

                    otherRes = sub_800CCB8(s, posX + Q_24_8_TO_INT(platform->unk40),
                                           posY + Q_24_8_TO_INT(platform->unk44), p);

                    s->hitboxes[0].left -= 16;
                    s->hitboxes[0].right += 16;

                    p->y += Q_8_8(result);
                    p->moveState = movStateCopy;

                    if (otherRes & 0xC0000) {
                        s32 tempXX = (s16)(otherRes & 0xFF00);
                        s16 value = tempXX;
                        if (value < 0) {
                            p->x += -Q_24_8(16.0) + value;
                        }

                        if (value > 0) {
                            p->x += +Q_24_8(16.0) + value;
                        }

                        p->speedAirX = 0;
                        p->speedGroundX = 0;
                    }

                    if (otherRes & 0x10000) {
                        s32 newRes = sub_801F100(Q_24_8_TO_INT(p->y) - p->unk17,
                                                 Q_24_8_TO_INT(p->x), p->unk38, -8,
                                                 sub_801EC3C);

                        if (newRes < 0) {
                            if (deltaY < 0) {
                                Platform_Square_KillPlayer();
                            } else {
                                p->y -= Q_8_8(result);
                                p->speedGroundX = 0;
                            }
                        } else {
                            p->y -= Q_8_8(result);
                            p->speedGroundX = 0;
                            p->speedAirX = 0;
                            p->speedAirY = 0;
                        }
                    } else {
                        p->y -= Q_8_8(result);
                    }
                } else {
                    s32 newRes;
                    p->speedAirY = 0;
                    newRes = sub_801F100(Q_24_8_TO_INT(p->y) - p->unk17,
                                         Q_24_8_TO_INT(p->x), p->unk38, -8, sub_801EC3C);

                    if ((newRes < 0) && (deltaY < 0)) {
                        Platform_Square_KillPlayer();
                    }
                }
            }
        }

        if ((result & 0xC0000) && !(p->moveState & MOVESTATE_8) && !(p->unk3C == s)) {
            s32 tempXX = (s16)(result & 0xFF00);
            s16 tempX = tempXX;
            p->x += tempX;
            p->speedAirX = 0;
            p->speedGroundX = 0;

            if (result & 0x40000) {
                s32 tempXVal = Q_24_8_TO_INT(p->x) + 2;
                if (sub_801F100(tempXVal + p->unk16, Q_24_8_TO_INT(p->y), p->unk38, -8,
                                sub_801EB44)
                    < 0) {
                    Platform_Square_KillPlayer();
                }
            }

            if (result & 0x80000) {
                s32 tempXVal = Q_24_8_TO_INT(p->x) - 2;
                if (sub_801F100(tempXVal - p->unk16, Q_24_8_TO_INT(p->y), p->unk38, +8,
                                sub_801EB44)
                    < 0) {
                    Platform_Square_KillPlayer();
                }
            }
        }

        s->hitboxes[0].top += 3;
    }

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, posX - gCamera.x, posY - gCamera.y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.spriteX);
        TaskDestroy(gCurTask);
    } else {
        sub_80051E8(s);
    }
}

static void TaskDestructor_Platform_Square(struct Task *t)
{
    Sprite_PlatformSquare *platform = TaskGetStructPtr(t);
    VramFree(platform->s.graphics.dest);
}

static void Platform_Square_KillPlayer(void)
{
    gPlayer.speedGroundX = 0;
    gPlayer.speedAirX = 0;
    gPlayer.moveState |= MOVESTATE_DEAD;
}

static void sub_800F990(Sprite_PlatformSquare *platform)
{
    platform->unk50[2][0] = platform->unk50[1][0];
    platform->unk50[2][1] = platform->unk50[1][1];
    platform->unk50[1][0] = platform->unk50[0][0];
    platform->unk50[1][1] = platform->unk50[0][1];
    platform->unk50[0][0] = platform->unk40;
    platform->unk50[0][1] = platform->unk44;
}

// Seems to be unused
static u32 sub_800F9AC(Sprite *s, s32 x, s32 y, Player *p)
{
    u32 result;

    s->hitboxes[0].top++;
    s->hitboxes[0].bottom--;

    result = sub_800CCB8(s, x, y, p);

    s->hitboxes[0].top--;
    s->hitboxes[0].bottom++;

    return result;
}