#include "trig.h"

#include "sakit/globals.h"
#include "sakit/collision.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/boss_results_transition.h"
#include "game/stage/collision.h"

#include "game/bosses/boss_7.h"
#include "game/bosses/common.h"
#include "game/bosses/eggmobile_escape_sequence.h"

#include "game/player_callbacks.h"

#include "game/math.h"

#include "lib/m4a.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    u32 unk0;
    /* 0x004 */ s32 x;
    /* 0x008 */ s32 y;
    /* 0x00C */ s16 speedX;
    /* 0x00E */ s16 speedY;
    /* 0x010 */ s32 unk10;
    u8 unk14;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 unk18;
    u8 unk19;
    u8 unk1A;
    u8 unk1B;
    u16 unk1C[2][3];
    s16 unk28[6 * 4];
    u16 unk58;
    u32 unk5C;
    const u16 **unk60; // gUnknown_080D859C
    u8 unk64;
    u8 unk65;
    u8 unk66;
    Sprite unk68;
    Sprite unk98[5];
    Sprite unk188[2];
    void *unk1E8;
} EggFrog; /* 0x1EC */

void Task_EggFrogMain(void);
void TaskDestructor_EggFrogMain(struct Task *);

extern const u16 *const gUnknown_080D859C[];
extern const TileInfo gUnknown_080D8108[];

typedef struct {
    u16 unk0;
    u8 unk2;
    u8 unk3;
} UNK_80D8710;
extern const UNK_80D8710 gUnknown_080D8710[15];
extern const u16 **gUnknown_080D86D4[15];

void CreateEggFrog(void)
{
    Sprite *s;

    u8 i, j;
    EggFrog *boss;
    void *vram;
    u16 *unk28;
    gDispCnt |= 0x100;
    gBgCntRegs[0] = 0x5A0D;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 255;
    gUnknown_03002280[0][3] = 64;
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    sub_8039ED4();
    gPseudoRandom = gStageTime;
    gUnknown_03005AF0.s.unk10 &= ~0x3000;
    gUnknown_03005AF0.s.unk10 |= 0x1000;
    gActiveBossTask
        = TaskCreate(Task_EggFrogMain, 0x1EC, 0x4000, 0, TaskDestructor_EggFrogMain);

    boss = TASK_DATA(gActiveBossTask);

    if (gDifficultyLevel != 0 && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->unk14 = 6;
    } else {
        boss->unk14 = 8;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->unk14 = boss->unk14 / 2;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->x = Q(37934);
        boss->y = Q(20);
        boss->unk10 = Q(38284);
    } else {
        boss->x = Q(520);
        boss->y = Q(140);
        boss->unk10 = Q(830);
    }

    boss->speedX = Q(5);
    boss->speedY = 0;
    boss->unk15 = 0;
    boss->unk16 = 0;
    boss->unk1C[0][0] = 0;
    boss->unk1C[0][1] = 0;
    boss->unk1C[0][2] = 0;
    boss->unk1C[1][0] = 0;
    boss->unk28[1] = 0;
    boss->unk28[(1 * 4) + 1] = 0;
    boss->unk18 = 0;
    boss->unk17 = 0;
    boss->unk19 = 0;
    boss->unk1A = 0;
    boss->unk0 = 0;

    boss->unk65 = 0;
    boss->unk66 = 0;

    unk28 = boss->unk28;
    for (i = 0; i < 6; i++) {
        const u16 *thing = gUnknown_080D859C[i];
        thing++;
        for (j = 0; j < 4; j++) {
            *unk28 = *thing;
            thing++;
            unk28++;
        }
    }
    boss->unk5C = 0;
    boss->unk58 = gUnknown_080D8710[14].unk0;
    boss->unk1B = 0xE;
    boss->unk5C &= 0xFFF;
    boss->unk60 = gUnknown_080D86D4[14];
    boss->unk18 = gUnknown_080D8710[14].unk2;
    boss->unk19 = gUnknown_080D8710[14].unk3;

    boss->unk1E8 = VramMalloc(39);

    s = &boss->unk68;
    s->x = 32;
    s->y = 40;
    s->graphics.dest = (void *)VRAM + 0xC000;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_FROG_CABIN, 0, 31, 3, SPRITE_FLAG(18, 1));

    for (i = 0; i < 5; i++) {
        u32 a;
        s = &boss->unk98[i];
        s->x = 0;
        s->y = 0;

        a = 3 + i;

        SPRITE_INIT(s, gUnknown_080D8108[a].numTiles, gUnknown_080D8108[a].anim,
                    gUnknown_080D8108[a].variant, i + 27, 2);

        UpdateSpriteAnimation(s);
    }

    s = &boss->unk188[0];
    s->x = 0;
    s->y = 0;
    vram = VramMalloc(gUnknown_080D8108[2].numTiles);
    s->graphics.dest = vram;
    SPRITE_INIT_WITHOUT_VRAM(s, gUnknown_080D8108[2].anim, gUnknown_080D8108[2].variant,
                             25, 2, 0);
    UpdateSpriteAnimation(s);

    s = &boss->unk188[1];
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    SPRITE_INIT_WITHOUT_VRAM(s, gUnknown_080D8108[2].anim, gUnknown_080D8108[2].variant,
                             25, 2, 0);
    UpdateSpriteAnimation(s);
}

