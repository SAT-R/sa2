#include "sakit/globals.h"

#include "game/stage/player.h"

#include "game/bosses/boss_7.h"
#include "game/bosses/common.h"

#include "constants/animations.h"

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
    u16 unk1C;
    u16 unk1E;
    u16 unk20;
    u16 unk22;
    u16 unk24;
    u16 unk26;
    u16 unk28[24];
    u16 unk58;
    u32 unk5C;
    u32 unk60; // gUnknown_080D859C
    u8 unk64;
    u8 unk65;
    u8 unk66;
    Sprite unk68;
    Sprite unk98[5];
    Sprite unk188;
    Sprite unk1B8;
    void *unk1E8;
} EggFrog; /* 0x1EC */

void Task_EggFrogMain(void);
void TaskDestructor_EggFrogMain(struct Task *);

extern const u16 *const gUnknown_080D859C[];
extern const TileInfo gUnknown_080D8108[];
typedef struct {
    u8 unk0[0x37];
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
    boss->unk1C = 0;
    boss->unk1E = 0;
    boss->unk20 = 0;
    boss->unk22 = 0;
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

    s = &boss->unk188;
    s->x = 0;
    s->y = 0;
    vram = VramMalloc(gUnknown_080D8108[2].numTiles);
    s->graphics.dest = vram;
    SPRITE_INIT_WITHOUT_VRAM(s, gUnknown_080D8108[2].anim, gUnknown_080D8108[2].variant,
                             25, 2, 0);
    UpdateSpriteAnimation(s);

    s = &boss->unk1B8;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    SPRITE_INIT_WITHOUT_VRAM(s, gUnknown_080D8108[2].anim, gUnknown_080D8108[2].variant,
                             25, 2, 0);
    UpdateSpriteAnimation(s);
}
