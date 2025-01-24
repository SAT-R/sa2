#include "core.h"
#include "malloc_vram.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/cheese.h"
#include "game/stage/camera.h"
#include "game/multiplayer/mp_player.h"

#include "lib/m4a/m4a.h"

#include "constants/zones.h"
#include "constants/characters.h"
#include "constants/songs.h"
#include "constants/animations.h"

typedef struct {
    Sprite s;
    s32 unk30;
    s32 unk34;
    s32 unk38;
    u8 unk3C;
} Cheese_UNK8014BB0;

Cheese *gCheese = NULL;

void sub_801420C(void);
void sub_8015360(struct Task *);

void sub_801555C(void);

void sub_8015500(void);

void sub_80153F8(void);

void sub_8014C60(void);
void sub_8015604(struct Task *);

void sub_8014BB0(Cheese *cheese);
void sub_80155D0(Cheese *);
void sub_80148B8(void);

bool8 sub_8015118(Cheese *);
u8 sub_8014EFC(Cheese *, s16, s16, u8);
void sub_80142AC(void);
void sub_8014350(void);

u8 sub_8014CC8(Cheese *);

void sub_80145D8(void);
void sub_8014A68(void);
void sub_80144CC(void);
void sub_8015378(void);
void sub_8015464(void);
void sub_80154B0(void);
void sub_801464C(void);

void sub_80149EC(void);
void sub_80152EC(void);

const u16 gUnknown_080D5548[][2] = {
    { 0x1C7, 0 }, { 0x1C8, 0 }, { 0x1C9, 0 }, { 0x1C7, 0 }, { 0x1C8, 0 }, { 0x1C9, 0 }, { 0x1C9, 1 }, { 0x1CA, 0 }, { 0x1CB, 0 },
    { 0x1CC, 0 }, { 0x1CC, 1 }, { 0x1CD, 0 }, { 0x1CE, 0 }, { 0x1CF, 0 }, { 0x1CF, 1 }, { 0x1D0, 0 }, { 0x1D1, 0 }, { 0x1D6, 0 },
};

const u8 gUnknown_080D5590[] = {
    0, 9, 10, 10, 0, 0,  0,  0,  0,  0,  3, 3, 0, 0, 0,  0,  0,  0,  0, 0,  1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 4, 4, 0, 4, 0, 2,
    0, 0, 0,  11, 2, 16, 16, 16, 16, 15, 0, 0, 0, 0, 12, 12, 13, 14, 0, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 5, 5, 5,
    5, 5, 0,  0,  0, 0,  0,  0,  0,  0,  0, 0, 0, 0, 0,  0,  0,  0,  0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0,  0,  0, 0,  0,  0,  0,  0,  0, 8, 8, 8, 0,  0,  0,  0,  0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

const u8 gUnknown_080D5628[] = {
    0,  1,  4,  6,  8,  10, 11, 12, 14,  16,  22,  25,  28,  29,  30,  30,  32,  35,  30,  38,  40,  41,  42,  0,   0,  0,
    0,  0,  43, 46, 47, 49, 52, 54, 56,  57,  58,  0,   62,  64,  0,   0,   0,   66,  0,   0,   0,   0,   68,  71,  73, 76,
    78, 81, 83, 85, 86, 0,  94, 95, 107, 119, 120, 122, 124, 125, 128, 131, 132, 141, 143, 144, 146, 147, 150, 151,
};

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

        t = TaskCreate(sub_801420C, sizeof(Cheese), 0x5010, 0, sub_8015360);
        cheese = TASK_DATA(t);
        s = &cheese->s;
        gCheese = cheese;
        cheese->posX = gPlayer.qWorldX;
        cheese->posY = gPlayer.qWorldY;
    } else {
        MultiplayerPlayer *mpp = NULL;
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
                t = TaskCreate(sub_801420C, sizeof(Cheese), 0x5010, 0, sub_8015360);
                cheese = TASK_DATA(t);
                cheese->mpp = mpp;
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
    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    s->qAnimDelay = 0;

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
    if (cheese->unk10 != 18 && cheese->unk14 != gUnknown_080D5548[cheese->unk10][0] + gUnknown_080D5548[cheese->unk10][1]) {
        s->graphics.anim = gUnknown_080D5548[cheese->unk10][0];
        s->variant = gUnknown_080D5548[cheese->unk10][1];
        cheese->unk14 = s->graphics.anim + s->variant;
        s->prevVariant = -1;
        s->hitboxes[0].index = -1;
        s->hitboxes[1].index = -1;
    }

    s->x = I(cheese->posX) - gCamera.x;
    s->y = I(cheese->posY) - gCamera.y;

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

    s->frameFlags = (temp | (s->frameFlags & ~(SPRITE_FLAG_MASK_X_FLIP | SPRITE_FLAG_MASK_Y_FLIP))) & ~SPRITE_FLAG_MASK_PRIORITY;
    s->frameFlags |= (unk54->unk68->frameFlags) & SPRITE_FLAG_MASK_PRIORITY;
    UpdateSpriteAnimation(s);
    if (!(cheese->unkC & 2)) {
        DisplaySprite(s);
    }
}

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
        cheese->unk10 = gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5b] + unk54->unk68->variant];
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
        temp = gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5B] + unk54->unk68->variant];
    }

    if (temp != 9) {
        gCurTask->main = sub_8014350;
    }
    sub_801412C(cheese);
}