typedef void (*EggFrogCallback)(EggFrog *);

extern const EggFrogCallback gUnknown_080D874C[];

void sub_8048408(EggFrog *);
void sub_80492B8(EggFrog *);
void sub_8048858(EggFrog *);
void sub_8048E64(EggFrog *);
void sub_80480E8(EggFrog *);
void sub_804931C(EggFrog *);

void sub_8047F0C(void);

void sub_8047E28(void)
{
    EggFrog *boss = TASK_DATA(gCurTask);
    gUnknown_080D874C[boss->unk1B](boss);
    sub_8048408(boss);
    sub_80492B8(boss);
    sub_8048858(boss);
    sub_8048E64(boss);
    sub_80480E8(boss);
    sub_804931C(boss);

    if (boss->unk14 == 0) {
        if (GRAVITY_IS_INVERTED) {
            gPlayer.moveState |= MOVESTATE_IN_AIR;
        }

        Player_DisableInputAndBossTimer();
        boss->speedX = Q(5);
        boss->unk18 = 0;
        boss->unk64 = 0;
        gStageFlags &= ~EXTRA_STATE__GRAVITY_INVERTED;
        gCurTask->main = sub_8047F0C;
        return;
    }

    if ((gPlayer.unk5C & 0x40)) {
        gStageFlags |= EXTRA_STATE__GRAVITY_INVERTED;
    } else if (gPlayer.unk5C & 0x80) {
        gStageFlags &= ~EXTRA_STATE__GRAVITY_INVERTED;
    }
}

void sub_8048654(EggFrog *);
void sub_8048F44(void);

void sub_8047F0C(void)
{
    EggFrog *boss = TASK_DATA(gCurTask);
    gStageFlags &= ~EXTRA_STATE__GRAVITY_INVERTED;
    sub_8048654(boss);
    sub_8048E64(boss);
    sub_80480E8(boss);
    sub_804931C(boss);

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_144);
    }

    if (Mod(gStageTime, 7) == 0 && boss->unk65 == 0) {
        ExplosionPartsInfo explosion;
        u32 rand;
        rand = PseudoRandom32();
        explosion.spawnX = (I(boss->x) - gCamera.x) + (rand & 0x3F) - 0x1F;
        rand = PseudoRandom32();
        explosion.spawnY = (I(boss->y) - gCamera.y) + (rand & 0x3F) - 0x1F;

        explosion.velocity = 0;
        explosion.rotation = ({ 1000 - ((PseudoRandom32() % 64u)); });
        explosion.speed = ({ Q(4) - (PseudoRandom32() % (unsigned)Q(2)); });
        explosion.vram = (void *)OBJ_VRAM0 + 0x2980;
        explosion.anim = SA2_ANIM_EXPLOSION;
        explosion.variant = 0;
        explosion.unk4 = 0;
        CreateBossParticleWithExplosionUpdate(&explosion, &boss->unk64);
    }

    if (boss->unk65 == 0 && (I(boss->x) - gCamera.x) < 0x32) {
        Sprite *s = &boss->unk68;
        s->graphics.anim = SA2_ANIM_EGG_FROG_CABIN;
        s->variant = 4;
        s->prevVariant = -1;
        boss->unk65 = 1;
        CreateEggmobileEscapeSequence(I(boss->x) - gCamera.x,
                                      I(boss->y) - gCamera.y - 15,
                                      SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(X_FLIP, 1));
    }

    if (I(boss->x) - gCamera.x < -200 && boss->unk65 != 0) {
        sub_802EF68(-0x28, 0x96, 6);
        gCurTask->main = sub_8048F44;
    }
}

