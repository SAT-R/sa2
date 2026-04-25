#include "global.h"
#include "rect.h"
#include "sprite.h"
#include "lib/m4a/m4a.h"
#include "game/globals.h"

#include "game/shared/stage/player.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/terrain_collision.h"

#if (GAME == GAME_SA1)
#include "constants/sa1/char_states.h"
#elif (GAME == GAME_SA2)
#include "constants/sa2/char_states.h"
#endif

#if (GAME == GAME_SA2)
static u32 sub_800CE94(Sprite *s, s32 sx, s32 sy, Rect8 *inRect, Player *p);
#endif

// COLLISION 1

u32 Coll_Player_Platform(Sprite *s, CamCoord x, CamCoord y, Player *p)
{
#if (GAME == GAME_SA1)
    s8 rectOffset[4] = { -(p->spriteOffsetX + 5), (1 - p->spriteOffsetY), (p->spriteOffsetX + 5), (p->spriteOffsetY - 1) };
#endif
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };
    u32 result = COLL_NONE;
    bool32 stoodOnSprite = FALSE;
    u32 playerIsInAir;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0]) || !IS_ALIVE(p)) {
        return COLL_NONE;
    }

    playerIsInAir = p->moveState & MOVESTATE_IN_AIR;
    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
#if (GAME == GAME_SA1)
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        playerIsInAir |= MOVESTATE_IN_AIR;
        stoodOnSprite = TRUE;
#elif (GAME == GAME_SA2)
        stoodOnSprite = TRUE;
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        p->moveState |= MOVESTATE_IN_AIR;
#endif
    }

#if (GAME == GAME_SA1)
    if ((!playerIsInAir || !sub_800C934(s, x, y, (Rect8 *)&rectPlayer[0], stoodOnSprite, p, &result))
        && !sub_800CBBC(s, x, y, (Rect8 *)&rectOffset, stoodOnSprite, p, &result)
        && !sub_800C934(s, x, y, (Rect8 *)&rectPlayer[0], stoodOnSprite, p, &result)) {
#elif (GAME == GAME_SA2)
    result = sub_800CE94(s, x, y, (Rect8 *)rectPlayer, p);
    if (result != 0) {
        if (result & COLL_FLAG_10000) {
            p->moveState |= MOVESTATE_STOOD_ON_OBJ;
            p->moveState &= ~MOVESTATE_IN_AIR;
            p->stoodObj = s;

            if (!stoodOnSprite && s == NULL) {
                p->qSpeedGround = p->qSpeedAirX;
            }
        }
    } else {
#endif
        if (stoodOnSprite && !(p->moveState & MOVESTATE_STOOD_ON_OBJ)) {
            p->moveState &= ~MOVESTATE_20;
            p->moveState |= MOVESTATE_IN_AIR;
#if (GAME == GAME_SA2)
            p->stoodObj = NULL;
#ifndef COLLECT_RINGS_ROM
            if (IS_BOSS_STAGE(gCurrentLevel)) {
                p->qSpeedGround -= Q(gCamera.dx);
            }
#endif
#endif
        }
    }

    return result;
}

#if (GAME == GAME_SA2)
/**
 * Different to platform collision as never called in bosses
 * and doesn't handle jumping onto moving platforms etc.
 * Could be called static interactable collision?
 */
u32 Coll_Player_Interactable(Sprite *s, s32 sx, s32 sy, Player *p)
{
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    bool32 stoodOnSprite = FALSE;

    u32 mask;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0])) {
        return COLL_NONE;
    }

    if (!IS_ALIVE(p)) {
        return COLL_NONE;
    }

    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        stoodOnSprite = TRUE;
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
    }

    mask = sub_800CE94(s, sx, sy, (Rect8 *)rectPlayer, p);

    if (mask & COLL_FLAG_10000) {
        p->moveState |= MOVESTATE_STOOD_ON_OBJ;
        p->stoodObj = s;
    } else if (stoodOnSprite) {
        p->stoodObj = NULL;
#ifndef COLLECT_RINGS_ROM
        if (IS_BOSS_STAGE(gCurrentLevel)) {
            p->qSpeedGround -= Q(gCamera.dx);
        }
#endif
    }

    return mask;
}

