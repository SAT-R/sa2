#include "global.h"
#include "rect.h"
#include "sprite.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/mp_player.h"
#include "game/globals.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/dust_cloud.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/player.h"

#if (GAME == GAME_SA2)
#include "game/cheese.h"
#endif

#include "game/shared/stage/entity.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/parameters/characters.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/rings_scatter.h"
#include "game/sa1/stage/trapped_animals.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/player_transitions.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/zones.h"

bool32 Coll_DamageSuperSonic(Player *p);

// TODO: Merge this with collision.c !
u32 Coll_Player_Platform(Sprite *s, CamCoord x, CamCoord y, Player *p)
{
    s8 rectOffset[4] = { -(p->spriteOffsetX + 5), (1 - p->spriteOffsetY), (p->spriteOffsetX + 5), (p->spriteOffsetY - 1) };
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };
    u32 result = COLL_NONE;
    bool32 playerIsInAir;
    bool32 sb = FALSE;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0]) || !IS_ALIVE(p)) {
        return result;
    }

    playerIsInAir = p->moveState & MOVESTATE_IN_AIR;
    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        playerIsInAir |= MOVESTATE_IN_AIR;
        sb = TRUE;
    }

    if (!playerIsInAir || !sub_800C934(s, x, y, (Rect8 *)&rectPlayer[0], sb, p, &result)) {
        if (!sub_800CBBC(s, x, y, (Rect8 *)&rectOffset, sb, p, &result)) {
            if (!sub_800C934(s, x, y, (Rect8 *)&rectPlayer[0], sb, p, &result)) {
                if (sb && !(p->moveState & MOVESTATE_STOOD_ON_OBJ)) {
                    p->moveState &= ~MOVESTATE_20;
                    p->moveState |= MOVESTATE_IN_AIR;
                }
            }
        }
    }

    return result;
}

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
#endif // (GAME == GAME_SA1)

#if 0 // MATCH
// (Link included because of register-match)
// (100.00%) https://decomp.me/scratch/0Ro0I
u32 SA2_LABEL(sub_800C060)(Sprite *s, CamCoord sx, CamCoord sy, Player *p)
{
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    u32 result = COLL_NONE;
    bool32 ip = FALSE;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0]) || !IS_ALIVE(p)) {
        return result;
    }

    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        ip = TRUE;
    }

    if (RECT_COLLISION_2(sx, sy, &s->hitboxes[0].b, p->qWorldX, p->qWorldY, (Rect8 *)rectPlayer) && (p->qSpeedAirY >= 0)) {

#ifndef NON_MATCHING
        register s32 y asm("r1");
#else
        s32 y;
#endif

        rectPlayer[1] = -p->spriteOffsetY;
        rectPlayer[3] = +p->spriteOffsetY;
        p->moveState |= MOVESTATE_STOOD_ON_OBJ;
        result |= COLL_FLAG_8;

        if (!ip) {
            p->rotation = 0;
        }

        p->stoodObj = s;
        p->qSpeedAirY = 0;

        if (GRAVITY_IS_INVERTED) {
            y = s->hitboxes[0].b.bottom;
            y += sy;
            y += rectPlayer[3];
        } else {
            y = s->hitboxes[0].b.top;
            y += sy;
            y -= rectPlayer[3];
        }
        y = Q(y);
        p->qWorldY = Q_24_8_FRAC(p->qWorldY) + (y);
    } else if (ip && !(p->moveState & MOVESTATE_STOOD_ON_OBJ)) {
        p->moveState &= ~MOVESTATE_20;
        p->moveState |= MOVESTATE_IN_AIR;
    }

    return result;
}

bool32 sub_800C204(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p, s16 hbIndexPlayer)
{
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprPlayer = &psi->s;

    if (!IS_ALIVE(p)) {
        return FALSE;
    }

    if (!HITBOX_IS_ACTIVE(s->hitboxes[hbIndex])) {
        return FALSE;
    }

    if (!HITBOX_IS_ACTIVE(psi->s.hitboxes[hbIndexPlayer])) {
        return FALSE;
    }

    if ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[hbIndexPlayer].b))) {
        return TRUE;
    }

    return FALSE;
}

bool32 sub_800C320(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p)
{
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprPlayer = &psi->s;

    if (!IS_ALIVE(p)) {
        return FALSE;
    }

    if (!HITBOX_IS_ACTIVE(s->hitboxes[hbIndex])) {
        return FALSE;
    }

    if (!HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1])) {
        return FALSE;
    }

    if ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex], I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[1]))) {
        Collision_AdjustPlayerSpeed(p);
        return TRUE;
    }

    return FALSE;
}

bool32 IsColliding_Cheese(Sprite *sprTarget, s32 sx, s32 sy, s16 hbIndex, Player *p)
{
    if (!IS_ALIVE(p)) {
        return FALSE;
    }

    if (!HITBOX_IS_ACTIVE(sprTarget->hitboxes[hbIndex])) {
        return FALSE;
    }

    if (gCheese) {
        Cheese *cheese = gCheese;

        if (!HITBOX_IS_ACTIVE(cheese->s.hitboxes[1])) {
            return FALSE;
        }

        if ((HB_COLLISION(sx, sy, sprTarget->hitboxes[hbIndex], I(cheese->posX), I(cheese->posY), cheese->s.hitboxes[1]))) {
            return TRUE;
        }
    }

    return FALSE;
}

#if (GAME == GAME_SA1)
bool32 Coll_Player_Enemy_Attack(Sprite *s, s16 sx, s16 sy, u8 hbIndex)
#elif (GAME == GAME_SA2)
bool32 sub_800C4FC(Sprite *s, s32 sx, s32 sy, u8 hbIndex)
#endif
{
    Player *player = &gPlayer;
    Sprite *sprPlayer = &player->spriteInfoBody->s;

    bool32 dead;
    u32 movestate;
    EnemyBase *eb;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[hbIndex])) {
        return FALSE;
    }

    eb = TASK_DATA(gCurTask);
    dead = player->moveState & MOVESTATE_DEAD;
    movestate = player->moveState;

    if (!dead) {
        if (IS_MULTI_PLAYER && ((s8)eb->base.me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
            CreateDustCloud(sx, sy);
            CreateTrappedAnimal(sx, sy);
            return TRUE;
        }

        if (!(movestate & MOVESTATE_IN_SCRIPTED)) {
            if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1])) {
                if (HB_COLLISION(sx, sy, s->hitboxes[hbIndex], I(player->qWorldX), I(player->qWorldY), sprPlayer->hitboxes[1])) {
                    if (IS_MULTI_PLAYER) {
                        RoomEvent *v = CreateRoomEvent();
                        v->unk0 = 3;
                        v->unk1 = eb->base.regionX;
                        v->unk2 = eb->base.regionY;
                        v->unk3 = eb->base.id;
                    }

                    Collision_AdjustPlayerSpeed(player);

                    CreateDustCloud(sx, sy);
                    CreateTrappedAnimal(sx, sy);
                    CreateEnemyDefeatScoreAndManageLives(sx, sy);

                    return TRUE;
                }
            }

            if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0])
                && (HB_COLLISION(sx, sy, s->hitboxes[hbIndex], I(player->qWorldX), I(player->qWorldY), sprPlayer->hitboxes[0]))) {
                if (!(player->itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                    Coll_DamagePlayer(player);
                } else {
                    if (IS_MULTI_PLAYER) {
                        RoomEvent *v = CreateRoomEvent();
                        v->unk0 = 3;
                        v->unk1 = eb->base.regionX;
                        v->unk2 = eb->base.regionY;
                        v->unk3 = eb->base.id;
                    }

                    CreateDustCloud(sx, sy);
                    CreateTrappedAnimal(sx, sy);
                    CreateEnemyDefeatScoreAndManageLives(sx, sy);

                    return TRUE;
                }
            }
        }

        if (gCheese != NULL) {
            Cheese *cheese = gCheese;
            if (cheese->s.hitboxes[1].index != -1
                && ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex], I(cheese->posX), I(cheese->posY), cheese->s.hitboxes[1])))) {
                if (IS_MULTI_PLAYER) {
                    RoomEvent *v = CreateRoomEvent();
                    v->unk0 = 3;
                    v->unk1 = eb->base.regionX;
                    v->unk2 = eb->base.regionY;
                    v->unk3 = eb->base.id;
                }

                CreateDustCloud(sx, sy);
                CreateTrappedAnimal(sx, sy);
                CreateEnemyDefeatScoreAndManageLives(sx, sy);

                return TRUE;
            }
        }
    }

    return FALSE;
}

