#include "global.h"
#include "core.h"
#include "flags.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/sa1/stage/stage_ui.h"

/* TODO: I guess this can be called ui_rendering.c or something like that? */

void Task_80536D4(void);
void TaskDestructor_80536D8(struct Task *t);

// TODO: make static
struct Task *gTask_03006240 = NULL;
u8 tempFiller_03006244[0xC] = {};
struct Strc_3006250 gUnknown_03006250[10] = {};
u8 tempFiller_030062B8[0x8] = {};
struct Strc_30063F0 gUnknown_030063C0 = {};
u8 tempFiller_030062E4[0xC] = {};
struct Strc_30063F0 *gUnknown_030063F0 = NULL;

typedef struct {
    u16 unk0;
    u16 unk2;
    u16 unk4;
} Strc_805345C;

void sub_80528AC(Strc_80528AC *param0)
{
    struct Strc0 *strc0;
    GraphicsData *gfx;

#ifndef NON_MATCHING
    strc0 = &TASK_GET_MEMBER(Task_3006240, gTask_03006240, struct Strc0, unk0[0]);
    strc0 = &strc0[param0->unk2B];
#else
    Task_3006240 *strc = TASK_DATA(gTask_03006240);
    strc0 = &strc->unk0[param0->unk2B];
#endif

    strc0->unk4 = param0->unk0.unk4;
    strc0->unk8 = param0->unk0.unk8;
    strc0->unk9 = param0->unk0.unk9;
    strc0->unkA = param0->unk0.unkA;
    strc0->unkB = param0->unk0.unkB;

    if (param0->unk2A & 0x8) {
        if (param0->unk2A & 0x1) {
            gfx = UiGfxStackPop();

            if (gfx != NULL) {
                gfx->src = param0->tiles;
                gfx->dest = param0->vramC;
                gfx->size = param0->tilesSize;

                ADD_TO_GRAPHICS_QUEUE(gfx);
            }
        }

        if (param0->unk2A & 0x4) {
            DmaCopy16(3, param0->palette, &gObjPalette[param0->unk28 * 16], param0->paletteSize);
            gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
        }

        strc0->unk0 = GET_TILE_NUM_COMMON(param0->vramC, 32);
    } else {
        void *vram = (param0->uiGfxID & 0x80) ? BG_CHAR_ADDR_FROM_BGCNT(param0->unk29) + 0
                                              : BG_CHAR_ADDR_FROM_BGCNT(param0->unk29) + TILE_SIZE_4BPP;

        void *layout = ((u8 *)BG_VRAM + ((gBgCntRegs[param0->unk29] & BGCNT_SCREENBASE_MASK) << 3));

        if (param0->unk2A & 0x1) {
            gfx = UiGfxStackPop();

            if (gfx != NULL) {
                gfx->src = param0->tiles;
                gfx->dest = vram;
                gfx->size = param0->tilesSize;

                ADD_TO_GRAPHICS_QUEUE(gfx);
            }
        }

        if (param0->unk2A & 0x10) {
            gfx = UiGfxStackPop();

            if (gfx != NULL) {
                gfx->src = param0->layout;
                gfx->dest = layout;
                gfx->size = param0->layoutSize;

                ADD_TO_GRAPHICS_QUEUE(gfx);
            }
        }

        if (param0->unk2A & 0x4) {
            DmaCopy16(3, param0->palette, &gBgPalette[param0->unk28 * 16], param0->paletteSize);
            gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
        }
    }
}

