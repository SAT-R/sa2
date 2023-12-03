#include "core.h"
#include "malloc_vram.h"
#include "trig.h"

#include "sakit/globals.h"
#include "game/cheese.h"
#include "game/stage/camera.h"

#include "lib/m4a.h"

#include "constants/zones.h"
#include "constants/characters.h"
#include "constants/songs.h"

Cheese *gCheese = NULL;

void sub_801420C(void);
void sub_8015360(struct Task *);

extern const u16 gUnknown_080D5548[][2];

void CreateCheese(Player *player)
{

    Cheese *cheese;
    Sprite *s;
    if (IS_SINGLE_PLAYER) {
        struct Task *t;
        if (IS_EXTRA_STAGE(gCurrentLevel)) {
            gCheese = NULL;
            return;
        }

        if (player->character != CHARACTER_CREAM) {
            return;
        }

        t = TaskCreate(sub_801420C, 0x70, 0x5010, 0, sub_8015360);
        cheese = TASK_DATA(t);
        s = &cheese->s;
        gCheese = cheese;
        cheese->posX = gPlayer.x;
        cheese->posY = gPlayer.y;
    } else {
        struct MultiplayerPlayer *mpp = NULL;
        u8 i;
        u32 j;
        cheese = NULL;
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (gMultiplayerPlayerTasks[i] == NULL) {
                break;
            }
        }

        for (j = 0; j < i; j++) {
            if (gMultiplayerCharacters[j] == CHARACTER_CREAM) {
                struct Task *t;
                mpp = TASK_DATA(gMultiplayerPlayerTasks[j]);
                t = TaskCreate(sub_801420C, 0x70, 0x5010, 0, sub_8015360);
                cheese = TASK_DATA(t);
                cheese->unk6C = mpp;
                break;
            }
        }

        if (mpp == NULL) {
            return;
        }

        s = &cheese->s;
        gCheese = cheese;
        cheese->posX = 0;
        cheese->posY = 0;
    }

    cheese->unk8 = 2;
    cheese->unk9 = 2;
    cheese->unkC = 2;
    cheese->unkE = 0;
    cheese->unk10 = 0;
    s->graphics.dest = VramMalloc(9);
    s->graphics.anim = gUnknown_080D5548[cheese->unk10][0];
    s->variant = gUnknown_080D5548[cheese->unk10][1];
    s->graphics.size = 0;
    s->prevVariant = -1;
    s->unk1A = SPRITE_OAM_ORDER(17);
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);
    s->timeUntilNextFrame = 0;

    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->hitboxes[0].index = -1;
    s->hitboxes[1].index = -1;
}

void sub_801412C(Cheese *cheese)
{
    Sprite *s = &cheese->s;
    Cheese_UNK54 *unk54 = &cheese->unk54;
    u32 temp;
    if (cheese->unk10 != 18
        && cheese->unk14
            != gUnknown_080D5548[cheese->unk10][0]
                + gUnknown_080D5548[cheese->unk10][1]) {
        s->graphics.anim = gUnknown_080D5548[cheese->unk10][0];
        s->variant = gUnknown_080D5548[cheese->unk10][1];
        cheese->unk14 = s->graphics.anim + s->variant;
        s->prevVariant = -1;
        s->hitboxes[0].index = -1;
        s->hitboxes[1].index = -1;
    }

    s->x = Q_24_8_TO_INT(cheese->posX) - gCamera.x;
    s->y = Q_24_8_TO_INT(cheese->posY) - gCamera.y;

    temp = 0x400;
    if (cheese->unkC & 1) {
        temp = 0;
    }

    if ((u8)(unk54->unk64 + 0x40) > 0x80) {
        temp ^= 0x800;
    }

    if (cheese->unkC & 8) {
        temp ^= 0x800;
    }

    s->unk10 = (temp | (s->unk10 & ~0xC00)) & ~0x3000;
    s->unk10 |= (unk54->unk68->unk10) & 0x3000;
    UpdateSpriteAnimation(s);
    if (!(cheese->unkC & 2)) {
        DisplaySprite(s);
    }
}