bool32 sub_800C84C(Sprite *s, s32 sx, s32 sy)
{
    Player *p;
    Sprite *sprPlayer;
    bool32 result = FALSE;

    if (gPlayer.moveState & MOVESTATE_IN_SCRIPTED) {
        return result;
    }

    if (HITBOX_IS_ACTIVE(s->hitboxes[0])) {
        p = &gPlayer;
        sprPlayer = &p->spriteInfoBody->s;

        if ((!PLAYER_IS_ALIVE) || !HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0])) {
            return result;
        }

        if ((HB_COLLISION(sx, sy, s->hitboxes[0], I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0]))) {
            Coll_DamagePlayer(p);
            result = TRUE;
        }
    }

    return result;
}

bool32 sub_800C944(Sprite *s, s32 sx, s32 sy)
{
    bool32 result = FALSE;

    Player *p = &gPlayer;
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprPlayer = &psi->s;

    if (PLAYER_IS_ALIVE && HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1]) && (HITBOX_IS_ACTIVE(s->hitboxes[0]))) {
        if (HB_COLLISION(sx, sy, s->hitboxes[0], I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[1])) {
            result = TRUE;
        }
    }

    return result;
}

bool32 sub_800CA20(Sprite *s, s32 sx, s32 sy, s16 hbIndex, Player *p)
{
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprPlayer = &psi->s;

    if (IS_ALIVE(p) && (HITBOX_IS_ACTIVE(s->hitboxes[hbIndex]) && HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0]))) {
        if (HB_COLLISION(sx, sy, s->hitboxes[hbIndex], I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0])) {
            Coll_DamagePlayer(p);
            return TRUE;
        }
    }

    return FALSE;
}

void Collision_AdjustPlayerSpeed(Player *p)
{
    if (p->moveState & MOVESTATE_BOOST_EFFECT_ON) {
        // Also triggered on homing-attack.
        // Slight boost upwards for the player.
        p->transition = PLTRANS_HOMING_ATTACK_RECOIL;
        p->speedAirX = 0;
        p->speedAirY = 0;
    } else if (IS_BOSS_STAGE(gCurrentLevel)) {
        s32 speedX = -(p->speedAirX >> 1);
        p->speedAirY = -p->speedAirY;
        // BUG: using the camera DX here is not really fair, since
        // this will throw the player forwards if the camera is moving
        // towards the boss.
        // In reality this should use a fixed value of +Q(5) since that's
        // the boss moving speed
        p->speedAirX = speedX - Q(gCamera.dx);
    } else if (p->speedAirY > 0) {
        // Bounce off of enemies
        p->speedAirY = -p->speedAirY;
    }

    gPlayer.moveState |= MOVESTATE_4000;
}

// (100.00%) https://decomp.me/scratch/verla
// TODO: Register fake-match
bool32 Coll_DamagePlayer(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return FALSE;
    }

    p->timerInvulnerability = PLAYER_INVULNERABLE_DURATION;

    if (p->moveState & MOVESTATE_1000000) {
        PlayerSpriteInfo *psi;

        p->layer = PLAYER_LAYER__BACK;

        p->moveState &= ~MOVESTATE_1000000;
        p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

        p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
    }

    if (!(p->moveState & MOVESTATE_1000000)) {
        p->transition = PLTRANS_PT9;
    }

    p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

    if (!HAS_SHIELD(p)) {
        if (gRingCount != 0) {
            u32 rings = gRingCount;
            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
#ifndef NON_MATCHING
                register u32 rings2 asm("r0") = rings;
#else
                u32 rings2 = rings;
#endif
                if (rings > 10) {
                    rings2 = 10;
                }

                rings = rings2;
            }

            InitScatteringRings(I(p->qWorldX), I(p->qWorldY), rings);

            if (IS_MULTI_PLAYER) {
                RoomEvent *unk = CreateRoomEvent();
                unk->unk0 = 4;
                unk->unk1 = rings;
            }

            gRingCount -= rings;
        } else if (!(gStageFlags & STAGE_FLAG__DEMO_RUNNING)) {
            p->moveState |= MOVESTATE_DEAD;
        }
    } else {
        m4aSongNumStart(SE_LIFE_LOST);
        p->itemEffect &= ~(PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC | PLAYER_ITEM_EFFECT__SHIELD_NORMAL);
    }

    return TRUE;
}

// Called by: Boss 3,6,7, hammerhead, platform (square),
//            spikes, spring bouncy, speeding platform,
//            arrow platform, spike platform
u32 sub_800CCB8(Sprite *s, s32 sx, s32 sy, Player *p)
{
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    bool32 r4 = COLL_NONE;

    u32 mask;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0])) {
        return COLL_NONE;
    }

    if (!IS_ALIVE(p)) {
        return COLL_NONE;
    }

    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->unk3C == s)) {
        r4 = COLL_FLAG_1;
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        p->moveState |= MOVESTATE_IN_AIR;
    }

    mask = sub_800CE94(s, sx, sy, (Rect8 *)rectPlayer, p);

    if (mask) {
        if (mask & 0x10000) {
            p->moveState |= MOVESTATE_STOOD_ON_OBJ;
            p->moveState &= ~MOVESTATE_IN_AIR;
            p->unk3C = s;

            if (r4 == 0 && s == NULL) {
                p->speedGroundX = p->speedAirX;
            }
        }
    } else if (r4) {
        if (!(p->moveState & MOVESTATE_STOOD_ON_OBJ)) {
            p->moveState &= ~MOVESTATE_20;
            p->moveState |= MOVESTATE_IN_AIR;
            p->unk3C = NULL;

            if (IS_BOSS_STAGE(gCurrentLevel)) {
                p->speedGroundX -= Q(gCamera.dx);
            }
        }
    }

    return mask;
}

// Called by IAs ramp, spring, floating spring, bounce block, spike platform
u32 sub_800CDBC(Sprite *s, s32 sx, s32 sy, Player *p)
{
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    bool32 r4 = COLL_NONE;

    u32 mask;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0])) {
        return COLL_NONE;
    }

    if (!IS_ALIVE(p)) {
        return COLL_NONE;
    }

    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->unk3C == s)) {
        r4 = COLL_FLAG_1;
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
    }

    mask = sub_800CE94(s, sx, sy, (Rect8 *)rectPlayer, p);

    if (mask & 0x10000) {
        p->moveState |= MOVESTATE_STOOD_ON_OBJ;
        p->unk3C = s;
    } else if (r4) {
        p->unk3C = NULL;

        if (IS_BOSS_STAGE(gCurrentLevel)) {
            p->speedGroundX -= Q(gCamera.dx);
        }
    }

    return mask;
}

