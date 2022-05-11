#include "global.h"
#include "data.h"
#include "sprite.h"
#include "flags.h"

extern struct Unk_03002400 *gUnknown_03001800[];

void sub_8002A3C(struct Unk_03002400 *r4) {
    struct MapHeader_Full *r6 = gUnknown_03002260[r4->unk1C].y;
    u32 a;
    u16 *c;

    r4->unk14 = r6->unk0.X_Tiles;
    r4->unk16 = r6->unk0.Y_Tiles;
    r4->unk0 = (u32)r6->unk0.Tileset;
    r4->unk8 = r6->unk0.unkC;
    
    if (!(r4->unk2E & 8)) {
        gUnknown_030027A0[gUnknown_03002A84] = (struct Unk_03002EC0*)r4;
        gUnknown_03002A84 = (gUnknown_03002A84 + 1) & 0x1F;
        r4->unk2E ^= 8;
    }
    
    c = r6->unk0.Palette;
    a = r6->unk0.unk16;
    r4->unk2A = r6->unk0.unk14;

    if (!(r4->unk2E & 0x10)) {
        DmaCopy16(3, c, gBgPalette + r4->unk2A, a * 2);
        gFlags |= 1;
        r4->unk2E ^= 0x10;
    }

    r4->unk10 = r6->unk0.Metatiles;

    if (r4->unk2E & 0x40) { // Can we actually trigger this condition?
        r4->unk38 = r6->unk0.Map;
        r4->unk3C = r6->Map_Width;
        r4->unk3E = r6->Map_Height;
    }

    gUnknown_03001800[gUnknown_0300287C] = r4;
    gUnknown_0300287C = (gUnknown_0300287C + 1) & 0xF;
}