extern const u8 gUnknown_080D8788[][7];

void sub_80480E8(EggFrog *boss)
{

    s32 sin, cos;
    u8 k;
    Sprite *s = &boss->unk68;
    Vec2_32 pos;
    u8 i, j;
    u8 temp;

    s->x = 0x20;
    s->y = 0x28;
    UpdateSpriteAnimation(s);
    sub_8003914(s);
    gBgScrollRegs[0][0] = 32 - (I(boss->x) - gCamera.x);
    gBgScrollRegs[0][1] = 40 - (I(boss->y) - gCamera.y);

    pos.x = I(boss->x) - gCamera.x;
    if ((u32)(pos.x + 0x32) >= 351) {
        gDispCnt &= ~0x100;
    } else {
        gDispCnt |= 0x100;
    }

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 2; j++) {
            if (j == 0) {
                pos.x = I(boss->x) - gCamera.x;
                pos.y = I(boss->y) - gCamera.y;
                pos.x += ((COS(boss->unk1C[i][0]) * 0x17) >> 0xE);
                pos.y += ((SIN(boss->unk1C[i][0]) * 0x17) >> 0xE);

                for (k = 0; k < 3; k++) {
                    s = &boss->unk98[gUnknown_080D8788[j][k]];
                    s->x = pos.x + ((COS(boss->unk1C[i][1]) * k * 5) >> 0xD);
                    s->y = pos.y + ((SIN(boss->unk1C[i][1]) * k * 5) >> 0xD);
                    DisplaySprite(s);
                }
            } else {
                cos = COS(boss->unk1C[i][1]);
                pos.x += cos >> 9;

                sin = SIN(boss->unk1C[i][1]);
                pos.y += sin >> 9;

                for (k = 0; k < 7; k++) {
                    s = &boss->unk98[gUnknown_080D8788[j][k]];
                    s->x = pos.x + ((k * COS(boss->unk1C[i][2])) >> 0xB);
                    s->y = pos.y + ((k * SIN(boss->unk1C[i][2])) >> 0xB);
                    DisplaySprite(s);

                    if (boss->unk14 && boss->unk0 == 0) {
                        sub_800CA20(s, s->x + gCamera.x, s->y + gCamera.y, 0, &gPlayer);
                    }
                }
            }
        }

        pos.x += (COS(boss->unk1C[i][2]) * 0x32) >> 0xE;
        pos.y += (SIN(boss->unk1C[i][2]) * 0x32) >> 0xE;
        s = &boss->unk188[i];
        s->x = pos.x;
        s->y = pos.y;

        temp = boss->unk18;
        if (temp != 0) {
            s->unk10 = 0x2800;
        } else {
            s->unk10 = 0x2000;
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void sub_8048D78(EggFrog *);
void sub_804928C(EggFrog *);

void sub_8048408(EggFrog *boss)
{
    Sprite *s = &boss->unk68;
    Vec2_32 pos;
    pos.x = I(boss->x);
    pos.y = I(boss->y);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (boss->unk16 == 0) {
        if (sub_800C320(s, pos.x, pos.y, 0, &gPlayer) == TRUE) {
            sub_8048D78(boss);
        } else if (sub_800CA20(s, pos.x, pos.y, 0, &gPlayer) == TRUE) {
            sub_804928C(boss);
        }

        Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));

        if (boss->unk16 == 0
            && IsColliding_Cheese(s, pos.x, pos.y, 0, &gPlayer) == TRUE) {
            sub_8048D78(boss);
            gUnknown_03005498.t->unk15 = 0;
        }
    }
}