// Looks like each byte in the result is one value
// TODO: Remove gotos
u32 sub_800CE94(Sprite *s, s32 sx, s32 sy, Rect8 *inRect, Player *p)
{
    s32 px = I(p->qWorldX);
    s32 py = I(p->qWorldY);
    u32 result = 0;
    s32 r1;
    s32 r3, r6;

    if (RECT_COLLISION(sx, sy, &s->hitboxes[0].b, px, py, inRect)) {
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
            if (p->speedAirY > 0) {
                return 0;
            }
        } else {
            if (p->speedAirY < 0) {
                return 0;
            }
        }

        if (!(p->moveState & MOVESTATE_IN_AIR)) {
            if ((p->rotation + 0x20) & 0x40) {
                p->speedGroundX = 0;
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

NONMATCH("asm/non_matching/game/shared/stage/collision__sub_800D0A0.inc",
         u32 sub_800D0A0(Sprite *s, s16 param1, s16 param2, s16 param3, s16 param4, u8 param5, u32 param6))
{
    return 0;
}
END_NONMATCH
#endif // MATCH

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

u32 Coll_Player_Entity_RectIntersection(Sprite *s, CamCoord sx, CamCoord sy, Player *p, Rect8 *rectPlayer)
{
    u32 result = 0;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0]) || !IS_ALIVE(p)) {
        return result;
    }

    if (RECT_COLLISION(sx, sy, &s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), rectPlayer)) {
        result |= COLL_FLAG_80000;
    }

    return result;
}

u32 Coll_AmyHammer_Spring(Sprite *s, s16 worldX, s16 worldY, Player *p)
{
    bool32 isColliding = FALSE;

    if (p->character == CHARACTER_AMY) {
        if ((p->charState == CHARSTATE_87) || (p->charState == CHARSTATE_88) || (p->charState == CHARSTATE_89)
            || (p->charState == CHARSTATE_90)) {
            if (p->spriteInfoBody->s.hitboxes[1].index != HITBOX_STATE_INACTIVE) {
                if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), p->spriteInfoBody->s.hitboxes[1].b)) {
                    isColliding = TRUE;
                }
            }
        }
    }

    return isColliding;
}

u32 Coll_Player_Spring_Sideways(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p)
{
    s8 rectDataPlayerA[4] = { -(p->spriteOffsetX + 5), (1 - p->spriteOffsetY), (p->spriteOffsetX + 5), (p->spriteOffsetY - 1) };
    s8 rectDataPlayerB[4] = { -(p->spriteOffsetX + 0), (0 - p->spriteOffsetY), (p->spriteOffsetX + 0), (p->spriteOffsetY + 0) };
    Rect8 *rectPlayerB;

    u32 moveState = 0;
    bool32 stoodOnCurrent = 0;

    if (s->hitboxes[0].index == -1) {
        return moveState;
    }

    if (!IS_ALIVE(p)) {
        return moveState;
    }

    moveState = p->moveState & MOVESTATE_IN_AIR;
    rectPlayerB = (Rect8 *)&rectDataPlayerB[0];
    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        moveState |= MOVESTATE_IN_AIR;
        stoodOnCurrent = 1;
    }

    if (moveState & MOVESTATE_IN_AIR) {
        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*rectPlayerB))) {
            if (sub_800C934(s, worldX, worldY, (Rect8 *)&rectDataPlayerB, stoodOnCurrent, p, &moveState)) {
                return moveState;
            }
        } else if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*(Rect8 *)&rectDataPlayerA))) {
            if (I(p->qWorldX) <= worldX) {
                if (p->qSpeedAirX >= 0) {
                    p->qSpeedAirX = 0;
                    p->qWorldX = Q((worldX + s->hitboxes[0].b.left) - rectDataPlayerA[2]);
                    moveState |= MOVESTATE_20000;
                }
            } else if (p->qSpeedAirX <= 0) {
                p->qSpeedAirX = 0;
                p->qWorldX = Q(((worldX + s->hitboxes[0].b.right) - rectDataPlayerA[0]) + 1);
                moveState |= MOVESTATE_40000;
            }
        }
    }

    if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*(Rect8 *)&rectDataPlayerA))) {
        if (I(p->qWorldX) <= worldX) {
            if (p->qSpeedAirX >= 0) {
                moveState |= MOVESTATE_20000;

                if (p->qSpeedAirX > 0) {
                    moveState |= MOVESTATE_20;
                    moveState &= ~MOVESTATE_FACING_LEFT;
                    p->qWorldX = Q((worldX + s->hitboxes[0].b.left) - rectDataPlayerA[2]);
                }
            }
        } else {
            if (p->qSpeedAirX <= 0) {
                moveState |= MOVESTATE_40000;

                if (p->qSpeedAirX < 0) {
                    moveState |= MOVESTATE_20;
                    moveState |= MOVESTATE_FACING_LEFT;
                    p->qWorldX = Q(((worldX + s->hitboxes[0].b.right) - rectDataPlayerA[0]) + 1);
                }
            }
        }
    }

    return moveState;
}

// (99.92%) https://decomp.me/scratch/GFpFd
NONMATCH("asm/non_matching/game/shared/stage/collision__Coll_Player_Itembox.inc",
         u32 Coll_Player_Itembox(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p))
{
    s8 rectDataPlayerA[4] = { -(p->spriteOffsetX + 5), (1 - p->spriteOffsetY), (p->spriteOffsetX + 5), (p->spriteOffsetY - 1) };
    s8 rectDataPlayerB[4] = { -(p->spriteOffsetX + 0), (0 - p->spriteOffsetY), (p->spriteOffsetX + 0), (p->spriteOffsetY + 0) };
    Rect8 *rectPlayerB = (Rect8 *)&rectDataPlayerB[0];

    u32 result;
    s32 middleX;
    s32 middleY;

    result = 0;
    if (s->hitboxes[0].index == -1) {
        return result;
    }

    if (!IS_ALIVE(p)) {
        return result;
    }

    if (p->spriteInfoBody->s.hitboxes[1].index != -1) {
        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), p->spriteInfoBody->s.hitboxes[1].b)) {
            result |= 0x20;
            if (p->moveState & MOVESTATE_IN_AIR) {
                if (p->qSpeedAirY > 0) {
                    p->qSpeedAirY = -p->qSpeedAirY;
                }
            }
        }
    }

    if (p->moveState & MOVESTATE_IN_AIR) {
        middleX = worldX + ((s->hitboxes[0].b.left + s->hitboxes[0].b.right) >> 1);
        middleY = worldY + ((s->hitboxes[0].b.top + s->hitboxes[0].b.bottom) >> 1);

        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*rectPlayerB))) {
            if ((!GRAVITY_IS_INVERTED && (I(p->qWorldY) <= middleY)) || (GRAVITY_IS_INVERTED && (I(p->qWorldY) >= middleY))) {
                if ((p->character == 1) && (p->SA2_LABEL(unk61) != 0)) {
                    Coll_Player_Platform(s, worldX, worldY, p);
                    return 0;
                } else if (p->qSpeedAirY >= 0) {
                    result |= 8;

                    if (p->qSpeedAirY > 0) {
                        p->qSpeedAirY = -p->qSpeedAirY;
                    }
                }
            } else if (p->qSpeedAirY < 0) {
                p->qSpeedAirY = 0;

                if (!GRAVITY_IS_INVERTED) {
                    p->qWorldY = p->qWorldY + (Q((worldY + s->hitboxes[0].b.bottom) - rectDataPlayerB[1]) - (0xFFFFFF00 & p->qWorldY));
                } else {
                    p->qWorldY = p->qWorldY - (Q((worldY + s->hitboxes[0].b.bottom) - rectDataPlayerB[1]) - (0xFFFFFF00 & p->qWorldY));
                }

                result |= 0x10000;
            }
        } else if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*(Rect8 *)&rectDataPlayerA[0]))) {
            if (I(p->qWorldX) <= middleX) {
                if (p->qSpeedAirX > 0) {
                    p->qSpeedAirX = 0;
                    p->qWorldX = Q(worldX + s->hitboxes[0].b.left - rectDataPlayerA[2]);
                }
            } else {
                if (p->qSpeedAirX < 0) {
                    p->qSpeedAirX = 0;
                    p->qWorldX = Q((worldX + s->hitboxes[0].b.right - rectDataPlayerA[0]) + 1);
                }
            }
        }
    }

    return result;
}
END_NONMATCH

