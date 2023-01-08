#include "main.h"
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
    u8 unkE;
    u8 unkF;
    u8 unk10[32];
    u32 unk30[32][2];
    u16 unk130[32][2];
    u8 unk1B0;
    u32 unk1B4;
    u32 unk1B8;
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
