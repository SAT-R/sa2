#include "sakit/globals.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "sakit/collision.h"

#include "game/bosses/common.h"

#include "game/cheese.h"

void sub_8049D1C(struct Task *);
void sub_80499D8(void);

typedef struct {
    u16 unk0;
    u16 unk2;
    u8 unk4;
    u8 unk5;
    u8 unk6;
} UNK_80498CC;

extern const u16 gUnknown_080D87D8[];
extern const u16 gUnknown_080D87E6[][2];

extern const s32 gUnknown_080D8808[][2];
// const u16 gUnknown_080D87D8[] = {
//     6400, 13888, 18016, 23104, 29152, 38080, 43091,
// };

void sub_80498CC(u8 bossNum)
{
    struct Task *t
        = TaskCreate(sub_80499D8, sizeof(UNK_80498CC), 0x4000, 0, sub_8049D1C);
    UNK_80498CC *unk8CC = TASK_DATA(t);
    unk8CC->unk4 = bossNum;
    unk8CC->unk5 = 0;
    unk8CC->unk6 = 0;
    unk8CC->unk0 = gUnknown_080D5964[unk8CC->unk4][0];
    unk8CC->unk2 = gUnknown_080D5964[unk8CC->unk4][1];

    gUnknown_03005440 = gUnknown_080D5964[unk8CC->unk4][0];
    gUnknown_030054BC = gUnknown_080D5964[unk8CC->unk4][1];

    if (bossNum != 0) {
        s32 x, y;
        Cheese *cheese;
        Player_DisableInputAndBossTimer();

        gPlayer.speedGroundX = 0x500;

        // ???
        x = gUnknown_080D87E6[bossNum - 1][0] - I(gPlayer.x);
        y = gUnknown_080D87E6[bossNum][1] - I(gPlayer.y);
        gPlayer.x += Q(x);
        gPlayer.y += Q(y);

        gCamera.x += x - 0x78;
        gCamera.y += y - 0x78;

        gCamera.unk20 += x - 0x78;
        gCamera.unk24 += y - 0x78;
        gCamera.unk10 += x - 0x78;
        gCamera.unk14 += y - 0x78;

        cheese = gCheese;
        if (cheese != NULL) {
            cheese->posX += Q(x);
            cheese->posY += Q(y);
        }
        unk8CC->unk4--;
    }
}

extern const s32 gUnknown_080D8808[][2];