// Used by Security Gate and Breakable Wall.
u32 Coll_Player_Gate(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p, u32 arg4)
{
    u32 result = 0;
    s8 rectPlayer[4] = { -(p->spriteOffsetX + 5), (1 - p->spriteOffsetY), (p->spriteOffsetX + 5), (p->spriteOffsetY - 1) };

    if (s->hitboxes[0].index == -1) {
        return result;
    }

    if (!IS_ALIVE(p)) {
        return result;
    }

    if (arg4 != 0) {
        if (p->spriteInfoBody->s.hitboxes[1].index != -1) {
            if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), p->spriteInfoBody->s.hitboxes[1].b)
                || HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*(Rect8 *)&rectPlayer[0]))) {

                result |= 8;
                if ((p->moveState & MOVESTATE_IN_AIR) && (p->qSpeedAirY > 0)) {
                    p->qSpeedAirY = -p->qSpeedAirY;
                }

                return result;
            }
        }
    }

    sub_800CBBC(s, worldX, worldY, (Rect8 *)&rectPlayer, 0, p, &result);
    return result;
}

u32 Coll_Player_SkatingStone(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p)
{
    s32 moveState;
    s32 var_sb;

    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    u32 result;

    result = 0;
    var_sb = 0;

    if ((s->hitboxes[0].index == -1) || (((0x80 & p->moveState) != 0))) {
        return 0U;
    }

    moveState = p->moveState & MOVESTATE_IN_AIR;
    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        p->moveState = p->moveState & ~MOVESTATE_STOOD_ON_OBJ;
        moveState |= MOVESTATE_IN_AIR;
        var_sb = 1;
    }

    if (((moveState == 0) || !sub_800C934(s, worldX, worldY, (Rect8 *)rectPlayer, var_sb, p, &result))
        && !sub_800C934(s, worldX, worldY, (Rect8 *)rectPlayer, var_sb, p, &result)) {
        if (var_sb) {
            if (!(p->moveState & MOVESTATE_STOOD_ON_OBJ)) {
                p->moveState = (p->moveState & ~MOVESTATE_20) | MOVESTATE_IN_AIR;
            }
        }
    }

    return result;
}

// sa2__sub_800C060
// 'Coll_Player_PlatformCrumbling' name from SA2, called by many Entities in SA1!
// (86.62%) https://decomp.me/scratch/kyp0r
NONMATCH("asm/non_matching/game/shared/stage/collision__sa2__800C060.inc",
         u32 Coll_Player_PlatformCrumbling(Sprite *s, CamCoord sx, CamCoord sy, Player *p))
{
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    u32 result = COLL_NONE;
    bool32 ip = FALSE;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0]) || !IS_ALIVE(p)) {
        return result;
    }

    if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s)) {
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        ip = TRUE;
    }

    if (RECT_COLLISION_2(sx, sy, &s->hitboxes[0].b, p->qWorldX, p->qWorldY, (Rect8 *)rectPlayer) && (p->qSpeedAirY >= 0)) {

#ifndef NON_MATCHING
        register s32 y asm("r1");
#else
        s32 y;
#endif

        rectPlayer[1] = -p->spriteOffsetY;
        rectPlayer[3] = +p->spriteOffsetY;
        p->moveState |= MOVESTATE_STOOD_ON_OBJ;
        result |= COLL_FLAG_8;

#if (GAME == GAME_SA1)
        if (((p->character != CHARACTER_KNUCKLES) || (p->SA2_LABEL(unk61) != 1 && p->SA2_LABEL(unk61) != 3))
            && ((p->character != CHARACTER_AMY) || !(p->moveState & MOVESTATE_4000000) || (p->SA2_LABEL(unk62) == 0))) {
            p->moveState &= ~MOVESTATE_IN_AIR;
        }

        if (!ip) {
            if ((p->character != CHARACTER_KNUCKLES) || ((p->SA2_LABEL(unk61) != 1) && (p->SA2_LABEL(unk61) != 3))) {
                SA2_LABEL(sub_8021BE0)(p);
                p->qSpeedGround = p->qSpeedAirX;
            }
            p->rotation = 0;
        }
#endif

#if (GAME == GAME_SA2)
        if (!ip) {
            p->rotation = 0;
        }
#endif

        p->stoodObj = s;
        p->qSpeedAirY = 0;

        if (!GRAVITY_IS_INVERTED) {
            y = s->hitboxes[0].b.top;
            y += sy;
            y -= rectPlayer[3];
        } else {
            y = s->hitboxes[0].b.bottom;
            y += sy;
            y += rectPlayer[3];
        }
        y = Q(y);
#ifndef NON_MATCHING
        asm("" : "=r"(p->qWorldY) : "r"(~0xFF), "r"(p->qWorldY), "r"(y));
#else
        p->qWorldY = Q_24_8_FRAC(p->qWorldY) + (y);
#endif
    } else if (ip && !(p->moveState & MOVESTATE_STOOD_ON_OBJ)) {
        p->moveState &= ~MOVESTATE_20;
        p->moveState |= MOVESTATE_IN_AIR;
    }

    return result;
}
END_NONMATCH

// TODO: Simplify and merge SA1 and SA2 versions!
#if (GAME == GAME_SA1)
bool32 Coll_Player_Enemy_Attack(Sprite *s, CamCoord sx, CamCoord sy)
#else
bool32 Coll_Player_Enemy_Attack(Sprite *s, CamCoord sx, CamCoord sy, u8 hbIndex)
#endif
{
#if (GAME == GAME_SA1)
    Player *player;
    Sprite *sprPlayer;

    bool32 dead;
    u32 movestate;
    EnemyBase *eb;
    s32 i;
    const int hbIndex = 0;
#elif (GAME == GAME_SA2)
    Player *player = &gPlayer;
    Sprite *sprPlayer = &player->spriteInfoBody->s;

    bool32 dead;
    u32 movestate;
    EnemyBase *eb;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[hbIndex])) {
        return FALSE;
    }

    eb = TASK_DATA(gCurTask);
    dead = player->moveState & MOVESTATE_DEAD;
    movestate = player->moveState;
#endif