void sub_80484C8(EggFrog *boss)
{
    if (boss->unk19 == 0) {
        u32 r1;
        if ((gCourseTime & 1)) {
            r1 = 0;
        } else {

            r1 = PseudoRandom32() & 1;
        }
        boss->unk1A = r1;

        if (boss->unk18 == 0) {
            if (boss->unk1A == 0) {
                boss->unk17 = 1;
                if (GRAVITY_IS_INVERTED) {
                    boss->unk1B = 6;
                    boss->unk5C &= 0xFFF;
                    boss->unk60 = gUnknown_080D86D4[6];
                    boss->unk18 = gUnknown_080D8710[6].unk2;
                    boss->unk19 = gUnknown_080D8710[6].unk3;
                } else {
                    boss->unk1B = 1;
                    boss->unk5C &= 0xFFF;
                    boss->unk60 = gUnknown_080D86D4[1];
                    boss->unk18 = gUnknown_080D8710[1].unk2;
                    boss->unk19 = gUnknown_080D8710[1].unk3;
                }
            } else {
                m4aSongNumStart(SE_258);
                boss->unk1B = 4;
                boss->unk5C &= 0xFFF;
                boss->unk60 = gUnknown_080D86D4[4];
                boss->unk18 = gUnknown_080D8710[4].unk2;
                boss->unk19 = gUnknown_080D8710[4].unk3;
            }
        } else {
            if (boss->unk1A == 0) {
                boss->unk17 = 1;
                if (GRAVITY_IS_INVERTED) {
                    boss->unk1B = 8;
                    boss->unk5C &= 0xFFF;
                    boss->unk60 = gUnknown_080D86D4[8];
                    boss->unk18 = gUnknown_080D8710[8].unk2;
                    boss->unk19 = gUnknown_080D8710[8].unk3;
                } else {
                    boss->unk1B = 13;
                    boss->unk5C &= 0xFFF;
                    boss->unk60 = gUnknown_080D86D4[13];
                    boss->unk18 = gUnknown_080D8710[13].unk2;
                    boss->unk19 = gUnknown_080D8710[13].unk3;
                }
            } else {
                m4aSongNumStart(SE_258);
                boss->unk1B = 11;
                boss->unk5C &= 0xFFF;
                boss->unk60 = gUnknown_080D86D4[11];
                boss->unk18 = gUnknown_080D8710[11].unk2;
                boss->unk19 = gUnknown_080D8710[11].unk3;
            }
        }
    }
}

extern const s8 gUnknown_080D814A[];
extern const s8 gUnknown_080D8148[];

void sub_8048654(EggFrog *boss)
{
    s32 result;
    s32 x, y;
    s16 temp2;
    u8 i;
    boss->speedY += gUnknown_080D814A[0];
    if (boss->speedY > 0x2C0) {
        boss->speedY = 0x2C0;
    }

    boss->x += boss->speedX;
    boss->y += boss->speedY;

    result = sub_801E4E4(I(boss->y) + 0x1E, I(boss->x), 1, 8, 0, sub_801EE64);
    if (result < 0) {
        boss->y += Q(result);
        boss->speedY = Div(-(boss->speedY * 9), 10);
        boss->speedX = Div((boss->speedX * 9), 10);
    }

    x = I(boss->x);
    y = I(boss->y);
    temp2 = 9;

    for (i = 0; i < 2; i++) {
        y = I(boss->y);
        y += ((SIN(boss->unk1C[i][0]) * 0x17) >> 0xE);
        y += SIN(boss->unk1C[i][1]) >> temp2;

        result = sub_801E4E4(y + 6, x, 1, 8, 0, sub_801EE64);
        if (result >= 1) {
            if (boss->unk1C[i][1] >= 0x100 && boss->unk1C[i][1] <= 0x300) {
                boss->unk1C[i][1] -= 2;
            } else {
                boss->unk1C[i][1] += 2;
            }
        } else {
            if (boss->unk1C[i][1] < 0x100 || boss->unk1C[i][1] > 0x300) {
                boss->unk1C[i][1] += 2;
            } else {
                boss->unk1C[i][1] -= 2;
            }
        }

        boss->unk1C[i][1] = boss->unk1C[i][1] & (SIN_PERIOD - 1);
        y += gUnknown_080D8148[0];
        y += ((SIN(boss->unk1C[i][2]) * 0x32) >> 0xE);
        result = sub_801E4E4(y, x, 1, 8, 0, sub_801EE64);

        if (result >= 1) {
            if (boss->unk1C[i][2] >= 0x100 && boss->unk1C[i][2] <= 0x300) {
                boss->unk1C[i][2] -= 2;
            } else {
                boss->unk1C[i][2] += 2;
            }
        } else {
            if (boss->unk1C[i][2] < 0x100 || boss->unk1C[i][2] > 0x300) {
                boss->unk1C[i][2] -= 2;
            } else {
                boss->unk1C[i][2] += 2;
            }
        }

        boss->unk1C[i][2] = (boss->unk1C[i][2] & (SIN_PERIOD - 1));
    }
}

