#include "global.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/math.h"
#include "core.h"
#include "task.h"
#include "lib/m4a.h"
#include "game/interactables_2/080.h"
#include "malloc_vram.h"
#include "trig.h"
#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ s32 unk0;
    /* 0x04 */ s32 unk4;
    /* 0x08 */ u16 kind;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ s16 unkC;
    /* 0x0E */ s16 unkE;
    /* 0x10 */ s16 unk10;
    /* 0x12 */ s16 unk12;
    /* 0x14 */ s32 someX;
    /* 0x18 */ s32 someY;
    /* 0x1C */ u16 unk1C;
    /* 0x1E */ u16 unk1E;
    /* 0x20 */ u16 unk20;
    /* 0x22 */ u16 unk22;

    // TODO: unk24 might point to a struct type?
    /* 0x24 */ u8 *unk24;
    /* 0x28 */ u8 unk28;
    /* 0x29 */ u8 filler29[0x3];
    /* 0x2C */ u8 *vramMem;
} StrcUnkIA086;

typedef struct {
    /* 0x00 */ Sprite *s;
    /* 0x04 */ u8 unk4;
    /* 0x05 */ u8 filler5[3];
    /* 0x08 */ s32 unk8;
    /* 0x0C */ s32 unkC;
    /* 0x10 */ s32 unk10;
    /* 0x14 */ s32 unk14;
} Unk_IA86;

typedef struct {
    /* 0x00 */ Unk_IA86 unk0[16];

    /* 0x180 */ u8 filler180[0x8];

    /* 0x188 */ s32 unk188;
    /* 0x18C */ s32 unk18C;
    /* 0x190 */ u8 filler190[0x8];
    /* 0x198 */ Sprite sprites[3];
    /* 0x228 */ StrcUnkIA086 unk228;
} Sprite_IA86; /* size: 0x258 (600) */

void sub_807C9C0(Sprite_IA86 *);
bool32 sub_807CB78(Sprite_IA86 *);
bool32 sub_807CA64(Sprite_IA86 *);
bool32 sub_807CF2C(Sprite_IA86 *);
bool32 sub_807CFB4(Sprite_IA86 *);
void sub_807CCBC(Sprite_IA86 *);
void sub_807CE94(Sprite_IA86 *);
void sub_807D100(Sprite_IA86 *);
void sub_807D130(Sprite_IA86 *);
void sub_807D188(Sprite_IA86 *);
void sub_807D16C(Sprite_IA86 *);
void Task_807D268(void);
void sub_807D2BC(Sprite_IA86 *);

void initSprite_Interactable086(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY, u32 kind);

// static
void Task_807D06C(void);

extern u8 gUnknown_080E0136[8];

