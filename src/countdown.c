#include "countdown.h"
#include "main.h"
#include "sprite.h"
#include "game.h"
#include "task.h"
#include "malloc_vram.h"
#include "m4a.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"
#include "constants/text.h"

struct CourseStartCountdown {
    Sprite unk0;
    Sprite unk30;
    u32 unk60; // x ?
    u32 unk64; // y ?
    s16 unk68;
    u8 unk6A;
    u8 unk6B;
};

const TileInfo gUnknown_080D7518[NUM_CHARACTERS] = {
    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0,
                    SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_SONIC)),

    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0,
                    SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_CREAM)),

    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0,
                    SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_TAILS)),

    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0,
                    SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_KNUCKLES)),

    TextElementAlt4(SA2_CHAR_ANIM_VARIANT_BEFORE_COUNTDOWN_LIFTOFF, 0,
                    SA2_ANIM_CHAR(SA2_CHAR_ANIM_BEFORE_COUNTDOWN, CHARACTER_AMY)),
};

void sub_8036168(void);
void sub_8036638(struct Task *);

void CreateCourseStartCountdown(u8 mode)
{
    struct Task *t;
    struct CourseStartCountdown *countdown;
    Sprite *element;

    gUnknown_03005424 |= 0x100;
    t = TaskCreate(sub_8036168, 0x6C, 0x3000, 0, sub_8036638);
    countdown = TaskGetStructPtr(t);

    countdown->unk6A = 0;
    countdown->unk6B = 0;

    if (mode == 0) {
        countdown->unk68 = 0x136;
    } else {
        countdown->unk68 = 0xB4;
    }

    element = &countdown->unk30;
    element->vram = VramMalloc(4);
    element->anim = SA2_ANIM_COUNTDOWN;
    element->variant = SA2_ANIM_VARIANT_COUNTDOWN_3;
    element->unk21 = 0xFF;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;

    element = &countdown->unk0;
    element->vram = VramMalloc(0xE);
    element->anim = SA2_ANIM_LEVEL_START_MACHINE;
    element->variant = 0;
    element->unk1A = 0x480;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0x2400;
}

void sub_8018818(void);
void CreateRaceStartMessage(void);
void sub_8036398(void);

void sub_8036168(void)
{
    struct CourseStartCountdown *countdown = TaskGetStructPtr(gCurTask);
    Sprite *element;

    // Skip intro
    if (!IsMultiplayer() && countdown->unk68 > (GBA_FRAMES_PER_SECOND * 3)
        && gPressedKeys & (A_BUTTON | B_BUTTON)) {
        countdown->unk68 = GBA_FRAMES_PER_SECOND * 3;
    }

    if (countdown->unk68 == GBA_FRAMES_PER_SECOND * 3) {
        m4aSongNumStart(VOICE__ANNOUNCER__3);
    } else if (countdown->unk68 == GBA_FRAMES_PER_SECOND * 2) {
        m4aSongNumStart(VOICE__ANNOUNCER__2);
    } else if (countdown->unk68 == GBA_FRAMES_PER_SECOND * 1) {
        m4aSongNumStart(VOICE__ANNOUNCER__1);
    }

    if (--countdown->unk68 == 0) {
        gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
        gUnknown_03005424 &= ~1;
        gUnknown_03005424 &= ~0x100;
        gPlayer.unk64 = 9;
        if (countdown->unk6A != 0) {
            gPlayer.speedGroundX = Q_8_8(9);
        } else {
            gPlayer.speedGroundX = Q_8_8(4);
        }

        sub_8018818();
        CreateRaceStartMessage();
        countdown->unk60 = Q_24_8_TO_INT(gPlayer.x);
        countdown->unk64 = Q_24_8_TO_INT(gPlayer.y);
        m4aSongNumStart(VOICE__ANNOUNCER__GO);
        gCurTask->main = sub_8036398;
    } else {
        if (countdown->unk68 < 5) {
            if (gPressedKeys & DPAD_RIGHT && countdown->unk6B == 0) {
                countdown->unk6A = 1;
            }
        } else {
            if (gPressedKeys & DPAD_RIGHT) {
                countdown->unk6B = 1;
            }
        }
    }

    element = &countdown->unk0;
    element->x = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    element->y = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;
    sub_8004558(element);
    sub_80051E8(element);

    if (countdown->unk68 < (GBA_FRAMES_PER_SECOND * 3)) {
        element = &countdown->unk30;
        element->variant = SA2_ANIM_VARIANT_COUNTDOWN_1
            - Div(countdown->unk68, GBA_FRAMES_PER_SECOND);
        element->unk21 = 0xFF;
        element->x = (Q_24_8_TO_INT(gPlayer.x) - gCamera.x) + 0x18;
        element->y = (Q_24_8_TO_INT(gPlayer.y) - gCamera.y) - 0x18;
        sub_8004558(element);
        sub_80051E8(element);
    }

    if (countdown->unk68 >= (int)((1 + 1. / 6.) * GBA_FRAMES_PER_SECOND)
        && countdown->unk68 < 3 * GBA_FRAMES_PER_SECOND) {
        gPlayer.unk68 = gUnknown_080D7518[gSelectedCharacter].anim;
        gPlayer.unk6A = gUnknown_080D7518[gSelectedCharacter].variant;
        gPlayer.unk6C = 1;

        if (IsMultiplayer()) {
            gPlayer.unk90->unk31 = (SIO_MULTI_CNT)->id;
        } else {
            gPlayer.unk90->unk31 = 0;
        }
    }
}

