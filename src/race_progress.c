#include "course_progress.h"
#include "main.h"
#include "game.h"
#include "task.h"
#include "sprite.h"
#include "transition.h"
#include "malloc_vram.h"

struct RaceProgressIndicator {
    struct UNK_0808B3FC_UNK240 avatars[4];
    struct UNK_0808B3FC_UNK240 flags[2];
    u8 course;
    u8 numPlayers;
};

#define START_FLAG 0
#define FINISH_FLAG 1

static void Task_UpdateAvatarPositions(void);
static void CreateUI(struct RaceProgressIndicator*);
static void RenderUI(struct RaceProgressIndicator*);
static void RaceProgressIndicatorOnDestroy(struct Task*);

static const u16 sCourseStepSizes[] = {
    [COURSE_INDEX(ZONE_1, ACT_1)] = 816, 
    [COURSE_INDEX(ZONE_1, ACT_2)] = 845,

    [COURSE_INDEX(ZONE_2, ACT_1)] = 560, 
    [COURSE_INDEX(ZONE_2, ACT_2)] = 637,
 
    [COURSE_INDEX(ZONE_3, ACT_1)] = 618,
    [COURSE_INDEX(ZONE_3, ACT_2)] = 578,

    [COURSE_INDEX(ZONE_4, ACT_1)] = 557, 
    [COURSE_INDEX(ZONE_4, ACT_2)] = 748, 

    [COURSE_INDEX(ZONE_5, ACT_1)] = 1024, 
    [COURSE_INDEX(ZONE_5, ACT_2)] = 800,

    [COURSE_INDEX(ZONE_6, ACT_1)] = 512, 
    [COURSE_INDEX(ZONE_6, ACT_2)] = 744, 

    [COURSE_INDEX(ZONE_7, ACT_1)] = 448, 
    [COURSE_INDEX(ZONE_7, ACT_2)] = 464,
};
static const u8 sCharacterAvatars[] = { 0, 3, 1, 2, 4, 0, 0, 0};

void RaceProgressIndicator(void) {
    u8 i;
    struct Task* t = TaskCreate(Task_UpdateAvatarPositions, sizeof(struct RaceProgressIndicator), 0x1000, 0, RaceProgressIndicatorOnDestroy);
    struct RaceProgressIndicator* progressIndicator = TaskGetStructPtr(t);

    progressIndicator->course = COURSE_LEVEL_TO_COURSE_INDEX(gCurrentLevel);

    for (i = 0; i < 4; i++) {
        if (gUnknown_030055A0[i] == NULL) {
            break;
        }
    }
    progressIndicator->numPlayers = i;
    CreateUI(progressIndicator);
}

static void CreateUI(struct RaceProgressIndicator* progressIndicator) {
    u8 i;
    struct UNK_0808B3FC_UNK240* element;
    u8 avatarVariants[6];

    memcpy(avatarVariants, sCharacterAvatars, 6);

    for (i = 0; i < progressIndicator->numPlayers; i++) {
        element = &progressIndicator->avatars[i];
        element->unk4 = VramMalloc(4);
        element->unkA = 0x465;
        element->unk20 = avatarVariants[gMultiplayerCharacters[i]];
        element->unk21 = 0xFF;
        element->unk16 = 6;
        element->unk18 = 0x8E;
        if (gMultiplayerCharacters[i] == gSelectedCharacter) {
            element->unk1A = 0x80;
        } else {
            element->unk1A = 0xC0;
        }
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = i;
        element->unk10 = 0;
        sub_8004558(element);
    }

    element = &progressIndicator->flags[START_FLAG];
    element->unk4 = VramMalloc(4);
    element->unkA = 0x36F;
    element->unk20 = 0;
    element->unk21 = 0xFF;
    element->unk16 = 0xE;
    element->unk18 = 0x96;
    element->unk1A = 0x140;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk10 = 0;
    sub_8004558(element);

    element = &progressIndicator->flags[FINISH_FLAG];
    element->unk4 = VramMalloc(4);
    element->unkA = 0x370;
    element->unk20 = 0;
    element->unk21 = 0xFF;
    element->unk16 = 0xE2;
    element->unk18 = 0x96;
    element->unk1A = 0x140;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk10 = 0;
    sub_8004558(element);
}

static void Task_UpdateAvatarPositions(void) {
    u8 i;
    struct UNK_0808B3FC_UNK240* avatar;
    struct MultiplayerPlayer* player;
    struct RaceProgressIndicator* progressIndicator = TaskGetStructPtr(gCurTask);

    for (i = 0; i < progressIndicator->numPlayers; i++) {
        avatar = &progressIndicator->avatars[i];
        player = TaskGetStructPtr(gUnknown_030055A0[i]);
        avatar->unk16 = ((player->unk50 * sCourseStepSizes[progressIndicator->course]) >> 0x10) + 6;
    }

    RenderUI(progressIndicator);
}

static void RenderUI(struct RaceProgressIndicator* progressIndicator) {
    u8 i;
    struct UNK_0808B3FC_UNK240* element;

    if (gUnknown_030059E0.unk20 & 0x100000) {
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

static void RaceProgressIndicatorOnDestroy(struct Task* t) {
    u8 i;
    struct RaceProgressIndicator* progressIndicator = TaskGetStructPtr(t);

    for (i = 0; i < progressIndicator->numPlayers; i++) {
        VramFree(progressIndicator->avatars[i].unk4);
    }

    for (i = 0; i < ARRAY_COUNT(progressIndicator->flags); i++) {
        VramFree(progressIndicator->flags[i].unk4);
    }   
}
