#include "engine/core.h"
#include "game/game.h"
#include "game/multiboot/collect_rings/time_display.h"
#include "engine/malloc_vram.h"
#include "engine/animation_commands.h"

typedef struct {
    Sprite unk0;
    Sprite unk30[11];
} TimeDisplay; /* 0x240*/

void sub_80832E0(struct Task *);
void sub_808328C(void);

// Probably defined in `game/interactables_2/unknown`
// will wait before deciding where this is defined
extern u32 gUnknown_03005B6C;

const u8 gUnknown_080E0234[] = {
    0,   2,   3,   5,   7,   8,   16,  18,  19,  21,  23,  24,  32,  34,  35,
    37,  39,  40,  48,  50,  51,  53,  55,  56,  64,  66,  67,  69,  71,  72,
    80,  82,  83,  85,  87,  88,  96,  98,  99,  101, 103, 104, 112, 114, 115,
    117, 119, 120, 128, 130, 131, 133, 135, 136, 144, 146, 147, 149, 151, 152,
};

const u16 gUnknown_080E0270[] = INCBIN_U16("graphics/80E0270.gbapal");

void CreateCollectRingsTimeDisplay(void)
{
    u32 i;
    TimeDisplay *timeDisplay;
    Sprite *sprite;
    struct Task *t = TaskCreate(sub_808328C, 0x240, 0x2102, 0, sub_80832E0);
    gUnknown_03005B6C = 0;
    timeDisplay = TaskGetStructPtr(t);

    sprite = &timeDisplay->unk0;
    sprite->unk1A = 0x140;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk10 = 0x40000;

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        sprite->graphics.dest = VramMalloc(9);
        sprite->graphics.anim = 729;
        sprite->variant = 0;
    }

    sub_8004558(sprite);

    for (i = 0; i < 11; i++) {
        sprite = &timeDisplay->unk30[i];
        sprite->x = 0;
        sprite->y = 0;
        sprite->unk1A = 0x100;
        sprite->graphics.size = 0;
        sprite->graphics.anim = 1119;
        sprite->variant = i + 16;
        sprite->unk14 = 0;
        sprite->unk1C = 0;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        sprite->focused = 0;
        sprite->unk10 = 0;

        if (i == 0) {
            sprite->graphics.dest = VramMalloc(22);
        } else {
            sprite->graphics.dest = timeDisplay->unk30[0].graphics.dest + (i * 0x40);
        }

        sub_8004558(sprite);
    }

    for (i = 0; i < 16; i++) {
        gObjPalette[i + 0x70] = gUnknown_080E0270[i];
    }

    gFlags |= 0x2;
}

void sub_8082E9C(TimeDisplay *timeDisplay)
{
    s16 x, y;
    u16 temp4;
    u32 temp;
    Sprite *sprite;
    u8 temp5;
    u16 index;
    u8 digit1;
    u32 temp2;
    u32 temp3;
    u16 temp6;

    temp = Div(gUnknown_03005490, 60);
    index = gUnknown_03005490 - (temp * 60);
    temp *= 0x10000;
    temp /= 0x10000;
    digit1 = gUnknown_080E0234[index];

    temp2 = Div(temp, 60);
    temp -= (temp2 * 60);
    temp *= 0x10000;
    while (0)
        ;
    index = temp / 0x10000;
    temp2 *= 0x10000;
    temp2 /= 0x10000;
    temp6 = sub_8004518(index);

    temp3 = Div(temp2, 60);
    index = temp2 - (temp3 * 60);
    temp4 = sub_8004518(index);

    temp5 = 0;
    if (gUnknown_03005490 < 3600) {
        temp5 = (-(gUnknown_03005590 & 0x10)) >> 0x1F;
    }

    x = 8;
    y = 38;
    sprite = &timeDisplay->unk30[temp4 % 16];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = temp5;
    sub_80051E8(sprite);

    x += 8;
    sprite = &timeDisplay->unk30[10];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = 0;
    sub_80051E8(sprite);

    x += 8;
    sprite = &timeDisplay->unk30[(temp6 / 16) % 16];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = temp5;
    sub_80051E8(sprite);

    x += 8;
    sprite = &timeDisplay->unk30[temp6 % 16];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = temp5;
    sub_80051E8(sprite);

    x += 8;
    sprite = &timeDisplay->unk30[10];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = 0;
    sub_80051E8(sprite);

    x += 8;
    sprite = &timeDisplay->unk30[(digit1 / 16) % 16];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = temp5;
    sub_80051E8(sprite);

    x += 8;
    sprite = &timeDisplay->unk30[digit1 % 16];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = temp5;
    sub_80051E8(sprite);
}