void sub_8036398(void)
{
    struct CourseStartCountdown *countdown = TaskGetStructPtr(gCurTask);
    Sprite *element = &countdown->unk0;

    element->x = countdown->unk60 - gCamera.x;
    element->y = countdown->unk64 - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(element->x, (s16)element->y)) {
        TaskDestroy(gCurTask);
        return;
    }

    sub_8004558(element);
    sub_80051E8(element);
}

void sub_8036524(void);
void sub_8036654(struct Task *);

struct RaceStartMessage {
    Sprite unk0;
    struct UNK_808D124_UNK180 unk30;
    Sprite unk3C;
    struct UNK_808D124_UNK180 unk6C;
    u16 unk78;
    u16 filler7A;
}; /* 0x7C */

void CreateRaceStartMessage(void)
{
    struct Task *t = TaskCreate(sub_8036524, 0x7C, 0x3000, 0, sub_8036654);
    struct RaceStartMessage *startMessage = TaskGetStructPtr(t);
    Sprite *element;

    startMessage->unk78 = 0x3C;
    element = &startMessage->unk0;
    element->vram = VramMalloc(0x40);
    element->anim = SA2_ANIM_COUNTDOWN_START;
    element->variant = SA2_ANIM_VARIANT_COUNTDOWN_START_L;
    element->unk21 = 0xFF;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = gUnknown_030054B8++ | 0x60;

    element = &startMessage->unk3C;
    element->vram = VramMalloc(0x40);
    element->anim = SA2_ANIM_COUNTDOWN_START;
    element->variant = SA2_ANIM_VARIANT_COUNTDOWN_START_R;
    element->unk21 = 0xFF;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->focused = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = gUnknown_030054B8++ | 0x60;
}

void sub_8036524(void)
{
    struct RaceStartMessage *startMessage = TaskGetStructPtr(gCurTask);
    Sprite *element, *element2;
    struct UNK_808D124_UNK180 *transformConfig;
    s16 unk78;
    startMessage->unk78--;

    if (startMessage->unk78 == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    element = &startMessage->unk0;
    transformConfig = &startMessage->unk30;

    element->x = (DISPLAY_WIDTH / 2);
    element->y = (DISPLAY_HEIGHT / 4);
    element->unk10 = gUnknown_030054B8++ | 0x60;
    transformConfig->unk0 = 0;
    unk78 = startMessage->unk78;
    if (unk78 < 0x10) {
        transformConfig->unk2 = 0x200 - startMessage->unk78 * 0x10;
        transformConfig->unk4 = (startMessage->unk78 + 1) * 0x10;
    } else {
        transformConfig->unk2 = 0x100;
        transformConfig->unk4 = 0x100;
    }

    transformConfig->unk6[0] = element->x;
    transformConfig->unk6[1] = element->y;
    sub_8004558(element);
    sub_8004860(element, transformConfig);
    sub_80051E8(element);

    element = &startMessage->unk3C;
    transformConfig = &startMessage->unk6C;

    element->x = (DISPLAY_WIDTH / 2);
    element->y = (DISPLAY_HEIGHT / 4);
    element->unk10 = gUnknown_030054B8++ | 0x60;
    transformConfig->unk0 = 0;
    unk78 = startMessage->unk78;
    if (unk78 < 0x10) {
        transformConfig->unk2 = 0x200 - startMessage->unk78 * 0x10;
        transformConfig->unk4 = (startMessage->unk78 + 1) * 0x10;
    } else {
        transformConfig->unk2 = 0x100;
        transformConfig->unk4 = 0x100;
    }

    transformConfig->unk6[0] = element->x;
    transformConfig->unk6[1] = element->y;
    sub_8004558(element);
    sub_8004860(element, transformConfig);
    sub_80051E8(element);
}

void sub_8036638(struct Task *t)
{
    struct CourseStartCountdown *countdown = TaskGetStructPtr(t);
    VramFree(countdown->unk0.vram);
    VramFree(countdown->unk30.vram);
}

void sub_8036654(struct Task *t)
{
    struct RaceStartMessage *startMessage = TaskGetStructPtr(t);
    VramFree(startMessage->unk3C.vram);
    VramFree(startMessage->unk0.vram);
}