void sub_80145D8(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    sub_8015118(cheese);
    cheese->unk10 = 0;

    if (gCheeseTarget.squarePlayerDistance < SQUARE(CHEESE_DISTANCE_MAX)) {
        cheese->unk18 = gCheeseTarget.task;

        gCheeseTarget.task->unk15 = 1;
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

void sub_801464C(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    struct Task *t = cheese->unk18;
    Cheese_UNK54 *unk54 = &cheese->unk54;
    u32 temp5;
    s32 r0;

    s32 temp1 = 3;
    s32 temp2 = 0xC;
    s32 temp3 = 0;
    s32 temp4 = 0;

    if (IS_BOSS_STAGE(gCurrentLevel)) {
        sub_80155D0(cheese);
        temp1 = 2;
        temp2 = 0x20;
    }

    if (cheese->unkC & 0x10 && unk54->unk68->graphics.anim != 0x69 && unk54->unk68->graphics.anim != 0x6D
        && unk54->unk68->graphics.anim != 0x71) {
        cheese->unkC &= ~0x10;
    }

    cheese->unk10 = 5;
    if (cheese->unkA != 0) {
        cheese->unk10 = 6;
        cheese->unkA++;
    }

    if (cheese->unkA > 8) {
        cheese->unkA = 0;
        cheese->unkE = 0;
        gCurTask->main = sub_80148B8;
    }

    // TODO: lots of NON_MATCHING hacks here
    if (t->unk16 - I(cheese->posX) >= 0) {
        if (t->unk16 - I(cheese->posX) < temp2) {
            goto lab2;
        }
    } else if (I(cheese->posX) - t->unk16 < temp2) {
        s32 temp;
    lab2:
        temp = t->unk18 - ({ I(cheese->posY) + 4; });

        if (temp < 0) {
            r0 = ({ I(cheese->posY) + 4; }) - t->unk18;
        } else {
            if (temp < temp2) {
                goto lab;
            }
            goto end;
        }

        if (r0 < temp2) {
        lab:
            if (cheese->unkA == 0) {
                cheese->unkA = 1;
            }
            cheese->unk10 = 6;
        }
    }
end:

    temp5 = QS(t->unk16) - cheese->posX > -1 ? Q(t->unk16) - cheese->posX : cheese->posX - QS(t->unk16);

    if (QS(t->unk16) > cheese->posX) {
        temp3 = temp5 >> temp1;
        if (temp3 == 0 && temp5 != 0) {
            temp3 = 0x200;
        }

    } else {
        if (QS(t->unk16) < cheese->posX) {
            temp3 = -(temp5 >> temp1);
            if (temp3 == 0 && temp5 != 0) {
                temp3 = -512;
            }
        }
    }

    temp5 = QS(t->unk18 - 4) - cheese->posY > -1 ? QS(t->unk18 - 4) - cheese->posY : cheese->posY - QS(t->unk18 - 4);

    if (QS(t->unk18 - 4) > cheese->posY) {
        temp4 = temp5 >> temp1;
        if (temp4 == 0 && temp5 != 0) {
            temp4 = 0x200;
        }
    } else {
        if (Q(t->unk18 - 4) < cheese->posY) {
            temp4 = -(temp5 >> temp1);
            if (temp4 == 0 && temp5 != 0) {
                temp4 = -512;
            }
        }
    }

    r0 = -4095;
    if (temp3 < -0xFFF) {
        temp3 = r0;
    } else {
        r0 = 0xFFF;
        if (temp3 > 0xFFF) {
            temp3 = r0;
        }
    }

    r0 = -4095;
    if (temp4 < -0xFFF) {
        temp4 = r0;
    } else {
        r0 = 0xFFF;
        if (temp4 > 0xFFF) {
            temp4 = r0;
        }
    }

    cheese->posX += temp3;
    cheese->posY += temp4;

    if (t->unk15 == 0) {
        cheese->unkA = 0;
        cheese->unkE = 0;
        gCurTask->main = sub_80148B8;
    }
    sub_80152EC();
    sub_801412C(cheese);
}

void sub_8014834(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    struct Task *t = cheese->unk18;
    Cheese_UNK54 *unk54 = &cheese->unk54;
    if (cheese->unkC & 0x10 && unk54->unk68->graphics.anim != 0x69 && unk54->unk68->graphics.anim != 0x6D
        && unk54->unk68->graphics.anim != 0x71) {
        cheese->unkC &= ~0x10;
    }

    cheese->unk10 = 6;
    if (cheese->unkA++ > 8) {
        gCurTask->main = sub_80148B8;
        cheese->unkA = 0;
        cheese->unkE = 0;
    }

    if (t->unk15 == 0) {
        gCurTask->main = sub_80148B8;
        cheese->unkA = 0;
        cheese->unkE = 0;
    }

    sub_80152EC();
    sub_801412C(cheese);
}

void sub_80148B8(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    Cheese_UNK54 *unk54 = &cheese->unk54;

    u8 temp0 = 0;
    u8 temp1 = 3;

    if (IS_BOSS_STAGE(gCurrentLevel)) {
        temp1 = 1;
    }

    if (cheese->unkC & 0x10 && unk54->unk68->graphics.anim != 0x69 && unk54->unk68->graphics.anim != 0x6D
        && unk54->unk68->graphics.anim != 0x71) {
        cheese->unkC &= ~0x10;
    }

    sub_8015118(cheese);

    if (sub_8014EFC(cheese, 0x20, 0x20, temp1) == 1) {
        if (unk54->unk68->graphics.anim < 0xB6) {
            cheese->unk10 = gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5b] + unk54->unk68->variant];
        }

        if (cheese->unkE > 0x3C && cheese->unk10 != 2) {
            cheese->unkA = 0;
            gCurTask->main = sub_8014350;
        }
    }

    // ??
    cheese->unk10 = 0;

    if (unk54->unk68->graphics.anim < 0xB6) {
        temp0 = gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5b] + unk54->unk68->variant];
    }

    if (!(cheese->unkC & 0x10)) {
        if (temp0 == 2) {
            cheese->unkA = 8;
        }
        if (cheese->unkA != 0) {
            cheese->unk10 = 0x10;
            cheese->unkA--;
        }
    }

    if (cheese->unkE > 0x78) {
        cheese->unkA = 0;
        gCurTask->main = sub_8014350;
    }

    cheese->unkE++;

    sub_80152EC();
    sub_801412C(cheese);
}

