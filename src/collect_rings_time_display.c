#include "main.h"
#include "game.h"
#include "collect_rings_time_display.h"
#include "malloc_vram.h"
#include "animation_commands.h"

typedef struct {
    Sprite unk0;
    Sprite unk30[11];
} TimeDisplay; /* 0x240*/

void sub_80832E0(struct Task *);
void sub_808328C(void);

extern u32 gUnknown_03005B6C;

extern const u16 gUnknown_080E0270[];

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

extern const u8 gUnknown_080E0234[];

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