void sub_8048858(EggFrog *boss)
{
    u8 i;
    s32 x = I(boss->x);
    s32 someVal;
    s32 result;
    s16 temp;

    if (boss->unk18 == 0) {
        someVal = 8;
    } else {
        someVal = -8;
    }

    temp = 9;
    for (i = 0; i < 2; i++) {
        s32 y = I(boss->y);
        y += gUnknown_080D8148[boss->unk18];
        y += (SIN(boss->unk1C[i][0]) * 0x17) >> 0xE;
        y += (SIN(boss->unk1C[i][1]) >> temp);
        y += (SIN(boss->unk1C[i][2]) * 0x32) >> 0xE;
        result = sub_801E4E4(y, x, 1, someVal, 0, sub_801EE64);

        if (result < 0) {
            boss->y += boss->unk18 != 0 ? -Q(result) : Q(result);
        }
    }
}

u8 sub_8048C7C(EggFrog *);
void sub_80493F8(EggFrog *, s32 x, s32 y, u8);

void sub_804893C(EggFrog *boss)
{
    sub_8048C7C(boss);
    if (boss->unk5C > 0x23FF) {
        boss->unk66 = 0;
        boss->unk1B = 3;
        boss->unk5C &= 0xFFF;
        boss->unk60 = gUnknown_080D86D4[3];
        boss->unk18 = gUnknown_080D8710[3].unk2;
        boss->unk19 = gUnknown_080D8710[3].unk3;
    }

    if (boss->unk5C > 0x1FFF) {
        if (boss->unk17 != 0) {
            sub_80493F8(boss, boss->x, boss->y, 0);
            boss->unk17 = 0;
        }
        boss->speedY = -Q(3.5);
    }
}

void sub_80489B0(EggFrog *boss)
{
    sub_8048C7C(boss);
    if (boss->unk66 == 0 && boss->unk5C > 0x35AC) {
        m4aSongNumStart(SE_257);
        boss->unk66 = 1;
    }

    if (boss->unk5C > 0x43FF) {
        m4aSongNumStart(SE_257);
        if (boss->unk1A == 0) {
            boss->unk1B = 7;
            boss->unk5C &= 0xFFF;
            boss->unk60 = gUnknown_080D86D4[7];
            boss->unk18 = gUnknown_080D8710[7].unk2;
            boss->unk19 = gUnknown_080D8710[7].unk3;
        } else {
            boss->unk1B = 5;
            boss->unk5C &= 0xFFF;
            boss->unk60 = gUnknown_080D86D4[5];
            boss->unk18 = gUnknown_080D8710[5].unk2;
            boss->unk19 = gUnknown_080D8710[5].unk3;
        }
    }
}

void sub_8048A4C(EggFrog *boss)
{
    if (sub_8048C7C(boss) != 0) {
        if (gCourseTime & 3) {
            boss->unk17 = 0;
            boss->unk1B = 1;
            boss->unk5C &= 0xFFF;
            boss->unk60 = gUnknown_080D86D4[1];
            boss->unk18 = gUnknown_080D8710[1].unk2;
            boss->unk19 = gUnknown_080D8710[1].unk3;
        } else {
            boss->unk1B = 12;
            boss->unk5C &= 0xFFF;
            boss->unk60 = gUnknown_080D86D4[12];
            boss->unk18 = gUnknown_080D8710[12].unk2;
            boss->unk19 = gUnknown_080D8710[12].unk3;
        }
        boss->speedX = 0x500;

    } else {
        boss->speedX -= 0xC;
    }
}