#if (GAME == GAME_SA1)
    i = 0;
    if (!HITBOX_IS_ACTIVE(s->hitboxes[hbIndex])) {
        return FALSE;
    }

    i = 0;
    eb = TASK_DATA(gCurTask);
    do {
        player = &PLAYER(i);
        sprPlayer = &player->spriteInfoBody->s;
#endif

        if (!(player->moveState & MOVESTATE_DEAD)) {
            if (IS_MULTI_PLAYER && ((s8)eb->base.me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
                CreateDustCloud(sx, sy);
                CreateTrappedAnimal(sx, sy);
                return TRUE;
            }

#if (GAME == GAME_SA2)
            if (!(player->moveState & MOVESTATE_IN_SCRIPTED))
#endif
            {
                if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1])) {
                    if (HB_COLLISION(sx, sy, s->hitboxes[hbIndex].b, I(player->qWorldX), I(player->qWorldY), sprPlayer->hitboxes[1].b)) {
                        if (IS_MULTI_PLAYER) {
                            RoomEvent_EnemyDestroy *roomEvent = CreateRoomEvent();
                            roomEvent->type = ROOMEVENT_TYPE_ENEMY_DESTROYED;
                            roomEvent->x = eb->base.regionX;
                            roomEvent->y = eb->base.regionY;
                            roomEvent->id = eb->base.id;
                        }

#if (GAME == GAME_SA1)
                        if (player->qSpeedAirY > 0) {
                            player->qSpeedAirY = -player->qSpeedAirY;
                        }
#else
                    Coll_Player_Enemy_AdjustSpeed(player);
#endif

                        CreateDustCloud(sx, sy);
                        CreateTrappedAnimal(sx, sy);
                        CreateEnemyDefeatScoreAndManageLives(sx, sy);

                        return TRUE;
                    }
                }

                if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0])
                    && (HB_COLLISION(sx, sy, s->hitboxes[hbIndex].b, I(player->qWorldX), I(player->qWorldY), sprPlayer->hitboxes[0].b))) {
#if (GAME == GAME_SA1)
                    if (player->itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY) {
                        if (IS_MULTI_PLAYER) {
                            RoomEvent_EnemyDestroy *roomEvent = CreateRoomEvent();
                            roomEvent->type = ROOMEVENT_TYPE_ENEMY_DESTROYED;
                            roomEvent->x = eb->base.regionX;
                            roomEvent->y = eb->base.regionY;
                            roomEvent->id = eb->base.id;
                        }

                        CreateDustCloud(sx, sy);
                        CreateTrappedAnimal(sx, sy);
                        CreateEnemyDefeatScoreAndManageLives(sx, sy);

                        return TRUE;
                    } else {
                        Coll_DamagePlayer(player);
                    }
#elif (GAME == GAME_SA2)
                if (!(player->itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
                    Coll_DamagePlayer(player);
                } else {
                    if (IS_MULTI_PLAYER) {
                        RoomEvent_EnemyDestroy *roomEvent = CreateRoomEvent();
                        roomEvent->type = ROOMEVENT_TYPE_ENEMY_DESTROYED;
                        roomEvent->x = eb->base.regionX;
                        roomEvent->y = eb->base.regionY;
                        roomEvent->id = eb->base.id;
                    }

                    CreateDustCloud(sx, sy);
                    CreateTrappedAnimal(sx, sy);
                    CreateEnemyDefeatScoreAndManageLives(sx, sy);

                    return TRUE;
                }
#endif
                }
            }

#if (GAME == GAME_SA2)
            if (gCheese != NULL) {
                Cheese *cheese = gCheese;
                if (cheese->s.hitboxes[1].index != -1
                    && ((HB_COLLISION(sx, sy, s->hitboxes[hbIndex], I(cheese->posX), I(cheese->posY), cheese->s.hitboxes[1])))) {
                    if (IS_MULTI_PLAYER) {
                        RoomEvent_EnemyDestroy *roomEvent = CreateRoomEvent();
                        roomEvent->type = ROOMEVENT_TYPE_ENEMY_DESTROYED;
                        roomEvent->x = eb->base.regionX;
                        roomEvent->y = eb->base.regionY;
                        roomEvent->id = eb->base.id;
                    }

                    CreateDustCloud(sx, sy);
                    CreateTrappedAnimal(sx, sy);
                    CreateEnemyDefeatScoreAndManageLives(sx, sy);

                    return TRUE;
                }
            }
#endif
        }
#if (GAME == GAME_SA1)
    } while (++i < gNumSingleplayerCharacters);
#endif
    return FALSE;
}

// TODO: Simplify and merge SA1 and SA2 versions!
bool32 Coll_Player_Projectile(Sprite *s, CamCoord sx, CamCoord sy)
{
    Player *p;
    Sprite *sprPlayer;
    bool32 result = FALSE;
    s32 i;
    const s32 hbIndex = 0;

#if (GAME == GAME_SA1)
    if (HITBOX_IS_ACTIVE(s->hitboxes[hbIndex]))
#elif (GAME == GAME_SA2)
    if (!(gPlayer.moveState & MOVESTATE_IN_SCRIPTED))
#endif
    {
        i = 0;
        do {
            p = &PLAYER(i);
            {
                sprPlayer = &p->spriteInfoBody->s;

                if (!IS_ALIVE(p) || !HITBOX_IS_ACTIVE(sprPlayer->hitboxes[hbIndex])) {
                    continue;
                }

                if ((HB_COLLISION(sx, sy, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0].b))) {
                    Coll_DamagePlayer(p);
                    result = TRUE;
                }
            }
        } while (++i < gNumSingleplayerCharacters);
    }

    return result;
}

// Based on SA2's:
// u32 Coll_Player_Enemy(Sprite *s, CamCoord sx, CamCoord sy, Player *p)
EHit Coll_Player_Boss(Sprite *s, CamCoord sx, CamCoord sy, Player *p)
{
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprPlayer = &psi->s;
#if (GAME == GAME_SA1)
    const int hbIndex = 0;
#endif

    if (HITBOX_IS_ACTIVE(s->hitboxes[0])) {
        if (IS_ALIVE(p)) {
            if (HITBOX_IS_ACTIVE(sprPlayer->hitboxes[1])
                && HB_COLLISION(sx, sy, s->hitboxes[hbIndex].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[1].b)) {
                if (p->character != CHARACTER_AMY) {
                    p->qSpeedAirX = -p->qSpeedAirX;
                    p->qSpeedAirY = -p->qSpeedAirY;
                } else {
                    p->qSpeedAirX >>= 1;
                    p->qSpeedAirY = -p->qSpeedAirY;
                }

                return HIT_ENEMY;
            }

            if ((HITBOX_IS_ACTIVE(sprPlayer->hitboxes[0]))) {
                if (HB_COLLISION(sx, sy, s->hitboxes[hbIndex].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0].b)) {
                    Coll_DamagePlayer(p);
                    return HIT_PLAYER;
                }
            }
        }
    }

    return FALSE;
}

