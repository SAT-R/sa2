#include "main.h"
#include "game.h"
#include "true_area_53_intro.h"
#include "task.h"
#include "m4a.h"
#include "sprite.h"
#include "trig.h"
#include "constants/songs.h"

typedef struct {
    u8 unk0;
    u32 unk4;
    u32 unk8;
    u16 unkC;
    s8 unkE;
    s8 unkF;
    u8 unk10[32];
    s32 unk30[32][2];
    s16 unk130[32][2];
    u8 unk1B0;
    s32 unk1B4;
    s32 unk1B8;
    Sprite unk1BC;
    Sprite unk1EC[3];
} TrueArea53Intro; /* size 0x27C */

extern const s16 gUnknown_080D7830[][5];
extern const TileInfo gUnknown_080D7560[];

void sub_80392AC(void);
void sub_803986C(void);
void sub_8039A4C(void);

void CreateTrueArea53(void)
{
    u8 i;
    struct Task *t;
    TrueArea53Intro *intro;
    Sprite *sprite;
    gBldRegs.bldCnt = 0x3FFF;
    gBldRegs.bldAlpha = 0;
    gBldRegs.bldY = 0x10;

    t = TaskCreate(sub_80392AC, 0x27C, 0x7000, 0, NULL);
    intro = TaskGetStructPtr(t);
    intro->unk0 = 0;
    intro->unk4 = 0x172;
    intro->unk8 = 0xE8;
    intro->unkE = 0;
    intro->unkF = 0;

    for (i = 0; i < 32; i++) {
        intro->unk10[i] = 1;
        intro->unk30[i][0] = gUnknown_080D7830[i][0] << 8;
        intro->unk30[i][1] = gUnknown_080D7830[i][1] << 8;
        intro->unk130[i][0] = 0;
        intro->unk130[i][1] = 0;
    }

    intro->unk1B0 = 1;
    intro->unk1B4 = 0x6400;
    intro->unk1B8 = 0xB400;

    sprite = &intro->unk1BC;
    sprite->x = 0;
    sprite->y = 0;
    sprite->graphics.dest = (void *)gUnknown_080D7560[0].numTiles;
    sprite->graphics.anim = gUnknown_080D7560[4].anim;
    sprite->variant = gUnknown_080D7560[4].variant;
    sprite->unk1A = 0x100;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 5;
    sprite->unk10 = 0x400;

    for (i = 0; i < 3; i++) {
        sprite = &intro->unk1EC[i];
        sprite->x = 0;
        sprite->y = 0;
        sprite->graphics.dest = (void *)gUnknown_080D7560[i + 1].numTiles;
        sprite->graphics.anim = gUnknown_080D7560[i + 1].anim;
        sprite->variant = gUnknown_080D7560[i + 1].variant;
        sprite->unk1A = 0x100;
        sprite->graphics.size = 0;
        sprite->unk14 = 0;
        sprite->unk1C = 0;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        sprite->focused = i + 1;
        sprite->unk28[0].unk0 = -1;
        sprite->unk10 = 0;
    }

    sub_803986C();
    sub_8039A4C();
    m4aSongNumStart(MUS_EXTRA_DEMO_1);
}

typedef struct {
    u8 unk0[8];
    u16 unk8[7];
    u32 unk18[7];
    u32 unk34;
    Sprite unk38[7];
    Background background;
} UNK_8036E08;

void sub_8036EF8(void);