u8 sub_8015118(Cheese *);
void sub_8014EFC(Cheese *, s16, s16, u8);
void sub_80142AC(void);
void sub_8014350(void);

void sub_801420C(void)
{
    struct Task **t = &gCurTask;
    Cheese *cheese = TASK_DATA(*t);
    Cheese_UNK54 *unk54 = &cheese->unk54;

    sub_8015118(cheese);
    sub_8014EFC(cheese, 0, 0x18, 0);

    if (unk54->unk68->graphics.anim == 0x79 && unk54->unk68->variant == 0) {
        sub_8014EFC(cheese, 0, 0, 0);
        cheese->unkA = 0;
        (*t)->main = sub_80142AC;
    } else {
        (*t)->main = sub_8014350;
    }

    sub_801412C(cheese);

    if (IS_BOSS_STAGE(gCurrentLevel)) {
        gCurTask->main = sub_8014350;
    }
}

void sub_80142AC(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    Cheese_UNK54 *unk54 = &cheese->unk54;
    sub_8015118(cheese);
    sub_8014EFC(cheese, 0, 0, 0);

    cheese->unkC &= ~0x1;

    if (unk54->unk68->animCursor > 0xB6) {
        cheese->unkA = 1;
    }

    if ((cheese->unkA == 0 && unk54->unk68->variant != 0)) {
        sub_8014EFC(cheese, -0x20, 0x10, 0);
        gCurTask->main = sub_8014350;
    } else if (cheese->unkA != 0 && unk54->unk68->graphics.anim != 0x79) {
        sub_8014EFC(cheese, -0x20, 0x10, 0);
        gCurTask->main = sub_8014350;
    }

    cheese->unk10 = 15;
    if (unk54->unk60 & 0x100000) {
        cheese->unkC |= 2;
    } else {
        cheese->unkC &= ~0x2;
    }

    sub_801412C(cheese);
}

void sub_8014CC8(Cheese *);

extern const u8 gUnknown_080D5590[];

extern const u8 gUnknown_080D5628[];

void sub_80145D8(void);
void sub_8014A68(void);
void sub_80144CC(void);
void sub_8015378(void);
void sub_8015464(void);
void sub_80154B0(void);

void sub_8014350(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    Cheese_UNK54 *unk54 = &cheese->unk54;

    if (sub_8015118(cheese) == 1) {
        sub_8014EFC(cheese, 0x20, 0x20, 0);
        return;
    }

    sub_8014CC8(cheese);

    if (unk54->unk68->graphics.anim < 0xB6) {
        cheese->unk10
            = gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5b]
                                + unk54->unk68->variant];
    }

    if (unk54->unk60 & 0x100000) {
        cheese->unkC |= 2;
    } else {
        cheese->unkC &= ~0x2;
    }

    switch (cheese->unk10) {
        case 11:
            gCurTask->main = sub_8015378;
            break;

        case 12:
            cheese->unk10 = 0;
            gCurTask->main = sub_8015464;
            break;

        case 13:
            cheese->unkA = 0;
            gCurTask->main = sub_80154B0;
            cheese->unk10 = 0;
            sub_801412C(cheese);
            return;

        case 4:
            cheese->unkA = 0;
            m4aSongNumStart(SE_228);
            gCurTask->main = sub_8014A68;
            break;

        case 2:
            gCurTask->main = sub_80145D8;
            break;

        case 15:
            cheese->unkA = 0;
            gCurTask->main = sub_80142AC;
            break;

        case 9:
            cheese->unk10 = 9;
            cheese->unkA = 0;
            gCurTask->main = sub_80144CC;
            break;
    }
    sub_801412C(cheese);
}

