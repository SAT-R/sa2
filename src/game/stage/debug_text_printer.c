#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "gba/syscall.h"

#include "constants/animations.h"

void Task_802D4B4(void);
void TaskDestructor_802D4B8(struct Task *);

extern struct Task *gDebugUITask;

typedef struct {
    Sprite chars[SA2_ANIM_NUM_ASCII_CHARS];
} DebugTextPrinter; /* size: 0x11A0 */

#define DBG_UI_REQUIRED_TILES (2 * SA2_ANIM_NUM_ASCII_CHARS)
#define DBG_UI_CHAR_SIZE      (2 * TILE_SIZE_4BPP)
#define DGB_UI_GET_CHAR_FROM_TASK(task, ascii)                                          \
    (Sprite *)&(((DebugTextPrinter *)TaskGetStructPtr(task))->chars[(ascii) - '!'])

struct Task *Debug_CreateAsciiTask(s16 x, s16 y)
{
    struct Task *t = TaskCreate(Task_802D4B4, sizeof(DebugTextPrinter), 0xE100, 0,
                                TaskDestructor_802D4B8);
    DebugTextPrinter *printer = TaskGetStructPtr(t);
    u32 i;

    for (i = 0; i < SA2_ANIM_NUM_ASCII_CHARS; i++) {
        Sprite *s = &printer->chars[i];

        s->x = 0;
        s->y = 0;

        if (i == 0) {
            s->graphics.dest = VramMalloc(DBG_UI_REQUIRED_TILES);
        } else {
            s->graphics.dest
                = (printer->chars[0].graphics.dest + (i * DBG_UI_CHAR_SIZE));
        }

        s->unk1A = 0;
        s->graphics.size = 0;
        s->graphics.anim = SA2_ANIM_ASCII;

        // NOTE: 0x20 is space ' ' in ASCII, so add 1 to accommodate for that
        //       ( But to convert i to ASCII, you add '!' (0x21),
        //         or subtract it for the other way around. )
        s->variant = i + 1;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 0);
    }

    gDebugUITask = t;

    return t;
}

void Debug_PrintIntegerAt(u32 value, u16 x, u16 y)
{
    Sprite *digits = DGB_UI_GET_CHAR_FROM_TASK(gDebugUITask, '0');
    s32 base = 10;
    u32 remaining = 1;
    u32 numDigits;
    u32 digitX;

    if (value <= 9)
        numDigits = 1;
    else if (value <= 99)
        numDigits = 2;
    else if (value <= 999)
        numDigits = 3;
    else if (value <= 9999)
        numDigits = 4;
    else if (value <= 99999)
        numDigits = 5;
    else if (value <= 999999)
        numDigits = 6;
    else
        numDigits = 7;

    if (remaining == 0 || numDigits == 0)
        return;

    for (digitX = x; remaining > 0 && numDigits > 0; digitX -= 8, numDigits--) {
        Sprite *digit;

        remaining = Div(value, base);

        digit = &digits[value];
        digit -= remaining * base;

        digit->x = digitX;
        digit->y = y;
        UpdateSpriteAnimation(digit);

        digit->unk10 |= SPRITE_FLAG_MASK_ANIM_OVER;
        DisplaySprite(digit);

        value = remaining;
    }
}

void Debug_PrintTextAt(char *text, s16 x, s16 y)
{
    // NOTE: Unlike in Debug_PrintIntegerAt this is NOT the digit '0',
    //       but the character with the hexcode 0x00!
    Sprite *baseChar = DGB_UI_GET_CHAR_FROM_TASK(gDebugUITask, '\000');
    u8 i;

    for (i = 0; text[i] != '\0'; i++) {
        if (text[i] > ' ') {
            Sprite *digit = &baseChar[text[i]];

            digit->x = x;
            digit->y = y;
            UpdateSpriteAnimation(digit);

            digit->unk10 |= SPRITE_FLAG_MASK_ANIM_OVER;
            DisplaySprite(digit);
        }

        x += 8;
    }
}
void Task_802D4B4(void) { }

void TaskDestructor_802D4B8(struct Task *t)
{
    DebugTextPrinter *printer = TaskGetStructPtr(t);

    // First Sprite in 'chars' holds the allocation pointer
    Sprite *s = &printer->chars[0];

    VramFree(s->graphics.dest);
}