void sub_8048AD8(EggFrog *boss)
{
    sub_8048C7C(boss);

    if (boss->unk5C > 0x23FF) {
        boss->unk66 = 0;
        boss->unk1B = 10;
        boss->unk5C &= 0xFFF;
        boss->unk60 = gUnknown_080D86D4[10];
        boss->unk18 = gUnknown_080D8710[10].unk2;
        boss->unk19 = gUnknown_080D8710[10].unk3;
    }

    if (boss->unk5C > 0x1FFF) {
        if (boss->unk17 != 0) {
            sub_80493F8(boss, boss->x, boss->y, 1);
            boss->unk17 = 0;
        }
        boss->speedY = 0x380;
    }
}

void sub_8048B50(EggFrog *boss)
{
    sub_8048C7C(boss);
    if (boss->unk66 == 0 && boss->unk5C > 0x35AC) {
        m4aSongNumStart(SE_257);
        boss->unk66 = 1;
    }

    if (boss->unk5C > 0x43FF) {
        m4aSongNumStart(SE_257);
        if (boss->unk1A == 0) {
            boss->unk1B = 0;
            boss->unk5C &= 0xFFF;
            boss->unk60 = gUnknown_080D86D4[0];
            boss->unk18 = gUnknown_080D8710[0].unk2;
            boss->unk19 = gUnknown_080D8710[0].unk3;
        } else {
            boss->unk1B = 12;
            boss->unk5C &= 0xFFF;
            boss->unk60 = gUnknown_080D86D4[12];
            boss->unk18 = gUnknown_080D8710[12].unk2;
            boss->unk19 = gUnknown_080D8710[12].unk3;
        }
    }
}

void sub_8048BF0(EggFrog *boss)
{
    if (sub_8048C7C(boss) != 0) {
        if (gCourseTime & 3) {
            boss->unk17 = 0;
            boss->unk1B = 8;
            boss->unk5C &= 0xFFF;
            boss->unk60 = gUnknown_080D86D4[8];
            boss->unk18 = gUnknown_080D8710[8].unk2;
            boss->unk19 = gUnknown_080D8710[8].unk3;
        } else {
            boss->unk1B = 5;
            boss->unk5C &= 0xFFF;
            boss->unk60 = gUnknown_080D86D4[5];
            boss->unk18 = gUnknown_080D8710[5].unk2;
            boss->unk19 = gUnknown_080D8710[5].unk3;
        }
        boss->speedX = 0x500;

    } else {
        boss->speedX -= 0xC;
    }
}

// https://decomp.me/scratch/aDy46
// 81% though looks functionally matching
NONMATCH("asm/non_matching/game/bosses/boss_7__sub_8048C7C.inc",
         u8 sub_8048C7C(EggFrog *boss))
{
    const u16 **unk60 = boss->unk60;
    s16 *unk28 = boss->unk28;
    s16 *unk28_2;
    s16 *unk1C = boss->unk1C[0];
    u32 r8;

    u16 val = gUnknown_080D8710[boss->unk1B].unk0;
    u8 i;
    u8 result = 0;
    u8 temp = (boss->unk5C >> 0xC) + 1;
    u32 unk5C;
    if ((temp) > 7) {
        result = 1;
    }

    r8 = 7;

    temp &= 7;
    unk5C = boss->unk5C & 0xFFF;
    if (((boss->unk5C >> 0xC) & r8) != (((boss->unk5C - boss->unk58) >> 0xC) & r8)) {

        for (i = 0; i < 6; i++) {
            unk28[0] = unk28[1];
            unk28++;
            unk28[0] = unk28[1];
            unk28++;
            unk28[0] = unk28[1];
            unk28++;
            unk28[0] = (*unk60++)[temp];
            unk28++;
        }
    }
    unk28 = boss->unk28;
    for (i = 0; i < 6; i++) {
        unk28 = &boss->unk28[i * 4];
        *unk1C = sub_80859F4(unk28, unk5C);
        unk1C++;
    }

    boss->unk58 = (((boss->unk58 - val) * 230) >> 8) + val;
    boss->unk5C += boss->unk58;
    boss->unk5C = (boss->unk5C & 0x7FFF);

    return result;
}
END_NONMATCH

