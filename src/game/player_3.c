#include "global.h"
#include "core.h"
#include "game/game.h"
#include "game/player_callbacks_1.h"
#include "game/playerfn_cmds.h"
#include "game/stage/camera.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/player_transitions.h"

const u16 gUnknown_080D6736[115][2] = {
    {
        0,
        0,
    },
    {
        1,
        0,
    },
    {
        2,
        0,
    },
    {
        3,
        0,
    },
    {
        4,
        0,
    },
    {
        5,
        0,
    },
    {
        6,
        0,
    },
    {
        7,
        0,
    },
    {
        8,
        0,
    },
    {
        9,
        0,
    },
    {
        10,
        0,
    },
    {
        11,
        0,
    },
    {
        12,
        0,
    },
    {
        13,
        0,
    },
    {
        13,
        0,
    },
    {
        14,
        0,
    },
    {
        15,
        0,
    },
    {
        16,
        0,
    },
    {
        17,
        0,
    },
    {
        18,
        0,
    },
    {
        28,
        0,
    },
    {
        28,
        1,
    },
    {
        29,
        0,
    },
    {
        1,
        0,
    },
    {
        1,
        0,
    },
    {
        31,
        0,
    },
    {
        31,
        1,
    },
    {
        31,
        2,
    },
    {
        32,
        0,
    },
    {
        33,
        0,
    },
    {
        34,
        0,
    },
    {
        1,
        0,
    },
    {
        35,
        0,
    },
    {
        48,
        0,
    },
    {
        49,
        0,
    },
    {
        50,
        0,
    },
    {
        51,
        0,
    },
    {
        65,
        0,
    },
    {
        52,
        0,
    },
    {
        53,
        0,
    },
    {
        54,
        0,
    },
    {
        55,
        0,
    },
    {
        56,
        0,
    },
    {
        57,
        0,
    },
    {
        58,
        0,
    },
    {
        59,
        0,
    },
    {
        60,
        0,
    },
    {
        68,
        0,
    },
    {
        69,
        0,
    },
    {
        69,
        1,
    },
    {
        70,
        0,
    },
    {
        62,
        0,
    },
    {
        62,
        1,
    },
    {
        63,
        0,
    },
    {
        63,
        1,
    },
    {
        61,
        0,
    },
    {
        64,
        0,
    },
    {
        66,
        0,
    },
    {
        67,
        0,
    },
    {
        73,
        0,
    },
    {
        73,
        1,
    },
    {
        73,
        2,
    },
    {
        75,
        0,
    },
    {
        9,
        2,
    },
    {
        71,
        0,
    },
    {
        71,
        1,
    },
    {
        72,
        0,
    },
    {
        36,
        0,
    },
    {
        36,
        1,
    },
    {
        36,
        2,
    },
    {
        36,
        3,
    },
    {
        1,
        0,
    },
    {
        1,
        0,
    },
    {
        1,
        0,
    },
    {
        1,
        0,
    },
    {
        1,
        0,
    },
    {
        1,
        0,
    },
    {
        1,
        0,
    },
    {
        1,
        0,
    },
    {
        1,
        0,
    },
    {
        19,
        0,
    },
    {
        37,
        0,
    },
    {
        37,
        1,
    },
    {
        110,
        0,
    },
    {
        110,
        1,
    },
    {
        112,
        0,
    },
    {
        111,
        0,
    },
    {
        113,
        0,
    },
    {
        202,
        0,
    },
    {
        203,
        0,
    },
    {
        204,
        0,
    },
    {
        201,
        0,
    },
    {
        292,
        0,
    },
    {
        295,
        0,
    },
    {
        295,
        1,
    },
    {
        294,
        0,
    },
    {
        293,
        0,
    },
    {
        293,
        1,
    },
    {
        293,
        2,
    },
    {
        293,
        3,
    },
    {
        296,
        0,
    },
    {
        297,
        2,
    },
    {
        297,
        0,
    },
    {
        297,
        1,
    },
    {
        297,
        3,
    },
    {
        297,
        4,
    },
    {
        324,
        0,
    },
    {
        324,
        1,
    },
    {
        324,
        2,
    },
    {
        416,
        0,
    },
    {
        1,
        0,
    },
    {
        378,
        0,
    },
    {
        383,
        0,
    },
    {
        1,
        0,
    },
    {
        382,
        0,
    },
};

