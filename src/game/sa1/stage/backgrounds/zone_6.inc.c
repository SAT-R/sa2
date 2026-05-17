#include "global.h"
#include "core.h"
#include "flags.h"
#include "bg_triangles.h"
#include "animation_commands_bg.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/sa1/stage/backgrounds/zone_6.h"

// Act 1
#define BG_LINE_OUTSIDE_START 256

// Act 2
#define BG_LINE_CEILING_START 0
#define BG_LINE_CEILING_END   120
#define BG_LINE_BELT_A_START  120
#define BG_LINE_BELT_A_END    136
#define BG_LINE_WALL_A_START  136
#define BG_LINE_WALL_A_END    176
#define BG_LINE_BELT_B_START  176
#define BG_LINE_BELT_B_END    192
#define BG_LINE_WALL_B_START  192
#define BG_LINE_WALL_B_END    232

void StageBgUpdate_Zone6Act1(s32 x, s32 y)
{
    Camera *cam = &gCamera;

    x -= cam->SA2_LABEL(unk20);

    if (cam->SA2_LABEL(unk50) & 0x2000) {
        return;
    }

    if (gBossIndex == 0) {
        // Initially set BG3 to use the full 256x512 tilemap
        // and set its Y-position to the launch tower in the Sunset.
        gBgCntRegs[3] &= ~BGCNT_TXTAFF_MASK;
        gBgCntRegs[3] |= BGCNT_TXT256x512;
        gBgCntRegs[3] &= ~BGCNT_SCREENBASE_MASK;
        gBgCntRegs[3] |= BGCNT_SCREENBASE(CAM_SCREENBASE_BACK_C + 2);

        gBgScrollRegs[3][0] = cam->SA2_LABEL(unk52) = Div(x * 16, 816);

        cam->SA2_LABEL(unk54) = BG_LINE_OUTSIDE_START;
        gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54);
    } else if (gBossIndex < 3) {
        if (!(cam->SA2_LABEL(unk50) & 0x8000)) {
            gBgCntRegs[3] &= ~BGCNT_TXTAFF_MASK;
            gBgCntRegs[3] |= BGCNT_TXT256x512;
            gBgCntRegs[3] &= ~BGCNT_SCREENBASE_MASK;
            gBgCntRegs[3] |= BGCNT_SCREENBASE(CAM_SCREENBASE_BACK_C + 2);

            gBgScrollRegs[3][0] = cam->SA2_LABEL(unk52) = Div(x * 16, 816);

            if (((-(gStageTime * 2)) & 0x1FF) == gBgScrollRegs[3][1]) {
                cam->SA2_LABEL(unk50) |= 0x8000;
            }
        } else {
            // _0803EF80

            if (((-(gStageTime * 2)) & 0x1FF) == 0) {
                gBgCntRegs[3] &= ~BGCNT_TXTAFF_MASK;
                gBgCntRegs[3] |= BGCNT_TXT256x256;
            }

            gBgCntRegs[3] &= ~BGCNT_SCREENBASE_MASK;
            gBgCntRegs[3] |= BGCNT_SCREENBASE(CAM_SCREENBASE_BACK_C + 2);

            gBgScrollRegs[3][0] = cam->SA2_LABEL(unk52) = 0;

            if ((gBgCntRegs[3] & BGCNT_TXTAFF_MASK) == BGCNT_TXT256x256) {
                gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54) = (-(gStageTime * 2)) & 0xFF;
            } else {
                gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54) = (-(gStageTime * 2)) & 0x1FF;
            }
        }
    } else if (gBossIndex == 3) {
        if ((gBgCntRegs[3] & BGCNT_SCREENBASE_MASK) == BGCNT_SCREENBASE(CAM_SCREENBASE_BACK_C + 2)) {
            gBgScrollRegs[3][0] = cam->SA2_LABEL(unk52) = 0;
            gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54) = (-(gStageTime * 2)) & 0xFF;

            if (((-(gStageTime * 2)) & 0x1FF) == 256) {
                if ((cam->SA2_LABEL(unk50) & 0x4000)) {
                    // _0803F04E
                    gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54) = BG_LINE_OUTSIDE_START;

                    gBgCntRegs[3] &= ~BGCNT_TXTAFF_MASK;
                    gBgCntRegs[3] |= BGCNT_TXT256x512;

                    gBgCntRegs[3] &= ~BGCNT_SCREENBASE_MASK;
                    gBgCntRegs[3] |= BGCNT_SCREENBASE(CAM_SCREENBASE_BACK_C + 1);
                }
            }
        } else if ((gBgCntRegs[3] & BGCNT_SCREENBASE_MASK) == BGCNT_SCREENBASE(CAM_SCREENBASE_BACK_C + 1)) {
            // _0803F090 + 0x8
            u16 mask;

            gBgScrollRegs[3][0] = cam->SA2_LABEL(unk52) = 0;
            gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54) = (-(gStageTime * 2)) & 0x1FF;

            mask = 0x1FF;
            if (((-(gStageTime * 2)) & mask) == 0) {
                // _0803F0C0
                gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54) = -((gStageTime * 2 + 256)) & mask;

                gBgCntRegs[3] &= ~BGCNT_TXTAFF_MASK;
                gBgCntRegs[3] |= BGCNT_TXT256x512;

                gBgCntRegs[3] &= ~BGCNT_SCREENBASE_MASK;
                gBgCntRegs[3] |= BGCNT_SCREENBASE(CAM_SCREENBASE_BACK_C);
            }
        } else if ((gBgCntRegs[3] & BGCNT_TXTAFF_MASK) == BGCNT_TXT256x512) {
            // _0803F114
            gBgScrollRegs[3][0] = cam->SA2_LABEL(unk52) = 0;
            gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54) = (-((gStageTime * 2) + 256)) & 0x1FF;

            if (gBgScrollRegs[3][1] < DISPLAY_HEIGHT) {
                gDispCnt |= DISPCNT_BG0_ON;

                gBgCntRegs[0] = gBgCntRegs[3] & ~BGCNT_TXTAFF_MASK;
                gBgCntRegs[0] |= BGCNT_TXT256x256;

                gBgCntRegs[0] &= ~BGCNT_SCREENBASE_MASK;
                gBgCntRegs[0] |= BGCNT_SCREENBASE(CAM_SCREENBASE_BACK_C);

                gBgScrollRegs[0][0] = cam->SA2_LABEL(unk52) = 0;
                gBgScrollRegs[0][1] = cam->SA2_LABEL(unk54) = (gStageTime >> 3) & 0xFF;

                gBldRegs.bldCnt = BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_BG0;
                gBldRegs.bldY = 0;

                if (IS_SINGLE_PLAYER) {
                    gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCallback_803FA1C;
                    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
                } else {
                    gBgCntRegs[0] &= ~BGCNT_TXTAFF_MASK;
                    gBgCntRegs[0] |= BGCNT_TXT256x512;

                    gBgScrollRegs[0][1] = DISPLAY_HEIGHT;
                }
            }
            // _0803F1EA

            if (gBgScrollRegs[3][1] == 0) {
                // _0803F1F6
                gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54) = (-(gStageTime * 2)) & 0xFF;

                gBgCntRegs[3] &= ~BGCNT_TXTAFF_MASK;
                gBgCntRegs[3] |= BGCNT_TXT256x256;

                gBgCntRegs[3] &= ~BGCNT_SCREENBASE_MASK;
                gBgCntRegs[3] |= BGCNT_SCREENBASE(CAM_SCREENBASE_BACK_C);

                gBgScrollRegs[0][0] = cam->SA2_LABEL(unk52) = 0;
                gBgScrollRegs[0][1] = cam->SA2_LABEL(unk54) = (gStageTime >> 1) & 0xFF;

                gBldRegs.bldCnt = BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_BG0;
                gBldRegs.bldY = 0;

                if (IS_SINGLE_PLAYER) {
                    gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCallback_803FA1C;
                    gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
                } else {
                    gBgCntRegs[0] &= ~BGCNT_TXTAFF_MASK;
                    gBgCntRegs[0] |= BGCNT_TXT256x512;

                    gBgScrollRegs[0][1] = DISPLAY_HEIGHT;
                }
            }
        } else {
            // _0803F2A2
            gBgCntRegs[3] &= ~BGCNT_TXTAFF_MASK;
            gBgCntRegs[3] |= BGCNT_TXT256x256;

            gBgCntRegs[3] &= ~BGCNT_SCREENBASE_MASK;
            gBgCntRegs[3] |= BGCNT_SCREENBASE(CAM_SCREENBASE_BACK_C);

            gBgScrollRegs[3][0] = cam->SA2_LABEL(unk52) = 0;
            gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54) = (gStageTime >> 6) & 0xFF;

            gBgCntRegs[0] &= ~BGCNT_TXTAFF_MASK;
            gBgCntRegs[0] |= BGCNT_TXT256x256;

            gBgCntRegs[0] &= ~BGCNT_SCREENBASE_MASK;
            gBgCntRegs[0] |= BGCNT_SCREENBASE(CAM_SCREENBASE_BACK_C);

            gBgScrollRegs[0][0] = cam->SA2_LABEL(unk52) = 0x74;
            gBgScrollRegs[0][1] = cam->SA2_LABEL(unk54) = (gStageTime >> 3) & 0xFF;

            gBldRegs.bldCnt = BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_BG0;
            gBldRegs.bldY = 0;

            if (IS_SINGLE_PLAYER) {
                gHBlankCallbacks[gNumHBlankCallbacks++] = HBlankCallback_803FA1C;
                gFlags |= FLAGS_EXECUTE_HBLANK_CALLBACKS;
            } else {
                gBgCntRegs[0] &= ~BGCNT_TXTAFF_MASK;
                gBgCntRegs[0] |= BGCNT_TXT256x512;

                gBgScrollRegs[0][1] = DISPLAY_HEIGHT;
            }

            if (!(cam->SA2_LABEL(unk50) & 0x8000)) {
                SA2_LABEL(sub_80078D4)(0, 0, 100, (u16)gBgScrollRegs[0][0], (u16)gBgScrollRegs[0][1]);
                SA2_LABEL(sub_80078D4)(0, 100, 104, 0, DISPLAY_HEIGHT);

                if ((128 - ((gStageTime >> 5) & 0x7F)) > 56) {
                    SA2_LABEL(sub_80078D4)(0, 104, 160, 0, ((gStageTime >> 5) & 0x7F) + 160);
                } else {
                    int_vcount v = 232 - ((gStageTime >> 5) & 0x7F);
                    int_vcount w;
                    SA2_LABEL(sub_80078D4)(0, 104, v, 0, ((gStageTime >> 5) & 0x7F) + 160);

                    w = 232 - ((gStageTime >> 5) & 0x7F);
                    SA2_LABEL(sub_80078D4)(0, w, 160, 0, ((gStageTime >> 5) & 0x7F) + 32);
                }
            }
        }
    }
}

