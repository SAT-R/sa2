#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/collision.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/boss_results_transition.h"
#include "game/stage/terrain_collision.h"

#include "game/bosses/boss_7.h"
#include "game/bosses/common.h"
#include "game/bosses/eggmobile_escape_sequence.h"

#include "game/player_callbacks.h"

#include "game/cheese.h"

#include "game/math.h"

#include "lib/m4a/m4a.h"

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
    const u16 *const *unk60; // gUnknown_080D859C
    u8 unk64;
    u8 unk65;
    u8 unk66;
    Sprite unk68;
    Sprite unk98[5];
    Sprite unk188[2];
    void *unk1E8;
} EggFrog; /* 0x1EC */

typedef struct {
    s32 x;
    s32 y;
    s16 speedX;
    s16 speedY;
    u8 gravityInverted;
    u8 unkD;
    EggFrog *boss;
    Sprite s;
} EggFrogBomb; /* size: 0x44 */

typedef struct {
    u16 unk0;
    u8 unk2;
    u8 unk3;
} UNK_80D8710;

static void Task_EggFrogMain(void);
static void TaskDestructor_EggFrogMain(struct Task *);

typedef void (*EggFrogCallback)(EggFrog *);

static void sub_8048408(EggFrog *);
static void sub_80492B8(EggFrog *);
static void sub_8048858(EggFrog *);
static void sub_8048E64(EggFrog *);
static void Render(EggFrog *);
static void sub_804931C(EggFrog *);

static void sub_8047F0C(void);

static void sub_8048654(EggFrog *);
static void sub_8048F44(void);
static void sub_8048D78(EggFrog *);
static void sub_804928C(EggFrog *);
bool8 sub_8048C7C(EggFrog *);
static void sub_80493F8(EggFrog *, s32 x, s32 y, u8);
static void sub_804920C(EggFrog *);
static void sub_80494EC(void);

static void sub_8049658(void);
static void sub_80496FC(EggFrog *, s32, s32, u8);
static void Task_80497E0(void);

static void sub_8048F7C(EggFrog *);
static void sub_8048FA4(EggFrog *);
static void sub_804893C(EggFrog *);
static void sub_80489B0(EggFrog *);
static void sub_8048A4C(EggFrog *);
static void sub_8048FF4(EggFrog *);
static void sub_804904C(EggFrog *);
static void sub_804909C(EggFrog *);
static void sub_80490C4(EggFrog *);
static void sub_8048AD8(EggFrog *);
static void sub_8048B50(EggFrog *);
static void sub_8048BF0(EggFrog *);
static void sub_804911C(EggFrog *);
static void sub_8049174(EggFrog *);
static void sub_80491C4(EggFrog *);

static const TileInfo gUnknown_080D8108[] = {
    { 12, SA2_ANIM_EGG_FROG_WHEELS, 0 },     { 4, SA2_ANIM_EGG_FROG_ARM_SEGMENT, 0 }, { 12, SA2_ANIM_EGG_FROG_WHEELS, 0 },
    { 4, SA2_ANIM_EGG_FROG_ARM_SEGMENT, 0 }, { 4, SA2_ANIM_EGG_FROG_ARM_SEGMENT, 1 }, { 4, SA2_ANIM_EGG_FROG_ARM_SEGMENT, 2 },
    { 4, SA2_ANIM_EGG_FROG_ARM_SEGMENT, 3 }, { 4, SA2_ANIM_EGG_FROG_ARM_SEGMENT, 4 },
};

static const s8 gUnknown_080D8148[] = { 13, 243 };

const s8 gUnknown_080D814A[] = { 32, -32 };