void CallPlayerTransition(Player *p)
{
    if (p->transition) {
        switch (p->transition - 1) {
            case PLTRANS_PT1 - 1: {
                PLAYERFN_SET(PlayerCB_8025318);
            } break;
            case PLTRANS_PT2 - 1: {
                PLAYERFN_SET(PlayerCB_8025A0C);
            } break;
            case PLTRANS_PT3 - 1: {
                p->moveState &= ~(MOVESTATE_400000 | MOVESTATE_IGNORE_INPUT);
                PLAYERFN_SET(PlayerCB_Jump);
            } break;
            case PLTRANS_PT4 - 1: {
                p->moveState &= ~(MOVESTATE_400000 | MOVESTATE_IGNORE_INPUT);
                PLAYERFN_SET(PlayerCB_8025F84);
            } break;
            case PLTRANS_PT7 - 1: {
                PLAYERFN_SET(PlayerCB_8028D74);
            } break;
            case PLTRANS_PT6 - 1: {
                p->moveState |= MOVESTATE_100;
                PLAYERFN_SET(PlayerCB_8026060);
            } break;
            case PLTRANS_PT5 - 1: {
                p->moveState |= MOVESTATE_100;
                PLAYERFN_SET(PlayerCB_802611C);
            } break;
            case PLTRANS_PT8 - 1: {
                PLAYERFN_SET(PlayerCB_801225C);
            } break;
            case PLTRANS_PT9 - 1: {
                PLAYERFN_SET(PlayerCB_8027250);
            } break;
            case PLTRANS_PT10 - 1: {
                if (gGameMode == GAME_MODE_TIME_ATTACK) {
                    gUnknown_03005424 |= EXTRA_STATE__TURN_OFF_TIMER;
                }

                if (p->moveState
                    & (MOVESTATE_20000000 | MOVESTATE_10000000 | MOVESTATE_2000
                       | MOVESTATE_8 | MOVESTATE_IN_AIR)) {
                    p->moveState |= (MOVESTATE_8000000 | MOVESTATE_IGNORE_INPUT);
                    p->unk5C = 0;
                    p->unk5E = 0;
                } else {
                    // _080243D0
                    p->moveState |= MOVESTATE_8000000;
                    PLAYERFN_SET(PlayerCB_80273D0);
                }
            } break;
            case PLTRANS_SPRING_UP - 1: {
                // NOTE: Set to 0 or 3 in floating_spring.c
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x10;
                }
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_DOWN - 1: {
                if (!GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x10;
                }
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_LEFT - 1: {
                p->unk6E |= 0x20;
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_RIGHT - 1: {
                p->unk6E |= 0x30;
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_UP_LEFT - 1: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x60;
                } else {
                    p->unk6E |= 0x40;
                }
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_UP_RIGHT - 1: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x70;
                } else {
                    p->unk6E |= 0x50;
                }
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_DOWN_LEFT - 1: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x40;
                } else {
                    p->unk6E |= 0x60;
                }
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_SPRING_DOWN_RIGHT - 1: {
                if (GRAVITY_IS_INVERTED) {
                    p->unk6E |= 0x50;
                } else {
                    p->unk6E |= 0x70;
                }
                PLAYERFN_SET(PlayerCB_TouchNormalSpring);
            } break;
            case PLTRANS_PT22 - 1: {
                PLAYERFN_SET(PlayerCB_8029158);
            } break;
            case PLTRANS_PT24 - 1: {
                PLAYERFN_SET(PlayerCB_802A300);
            } break;
            case PLTRANS_PT11 - 1: {
                PLAYERFN_SET(PlayerCB_8026764);
            } break;
            case PLTRANS_PT12 - 1: {
                PLAYERFN_SET(PlayerCB_80269C0);
            } break;
            case PLTRANS_PT13 - 1: {
                PLAYERFN_SET(PlayerCB_8026A4C);
            } break;
            case PLTRANS_PT23 - 1: {
                PLAYERFN_SET(PlayerCB_802A258);
            } break;
            case PLTRANS_PT25 - 1: {
                PLAYERFN_SET(PlayerCB_8026E24);
            } break;
            case PLTRANS_PT28 - 1: {
                PLAYERFN_SET(PlayerCB_8026F10);
            } break;
            case PLTRANS_PT26 - 1: {
                PLAYERFN_SET(PlayerCB_8026FC8);
            } break;
            case PLTRANS_PT27 - 1: {
                PLAYERFN_SET(PlayerCB_8027114);
            } break;
        }
    }

    p->prevTransition = p->transition;
    p->transition = 0;
}