void sub_8048D78(EggFrog *boss)
{
    Sprite *s = &boss->unk68;
    boss->unk14--;

    if (boss->unk14 & 1) {
        m4aSongNumStart(SE_143);
    } else {
        m4aSongNumStart(SE_235);
    }

    boss->unk16 = 30;
    boss->unk15 = 0;

    if (boss->unk14 == 0) {
        s->graphics.anim = SA2_ANIM_EGG_FROG_CABIN;
        s->variant = 3;
        INCREMENT_SCORE(1000);

    } else {
        s->graphics.anim = SA2_ANIM_EGG_FROG_CABIN;
        s->variant = 2;
    }
    s->prevVariant = -1;

    if (!IS_FINAL_STAGE(gCurrentLevel) && boss->unk14 == 4) {
        gUnknown_030054A8.unk1 = 0x11;
    }
}

void sub_8048E64(EggFrog *boss)
{
    u8 result = FALSE;

    if (boss->unk16 == 0 || --boss->unk16 != 0) {
        if (boss->unk15 != 0 && --boss->unk15 == 0) {
            result = TRUE;
        }
        if (result == FALSE) {
            return;
        }
    }

    if (boss->unk14 != 0) {
        Sprite *s = &boss->unk68;
        s->graphics.anim = SA2_ANIM_EGG_FROG_CABIN;
        s->variant = 0;
        s->prevVariant = -1;
    }
}

void sub_8048EB4(s32 dX, s32 dY)
{
    EggFrog *boss = TASK_DATA(gActiveBossTask);
    boss->x += dX;
    boss->y += dY;
    boss->unk10 += dX;
}

void sub_804920C(EggFrog *);

void Task_EggFrogMain(void)
{
    EggFrog *boss = TASK_DATA(gCurTask);
    gUnknown_080D874C[boss->unk1B](boss);

    sub_80492B8(boss);
    sub_804920C(boss);
    sub_8048E64(boss);
    sub_80480E8(boss);
    boss->unk16 = 1;
    sub_804931C(boss);

    boss->unk0++;

    if (boss->unk0 > 299) {
        boss->unk0 = 0;
        gCurTask->main = sub_8047E28;
    }
}

void sub_8048F44(void)
{
    struct Task *t = gCurTask;
    gDispCnt &= ~DISPCNT_BG0_ON;
    gStageFlags &= ~EXTRA_STATE__GRAVITY_INVERTED;
    TaskDestroy(t);
}

void sub_8048F7C(EggFrog *boss)
{
    boss->unk19 = 0;
    sub_8048C7C(boss);
    if (boss->unk5C > 0x1FFF) {
        sub_80484C8(boss);
    }
}

void sub_8048FA4(EggFrog *boss)
{
    sub_8048C7C(boss);

    if (boss->unk5C > 0x43FF) {
        boss->unk58 = 0x77;
        m4aSongNumStart(SE_256);
        boss->unk1B = 2;
        boss->unk5C &= 0xFFF;
        boss->unk60 = gUnknown_080D86D4[2];
        boss->unk18 = gUnknown_080D8710[2].unk2;
        boss->unk19 = gUnknown_080D8710[2].unk3;
    }
}

void sub_8048FF4(EggFrog *boss)
{
    if (sub_8048C7C(boss) != 0 || boss->x > boss->unk10) {
        boss->unk1B = 7;
        boss->unk5C &= 0xFFF;
        boss->unk60 = gUnknown_080D86D4[7];
        boss->unk18 = gUnknown_080D8710[7].unk2;
        boss->unk19 = gUnknown_080D8710[7].unk3;
        boss->speedX = 0x500;
        boss->x = boss->unk10;
    } else {
        boss->speedX += 0xF;
    }
}

void sub_804904C(EggFrog *boss)
{
    sub_8048C7C(boss);

    if (boss->unk5C > 0x23FF) {
        sub_80493F8(boss, boss->x, boss->y, 1);
        boss->unk1B = 0;
        boss->unk5C &= 0xFFF;
        boss->unk60 = gUnknown_080D86D4[0];
        boss->unk18 = gUnknown_080D8710[0].unk2;
        boss->unk19 = gUnknown_080D8710[0].unk3;
    }
}

void sub_804909C(EggFrog *boss)
{
    boss->unk19 = 0;
    sub_8048C7C(boss);
    if (boss->unk5C > 0x1FFF) {
        sub_80484C8(boss);
    }
}