const u16 gUnknown_080D814C[][12] = {
    { 1029, 1029, 1029, 1029, 1029, 1029, 1029, 1029, 1029, 1029, 1029, 0 },
    { 960, 864, 960, 864, 960, 864, 960, 864, 960, 864, 960, 0 },
    { 1056, 1400, 1056, 1400, 1056, 1400, 1056, 1400, 1056, 1400, 1056, 0 },
    { 512, 512, 512, 512, 512, 512, 512, 512, 512, 512, 512, 0 },
    { 576, 676, 576, 676, 576, 676, 576, 676, 576, 676, 576, 0 },
    { 480, 136, 480, 136, 480, 136, 480, 136, 480, 136, 480, 0 },
    { 960, 960, 960, 960, 960, 960, 960, 960, 960, 960, 960, 0 },
    { 1116, 1116, 1116, 1116, 1116, 1116, 1116, 1116, 1116, 1116, 1116, 0 },
    { 576, 576, 576, 576, 576, 576, 576, 576, 576, 576, 576, 0 },
    { 420, 420, 420, 420, 420, 420, 420, 420, 420, 420, 420, 0 },
    { 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 0 },
    { 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 0 },
    { 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0 },
    { 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0 },
    { 896, 896, 896, 896, 896, 896, 896, 896, 896, 896, 896, 0 },
    { 1333, 1333, 1333, 1333, 1333, 1333, 1333, 1333, 1333, 1333, 1333, 0 },
    { 640, 640, 640, 640, 640, 640, 640, 640, 640, 640, 640, 0 },
    { 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 0 },
    { 896, 896, 896, 896, 896, 896, 896, 896, 896, 896, 896, 0 },
    { 1333, 1333, 1333, 1333, 1333, 1333, 1333, 1333, 1333, 1333, 1333, 0 },
    { 640, 640, 640, 640, 640, 640, 640, 640, 640, 640, 640, 0 },
    { 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 205, 0 },
    { 1088, 1184, 1088, 1184, 1088, 1184, 1088, 1184, 1088, 1184, 1088, 0 },
    { 992, 648, 992, 648, 992, 648, 992, 648, 992, 648, 992, 0 },
    { 448, 348, 448, 348, 448, 348, 448, 348, 448, 348, 448, 0 },
    { 544, 888, 544, 888, 544, 888, 544, 888, 544, 888, 544, 0 },
    { 768, 768, 768, 768, 768, 768, 768, 768, 768, 768, 768, 0 },
    { 768, 768, 768, 768, 768, 768, 768, 768, 768, 768, 768, 0 },
    { 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 0 },
    { 715, 715, 715, 715, 715, 715, 715, 715, 715, 715, 715, 0 },
    { 384, 384, 384, 384, 384, 384, 384, 384, 384, 384, 384, 0 },
    { 819, 819, 819, 819, 819, 819, 819, 819, 819, 819, 819, 0 },
    { 1088, 1088, 1088, 1088, 1088, 1088, 1088, 1088, 1088, 1088, 1088, 0 },
    { 992, 992, 992, 992, 992, 992, 992, 992, 992, 992, 992, 0 },
    { 448, 448, 448, 448, 448, 448, 448, 448, 448, 448, 448, 0 },
    { 544, 544, 544, 544, 544, 544, 544, 544, 544, 544, 544, 0 },
    { 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 0 },
    { 715, 715, 715, 715, 715, 715, 715, 715, 715, 715, 715, 0 },
    { 384, 384, 384, 384, 384, 384, 384, 384, 384, 384, 384, 0 },
    { 819, 819, 819, 819, 819, 819, 819, 819, 819, 819, 819, 0 },
    { 768, 768, 768, 768, 768, 768, 768, 768, 768, 768, 768, 0 },
    { 768, 768, 768, 768, 768, 768, 768, 768, 768, 768, 768, 0 },
    { 768, 768, 768, 768, 768, 768, 768, 768, 768, 768, 768, 0 },
    { 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0 },
    { 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0 },
    { 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 256, 0 },
};