void sub_802460C(Player *p)
{
    u32 input;
    u16 input2;

    if (IS_MULTI_PLAYER && (SIO_MULTI_CNT->id != gCamera.spectatorTarget)) {
        p->unk5C = 0;
        input = 0;
    } else {
        input = p->unk5C;

        if (!(p->moveState & MOVESTATE_IGNORE_INPUT)) {
            p->unk5C = gInput;

            if (IS_MULTI_PLAYER && (p->itemEffect & PLAYER_ITEM_EFFECT__40)) {
                u8 dpad = (p->unk5C & DPAD_ANY) >> 4;
                u32 r1 = gStageTime;

                r1 = ((p->unk32 + r1) & 0x3);
                if (!r1) {
                    r1 = 1;
                }

                dpad <<= r1;
                dpad = (dpad >> 4) | dpad;
                dpad = (u8)(dpad << 4);

                p->unk5C = (p->unk5C & ~DPAD_ANY) | dpad;

                if (--p->unk32 == 0) {
                    p->itemEffect &= 0xBF;
                }
            }
        }
    }

    input2 = p->unk5C;
    input ^= input2;
#ifdef NON_MATCHING
    input &= input2;
#else
    asm("and %0, %2" : "=r"(input) : "r"(input), "r"(input2));
#endif
    p->unk5E = input;
}

void sub_80246DC(Player *p)
{
    Sprite *s90 = &p->unk90->s;
    u16 charAnim = p->unk64;
    u32 r3 = p->anim;
    u32 variant = p->variant;
    u32 sl = variant;

    AnimId baseAnim = gPlayerCharacterIdleAnims[p->character];
    r3 = (u16)(r3 - baseAnim);

    if ((charAnim == 10) || (charAnim == 11)) {
        if (variant == 0 && (s90->unk10 & SPRITE_FLAG_MASK_ANIM_OVER)
            && (((u16)r3 - 10) == 0 || ((u16)r3 - 10) == 1)) {
            p->variant = 1;
            p->moveState |= MOVESTATE_4;

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
        } else {
            if ((p->speedAirY > 0) && (p->variant == 1)
                && ((((u16)r3 - 10) == 0) || (((u16)r3 - 10) == 1))) {
                s32 newY
                    = sub_801E6D4(Q_24_8_TO_INT(p->y) + p->unk17, Q_24_8_TO_INT(p->x),
                                  p->unk38, 8, NULL, sub_801EE64);

                if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if (newY <= 32) {
                        p->variant = 2;
                    }
                }
            }
        }
    } else {
        if (charAnim == SA2_CHAR_ANIM_38) {
            if (r3 == SA2_CHAR_ANIM_52) {
                if (variant == 0) {
                    if (p->speedAirY > 0) {
                        p->variant = 1;
                    }
                } else if (variant == 1) {
                    if (s90->unk10 & SPRITE_FLAG_MASK_ANIM_OVER) {
                        p->variant = 2;
                    }
                }
            }
        } else if (charAnim == SA2_CHAR_ANIM_39) {
            if (r3 == SA2_CHAR_ANIM_53) {
                if (variant == 0) {
                    if (s90->unk10 & SPRITE_FLAG_MASK_ANIM_OVER) {
                        p->anim = (gPlayerCharacterIdleAnims[p->character]
                                   + SA2_CHAR_ANIM_52);
                        p->variant = 2;
                    }
                }
            }
        } else if (charAnim == SA2_CHAR_ANIM_37) {
            if (r3 == SA2_CHAR_ANIM_65) {
                if (variant == 0) {
                    if (p->speedAirY > 0) {
                        p->variant = 1;
                    }
                } else if (variant == 1) {
                    if (s90->unk10 & SPRITE_FLAG_MASK_ANIM_OVER) {
                        p->variant = 2;
                    }
                }
            }
        } else if (charAnim == SA2_CHAR_ANIM_57) {
            if (r3 == SA2_CHAR_ANIM_66) {
                if (variant == 0) {
                    if (p->speedAirY > 0) {
                        p->variant = 1;
                    }
                } else if (sl == 1) {
                    if (s90->unk10 & SPRITE_FLAG_MASK_ANIM_OVER) {
                        p->variant = 2;
                    }
                }
            }
        }
    }
}

