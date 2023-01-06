#include "global.h"
#include "main.h"
#include "sprite.h"
#include "flags.h"

extern const u8 gUnknown_080984DC[][2];

void sub_80051E8(Sprite *sprite)
{
    OamData *r4;
    s32 y, x, sp04, sp08;
    u8 sp0C, i;
    u32 r5, r7;
    u32 r0, r1;
    const u16 *oamData;

    if ((u32)sprite->unkC != -1) {
        struct UNK_0808B3FC_UNK240_UNKC *unkC = sprite->unkC;

        sprite->unk24 = unkC->unk2;
        x = sprite->x;
        y = sprite->y;
        if (sprite->unk10 & 0x20000) {
            x -= gUnknown_030017F4[0];
            y -= gUnknown_030017F4[1];
        }

        sp04 = unkC->unk4;
        sp08 = unkC->unk6;
        if (sprite->unk10 & 0x20) {
            if (sprite->unk10 & 0x40) {
                x -= unkC->unk4 >> 1;
                y -= unkC->unk6 >> 1;
                sp04 <<= 1;
                sp08 <<= 1;
            }
        } else {
            if (sprite->unk10 & 0x800) {
                y -= sp08 - unkC->unkA;
            } else {
                y -= unkC->unkA;
            }
            if (sprite->unk10 & 0x400) {
                x -= sp04 - unkC->unk8;
            } else {
                x -= unkC->unk8;
            }
        }

        if (x + sp04 >= 0 && x <= DISPLAY_WIDTH && sp08 + y >= 0
            && y <= DISPLAY_HEIGHT) {
            u8 unk6D0 = gUnknown_030026D0 >> 8;

            for (sp0C = 0; sp0C < unkC->unk2; sp0C++) {
                oamData = gUnknown_03002794->oamData[sprite->graphics.anim];

                r4 = sub_80058B4((sprite->unk1A & 0x7C0) >> 6);
                if (iwram_end == r4) {
                    return;
                }

                if (sp0C == 0) {
                    sprite->unk23 = gUnknown_030018F0 - 1;
                }

                DmaCopy16(3, &oamData[3 * ((unkC->unk1 & 0x3FFF) + sp0C)], r4, 6);
                r7 = r4->all.attr1 & 0x1FF;
                r5 = r4->all.attr0 & 0xFF;
                r4->all.attr1 &= 0xFE00;
                r4->all.attr0 &= 0xFE00;

                r4->all.attr2 += sprite->focused * 0x1000;
                if (sprite->unk10 & 0x20) {
                    r4->all.attr0 |= 0x100;
                    if (sprite->unk10 & 0x40) {
                        r4->all.attr0 |= 0x200;
                    }
                    r4->all.attr1 |= (sprite->unk10 & 0x1F) << 9;
                } else {
                    u32 r2 = ((r4->all.attr0 & 0xC000) >> 12);
                    u32 temp3;
                    u32 r6;

                    r2 |= ((r4->all.attr1 & 0xC000) >> 14);
                    temp3 = sprite->unk10 >> 0xB;
                    r6 = 1;

                    if ((((unkC->unk0 >> 1) ^ temp3) & r6) != 0) {
                        r4->all.attr1 ^= 0x2000;
                        r5 = sp08 - gUnknown_080984DC[r2][1] - r5;
                    }

                    if (((sprite->unk10 >> 0xA) & r6) != (unkC->unk0 & 1)) {
                        r4->all.attr1 ^= 0x1000;
                        r7 = sp04 - gUnknown_080984DC[r2][0] - r7;
                    }
                }

                if (unk6D0 != 0 && (sprite->unk10 & 0x200) != 0) {
                    r4->all.attr0 |= 0x1000;
                }

                r4->all.attr0 |= (sprite->unk10 & 0x180) * 8;
                r4->all.attr2 |= (sprite->unk10 & 0x3000) >> 2;
                r4->all.attr0 += ((y + r5) & 0xFF);
                r4->all.attr1 += ((x + r7) & 0x1FF);

                if (r4->all.attr0 & 0x2000) {
                    r4->all.attr2 += r4->all.attr2 & 0x3FF;
                }
                r4->all.attr2 += GET_TILE_NUM(sprite->graphics.dest);
            }
        }
    }
}