void sub_80149EC(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    Cheese_UNK54 *unk54 = &cheese->unk54;

    cheese->unk10 = 7;
    if (cheese->unkA++ > 0x3C) {
        if (unk54->unk68->graphics.anim < 0xB6) {
            cheese->unk10 = gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5b] + unk54->unk68->variant];
        }
        if (cheese->unk10 != 7) {
            gCurTask->main = sub_8014350;
        }
    }

    sub_8015118(cheese);
    sub_8014CC8(cheese);
    sub_80152EC();
    sub_801412C(cheese);
}

void sub_8014A68(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    Cheese_UNK54 *unk54 = &cheese->unk54;
    s16 cos, sin;
    sub_8015118(cheese);

    cos = COS(cheese->unkA * 4) >> 9;
    sin = SIN(cheese->unkA * 4) >> 9;

    cheese->unkA += 0x10;

    sub_8014EFC(cheese, cos, sin, 0);

    if (unk54->unk68->graphics.anim < 0xB6) {
        cheese->unk10 = gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5b] + unk54->unk68->variant];
    }

    if (cheese->unk10 != 4) {
        m4aSongNumStop(SE_228);
        gCurTask->main = sub_8014350;
    }
    sub_801412C(cheese);
}

void sub_8014AFC(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    Cheese_UNK54 *unk54 = &cheese->unk54;
    s16 cos, sin;
    s16 cursor;
    sub_8015118(cheese);

    cos = COS(cheese->unkA * 4) >> 9;
    sin = SIN(cheese->unkA * 4) >> 11;

    cheese->unkA += 2;

    sub_8014EFC(cheese, cos, sin + 0x30, 0);

    if (unk54->unk68->graphics.anim < 0xB6) {
        cheese->unk10 = gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5b] + unk54->unk68->variant];
    }

    if (cheese->unk10 != 0xC) {
        gCurTask->main = sub_8014350;
    }

    cursor = cheese->s.animCursor;

    sub_801412C(cheese);
    if (cheese->s.animCursor == 0x3F && cursor != 0x3F) {
        sub_8014BB0(cheese);
    }

    if (cheese->s.animCursor == 0x12 && cursor != 0x12) {
        sub_8014BB0(cheese);
    }
}