// (86.06%) https://decomp.me/scratch/3jubn
NONMATCH("asm/non_matching/game/sa1/gTask_3006240__sub_8052AA4.inc", void sub_8052AA4(void))
{
    struct Strc_30063F0 *list = &gUnknown_030063C0;
    struct Strc_30063F0 *curr;
    struct Strc0 *strc0;
    Task_3006240 *strc;
    s32 vramOffset;
    void *vram;
    u32 i, j;

    while (list->next != NULL) {
        curr = list->next;
        list = curr;

#ifndef NON_MATCHING
        strc0 = &TASK_GET_MEMBER(Task_3006240, gTask_03006240, struct Strc0, unk0[0]);
        strc0 = &strc0[curr->unk1C];
#else
        strc = TASK_DATA(gTask_03006240);
        strc0 = &strc->unk0[curr->unk1C];
#endif
        vramOffset = (curr->unk14 << 6);
        vramOffset += ((curr->unk10 + list->unk20) << 1);
        vramOffset += ((gBgCntRegs[curr->unk18] & BGCNT_SCREENBASE(0x1F)) << 3);
        vram = (u8 *)BG_VRAM + vramOffset;

        for (i = 0; i < curr->unk20; i++) {
            u16 *dest;
            for (j = 0, dest = vram + (strc0->unk4 * j); j < strc0->unkB; dest += 0x20, j++) {
                *dest = (strc0->unk4 * FROM_UI_DIGIT(curr->unk4[j])) + i;
            }
        }
    }

    list->next = gUnknown_030063F0;
    gUnknown_030063F0->next = gUnknown_030063C0.next;
    gUnknown_030063C0.next = NULL;
}
END_NONMATCH

NONMATCH("asm/non_matching/game/sa1/gTask_3006240__unused_8052B84.inc", void unused_8052B84(s32 param0, u16 param1, u16 param2, u8 param3))
{
}
END_NONMATCH

void sub_8052C84(const char *param0, Strc_8052C84 *param1)
{
    Strc0 *strc0;
    u32 u8;
    OamData sp00;
    OamData *oamStack;
    OamData *oamStack2;
    s32 a, b;
    s32 sp08;
    s32 r0;
    s32 sl;
    s32 r8;
    s32 i;

#ifndef NON_MATCHING
    strc0 = &TASK_GET_MEMBER(Task_3006240, gTask_03006240, struct Strc0, unk0[0]);
    strc0 = &strc0[param1->unk10];
#else
    Task_3006240 *strc = TASK_DATA(gTask_03006240);
    strc0 = &strc->unk0[param1->unk10];
#endif

    if (((u16)param1->unk4 == 0) && (param1->unk0 == Q(1) && param1->unk2 == Q(1))) {
        r8 = 0;
        r0 = 0;
    } else {
        SA2_LABEL(sub_80047A0)(param1->unk4, param1->unk0, param1->unk2, param1->unk6);
        r8 = param1->unk6;
        r0 = 3;
    }

    {

        for (i = 0, sl = r0 << 8; i < param1->byteCount; i++) {
            OamData *oam = OamMalloc((param1->unk8) >> 3);

            if (iwram_end == oam) {
                break;
            }

            oam->all.attr0 = ((strc0->unk9 << 14)) | (param1->unkC & 0xFF) | (sl) | 0x400;
            oam->all.attr1 = ((strc0->unk8 << 14) | (r8 << 9)) | ((((strc0->unkA * i) << 3) + param1->unkA) & 0x1FF);
            a = (param1->unk12 << 12);
            b = strc0->unk4 * FROM_UI_DIGIT(param0[i]);
            a += strc0->unk0 + b;
            oam->all.attr2 = +a;
        }
    }
}