const u16 *const gUnknown_080D859C[][6] = {
    { gUnknown_080D814C[40], gUnknown_080D814C[41], gUnknown_080D814C[42], gUnknown_080D814C[43], gUnknown_080D814C[44],
      gUnknown_080D814C[45] },

    { gUnknown_080D814C[0], gUnknown_080D814C[1], gUnknown_080D814C[2], gUnknown_080D814C[3], gUnknown_080D814C[4], gUnknown_080D814C[5] },

    { gUnknown_080D814C[0], gUnknown_080D814C[14], gUnknown_080D814C[15], gUnknown_080D814C[3], gUnknown_080D814C[16],
      gUnknown_080D814C[17] },

    { gUnknown_080D814C[0], gUnknown_080D814C[18], gUnknown_080D814C[19], gUnknown_080D814C[3], gUnknown_080D814C[20],
      gUnknown_080D814C[21] },

    { gUnknown_080D814C[0], gUnknown_080D814C[10], gUnknown_080D814C[11], gUnknown_080D814C[3], gUnknown_080D814C[12],
      gUnknown_080D814C[13] },

    { gUnknown_080D814C[0], gUnknown_080D814C[22], gUnknown_080D814C[23], gUnknown_080D814C[3], gUnknown_080D814C[24],
      gUnknown_080D814C[25] },

    { gUnknown_080D814C[0], gUnknown_080D814C[6], gUnknown_080D814C[7], gUnknown_080D814C[3], gUnknown_080D814C[8], gUnknown_080D814C[9] },

    { gUnknown_080D814C[0], gUnknown_080D814C[22], gUnknown_080D814C[23], gUnknown_080D814C[3], gUnknown_080D814C[24],
      gUnknown_080D814C[25] },

    { gUnknown_080D814C[0], gUnknown_080D814C[28], gUnknown_080D814C[29], gUnknown_080D814C[3], gUnknown_080D814C[30],
      gUnknown_080D814C[31] },

    { gUnknown_080D814C[0], gUnknown_080D814C[26], gUnknown_080D814C[26], gUnknown_080D814C[3], gUnknown_080D814C[27],
      gUnknown_080D814C[27] },

    { gUnknown_080D814C[0], gUnknown_080D814C[1], gUnknown_080D814C[2], gUnknown_080D814C[3], gUnknown_080D814C[4], gUnknown_080D814C[5] },

    { gUnknown_080D814C[0], gUnknown_080D814C[32], gUnknown_080D814C[33], gUnknown_080D814C[3], gUnknown_080D814C[34],
      gUnknown_080D814C[35] },

    { gUnknown_080D814C[0], gUnknown_080D814C[36], gUnknown_080D814C[37], gUnknown_080D814C[3], gUnknown_080D814C[38],
      gUnknown_080D814C[39] },
};

const u16 *const *const gUnknown_080D86D4[] = {
    gUnknown_080D859C[1],  gUnknown_080D859C[2],  gUnknown_080D859C[4], gUnknown_080D859C[5],  gUnknown_080D859C[6],
    gUnknown_080D859C[7],  gUnknown_080D859C[3],  gUnknown_080D859C[7], gUnknown_080D859C[8],  gUnknown_080D859C[9],
    gUnknown_080D859C[10], gUnknown_080D859C[11], gUnknown_080D859C[1], gUnknown_080D859C[12], gUnknown_080D859C[0],
};

const UNK_80D8710 gUnknown_080D8710[] = {
    { 64, 0, 0 },  { 128, 0, 1 }, { 512, 0, 1 }, { 256, 1, 1 }, { 256, 0, 1 }, { 256, 1, 1 }, { 128, 0, 1 }, { 64, 1, 0 },
    { 128, 1, 1 }, { 512, 1, 1 }, { 256, 0, 1 }, { 256, 1, 1 }, { 256, 0, 1 }, { 128, 1, 1 }, { 256, 0, 0 },
};

const EggFrogCallback gUnknown_080D874C[] = {
    sub_8048F7C, sub_8048FA4, sub_804893C, sub_80489B0, sub_8048A4C, sub_8048FF4, sub_804904C, sub_804909C,
    sub_80490C4, sub_8048AD8, sub_8048B50, sub_8048BF0, sub_804911C, sub_8049174, sub_80491C4,
};

const u8 gUnknown_080D8788[][7] = {
    { 4, 3, 3, 0, 0, 0, 0 },
    { 4, 3, 2, 1, 1, 0, 0 },
};

const u16 gUnknown_080D8796[][16] = {
    INCBIN_U16("graphics/80D8796.gbapal"),
    INCBIN_U16("graphics/80D87B6.gbapal"),
};