void sub_80490C4(EggFrog *boss)
{
    sub_8048C7C(boss);

    if (boss->unk5C > 0x43FF) {
        boss->unk58 = 0x77;
        m4aSongNumStart(SE_256);
        boss->unk1B = 9;
        boss->unk5C &= 0xFFF;
        boss->unk60 = gUnknown_080D86D4[9];
        boss->unk18 = gUnknown_080D8710[9].unk2;
        boss->unk19 = gUnknown_080D8710[9].unk3;
    }
}

void sub_804911C(EggFrog *boss)
{
    if (sub_8048C7C(boss) != 0 || boss->x > boss->unk10) {
        boss->unk1B = 0;
        boss->unk5C &= 0xFFF;
        boss->unk60 = gUnknown_080D86D4[0];
        boss->unk18 = gUnknown_080D8710[0].unk2;
        boss->unk19 = gUnknown_080D8710[0].unk3;
        boss->speedX = 0x500;
        boss->x = boss->unk10;
    } else {
        boss->speedX += 0xF;
    }
}

void sub_8049174(EggFrog *boss)
{
    sub_8048C7C(boss);

    if (boss->unk5C > 0x23FF) {
        sub_80493F8(boss, boss->x, boss->y, 0);
        boss->unk1B = 7;
        boss->unk5C &= 0xFFF;
        boss->unk60 = gUnknown_080D86D4[7];
        boss->unk18 = gUnknown_080D8710[7].unk2;
        boss->unk19 = gUnknown_080D8710[7].unk3;
    }
}

void sub_80491C4(EggFrog *boss)
{
    boss->x += 0x300;
    if (sub_8048C7C(boss) != 0) {
        boss->unk1B = 0;
        boss->unk5C &= 0xFFF;
        boss->unk60 = gUnknown_080D86D4[0];
        boss->unk18 = gUnknown_080D8710[0].unk2;
        boss->unk19 = gUnknown_080D8710[0].unk3;
    }
}

void sub_804920C(EggFrog *boss)
{
    s32 x = I(boss->x);
    s32 y = I(boss->y);

    s32 result;

    s32 temp = 9;
    y += gUnknown_080D8148[0];
    y += (SIN(boss->unk1C[1][0]) * 0x17) >> 0xE;
    y += SIN(boss->unk1C[1][1]) >> temp;
    y += (SIN(boss->unk1C[1][2]) * 0x32) >> 0xE;

    result = sub_801E4E4(y, x, 1, 8, 0, sub_801EE64);

    if (result < 0) {
        boss->y += Q(result);
    }
}

void sub_804928C(EggFrog *boss)
{
    Sprite *s = &boss->unk68;
    if (boss->unk16 == 0) {
        boss->unk15 = 0x1E;
        s->graphics.anim = SA2_ANIM_EGG_FROG_CABIN;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

void sub_80492B8(EggFrog *boss)
{
    boss->speedY += gUnknown_080D814A[boss->unk18];

    if (boss->unk18 == 0 && boss->speedY > 704) {
        boss->speedY = 704;
    } else if (boss->unk18 != 0 && boss->speedY < -704) {
        boss->speedY = -704;
    }
    boss->x += boss->speedX;
    boss->y += boss->speedY;
    boss->unk10 += 0x500;
}

extern const u16 gUnknown_080D8796[][16];

void sub_804931C(EggFrog *boss)
{
    if (boss->unk16 != 0) {
        u8 i;

        for (i = 0; i < 16; i++) {
            gBgPalette[i + 0xB0] = gUnknown_080D8796[(boss->unk16 & 2) >> 1][i];
        }
    }

    gFlags |= 1;
}

void TaskDestructor_EggFrogMain(struct Task *t)
{
    EggFrog *boss = TASK_DATA(t);
    VramFree(boss->unk1E8);
    VramFree(boss->unk98[0].graphics.dest);
    VramFree(boss->unk98[1].graphics.dest);
    VramFree(boss->unk98[2].graphics.dest);
    VramFree(boss->unk98[3].graphics.dest);
    VramFree(boss->unk98[4].graphics.dest);
    VramFree(boss->unk188[0].graphics.dest);
    gActiveBossTask = NULL;
}