// https://decomp.me/scratch/Yxcqt
void sub_807CCBC(Sprite_IA86 *ia086)
{
    bool32 bIdk = FALSE;
    u8 i;

    if ((gUnknown_03005590 & 0xF) == 0)
        bIdk = TRUE;

    for (i = 0; i < ARRAY_COUNT(ia086->sprites); i++) {
        sub_8004558(&ia086->sprites[i]);
    }

    for (i = 0; i < ARRAY_COUNT(ia086->unk0); i++) {
        Unk_IA86 *unk086 = &ia086->unk0[i];
        s16 r0;

        if (unk086->s == NULL) {
            u32 spriteIndex;
            s32 unkC;
            u16 rnd;
            if (!bIdk)
                continue;

            rnd = Random();
            spriteIndex = gUnknown_080E0136[rnd & 0x7];
            unk086->s = &ia086->sprites[spriteIndex];
            unk086->unk4 = Random();
            unk086->unk8 = 0;

            if (ia086->unk228.kind != 0) {
                unkC = Q_24_8(-(Random() & 0x7));
            } else {
                unkC = 0x2000;
            }
            unk086->unkC = unkC;

            unk086->unk10 = 0;
            unk086->unk14 = 0;
            bIdk = FALSE;
        }
        // _0807CD7E
        {
            u16 r2 = ABS(unk086->unkC) >> 4;
            if ((s16)r2 >= 64) {
                if ((s16)r2 > 0x200) {
                    r2 = 0x200;
                }
                r0 = r2;
            } else {
                r0 = 64;
            }
        }

        unk086->unkC -= r0;

        if (unk086->unkC > 0) {
            //_0807CDA2 + 0xC
            s32 r1;
            s32 r2;
            s16 newR1;

            unk086->unk14 = -unk086->unkC;
            r1 = unk086->unkC >> 5;
            r2 = ((ia086->unk228.unk1E * r1) << 8) >> 16;

            r1 = ia086->unk228.unk20;
            if (r1 < r2)
                r1 = r2;

            r1 <<= 16;
            newR1 = r1 >> 17;

            {
                s32 sinIndex;
                s32 addend;
                u16 temp;
                unk086->unk10 = newR1 * COS_24_8(unk086->unk4 * 4);

                temp = ((32 - Q_24_8_TO_INT(unk086->unkC)) >> 2);
                if ((s16)temp > 1) {
                    addend = temp;
                    if ((s16)temp > 8)
                        addend = 8;
                } else {
                    addend = 2;
                }
                unk086->unk4 += addend;
            }
        } else {
            // _0807CE12

            if (-Q_24_8_TO_INT(unk086->unkC) < ia086->unk228.unk1C) {
                s32 r4, r5;
                s32 divRes;
                s16 divRes2;
                s32 temp2;
                unk086->unk14 = SIN_24_8(unk086->unk4 * 4) * 4;

                r5 = ia086->unk228.unk20;
                r4 = ia086->unk228.unk1E;

                temp2 = -unk086->unkC;
                divRes = temp2 / ia086->unk228.unk1C;

                divRes2 = sub_80855C0(r5, r4, divRes, 8) >> 1;
                unk086->unk10 = divRes2 * SIN_24_8(unk086->unk4 * 4);
                unk086->unk4 += 8;
            } else {
                unk086->s = NULL;
            }
        }
    }
}

void sub_807CE94(Sprite_IA86 *ia086)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(ia086->unk0); i++) {
        Unk_IA86 *unk086 = &ia086->unk0[i];

        if (unk086->s != NULL) {
            s32 someX, someY;
            Sprite *s2;
            someX = ia086->unk228.someX;
            someX += Q_24_8_TO_INT(unk086->unk8 + unk086->unk10);
            someX -= gCamera.x;
            unk086->s->x = someX;

            s2 = unk086->s;
            someY = ia086->unk228.someY;
            someY += Q_24_8_TO_INT(unk086->unkC + unk086->unk14);
            someY -= gCamera.y;
            s2->y = someY;

            if (unk086->unk4 < 124) {
                unk086->s->unk1A = 0x180;
            } else {
                unk086->s->unk1A = 0x480;
            }

            if (unk086->unkC > -Q_24_8(16))
                unk086->s->unk10 = SPRITE_FLAG_PRIORITY(3);
            else
                unk086->s->unk10 = SPRITE_FLAG_PRIORITY(2);

            sub_80051E8(unk086->s);
        }
    }
}

bool32 sub_807CF2C(Sprite_IA86 *ia086)
{
    s16 screenX = ia086->unk228.unk0 - gCamera.x;
    s16 screenY = ia086->unk228.unk4 - gCamera.y;

    if (((screenX + ia086->unk228.unk10) < -Q_24_8(0.5))
        || ((screenX + ia086->unk228.unkC) > Q_24_8(1.4375))
        || ((screenY + ia086->unk228.unk12) < -Q_24_8(0.5))
        || ((screenY + ia086->unk228.unkE) > +Q_24_8(1.125))) {

        return TRUE;
    }

    return FALSE;
}