void CreateEggFrog(void)
{
    Sprite *s;

    u8 i, j;
    EggFrog *boss;
    void *vram;
    s16 *unk28;
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
    gPlayerBodyPSI.s.frameFlags &= ~0x3000;
    gPlayerBodyPSI.s.frameFlags |= 0x1000;
    gActiveBossTask = TaskCreate(Task_EggFrogMain, sizeof(EggFrog), 0x4000, 0, TaskDestructor_EggFrogMain);

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
        const u16 *thing = gUnknown_080D859C[0][i];
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

    for (i = 0; i < ARRAY_COUNT(boss->unk98); i++) {
        u32 a;
        s = &boss->unk98[i];
        s->x = 0;
        s->y = 0;

        a = 3 + i;

        SPRITE_INIT(s, gUnknown_080D8108[a].numTiles, gUnknown_080D8108[a].anim, gUnknown_080D8108[a].variant, i + 27, 2);

        UpdateSpriteAnimation(s);
    }

    s = &boss->unk188[0];
    s->x = 0;
    s->y = 0;
    vram = VramMalloc(gUnknown_080D8108[2].numTiles);
    s->graphics.dest = vram;
    SPRITE_INIT_WITHOUT_VRAM(s, gUnknown_080D8108[2].anim, gUnknown_080D8108[2].variant, 25, 2, 0);
    UpdateSpriteAnimation(s);

    s = &boss->unk188[1];
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    SPRITE_INIT_WITHOUT_VRAM(s, gUnknown_080D8108[2].anim, gUnknown_080D8108[2].variant, 25, 2, 0);
    UpdateSpriteAnimation(s);
}

static void sub_8047E28(void)
{
    EggFrog *boss = TASK_DATA(gCurTask);
    gUnknown_080D874C[boss->unk1B](boss);
    sub_8048408(boss);
    sub_80492B8(boss);
    sub_8048858(boss);
    sub_8048E64(boss);
    Render(boss);
    sub_804931C(boss);

    if (boss->unk14 == 0) {
        if (GRAVITY_IS_INVERTED) {
            gPlayer.moveState |= MOVESTATE_IN_AIR;
        }

        Player_DisableInputAndBossTimer();
        boss->speedX = Q(5);
        boss->unk18 = 0;
        boss->unk64 = 0;
        gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;
        gCurTask->main = sub_8047F0C;
        return;
    }

    if ((gPlayer.heldInput & 0x40)) {
        gStageFlags |= STAGE_FLAG__GRAVITY_INVERTED;
    } else if (gPlayer.heldInput & 0x80) {
        gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;
    }
}

static void sub_8047F0C(void)
{
    EggFrog *boss = TASK_DATA(gCurTask);
    gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;
    sub_8048654(boss);
    sub_8048E64(boss);
    Render(boss);
    sub_804931C(boss);

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
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
        CreateEggmobileEscapeSequence(I(boss->x) - gCamera.x, I(boss->y) - gCamera.y - 15,
                                      SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(X_FLIP, 1));
    }

    if (I(boss->x) - gCamera.x < -200 && boss->unk65 != 0) {
        sub_802EF68(-0x28, 0x96, 6);
        gCurTask->main = sub_8048F44;
    }
}