// Exclusively used by Boss 1
EHit Coll_Player_Boss_1(Sprite *s, CamCoord worldX, CamCoord worldY, Player *p)
{
    Sprite *sprPlayer;

    sprPlayer = &p->spriteInfoBody->s;

    if (s->hitboxes[0].index == -1) {
        return HIT_NONE;
    }

    if (s->hitboxes[1].index == -1) {
        return HIT_NONE;
    }

    if (!IS_ALIVE(p)) {
        return HIT_NONE;
    }

    if (sprPlayer->hitboxes[1].index != -1) {
        if (HB_COLLISION(worldX, worldY, s->hitboxes[1].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0].b)) {
            Coll_DamagePlayer(p);
            return 2;
        }

        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[1].b)) {
            if (p->character != CHARACTER_AMY) {
                p->qSpeedAirX = -p->qSpeedAirX;
                p->qSpeedAirY = -p->qSpeedAirY;
            } else {
                p->qSpeedAirX = p->qSpeedAirX >> 1;
                p->qSpeedAirY = -p->qSpeedAirY;
            }

            return HIT_ENEMY;
        }
    }

    if (sprPlayer->hitboxes[0].index != -1) {
        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0].b)) {
            Coll_DamagePlayer(p);
            return HIT_PLAYER;
        }
    }

    return HIT_NONE;
}

// Exclusively used by Bosses 2 and 6
EHit Coll_Player_Bosses_2_6(Sprite *s, s16 worldX, s16 worldY, Player *p)
{
    Sprite *sprPlayer = &p->spriteInfoBody->s;

    if (!IS_ALIVE(p)) {
        return HIT_NONE;
    }

    if ((sprPlayer->hitboxes[1].index != -1) && (s->hitboxes[0].index != -1) && (p->moveState & MOVESTATE_IN_AIR)) {
        if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[1].b)) {
            if (p->character != CHARACTER_AMY) {
                p->qSpeedAirX = -p->qSpeedAirX;
                p->qSpeedAirY = -p->qSpeedAirY;
            } else {
                p->qSpeedAirX = p->qSpeedAirX >> 1;
                p->qSpeedAirY = -p->qSpeedAirY;
            }

            return HIT_ENEMY;
        }
    }

    if (sprPlayer->hitboxes[0].index != -1) {
        if (s->hitboxes[0].index != -1) {
            if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0].b)) {
                Coll_DamagePlayer(p);
                return HIT_PLAYER;
            }
        }

        if (s->hitboxes[1].index != -1) {
            if (HB_COLLISION(worldX, worldY, s->hitboxes[1].b, I(p->qWorldX), I(p->qWorldY), sprPlayer->hitboxes[0].b)) {
                Coll_DamagePlayer(p);
                return HIT_PLAYER;
            }
        }
    }

    return HIT_NONE;
}

// Exclusively used by SA1 Bosses 3, 5, Egg X and throwback bosses
EHit sub_800BF10(Sprite *s, CamCoord screenX, CamCoord screenY, Player *p)
{
    PlayerSpriteInfo *psiBody = p->spriteInfoBody;
    Sprite *sprBody = &psiBody->s;

    if (HITBOX_IS_ACTIVE(s->hitboxes[0]) && IS_ALIVE(p) && HITBOX_IS_ACTIVE(sprBody->hitboxes[0])) {
        if (HB_COLLISION(screenX, screenY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprBody->hitboxes[0].b)) {
            Coll_DamagePlayer(p);

            return HIT_PLAYER;
        }
    }

    return HIT_NONE;
}

// Exclusively used by SA1 Bosses 4, 5, Egg Drillster, Extra Boss and called in player.c
EHit sub_800BFEC(Sprite *s, CamCoord screenX, CamCoord screenY, Player *p)
{
    PlayerSpriteInfo *psiBody = p->spriteInfoBody;
    Sprite *sprBody = &psiBody->s;

    if (HITBOX_IS_ACTIVE(s->hitboxes[1]) && HITBOX_IS_ACTIVE(sprBody->hitboxes[0]) && IS_ALIVE(p)) {
        if (HB_COLLISION(screenX, screenY, s->hitboxes[1].b, I(p->qWorldX), I(p->qWorldY), sprBody->hitboxes[0].b)) {
            if (!IS_EXTRA_STAGE(gCurrentLevel)) {
                Coll_DamagePlayer(p);
            } else {
                Coll_DamageSuperSonic(p);
            }
            return HIT_PLAYER;
        }
    }

    return HIT_NONE;
}

// Exclusively used by SA1 Boss 5, Extra Boss and called in player.c
EHit sub_800C0E0(Sprite *s, CamCoord screenX, CamCoord screenY, Player *p)
{
    PlayerSpriteInfo *psiBody = p->spriteInfoBody;
    Sprite *sprBody = &psiBody->s;

    if (HITBOX_IS_ACTIVE(s->hitboxes[0]) && HITBOX_IS_ACTIVE(sprBody->hitboxes[1]) && IS_ALIVE(p)) {
        if (HB_COLLISION(screenX, screenY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprBody->hitboxes[1].b)) {
            if (!IS_EXTRA_STAGE(gCurrentLevel)) {
                if (p->character != CHARACTER_AMY) {
                    p->qSpeedAirX = -p->qSpeedAirX;
                    p->qSpeedAirY = -p->qSpeedAirY;
                } else {
                    p->qSpeedAirX >>= 1;
                    p->qSpeedAirY = -p->qSpeedAirY;
                }
            }

            return HIT_ENEMY;
        }
    }

    return HIT_NONE;
}

// (97.67%) https://decomp.me/scratch/e4jLp
NONMATCH("asm/non_matching/game/shared/stage/collision__sub_800C1E8.inc",
         u32 sub_800C1E8(Sprite *inSprite, Rect8 rectB, s16 sx, s16 sy, Player *p))
{
#ifndef NON_MATCHING
    register Sprite *s asm("r4") = inSprite; // NOTE: type isn't certain
#else
    Sprite *s = inSprite; // NOTE: type isn't certain
#endif
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprBody = &psi->s;

    if (IS_ALIVE(p) && (HITBOX_IS_ACTIVE(sprBody->hitboxes[0]))) {
        if (HB_COLLISION(sx, sy, rectB, I(p->qWorldX), I(p->qWorldY), sprBody->hitboxes[0].b)) {
            Coll_DamagePlayer(p);
            return HIT_PLAYER;
        }
    }

    asm("" ::"r"(s));

    return HIT_NONE;
}
END_NONMATCH

EHit sub_800C2B8(Sprite *s, s16 sx, s16 sy, Player *p)
{
    PlayerSpriteInfo *psi = p->spriteInfoBody;
    Sprite *sprBody = &psi->s;

    if (HITBOX_IS_ACTIVE(s->hitboxes[0]) && IS_ALIVE(p) && ((p->timerInvulnerability == 0) && (p->timerInvincibility == 0))
        && (HITBOX_IS_ACTIVE(sprBody->hitboxes[0]))) {
        if (HB_COLLISION(sx, sy, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), sprBody->hitboxes[0].b)) {
            return 2;
        }
    }

    return HIT_NONE;
}

#if (GAME == GAME_SA1)
// TODO: Might be in SA3, too!
u32 sub_800C394(Sprite *s, s16 sx, s16 sy, Player *p)
{
    s8 rectPlayer[4] = { -(p->spriteOffsetX + 5), -(p->spriteOffsetY + 1), +(p->spriteOffsetX + 5), +(p->spriteOffsetY + 1) };

    u32 result = COLL_NONE;
    bool32 ip = FALSE;

    if (!HITBOX_IS_ACTIVE(s->hitboxes[0]) || !IS_ALIVE(p)) {
        return FALSE;
    }

    if ((((p->moveState & MOVESTATE_JUMPING) == MOVESTATE_JUMPING) && (p->qSpeedAirY > 0)
         && HB_COLLISION(sx, sy, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*(Rect8 *)rectPlayer)))
        || (p->spriteInfoBody->s.hitboxes[1].index != HITBOX_STATE_INACTIVE
            && HB_COLLISION(sx, sy, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), p->spriteInfoBody->s.hitboxes[1].b)
            && !(p->moveState & (MOVESTATE_JUMPING)))) {
        if (p->qSpeedAirY > 0) {
            p->qSpeedAirY = -p->qSpeedAirY;
        }
        return TRUE;
    }

    return FALSE;
}
#endif