bool32 sub_807CFB4(Sprite_IA86 *ia086)
{
    if (PLAYER_IS_ALIVE) {
        s16 x = ia086->unk228.someX - gCamera.x;
        s16 y = ia086->unk228.someY - gCamera.y;
        s16 px = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        s16 py = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;
        s32 r5, r4;
        u16 r3;
        s32 r2 = (y - ia086->unk228.unk1C);

        if ((r2 <= py) && (r2 + ia086->unk228.unk1C >= py)) {
            s32 tempX;
            r5 = ia086->unk228.unk20;
            r4 = ia086->unk228.unk1E;

            r3 = sub_80855C0(r5, r4, (Q_24_8(y - py) / ia086->unk228.unk1C), 8);

            tempX = (x - (r3 >> 1));
            if ((tempX <= px) && ((tempX + r3) >= px)) {
                return TRUE;
            }
        }
    }

    return FALSE;
}

void Task_807D06C(void)
{
    Sprite_IA86 *ia086 = TaskGetStructPtr(gCurTask);

    if (sub_807CFB4(ia086)) {
        m4aSongNumStart(SE_285);
        sub_807C9C0(ia086);
    }

    if (sub_807CF2C(ia086)) {
        sub_807D188(ia086);
    } else {
        sub_807CCBC(ia086);
        sub_807CE94(ia086);
        sub_807D16C(ia086);
    }
}

void Task_807D0C4(void)
{
    Sprite_IA86 *ia086 = TaskGetStructPtr(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_807D06C;
    } else if (sub_807CA64(ia086)) {
        sub_807D130(ia086);
    }

    sub_807CCBC(ia086);
    sub_807CE94(ia086);
    sub_807D16C(ia086);
}

void TaskDestructor_Interactable086(struct Task *t)
{
    Sprite_IA86 *ia086 = TaskGetStructPtr(t);
    VramFree(ia086->unk228.vramMem);
}

void sub_807D130(Sprite_IA86 *ia086)
{
    ia086->unk188 = 0;
    ia086->unk18C = gPlayer.y - Q_24_8(ia086->unk228.someY);

    gCurTask->main = Task_807D268;
}

void sub_807D16C(Sprite_IA86 *unused)
{
    if ((gUnknown_03005590 & 0xFF) == 0) {
        m4aSongNumStartOrContinue(SE_285);
    }
}

void sub_807D188(Sprite_IA86 *ia086)
{
    m4aSongNumStop(SE_285);

    *ia086->unk228.unk24 = ia086->unk228.unk28;

    TaskDestroy(gCurTask);
}

void sub_807D1BC(Sprite_IA86 *ia086)
{
    u8 i;
    for (i = 0; i < 4; i++) {
        Unk_IA86 *unk = &ia086->unk0[i];

        s32 spriteIndex = gUnknown_080E0136[Random() & 0x7];
        unk->s = &ia086->sprites[spriteIndex];
        unk->unk4 = Random();
        unk->unk8 = 0;
        unk->unkC = -Q_24_8(Random() & 0x3F);
        unk->unk10 = 0;
        unk->unk14 = 0;
    }

    sub_807CCBC(ia086);
}

void initSprite_Interactable086_0(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    initSprite_Interactable086(me, spriteRegionX, spriteRegionY, spriteY, 0);
}

void initSprite_Interactable086_1(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    initSprite_Interactable086(me, spriteRegionX, spriteRegionY, spriteY, 1);
}

void Task_807D268(void)
{
    Sprite_IA86 *sprite = TaskGetStructPtr(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_807D06C;
    } else if (sub_807CB78(sprite)) {
        sub_807D2BC(sprite);
    }
    sub_807CCBC(sprite);
    sub_807CE94(sprite);
    sub_807D16C(sprite);
}

void sub_807D2BC(Sprite_IA86 *unused)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    gPlayer.unk6D = 7;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = -Q_24_8(8.0);

    gCurTask->main = Task_807D06C;
}