void sub_8083040(TimeDisplay *timeDisplay)
{
    Sprite *sprite;

    u16 i, j;
    s16 x, y;
    u32 temp;

    for (i = 0; i < 4 && GetBit(gMultiplayerConnections, i); i++) {
        sprite = &timeDisplay->unk0;
        sprite->x = i * 26;
        sprite->y = 0;
        sprite->focused = i;
        sub_80051E8(sprite);

        j = sub_8004518(gUnknown_030053E8[i]);
        x = sprite->x + 0x17;
        y = sprite->y + 0x13;
        do {
            sprite = &timeDisplay->unk30[j % 16];
            sprite->x = x;
            sprite->y = y;
            sprite->focused = 0;
            sub_80051E8(sprite);
            x -= 8;
            y = y;
        } while (j /= 16);
    }
}

void sub_8083104(TimeDisplay *timeDisplay)
{
    s16 x, y;
    u16 temp4;
    u32 temp;
    Sprite *sprite;
    u16 index;
    u8 digit1;
    u32 temp2;
    u32 temp3;
    u16 temp6;

    temp = Div(gUnknown_03005B6C, 60);
    index = gUnknown_03005B6C - (temp * 60);
    temp *= 0x10000;
    temp /= 0x10000;
    digit1 = gUnknown_080E0234[index];

    temp2 = Div(temp, 60);
    temp -= (temp2 * 60);
    temp *= 0x10000;

#ifndef NON_MATCHING
    while (0)
        ;
#endif

    index = temp / 0x10000;
    temp2 *= 0x10000;
    temp2 /= 0x10000;
    temp6 = sub_8004518(index);

    temp3 = Div(temp2, 60);
    index = temp2 - (temp3 * 60);
    temp4 = sub_8004518(index);

    x = 8;
    y = 54;

#ifndef NON_MATCHING
    while (0)
        ;
#endif

    sprite = &timeDisplay->unk30[temp4 % 16];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = 1;
    sub_80051E8(sprite);

    x += 8;
    sprite = &timeDisplay->unk30[10];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = 0;
    sub_80051E8(sprite);

    x += 8;
    sprite = &timeDisplay->unk30[(temp6 / 16) % 16];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = 1;
    sub_80051E8(sprite);

    x += 8;
    sprite = &timeDisplay->unk30[temp6 % 16];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = 1;
    sub_80051E8(sprite);

    x += 8;
    sprite = &timeDisplay->unk30[10];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = 0;
    sub_80051E8(sprite);

    x += 8;
    sprite = &timeDisplay->unk30[(digit1 / 16) % 16];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = 1;
    sub_80051E8(sprite);

    x += 8;
    sprite = &timeDisplay->unk30[digit1 % 16];
    sprite->x = x;
    sprite->y = y;
    sprite->focused = 1;
    sub_80051E8(sprite);
}

void sub_808328C(void)
{
    if (!(gUnknown_03005424 & EXTRA_STATE__TURN_OFF_HUD)) {
        TimeDisplay *timeDisplay = TaskGetStructPtr(gCurTask);
        Sprite *sprite = &timeDisplay->unk0;
        if (!(gUnknown_03005424 & EXTRA_STATE__TURN_OFF_TIMER)) {
            sub_8082E9C(timeDisplay);

            if (gUnknown_03005B6C != 0) {
                sub_8083104(timeDisplay);
            }
        }
        sub_8083040(timeDisplay);
    }
}

void sub_80832E0(struct Task *t)
{
    TimeDisplay *timeDisplay = TaskGetStructPtr(t);
    VramFree(timeDisplay->unk0.graphics.dest);
    VramFree(timeDisplay->unk30[0].graphics.dest);
}