static void Render(EggFrog *boss)
{

    s32 sin, cos;
    u8 k;
    Sprite *s = &boss->unk68;
    Vec2_32 pos;
    u8 i, j;
    u8 temp;

    s->x = 32;
    s->y = 40;
    UpdateSpriteAnimation(s);
    sub_8003914(s);
    gBgScrollRegs[0][0] = 32 - (I(boss->x) - gCamera.x);
    gBgScrollRegs[0][1] = 40 - (I(boss->y) - gCamera.y);

    pos.x = I(boss->x) - gCamera.x;
    if (pos.x < -50 || pos.x > (DISPLAY_WIDTH + 60)) {
        gDispCnt &= ~DISPCNT_BG0_ON;
    } else {
        gDispCnt |= DISPCNT_BG0_ON;
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
                        Player_EnemyCollision(s, s->x + gCamera.x, s->y + gCamera.y, 0, &gPlayer);
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
            s->frameFlags = 0x2800;
        } else {
            s->frameFlags = 0x2000;
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

static void sub_8048408(EggFrog *boss)
{
    Sprite *s = &boss->unk68;
    Vec2_32 pos;
    pos.x = I(boss->x);
    pos.y = I(boss->y);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (boss->unk16 == 0) {
        if (Player_AttackBossCollision(s, pos.x, pos.y, 0, &gPlayer) == TRUE) {
            sub_8048D78(boss);
        } else if (Player_EnemyCollision(s, pos.x, pos.y, 0, &gPlayer) == TRUE) {
            sub_804928C(boss);
        }

        Player_UpdateHomingPosition(QS(pos.x), QS(pos.y));

        if (boss->unk16 == 0 && Cheese_IsSpriteColliding(s, pos.x, pos.y, 0, &gPlayer) == TRUE) {
            sub_8048D78(boss);
            gCheeseTarget.task->unk15 = 0;
        }
    }
}

static void sub_80484C8(EggFrog *boss)
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

static void sub_8048654(EggFrog *boss)
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

static void sub_8048858(EggFrog *boss)
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

static void sub_804893C(EggFrog *boss)
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

static void sub_80489B0(EggFrog *boss)
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

static void sub_8048A4C(EggFrog *boss)
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

static void sub_8048AD8(EggFrog *boss)
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

static void sub_8048B50(EggFrog *boss)
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

static void sub_8048BF0(EggFrog *boss)
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
// 98.5%, some register hacks get it very close. All instructions match
NONMATCH("asm/non_matching/game/bosses/boss_7__sub_8048C7C.inc", bool8 sub_8048C7C(EggFrog *boss))
{
    const u16 **unk60 = (void *)boss->unk60;
    s16 *unk28 = boss->unk28;
#ifndef NON_MATCHING
    register u16 *r2 asm("r2") = (u16 *)boss->unk1C;
    register u32 r8 asm("r8");
#else
    u16 *r2 = (u16 *)boss->unk1C;
    u32 r8;
#endif

    u16 val = gUnknown_080D8710[boss->unk1B].unk0;
    u8 i;
    u8 result = 0;
    u8 r6 = (boss->unk5C >> 0xC) + 1;
    u32 unk5C;

    if ((r6) > 7) {
        result = 1;
    }

    r8 = 7;

    r6 &= 7;
    unk5C = boss->unk5C & 0xFFF;
    if (((boss->unk5C >> 0xC) & r8) != (((boss->unk5C - boss->unk58) >> 0xC) & r8)) {

        for (i = 0; i < 6; i++) {
            unk28[0] = unk28[1];
            unk28++;
            unk28[0] = unk28[1];
            unk28++;
            unk28[0] = unk28[1];
            unk28++;
            unk28[0] = (*unk60++)[r6];
            unk28++;
        }
        unk28 = boss->unk28;
    }

    for (i = 0; i < 6; i++) {
#ifndef NON_MATCHING
        u16 *sp4[2];
        u16 r0;
        s16 *p1;
        u32 p2;
        p1 = &unk28[i * 4];
        p2 = unk5C;
        sp4[0] = r2;
        r0 = sub_80859F4(p1, p2);
        r2 = sp4[0];
        *r2 = r0;
        r2++;
#else
        *r2++ = sub_80859F4(&unk28[i * 4], unk5C);
#endif
    }

    boss->unk58 = (((boss->unk58 - val) * 230) >> 8) + val;
    boss->unk5C += boss->unk58;
    boss->unk5C = (boss->unk5C & 0x7FFF);

    return result;
}
END_NONMATCH

static void sub_8048D78(EggFrog *boss)
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
        gMusicManagerState.unk1 = 0x11;
    }
}

static void sub_8048E64(EggFrog *boss)
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

void EggFrogMove(s32 dX, s32 dY)
{
    EggFrog *boss = TASK_DATA(gActiveBossTask);
    boss->x += dX;
    boss->y += dY;
    boss->unk10 += dX;
}

