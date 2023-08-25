#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "lib/m4a.h"

#include "constants/animations.h"
#include "constants/songs.h"

#define EGGMOBILE_DIR_LEFT        0
#define EGGMOBILE_DIR_RIGHT       1
#define EGGMOBILE_ASCENT_DURATION (1 * GBA_FRAMES_PER_SECOND)

typedef struct {
    Sprite s;
    Sprite s2;
    u16 frames;
    u8 direction;
} Sprite_EggMobile;

static void Task_EggmobileMoveUp(void);
static void Task_EggmobileSwitchMovement(void);
static void Task_EggmobileMoveRight(void);
static void TaskDestructor_EggmobileEscape(struct Task *t);

void CreateEggmobileEscapeSequence(s16 x, s16 y, u32 spriteFlags)
{
    struct Task *t = TaskCreate(Task_EggmobileMoveUp, sizeof(Sprite_EggMobile), 0x3800,
                                0, TaskDestructor_EggmobileEscape);
    Sprite_EggMobile *em = TaskGetStructPtr(t);
    Sprite *s;

    m4aSongNumStart(SE_EGGMOBILE_FLEES);
    m4aMPlayFadeOutTemporarily(&gMPlayInfo_SE2, 9);

    em->frames = 60;

    s = &em->s2;
    s->x = x;
    s->y = y;
    s->graphics.dest = VramMalloc(8);
    s->graphics.anim = SA2_ANIM_EGGMAN_HEAD;
    s->variant = 0;
    s->unk1A = 0x640;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->unk1C = 0;
    s->prevVariant = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = spriteFlags;
    sub_8004558(s);

    s = &em->s;
    s->x = x;
    s->y = y;
    s->graphics.dest = VramMalloc(36);
    s->graphics.anim = SA2_ANIM_EGGMOBILE;
    s->variant = 0;
    s->unk1A = 0x600;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->unk1C = 0;
    s->prevVariant = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = spriteFlags;
    sub_8004558(s);

    if (spriteFlags & SPRITE_FLAG_MASK_X_FLIP) {
        em->direction = EGGMOBILE_DIR_RIGHT;
    } else {
        em->direction = EGGMOBILE_DIR_LEFT;
    }
}

static void Task_EggmobileMoveUp(void)
{
    Sprite_EggMobile *em = TaskGetStructPtr(gCurTask);
    Sprite *s = &em->s;
    Sprite *s2 = &em->s2;

    s2->y -= 2;
    sub_8004558(s2);
    sub_80051E8(s2);

    s->y -= 2;
    sub_8004558(s);
    sub_80051E8(s);

    if (s->y <= 50) {
        gCurTask->main = Task_EggmobileSwitchMovement;
    }
}

// EggMobile - Init movement to the right
static void Task_EggmobileSwitchMovement(void)
{
    Sprite_EggMobile *em = TaskGetStructPtr(gCurTask);
    Sprite *s;

    if (--em->frames == 0) {
        // Make Eggman look to the right
        if (em->direction == EGGMOBILE_DIR_LEFT) {
            em->s.unk10 |= SPRITE_FLAG_MASK_X_FLIP;
            em->s2.unk10 |= SPRITE_FLAG_MASK_X_FLIP;
        }

        gCurTask->main = Task_EggmobileMoveRight;
    }

    s = &em->s2;
    sub_8004558(s);
    sub_80051E8(s);

    s = &em->s;
    sub_8004558(s);
    sub_80051E8(s);
}

static void Task_EggmobileMoveRight(void)
{
    Sprite_EggMobile *em = TaskGetStructPtr(gCurTask);
    Sprite *s = &em->s2;

    if (s->x > DISPLAY_WIDTH + 30) {
        m4aSongNumStop(SE_EGGMOBILE_FLEES);
        TaskDestroy(gCurTask);
    } else {
        s->x += 2;
        sub_8004558(s);
        sub_80051E8(s);

        s = &em->s;
        s->x += 2;
        sub_8004558(s);
        sub_80051E8(s);
    }
}

static void TaskDestructor_EggmobileEscape(struct Task *t)
{
    Sprite_EggMobile *em = TaskGetStructPtr(t);
    VramFree(em->s.graphics.dest);
    VramFree(em->s2.graphics.dest);
}