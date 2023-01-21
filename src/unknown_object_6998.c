#include "main.h"
#include "unknown_object_6998.h"
#include "malloc_vram.h"
#include "game.h"
#include "sprite.h"

typedef struct {
    Sprite unk0[4];
    u8 unkC0;
    s16 unkC2;
    s32 unkC4[4];
    s32 unkD4[4];
    u8 unkE4;
} UNK_8086998; /* 0xE8 */

void sub_8086CBC(struct Task *);
void sub_8086A88(void);

void sub_8086A0C(UNK_8086998 *);

void sub_8086998(void)
{
    u8 i;
    struct Task *t = TaskCreate(sub_8086A88, 0xE8, 0x4000, 0, sub_8086CBC);
    UNK_8086998 *unk998 = TaskGetStructPtr(t);
    unk998->unkC2 = 0;
    unk998->unkE4 = 0;
    unk998->unkC0 = 0;

    for (i = 0; i < 4; i++) {
        unk998->unkC4[i] = 0;
        unk998->unkD4[i] = 0;
    }

    sub_8086A0C(unk998);
}

void sub_8086A0C(UNK_8086998 *unk998)
{
    u8 i;
    Sprite *sprite;

    for (i = 0; i < 4; i++) {
        sprite = &unk998->unk0[i];
        sprite->graphics.dest = VramMalloc(10);
        sprite->graphics.anim = 0x35A;
        sprite->variant = 0;
        sprite->unk21 = 0xFF;
        sprite->x = -20;
        sprite->y = 0;
        sprite->unk1A = 0x180;
        sprite->graphics.size = 0;
        sprite->unk14 = 0;
        sprite->unk1C = 0;
        sprite->unk22 = 0x10;
        sprite->focused = 0;
        sprite->unk10 = 0x2000;
    }
}

void sub_8086B38(UNK_8086998 *unk998);
void sub_8086BE8(u8);

void sub_8086A88(void)
{
    u8 i;
    UNK_8086998 *unk998 = TaskGetStructPtr(gCurTask);
    Sprite *sprite;

    for (i = 0; i < 4; i++) {
        sprite = &unk998->unk0[i];
        sprite->x = gUnknown_03005A70.unk0->unk22;
        sprite->y = gUnknown_03005A70.unk0->unk24;
    }

    sub_8086B38(unk998);

    if (unk998->unkE4 == 0) {
        if (unk998->unkC2 == 0) {
            sub_8086BE8(0);
        }
        if (unk998->unkC2 == 3) {
            sub_8086BE8(1);
        }
        if (unk998->unkC2 == 7) {
            sub_8086BE8(2);
        }
        if (unk998->unkC2 == 11) {
            sub_8086BE8(3);
        }
    }

    unk998->unkC2++;

    if (unk998->unkC2 == 15) {
        unk998->unkC2 = 0;
    }

    if (gPlayer.unk64 != 0x22) {
        unk998->unkE4 = 1;
    }
}

void sub_8086B38(UNK_8086998 *unk998)
{
    u8 i;
    u8 j = 1;
    Sprite *sprite;

    if (unk998->unkE4 != 0 && unk998->unkC0 == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    for (i = 0; i < 4; i++) {
        if (unk998->unkC0 & j) {
            sprite = &unk998->unk0[i];
            sprite->x = (unk998->unkC4[i] >> 8) - gCamera.x;
            sprite->y = (unk998->unkD4[i] >> 8) - gCamera.y;

            if (sub_8004558(sprite) == 0) {
                unk998->unkC0 &= ~(1 << i);
            } else {
                sub_80051E8(sprite);
            }
        }
        j <<= 1;
    }
}

void sub_8086BE8(u8 i)
{
    Sprite *sprite;
    UNK_8086998 *unk998 = TaskGetStructPtr(gCurTask);

    unk998->unkC4[i] = gPlayer.x;
    unk998->unkD4[i] = gPlayer.y;

    if (i == 1) {
        unk998->unkD4[1] += 0x800;
    }

    if (i == 3) {
        unk998->unkD4[3] -= 0x800;
    }

    sprite = &unk998->unk0[i];
    sprite->unk21 = 0xFF;
    sprite->x = (unk998->unkC4[i] >> 8) - gCamera.x;
    sprite->y = (unk998->unkD4[i] >> 8) - gCamera.y;

    if (gUnknown_03005424 & 0x80) {
        sprite->unk10 |= 0x800;
    } else {
        sprite->unk10 &= ~0x800;
    }

    sub_8004558(sprite);
    unk998->unkC0 |= (1 << i);
}

void sub_8086CBC(struct Task *t)
{
    u8 i;
    UNK_8086998 *unk998 = TaskGetStructPtr(t);

    for (i = 0; i < 4; i++) {
        VramFree(unk998->unk0[i].graphics.dest);
    }
}