void sub_8036E08(void)
{
    u8 i;
    Background *background;
    Sprite *sprite;

    struct Task *t = TaskCreate(sub_8036EF8, 0x1C8, 0x7000, 0, NULL);
    UNK_8036E08 *unkE08 = TaskGetStructPtr(t);
    unkE08->unk34 = 32;

    background = &unkE08->background;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(16);
    background->graphics.anim = 0;
    background->unkC = BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x17B;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 9;
    background->unk24 = 1;
    background->unk26 = 0xD;
    background->unk28 = 0x12;
    background->unk2A = 0;
    background->unk2E = 2;

    for (i = 0; i < 7; i++) {
        unkE08->unk8[i] = 0;
        unkE08->unk18[i] = 0xB400;
        sprite = &unkE08->unk38[i];
        sprite->x = 0;
        sprite->y = 0;
        sprite->graphics.dest = (void *)OBJ_VRAM0 + 0x3000 + (i * 0x200);
        sprite->graphics.anim = 0x345;
        sprite->variant = i;
        sprite->unk21 = 0xFF;
        sprite->unk1A = 0x500;
        sprite->graphics.size = 0;
        sprite->unk14 = 0;
        sprite->unk1C = 0;
        sprite->unk22 = 0x10;
        sprite->focused = 0;
        sprite->unk10 = 0;
    }
}

void sub_8036FE4(void);

void sub_8036EF8(void)
{
    u8 i;
    s32 pos[2];
    s32 temp[2];
    Sprite *sprite;
    UNK_8036E08 *unkE08 = TaskGetStructPtr(gCurTask);

    for (i = 0; i < 7; i++) {
        sprite = &unkE08->unk38[i];
        unkE08->unk8[i] += 5;
        unkE08->unk18[i] += unkE08->unk8[i];

        temp[0] = ((unkE08->unk18[i] * (i + 0xF)) >> 9) & ONE_CYCLE;
        temp[1] = ((unkE08->unk18[i] * (i + 0xD)) >> 9) & ONE_CYCLE;

        pos[0] = (COS(temp[0]) * (0x20 - unkE08->unk34)) >> 0xE;
        pos[1] = (SIN(temp[1]) * (0x20 - unkE08->unk34)) >> 0x10;

        sprite->x = pos[0] + 0x78;
        sprite->y = pos[1] + 100;

        sub_8004558(sprite);
        sub_80051E8(sprite);
    }

    if (--unkE08->unk34 == 0) {
        unkE08->unk34 = 0x168;
        gCurTask->main = sub_8036FE4;
    };
}

void sub_80370C0(void);

void sub_8036FE4(void)
{
    u8 i;
    s32 pos[2];
    s32 temp[2];
    s32 temp2;
    Sprite *sprite;
    UNK_8036E08 *unkE08 = TaskGetStructPtr(gCurTask);

    for (i = 0; i < 7; i++) {
        sprite = &unkE08->unk38[i];
        unkE08->unk8[i] += 5;
        unkE08->unk18[i] += unkE08->unk8[i];

        temp[0] = ((unkE08->unk18[i] * (i + 0xF)) >> 9) & ONE_CYCLE;
        temp[1] = ((unkE08->unk18[i] * (i + 0xD)) >> 9) & ONE_CYCLE;

        temp2 = COS(temp[0]);
        pos[0] = (temp2 >> 9);

        temp2 = SIN(temp[1]);
        pos[1] = temp2 >> 0xB;

        sprite->x = pos[0] + 0x78;
        sprite->y = pos[1] + 100;

        sub_8004558(sprite);
        sub_80051E8(sprite);
    }

    if (--unkE08->unk34 == 0) {
        unkE08->unk34 = 0x20;
        gCurTask->main = sub_80370C0;
    };
}

void sub_8037254(void);