void sub_8014BB0(Cheese *cheese)
{
    struct Task *t = TaskCreate(sub_8014C60, sizeof(Cheese_UNK8014BB0), 0x5040, 0, sub_8015604);
    Cheese_UNK8014BB0 *unk4BB0 = TASK_DATA(t);

    unk4BB0->unk3C = 0;

    if (cheese->s.animCursor == 0x12) {
        unk4BB0->unk30 = -64;
    } else {
        unk4BB0->unk30 = 0x40;
    }

    unk4BB0->unk34 = cheese->posX;
    unk4BB0->unk38 = cheese->posY;

    unk4BB0->s.graphics.dest = VramMalloc(4);
    unk4BB0->s.graphics.anim = 469;
    unk4BB0->s.variant = 0;
    unk4BB0->s.graphics.size = 0;
    unk4BB0->s.prevVariant = -1;
    unk4BB0->s.x = I(unk4BB0->unk34) - gCamera.x;
    unk4BB0->s.y = I(unk4BB0->unk38) - gCamera.y;
    unk4BB0->s.oamFlags = SPRITE_OAM_ORDER(8);
    unk4BB0->s.frameFlags = SPRITE_FLAG(PRIORITY, 2);
    unk4BB0->s.qAnimDelay = 0;

    unk4BB0->s.animSpeed = SPRITE_ANIM_SPEED(1.0);
    unk4BB0->s.palId = 0;
}