void sub_802486C(Player *p, UNK_3005A70 *p2)
{
#ifndef NON_MATCHING
    s32 speed;
    register s32 r0 asm("r0");
#endif
    Sprite *s = &p2->s;

    if ((p->unk64 != -1) && (p->unk64 != p->unk66)) {
        p->anim = gUnknown_080D6736[p->unk64][0];

        // NOTE: Could it be that anims 80-91 are character-specific?
        if (p->unk64 < SA2_CHAR_ANIM_80) {
            p->anim += gPlayerCharacterIdleAnims[p->character];
        }
        // _080248C6
        p->variant = gUnknown_080D6736[p->unk64][1];
        p2->s.animSpeed = SPRITE_ANIM_SPEED(1.0);
    }
    // _080248E0

    switch (((u16)(p->unk64 - 9) << 16) >> 16) {
        case SA2_CHAR_ANIM_WALK - 9: {
            // _080249E8
            p->anim = gPlayerCharacterIdleAnims[p->character] + SA2_CHAR_ANIM_WALK;
            p->variant = p->unk54;
        } // FALLTHROUGH!!!

        case 59 - 9:
        case 60 - 9:
        case 61 - 9: {
            // _08024A10
            PLAYERFN_SET_ANIM_SPEED(p, s);
        } break;

        case 16 - 9: {
#ifndef NON_MATCHING
            if (p->character != CHARACTER_CREAM) {
                break;
            }
            // _08024A3A
            speed = p->speedGroundX;
            speed = (speed >> 5) + (speed >> 6);

            /* TODO: Try ABS macro */
            speed = ABS(speed);

            if (speed >= SPRITE_ANIM_SPEED(0.5)) {
                if (speed > SPRITE_ANIM_SPEED(8.0)) {
                    speed = SPRITE_ANIM_SPEED(8.0);
                }
            } else {
                speed = SPRITE_ANIM_SPEED(0.5);
            }
            s->animSpeed = speed;
#else
            PLAYERFN_SET_ANIM_SPEED(p, s);
#endif
        } break;

        case 51 - 9:
        case 52 - 9: {
            // _08024A70
#ifndef NON_MATCHING
            r0 = p->speedAirY;
            goto lab;
#else
            s->animSpeed = Q_24_8_TO_INT(ABS(p->speedAirY)) * 3 + 8;
#endif
        } break;

        case 53 - 9:
        case 54 - 9: {
#ifndef NON_MATCHING
            // _08024A76
            r0 = p->speedGroundX;
        lab:
            speed = Q_24_8_TO_INT(ABS(r0)) * 3 + 8;
            s->animSpeed = speed;
#else
            s->animSpeed = Q_24_8_TO_INT(ABS(p->speedGroundX)) * 3 + 8;
            ;
#endif
        } break;
    }
    // _08024A96

    if (IS_MULTI_PLAYER) {
        p->unk98 = 0;
    }
    // _08024AA8

    if ((p->unk6C != 0) || (s->graphics.anim != p->anim) || (s->variant != p->variant)) {
        // _08024ACA
        p->unk6C = 0;
        s->graphics.anim = p->anim;
        s->variant = p->variant;
        s->prevVariant = -1;
        s->hitboxes[0].index = -1;
        s->hitboxes[1].index = -1;

        if (IS_MULTI_PLAYER) {
            p->unk98 = 1;
        }
    }
    // _08024AF6
    p->unk66 = p->unk64;
}