void sub_80499D8(void)
{
    UNK_80498CC *unk8CC = TASK_DATA(gCurTask);
#ifndef NON_MATCHING
    register s32 r5 asm("r5");
    register s32 r1 asm("r1");
    register s32 r0 asm("r0");
    register s32 r6 asm("r6");
#else
    s32 r5, r1, r0, r6;
#endif
    s32 r4;

    if (unk8CC->unk4 <= 6) {
        if (unk8CC->unk4 == 6) {
            gUnknown_03005440 = gUnknown_080D5964[7][0];
            gUnknown_030054BC = gUnknown_080D5964[7][1];
            if (gPlayer.x < Q(42960) && gPlayer.x > Q(gUnknown_080D8808[6][0] + 0x1E)) {
                gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
                gPlayer.speedGroundX = 0x500;
                gPlayer.unk5E = 0;
                gPlayer.unk5C = 0;
                gPlayer.rotation = 0;
                if (I(gPlayer.x) - 0x78 != gCamera.x) {
                    if (I(gPlayer.x) - 0x78 > gCamera.x) {
                        gCamera.unk20++;
                        gCamera.x++;
                        gCamera.unk10++;
                    } else {
                        gCamera.unk20--;
                        gCamera.x--;
                        gCamera.unk10--;
                    }
                }
            } else if (gPlayer.x < Q(42700)
                       && gPlayer.x > Q(gUnknown_080D8808[6][0] + 0x14)) {
                if (gActiveBossTask == NULL && !(gStageFlags & 0x100)) {
                    gPlayer.checkpointTime = gCourseTime;
                    CreateZoneBoss(7);
                    gStageFlags &= ~EXTRA_STATE__2;
                }
            } else {
                r5 = gPlayer.x;
                if (r5 > Q(42960)) {
                    gPlayer.moveState &= ~MOVESTATE_8000000;
                    gPlayer.speedGroundX = 0;
                    gPlayer.transition = 1;
                    unk8CC->unk4++;
                    unk8CC->unk6 = 1;
                } else if (gActiveBossTask != NULL && r5 < Q(42300)) {
                    r1 = gUnknown_080D8808[unk8CC->unk4][0];
                    if (r1 >= 0) {
                        r0 = Q(r1);
                        if (r5 >= r0) {
                            r4 = gUnknown_080D8808[unk8CC->unk4][1];
                            r6 = Q(r4);
                            r0 = r5 + r6;
                            gPlayer.x = r0;
                            gUnknown_030054FC = r6;
                            sub_8039F50(r6, unk8CC->unk4);
                            gBossRingsShallRespawn = 1;
                            gCamera.x += r4;
                            gCamera.unk20 += r4;
                            gCamera.unk10 += r4;
                            if (gCheese != NULL) {
                                gCheese->posX += r6;
                            }
                        }
                    }
                }
            }
        } else if (unk8CC->unk4 <= 5) {
            if (gCamera.unk10 > gUnknown_080D87D8[unk8CC->unk4]) {
                gBossRingsShallRespawn = 1;
                gBossRingsRespawnCount = 10;
                gPlayer.checkpointTime = gCourseTime;
                CreateZoneBoss(++unk8CC->unk4);
                gStageFlags &= ~EXTRA_STATE__2;
            }

            if (gUnknown_080D8808[unk8CC->unk4][0] >= 0 && gActiveBossTask != NULL
                && gPlayer.x >= Q(gUnknown_080D8808[unk8CC->unk4][0])) {
                r4 = gUnknown_080D8808[unk8CC->unk4][1];
                r5 = Q(r4);
                gPlayer.x += r5;
                gUnknown_030054FC = r5;
                sub_8039F50(r5, unk8CC->unk4);
                gBossRingsShallRespawn = 1;
                gCamera.x += r4;
                gCamera.unk20 += r4;
                gCamera.unk10 += r4;
                if (gCheese != NULL) {
                    gCheese->posX += r5;
                }
            }
        }
    }

    if (unk8CC->unk5 < 7 && gCamera.unk10 > gUnknown_080D87D8[unk8CC->unk5] - 600) {
        if (unk8CC->unk5 == 6) {
            if (unk8CC->unk6 == 0) {
                gCamera.unkC = 1;
                gCamera.unk8 = 0x500;
            }
            gUnknown_030054B0 = 1;
        } else {
            unk8CC->unk5++;
        }
    }

    if (unk8CC->unk0 != gUnknown_080D5964[unk8CC->unk5][0]) {
        if (unk8CC->unk0 < gUnknown_080D5964[unk8CC->unk5][0]) {
            unk8CC->unk0++;
        } else {
            unk8CC->unk0--;
        }
    }

    if (unk8CC->unk2 != gUnknown_080D5964[unk8CC->unk5][1]) {
        if (unk8CC->unk2 < gUnknown_080D5964[unk8CC->unk5][1]) {
            unk8CC->unk2++;
        } else {
            unk8CC->unk2--;
        }
    }

    gUnknown_03005440 = unk8CC->unk0;
    gUnknown_030054BC = unk8CC->unk2;
}

void sub_8049D1C(struct Task *t) { }

typedef struct {
    /*  0x00 */ Vec2_32 qPos;
    /*  0x08 */ u8 livesCockpit;
} SuperEggRoboZ;
typedef struct {
    Sprite unk0[3][2];
    s32 unk120;
    s32 unk124[3][2];
    s32 unk13C[3][2];
    s16 unk154[3];
    u8 unk15A[3];
    u8 unk15D;
    u8 unk15E;
    u8 unk15F;
    SuperEggRoboZ *unk160;
} UNK_8049D20; /* 0x164 */

void sub_8049E90(void);
void sub_804A6B4(struct Task *);

typedef void (*UNK_8049D20Callback)(UNK_8049D20 *, u8);