// (97.98%) https://decomp.me/scratch/z75P3
NONMATCH("asm/non_matching/game/sa1/gTask_3006240__sub_8052D64.inc", void sub_8052D64(u8 *param0, Strc_8052C84 *param1))
{
    Strc0 *strc0;
    u32 u8;
    OamData sp00;
    OamData *oamStack;
    OamData *oamStack2;
    s32 a;
    s32 sp08, r9;
    s32 r8;
    s32 r2;

#ifndef NON_MATCHING
    strc0 = &TASK_GET_MEMBER(Task_3006240, gTask_03006240, struct Strc0, unk0[0]);
    strc0 = &strc0[param1->unk10];
#else
    Task_3006240 *strc = TASK_DATA(gTask_03006240);
    strc0 = &strc->unk0[param1->unk10];
#endif

    SA2_LABEL(sub_80047A0)(param1->unk4, param1->unk0, param1->unk2, param1->unk6);

    {
        s32 i;
        r8 = param1->unk6;
        r9 = 3;

        oamStack = &sp00;
        oamStack->all.attr0 = ((r9 << 8) | (strc0->unk9 << 14)) | (param1->unkC & 0xFF);
        oamStack->all.attr2 = (param1->unk12 << 12) | (strc0->unk0 & 0x3FF);

        for (i = 0, oamStack2 = &sp00; i < param1->byteCount; i++) {
            OamData *oam = OamMalloc((param1->unk8) >> 3);

            if (iwram_end == oam) {
                break;
            }

            oam->all.attr0 = oamStack2->all.attr0;
            oam->all.attr1 = ((strc0->unk8 << 14) | (r8 << 9)) | ((((strc0->unkA * i) << 3) + param1->unkA) & 0x1FF);
            oam->all.attr2 = oamStack2->all.attr2 + strc0->unk4 * FROM_UI_DIGIT(param0[i]);
        }
    }
}
END_NONMATCH

void sub_8052E40(u8 *param0, Strc_8052C84 *param1)
{
    Strc0 *strc0;
    u32 u8;
    OamData sp00;
    OamData *oamStack, *oamStack2;
    s32 a;
    s32 sp08, r9;
    s32 sl;
    s32 r2;

#ifndef NON_MATCHING
    strc0 = &TASK_GET_MEMBER(Task_3006240, gTask_03006240, struct Strc0, unk0[0]);
    strc0 = &strc0[param1->unk10];
#else
    Task_3006240 *strc = TASK_DATA(gTask_03006240);
    strc0 = &strc->unk0[param1->unk10];
#endif

    sl = param1->unk6;

    {
        s32 i;
        sl = param1->unk6;
        r9 = 3;
        for (i = 0; i < param1->byteCount; i++) {
            OamData *oam = OamMalloc((param1->unk8) >> 3);

            if (iwram_end == oam) {
                break;
            }

            oam->all.attr0 = (strc0->unk9 << 14) + (r9 << 8) + (param1->unkC & 0x1FF);
            oam->all.attr1 = (strc0->unk8 << 14) + (sl << 9) + ((param1->unk0 * i) >> 5) + param1->unkA;
            r2 = (param1->unk12 << 12);
            r2 += strc0->unk0 + strc0->unk4 * FROM_UI_DIGIT(param0[i]);
            oam->all.attr2 = +r2;
        }
    }
}

// Unused?
// (88.18%) https://decomp.me/scratch/i72oQ
NONMATCH("asm/non_matching/game/sa1/gTask_3006240__sub_8052EF0.inc", void sub_8052EF0(s32 param0, Strc_8052C84 *param1))
{
    s32 byteCount = 0;
    char sp00[10];
    s32 i;

    param1->byteCount = byteCount;

    for (i = (s32)ARRAY_COUNT(sp00) - 1; i >= 0; i--) {
        s16 remainder = Div(param0, 10);
        sp00[i] = (param0 - ((remainder << 3) + (remainder << 1))) + 0x30;
        param0 = remainder;
        param1->byteCount++;
    }

    for (i = 0; (i < (s32)ARRAY_COUNT(sp00)) && (sp00[i] == 0x30); i++) {
        byteCount++;
        param1->byteCount--;
    }

    param1->unkA -= (param1->unk0 * (param1->byteCount - 1)) >> 5;

    sub_8052C84(&sp00[byteCount], param1);
}
END_NONMATCH