// Looks like each byte in the result is one value
// TODO: Remove gotos
static u32 sub_800CE94(Sprite *s, s32 sx, s32 sy, Rect8 *inRect, Player *p)
{
    s32 px = I(p->qWorldX);
    s32 py = I(p->qWorldY);
    u32 result = 0;
    s32 r1;
    s32 r3, r6;

    if (RECT_COLLISION(sx, sy, (Rect8 *)&s->hitboxes[0].b.left, px, py, inRect)) {
        s32 sMidX = (sx + ((s->hitboxes[0].b.left + s->hitboxes[0].b.right) >> 1));
        s32 sMidY = (sy + ((s->hitboxes[0].b.top + s->hitboxes[0].b.bottom) >> 1));
        if ((sMidX <= px)) {
            r6 = (sx + s->hitboxes[0].b.right - (px + inRect->left));
            result |= COLL_FLAG_40000;
        } else {
            r6 = (sx + s->hitboxes[0].b.left - (px + inRect->right));
            result |= COLL_FLAG_80000;
        }

        if (sMidY > py) {
            r3 = sy + s->hitboxes[0].b.top - (py + inRect->bottom);
            r1 = r3 + 5;

            if ((r1) > 0) {
                r1 = 0;
            }
            result |= COLL_FLAG_10000;
        } else {
            r3 = sy + s->hitboxes[0].b.bottom - (py + inRect->top);
            r1 = r3 + 2;
            if ((r1) < 0) {
                r1 = 0;
            }
            result |= COLL_FLAG_20000;
        }
        // _0800CF90

        if (ABS(r6) < (ABS(r1))) {
            result &= (COLL_FLAG_40000 | COLL_FLAG_80000);
            goto temp_lbl;
        } else {
            result &= (COLL_FLAG_10000 | COLL_FLAG_20000);

            if (!(result & COLL_FLAG_10000)) {
                goto temp_lbl;
            }
        }

        if (GRAVITY_IS_INVERTED) {
            if (p->qSpeedAirY > 0) {
                return 0;
            }
        } else {
            if (p->qSpeedAirY < 0) {
                return 0;
            }
        }

        if (!(p->moveState & MOVESTATE_IN_AIR)) {
            if ((p->rotation + 0x20) & 0x40) {
                p->qSpeedGround = 0;
            }
        }

    temp_lbl:
        result |= (((r6 << 8) & 0xFF00) | (r3 & 0xFF));
        if (result & 0xC0000) {
            if (!(result & 0xFF00)) {
                result &= 0xFFF300FF;
            }
        } else {
            result &= 0xFFFF00FF;
        }

        if (!(result & (COLL_FLAG_10000 | COLL_FLAG_20000))) {
            result &= ~0xFF;
        }
    }

    return result;
}
#endif