void sub_8014C60(void)
{
    Cheese_UNK8014BB0 *unk4BB0 = TASK_DATA(gCurTask);
    Sprite *s = &unk4BB0->s;
    if (unk4BB0->unk3C++ > 0x20) {
        TaskDestroy(gCurTask);
        return;
    }

    unk4BB0->unk34 += unk4BB0->unk30;
    unk4BB0->unk38 += 0x100;
    s->x = I(unk4BB0->unk34) - gCamera.x;
    s->y = I(unk4BB0->unk38) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

u8 sub_8014CC8(Cheese *cheese)
{
    Cheese_UNK54 *unk54 = &cheese->unk54;
    u8 temp;
    u32 temp2;
    s32 sin, cos;
    s32 r0, temp3, temp4, temp5;
    u8 ret;

    temp3 = 0;
    temp4 = 0;

    if (IS_BOSS_STAGE(gCurrentLevel)) {
        sub_80155D0(cheese);
    }

    temp = unk54->unk64 + 0xA0;

    if (cheese->unkC & 8) {
        if (unk54->unk64 == 0) {
            temp = (0x9F - unk54->unk64);
            temp -= 128;
        } else {
            temp = (0x9F - unk54->unk64);
            temp -= 128;
        }

        if (unk54->unk60 & 1) {
            cheese->unkC |= 1;
        } else {
            cheese->unkC &= ~1;
            temp += 0x40;
        }

    } else {
        if (unk54->unk60 & 1) {
            temp += 0x40;
            if (unk54->unk64 + 0x40 > 0x80) {
                cheese->unkC &= ~1;
            } else {
                cheese->unkC |= 1;
            }
        } else {
            if (unk54->unk64 + 0x40 > 0x80) {
                cheese->unkC |= 1;
            } else {
                cheese->unkC &= ~1;
            }
        }
    }

    cos = ((COS(temp * 4) >> 6) * 0x20) + unk54->unk54;
    sin = ((SIN(temp * 4) >> 6) * 0x20) + unk54->unk58;

    if (cheese->unk8 != 2) {
        temp2 = unk54->unk54 - cheese->posX > -1 ? unk54->unk54 - cheese->posX : cheese->posX - unk54->unk54;
        if (temp2 > 0x5000) {
            cheese->unk8 = 2;
        } else {
            if (temp2 > 0x3000) {
                cheese->unk8 = 3;
            } else {
                cheese->unk8 = 4;
            }
        }
    }

    temp2 = cos - cheese->posX > -1 ? cos - cheese->posX : cheese->posX - cos;
    if (temp2 < 0x400) {
        cheese->unk8 = 4;
    }

    if (cos > cheese->posX) {
        temp3 = (temp2 >> cheese->unk8);
        if (temp3 > 0x100) {
            cheese->unkC &= ~1;
        }
    } else {
        if (cos < cheese->posX) {
            temp3 = -(temp2 >> cheese->unk8);
            if (temp3 < -0x100) {
                cheese->unkC |= 1;
            }
        }
    }

    if (cheese->unk9 != 2) {
        temp2 = unk54->unk58 - cheese->posY > -1 ? unk54->unk58 - cheese->posY : cheese->posY - unk54->unk58;

        if (temp2 > 0x5000) {
            cheese->unk9 = 2;
        } else {
            if (temp2 > 0x3000) {
                cheese->unk9 = 3;
            } else {
                cheese->unk9 = 4;
            }
        }
    }

    temp2 = sin - cheese->posY > -1 ? sin - cheese->posY : cheese->posY - sin;
    if (temp2 < 0x400) {
        cheese->unk9 = 4;
        ret = 1;
    } else {
        ret = 0;
    }

    if (sin > cheese->posY) {
        temp4 = temp2 >> cheese->unk9;
    } else if (sin < cheese->posY) {
        temp4 = -(temp2 >> cheese->unk9);
    }

    r0 = -4095;
    if (temp3 < -0xFFF) {
        temp3 = r0;
    } else {
        r0 = 0xFFF;
        if (temp3 > 0xFFF) {
            temp3 = r0;
        }
    }

    r0 = -4095;
    if (temp4 < -0xFFF) {
        temp4 = r0;
    } else {
        r0 = 0xFFF;
        if (temp4 > 0xFFF) {
            temp4 = r0;
        }
    }

    cheese->posX += temp3;
    cheese->posY += temp4;

    return ret;
}

u8 sub_8014EFC(Cheese *cheese, s16 x, s16 y, u8 p4)
{
    Cheese_UNK54 *unk54 = &cheese->unk54;
    u8 temp;
    u32 temp2;
    s32 sin, cos;
    s32 r0, temp3, temp4;
    u8 ret;

    temp3 = 0;
    temp4 = 0;
    ret = 0;

    if (IS_BOSS_STAGE(gCurrentLevel)) {
        sub_80155D0(cheese);
    }

    temp = unk54->unk64 + 0xA0;

    if (cheese->unkC & 8) {
        if (unk54->unk64 == 0) {
            temp = (0x9F - unk54->unk64);
            temp -= 128;
        } else {
            temp = (0x9F - unk54->unk64);
            temp -= 128;
        }

        if (unk54->unk60 & 1) {
            cheese->unkC |= 1;
        } else {
            cheese->unkC &= ~1;
            temp += 0x40;
        }

    } else {
        if (unk54->unk60 & 1) {
            temp += 0x40;
            if (unk54->unk64 + 0x40 > 0x80) {
                cheese->unkC &= ~1;
            } else {
                cheese->unkC |= 1;
            }
        } else {
            if (unk54->unk64 + 0x40 > 0x80) {
                cheese->unkC |= 1;
            } else {
                cheese->unkC &= ~1;
            }
        }
    }
    do {
        cos = ((COS(temp * 4) >> 6) * x) + unk54->unk54;
    } while (0);
    sin = ((SIN(temp * 4) >> 6) * y) + unk54->unk58;

    if (p4 == 0) {
        cheese->posX = cos;
        cheese->posY = sin;
        return 1;
    }
    if ((cos - cheese->posX > -1 ? cos - cheese->posX : cheese->posX - cos) < 0x600) {
        if ((sin - cheese->posY > -1 ? sin - cheese->posY : cheese->posY - sin) < 0x600) {
            ret = 1;
        }
    }

    temp2 = cos - cheese->posX > -1 ? cos - cheese->posX : cheese->posX - cos;

    if (cos > cheese->posX) {
        temp3 = (temp2 >> p4);
        if (temp3 != 0) {
            cheese->unkC &= ~1;
        }
    } else {
        if (cos < cheese->posX) {
            temp3 = -(temp2 >> p4);
            if (temp3 != 0) {
                cheese->unkC |= 1;
            }
        }
    }

    temp2 = sin - cheese->posY > -1 ? sin - cheese->posY : cheese->posY - sin;
    if (sin > cheese->posY) {
        temp4 = temp2 >> p4;
    } else if (sin < cheese->posY) {
        temp4 = -(temp2 >> p4);
    }

    r0 = -4095;
    if (temp3 < -0xFFF) {
        temp3 = r0;
    } else {
        r0 = 0xFFF;
        if (temp3 > 0xFFF) {
            temp3 = r0;
        }
    }

    r0 = -4095;
    if (temp4 < -0xFFF) {
        temp4 = r0;
    } else {
        r0 = 0xFFF;
        if (temp4 > 0xFFF) {
            temp4 = r0;
        }
    }

    cheese->posX += temp3;
    cheese->posY += temp4;

    return ret;
}

bool8 sub_8015118(Cheese *cheese)
{
    Cheese_UNK54 *unk54 = &cheese->unk54;

    if ((u8)(gGameMode - 3) < 2) {
        bool8 r7 = 0;
        bool8 thing = FALSE;

        s32 temp, temp2;
        s16 x, y;

        if (ABS(cheese->mpp->pos.x - I(unk54->unk54)) > 0x1E) {
            r7 = 1;
        }

        if (ABS(cheese->mpp->pos.y - I(unk54->unk58)) > 0x1E) {
            r7 = 1;
        }

        unk54->unk54 = QS(cheese->mpp->pos.x);
        unk54->unk58 = QS(cheese->mpp->pos.y);

        x = cheese->mpp->pos.x - gCamera.x;
        if ((u16)(x + 32) > 304) {
            return TRUE;
        }

        y = cheese->mpp->pos.y - gCamera.y;
        if ((u16)(y + 32) > 224) {
            return TRUE;
        }

        unk54->unk5C = 1;
        unk54->unk5E = 1;
        unk54->unk68 = &cheese->mpp->s;
        unk54->unk60 = 0;

        if (!(cheese->mpp->unk54 & 2)) {
            unk54->unk60 = 1;
        }

        if (cheese->mpp->unk54 & 0x40) {
            unk54->unk60 |= 0x100000;
        }

        if (gSelectedCharacter == CHARACTER_CREAM && gPlayer.moveState & MOVESTATE_IA_OVERRIDE) {
            thing = TRUE;
        }

        if (!thing) {
            unk54->unk64 = cheese->mpp->transform.rotation >> 2;

            if (cheese->mpp->unk54 & 8) {
                if (unk54->unk64) {
                    unk54->unk64 = ~(unk54->unk64 + 0x80U);
                }
                cheese->unkC |= 8;
            } else {
                cheese->unkC &= ~8;
            }
        }

        if (r7) {
            sub_8014EFC(cheese, 0, 0x10, 0);
        }
    } else {
        unk54->unk54 = gPlayer.qWorldX;
        unk54->unk58 = gPlayer.qWorldY;
        unk54->unk5C = gPlayer.qSpeedAirX;
        unk54->unk5E = gPlayer.qSpeedAirY;
        unk54->unk68 = &gPlayer.spriteInfoBody->s;
        unk54->unk60 = gPlayer.moveState;

        if (!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE)) {
            unk54->unk64 = gPlayer.rotation;
            if (gPlayer.moveState & MOVESTATE_IN_AIR) {
                unk54->unk64 = 0;
            }

            if (gStageFlags & 0x80) {
                cheese->unkC |= 8;
            } else {
                cheese->unkC &= ~8;
            }
        }
    }

    return FALSE;
}

