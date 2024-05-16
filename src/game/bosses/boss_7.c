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
    u16 unk28[24];
    u16 unk58;
    u32 unk5C;
    u32 unk60; // gUnknown_080D859C
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
    u8 unk0[6];
    u8 unk6;
    u8 unk7;
    u8 filler8[6];
    u8 unkE;
    u8 unkF;
    u8 filler0[2];
    u8 unk12;
    u8 unk13;
    u8 filler1[6];
    u8 unk1A;
    u8 unk1B;
    u8 filler2[6];
    u8 unk22;
    u8 unk23;
    u8 filler3[10];
    u8 unk2E;
    u8 unk2F;
    u8 unk[6];
    u8 unk36;
    u8 unk37;
    u16 unk38;
    u8 unk3A;
    u8 unk3B;
} UNK_80D8710;
extern const UNK_80D8710 gUnknown_080D8710;
extern const u32 gUnknown_080D86D4[15];

void CreateEggFrog(void)
{
    Sprite *s;
    const UNK_80D8710 *something;

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
    boss->unk28[5] = 0;
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
    boss->unk58 = gUnknown_080D8710.unk38;
    boss->unk1B = 0xE;
    boss->unk5C &= 0xFFF;
    boss->unk60 = gUnknown_080D86D4[14];
    boss->unk18 = gUnknown_080D8710.unk3A;
    boss->unk19 = gUnknown_080D8710.unk3B;

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
                    boss->unk18 = gUnknown_080D8710.unk1A;
                    boss->unk19 = gUnknown_080D8710.unk1B;
                } else {
                    boss->unk1B = 1;
                    boss->unk5C &= 0xFFF;
                    boss->unk60 = gUnknown_080D86D4[1];
                    boss->unk18 = gUnknown_080D8710.unk6;
                    boss->unk19 = gUnknown_080D8710.unk7;
                }
            } else {
                m4aSongNumStart(SE_258);
                boss->unk1B = 4;
                boss->unk5C &= 0xFFF;
                boss->unk60 = gUnknown_080D86D4[4];
                boss->unk18 = gUnknown_080D8710.unk12;
                boss->unk19 = gUnknown_080D8710.unk13;
            }
        } else {
            if (boss->unk1A == 0) {
                boss->unk17 = 1;
                if (GRAVITY_IS_INVERTED) {
                    boss->unk1B = 8;
                    boss->unk5C &= 0xFFF;
                    boss->unk60 = gUnknown_080D86D4[8];
                    boss->unk18 = gUnknown_080D8710.unk22;
                    boss->unk19 = gUnknown_080D8710.unk23;
                } else {
                    boss->unk1B = 13;
                    boss->unk5C &= 0xFFF;
                    boss->unk60 = gUnknown_080D86D4[13];
                    boss->unk18 = gUnknown_080D8710.unk36;
                    boss->unk19 = gUnknown_080D8710.unk37;
                }
            } else {
                m4aSongNumStart(SE_258);
                boss->unk1B = 11;
                boss->unk5C &= 0xFFF;
                boss->unk60 = gUnknown_080D86D4[11];
                boss->unk18 = gUnknown_080D8710.unk2E;
                boss->unk19 = gUnknown_080D8710.unk2F;
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

void sub_8048C7C(EggFrog *);
void sub_80493F8(EggFrog *, s32 x, s32 y, u8);

void sub_804893C(EggFrog *boss)
{
    sub_8048C7C(boss);
    if (boss->unk5C > 0x23FF) {
        boss->unk66 = 0;
        boss->unk1B = 3;
        boss->unk5C &= 0xFFF;
        boss->unk60 = gUnknown_080D86D4[3];
        boss->unk18 = gUnknown_080D8710.unkE;
        boss->unk19 = gUnknown_080D8710.unkF;
    }

    if (boss->unk5C > 0x1FFF) {
        if (boss->unk17 != 0) {
            sub_80493F8(boss, boss->x, boss->y, 0);
            boss->unk17 = 0;
        }
        boss->speedY = -Q(3.5);
    }
}
