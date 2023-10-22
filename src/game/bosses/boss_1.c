#include "core.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "trig.h"

#include "game/game.h"
#include "game/save.h"
#include "game/bosses/common.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/player_callbacks_1.h"

#include "game/screen_transition.h"

#include "lib/m4a.h"
#include "constants/songs.h"
#include "constants/zones.h"
#include "constants/animations.h"
#include "flags.h"

typedef struct {
    u32 unk0;
    u32 unk4;
    u16 unk8;
    u16 unkA;

    u32 unkC[2][8];
    u32 unk4C;
    u32 unk50;
    u32 unk54[2][8];

    u32 unk94;
    u32 unk98;
    u32 unk9C;
    u32 unkA0;
    u32 unkA4;
    u32 unkA8;
    u32 unkAC;

    u8 unkB0;
    u8 unkB1;
    u8 unkB2;
    u8 unkB3;

    u8 fillerB4[0x22C];

    Sprite unk2E0;
    Hitbox reserved0;
    Sprite unk318;
    Sprite unk348;
    Sprite unk378;
    Sprite unk3A8;
    Sprite unk3D8;
    Sprite unk408;
    Hitbox reserved1;
    u32 unk440;

    Sprite unk444;
    Sprite unk474;
} EggHammerTankII; /* size 0x4A4 */

void Task_EggHammerTankIIMain(void);
void TaskDestructor_EggHammerTankIIMain(struct Task *);

extern const u32 gUnknown_080D7A38[8];
extern const u32 gUnknown_080D7A58[8];

void CreateEggHammerTankII(void)
{

    struct Task *t;
    EggHammerTankII *boss;
    Sprite *s;
    u32 i;

    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    gPseudoRandom = gStageTime;
    t = TaskCreate(Task_EggHammerTankIIMain, sizeof(EggHammerTankII), 0x4000, 0,
                   TaskDestructor_EggHammerTankIIMain);

    boss = TASK_DATA(t);
    if (IS_FINAL_STAGE(gCurrentLevel)) {
        u8 difficulty = gDifficultyLevel;
        if (difficulty != DIFFICULTY_NORMAL) {
            boss->unkB0 = 3;
        } else {
            boss->unkB0 = 4;
        }
    } else if (gDifficultyLevel != DIFFICULTY_NORMAL
               && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->unkB0 = 6;
    } else {
        boss->unkB0 = 8;
    }

    boss->unkA8 = 0;
    boss->unkA4 = 2;
    boss->unkA0 = 0;
    boss->unkAC = 0x78;

    boss->unkB1 = 0;
    boss->unkB2 = 0;
    boss->unkB3 = 0;

    i = 0x3D400;
    boss->unk0 = i;
    boss->unk4 = 0x9B00;

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->unk8 = 0x500;
        boss->unkA = 0;
    } else {
        boss->unk8 = 0x500;
        boss->unkA = 0;
    }

    for (i = 0; i < 8; i++) {
        boss->unkC[1][i] = 0;
        boss->unkC[0][i] = gUnknown_080D7A38[i];
    }

    boss->unk4C = 0;
    boss->unk50 = 0;

    for (i = 0; i < 8; i++) {
        boss->unk54[1][i] = 0x300;
        boss->unk54[0][i] = gUnknown_080D7A58[i];
    }

    boss->unk94 = 0x300;
    boss->unk98 = 0x1280;
    boss->unk9C = 0x1280;

    s = &boss->unk2E0;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 0x48, SA2_ANIM_HAMMERTANK_BODY, 0, 20, 2);
    UpdateSpriteAnimation(s);

    s = &boss->unk318;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 4, SA2_ANIM_HAMMERTANK_ARM_SEGMENT, 0, 18, 2);
    UpdateSpriteAnimation(s);

    s = &boss->unk3A8;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 9, SA2_ANIM_HAMMERTANK_SPINNING_WHEEL, 0, 19, 2);

    s = &boss->unk3D8;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 9, SA2_ANIM_HAMMERTANK_WHEEL, 0, 21, 2);

    s = &boss->unk348;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 0x40, SA2_ANIM_HAMMERTANK_HAND, 0, 17, 2);
    UpdateSpriteAnimation(s);

    s = &boss->unk378;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 0xC, SA2_ANIM_HAMMERTANK_PILOT, 0, 21, 2);

    s = &boss->unk408;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(0x40);
    SPRITE_INIT_ANIM(s, SA2_ANIM_HAMMERTANK_HAMMER, 0, 24);
    SPRITE_INIT_SCRIPT(s, 1.0);

    s->unk10 = (gUnknown_030054B8++) | 0x2060;

    if (!IS_FINAL_STAGE(gCurrentLevel) && gSelectedCharacter == CHARACTER_SONIC
        && gLoadedSaveGame->unlockedLevels[0] <= gCurrentLevel) {

        s = &boss->unk444;
        s->x = 0;
        s->y = 0;
        SPRITE_INIT(s, 0xC, SA2_ANIM_CREAM_CAPTURED, 0, 2, 2);

        s = &boss->unk474;
        s->x = 0;
        s->y = 0;
        SPRITE_INIT(s, 9, SA2_ANIM_CHEESE_STRUGGLING, 0, 2, 2);
    } else {
        boss->unk444.graphics.dest = NULL;
        boss->unk474.graphics.dest = NULL;
    }

    gActiveBossTask = t;
}