bool32 Coll_DamagePlayer(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return FALSE;
    }

    p->timerInvulnerability = PLAYER_INVULNERABLE_DURATION;

    if ((p->qSpeedAirX < 0) || (p->qSpeedAirX == 0 && (p->moveState & MOVESTATE_FACING_LEFT))) {
        p->qSpeedAirX = +Q(1.5);
    } else {
        p->qSpeedAirX = -Q(1.5);
    }

    p->qSpeedAirY = -Q(3.0);

    if (p->moveState & MOVESTATE_IN_WATER) {
        HALVE(p->qSpeedAirY);
        HALVE(p->qSpeedAirX);
    }

    p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_SPIN_ATTACK;
    p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~MOVESTATE_SPINDASH;
    p->moveState &= ~MOVESTATE_100;

    p->charState = 15;
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    {
#if !NON_MATCHING && (GAME == GAME_SA1)
        u8 *ptr = &p->SA2_LABEL(unk61);
        u32 zero = 0;
        asm("strb %0, [%1]" ::"r"(zero), "r"(ptr));
        asm("add %0, #1" : "=r"(ptr));
        asm("strb %0, [%1]" ::"r"(zero), "r"(ptr));
#else
        p->SA2_LABEL(unk61) = 0;
        p->SA2_LABEL(unk62) = 0;
#endif
    }

    if (p->moveState & MOVESTATE_1000000) {
        PlayerSpriteInfo *psi;

        p->layer ^= PLAYER_LAYER__MASK;

        if (SA2_LABEL(sub_8022F58)(p->rotation + Q(0.5), p) < 4) {
            p->layer ^= PLAYER_LAYER__MASK;
        } else {
            p->moveState &= ~MOVESTATE_1000000;
            p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

            p->spriteInfoBody->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            p->spriteInfoBody->s.frameFlags |= SPRITE_FLAG(PRIORITY, 2);
        }
    }

    p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;

    if (p->playerID == 0) {
        if (!HAS_SHIELD(p)) {
            if (gRingCount != 0) {
                RoomEvent_RingLoss *roomEvent;
                u32 rings = gRingCount;
                if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
#ifndef NON_MATCHING
                    register u32 rings2 asm("r0") = rings;
#else
                    u32 rings2 = rings;
#endif
                    if (rings > 10) {
                        rings2 = 10;
                    }

                    rings = rings2;
                }

                InitScatteringRings(I(p->qWorldX), I(p->qWorldY), rings);

                if (IS_MULTI_PLAYER) {
                    RoomEvent_RingLoss *roomEvent = CreateRoomEvent();
                    roomEvent->type = ROOMEVENT_TYPE_PLAYER_RING_LOSS;
                    roomEvent->ringCount = rings;
                }

                gRingCount -= rings;
            } else if (!(gStageFlags & STAGE_FLAG__DEMO_RUNNING)) {
                if (gGameMode == 4) {
                    return TRUE;
                }

                if (gGameMode == 5) {
                    return TRUE;
                }

                p->moveState |= MOVESTATE_DEAD;
            }
        } else {
            m4aSongNumStart(SE_LIFE_LOST);
            p->itemEffect &= ~(PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC | PLAYER_ITEM_EFFECT__SHIELD_NORMAL);
        }
    }

    return TRUE;
}

#if (GAME == GAME_SA1)
// Equivalent to Coll_DamagePlayer.
// Super Sonic isn't "damaged" per se, just thrown back a bit.
bool32 Coll_DamageSuperSonic(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return HIT_NONE;
    }

    p->timerInvulnerability = 30;
    p->qSpeedAirX = -Q(3);
    p->qSpeedGround = -Q(3);
    p->qSpeedAirY = -Q(0);
    p->sa2__unk2A = 24;
    p->charState = 4;
    p->SA2_LABEL(unk61) = 0;
    p->SA2_LABEL(unk62) = 0;

    m4aSongNumStart(SE_LIFE_LOST);

    return TRUE;
}
#endif // (GAME == GAME_SA1)

bool32 SA2_LABEL(sub_800DD54)(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return FALSE;
    }

    p->timerInvulnerability = PLAYER_INVULNERABLE_DURATION;

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->qSpeedAirX = +Q(1.5);
    } else {
        p->qSpeedAirX = -Q(1.5);
    }

    p->qSpeedAirY = -Q(3.0);

    if (p->moveState & MOVESTATE_IN_WATER) {
        HALVE(p->qSpeedAirY);
        HALVE(p->qSpeedAirX);
    }

    p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_SPIN_ATTACK;
    p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~MOVESTATE_SPINDASH;
    p->moveState &= ~MOVESTATE_100;

#if (GAME == GAME_SA1)
    p->charState = 15;
#else
    p->charState = SA2_CHAR_ANIM_20;
#endif
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    {
#if !NON_MATCHING && (GAME == GAME_SA1)
        u8 *ptr = &p->SA2_LABEL(unk61);
        u32 zero = 0;
        asm("strb %0, [%1]" ::"r"(zero), "r"(ptr));
        asm("add %0, #1" : "=r"(ptr));
        asm("strb %0, [%1]" ::"r"(zero), "r"(ptr));
#else
        p->SA2_LABEL(unk61) = 0;
        p->SA2_LABEL(unk62) = 0;
#endif
    }

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
#ifndef NON_MATCHING
        register u32 rings asm("r4") = gRingCount;
#else
        u32 rings = gRingCount;
#endif

        if (rings > 10) {
            rings = 10;
        }

        InitScatteringRings(I(p->qWorldX), I(p->qWorldY), rings);
        gRingCount -= rings;

        {
            RoomEvent_RingLoss *roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_PLAYER_RING_LOSS;
            roomEvent->ringCount = rings;
        }
    }

    m4aSongNumStart(SE_LIFE_LOST);

    return TRUE;
}

// TODO: This is close to SA2_LABEL(sub_800DD54).
bool32 SA2_LABEL(sub_800DE44)(Player *p)
{
    if (p->timerInvincibility > 0 || p->timerInvulnerability > 0) {
        return FALSE;
    }

    p->timerInvulnerability = PLAYER_INVULNERABLE_DURATION;

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->qSpeedAirX = -Q(1.5);
    } else {
        p->qSpeedAirX = +Q(1.5);
    }

    p->qSpeedAirY = -Q(3.0);

    if (p->moveState & MOVESTATE_IN_WATER) {
        HALVE(p->qSpeedAirY);
        HALVE(p->qSpeedAirX);
    }

    p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_SPIN_ATTACK;
    p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~MOVESTATE_SPINDASH;
    p->moveState &= ~MOVESTATE_100;

#if (GAME == GAME_SA1)
    p->charState = 41;
#else
    p->charState = SA2_CHAR_ANIM_20;