void sub_80152EC(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    Cheese_UNK54 *unk54 = &cheese->unk54;
    if (unk54->unk68->graphics.anim < SA2_ANIM_TAILS_IDLE
        && gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5b] + unk54->unk68->variant] == 4) {
        cheese->unkA = 0;
        cheese->unkE = 0;
        gCheeseTarget.task->unk15 = 0;
        cheese->unkC &= ~0x10;
        m4aSongNumStart(SE_228);
        gCurTask->main = sub_8014A68;
    }
}

void sub_8015360(struct Task *t)
{
    Cheese *cheese = TASK_DATA(t);
    Sprite *s = &cheese->s;
    VramFree(s->graphics.dest);
}

void sub_8015378(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    Cheese_UNK54 *unk54 = &cheese->unk54;
    sub_8015118(cheese);
    if ((sub_8014EFC(cheese, 8, 0xf, 1) & 0xFF) == 1) {
        gCurTask->main = sub_80153F8;
    }

    if (unk54->unk68->graphics.anim < SA2_ANIM_TAILS_IDLE) {
        cheese->unk10 = gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5b] + unk54->unk68->variant];
    }

    if (cheese->unk10 != 11) {
        gCurTask->main = sub_8014350;
    }

    sub_801412C(cheese);
}

void sub_80153F8(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    Cheese_UNK54 *unk54 = &cheese->unk54;
    sub_8015118(cheese);
    sub_8014EFC(cheese, 8, 0xf, 0);

    if (unk54->unk68->graphics.anim < SA2_ANIM_TAILS_IDLE) {
        cheese->unk10 = gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5b] + unk54->unk68->variant];
    }

    if (cheese->unk10 != 11) {
        gCurTask->main = sub_8014350;
    }

    sub_801412C(cheese);
}