void StageBgUpdate_Zone6Act2(s32 x, s32 y)
{
    Camera *cam = &gCamera;
    const Collision *coll;
#ifndef NON_MATCHING
    register s32 xSub asm("r9");
#else
    s32 xSub;
#endif
    s32 ySub;
    s32 scanline;
    s32 r4;
    u32 *ptr;
    s32 i;

    x -= cam->SA2_LABEL(unk20);
    y -= cam->SA2_LABEL(unk24);

    coll = gRefCollision;

    gBgScrollRegs[3][0] = cam->SA2_LABEL(unk52) = xSub = Div((x << 8) + (x << 4), coll->pxWidth - DISPLAY_WIDTH);
    gBgScrollRegs[3][1] = cam->SA2_LABEL(unk54) = ySub = Div((y << 6) + (y << 3), coll->pxHeight - DISPLAY_HEIGHT);

    // TODO: There should be a macro for this already!
    r4 = ((ySub << 16) | xSub);

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    gHBlankCopyTarget = (void *)&REG_BG3HOFS;
    gHBlankCopySize = 4;

    {
        ptr = gBgOffsetsHBlankPrimary;
        DmaFill32(3, r4, ptr, DISPLAY_HEIGHT * sizeof(r4));

        r4 = ((ySub << 16) | ((xSub - (gStageTime >> 1)) & 0x1FF));

        scanline = BG_LINE_BELT_A_START - ySub;

        ptr += scanline;
        for (i = 0; i < (BG_LINE_BELT_A_END - BG_LINE_BELT_A_START); i++) {
            if ((scanline + i) >= 0) {
                if ((scanline + i) >= DISPLAY_HEIGHT) {
                    break;
                }

                *ptr++ = r4;
            }
        }
    }

    {
        ptr = gBgOffsetsHBlankPrimary;

        r4 = ((ySub << 16) | (((gStageTime >> 1) + xSub) & 0x1FF));

        scanline = BG_LINE_BELT_B_START - ySub;

        ptr += scanline;
        for (i = 0; i < (BG_LINE_BELT_B_END - BG_LINE_BELT_B_START); i++) {
            if ((scanline + i) >= 0) {
                if ((scanline + i) >= DISPLAY_HEIGHT) {
                    break;
                }

                *ptr++ = r4;
            }
        }
    }
}
