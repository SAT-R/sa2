#include "game/race_progress.h"
#include "core.h"
#include "game/game.h"
#include "engine/task.h"
#include "engine/sprite.h"
#include "transition.h"
#include "engine/malloc_vram.h"

#include "constants/animations.h"
#include "constants/move_states.h"

struct RaceProgressIndicator {
    Sprite avatars[4];
    Sprite flags[2];
    u8 course;
    u8 numPlayers;
};

#define START_FLAG  0
#define FINISH_FLAG 1

static void Task_UpdateAvatarPositions(void);
static void CreateUI(struct RaceProgressIndicator *);
static void RenderUI(struct RaceProgressIndicator *);
static void RaceProgressIndicatorOnDestroy(struct Task *);

static const u16 sCourseStepSizes[] = {
    [COURSE_INDEX(ZONE_1, ACT_1)] = 816,  [COURSE_INDEX(ZONE_1, ACT_2)] = 845,

    [COURSE_INDEX(ZONE_2, ACT_1)] = 560,  [COURSE_INDEX(ZONE_2, ACT_2)] = 637,

    [COURSE_INDEX(ZONE_3, ACT_1)] = 618,  [COURSE_INDEX(ZONE_3, ACT_2)] = 578,

    [COURSE_INDEX(ZONE_4, ACT_1)] = 557,  [COURSE_INDEX(ZONE_4, ACT_2)] = 748,

    [COURSE_INDEX(ZONE_5, ACT_1)] = 1024, [COURSE_INDEX(ZONE_5, ACT_2)] = 800,

    [COURSE_INDEX(ZONE_6, ACT_1)] = 512,  [COURSE_INDEX(ZONE_6, ACT_2)] = 744,

    [COURSE_INDEX(ZONE_7, ACT_1)] = 448,  [COURSE_INDEX(ZONE_7, ACT_2)] = 464,
};
static const u8 sCharacterAvatars[] = {
    [CHARACTER_SONIC] = SA2_ANIM_VARIANT_LIFE_COUNTER_SONIC,
    [CHARACTER_CREAM] = SA2_ANIM_VARIANT_LIFE_COUNTER_CREAM,
    [CHARACTER_TAILS] = SA2_ANIM_VARIANT_LIFE_COUNTER_TAILS,
    [CHARACTER_KNUCKLES] = SA2_ANIM_VARIANT_LIFE_COUNTER_KNUCKLES,
    [CHARACTER_AMY] = SA2_ANIM_VARIANT_LIFE_COUNTER_AMY,

    [NUM_CHARACTERS] = 0,
};

void CreateRaceProgressIndicator(void)
{
    u8 i;
    struct Task *t
        = TaskCreate(Task_UpdateAvatarPositions, sizeof(struct RaceProgressIndicator),
                     0x1000, 0, RaceProgressIndicatorOnDestroy);
    struct RaceProgressIndicator *progressIndicator = TaskGetStructPtr(t);

    progressIndicator->course = COURSE_LEVEL_TO_COURSE_INDEX(gCurrentLevel);

    for (i = 0; i < 4; i++) {
        if (gMultiplayerPlayerTasks[i] == NULL) {
            break;
        }
    }
    progressIndicator->numPlayers = i;
    CreateUI(progressIndicator);
}

#define RACE_ICON_INDENT 14
#define RACE_ICON_Y      (DISPLAY_HEIGHT * (15. / 16.))
static void CreateUI(struct RaceProgressIndicator *progressIndicator)
{
    u8 i;
    Sprite *element;
    u8 avatarVariants[6];

    memcpy(avatarVariants, sCharacterAvatars, sizeof(sCharacterAvatars));

    for (i = 0; i < progressIndicator->numPlayers; i++) {
        // Life Counter
        element = &progressIndicator->avatars[i];
        element->graphics.dest = VramMalloc(4);
        element->graphics.anim = SA2_ANIM_LIFE_COUNTER;
        element->variant = avatarVariants[gMultiplayerCharacters[i]];
        element->unk21 = 0xFF;
        element->x = 6;
        element->y = (DISPLAY_HEIGHT - 18);
        if (gMultiplayerCharacters[i] == gSelectedCharacter) {
            element->unk1A = 0x80;
        } else {
            element->unk1A = 0xC0;
        }
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->focused = i;
        element->unk10 = 0;
        sub_8004558(element);
    }

    element = &progressIndicator->flags[START_FLAG];
    element->graphics.dest = VramMalloc(4);
    element->graphics.anim = SA2_ANIM_RACE_START_ICON;
    element->variant = 0;
    element->unk21 = 0xFF;
    element->x = 0 + RACE_ICON_INDENT;
    element->y = RACE_ICON_Y;
    element->unk1A = 0x140;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk10 = 0;
    sub_8004558(element);

    element = &progressIndicator->flags[FINISH_FLAG];
    element->graphics.dest = VramMalloc(4);
    element->graphics.anim = SA2_ANIM_RACE_FINISH_ICON;
    element->variant = 0;
    element->unk21 = 0xFF;
    element->x = DISPLAY_WIDTH - RACE_ICON_INDENT;
    element->y = RACE_ICON_Y;
    element->unk1A = 0x140;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk10 = 0;
    sub_8004558(element);
}
#undef RACE_ICON_INDENT

static void Task_UpdateAvatarPositions(void)
{
    u8 i;
    Sprite *avatar;
    struct MultiplayerPlayer *player;
    struct RaceProgressIndicator *progressIndicator = TaskGetStructPtr(gCurTask);

    for (i = 0; i < progressIndicator->numPlayers; i++) {
        avatar = &progressIndicator->avatars[i];
        player = TaskGetStructPtr(gMultiplayerPlayerTasks[i]);
        avatar->x
            = ((player->unk50 * sCourseStepSizes[progressIndicator->course]) >> 0x10)
            + 6;
    }

    RenderUI(progressIndicator);
}

static void RenderUI(struct RaceProgressIndicator *progressIndicator)
{
    u8 i;
    Sprite *element;

    if (gPlayer.moveState & MOVESTATE_100000) {
        return;
    }

    for (i = 0; i < progressIndicator->numPlayers; i++) {
        element = &progressIndicator->avatars[i];
        sub_80051E8(element);
    }

    for (i = 0; i < ARRAY_COUNT(progressIndicator->flags); i++) {
        element = &progressIndicator->flags[i];
        sub_80051E8(element);
    }
}

static void RaceProgressIndicatorOnDestroy(struct Task *t)
{
    u8 i;
    struct RaceProgressIndicator *progressIndicator = TaskGetStructPtr(t);

    for (i = 0; i < progressIndicator->numPlayers; i++) {
        VramFree(progressIndicator->avatars[i].graphics.dest);
    }

    for (i = 0; i < ARRAY_COUNT(progressIndicator->flags); i++) {
        VramFree(progressIndicator->flags[i].graphics.dest);
    }
}