void sub_80370C0(void)
{
    u8 i;
    s32 pos[2];
    s32 temp[2];
    s32 temp2;
    Sprite *sprite;
    UNK_8036E08 *unkE08 = TaskGetStructPtr(gCurTask);

    if (--unkE08->unk34 == 0) {
        unkE08->unk34 = 0x78;
        gBgCntRegs[2] = 0x1C08;
        gBldRegs.bldY = 0x10;
        gDispCnt = 0x40;
        gDispCnt |= 0x5500;
        gBgScrollRegs[1][0] = 0;
        gBgScrollRegs[1][1] = 0;
        gBgScrollRegs[2][0] = 0;
        gBgScrollRegs[2][1] = 0;

        gUnknown_03004D80[2] = 0;
        gUnknown_03002280[2][0] = 0;
        gUnknown_03002280[2][1] = 0;
        gUnknown_03002280[2][2] = 0xff;
        gUnknown_03002280[2][3] = 0x14;

        sub_8002A3C(&unkE08->background);
        gCurTask->main = sub_8037254;
        return;
    }

    if (unkE08->unk34 < 0x10) {
        gDispCnt |= 0x4000;
        gBldRegs.bldCnt = 0xBF;
        gBldRegs.bldY = 0x10 - unkE08->unk34;
        gWinRegs[1] = 0xF0;
        gWinRegs[3] = 0xA0;
        gWinRegs[4] = 0xFF00;
        gWinRegs[5] = 0xFF;
    }

    for (i = 0; i < 7; i++) {
        sprite = &unkE08->unk38[i];
        unkE08->unk8[i] += 5;
        unkE08->unk18[i] += unkE08->unk8[i];

        temp[0] = ((unkE08->unk18[i] * (i + 0xF)) >> 9) & ONE_CYCLE;
        temp[1] = ((unkE08->unk18[i] * (i + 0xD)) >> 9) & ONE_CYCLE;

        pos[0] = (unkE08->unk34 * COS(temp[0])) >> 0xE;
        pos[1] = (unkE08->unk34 * SIN(temp[1])) >> 0x10;

        sprite->x = pos[0] + 0x78;
        sprite->y = pos[1] + 100;

        sub_8004558(sprite);
        sub_80051E8(sprite);
    }
}

void sub_8037254(void)
{
    UNK_8036E08 *unkE08 = TaskGetStructPtr(gCurTask);

    if (--unkE08->unk34 == 0) {
        gDispCnt = 0x1140;
        gBgCntRegs[2] = 0x1C0B;
        TaskDestroy(gCurTask);
        return;
    }

    if (unkE08->unk34 < 0x75 && gBldRegs.bldY != 0) {
        gBldRegs.bldCnt = 0xbf;
        gBldRegs.bldY--;
        gWinRegs[1] = 0xf0;
        gWinRegs[3] = 0xa0;
        gWinRegs[4] = 0xff00;
        gWinRegs[5] = 0xff;
    }
}

typedef struct {
    u16 unk0;
    u32 unk4;
    s32 unk8;
    s16 unkC;
    s16 unkE;
    Sprite unk10;
} UNK_80372C8;

void sub_80373CC(void);

extern const TileInfo gUnknown_080D7540[];

void sub_80372C8(s32 a, s32 b)
{
    Sprite *sprite;
    struct Task *t = TaskCreate(sub_80373CC, 0x40, 0x7000, 0, NULL);
    u32 id = (PseudoRandom32() & 1) + 2;
    UNK_80372C8 *unk2C8 = TaskGetStructPtr(t);
    unk2C8->unk0 = 0x28;

    unk2C8->unk4 = a + (s16)(((PseudoRandom32() & 0x1F) - 0x10) << 8);
    unk2C8->unk8 = b + (s16)(((PseudoRandom32() & 0x1F) - 0x10) << 8);
    unk2C8->unkC = 0;
    unk2C8->unkE = 0;

    sprite = &unk2C8->unk10;
    sprite->x = 0;
    sprite->y = 0;
    sprite->graphics.dest = (void *)gUnknown_080D7540[id].numTiles;
    sprite->graphics.anim = gUnknown_080D7540[id].anim;
    sprite->variant = gUnknown_080D7540[id].variant;
    sprite->unk21 = 0xFF;
    sprite->unk1A = 0x100;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk22 = 0x20;
    sprite->focused = 0;
    sprite->unk10 = 0x1000;
}

