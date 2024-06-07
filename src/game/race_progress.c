#include <string.h> // memcpy

#include "core.h"
#include "task.h"
#include "sprite.h"
#include "malloc_vram.h"

#include "sakit/globals.h"
#include "game/race_progress.h"
#include "game/stage/player.h"
#include "game/multiplayer/mp_player.h"
#include "game/stage/screen_fade.h"

#include "constants/animations.h"
#include "constants/zones.h"

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
    struct RaceProgressIndicator *progressIndicator = TASK_DATA(t);

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
    Sprite *s;
    u8 avatarVariants[6];

    memcpy(avatarVariants, sCharacterAvatars, sizeof(sCharacterAvatars));

    for (i = 0; i < progressIndicator->numPlayers; i++) {
        // Life Counter
        s = &progressIndicator->avatars[i];
        s->graphics.dest = VramMalloc(4);
        s->graphics.anim = SA2_ANIM_LIFE_COUNTER;
        s->variant = avatarVariants[gMultiplayerCharacters[i]];
        s->prevVariant = -1;
        s->x = 6;
        s->y = (DISPLAY_HEIGHT - 18);
        if (gMultiplayerCharacters[i] == gSelectedCharacter) {
            s->unk1A = SPRITE_OAM_ORDER(2);
        } else {
            s->unk1A = SPRITE_OAM_ORDER(3);
        }
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->animSpeed = 0x10;
        s->palId = i;
        s->unk10 = 0;
        UpdateSpriteAnimation(s);
    }

    s = &progressIndicator->flags[START_FLAG];
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = SA2_ANIM_RACE_START_ICON;
    s->variant = 0;
    s->prevVariant = -1;
    s->x = 0 + RACE_ICON_INDENT;
    s->y = RACE_ICON_Y;
    s->unk1A = SPRITE_OAM_ORDER(5);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10 = 0;
    UpdateSpriteAnimation(s);

    s = &progressIndicator->flags[FINISH_FLAG];
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = SA2_ANIM_RACE_FINISH_ICON;
    s->variant = 0;
    s->prevVariant = -1;
    s->x = DISPLAY_WIDTH - RACE_ICON_INDENT;
    s->y = RACE_ICON_Y;
    s->unk1A = SPRITE_OAM_ORDER(5);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10 = 0;
    UpdateSpriteAnimation(s);
}
#undef RACE_ICON_INDENT

static void Task_UpdateAvatarPositions(void)
{
    u8 i;
    Sprite *avatar;
    MultiplayerPlayer *mpp;
    struct RaceProgressIndicator *progressIndicator = TASK_DATA(gCurTask);

    for (i = 0; i < progressIndicator->numPlayers; i++) {
        avatar = &progressIndicator->avatars[i];
        mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);
        avatar->x
            = ((mpp->pos.x * sCourseStepSizes[progressIndicator->course]) >> 0x10) + 6;
    }

    RenderUI(progressIndicator);
}

static void RenderUI(struct RaceProgressIndicator *progressIndicator)
{
    u8 i;
    Sprite *s;

    if (gPlayer.moveState & MOVESTATE_100000) {
        return;
    }

    for (i = 0; i < progressIndicator->numPlayers; i++) {
        s = &progressIndicator->avatars[i];
        DisplaySprite(s);
    }

    for (i = 0; i < ARRAY_COUNT(progressIndicator->flags); i++) {
        s = &progressIndicator->flags[i];
        DisplaySprite(s);
    }
}

static void RaceProgressIndicatorOnDestroy(struct Task *t)
{
    u8 i;
    struct RaceProgressIndicator *progressIndicator = TASK_DATA(t);

    for (i = 0; i < progressIndicator->numPlayers; i++) {
        VramFree(progressIndicator->avatars[i].graphics.dest);
    }

    for (i = 0; i < ARRAY_COUNT(progressIndicator->flags); i++) {
        VramFree(progressIndicator->flags[i].graphics.dest);
    }
}