// TODO: merge these onces matched
#if (GAME == GAME_SA1)
// (75.12%) https://decomp.me/scratch/FhZW1
NONMATCH("asm/non_matching/game/shared/stage/collision__sa2__sub_800D0A0.inc",
         u32 SA2_LABEL(sub_800D0A0)(Sprite *s, s16 worldX, s16 worldY, s16 qSpeedX, s16 qSpeedY, u8 layer, u32 arg6))
{
    s8 sp4[4]
        = { -(gPlayer.spriteOffsetX + 5), (1 - (u8)gPlayer.spriteOffsetY), (+(gPlayer.spriteOffsetX + 5)), (gPlayer.spriteOffsetY - 1) };
    s8 sp8[4] = { -gPlayer.spriteOffsetX, -gPlayer.spriteOffsetY, +gPlayer.spriteOffsetX, +gPlayer.spriteOffsetY };
    s32 sp30 = 0;
    s32 sp34 = 0;
    s32 sp38;
    s32 sp3C;
    s32 sp40 = (u16)(0x80 & gStageFlags);
    MultiplayerPlayer *mpPlayer = TASK_DATA(gCurTask);
    s8 spC[4] = { -(gPlayer.spriteOffsetX + 5), 1 - mpPlayer->unk58[0], +(gPlayer.spriteOffsetX + 5), mpPlayer->unk58[0] - 1 };
    s8 sp10[4] = {
        -(gPlayer.spriteOffsetX + 5),
        (1 - mpPlayer->unk58[0]),
        +(gPlayer.spriteOffsetX + 5),
        (mpPlayer->unk58[0] - 1),
    };

    Player *p;
    Player *p2;
    s16 temp_r1_12;
    s16 temp_r1_9;
    s16 temp_r2_8;
    s16 var_r1_2;
    s16 var_r1_3;
    s16 var_r2;
    s16 var_r2_2;
    s32 res;
    s32 temp_r0_7;
    s32 temp_r1_2;
    s32 temp_r1_3;
    s32 temp_r1_6;
    s32 temp_r1_7;
    s32 temp_r2_2;
    s32 temp_r2_3;
    s32 temp_r2_6;
    s32 temp_r3_5;
    s32 temp_r3_6;
    s32 temp_r3_9;
    s32 temp_r5_5;
    s32 var_r1;
    s8 *temp_r0;
    s8 *temp_r0_13;
    s8 *temp_r0_16;
    s8 *temp_r0_2;
    s8 *temp_r0_3;
    s8 *temp_r0_5;
    s8 *temp_r6_6;
    s8 *temp_r6_7;
    s8 *temp_r7;
    s8 temp_r0_11;
    s8 temp_r0_14;
    s8 temp_r0_17;
    s8 temp_r0_19;
    s8 temp_r0_20;
    s8 temp_r0_22;
    s8 temp_r0_23;
    s8 temp_r0_9;
    s8 temp_r1;
    s8 temp_r2_11;
    s8 temp_r2_12;
    s8 temp_r2_13;
    s8 temp_r2_15;
    s8 temp_r2_4;
    s8 temp_r2_5;
    s8 temp_r2_7;
    s8 temp_r2_9;
    s8 temp_r3_2;
    s8 temp_r3_3;
    s8 temp_r3_4;
    s8 temp_r5;
    s8 temp_r5_3;
    s8 temp_r5_4;
    s8 temp_r6;
    s8 temp_r6_2;
    s8 temp_r6_3;
    s8 temp_r6_4;
    s8 temp_r6_5;
    u32 temp_r1_10;
    u32 temp_r1_11;
    u32 temp_r1_13;
    u32 temp_r1_14;
    u32 temp_r1_15;
    u32 temp_r1_16;
    u32 temp_r1_17;
    u32 temp_r1_18;
    u32 temp_r1_4;
    u32 temp_r1_5;
    u32 temp_r3_7;
    u8 *temp_r0_4;
    u8 *temp_r0_6;
    u8 *temp_r4;

    if ((s->hitboxes[0].index == -1) || (gPlayer.moveState & 0x80) || ((worldX == I(gPlayer.qWorldX)) && (worldY == I(gPlayer.qWorldY)))) {
        return 0;
    }
    sp38 = gPlayer.qWorldX;
    sp3C = gPlayer.qWorldY;
    p = &gPlayer;
    if (layer != gPlayer.layer) {
        return sp30;
    }

    if ((8 & gPlayer.moveState) && (gPlayer.stoodObj == s)) {
        gPlayer.moveState &= ~8;
        sp34 = 1;
    }
    if (worldY == I(gPlayer.qWorldY)) {
        goto block_105;
    }
    temp_r3_3 = sp10[0];
    temp_r2_2 = worldX + temp_r3_3;
    temp_r0_7 = sp38 >> 8;
    temp_r6 = sp8[0];
    temp_r1_2 = temp_r0_7 + temp_r6;
    if (temp_r2_2 <= temp_r1_2) {
        if ((temp_r2_2 + ((&sp10[0])[2] - temp_r3_3)) < temp_r1_2) {
            if (temp_r2_2 < temp_r1_2) {
                goto block_105;
            }
            goto block_15;
        }
        goto block_17;
    }
block_15:
    if ((temp_r1_2 + ((&sp8[0])[2] - temp_r6)) < temp_r2_2) {
        goto block_105;
    }
block_17:
    temp_r3_4 = (&sp10[0])[1];
    temp_r2_3 = worldY + temp_r3_4;
    temp_r6_2 = (&sp8[0])[1];
    temp_r1_3 = I(gPlayer.qWorldY) + temp_r6_2;
    if (temp_r2_3 <= temp_r1_3) {
        if ((temp_r2_3 + ((&sp10[0])[3] - temp_r3_4)) < temp_r1_3) {
            if (temp_r2_3 < temp_r1_3) {
                goto block_105;
            }
            goto block_21;
        }
        goto block_23;
    }
block_21:
    if ((temp_r1_3 + ((&sp8[0])[3] - temp_r6_2)) < temp_r2_3) {
        goto block_105;
    }
block_23:
    // if (sp40 == 0)
    {
        if ((I(gPlayer.qWorldY) > worldY) || ((gPlayer.qSpeedAirY - qSpeedY) < 0)) {
            goto block_72;
        }

        if (sp40 == 0) {
            temp_r3_9 = sp3C + ((((worldY + (&sp10[0])[1]) - (&sp8[0])[3]) << 8) - (gPlayer.qWorldY & 0xFFFFFF00));
            sp3C = temp_r3_9;
            res = sa2__sub_801F100((temp_r3_9 >> 8) - gPlayer.spriteOffsetY, temp_r0_7, layer, -8, sa2__sub_801EC3C);
            if (res < 0) {
                temp_r1_17 = gPlayer.moveState & ~4;
                gPlayer.moveState = temp_r1_17;
                if (((gPlayer.character != 2)
                     || ((temp_r0_22 = (s8) * (&gPlayer.character - 0x1C), (temp_r0_22 != 1)) && (temp_r0_22 != 3)))
                    && ((gPlayer.character != 3) || !(temp_r1_17 & 0x04000000) || (gPlayer.SA2_LABEL(unk62) == 0))) {
                    gPlayer.moveState &= ~2;
                }
                PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
                gPlayer.charState = 4;
                goto block_197;
            } else {
                if (!(gPlayer.moveState & 0x2)) {
                    sp30 |= MOVESTATE_20;
                    sp30 &= ~MOVESTATE_SPIN_ATTACK;
                }
            }
            sp30 |= 8;
            gPlayer.moveState |= 8;
            if (((gPlayer.character != 2) || ((temp_r0_23 = (s8) * (&gPlayer.character - 0x1C), (temp_r0_23 != 1)) && (temp_r0_23 != 3)))
                && ((gPlayer.character != 3) || !(gPlayer.moveState & 0x04000000) || (gPlayer.SA2_LABEL(unk62) == 0))) {
                gPlayer.moveState &= ~2;
            }
            gPlayer.stoodObj = s;
            gPlayer.qSpeedAirY = 0;
            gPlayer.qWorldY = sp3C;
        } else {
            sp3C += (Q(worldY + sp10[3] - sp8[3]) - (gPlayer.qWorldY & 0xFFFFFF00));
            res = sa2__sub_801F100((sp3C >> 8) + gPlayer.spriteOffsetY, temp_r0_7, layer, 8, sa2__sub_801EC3C);
            if (res < 0) {
                temp_r1_15 = gPlayer.moveState & ~4;
                gPlayer.moveState = temp_r1_15;
                temp_r2_12 = gPlayer.character;
                if (((temp_r2_12 != 2) || ((temp_r0_19 = (s8) * (&gPlayer.character - 0x1C), (temp_r0_19 != 1)) && (temp_r0_19 != 3)))
                    && ((temp_r2_12 != 3) || !(temp_r1_15 & 0x04000000) || (gPlayer.SA2_LABEL(unk62) == 0))) {
                    gPlayer.moveState &= ~2;
                }
                PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
                gPlayer.qSpeedAirY = 0;
                gPlayer.qWorldY += res << 8;
                goto block_197;
            } else {
                sp30 |= 8;
                gPlayer.moveState |= 8;
                if (((gPlayer.character != 2) || ((temp_r0_20 = gPlayer.variant, (temp_r0_20 != 1)) && (temp_r0_20 != 3)))
                    && ((gPlayer.character != 3) || !(gPlayer.moveState & MOVESTATE_4000000) || (gPlayer.SA2_LABEL(unk62) == 0))) {
                    gPlayer.moveState &= ~2;
                }
                gPlayer.stoodObj = s;
                gPlayer.qSpeedAirY = 0;
                gPlayer.qWorldY = sp3C;
                if (sp34 != 0) {
                    goto block_198;
                } else {
                    goto block_70;
                }
            }
        }
    }
    if ((I(gPlayer.qWorldY) <= worldY) || ((gPlayer.qSpeedAirY + qSpeedY) < 0)) {
        if (sp40 == 0) {
        block_72:
            if ((I(gPlayer.qWorldY) <= worldY) || ((gPlayer.qSpeedAirY - qSpeedY) >= 0)) {
                if (sp40 == 0) {
                    goto block_105;
                }
                goto block_76;
            }
            goto block_80;
        }
    block_76:
        if ((I(gPlayer.qWorldY) > worldY) || ((gPlayer.qSpeedAirY + qSpeedY) >= 0)) {
            goto block_105;
        }
    block_80:
        if (sp40 == 0) {
            res = sa2__sub_801F100(gPlayer.spriteOffsetY + I(gPlayer.qWorldY), temp_r0_7, layer, 8, sa2__sub_801EC3C);
            if (res < 0) {
                gPlayer.moveState &= ~4;
                ;
                if (((gPlayer.character != 2) || ((temp_r0_9 = (s8) * (&gPlayer.character - 0x1C), (temp_r0_9 != 1)) && (temp_r0_9 != 3)))
                    && ((gPlayer.character != 3) || !(gPlayer.moveState & 0x04000000) || (gPlayer.SA2_LABEL(unk62) == 0))) {
                    gPlayer.moveState &= ~2;
                }
                PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
                gPlayer.qSpeedAirY = 0;
                gPlayer.qWorldY += Q(res);
            } else {
                gPlayer.qWorldX = sp38;
                gPlayer.qWorldY = sp3C;
            }
            var_r1 = gPlayer.qSpeedAirY - qSpeedY;
        } else {
            res = sa2__sub_801F100(I(gPlayer.qWorldY) - gPlayer.spriteOffsetY, temp_r0_7, layer, -8, sa2__sub_801EC3C);
            if (res < 0) {
                temp_r1_5 = gPlayer.moveState & ~4;
                gPlayer.moveState = temp_r1_5;
                temp_r2_5 = gPlayer.character;
                if (((temp_r2_5 != 2) || ((temp_r0_11 = (s8) * (&gPlayer.character - 0x1C), (temp_r0_11 != 1)) && (temp_r0_11 != 3)))
                    && ((temp_r2_5 != 3) || !(temp_r1_5 & 0x04000000) || (gPlayer.SA2_LABEL(unk62) == 0))) {
                    gPlayer.moveState &= ~2;
                }

                PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
                gPlayer.qSpeedAirY = 0;
                gPlayer.qWorldY -= Q(res);
            } else {
                gPlayer.qWorldX = sp38;
                gPlayer.qWorldY = sp3C;
            }
            var_r1 = gPlayer.qSpeedAirY + qSpeedY;
        }
        p = &gPlayer;
        if (var_r1 <= 0) {
            sp30 |= 0x10000;
        } else {
        block_105:

            if (((((p->rotation + 0x20) & 0xC0) >> 6) & 1) == 0) {
                if (RECT_COLLISION(worldX, worldY, (Rect8 *)&spC[0], I(gPlayer.qWorldX), I(gPlayer.qWorldY), (Rect8 *)&sp4[0])) {
                    if (temp_r1_6 <= worldX) {
                        if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
                            sp30 |= 0x40000;
                            if (p->SA2_LABEL(unk62) != 0) {
                                p->qSpeedAirX = 0;
                            } else {
                                sp38 = Q((worldX + spC[2]) - (s8)sp4[0]);
                                if (ABS(p->qSpeedAirX) > Q(4.5)) {
                                    sp30 |= 0x200000;
                                    if (qSpeedX < 0) {
                                        if (arg6 != 0) {
                                            p->qSpeedGround = qSpeedX;
                                            p->qSpeedAirX = qSpeedX;
                                            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
                                            p->charState = 4;
                                            p->SA2_LABEL(unk61) = 0;
                                            p->SA2_LABEL(unk62) = 0;
                                            m4aSongNumStart(0xA1U);
                                            goto block_197;
                                        } else {
                                            p->qSpeedGround = qSpeedX;
                                            p->qSpeedAirX = qSpeedX;
                                            p->qWorldX += 0x100;
                                            m4aSongNumStart(0xA2U);
                                        }
                                    } else {
                                        p->moveState = p->moveState | 2;
                                        p->qSpeedAirX = -Q(1.5);
                                        p->qSpeedAirY = -Q(3.0);
                                        asm("");
                                    }
                                } else if (p->qSpeedAirX != 0) {
                                    res = sa2__sub_801F100(I(sp38), I(gPlayer.qWorldY) + p->spriteOffsetX, layer, -8, sa2__sub_801EB44);
                                    if (res < 0) {
                                        p->moveState &= ~4;
                                        temp_r0_16 = &p->character;
                                        temp_r2_11 = *temp_r0_16;
                                        if (((temp_r2_11 != 2)
                                             || ((temp_r0_17 = (s8) * (temp_r0_16 - 0x1C), (temp_r0_17 != 1)) && (temp_r0_17 != 3)))
                                            && ((temp_r2_11 != 3) || !(p->moveState & 0x04000000) || (*temp_r6_7 == 0))) {
                                            gPlayer.moveState &= ~2;
                                            p = &gPlayer;
                                        }
                                        Player_HandleSpriteYOffsetChange(p, 0xE);
                                        p->spriteOffsetX = 6;
                                        p->spriteOffsetY = 0xE;
                                        p->qSpeedAirX = 0;
                                        p->qWorldX -= res << 8;
                                    } else {
                                        temp_r1_14 = p->moveState;
                                        if (!(2 & temp_r1_14)) {
                                            p->moveState = (temp_r1_14 | 0x20) & ~4;
                                            sp30 = (sp30 | 0x20) & ~4;
                                            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
                                            p->charState = CHARSTATE_14;
                                        }
                                        p->moveState &= ~1;
                                        sp30 &= ~1;
                                        p->qSpeedGround = 0;
                                        p->qSpeedAirX = 0;
                                        p->qWorldX = sp38;
                                        p->qWorldY = sp3C;
                                    }
                                }
                            }
                        } else {
                            sp30 |= 0x40000;
                            if (p->SA2_LABEL(unk62) != 0) {
                                p->qSpeedAirX = 0;
                            } else {
                                if (ABS(qSpeedX) > Q(4.5)) {
                                    sp30 |= 0x200000;
                                    if (qSpeedX < 0) {
                                        if (arg6 != 0) {
                                            p->qSpeedGround = qSpeedX;
                                            p->qSpeedAirX = qSpeedX;
                                            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
                                            p->charState = 4;
                                            p->SA2_LABEL(unk61) = 0;
                                            p->SA2_LABEL(unk62) = 0;
                                            m4aSongNumStart(0xA1U);
                                        } else {
                                            SA2_LABEL(sub_800DE44)(p);
                                            m4aSongNumStart(0xA2U);
                                        }
                                    } else {
                                        p->qSpeedGround = 0;
                                        p->qSpeedAirX = 0;
                                    }
                                }
                            }
                        }
                    } else {
                        if (p->moveState & 0x1) {
                            sp30 |= 0x20000;
                            if (gPlayer.SA2_LABEL(unk62) != 0) {
                                p->qSpeedAirX = 0;
                            } else {
                                sp38 = ((worldX + spC[2]) - sp4[2]) << 8;
                                if (ABS(p->qSpeedAirX) > Q(4.5)) {
                                    sp30 |= 0x200000;
                                    if ((qSpeedX << 0x10) < 0) {
                                        if (arg6 != 0) {
                                            p->qSpeedGround = qSpeedX;
                                            p->qSpeedAirX = qSpeedX;
                                            Player_HandleSpriteYOffsetChange(p, 0xE);
                                            p->spriteOffsetX = 6;
                                            p->spriteOffsetY = 0xE;
                                            p->charState = 4;
                                            p->SA2_LABEL(unk61) = 0;
                                            gPlayer.SA2_LABEL(unk62) = 0;
                                            m4aSongNumStart(0xA1U);
                                            goto block_197;
                                        }
                                        p->qSpeedGround = qSpeedX;
                                        p->qSpeedAirX = qSpeedX;
                                        p->qWorldX -= Q(1);
                                        m4aSongNumStart(0xA2U);
                                    } else {
                                        p->moveState = temp_r3_7 | 2;
                                        p->qSpeedAirX = Q(1.5);
                                        p->qSpeedAirY = -Q(3.0);
                                    }
                                } else if (p->qSpeedAirX != 0) {
                                    res = sa2__sub_801F100(sp38 >> 8, p->spriteOffsetX + I(gPlayer.qWorldY), layer, +8, sa2__sub_801EB44);
                                    if (res < 0) {
                                        temp_r1_10 = p->moveState & ~4;
                                        p->moveState = temp_r1_10;
                                        temp_r0_13 = &p->character;
                                        temp_r2_9 = *temp_r0_13;
                                        if (((p->character != 2) || (((p->SA2_LABEL(unk61) != 1)) && (p->SA2_LABEL(unk61) != 3)))
                                            && ((p->character != 3) || !(temp_r1_10 & 0x04000000)
                                                || (p2 = p, (gPlayer.SA2_LABEL(unk62) == 0)))) {
                                            gPlayer.moveState &= ~2;
                                        }

                                        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
                                        gPlayer.qSpeedAirX = 0;
                                        gPlayer.qWorldX += Q(res);
                                    } else {
                                        temp_r1_11 = p->moveState;
                                        if (!(2 & temp_r1_11)) {
                                            p->moveState = (temp_r1_11 | 0x20) & ~4;
                                            sp30 = (sp30 | 0x20) & ~4;
                                            p->charState = CHARSTATE_14;
                                            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
                                        }
                                        p->moveState |= 1;
                                        sp30 |= 1;
                                        p->qSpeedGround = temp_r6_5;
                                        p->qSpeedAirX = temp_r6_5;
                                        p->qWorldX = sp38 + 0x100;
                                        p->qWorldY = sp3C;
                                    }
                                }
                            }
                        } else {
                            p->moveState = p->moveState | 0x20000;
                            temp_r7 = &p->SA2_LABEL(unk62);
                            temp_r6_4 = *temp_r7;
                            if (temp_r6_4 != 0) {
                                p->qSpeedAirX = 0;
                            } else {
                                if (ABS(qSpeedX) > 0x480) {
                                    sp30 |= 0x200000;
                                    if (qSpeedX > 0) {
                                        if (arg6 != 0) {
                                            p->qSpeedGround = qSpeedX;
                                            p->qSpeedAirX = qSpeedX;
                                            Player_HandleSpriteYOffsetChange(p, 0xE);
                                            p->spriteOffsetX = 6;
                                            p->spriteOffsetY = 0xE;
                                            p->charState = 4;
                                            p->SA2_LABEL(unk61) = temp_r6_4;
                                            *temp_r7 = temp_r6_4;
                                            m4aSongNumStart(0xA1U);
                                            goto block_197;
                                        }
                                        SA2_LABEL(sub_800DE44)(p);
                                        m4aSongNumStart(0xA2U);
                                    } else {
                                        p->qSpeedGround = temp_r6_4;
                                        p->qSpeedAirX = temp_r6_4;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    goto block_197;

    if (sp34 == 0) {
    block_70:
        sa2__sub_8021BE0(&gPlayer);
        gPlayer.qSpeedGround = (u16)gPlayer.qSpeedAirX;
        gPlayer.rotation = 0;
    }

block_197:
    if (sp34 != 0) {
    block_198:
        if (!(8 & gPlayer.moveState)) {
            gPlayer.moveState = (gPlayer.moveState & ~0x20) | 2;
        }
    }
    return sp30;
}
END_NONMATCH
#elif (GAME == GAME_SA2)
// https://decomp.me/scratch/Mjin3
NONMATCH(
#ifndef COLLECT_RINGS_ROM
    "asm/non_matching/game/shared/stage/collision__sub_800D0A0.inc",
#else
    "asm/non_matching/game/shared/stage/collision__sub_800D0A0_collect_rings.inc",
#endif
    u32 SA2_LABEL(sub_800D0A0)(Sprite *s, s16 worldX, s16 worldY, s16 qSpeedX, s16 qSpeedY, u8 layer, u32 arg6))
{
    return 0;
}
END_NONMATCH
#endif

// TODO: Maybe wrap sub_800DD54 and sub_800DE44 in a macro(?)
u32 SA2_LABEL(sub_800DA4C)(Sprite *opponent, s16 qOppX, s16 qOppY, UNUSED s32 param3, UNUSED s32 param4, u8 layer)
{
    MultiplayerPlayer *mpp;
    Sprite *mpPlayerSprite;
    u32 res2;
    u32 result = COLL_NONE;

    Player *p = &gPlayer;
    if (!IS_ALIVE(p)) {
        return COLL_NONE;
    }

#if (GAME == GAME_SA2)
    if (p->moveState & MOVESTATE_GOAL_REACHED) {
        return COLL_NONE;
    }
#endif

    mpp = TASK_DATA(gMultiplayerPlayerTasks[SIO_MULTI_CNT->id]);
    mpPlayerSprite = &mpp->s;

    if (layer != p->layer) {
        return COLL_NONE;
    }
    // _0800DABC

    if ((p->qSpeedAirX == 0 && p->qSpeedAirY == 0) && HITBOX_IS_ACTIVE(opponent->hitboxes[1])) {
        if (HB_COLLISION(qOppX, qOppY, opponent->hitboxes[1].b, mpp->pos.x, mpp->pos.y, mpPlayerSprite->hitboxes[0].b)) {
            // _0800DB68
            result |= COLL_FLAG_2;
        }
    }
    // _0800DB70
    if (HITBOX_IS_ACTIVE(mpPlayerSprite->hitboxes[1]) && HITBOX_IS_ACTIVE(opponent->hitboxes[0])
        && HB_COLLISION(qOppX, qOppY, opponent->hitboxes[0].b, mpp->pos.x, mpp->pos.y, mpPlayerSprite->hitboxes[1].b)) {
        // _0800DC34
        if (mpp->pos.x > qOppX) {
            result |= COLL_FLAG_40000;
        } else {
            result |= COLL_FLAG_20000;
        }
        // _0800DC66

        if (mpp->pos.y > qOppY) {
#if (GAME == GAME_SA1) && !defined(NON_MATCHING)
            qOppY = qOppY;
#endif
            result |= COLL_FLAG_10000;
        } else {
            result |= COLL_FLAG_100000;
        }

        result |= COLL_FLAG_1;
    } else if (HITBOX_IS_ACTIVE(mpPlayerSprite->hitboxes[0]) && HITBOX_IS_ACTIVE(opponent->hitboxes[1])
               && HB_COLLISION(qOppX, qOppY, opponent->hitboxes[1].b, mpp->pos.x, mpp->pos.y, mpPlayerSprite->hitboxes[0].b)) {
        result |= COLL_FLAG_2;
    }

    return result;
}