void sub_80373CC(void)
{
    s32 unk4, unkC;
    Sprite *sprite;
    UNK_80372C8 *unk2C8 = TaskGetStructPtr(gCurTask);
    sprite = &unk2C8->unk10;

    unk2C8->unkE += 0x10;
    unkC = unk2C8->unkC;
    unk4 = unk2C8->unk4;
    unk2C8->unk4 += unk2C8->unkC;

    unk2C8->unk8 += unk2C8->unkE;

    if (--unk2C8->unk0 == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    sprite->x = (unk4 + unkC) >> 8;
    sprite->y = (unk2C8->unk8 >> 8) - gCamera.y;

    sub_8004558(sprite);
    sub_80051E8(sprite);
}

typedef struct {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    s32 unk4;
    s32 unk8;
    s32 unkC;
    s16 unk10;
    s16 unk12;
    Sprite unk14;
    Sprite unk44;
} UNK_8037438;

extern const TaskMain gUnknown_080D7970[];

extern const u16 gUnknown_080D7704[][17];
extern const u32 gUnknown_080D77D0[][4];
extern const TileInfo *gUnknown_080D76F0[];
extern const TileInfo gUnknown_080D7540[];
extern const s8 gUnknown_080D7984[];

void sub_8037438(u8 p1)
{
    Sprite *sprite;
    const TileInfo *tileInfo;
    struct Task *t = TaskCreate(gUnknown_080D7970[p1], 0x74, 0x7000, 0, NULL);
    UNK_8037438 *unk438 = TaskGetStructPtr(t);
    unk438->unk0 = p1;
    unk438->unk1 = 0;
    unk438->unk2 = gUnknown_080D7704[unk438->unk0][0];
    unk438->unk8 = gUnknown_080D77D0[unk438->unk0][0];
    unk438->unkC = gUnknown_080D77D0[unk438->unk0][1];
    unk438->unk10 = gUnknown_080D77D0[unk438->unk0][2];
    unk438->unk12 = gUnknown_080D77D0[unk438->unk0][3];

    tileInfo = gUnknown_080D76F0[p1];
    sprite = &unk438->unk14;

    sprite->x = gUnknown_080D77D0[unk438->unk0][0] << 8;
    sprite->y = gUnknown_080D77D0[unk438->unk0][1] << 8;

    sprite->graphics.dest = (void *)tileInfo->numTiles;
    sprite->graphics.anim = tileInfo->anim;
    sprite->variant = tileInfo->variant;
    sprite->unk21 = 0xFF;
    sprite->unk1A = (0x10 - gUnknown_080D7984[p1]) * 0x40;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk22 = 0x20;
    if (p1 < 4) {
        sprite->focused = p1;
    } else {
        sprite->focused = 0;
    }

    sprite->unk10 = 0x1400;

    if (p1 < 4) {
        sprite = &unk438->unk44;
        sprite->x = 0;
        sprite->y = 0;

        sprite->graphics.dest = (void *)gUnknown_080D7540[p1].numTiles;
        sprite->graphics.anim = gUnknown_080D7540[p1].anim;
        sprite->variant = gUnknown_080D7540[p1].variant;
        sprite->unk21 = 0xFF;
        sprite->unk1A = 0x400;
        sprite->graphics.size = 0;
        sprite->unk14 = 0;
        sprite->unk1C = 0;
        sprite->unk22 = 0x10;
        sprite->focused = 0;
        sprite->unk10 = 0x1000;
    }
}

void sub_8037674(void);

void sub_80375B4(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];

        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        gCurTask->main = sub_8037674;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}
void sub_8037744(void);

void sub_8037674(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    // Only difference
    unk438->unk10 -= 0x20;
    if (unk438->unk10 < 0) {
        unk438->unk10 = 0;
    }

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];

        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        gCurTask->main = sub_8037744;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8037818(void);

void sub_8037744(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    // Only difference
    unk438->unk10 -= 0x20;
    if (unk438->unk10 < 0) {
        unk438->unk10 = 0;
    }

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk10 = 0;
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];

        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        gCurTask->main = sub_8037818;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_80378BC(void);