void sub_8015464(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    sub_8015118(cheese);
    if (sub_8014EFC(cheese, 0x20, 0x30, 3) == 1) {
        cheese->unkA = 0;
        gCurTask->main = sub_8014AFC;
    }
    cheese->unk10 = 0;
    sub_801412C(cheese);
}

void sub_80154B0(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    sub_8015118(cheese);
    sub_8014EFC(cheese, 0, 0x30, 4);
    if (cheese->unkA == 60) {
        cheese->unkA = 0;
        gCurTask->main = sub_8015500;
    }
    cheese->unkA++;
    cheese->unk10 = 0;
    sub_801412C(cheese);
}

void sub_8015500(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    Player *player = &gPlayer;
    sub_8015118(cheese);
    sub_8014EFC(cheese, 0, -2, 0);
    if (cheese->unkA == 8) {
        gCurTask->main = sub_801555C;
        player->variant = 1;
    }
    cheese->unkA++;
    cheese->unk10 = 13;
    sub_801412C(cheese);
}

void sub_801555C(void)
{
    Cheese *cheese = TASK_DATA(gCurTask);
    Cheese_UNK54 *unk54 = &cheese->unk54;
    sub_8015118(cheese);
    sub_8014EFC(cheese, 0, -2, 0);
    cheese->unk10 = 14;

    if (unk54->unk68->graphics.anim < SA2_ANIM_TAILS_IDLE) {
        cheese->unk10 = gUnknown_080D5590[gUnknown_080D5628[unk54->unk68->graphics.anim - 0x5b] + unk54->unk68->variant];
    }

    if (cheese->unk10 != 0xE) {
        gCurTask->main = sub_8014350;
    }

    sub_801412C(cheese);
}

void sub_80155D0(Cheese *cheese)
{
    Cheese_UNK54 *unk54 = &cheese->unk54;
    if (!(cheese->unkC & 4) && !(unk54->unk60 & 0x100000)) {
        cheese->posX = unk54->unk54;
        cheese->posY = unk54->unk58;
        cheese->unkC |= 4;
    }
}

void sub_8015604(struct Task *t)
{
    Cheese_UNK8014BB0 *unk4BB0 = TASK_DATA(t);
    Sprite *s = &unk4BB0->s;
    VramFree(s->graphics.dest);
}

void sub_8015618(void) { }