#endif
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    {
#if !NON_MATCHING && (GAME == GAME_SA1)
        u8 *ptr = &p->SA2_LABEL(unk61);
        u32 zero = 0;
        asm("strb %0, [%1]" ::"r"(zero), "r"(ptr));
        asm("add %0, #1" : "=r"(ptr));
        asm("strb %0, [%1]" ::"r"(zero), "r"(ptr));
#else
        p->SA2_LABEL(unk61) = 0;
        p->SA2_LABEL(unk62) = 0;
#endif
    }

#if (GAME == GAME_SA2)
    p->transition = 9;
#endif

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
#ifndef NON_MATCHING
        register u32 rings asm("r4") = gRingCount;
#else
        u32 rings = gRingCount;
#endif

        if (rings > 5) {
            rings = 5;
        }

        InitScatteringRings(I(p->qWorldX), I(p->qWorldY), rings);
        gRingCount -= rings;

        {
            RoomEvent_RingLoss *roomEvent = CreateRoomEvent();
            roomEvent->type = ROOMEVENT_TYPE_PLAYER_RING_LOSS;
            roomEvent->ringCount = rings;
        }
    }

    m4aSongNumStart(SE_LIFE_LOST);

    return TRUE;
}

#if (GAME == GAME_SA1)

// INCOMPLETE!
// (92.41%) https://decomp.me/scratch/9c6nz
NONMATCH("asm/non_matching/game/shared/stage/collision__sub_800C934.inc",
         bool32 sub_800C934(Sprite *s, s32 x, s32 y, Rect8 *rectPlayer, u32 param4, Player *p, u32 *moveState))
{
    bool16 gravityInverted = GRAVITY_IS_INVERTED;
    // bottom = sl
#ifndef NON_MATCHING
    register s32 middleY asm("sl") = y + ((s->hitboxes[0].b.top + s->hitboxes[0].b.bottom) >> 1);
#else
    s32 middleY = y + ((s->hitboxes[0].b.top + s->hitboxes[0].b.bottom) >> 1);
#endif

    if (!HB_COLLISION(x, y, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*rectPlayer))) {
        return FALSE;
    }

    if (!gravityInverted) {
        if (I(p->qWorldY) > middleY) {
            s32 whole = Q(s->hitboxes[0].b.bottom + y - rectPlayer->top);
            p->qWorldY = *(u8 *)&p->qWorldY + whole;
            asm("");
        } else {
            goto test;
        }
    } else {
        if (I(p->qWorldY) >= middleY) {
        test:
            if (!gravityInverted) {
                p->qWorldY = Q_24_8_FRAC(p->qWorldY) + Q(s->hitboxes[0].b.top + y - rectPlayer->bottom);
            } else {
                p->qWorldY = Q_24_8_FRAC(p->qWorldY) + Q(s->hitboxes[0].b.bottom + y + rectPlayer->bottom);
            }

            if (p->qWorldY < Q(gCamera.minY)) {
                p->qWorldY = Q(gCamera.minY);
                return FALSE;
            }

            if (p->qWorldY >= Q(gCamera.maxY)) {
                p->qWorldY = Q(gCamera.maxY);
                return FALSE;
            }

            if (p->qSpeedAirY < 0) {
                return FALSE;
            }

            rectPlayer->top = -p->spriteOffsetY;
            rectPlayer->bottom = +p->spriteOffsetY;
            p->qSpeedAirY = Q(0);

            if (!(p->moveState & MOVESTATE_IN_AIR) && (((p->rotation + 0x20) & 0x40) != 0)) {
                p->qSpeedGround = Q(0);
            }

            p->moveState |= MOVESTATE_STOOD_ON_OBJ;
            *moveState |= MOVESTATE_STOOD_ON_OBJ;

            if (p->character == CHARACTER_KNUCKLES) {
                if (p->SA2_LABEL(unk61) == 1 || p->SA2_LABEL(unk61) == 3) {
                    goto lbl;
                }
            }
            if ((p->character != CHARACTER_AMY) || !(p->moveState & 0x04000000) || (p->SA2_LABEL(unk62) == 0)) {
                p->moveState &= ~MOVESTATE_IN_AIR;
            }
        lbl:
            p->stoodObj = s;

            if (param4 == 0) {
                if (p->character != CHARACTER_KNUCKLES || (p->SA2_LABEL(unk61) != 1 && p->SA2_LABEL(unk61) != 3)) {
                    SA2_LABEL(sub_8021BE0)(p);
                    p->qSpeedGround = p->qSpeedAirX;
                }

                p->rotation = 0;
            }
            return 1;
        } else {
            // 204
            p->qWorldY = Q_24_8_FRAC(p->qWorldY) + Q(s->hitboxes[0].b.top + y + rectPlayer->top);
        }
    }

    if (p->qWorldY < Q(gCamera.minY)) {
        p->qWorldY = Q(gCamera.minY);
        return FALSE;
    }

    if (p->qWorldY >= Q(gCamera.maxY)) {
        p->qWorldY = Q(gCamera.maxY);
        return FALSE;
    }

    *moveState |= MOVESTATE_10000;

    if (p->qSpeedAirY <= 0) {
        p->qSpeedAirY = 0;

        if (!(p->moveState & MOVESTATE_IN_AIR)) {
            if ((p->rotation + 0x20) & 0x40) {
                p->qSpeedGround = 0;
            }
        }

        return TRUE;
    }

    return FALSE;
}
END_NONMATCH

// TODO: Check type of x/y!
// INCOMPLETE!
NONMATCH("asm/non_matching/game/shared/stage/collision__sub_800CBBC.inc",
         bool32 sub_800CBBC(Sprite *s, s32 x, s32 y, Rect8 *rectPlayer, u32 UNUSED param4, Player *p, u32 *param6))
{
    s32 shbLeft = s->hitboxes[0].b.left;
    s32 shbRight = s->hitboxes[0].b.right;
    s32 shbMiddleH = (shbLeft + shbRight) >> 1;

    if ((((s32)(p->rotation + 0x20) & 0xC0) >> 6) & 0x1) {
        return FALSE;
    }
    // _0800CC04

    if (((x + shbLeft) > (I(p->qWorldX) + rectPlayer->left)) && (RECT_RIGHT(I(p->qWorldX), rectPlayer) < shbLeft)) {
        return FALSE;
    }

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    return FALSE;
}
END_NONMATCH

#endif // (GAME == GAME_SA1)

// TODO: This might be an inline.
//       Code identical to beginning of sub_800C060
#if (GAME == GAME_SA1)
u32 Coll_Player_Entity_Intersection(Sprite *s, s16 x, s16 y, Player *p)
#elif (GAME == GAME_SA2)
u32 sub_800DF38(Sprite *s, s32 x, s32 y, Player *p)
#endif
{
    // TODO: Could this match with a 'Rect8' instead of s8[4]?
    s8 rectPlayer[4] = { -p->spriteOffsetX, -p->spriteOffsetY, +p->spriteOffsetX, +p->spriteOffsetY };

    return Coll_Player_Entity_RectIntersection(s, x, y, p, (Rect8 *)&rectPlayer);
}

#if (GAME == GAME_SA1)
u32 sub_800CE98(Sprite *s, s16 x, s16 y, Player *p)
{
    // TODO: Could this match with a 'Rect8' instead of s8[4]?
    s8 rectPlayer[4] = { -(p->spriteOffsetX + 5), (1 - p->spriteOffsetY), +(p->spriteOffsetX + 5), +(p->spriteOffsetY - 1) };

    return Coll_Player_Entity_RectIntersection(s, x, y, p, (Rect8 *)&rectPlayer);
}
#endif
