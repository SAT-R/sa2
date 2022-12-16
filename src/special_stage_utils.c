#include "main.h"
#include "special_stage.h"
#include "special_stage_world.h"
#include "special_stage_utils.h"
#include "special_stage_data.h"
#include "sprite.h"
#include "trig.h"

void *gUnknown_03005B58 = NULL;
void *gUnknown_03005B5C = NULL;

void sub_806CA88(Sprite *obj, s8 target, u32 size, u16 anim, u32 unk10, s16 xPos,
                 s16 yPos, u16 g, u8 variant, u8 focused)
{
    Sprite newObj;
    Sprite *element;
    element = &newObj;

    if (obj != NULL) {
        element = obj;
    }

    if (target != 0) {
        if (gUnknown_03005B58 == NULL) {
            gUnknown_03005B58 = gUnknown_03005B5C;
        }
        element->vram = gUnknown_03005B58;
    } else {
        element->vram = gUnknown_03005B5C;
    }

    element->unk8 = 0;
    element->anim = anim;
    element->unk10 = unk10;
    element->x = xPos;
    element->y = yPos;
    element->unk1A = g << 6;
    element->unk1C = 0;
    element->unk1E = 0xffff;
    element->variant = variant;
    element->unk21 = 0xff;
    element->unk22 = 0x10;
    element->focused = focused;
    element->unk28[0].unk0 = -1;

    sub_8004558(element);

    switch (target) {
        case RENDER_TARGET_SCREEN:
            gUnknown_03005B5C += size * TILE_SIZE_4BPP;
            // if we render to screen then the sub menu address should reset
            ResetSpecialStateScreenSubMenuVram();
            break;
        case RENDER_TARGET_SUB_MENU:
            gUnknown_03005B58 += size * TILE_SIZE_4BPP;
            break;
    }
}

// TODO: SpecialStageCollectables_UNK874 is probably it's own type
bool16 sub_806CB84(struct UNK_806CB84 *a,
                   struct SpecialStageCollectables_UNK874_2 *unk874,
                   struct SpecialStage *stage)
{
    struct SpecialStageWorld *world = TaskGetStructPtr(stage->worldTask);
    s32 r9;
    s32 r4;
    s16 val2, val;

    {
        u16 deg = -stage->cameraBearing & 0x3FF;
        s32 r2 = (gSineTable[deg] * 4);
        s32 r5 = gSineTable[(deg) + 0x100];
        s32 temp_r4 = (-unk874->unk0 + stage->cameraX);
        s32 r3 = (-unk874->unk4 + stage->cameraY);
        r9 = (((r2 >> 8) * (r3 >> 8)) + ((r5 >> 6) * (temp_r4 >> 8))) >> 2;
        r4 = (((-r2 >> 8) * (temp_r4 >> 8)) + ((r5 >> 6) * (r3 >> 8))) >> 1;
    }

    {
        s32 unk590 = stage->unk94[DISPLAY_HEIGHT - 1][1];
        s32 unk94 = stage->unk94[stage->unk5D1][1];

        if (r4 <= unk590 || r4 >= unk94) {
            return FALSE;
        }
    }

    val2 = stage->unk5D2;
    val = stage->unk5D3;

    while (val2 != 0) {
        if (val >= 0xA0) {
            val -= val2 >> 1;
        } else if (val < stage->unk5D1) {
            val += val2 >> 1;
        } else if (stage->unk94[val][1] > r4) {
            val += val2 >> 1;
        } else if (stage->unk94[val][1] < r4) {
            val -= val2 >> 1;
        } else {
            val = val2;
            break;
        }
        val2 >>= 1;
    }

    {
        s32 r2 = (-(stage->unk94[val][0] >> 1) * 9) >> 3;
        s32 r8 = ((stage->unk94[val][0] >> 1) * 9) >> 3;

        if (r9 <= r2 || r9 >= r8) {
            return FALSE;
        }
        a->unkA = val;
        a->screenY
            = (a->unkA - unk874->unkE) - (Q_16_16(unk874->unk12) / world->unkC[val]);
        a->unk8 = (0x78 - ((r9 * 0x87) / r8));
        a->screenX = a->unk8 - unk874->unkC;
        if (unk874->unk8 != 0) {
            a->unk6 = (((unk874->unk8 << 3) / world->unkC[val]) * 9) >> 2;
        } else {
            a->unk6 = 0;
        }

        a->unkC = world->unkC[val] >> 8;
        a->unk12 = a->unkC;

        a->unk10 = 0;
        a->unkE = 0;
    }

    return TRUE;
}

void sub_806CD68(Sprite *element)
{
    u16 *reference;
    OamData *oam;
    u32 unk16, unk18;
    u16 unkC_6;
    u16 unkC_4;
    s16 unkC_2;

    s16 i;
    // Might be wrong, seems to make sense?
    struct UNK_0808B3FC_UNK240_UNKC *unkC = (void *)element->unkC;

    element->unk24 = unkC->unk2;
    unkC_4 = unkC->unk4;
    unkC_6 = unkC->unk6;
    unk16 = (s16)element->x - (unkC_4 >> 1);
    unk18 = (s16)element->y - (unkC_6 >> 1);

    unkC_2 = unkC->unk2;
    for (i = 0; i < unkC_2; i++) {
        u32 attr1_2;
        reference = gUnknown_03002794->oamData[element->anim];
        oam = sub_80058B4((element->unk1A & 0x7C0) >> 6);
        if (oam == iwram_end) {
            return;
        }

        if (i == 0) {
            element->unk23 = gUnknown_030018F0 - 1;
        }

        DmaCopy16(3, &reference[(unkC->unk1 + i) * 3], oam, 0x6);
        attr1_2 = oam->all.attr1 & 0x1FF;
        oam->all.attr0 = (unk18 + (oam->all.attr0 & 0xff)) & 0xff;
        oam->all.attr0 |= 0x300;
        oam->all.attr1 &= 0xfe00;
        oam->all.attr1 |= ((element->unk10 & 0x1f) << 9);
        oam->all.attr1 |= ((unk16 + attr1_2) & 0x1ff);
        oam->all.attr2 += element->focused * 0x1000;
        oam->all.attr2 |= ((element->unk10 & 0x3000) >> 2);
        oam->all.attr2 += GET_TILE_NUM(element->vram);
    }
}

void InitSpecialStageScreenVram(void)
{
    gUnknown_03005B5C = (void *)OBJ_VRAM0;
    gUnknown_03005B58 = NULL;
}

void sub_806CEC4(Background *background, u32 a, u32 b, u8 assetId, u16 d, u16 e, u16 f,
                 u8 g, u16 h, u16 i)
{
    background->unk4 = BG_CHAR_ADDR(a);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(b);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = assetId;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = d;
    background->unk28 = e;
    background->unk2A = f;
    background->unk2B = 0;
    background->unk2C = 0;
    background->unk2E = g;
    background->unk30 = h;
    background->unk32 = i;
    sub_8002A3C(background);
}

s16 MaxSpriteSize(const struct UNK_80DF670 *spriteConfig)
{
    s16 result = 0;

    while (spriteConfig->anim != 0xFFFF) {
        if (result < spriteConfig->unk4) {
            result = spriteConfig->unk4;
        }
        spriteConfig++;
    }

    return result;
}