void sub_80144CC(void)
{
    u8 temp;
    Cheese *cheese = TASK_DATA(gCurTask);
    Cheese_UNK54 *unk54 = &cheese->unk54;

    if (sub_8015118(cheese) == 1) {
        sub_8014EFC(cheese, 0x20, 0x20, 0);
        return;
    }

    if (unk54->unk68->animCursor >= 0xB0) {
        cheese->unk10 = 10;
        if (unk54->unk68->animCursor >= 0x100) {
            sub_8014EFC(cheese, 0x1C, 4, 4);

            if (unk54->unk60 & 1) {
                cheese->unkC |= 1;
            } else {
                cheese->unkC &= ~1;
            }
        } else {
            if (unk54->unk68->animCursor > 0xBF) {
                sub_8014EFC(cheese, -28, 4, 4);

                if (unk54->unk60 & 1) {
                    cheese->unkC &= ~1;
                } else {
                    cheese->unkC |= 1;
                }
            }
        }
        cheese->unkA += 2;
        cheese->posY += (SIN(cheese->unkA * 4) >> 9);
    } else {
        cheese->unk10 = 9;
    }

    temp = 10;
    if (unk54->unk68->graphics.anim < 0xB6) {
        temp = gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5B]
                                 + unk54->unk68->variant];
    }

    if (temp != 9) {
        gCurTask->main = sub_8014350;
    }
    sub_801412C(cheese);
}

void sub_801464C(void);

void sub_80149EC(void);
void sub_80152EC(void);

void sub_80145D8(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    sub_8015118(cheese);
    cheese->unk10 = 0;

    if (gUnknown_03005498.someDistanceSquared < 40000) {
        cheese->unk18 = gUnknown_03005498.t;

        gUnknown_03005498.t->unk15 = 1;
        cheese->unkA = 0;
        m4aSongNumStart(SE_CREAM_CHEESE_ATTACK);
        gCurTask->main = sub_801464C;
        cheese->unkC |= 0x10;
    } else {
        cheese->unkA = 0;
        gCurTask->main = sub_80149EC;
    }

    sub_80152EC();
    sub_801412C(cheese);
}

void sub_80155D0(Cheese *);
void sub_80148B8(void);

// void sub_801464C(void)
// {
//     Cheese *cheese = TASK_DATA(gCurTask);
//     Cheese_UNK54 *unk54 = &cheese->unk54;
//     struct Task *t = cheese->unk18;
//     s32 temp1;
//     s32 temp2;
//     s32 temp3;
//     s32 temp4;

//     temp1 = 3;
//     temp2 = 0xC;
//     temp3 = 0;
//     temp4 = 0;

//     if (IS_BOSS_STAGE(gCurrentLevel)) {
//         sub_80155D0(cheese);
//         temp1 = 2;
//         temp2 = 0x20;
//     }

//     if (cheese->unkC & 0x10 && unk54->unk68->graphics.anim != 0x69
//         && unk54->unk68->graphics.anim != 0x6D && unk54->unk68->graphics.anim != 0x71)
//         { cheese->unkC &= ~0x10;
//     }

//     cheese->unk10 = 5;
//     if (cheese->unkA != 0) {
//         cheese->unk10 = 6;
//         cheese->unkA++;
//     }

//     if (cheese->unkA > 8) {
//         cheese->unkA = 0;
//         cheese->unkE = 0;
//         gCurTask->main = sub_80148B8;
//     }

//     if (t->unk16 - Q_24_8_TO_INT(cheese->posX) < 0
//         && (Q_24_8_TO_INT(cheese->posY) - t->unk16) > temp2) {
//         s32 temp = t->unk18 - (Q_24_8_TO_INT(cheese->posY) + 4);
//         if (temp < 0) {
//             temp = (Q_24_8_TO_INT(cheese->posY) + 4) - t->unk18;
//         }

//         if (temp < temp2) {
//             if (cheese->unkA == 0) {
//                 cheese->unkA = 1;
//             }
//             cheese->unk10 = 6;
//         }
//     } else if (t->unk16 - Q_24_8_TO_INT(cheese->posX) >= 0
//                && (Q_24_8_TO_INT(cheese->posY) - t->unk16) < temp2) {
//         s32 temp = t->unk18 - (Q_24_8_TO_INT(cheese->posY) + 4);
//         if (temp < 0) {
//             temp = (Q_24_8_TO_INT(cheese->posY) + 4) - t->unk18;
//         }

//         if (temp < temp2) {
//             if (cheese->unkA == 0) {
//                 cheese->unkA = 1;
//             }
//             cheese->unk10 = 6;
//         }
//     }

//     temp2 = Q_24_8(t->unk16);

// }