static void Task_EggFrogMain(void)
{
    EggFrog *boss = TASK_DATA(gCurTask);
    gUnknown_080D874C[boss->unk1B](boss);

    sub_80492B8(boss);
    sub_804920C(boss);
    sub_8048E64(boss);
    Render(boss);
    boss->unk16 = 1;
    sub_804931C(boss);

    boss->unk0++;

    if (boss->unk0 > 299) {
        boss->unk0 = 0;
        gCurTask->main = sub_8047E28;
    }
}

static void sub_8048F44(void)
{
    struct Task *t = gCurTask;
    gDispCnt &= ~DISPCNT_BG0_ON;
    gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;
    TaskDestroy(t);
}

static void sub_8048F7C(EggFrog *boss)
{
    boss->unk19 = 0;
    sub_8048C7C(boss);
    if (boss->unk5C > 0x1FFF) {
        sub_80484C8(boss);
    }
}

static void sub_8048FA4(EggFrog *boss)
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

static void sub_8048FF4(EggFrog *boss)
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

static void sub_804904C(EggFrog *boss)
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

static void sub_804909C(EggFrog *boss)
{
    boss->unk19 = 0;
    sub_8048C7C(boss);
    if (boss->unk5C > 0x1FFF) {
        sub_80484C8(boss);
    }
}

static void sub_80490C4(EggFrog *boss)
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

static void sub_804911C(EggFrog *boss)
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

static void sub_8049174(EggFrog *boss)
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

static void sub_80491C4(EggFrog *boss)
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

static void sub_804920C(EggFrog *boss)
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

