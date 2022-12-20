#include "global.h"
#include "main.h"
#include "sprite.h"
#include "flags.h"

extern void sub_8003800(void);
extern void sub_8004314(void);
extern void sub_8004380(void);
extern void sub_800438C(void);
extern void sub_800439C(void);
extern void sub_8003870(void);
extern void sub_80043B0(void);
extern void sub_80043CC(void);
extern void sub_80043D8(void);
extern void sub_80043F8(void);
extern void sub_8004400(void);
extern void sub_800440C(void);
void *const gUnknown_08097A74[12] = {
    sub_8003800, sub_8004314, sub_8004380, sub_800438C, sub_800439C, sub_8003870,
    sub_80043B0, sub_80043CC, sub_80043D8, sub_80043F8, sub_8004400, sub_800440C,
};

void sub_8002A3C(Background *background)
{
    struct MapHeader_Full *r6 = gUnknown_03002260[background->unk1C].y;
    u32 a;
    u16 *c;

    background->unk14 = r6->unk0.X_Tiles;
    background->unk16 = r6->unk0.Y_Tiles;
    background->graphics.src = r6->unk0.Tileset;
    background->graphics.size = r6->unk0.unkC;

    if (!(background->unk2E & 8)) {
        gVramGraphicsCopyQueue[gVramGraphicsCopyQueueIndex] = &background->graphics;
        gVramGraphicsCopyQueueIndex = (gVramGraphicsCopyQueueIndex + 1) & 0x1F;
        background->unk2E ^= 8;
    }

    c = r6->unk0.Palette;
    a = r6->unk0.unk16;
    background->unk2A = r6->unk0.unk14;

    if (!(background->unk2E & 0x10)) {
        DmaCopy16(3, c, gBgPalette + background->unk2A, a * 2);
        gFlags |= 1;
        background->unk2E ^= 0x10;
    }

    background->unk10 = r6->unk0.Metatiles;

    if (background->unk2E & 0x40) { // Can we actually trigger this condition?
        background->unk38 = r6->unk0.Map;
        background->unk3C = r6->Map_Width;
        background->unk3E = r6->Map_Height;
    }

    gUnknown_03001800[gUnknown_0300287C] = background;
    gUnknown_0300287C = (gUnknown_0300287C + 1) & 0xF;
}