void sub_8037818(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_80378BC;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_803796C(void);

void sub_80378BC(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        unk438->unk4 = 0;
        gCurTask->main = sub_803796C;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8037A38(void);

void sub_803796C(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    if (unk438->unk2 < 0x135) {
        if (unk438->unk2 == 0xF0) {
            sub_8036E08();
            m4aSongNumStart(MUS_EXTRA_DEMO_2);
        }

        if ((unk438->unkC >> 8) > 0x9C) {
            unk438->unkC -= 0x18;
        }
    }

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        gCurTask->main = sub_8037A38;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8037B04(void);

void sub_8037A38(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    if (!(unk438->unk2 & 7)) {
        sprite->unk22++;
    }

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        m4aSongNumStart(SE_114);
        gCurTask->main = sub_8037B04;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8037BD0(void);

void sub_8037B04(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;
    unk438->unkC -= SIN(((++unk438->unk4) * 5) & 0x3FF) >> 8;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8037BD0;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8037CEC(void);

void sub_8037BD0(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;
    unk438->unkC -= SIN(((++unk438->unk4) * 5) & 0x3FF) >> 8;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8037CEC;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    sprite = &unk438->unk44;
    sprite->x = unk438->unk8 >> 8;
    sprite->y = 0xB2 - gCamera.y;
    sprite->unk10 &= ~0x400;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    sprite->unk10 |= 0x400;
    sub_80051E8(sprite);

    if (!(unk438->unk2 & 3)) {
        sub_80372C8(unk438->unk8, unk438->unkC);
    }
}

void sub_8037E08(void);

void sub_8037CEC(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;
    unk438->unkC -= SIN(((++unk438->unk4) * 5) & 0x3FF) >> 8;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8037E08;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    sprite = &unk438->unk44;
    sprite->x = unk438->unk8 >> 8;
    sprite->y = 0xB2 - gCamera.y;
    sprite->unk10 &= ~0x400;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    sprite->unk10 |= 0x400;
    sub_80051E8(sprite);

    if (!(unk438->unk2 & 3)) {
        sub_80372C8(unk438->unk8, unk438->unkC);
    }
}

void sub_8037F68(void);

void sub_8037E08(void)
{
    Sprite *sprite, *sprite2;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;
    sprite2 = &unk438->unk44;
    unk438->unkC -= SIN(((++unk438->unk4) * 5) & 0x3FF) >> 8;

    if (--unk438->unk2 == 0) {
        gBldRegs.bldY = 0;
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;

        sprite2->graphics.dest = (void *)gUnknown_080D7540[1].numTiles;
        sprite2->graphics.anim = gUnknown_080D7540[1].anim;
        sprite2->variant = gUnknown_080D7540[1].variant;
        sprite2->unk21 = 0xFF;

        gCurTask->main = sub_8037F68;

        m4aSongNumStop(SE_114);
        m4aSongNumStart(SE_221);
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    sprite = &unk438->unk44;
    sprite->x = unk438->unk8 >> 8;
    sprite->y = 0xB2 - gCamera.y;
    sprite->unk10 &= ~0x400;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    sprite->unk10 |= 0x400;
    sub_80051E8(sprite);

    if (!(unk438->unk2 & 3)) {
        sub_80372C8(unk438->unk8, unk438->unkC);
    }
}

void sub_8037F68(void)
{
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;
    if (unk438->unkC > -0x2000) {
        unk438->unkC -= 0x800;
    }

    gDispCnt |= 0x4000;
    gBldRegs.bldCnt = 0xFF;
    gWinRegs[1] = 0xf0;
    gWinRegs[3] = 0xa0;
    gWinRegs[4] = 0xff00;
    gWinRegs[5] = 0xff;

    if (unk438->unk2 == 0) {
        if (gBldRegs.bldY == 0x10) {
            // exit to stage
            TasksDestroyAll();
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
            gGameMode = GAME_MODE_SINGLE_PLAYER;
            gSelectedCharacter = CHARACTER_SONIC;
            gCurrentLevel = LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53);
            ApplyGameStageSettings();
            GameStageStart();
            return;
        }

        gBldRegs.bldY++;
    } else {
        unk438->unk2--;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    if (unk438->unk2 > 0x99) {
        sprite = &unk438->unk44;
        sprite->x = unk438->unk8 >> 8;
        sprite->y = 0xB2 - gCamera.y;
        sprite->unk10 &= ~0x400;
        sub_8004558(sprite);
        sub_80051E8(sprite);

        sprite->unk10 |= 0x400;
        sub_80051E8(sprite);
    }

    if (!(unk438->unk2 & 3)) {
        sub_80372C8(unk438->unk8, unk438->unkC);
    }
}

void sub_8038168(void);

void sub_80380B0(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8038168;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8038238(void);

void sub_8038168(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    unk438->unk10 -= 0x20;

    if (unk438->unk10 < 0) {
        unk438->unk10 = 0;
    }

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        gCurTask->main = sub_8038238;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_80382F0(void);

void sub_8038238(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_80382F0;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_80383B8(void);

void sub_80382F0(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    unk438->unk10 -= 0x20;

    if (unk438->unk10 < 0) {
        unk438->unk10 = 0;
    }

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_80383B8;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_803845C(void);

void sub_80383B8(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_803845C;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8038500(void);

void sub_803845C(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8038500;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_803997C(void);

void sub_8038500(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_803997C;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8038664(void);

void sub_80385A4(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        gCurTask->main = sub_8038664;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_803872C(void);

void sub_8038664(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    unk438->unk10 -= 0x20;

    if (unk438->unk10 < 0) {
        unk438->unk10 = 0;
    }

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_803872C;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_80387F4(void);

void sub_803872C(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    unk438->unk10 -= 0x20;

    if (unk438->unk10 < 0) {
        unk438->unk10 = 0;
    }

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_80387F4;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8038898(void);

void sub_80387F4(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8038898;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_803893C(void);

void sub_8038898(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_803893C;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_80399A4(void);

void sub_803893C(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_80399A4;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8038AA0(void);

void sub_80389E0(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        gCurTask->main = sub_8038AA0;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8038B6C(void);

void sub_8038AA0(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    unk438->unk10 -= 0x20;

    if (unk438->unk10 < 0) {
        unk438->unk10 = 0;
    }

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk10 = 0;
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8038B6C;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8038C34(void);

void sub_8038B6C(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    unk438->unk10 -= 0x20;

    if (unk438->unk10 < 0) {
        unk438->unk10 = 0;
    }

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8038C34;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8038CD8(void);

void sub_8038C34(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8038CD8;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8038D7C(void);

void sub_8038CD8(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8038D7C;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_80399CC(void);

void sub_8038D7C(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_80399CC;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8038EE4(void);

void sub_8038E20(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    sprite->unk22 = 0x10;

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8038EE4;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8038FBC(void);

void sub_8038EE4(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    unk438->unk10 -= 0x20;

    if (unk438->unk10 < 0) {
        unk438->unk10 = 0;
    }

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unkC -= 0x200;
        unk438->unk10 = 0;
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8038FBC;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8039084(void);

void sub_8038FBC(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    unk438->unk10 -= 0x20;

    if (unk438->unk10 < 0) {
        unk438->unk10 = 0;
    }

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8039084;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8039144(void);

void sub_8039084(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    if (unk438->unk8 < 0xB800) {
        unk438->unk8 += 0x80;
    } else {
        sprite->unk10 &= ~0x400;
    }

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8039144;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8039208(void);

void sub_8039144(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    if (unk438->unk8 < 0x9800) {
        unk438->unk8 += 0x40;
    }

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk10 &= ~0x400;
        gCurTask->main = sub_8039208;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8039A10(void);

void sub_8039208(void)
{
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8039A10;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_803959C(u8);
void sub_80393A4(void);
void sub_804CD50(void);

void sub_80392AC(void)
{
    TrueArea53Intro *intro = TaskGetStructPtr(gCurTask);

    if (!(gUnknown_03005590 & 3) && intro->unk0 < 0x2C) {
        intro->unk0++;
    }

    intro->unk8 += 2;
    gCamera.x = 0;
    gCamera.y = intro->unk0;
    gUnknown_03005590++;

    sub_803959C(0);

    if (intro->unk4 != 0x172) {
        if (--intro->unk4 == 0) {
            Sprite *sprite;
            intro->unk8 = 0x100;
            gCurTask->main = sub_80393A4;

            sprite = &intro->unk1BC;
            sprite->graphics.dest = (void *)gUnknown_080D7560[0].numTiles;
            sprite->graphics.anim = gUnknown_080D7560[0].anim;
            sprite->variant = gUnknown_080D7560[0].variant;
            sprite->unk10 = 0;
            sprite->unk21 = 0xFF;
        }

        if (intro->unk4 == 0x3C) {
            sub_804CD50();
        } else if (intro->unk4 < 0x3C) {
            intro->unkE = SIN(intro->unk4 & ONE_CYCLE) & 1;
            intro->unkF = SIN(intro->unk4 & ONE_CYCLE) & 1;
        }
    } else {
        if (gBldRegs.bldY != 0) {
            if ((gUnknown_03005590 & 3) == 0) {
                gBldRegs.bldY--;
            }
        } else {
            intro->unk4--;
        }
    }
}

void sub_8050B2C(s32 *, s32 *);
s32 sub_8085698(s32, s32, s32, s32, u8);

void sub_8037438(u8);

extern const u8 gUnknown_080D7838[][10];

void sub_80393A4(void)
{
    s32 temp1, temp2;
    u8 i;
    TrueArea53Intro *intro = TaskGetStructPtr(gCurTask);

    intro->unk8++;
    gUnknown_03005590++;
    gUnknown_030054B8 = 0;

    intro->unk4 += 7;
    if (intro->unk4 > 0xFA) {
        sub_8050B2C(&temp1, &temp2);
        temp1 += 0x1400;
        temp2 += 0x400;

        for (i = 0; i < 0x20; i++) {
            if (intro->unk10[i] != 0) {
#ifndef NON_MATCHING
                UNUSED s32 unused = 8 * i;
                do {
#endif
                    intro->unk30[i][0]
                        = sub_8085698(intro->unk30[i][0], temp1, intro->unk4, 10,
                                      gUnknown_080D7838[i][0] + 2);
#ifndef NON_MATCHING
                } while (0);
#endif
                intro->unk30[i][1] = sub_8085698(intro->unk30[i][1], temp2, intro->unk4,
                                                 10, gUnknown_080D7838[i][0] + 2);

                intro->unk130[i][0] -= (intro->unk130[i][0] >> 3);
                intro->unk130[i][1] -= (intro->unk130[i][1] >> 3);

                if ((intro->unk30[i][0] + 0x800) > temp1) {
                    intro->unk10[i] = 0;
                }
            }
        }
        if (intro->unk1B0 > 0) {
            m4aSongNumStartOrContinue(SE_270);
            intro->unk1B4 = sub_8085698(0x6400, temp1, intro->unk4 + 0x20, 10, 3);
            intro->unk1B8 = sub_8085698(0xB400, temp2, intro->unk4 + 0x60, 10, 3);

            if ((intro->unk1B4 + 0x800) > temp1) {
                intro->unk1B0 = 0;
                m4aMPlayFadeOutTemporarily(&gMPlayInfo_SE2, 4);
            }
        }
    }

    if (intro->unk4 < 0xAF0) {
        intro->unkE = SIN(intro->unk4 & ONE_CYCLE) & 1;
        intro->unkF = SIN(intro->unk4 & ONE_CYCLE) & 1;
    } else {
        if (intro->unk4 > 3000) {
            sub_8037438(0);
            sub_8037438(1);
            sub_8037438(2);
            sub_8037438(3);
            sub_8037438(4);
            m4aSongNumStop(SE_270);
            TaskDestroy(gCurTask);
            return;
        }
        intro->unkE = 0;
        intro->unkF = 0;
    }

    sub_803959C(1);
}

// https://decomp.me/scratch/p7edf
// void sub_803959C(u8 p1)
// {
//     u8 i;
//     s32 temp1, temp2;
//     Sprite *sprite;
//     TrueArea53Intro *intro = TaskGetStructPtr(gCurTask);
//     gBgScrollRegs[0][1] = intro->unkF + intro->unk0;
//     gBgScrollRegs[1][1] = intro->unkF + intro->unk0;
//     gBgScrollRegs[0][0] = intro->unkE;
//     gBgScrollRegs[1][0] = intro->unkE;

//     sub_8004558(&intro->unk1EC[0]);
//     sub_8004558(&intro->unk1EC[1]);
//     sub_8004558(&intro->unk1EC[2]);

//     temp1 = (intro->unk8 * 5) & ONE_CYCLE;
//     temp2 = (intro->unk8 * 3) & ONE_CYCLE;

//     if (p1 != 0) {
//        for (i = 0; i < 32; i++) {
//             if (intro->unk10[i] != 0) {
//                 sprite = &intro->unk1EC[gUnknown_080D7838[i][0]];

//                 intro->unk30[i][0] += intro->unk130[i][0];
//                 intro->unk30[i][1] += intro->unk130[i][1];

//                 intro->unk130[i][0] -= 0x28;
//                 intro->unk130[i][1] -= 0x10;

//                 sprite->x = intro->unk30[i][0] >> 8;
//                 sprite->y = (intro->unk30[i][1] >> 8) - intro->unk0;
//                 sprite->unk10 &= ~0x400;
//                 sub_80051E8(sprite);
//             }
//         }
//     } else {
//          for (i = 0; i < 32; i++) {
//             s32 unk30, unk34;
//              s32 sin, cos;
//             // temp1 &= ONE_CYCLE;
//             // temp2 &= ONE_CYCLE;
//             sprite = &intro->unk1EC[gUnknown_080D7838[i][0]];
//             unk30 = intro->unk30[i][0];
//             unk34 = intro->unk30[i][1];

//             intro->unk30[i][0] = (COS(temp2) * gUnknown_080D7830[i][2]) >> 4;
//             intro->unk30[i][0] += gUnknown_080D7830[i][0] * 0x100;

//             intro->unk30[i][1] = (SIN(temp1) * gUnknown_080D7830[i][3]) >> 4;
//             intro->unk30[i][1] += gUnknown_080D7830[i][1] * 0x100;

//             intro->unk130[i][0] = (intro->unk30[i][0] - unk30);
//             intro->unk130[i][1] = (intro->unk30[i][1] - unk34);

//             sprite->x = intro->unk30[i][0] >> 8;
//             sprite->y = (intro->unk30[i][1] >> 8) - intro->unk0;

//             if (intro->unk130[i][0] < 0) {
//                 sprite->unk10 &= 0x400;
//             } else {
//                 sprite->unk10 |= 0x400;
//             }

//             sub_80051E8(sprite);
//             temp2 = (temp2 - 0x40);
//             temp1 = (temp1 - 0x40);
//         }
//     }

//     if (intro->unk1B0 != 0) {
//         sprite = &intro->unk1BC;
//         sprite->x = intro->unk1B4 >> 8;
//         sprite->y = ((intro->unk1B8 >> 8) - intro->unk0) + intro->unkF;

//         sub_8004558(sprite);
//         sub_80051E8(sprite);
//     }
// }