// (97.64%) https://decomp.me/scratch/8KTZ5
NONMATCH("asm/non_matching/game/sa1/gTask_3006240__sub_8052F78.inc", void sub_8052F78(const char *param0, GameOverB *param1))
{
    Strc0 *strc0;
    u32 u8;
    OamData sp00;
    OamData *oamStack, *oamStack2;
    s32 a;
    s32 sp08, r9;

#ifndef NON_MATCHING
    strc0 = &TASK_GET_MEMBER(Task_3006240, gTask_03006240, struct Strc0, unk0[0]);
    strc0 = &strc0[param1->unk10];
#else
    Task_3006240 *strc = TASK_DATA(gTask_03006240);
    strc0 = &strc->unk0[param1->unk10];
#endif
    r9 = strc0->unkA * 8;
    sp08 = strc0->unkB * 8;

    oamStack = &sp00;
    a = (strc0->unk9 << 14) + (unsigned char)param1->unkC + 0x400;
    oamStack->all.attr0 = a;
    oamStack->all.attr1 = (strc0->unk8 << 14) + (param1->qUnkA & 0x1FF);
    oamStack->all.attr2 = (param1->unk12 << 12) | (strc0->unk0 & 0x3FF);

    if (param1->unk16 != 0) {
        s32 i;
        for (i = 0; i < param1->unkE; i++) {
            OamData *oam = OamMalloc((param1->unk8) >> 3);

            if (iwram_end == oam) {
                break;
            }

            oam->all.attr0 = sp00.all.attr0;
            oam->all.attr1 = sp00.all.attr1;
            sp00.all.attr1 += r9;
            oam->all.attr2 = sp00.all.attr2 + FROM_UI_DIGIT(param0[i]) * strc0->unk4;
        }
    } else {
        s32 i = 0;
        for (i = 0; i < param1->unk14; i++) {
            s32 w;
            sp00.all.attr1 = (strc0->unk8 << 14) + (param1->qUnkA & 0x1FF);
            w = ((s32)(-param1->qUnkA & 0x1FF) >> 7);
            while (w < param1->unkE) {
                OamData *oam = OamMalloc((param1->unk8) >> 3);

                if (iwram_end == oam) {
                    break;
                }

                oam->all.attr0 = sp00.all.attr0;
                oam->all.attr1 = sp00.all.attr1;
                sp00.all.attr1 += r9;

                oam->all.attr2 = sp00.all.attr2 + FROM_UI_DIGIT(param0[w]) * strc0->unk4;
                w++;
            }
            sp00.all.attr0 = sp08 + sp00.all.attr0;
        }
    }
}
END_NONMATCH

// (97.61%) https://decomp.me/scratch/qWdSy
NONMATCH("asm/non_matching/game/sa1/gTask_3006240__sub_80530CC.inc", void sub_80530CC(const char *param0, GameOverB *param1))
{
    Strc0 *strc0;
    u32 u8;
    OamData sp00;
    OamData *oamStack, *oamStack2;
    s32 a;
    s32 sp08, r9;

#ifndef NON_MATCHING
    strc0 = &TASK_GET_MEMBER(Task_3006240, gTask_03006240, struct Strc0, unk0[0]);
    strc0 = &strc0[param1->unk10];
#else
    Task_3006240 *strc = TASK_DATA(gTask_03006240);
    strc0 = &strc->unk0[param1->unk10];
#endif
    r9 = strc0->unkA * 8;
    sp08 = strc0->unkB * 8;

    oamStack = &sp00;
    a = (strc0->unk9 << 14) + (unsigned char)param1->unkC;
    oamStack->all.attr0 = a;
    oamStack->all.attr1 = (strc0->unk8 << 14) + (param1->qUnkA & 0x1FF);
    oamStack->all.attr2 = (param1->unk12 << 12) | (strc0->unk0 & 0x3FF);

    if (param1->unk16 != 0) {
        s32 i;
        for (i = 0; i < param1->unkE; i++) {
            OamData *oam = OamMalloc((param1->unk8) >> 3);

            if (iwram_end == oam) {
                break;
            }

            oam->all.attr0 = sp00.all.attr0;
            oam->all.attr1 = sp00.all.attr1;
            sp00.all.attr1 += r9;
            oam->all.attr2 = sp00.all.attr2 + FROM_UI_DIGIT(param0[i]) * strc0->unk4;
        }
    } else {
        s32 i = 0;
        for (i = 0; i < param1->unk14; i++) {
            s32 w;
            sp00.all.attr1 = (strc0->unk8 << 14) + (param1->qUnkA & 0x1FF);
            w = ((s32)(-param1->qUnkA & 0x1FF) >> 7);
            while (w < param1->unkE) {
                OamData *oam = OamMalloc((param1->unk8) >> 3);

                if (iwram_end == oam) {
                    break;
                }

                oam->all.attr0 = sp00.all.attr0;
                oam->all.attr1 = sp00.all.attr1;
                sp00.all.attr1 += r9;

                oam->all.attr2 = sp00.all.attr2 + FROM_UI_DIGIT(param0[w]) * strc0->unk4;
                w++;
            }
            sp00.all.attr0 = sp08 + sp00.all.attr0;
        }
    }
}
END_NONMATCH