extern const UNK_8049D20Callback gUnknown_080D8874[];
extern const s32 gUnknown_080D8840[][2];
extern const TileInfo gUnknown_080D8864[];

void sub_8049D20(s32 p1, SuperEggRoboZ *boss)
{
    u8 i, j;
    void *vrams[2];
    struct Task *t
        = TaskCreate(sub_8049E90, sizeof(UNK_8049D20), 0x4080, 0, sub_804A6B4);
    UNK_8049D20 *unkD20 = TASK_DATA(t);
    Sprite *s;

    unkD20->unk15D = 0;
    unkD20->unk120 = p1;
    unkD20->unk160 = boss;
    unkD20->unk15E = 0;
    unkD20->unk15F = 0;
    vrams[0] = VramMalloc(47);
    vrams[1] = vrams[0] + 0x1E0;

    for (i = 0; i < 3; i++) {
        unkD20->unk124[i][0] = Q(gUnknown_080D8840[i][0]);
        unkD20->unk124[i][1] = Q(gUnknown_080D8840[i][1]);
        unkD20->unk13C[i][0] = 0;
        unkD20->unk13C[i][1] = 0;
        unkD20->unk154[i] = (i + 2) * 300;
        unkD20->unk15A[i] = 0;
        for (j = 0; j < 2; j++) {
            s = &unkD20->unk0[i][j];
            s->x = 80;
            s->y = 80;
            s->graphics.dest = vrams[j];
            SPRITE_INIT_WITHOUT_VRAM(s, gUnknown_080D8864[j].anim,
                                     gUnknown_080D8864[j].variant, 28, 1, 0);
            UpdateSpriteAnimation(s);
        }
    }
}

void sub_8049E90(void)
{
    u8 i;
    UNK_8049D20 *unkD20 = TASK_DATA(gCurTask);
    if (gActiveBossTask == NULL) {
        TaskDestroy(gCurTask);
        return;
    }

    for (i = 0; i < 3; i++) {
        gUnknown_080D8874[unkD20->unk15A[i]](unkD20, i);
    }

    if (I(gPlayer.y) < 133) {
        sub_800CBA4(&gPlayer);
    }

    if (unkD20->unk15F == 0 && unkD20->unk160->livesCockpit == 0) {
        unkD20->unk15F = 1;
    }
}

extern const u8 gUnknown_080D8858[][2];
void sub_8049F1C(UNK_8049D20 *unkD20, u8 i)
{
    Sprite *s = &unkD20->unk0[i][0];
    Sprite *s2 = &unkD20->unk0[i][1];

    s32 preY = -unkD20->unk13C[i][1];

    Vec2_32 pos;
#ifndef NON_MATCHING
    register u8 *unk15F asm("r6") = &unkD20->unk15F;
#else
    u8 *unk15F = &unkD20->unk15F;
#endif
    if (*unk15F == 0) {
        unkD20->unk13C[i][1] = 0;
    }

    preY += unkD20->unk13C[i][1];

    pos.x = I(unkD20->unk124[i][0] + unkD20->unk13C[i][0]);
    pos.y = I(unkD20->unk124[i][1] + unkD20->unk13C[i][1]);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (*unk15F == 0) {

        if (--unkD20->unk154[i] == 0) {
            unkD20->unk154[i] = gUnknown_080D8858[unkD20->unk15A[i]][1];
            unkD20->unk15A[i] = gUnknown_080D8858[unkD20->unk15A[i]][0];
        }
    }

    if (gPlayer.moveState & MOVESTATE_8 && gPlayer.unk3C == s) {
        gPlayer.y += Q(1);
        gPlayer.y += preY;
        if (unkD20->unk15E == 1) {
            gPlayer.x += Q(1);
        }
    }

    if (!(gPlayer.moveState & MOVESTATE_400000)) {
        u32 result = sub_800CCB8(s, pos.x, pos.y, &gPlayer);

        if (result & 0x10000) {
            gPlayer.y += Q(result << 0x10) >> 0x10;
        }
    }

    DisplaySprite(s);
    s2->x = s->x;
    s2->y = s->y + 0x40;

    DisplaySprite(s2);
}