static void sub_804928C(EggFrog *boss)
{
    Sprite *s = &boss->unk68;
    if (boss->unk16 == 0) {
        boss->unk15 = 0x1E;
        s->graphics.anim = SA2_ANIM_EGG_FROG_CABIN;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

static void sub_80492B8(EggFrog *boss)
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

static void sub_804931C(EggFrog *boss)
{
    if (boss->unk16 != 0) {
        u8 i;

        for (i = 0; i < 16; i++) {
            gBgPalette[i + 0xB0] = gUnknown_080D8796[(boss->unk16 & 2) >> 1][i];
        }
    }

    gFlags |= 1;
}

static void TaskDestructor_EggFrogMain(struct Task *t)
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

static void sub_80493F8(EggFrog *boss, s32 x, s32 y, u8 gravityInverted)
{
    Sprite *s;
    struct Task *t = TaskCreate(sub_80494EC, sizeof(EggFrogBomb), 0x6100, 0, NULL);
    EggFrogBomb *bomb = TASK_DATA(t);

    bomb->x = x - Q(gCamera.x) + 0x500;
    bomb->y = y - Q(gCamera.y);
    bomb->speedX = 0x500;
    bomb->speedY = 0;
    bomb->gravityInverted = gravityInverted;
    bomb->boss = boss;

    s = &bomb->s;
    s->x = I(x);
    s->y = I(y);
    s->graphics.dest = boss->unk1E8;

    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_FROG_BOMB, 0, 28, 3, 0);
    if (bomb->gravityInverted) {
        SPRITE_FLAG_SET(s, Y_FLIP);
    }
}

static void sub_80494EC(void)
{
    EggFrogBomb *bomb = TASK_DATA(gCurTask);
    Sprite *s = &bomb->s;
    s32 temp;
    s32 result;
    s32 x, y;
    u8 gravityInverted = bomb->gravityInverted;

    if (!gravityInverted) {
        bomb->speedY += Q(0.125);
    } else {
        bomb->speedY -= Q(0.125);
    }

    if (!PLAYER_IS_ALIVE) {
        bomb->x += bomb->speedX;
        bomb->y += bomb->speedY;
    } else {
        bomb->x += bomb->speedX + Q(gCamera.dx);
        bomb->y += bomb->speedY + Q(gCamera.dy);
    }

    temp = -8;
    if (!gravityInverted) {
        temp = 8;
    }

    x = I(bomb->x) + gCamera.x;
    y = I(bomb->y) + gCamera.y;
    result = sub_801E4E4(y, x, 1, temp, 0, sub_801EE64);

    // hit floor
    if (result < 0) {
        bomb->x += bomb->speedX * 2;
        bomb->speedY = 0;
        bomb->y += !gravityInverted ? Q(result) : -Q(result);
        bomb->unkD = 61;
        gCurTask->main = sub_8049658;
        return;
    }

    s->x = I(bomb->x);
    s->y = I(bomb->y);
    if (bomb->boss->unk14) {
        s32 result = Player_EnemyCollision(s, I(bomb->x) + gCamera.x, I(bomb->y) + gCamera.y, 0, &gPlayer);
        if (result == 1 && bomb->boss->unk16 == 0) {
            Sprite *unk68 = &bomb->boss->unk68;
            bomb->boss->unk15 = 0x1E;
            unk68->graphics.anim = SA2_ANIM_EGG_FROG_CABIN;
            unk68->variant = 1;
            unk68->prevVariant = -1;
        }
    }
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void sub_8049658(void)
{
    EggFrogBomb *bomb = TASK_DATA(gCurTask);
    u32 val;

    if (!PLAYER_IS_ALIVE) {
        bomb->x += bomb->speedX;
        bomb->y += bomb->speedY;
    } else {
        bomb->x += bomb->speedX + Q(gCamera.dx);
        bomb->y += bomb->speedY + Q(gCamera.dy);
    }

    val = bomb->unkD;
    bomb->unkD = val - 1;
    if (bomb->unkD == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    if (!((val - 1) % 4)) {
        s32 x, y;
        m4aSongNumStart(SE_EXPLOSION);
        x = bomb->x + Q(gCamera.x);
        y = bomb->y + Q(gCamera.y);
        sub_80496FC(bomb->boss, x, y, bomb->gravityInverted);
    }
}

static void sub_80496FC(EggFrog *boss, s32 x, s32 y, u8 gravityInverted)
{
    Sprite *s;
    struct Task *t = TaskCreate(Task_80497E0, sizeof(EggFrogBomb), 0x6100, 0, NULL);
    EggFrogBomb *bombFlame = TASK_DATA(t);
    bombFlame->x = x - Q(gCamera.x);
    bombFlame->y = y - Q(gCamera.y);
    bombFlame->speedX = 0;
    bombFlame->speedY = 0;
    bombFlame->unkD = 46;
    bombFlame->boss = boss;

    s = &bombFlame->s;
    s->x = I(bombFlame->x);
    s->y = I(bombFlame->y);
    s->graphics.dest = boss->unk1E8 + (6 * TILE_SIZE_4BPP);
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_FROG_BOMB_FLAME, 0, 28, 2, 0);

    if (gravityInverted) {
        SPRITE_FLAG_SET(s, Y_FLIP);
    }
}

static void Task_80497E0(void)
{
    EggFrogBomb *bombFlame = TASK_DATA(gCurTask);
    Sprite *s = &bombFlame->s;
#ifndef NON_MATCHING
    u8 r6;
#endif

    if (!PLAYER_IS_ALIVE) {
        bombFlame->x += bombFlame->speedX;
        bombFlame->y += bombFlame->speedY;
    } else {
        bombFlame->x += bombFlame->speedX + Q(gCamera.dx);
        bombFlame->y += bombFlame->speedY + Q(gCamera.dy);
    }

    bombFlame->unkD--;

#ifndef NON_MATCHING
    r6 = -1;
    asm("" ::"r"(r6));
#endif

    if (bombFlame->unkD == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    s->x = I(bombFlame->x);
    s->y = I(bombFlame->y);
    if (bombFlame->boss->unk14) {
        s32 result = Player_EnemyCollision(s, I(bombFlame->x) + gCamera.x, I(bombFlame->y) + gCamera.y, 0, &gPlayer);
        if (result == 1 && bombFlame->boss->unk16 == 0) {
            Sprite *unk68 = &bombFlame->boss->unk68;
            bombFlame->boss->unk15 = 30;
            unk68->graphics.anim = SA2_ANIM_EGG_FROG_CABIN;
            unk68->variant = 1;
#ifndef NON_MATCHING
            {
                u8 r0 = unk68->prevVariant;
            };
            unk68->prevVariant |= r6;
#else
            unk68->prevVariant = -1;
#endif
        }
    }
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