// (97.91%) https://decomp.me/scratch/3w39X
NONMATCH("asm/non_matching/game/sa1/gTask_3006240__sub_805321C.inc", void sub_805321C(u8 *param0, GameOverB *param1))
{
    Strc0 *strc0;
    u32 u8;
    OamData sp00;
    OamData *oamStack, *oamStack2;
    s32 a;
    s32 sp08, r9;

#ifndef NON_MATCHING
    strc0 = &TASK_GET_MEMBER(Task_3006240, gTask_03006240, struct Strc0, unk0[0]);
    strc0 = &strc0[param1->unk10];
#else
    Task_3006240 *strc = TASK_DATA(gTask_03006240);
    strc0 = &strc->unk0[param1->unk10];
#endif
    r9 = strc0->unkA * 8;
    sp08 = strc0->unkB * 8;

    oamStack = &sp00;
    a = (strc0->unk9 << 14) + (unsigned char)param1->unkC;
    oamStack->all.attr0 = a;
    oamStack->all.attr1 = (strc0->unk8 << 14) + (param1->qUnkA & 0x1FF);
    oamStack->all.attr2 = (param1->unk12 << 12) | (strc0->unk0 & 0x3FF);

    if (param1->unk16 != 0) {
        s32 i;
        for (i = 0; i < param1->unkE; i++) {
            OamData *oam = OamMalloc((param1->unk8 + i) >> 3);

            if (iwram_end == oam) {
                break;
            }

            oam->all.attr0 = sp00.all.attr0;
            oam->all.attr1 = sp00.all.attr1;
            sp00.all.attr1 += r9;
            oam->all.attr2 = sp00.all.attr2 + FROM_UI_DIGIT(param0[i]) * strc0->unk4;
        }
    } else {
        s32 i = 0;
        for (i = 0; i < param1->unk14; i++) {
            s32 w;
            sp00.all.attr1 = (strc0->unk8 << 14) + (param1->qUnkA & 0x1FF);
            w = ((s32)(-param1->qUnkA & 0x1FF) >> 7);
            while (w < param1->unkE) {
                OamData *oam = OamMalloc((param1->unk8 + w) >> 3);

                if (iwram_end == oam) {
                    break;
                }

                oam->all.attr0 = sp00.all.attr0;
                oam->all.attr1 = sp00.all.attr1;
                sp00.all.attr1 += r9;

                oam->all.attr2 = sp00.all.attr2 + FROM_UI_DIGIT(param0[w]) * strc0->unk4;
                w++;
            }
            sp00.all.attr0 = sp08 + sp00.all.attr0;
        }
    }
}
END_NONMATCH

// TODO: The 2nd parameter's type is just a guess!
//
// (94.91%) https://decomp.me/scratch/B60WP
NONMATCH("asm/non_matching/game/sa1/gTask_3006240__sub_8053370.inc", void sub_8053370(u8 *param0, GameOverB *param1))
{
    Strc0 *strc0;
    u32 u8;
    OamData sp00;
    OamData *oamStack, *oamStack2;
    s32 i;
    s32 a;
    s32 r8;

#ifndef NON_MATCHING
    strc0 = &TASK_GET_MEMBER(Task_3006240, gTask_03006240, struct Strc0, unk0[0]);
    strc0 = &strc0[param1->unk10];
#else
    Task_3006240 *strc = TASK_DATA(gTask_03006240);
    strc0 = &strc->unk0[param1->unk10];
#endif
    r8 = strc0->unkA * 8;

    oamStack = &sp00;
    a = (strc0->unk9 << 14) + (unsigned char)param1->unkC;
    oamStack->all.attr0 = a;
    oamStack->all.attr1 = (strc0->unk8 << 14) + (param1->qUnkA & 0x1FF);
    oamStack->all.attr2 = (param1->unk12 << 12) | (strc0->unk0 & 0x3FF);

    for (i = 0; i < param1->unkE; i++) {
        if (param0[i] == UI_DIGIT(0)) {
            sp00.all.attr1 += r8;
        } else {
            OamData *oam = OamMalloc((param1->unk8 + i) >> 3);
            s32 v;

            if (iwram_end == oam) {
                break;
            }

            oam->all.attr0 = sp00.all.attr0;
            oam->all.attr1 = sp00.all.attr1;
            sp00.all.attr1 += r8;

            if (param0[i] > UI_DIGIT(0x40)) {
                oam->all.attr0 += 8;

                v = param0[i] - 0x11;
            } else {
                v = FROM_UI_DIGIT(param0[i]);
            }

            oam->all.attr2 = sp00.all.attr2 + v * strc0->unk4;
            oam->all.attr2 &= ~0xC00;
        }
    }
}
END_NONMATCH

// TODO: The 2nd parameter's type is just a guess!
//
// (97.74%) https://decomp.me/scratch/fMp61
NONMATCH("asm/non_matching/game/sa1/gTask_3006240__sub_805345C.inc", void sub_805345C(u8 *param0, GameOverB *param1))
{
    Strc0 *strc0;
    u32 u8;
    OamData sp00;
    OamData *oamStack, *oamStack2;
    s32 i;
    s32 a;
    s32 r8;

#ifndef NON_MATCHING
    strc0 = &TASK_GET_MEMBER(Task_3006240, gTask_03006240, struct Strc0, unk0[0]);
    strc0 = &strc0[param1->unk10];
#else
    Task_3006240 *strc = TASK_DATA(gTask_03006240);
    strc0 = &strc->unk0[param1->unk10];
#endif
    r8 = strc0->unkA * 8;

    oamStack = &sp00;
    a = (strc0->unk9 << 14) + (unsigned char)param1->unkC;
    oamStack->all.attr0 = a;
    oamStack->all.attr1 = (strc0->unk8 << 14) + (param1->qUnkA & 0x1FF);
    oamStack->all.attr2 = (param1->unk12 << 12) | (strc0->unk0 & 0x3FF) | 0x800;

    for (i = 0; i < param1->unkE; i++) {
        OamData *oam = OamMalloc((param1->unk8 + i) >> 3);

        if (iwram_end == oam) {
            break;
        }

        oam->all.attr0 = sp00.all.attr0;
        oam->all.attr1 = sp00.all.attr1;
        sp00.all.attr1 += r8;
        oam->all.attr2 = sp00.all.attr2 + FROM_UI_DIGIT(param0[i]) * strc0->unk4;
    }
}
END_NONMATCH

void sub_8053520(u8 *param0, s32 param1, s32 param2, u8 param3, u8 param4)
{
    if (gUnknown_030063F0) {
        struct Strc_30063F0 *unkStrc = gUnknown_030063F0;

        s32 i;

        for (i = 0; i < 10; i++) {
            // TODO: Is 0x20 a space char (' ')?
            if (param0[i] == 0x20) {
                break;
            }
        }

        unkStrc->unk20 = i;

        if (i > 0) {
            s32 j = 0;
            struct Strc_30063F0 *curr;

            for (; j < unkStrc->unk20; j++) {
                unkStrc->unk4[j] = param0[j];
            }

            unkStrc->unk10 = param1;
            unkStrc->unk14 = param2;
            unkStrc->unk18 = param3;
            unkStrc->unk1C = param4;

            curr = &gUnknown_030063C0;
            while (curr->next != NULL) {
                curr = curr->next;
            }

            curr->next = unkStrc;
            gUnknown_030063F0 = unkStrc->next;

            unkStrc->next = NULL;
        }
    }
}

void sub_80535C8(struct Strc0 *inTask, u8 param1)
{
    Task_3006240 *strc = TASK_DATA(gTask_03006240);
    struct Strc0 *src = &strc->unk0[param1];

    src->unk4 = inTask->unk4;
    src->unk8 = inTask->unk8;
    src->unk9 = inTask->unk9;
    src->unkA = inTask->unkA;
    src->unkB = inTask->unkB;
}

// (94.42%) https://decomp.me/scratch/QDnYo
NONMATCH("asm/non_matching/game/sa1/gTask_3006240__sub_80535FC.inc", void sub_80535FC(void))
{
    if (gTask_03006240 == NULL) {
        struct Strc_3006250 *zeroth = &gUnknown_03006250[0];
        struct Strc_30063F0 **test = &gUnknown_030063F0;
        struct Strc_30063F0 *test2 = &gUnknown_030063C0;
#ifndef NON_MATCHING
        register void *taskPtr asm("ip") = Task_80536D4;
#else
        void *taskPtr = Task_80536D4;
#endif
        void *dtorPtr = TaskDestructor_80536D8;
        struct Strc_3006250 *second = &gUnknown_03006250[ARRAY_COUNT(gUnknown_03006250) - 1];
        struct Strc_3006250 *curr = &gUnknown_03006250[ARRAY_COUNT(gUnknown_03006250) - 2];
        void *nullPtr;

        do {
            curr->next = second;

            second--, curr--;
        } while ((intptr_t)curr >= (intptr_t)zeroth);

        nullPtr = NULL;
        gUnknown_03006250[ARRAY_COUNT(gUnknown_03006250) - 1].next = nullPtr;
        *test = (void *)&gUnknown_03006250[0];
        test2->next = nullPtr;
        gTask_03006240 = TaskCreate(taskPtr, sizeof(Task_3006240), 0x1800, 0, dtorPtr);
        UiGfxStackInit();
    }
}
END_NONMATCH

IwramData UiGfxStackInit(void)
{
    Task_3006240 *strc = TASK_DATA(gTask_03006240);
    struct GfxSubstruct *curr = &strc->gfxList[0];
    struct GfxSubstruct *next = &strc->gfxList[1];
    IwramData offset;
    s32 i;

    for (i = 0; i < (s32)ARRAY_COUNT(strc->gfxList) - 2; curr++, next++, i++) {
        // Set all "active" elements
        curr->next = next;
    }
    // Set last "active" element's next ptr to empty element
    curr->next = next;

    offset = gTask_03006240->data;
    strc = TASK_DATA(gTask_03006240);
    strc->first = &strc->gfxList[0];

    return offset;
}

struct GraphicsData *UiGfxStackPop(void)
{
    Task_3006240 *strc = TASK_DATA(gTask_03006240);
    struct GfxSubstruct *curr;

    curr = strc->first;

    if (curr != NULL) {
        strc->first = curr->next;
    } else {
        return NULL;
    }

    return &curr->graphics;
}

void Task_80536D4(void) { }

void TaskDestructor_80536D8(struct Task *t) { gTask_03006240 = NULL; }
