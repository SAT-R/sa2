#include "global.h"
#include "trig.h"
#include "lib/m4a.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/player_callbacks_1.h"
#include "game/playerfn_cmds.h"
#include "game/parameters/characters.h"

#include "constants/animations.h"
#include "constants/songs.h"

/* NOTE: We consider Player Callbacks to be all procedures
 *       that are passed to the first member of the Player struct.
 *       So even if there are procedures that only take a Player,
 *       if they are only called directly in the code, those are NOT callbacks.
 */

void sub_8011B88(s32, s32, u32);
void PlayerCB_8011DCC(Player *);
void PlayerCB_8011E88(Player *);
void Task_8012034(void);
void PlayerCB_80123D0(Player *);
void PlayerCB_8012DA4(Player *p);
void PlayerCB_80123FC(Player *);
void PlayerCB_8012460(Player *);
void PlayerCB_8012498(Player *p);
void TaskDestructor_80124B8(struct Task *);
void PlayerCB_80124D0(Player *p);
void PlayerCB_80126B0(Player *p);
void PlayerCB_80127F0(Player *p);
void PlayerCB_8012938(Player *p);
void PlayerCB_8012978(Player *p);
void PlayerCB_80129BC(Player *p);
void PlayerCB_8012C2C(Player *p);
void PlayerCB_8012D1C(Player *p);
void PlayerCB_8012F6C(Player *p);
void PlayerCB_8013010(Player *p);
void PlayerCB_80130E4(Player *p);
s32 sub_8013644(Player *p);
void sub_801394C(Player *p);
void PlayerCB_8013B6C(Player *p);
void PlayerCB_8013BB4(Player *p);
void PlayerCB_8013BD4(Player *p);
void PlayerCB_8013BF0(Player *p);
void PlayerCB_8013C18(Player *p);
void PlayerCB_8013C34(Player *p);
void sub_8013C50(Player *p);
void sub_8013CA0(Player *p);

void sub_8015BD4(u16);

void sub_801F214(void);
void sub_801F550(struct Task *);
void sub_801F5CC(s32, s32);

void sub_8022318(Player *p);
void sub_8022838(Player *p);
void sub_80232D0(Player *p);

void sub_8023610(Player *p);
void PlayerFn_Cmd_UpdatePosition(Player *p);
void PlayerFn_Cmd_UpdateAirFallSpeed(Player *p);

extern void PlayerCB_8025318(Player *p);
extern void PlayerCB_80261D8(Player *p);
extern void sub_8027EF0(Player *p);
extern void sub_8028204(Player *p);
extern void sub_80282EC(Player *p);
extern void sub_80283C4(Player *p);
extern void sub_8029C84(Player *p);
extern void sub_8029FA4(Player *p);

extern u16 gUnknown_080D6736[115][2];

static const s16 gUnknown_080D552C[6]
    = { Q_24_8(2.0), Q_24_8(4.0), Q_24_8(6.0), Q_24_8(8.0), Q_24_8(10.0), 0 };

static const s8 gUnknown_080D5538[4] = { 96, 97, 98, 99 };

static const u16 sKnucklesAnimData_FX[2][3] = {
    { 30, SA2_ANIM_CHAR(SA2_CHAR_ANIM_16, CHARACTER_KNUCKLES), 2 },
    { 25, SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_KNUCKLES), 3 },
};

// For Sonic's Down-Trick "Bound"
struct Task *sub_8011C98(s32 x, s32 y)
{
    if (IS_MULTI_PLAYER) {
        return NULL;
    } else {
        struct Task *t = TaskCreate(Task_8012034, sizeof(TaskStrc_8011C98), 0x4001, 0,
                                    TaskDestructor_80124B8);

        TaskStrc_8011C98 *strc = TaskGetStructPtr(t);
        Sprite *s = &strc->s;

        s16 i;
        for (i = 0; i < 5; i++) {
            strc->px[i] = x;
            strc->py[i] = y;
        }

        strc->unk28 = 0;
        s->graphics.dest = VramMalloc(16);
        s->graphics.size = 0;
        s->graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_51, CHARACTER_SONIC);
        s->variant = 3;
        s->unk21 = -1;
        s->unk1A = 0x440;
        s->unk1C = 0;
        s->unk22 = 0x10;
        s->focused = 0;
        s->unk10 = SPRITE_FLAG_PRIORITY(2);

        return t;
    }
}

void sub_8011D48(Player *p)
{
    sub_80218E4(p);

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->moveState |= MOVESTATE_20000000;

    if (p->unk5A == FALSE) {
        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->speedGroundX = -Q_24_8(3.0);
        } else {
            p->speedGroundX = +Q_24_8(3.0);
        }

        p->unk64 = 15;
    } else {
        p->unk64 = 17;
    }

    m4aSongNumStart(SE_TAILS_TAIL_SWIPE);

    PLAYERFN_SET_AND_CALL(PlayerCB_8011DCC, p);
}

void PlayerCB_8011DCC(Player *p)
{
    s32 grndSpeed = p->speedGroundX;
    if (grndSpeed > 0) {
        p->speedGroundX = ((grndSpeed - 8) > 0) ? (grndSpeed - 8) : 0;
    } else if (grndSpeed < 0) {
        if ((grndSpeed + 8) <= 0)
            p->speedGroundX = (grndSpeed + 8);
        else
            p->speedGroundX = 0;
    }

    sub_8029C84(p);

    if (p->unk90->s.unk10 & MOVESTATE_4000) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->unk64 = 50;
            p->unk6D = 5;
        } else {
            p->unk6A = 1;
            p->unk6C = 1;

            PLAYERFN_SET(PlayerCB_8011E88);

            if (!p->unk5A) {
                if (p->moveState & MOVESTATE_FACING_LEFT) {
                    p->speedGroundX = -Q_24_8(4.0);
                } else {
                    p->speedGroundX = +Q_24_8(4.0);
                }
            } else {
                sub_8011B88(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y), 0);
            }

            p->unk72 = 32;
            m4aSongNumStart(SE_SONIC_SKID_ATTACK);
        }
    }

    sub_8027EF0(p);
}

void PlayerCB_8011E88(Player *p)
{
    s32 grndSpeed = p->speedGroundX;
    if (grndSpeed > 0) {
        p->speedGroundX
            = ((grndSpeed - Q_24_8(0.125)) > 0) ? (grndSpeed - Q_24_8(0.125)) : 0;
    } else if (grndSpeed < 0) {
        if ((grndSpeed + Q_24_8(0.125)) <= 0)
            p->speedGroundX = (grndSpeed + Q_24_8(0.125));
        else
            p->speedGroundX = 0;
    }

    sub_8029C84(p);

    if (--p->unk72 == -1) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->unk64 = 50;
            p->unk6D = 5;
        } else {
            p->unk6A = 2;
            p->unk6C = 1;

            PLAYERFN_SET(PlayerCB_80123D0);
        }
    }

    sub_8027EF0(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        sub_8029FA4(p);
    }
}

// Seems to initialize the "Stop'n' Slam" moves (Trickmove-Down)
// for Sonic (Bound) & Amy (Mid-Air Hammer Swirl)
void PlayerCB_8011F1C(Player *p)
{
    sub_80218E4(p);
    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->moveState |= MOVESTATE_20000000;

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    p->unk5A = FALSE;
    p->unk64 = 36;

    if (p->character == CHARACTER_AMY) {
        m4aSongNumStart(SE_AMY_HAMMER_SWIRL);
    }

    p->speedAirX = 0;
    p->speedAirY = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_80123FC, p);
}

void PlayerCB_8011F94(Player *p)
{
    p->speedAirY += TRICK__STOP_N_SLAM__DROP_SPEED;

    sub_80283C4(p);

    if ((p->moveState & (MOVESTATE_4000 | MOVESTATE_IN_AIR)) != MOVESTATE_IN_AIR) {
        s32 bounceSpeed;
        s32 rot;
        s32 sinValue;
        s32 bounceImpactAccel = -Q_24_8(6.0);

        // Matching
        u8 *rotPtr = &p->rotation;
        rotPtr++;
        rotPtr--;

        // Bounce up after hitting the ground
        sinValue = SIN_24_8(rot = p->rotation * 4);
        p->speedAirX = -Q_24_8_TO_INT(bounceImpactAccel * sinValue);
        bounceSpeed = Q_24_8_TO_INT(bounceImpactAccel * (COS_24_8((rot))));
        p->speedAirY = -ABS(bounceSpeed);

        p->speedAirX = p->speedAirX >> 1;

        PLAYERFN_SET(PlayerCB_8012460);

        p->moveState |= MOVESTATE_IN_AIR;

        if (p->character == CHARACTER_SONIC) {
            m4aSongNumStart(SE_SONIC_BOUND_IMPACT);
        }

        p->unk64 = -1;
    }
}

void Task_8012034(void)
{
    TaskStrc_8011C98 *strc = TaskGetStructPtr(gCurTask);
    Sprite *s = &strc->s;
    TrickBoundPos pos;

    if ((gPlayer.moveState & MOVESTATE_DEAD) || (gPlayer.speedAirY < Q_24_8(2.0))
        || (gPlayer.unk64 != 36)) {
        TaskDestroy(gCurTask);
    } else {
        sub_8004558(s);

        strc->unk28 = ((strc->unk28 - 1) & 0x6);
        sub_80157C8(&pos, strc->unk28);
        s->x = Q_24_8_TO_INT(pos.x) - gCamera.x;
        s->y = Q_24_8_TO_INT(pos.y) - gCamera.y;

        sub_80051E8(s);
    }
}

void sub_80120C0(Player *p)
{
    if (p->moveState & MOVESTATE_10) {
        if (p->unk5C & DPAD_LEFT)
            p->moveState |= MOVESTATE_FACING_LEFT;

        if (p->unk5C & DPAD_RIGHT)
            p->moveState &= ~MOVESTATE_FACING_LEFT;
    }

    sub_80218E4(p);
    p->moveState |= MOVESTATE_IN_AIR;
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20 | MOVESTATE_4);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk64 = 80;

    if (p->moveState & MOVESTATE_FACING_LEFT)
        p->speedAirX -= Q_24_8(2.25);
    else
        p->speedAirX += Q_24_8(2.25);

    p->speedAirY = 0;
    p->rotation = 0;
    p->unk70 = 0;
    p->unk71 = 0;

    m4aSongNumStart(SE_SONIC_MIDAIR_SOMERSAULT);

    p->unk6E = 0;
    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;
    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_80261D8, p);
}

void sub_8012194(Player *p)
{
    s16 unk30054C0 = gUnknown_030054C0.unk4;
    s32 six = Q_24_8(6.0);
    s32 cosVal, sinVal;

    sub_80218E4(p);
    p->moveState |= (MOVESTATE_20000000 | MOVESTATE_BOOST_EFFECT_ON | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->unk64 = 19;

    cosVal = COS_24_8(unk30054C0);
    sinVal = SIN_24_8(unk30054C0);
    p->speedAirX = Q_24_8_TO_INT(cosVal * six);
    p->speedAirY = Q_24_8_TO_INT(sinVal * six) - Q_24_8(0.5);

    p->rotation = 0;
    p->unk70 = 0;
    p->unk71 = 0;
    p->unk6E = 0;
    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;
    p->rotation = 0;
    p->unk72 = GBA_FRAMES_PER_SECOND;

    m4aSongNumStart(SE_SONIC_MIDAIR_SOMERSAULT);

    PLAYERFN_SET_AND_CALL(PlayerCB_80124D0, p);
}

void PlayerCB_801225C(Player *p)
{
    sub_80218E4(p);
    p->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    p->moveState &= ~(MOVESTATE_20000000 | MOVESTATE_1000000 | MOVESTATE_20);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->unk64 = 14;

    p->speedAirX = 0;
    p->speedAirY = -Q_24_8(4.0);
    p->rotation = 0;

    p->unk70 = 1;
    p->unk71 = 0;
    p->unk6E = 0;
    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;
    p->rotation = 0;

    PLAYERFN_SET_AND_CALL(PlayerCB_80261D8, p);
}

// https://decomp.me/scratch/XxzZB
NONMATCH("asm/non_matching/playercb__sub_80122DC.inc", void sub_80122DC(s32 x, s32 y))
{
    s32 playerX = Q_24_8_TO_INT(gPlayer.x - x);
    s32 playerY = Q_24_8_TO_INT(gPlayer.y - y);
    s32 sqPlayerX = playerX * playerX;
    s32 sqPlayerY = playerY * playerY;
    s32 sqDistance = sqPlayerX + sqPlayerY; // c^2 = a^2 + b^2

    if (gPlayer.character == CHARACTER_SONIC) {
        if (sqDistance < gUnknown_030054C0.unk0) {
            if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
                s32 temp = sub_8004418(playerX, playerY);
                u16 value = (temp + -Q_24_8(1.0));
                value &= (1024 - 1);

                if (value < 313) {
                    s32 unk4 = Q_24_8(2.0);
                    unk4 -= value;
                    unk4 &= (1024 - 1);

                    gUnknown_030054C0.unk0 = sqDistance;
                    gUnknown_030054C0.unk4 = unk4;
                }
            } else {
                u16 value = sub_8004418(-playerY, -playerX);
                if (value <= 312) {
                    gUnknown_030054C0.unk0 = sqDistance;
                    gUnknown_030054C0.unk4 = value;
                }
            }
        }
    } else if (gPlayer.character == CHARACTER_CREAM) {
        struct Task *t = gCurTask;

        if (sqDistance < gUnknown_03005498.someDistanceSquared) {
            if (((gPlayer.moveState & MOVESTATE_FACING_LEFT) && (playerX >= 0))
                || ((!(gPlayer.moveState & MOVESTATE_FACING_LEFT)) && (playerX <= 0))) {
                gUnknown_03005498.someDistanceSquared = sqDistance;
                gUnknown_03005498.t = t;
            }

            if (t->unk15) {
                t->unk16 = Q_24_8_TO_INT(x);
                t->unk18 = Q_24_8_TO_INT(y);
            }
        }
    }
}
END_NONMATCH

void PlayerCB_80123D0(Player *p)
{
    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        PLAYERFN_SET(PlayerCB_8025318);
    }

    sub_8027EF0(p);
}

void PlayerCB_80123FC(Player *p)
{
    sub_80283C4(p);

    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        p->unk6A++;

        p->speedAirY = Q_24_8(2.0);
        PLAYERFN_SET(PlayerCB_8011F94);

        if (p->character == CHARACTER_SONIC) {
            sub_8011C98(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y));
        } else if (p->character == CHARACTER_AMY) {
            sub_8015BD4(3);
        }
    }
}

void PlayerCB_8012460(Player *p)
{
    p->speedAirY += Q_24_8(56.0 / 256.0);

    if (p->speedAirY >= 0) {
        p->unk6A++;
        p->unk6C = 1;
        PLAYERFN_SET(PlayerCB_8012498);
    }

    sub_80283C4(p);
}

void PlayerCB_8012498(Player *p)
{
    sub_8027EF0(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->unk6D = 1;
    }
}

void TaskDestructor_80124B8(struct Task *t)
{
    TaskStrc_8011C98 *strc = TaskGetStructPtr(t);
    Sprite *s = &strc->s;
    VramFree(s->graphics.dest);
}

void PlayerCB_80124D0(Player *p)
{
    if (--p->unk72 == -1) {
        p->unk64 = 14;
        p->moveState &= ~MOVESTATE_BOOST_EFFECT_ON;
    }

    sub_8027EF0(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->unk6D = 1;
    }
}

/* Maybe new module here? */

bool32 sub_801251C(Player *p)
{
    if (p->character == CHARACTER_SONIC) {
        if (p->unk71 == 1) {
            sub_80120C0(p);
            return TRUE;
        }
    }

    return FALSE;
}

void sub_8012548(Player *p)
{
    sub_80218E4(p);

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= MOVESTATE_20000000;

    if (ABS(p->speedGroundX) < Q_24_8(0.25)) {
        p->speedGroundX = 0;
        p->unk64 = 15;
    } else {
        p->unk64 = 87;
    }

    PLAYERFN_SET_AND_CALL(PlayerCB_80127F0, p);
}

void sub_80125BC(Player *p)
{
    if (p->w.flyingDurationCream == 0) {
        if (p->unk64 == 85)
            m4aSongNumStop(SE_CREAM_FLYING);

        p->unk64 = 85;
    } else {
        if (((p->unk5C & DPAD_LEFT) && !(p->moveState & MOVESTATE_FACING_LEFT))
            || ((p->unk5C & DPAD_RIGHT) && (p->moveState & MOVESTATE_FACING_LEFT))) {
            p->unk64 = 84;
        } else if (p->unk64 == 84) {
            if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
                p->unk64 = 83;
            }
        } else {
            p->unk64 = 83;
        }

        m4aSongNumStartOrChange(SE_CREAM_FLYING);
    }
}

void sub_8012644(Player *p)
{
    sub_80218E4(p);

    if (p->moveState & MOVESTATE_4) {
        p->moveState &= ~MOVESTATE_4;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
    }

    p->w.flyingDurationCream = CREAM_FLYING_DURATION;
    p->unk61 = 1;
    p->unk5A = 0;
    p->unk58 = 0;
    gPlayer.moveState |= MOVESTATE_10000000;
    PLAYERFN_SET_AND_CALL(PlayerCB_80126B0, p);
}

void PlayerCB_80126B0(Player *p)
{
    if (p->w.flyingDurationCream != 0) {
        p->w.flyingDurationCream--;

        if (p->unk5C & gPlayerControls.attack) {
            p->unk64 = 86;
            p->unk6D = 0x5;

            m4aSongNumStop(SE_CREAM_FLYING);
            return;
        }
    }

    if (p->unk61 != 1) {
        if (p->speedAirY >= -Q_24_8(0.75)) {
            p->speedAirY -= Q_24_8(0.09375);

            if (++p->unk61 == 32) {
                p->unk61 = 1;
            }
        } else {
            p->unk61 = 1;
        }
    } else {
        if ((p->unk5E & gPlayerControls.jump) && (p->speedAirY >= -Q_24_8(0.75))
            && (p->w.flyingDurationCream != 0)) {
            p->unk61 = 2;
        }

        p->speedAirY += Q_24_8(PLAYER_GRAVITY);
    }

    if (p->y < Q_24_8(gCamera.unk28)) {
        p->y = Q_24_8(gCamera.unk28);

        if (p->speedAirY < 0)
            p->speedAirY = 0;
    }

    sub_80125BC(p);

    {
        s16 speed = gUnknown_080D552C[p->unk52];
        if (ABS(p->speedAirX) > speed) {
            if (p->speedAirX > 0)
                p->speedAirX -= p->unk48 * 2;
            else
                p->speedAirX += p->unk48 * 2;
        }
    }

    sub_80282EC(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->unk6D = 1;
    } else if (p->moveState & MOVESTATE_40) {
        p->unk64 = 14;
        p->unk6D = 5;
    }
}

void PlayerCB_80127F0(Player *p)
{
    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->unk64 = 9;
            p->unk6D = 5;
        } else {
            p->unk6D = 1;
        }
    }

    sub_8027EF0(p);
}

void sub_8012830(Player *p)
{
    sub_80218E4(p);

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= MOVESTATE_20000000;

    p->unk64 = 17;

    PLAYERFN_SET_AND_CALL(PlayerCB_8012938, p);
}

void sub_8012888(Player *p)
{
    sub_80218E4(p);

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= (MOVESTATE_20000000 | MOVESTATE_100 | MOVESTATE_IN_AIR);

    p->unk64 = 18;

    PLAYERFN_SET_AND_CALL(PlayerCB_8012978, p);
}

void sub_80128E0(Player *p)
{
    sub_80218E4(p);

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= (MOVESTATE_20000000 | MOVESTATE_100 | MOVESTATE_IN_AIR);

    p->unk64 = 19;

    PLAYERFN_SET_AND_CALL(PlayerCB_80129BC, p);
}

void PlayerCB_8012938(Player *p)
{
    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->unk64 = 50;
            p->unk6D = 5;
        } else {
            p->unk6D = 1;
        }
    }

    sub_8027EF0(p);
}

void PlayerCB_8012978(Player *p)
{
    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        if ((p->unk68 == SA2_ANIM_CHAR(SA2_CHAR_ANIM_INSTA_SHIELD_1, CHARACTER_CREAM))
            && p->unk6A == 0) {
            p->unk6A++;
        }
    }

    sub_8027EF0(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->unk6D = 1;
    }
}

void PlayerCB_80129BC(Player *p)
{
    sub_8027EF0(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->unk6D = 1;
    }
}

struct Task *sub_80129DC(s32 x, s32 y)
{
    struct Task *result;

    if (IS_MULTI_PLAYER) {
        result = NULL;
    } else {
        struct Task *t;
        TaskStrc_801F15C *ts;
        Sprite *s;
        t = sub_801F15C(x, y, 232, gPlayer.unk60, sub_801F214, sub_801F550);
        ts = TaskGetStructPtr(t);
        ts->playerAnim = PlayerCharacterIdleAnims[gPlayer.character];

        // This is += because it's adding to the base Idle character animation
        ts->playerAnim += gUnknown_080D6736[gPlayer.unk64][0];
        ts->playerVariant = gUnknown_080D6736[gPlayer.unk64][1];

        s = &ts->s;

        if (!gPlayer.unk5A) {
            s->graphics.dest = VramMalloc(15);
            s->graphics.anim = SA2_ANIM_TAILS_TAIL_SWIPE;
            s->variant = 0;
        } else {
            s->graphics.dest = VramMalloc(24);
            s->graphics.anim = SA2_ANIM_TAILS_SUPER_TAIL_SWIPE;
            s->variant = 1;
        }

        s->unk1A = 0x200;
        s->unk10 = SPRITE_FLAG_PRIORITY(2);

        result = t;
    }

    return result;
}

void sub_8012AD0(Player *p)
{
    sub_80218E4(p);

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    p->unk64 = 91;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= (MOVESTATE_20000000 | MOVESTATE_100 | MOVESTATE_IN_AIR);

    p->speedAirY = -Q_24_8(4.0);

    if (p->moveState & MOVESTATE_40) {
        p->speedAirY >>= 1;
    }

    m4aSongNumStart(SE_JUMP);

    PLAYERFN_SET_AND_CALL(PlayerCB_8012D1C, p);
}

void sub_8012B44(Player *p)
{
    if (p->flyingDurationTails == 0) {
        p->unk64 = 90;
        m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
    } else {
        if (((p->unk5C & DPAD_LEFT) && !(p->moveState & MOVESTATE_FACING_LEFT))
            || ((p->unk5C & DPAD_RIGHT) && (p->moveState & MOVESTATE_FACING_LEFT))) {
            p->unk64 = 89;
        } else if ((p->unk64 == 89)) {
            if ((p->unk90->s.unk10 & SPRITE_FLAG_MASK_14))
                p->unk64 = 88;
        } else {
            p->unk64 = 88;
        }

        m4aSongNumStartOrChange(SE_TAILS_PROPELLER_FLYING);
    }
}

void sub_8012BC0(Player *p)
{
    sub_80218E4(p);

    if (p->moveState & MOVESTATE_4) {
        p->moveState &= ~MOVESTATE_4;

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);
    }

    p->flyingDurationTails = TAILS_FLYING_DURATION;
    p->unk61 = 1;
    p->unk5A = 0;
    p->unk58 = 0;

    gPlayer.moveState |= MOVESTATE_10000000;
    PLAYERFN_SET_AND_CALL(PlayerCB_8012C2C, p);
}

void PlayerCB_8012C2C(Player *p)
{
    // Only decrease Tails' counter every 2nd frame, giving him 8 seconds of flight.
    // ...why didn't they just set his timer to a bigger value?
    if ((gUnknown_03005590 & 0x1) && (p->flyingDurationTails != 0)) {
        p->flyingDurationTails--;
    }

    if (p->unk61 != 1) {
        if (p->speedAirY >= -Q_24_8(0.75)) {
            p->speedAirY -= Q_24_8(0.09375);

            if (++p->unk61 == 32) {
                p->unk61 = 1;
            }
        } else {
            p->unk61 = 1;
        }
    } else {
        if ((p->unk5E & gPlayerControls.jump) && (p->speedAirY >= -Q_24_8(0.75))
            && (p->flyingDurationTails != 0)) {
            p->unk61 = 2;
        }

        p->speedAirY += Q_24_8(PLAYER_GRAVITY);
    }

    if (p->y < Q_24_8(gCamera.unk28)) {
        p->y = Q_24_8(gCamera.unk28);

        if (p->speedAirY < 0)
            p->speedAirY = 0;
    }

    sub_8012B44(p);

    p->unk40 = Q_24_8(6.0);
    p->unk48 = 0x10;

    sub_80282EC(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->unk6D = 1;
    } else if (p->moveState & MOVESTATE_40) {
        p->unk64 = 14;
        p->unk6D = 5;
    }
}

void PlayerCB_8012D1C(Player *p)
{
    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->unk6D = 1;
    }

    sub_8028204(p);
}

void sub_8012D3C(Player *p)
{
    sub_80218E4(p);

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    p->unk64 = 15;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= MOVESTATE_20000000;

    sub_80129DC(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y));

    m4aSongNumStart(SE_TAILS_TAIL_SWIPE);

    PLAYERFN_SET_AND_CALL(PlayerCB_8012DA4, p);
}

void PlayerCB_8012DA4(Player *p)
{
    s32 halfUnk4C = p->unk4C >> 1;

    s32 speed = p->speedGroundX;
    if (speed > 0) {
        if ((speed -= halfUnk4C) < 0)
            speed = 0;
    } else {
        if ((speed += halfUnk4C) > 0)
            speed = 0;
    }
    p->speedGroundX = speed;

    sub_8029C84(p);

    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        PLAYERFN_SET(PlayerCB_8025318);
    }

    sub_8027EF0(p);
}

struct Task *sub_8012DF8(s32 x, s32 y, u16 p2)
{
    struct Task *result;

    if (IS_MULTI_PLAYER) {
        result = NULL;
    } else {
        TaskStrc_801F15C *ts;
        Sprite *s;
        struct Task *t;
        t = sub_801F15C(x, y, 232, gPlayer.unk60, sub_801F214, sub_801F550);
        ts = TaskGetStructPtr(t);

        ts->playerAnim = gUnknown_080D6736[gPlayer.unk64][0];
        ts->playerVariant = gUnknown_080D6736[gPlayer.unk64][1];

        if (gPlayer.unk64 < 80) {
            ts->playerAnim += PlayerCharacterIdleAnims[gPlayer.character];
        }

        s = &ts->s;

        s->graphics.dest = VramMalloc(sKnucklesAnimData_FX[p2][0]);
        s->graphics.anim = sKnucklesAnimData_FX[p2][1];
        s->variant = sKnucklesAnimData_FX[p2][2];

        s->unk1A = 0x200;
        s->unk10 = SPRITE_FLAG_PRIORITY(2);

        result = t;
    }

    return result;
}

void sub_8012EEC(Player *p)
{
    sub_80218E4(p);

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    p->unk64 = 15;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= MOVESTATE_20000000;

    if (ABS(p->speedGroundX) < Q_24_8(3.0)) {
        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->speedGroundX = -Q_24_8(3.0);
        } else {
            p->speedGroundX = +Q_24_8(3.0);
        }
    }

    PLAYERFN_SET_AND_CALL(PlayerCB_8012F6C, p);
}

void PlayerCB_8012F6C(Player *p)
{
    s32 speed = p->speedGroundX;
    if (speed > 0) {
        if ((speed -= Q_24_8(0.375)) < 0)
            speed = 0;

        p->speedGroundX = speed;
    } else if (speed < 0) {
        if ((speed += Q_24_8(0.375)) > 0)
            speed = 0;

        p->speedGroundX = speed;
    }

    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->unk64 = 50;
            p->unk6D = 5;
        } else {
            p->unk6A++;
            p->unk6C = 1;

            if (ABS(p->speedGroundX) < Q_24_8(3.0)) {
                if (p->moveState & MOVESTATE_FACING_LEFT) {
                    p->speedGroundX = -Q_24_8(3.0);
                } else {
                    p->speedGroundX = +Q_24_8(3.0);
                }
            }

            PLAYERFN_SET(PlayerCB_8013010);
        }
    }

    sub_8027EF0(p);
}

void PlayerCB_8013010(Player *p)
{
    s32 speed = p->speedGroundX;
    if (speed > 0) {
        if ((speed -= Q_24_8(0.375)) < 0)
            speed = 0;

        p->speedGroundX = speed;
    } else if (speed < 0) {
        if ((speed += Q_24_8(0.375)) > 0)
            speed = 0;

        p->speedGroundX = speed;
    }

    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->unk64 = 50;
            p->unk6D = 5;
        } else {
            p->unk6D = 1;
        }
    }

    sub_8027EF0(p);
}

void sub_8013070(Player *p)
{
    sub_80218E4(p);

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    p->unk64 = 17;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

    p->moveState |= MOVESTATE_20000000;

    sub_8012DF8(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y), 0);

    p->unk72 = 32;

    m4aSongNumStart(SE_225);

    PLAYERFN_SET_AND_CALL(PlayerCB_80130E4, p);
}

void PlayerCB_80130E4(Player *p)
{
    s32 speed = p->speedGroundX;
    s32 addend = p->unk4C >> 1;
    if (speed > 0) {
        if ((speed -= addend) < 0)
            speed = 0;

        p->speedGroundX = speed;
    } else if (speed < 0) {
        if ((speed += addend) > 0)
            speed = 0;

        p->speedGroundX = speed;
    }

    sub_8029C84(p);

    if (--p->unk72 == -1) {
        p->unk6A++;
        p->unk6C = 1;
        PLAYERFN_SET(PlayerCB_8013B6C);
    }

    sub_8027EF0(p);
}

void sub_8013150(Player *p)
{
    s8 xOffset = p->w.tf.shift;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_FACING_LEFT;

    if (!(xOffset & 0x7F)) {
        p->unk64 = 0x5C;

        if ((u8)xOffset == 0x80) {
            p->moveState |= MOVESTATE_FACING_LEFT;
        }
    } else {
        if (xOffset < 0) {
            xOffset = -xOffset;
        }
        p->unk64 = gUnknown_080D5538[(xOffset & 0x7F) >> 5];
    }
}

void sub_80131B4(Player *p)
{
    type8029A28 result;
    u8 someFlags;
    sub_8022838(p);

    someFlags = p->w.tf.flags;

    if (!(someFlags & MOVESTATE_IN_AIR)) {
        u8 temp;
        if (p->speedAirX <= 0) {
            p->moveState |= MOVESTATE_FACING_LEFT;
        } else {
            p->moveState &= ~MOVESTATE_FACING_LEFT;
        }

        temp = -((p->rotation + Q_24_8(0.125)) & -Q_24_8(0.25));
        if (temp != 0) {
            s8 shift = p->w.tf.shift + Q_24_8(0.25);
            if (shift <= 0) {
                p->moveState |= MOVESTATE_FACING_LEFT;
            } else {
                p->moveState &= ~MOVESTATE_FACING_LEFT;
            }

            p->speedAirY = 0;

            sub_8022318(p);

            p->unk6D = 1;
        } else {
            PLAYERFN_SET(PlayerCB_8013C18);
            p->unk64 = 95;
            m4aSongNumStart(SE_SONIC_SKID_ATTACK);
        }
    } else {
        u32 temp = 0x20;
        temp &= someFlags;
        if (temp) {
            type8029A28 sp08;

            if (p->w.tf.unkAE >= 0) {
                s8 temp = p->w.tf.shift + Q_24_8(0.25);
                if (temp <= 0) {
                    p->moveState |= MOVESTATE_FACING_LEFT;
                    result = sub_8029A28(p, NULL, &sp08);

                    if (result != sp08) {
                        PLAYERFN_SET(PlayerCB_8013BD4);
                        p->unk64 = 93;
                        p->unk16 = 6;
                        p->unk17 = 14;
                        p->w.tf.flags |= MOVESTATE_IN_AIR;
                        return;
                    }

                    if (result != 0) {
                        u16 gravInv = GRAVITY_IS_INVERTED;
                        if (gravInv) {
                            s32 playerBottomX;
                            s32 playerBottomY = Q_24_8_TO_INT(p->y);
                            playerBottomY -= 1;
                            playerBottomY -= p->unk17;

                            playerBottomX = Q_24_8_TO_INT(p->x);
                            playerBottomX -= 1;
                            playerBottomX -= p->unk16;

                            if (sub_801E4E4(playerBottomY, playerBottomX, p->unk38, -8,
                                            NULL, sub_801EE64)
                                < 0) {
                                PLAYERFN_SET(PlayerCB_8013BD4);
                                p->unk64 = 93;
                                p->unk16 = 6;
                                p->unk17 = 14;
                                p->w.tf.flags |= MOVESTATE_IN_AIR;
                                return;
                            }
                        } else {
                            s32 playerBottomX;
                            s32 playerBottomY = Q_24_8_TO_INT(p->y);
                            playerBottomY += 1;
                            playerBottomY += p->unk17;

                            playerBottomX = Q_24_8_TO_INT(p->x);
                            playerBottomX -= 1;
                            playerBottomX -= p->unk16;

                            if (sub_801E4E4(playerBottomY, playerBottomX, p->unk38, +8,
                                            NULL, sub_801EE64)
                                < 0) {

                                PLAYERFN_SET(PlayerCB_8013BD4);
                                p->unk64 = 93;
                                p->unk16 = 6;
                                p->unk17 = 14;
                                p->w.tf.flags |= MOVESTATE_IN_AIR;
                                return;
                            }
                        }

                        p->x -= Q_24_8(result);
                    }
                } else {
                    p->moveState &= ~MOVESTATE_FACING_LEFT;

                    result = sub_8029A74(p, 0, &sp08);
                    if (result != sp08) {
                        PLAYERFN_SET(PlayerCB_8013BD4);
                        p->unk64 = 93;
                        p->unk16 = 6;
                        p->unk17 = 14;
                        p->w.tf.flags |= MOVESTATE_IN_AIR;
                        return;
                    } else if (result != 0) {
                        if (!GRAVITY_IS_INVERTED) {
                            s32 playerBottomX;
                            s32 playerBottomY = Q_24_8_TO_INT(p->y);
                            playerBottomY += 1;
                            playerBottomY += p->unk17;

                            playerBottomX = Q_24_8_TO_INT(p->x);
                            playerBottomX += 1;
                            playerBottomX += p->unk16;

                            if (sub_801E4E4(playerBottomY, // fmt
                                            playerBottomX, p->unk38, +8, NULL,
                                            sub_801EE64)
                                < 0) {
                                PLAYERFN_SET(PlayerCB_8013BD4);
                                p->unk64 = 93;
                                p->unk16 = 6;
                                p->unk17 = 14;
                                p->w.tf.flags |= MOVESTATE_IN_AIR;
                                return;
                            }
                        }
                        p->x += Q_24_8(result);
                    }
                }

                p->speedGroundX = 0;
                p->speedAirX = 0;
                p->speedAirY = 0;

                PLAYERFN_SET(PlayerCB_8013C34);

                p->w.tf.shift = 3;

                p->unk64 = 100;
                p->moveState |= MOVESTATE_10000000;

                PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 10);

                return;
            }

            PLAYERFN_SET(PlayerCB_8013BD4);
            p->unk64 = 93;
            p->unk16 = 6;
            p->unk17 = 14;
            p->w.tf.flags |= MOVESTATE_IN_AIR;
        } else {

            if (!(p->unk5C & gPlayerControls.jump) || (p->moveState & MOVESTATE_40)) {
                PLAYERFN_SET(PlayerCB_8013BD4);
                p->unk64 = 93;

                if (p->speedAirX <= 0) {
                    p->moveState |= MOVESTATE_FACING_LEFT;
                } else {
                    p->moveState &= ~MOVESTATE_FACING_LEFT;
                }

                p->speedAirX >>= 2;
                p->unk16 = 6;
                p->unk17 = 14;
            } else {
                sub_8013150(p);
            }
        }
    }
}

void sub_8013498(Player *p)
{
    u8 someFlags;

    sub_8023610(p);
    PlayerFn_Cmd_UpdateAirFallSpeed(p);
    sub_8022838(p);

    if (!(p->w.tf.flags & 0x2)) {
        p->speedGroundX = 0;
        p->speedAirX = 0;
        p->speedAirY = 0;

        p->unk16 = 6;
        p->unk17 = 14;

        sub_8022318(p);

        if ((p->rotation + Q_24_8(0.125)) & Q_24_8(0.75)) {
            p->unk6D = 1;
        } else {
            p->unk2A = 15;
            p->unk64 = 94;
            PLAYERFN_SET(PlayerCB_8013BF0);
        }
    }
}

void sub_801350C(Player *p)
{
    u8 rot;
    s32 p2;
    s32 res;

    if ((gUnknown_03005590 & 0x3) == 0) {
        s32 offsetY = p->unk17;

        if (GRAVITY_IS_INVERTED)
            offsetY = -offsetY;

        sub_801F5CC(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y) + offsetY);
    }

    sub_8022838(p);

    res = sub_8029B88(p, &rot, &p2);

    if (res < 12) {
        if (GRAVITY_IS_INVERTED) {
            res = -res;
        }

        p->y += Q_24_8(res);
        p->rotation = rot;
    } else if (!(p->moveState & MOVESTATE_8)) {
        PLAYERFN_SET(PlayerCB_8013BD4);

        PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

        p->w.tf.flags |= 0x2;
    }
}

void sub_80135BC(Player *p)
{
    if (p->unk5C & gPlayerControls.jump) {
        if (p->speedAirX <= 0) {
            p->speedAirX += Q_24_8(0.09375);

            if (p->speedAirX < 0) {
                sub_801350C(p);
                return;
            }
        } else {
            p->speedAirX -= Q_24_8(0.09375);

            if (p->speedAirX > 0) {
                sub_801350C(p);
                return;
            }
        }
    }

    p->speedGroundX = 0;
    p->speedAirX = 0;
    p->speedAirY = 0;

    {
        s32 offsetY;
        offsetY = p->unk17 - 14;

        if (GRAVITY_IS_INVERTED)
            offsetY = -offsetY;

        p->y += Q_24_8(offsetY);
    }

    sub_8022318(p);

    p->unk2A = 15;
    p->unk6D = 1;
}

s32 sub_8013644(Player *p)
{
    s32 result;
    u8 rot;

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        s32 pX;
        s32 pY;

        pX = Q_24_8_TO_INT(p->x);
        pX -= 2;
        pX -= p->unk16;

        pY = Q_24_8_TO_INT(p->y);

        result = sub_801E4E4(pX, pY, p->unk38, -8, &rot, sub_801ED24);

        if (rot & 0x1) {
            p->rotation = Q_24_8(0.25);
        } else {
            p->rotation = rot;
        }
    } else {
        s32 pX;
        s32 pY;
        pX = Q_24_8_TO_INT(p->x);
        pX += 2;
        pX += p->unk16;

        pY = Q_24_8_TO_INT(p->y);

        result = sub_801E4E4(pX, pY, p->unk38, +8, &rot, sub_801ED24);

        if (!(rot & 0x1)) {
            p->rotation = rot;
        } else {
            p->rotation = Q_24_8(0.75);
        }
    }

    return result;
}

void sub_80136E8(Player *p)
{
    u8 rot;
    s32 r2;

    if (p->w.tf.unkAE >= 0) {
        if (p->moveState & MOVESTATE_8) {
            sub_8013CA0(p);
            return;
        }

        p->speedGroundX = 0;
        p->speedAirX = 0;
        p->speedAirY = 0;

        if (p->unk64 != 100) {
            p->unk64 = 101;
        }

        if (p->unk5C & DPAD_UP) {
            s32 offsetY = Q_24_8(p->unk17);

            if (GRAVITY_IS_INVERTED) {
                offsetY = -offsetY;
            }

            p->y -= offsetY;
            r2 = sub_8013644(p);
            p->y += offsetY;

            if (r2 > 2) {
                sub_8013C50(p);
                return;
            } else if (r2 > 0) {
#ifdef BUGFIX
                rot = 0;
#endif
                // BUG: rot is not initialised
                p->rotation = rot;

                p->speedGroundX = 0;
                p->speedAirX = 0;
                p->speedAirY = 0;

                sub_8022318(p);
                PLAYERFN_SET(PlayerCB_8013BD4);

                p->unk64 = 93;
                return;
            } else if (r2 < 0) {
                sub_801394C(p);
                return;
            } else {
                s32 offsetY = Q_24_8(9.0);
                if (GRAVITY_IS_INVERTED) {
                    offsetY = -offsetY;
                }

                p->y -= offsetY;
                r2 = sub_8029AC0(p, &rot, NULL);
                p->y += offsetY;

                if (r2 < 0) {
                    p->unk64 = 0x66;
                    p->y -= Q_24_8(r2);
                } else {
                    s32 speed;
                    p->unk64 = 0x66;
                    speed = Q_24_8(0.75);
                    if (p->moveState & 0x40) {
                        speed = Q_24_8(0.5);
                    }
                    p->speedAirY = -speed;
                }
            }
        } else if (p->unk5C & DPAD_DOWN) {
            s32 speed;
            s32 offsetY = Q_24_8(p->unk17);
            if (GRAVITY_IS_INVERTED) {
                offsetY = -offsetY;
            }

            p->y += offsetY;
            r2 = sub_8013644(p);
            p->y -= offsetY;

            if (r2 > 0) {
                sub_8013CA0(p);
                return;
            }

            if (GRAVITY_IS_INVERTED) {
                r2 = sub_8029AC0(p, &rot, NULL);
            } else {
                r2 = sub_8029B0C(p, &rot, NULL);
            }

            if (r2 < 0) {
                if (GRAVITY_IS_INVERTED) {
                    p->y -= Q_24_8(r2);
                } else {
                    p->y += Q_24_8(r2);
                }

                p->rotation = rot;

                p->speedGroundX = 0;
                p->speedAirX = 0;
                p->speedAirY = 0;

                sub_8022318(p);
                PLAYERFN_SET(PlayerCB_8013BD4);
                p->unk64 = 93;
                return;
            } else {
                p->unk64 = 103;
                speed = Q_24_8(0.75);
                if (p->moveState & MOVESTATE_40) {
                    speed = Q_24_8(0.5);
                }
                p->speedAirY = speed;
            }
        } else {
            r2 = sub_8013644(p);
            if (r2 > 0) {
                sub_8013CA0(p);
                return;
            }
        }

        r2 = 1;
        if (!(p->unk5C & (DPAD_DOWN | DPAD_UP))) {
            r2 = sub_8029B0C(p, &rot, NULL);
            if (r2 < 0) {
                p->y += Q_24_8(r2);
                p->rotation = rot;

                p->speedGroundX = 0;
                p->speedAirX = 0;
                p->speedAirY = 0;

                sub_8022318(p);

                p->unk64 = 93;
                return;
            }
        }

        if (r2 != 0 && --p->w.tf.shift == 0) {
            p->w.tf.shift = 3;
        }

        sub_801394C(p);
    } else {
        sub_8013CA0(p);
    }
}

void sub_801394C(Player *p)
{
    if (p->unk5E & gPlayerControls.jump) {
        p->speedAirY = -Q_24_8(2.625);
        p->speedAirX = +Q_24_8(3.0);
        p->moveState ^= MOVESTATE_FACING_LEFT;

        if (p->moveState & MOVESTATE_FACING_LEFT)
            p->speedAirX = -p->speedAirX;

        p->moveState |= MOVESTATE_4;
        p->moveState |= MOVESTATE_IN_AIR;
        p->moveState |= MOVESTATE_100;

        p->unk16 = 6;
        p->unk17 = 9;
        p->unk64 = 50;
        p->unk6D = 4;
    }
}

// https://decomp.me/scratch/8fUWD
NONMATCH("asm/non_matching/playercb__sub_80139B0.inc", void sub_80139B0(Player *p))
{
    s32 speedGrnd = ABS(p->speedGroundX);
    s8 r2 = p->w.tf.shift;
    u8 shift;

    if (speedGrnd < Q_24_8(3.0)) {
        speedGrnd += Q_24_8(6.0 / 256.0);
    } else if (speedGrnd < Q_24_8(15.0)) {
        if ((r2 & 0x7F) == 0)
            speedGrnd += Q_24_8(3.0 / 256.0);
    }

    if (p->moveState & MOVESTATE_40) {
        if ((speedGrnd > Q_24_8(3.0))
            && (speedGrnd -= Q_24_8(9.0 / 256.0)) < Q_24_8(3.0))
            speedGrnd = Q_24_8(3.0);
    }

    shift = p->w.tf.shift + Q_24_8(0.25);
    if (shift <= 0) {
        p->speedGroundX = -speedGrnd;
    } else {
        p->speedGroundX = +speedGrnd;
    }

    if (p->unk5C & DPAD_LEFT) {
        if (((u8)r2 != 0x80)) {
            shift = ABS(r2) + Q_8_8(2.0);
        }
    } else if (p->unk5C & DPAD_RIGHT) {
        if ((r2 != 0)) {
            shift = ABS(r2) + Q_8_8(2.0);
        }
    } else {
        if (r2 & 0x7F) {
            shift = r2 + 2;
        }
    }

    p->w.tf.shift = shift;

    {
        s32 speedX = Q_24_8_TO_INT(COS_24_8(shift) * speedGrnd);
        p->speedAirX = speedX;
    }
    {
        s32 speedY = p->speedAirY;

        if (speedY < Q_24_8(0.5)) {
            speedY += Q_24_8(0.09375);
        } else {
            speedY -= Q_24_8(0.09375);
        }
        p->speedAirY = speedY;
    }

    if (gCamera.unk4C > 0) {
        gCamera.unk4C -= 2;
    } else if (gCamera.unk4C < 0) {
        gCamera.unk4C += 4;
    }
}
END_NONMATCH

void sub_8013AD8(Player *p)
{
    p->moveState &= ~MOVESTATE_4;
    p->unk16 = 6;
    p->unk17 = 6;

    p->speedAirY += Q_24_8(1.5);

    if (p->speedAirY < 0)
        p->speedAirY = 0;

    p->speedGroundX = Q_24_8(3.0);

    if (p->moveState & MOVESTATE_40)
        p->speedGroundX /= 2;

    if (p->moveState & MOVESTATE_FACING_LEFT) {
        p->speedGroundX = -p->speedGroundX;
        p->speedAirX = p->speedGroundX;
        p->w.tf.shift = 0x80;
    } else {
        p->speedAirX = p->speedGroundX;
        p->w.tf.shift = 0;
    }

    p->rotation = 0;

    {
        u8 *tFlags = &p->w.tf.flags;
        *tFlags = 0;
        p->unk5A = FALSE;
        *tFlags |= 0x2;
    }

    PLAYERFN_SET_AND_CALL(PlayerCB_8013BB4, p);
}

void PlayerCB_8013B6C(Player *p)
{
    sub_8029C84(p);

    if ((p->unk90->s.unk10) & SPRITE_FLAG_MASK_14) {
        if (p->moveState & MOVESTATE_IN_AIR) {
            p->unk64 = 50;
            p->unk6D = 5;
        } else {
            p->unk6D = 1;
        }
    }

    sub_8027EF0(p);
}

void PlayerCB_8013BB4(Player *p)
{
    sub_80139B0(p);
    sub_80232D0(p);
    PlayerFn_Cmd_UpdatePosition(p);
    sub_80131B4(p);
}

void PlayerCB_8013BD4(Player *p)
{
    sub_80232D0(p);
    PlayerFn_Cmd_UpdatePosition(p);
    sub_8013498(p);
}

void PlayerCB_8013BF0(Player *p)
{
    if ((p->unk90->s.unk10) & SPRITE_FLAG_MASK_14) {
        p->unk6D = 1;
    }

    sub_8027EF0(p);
}

void PlayerCB_8013C18(Player *p)
{
    sub_80135BC(p);
    sub_80232D0(p);
    PlayerFn_Cmd_UpdatePosition(p);
}

void PlayerCB_8013C34(Player *p)
{
    sub_80136E8(p);
    sub_80232D0(p);
    PlayerFn_Cmd_UpdatePosition(p);
}

void PlayerCB_8013E64(Player *p);

void sub_8013C50(Player *p)
{
    p->unk64 = 104;

    if (GRAVITY_IS_INVERTED) {
        p->y += Q_24_8(p->unk17);
    } else {
        p->y -= Q_24_8(p->unk17);
    }

    PLAYERFN_SET(PlayerCB_8013E64);

    p->w.tf.shift = 0;
}

void sub_8013CA0(Player *p)
{
    PLAYERFN_SET(PlayerCB_8013BD4);

    p->unk16 = 6;
    p->unk17 = 14;

    p->unk64 = 93;
}

// PlayerSomething_CeilGroundSpeed
void sub_8013CC0(Player *p)
{
    s32 speedGrnd = ABS(p->speedGroundX);

    if (speedGrnd < Q_24_8(3.0)) {
        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->speedGroundX = -Q_24_8(3.0);
        } else {
            p->speedGroundX = +Q_24_8(3.0);
        }
    }
}

// Identical to sub_8013EE0
void sub_8013CF4(Player *p)
{
    s32 speedGrnd = p->speedGroundX;

    if (speedGrnd > 0) {
        if ((speedGrnd - Q_24_8(0.375)) < 0) {
            speedGrnd = 0;
        } else {
            speedGrnd -= Q_24_8(0.375);
        }

        p->speedGroundX = speedGrnd;
    } else if (speedGrnd < 0) {
        if ((speedGrnd + Q_24_8(0.375)) > 0) {
            speedGrnd = 0;
        } else {
            speedGrnd += Q_24_8(0.375);
        }

        p->speedGroundX = speedGrnd;
    }
}

void PlayerCB_8013DA8(Player *p);

void PlayerCB_8013D18(Player *p)
{
    sub_80218E4(p);

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= (MOVESTATE_20000000 | MOVESTATE_100);

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    p->unk64 = 106;

    p->speedAirX = 0;
    p->speedAirY = 0;

    m4aSongNumStart(SE_226);

    PLAYERFN_SET_AND_CALL(PlayerCB_8013DA8, p);
}

void sub_8013D7C(Player *p)
{
    PLAYERFN_SET(PlayerCB_8013BD4);
    p->unk64 = 93;
    p->unk16 = 6;
    p->unk17 = 14;
    p->w.tf.flags |= 0x2;
}

void PlayerCB_8013DFC(Player *p);

void PlayerCB_8013DA8(Player *p)
{
    sub_80283C4(p);

    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        p->unk64 = 107;
        p->speedAirX = Q_24_8(0.0);
        p->speedAirY = Q_24_8(1.0);

        sub_8012DF8(Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y), 1);

        PLAYERFN_SET_AND_CALL(PlayerCB_8013DFC, p);
    }
}

void PlayerCB_8013E34(Player *p);

void PlayerCB_8013DFC(Player *p)
{
    p->speedAirY += Q_24_8(42.0 / 256.0);

    sub_80283C4(p);

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        PLAYERFN_SET(PlayerCB_8013E34);

        p->unk64 = 108;
        p->speedAirY = 0;
    }
}

void PlayerCB_8013E34(Player *p)
{
    sub_8027EF0(p);

    p->speedGroundX = 0;
    p->speedAirX = 0;
    p->speedAirY = 0;

    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        p->unk6D = 1;
    }
}

void PlayerCB_8013E64(Player *p)
{
    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        p->rotation = 0;

        if (GRAVITY_IS_INVERTED) {
            p->y += Q_24_8(p->unk17);
        } else {
            p->y -= Q_24_8(p->unk17);
        }

        if (p->moveState & MOVESTATE_FACING_LEFT) {
            p->x -= Q_24_8(16.0);
        } else {
            p->x += Q_24_8(16.0);
        }

        PLAYERFN_CALL(PlayerCB_8025318, p);
    } else {
        sub_80232D0(p);
        PlayerFn_Cmd_UpdatePosition(p);
    }
}

// Identical to sub_8013CF4
void sub_8013EE0(Player *p)
{
    s32 speedGrnd = p->speedGroundX;

    if (speedGrnd > 0) {
        if ((speedGrnd - Q_24_8(0.375)) < 0) {
            speedGrnd = 0;
        } else {
            speedGrnd -= Q_24_8(0.375);
        }

        p->speedGroundX = speedGrnd;
    } else if (speedGrnd < 0) {
        if ((speedGrnd + Q_24_8(0.375)) > 0) {
            speedGrnd = 0;
        } else {
            speedGrnd += Q_24_8(0.375);
        }

        p->speedGroundX = speedGrnd;
    }
}

void PlayerCB_8013F60(Player *p);

void sub_8013F04(Player *p)
{
    sub_80218E4(p);

    p->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    p->unk64 = 15;

    PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14);

    p->moveState |= MOVESTATE_20000000;

    sub_8015BD4(0);

    PLAYERFN_SET_AND_CALL(PlayerCB_8013F60, p);
}

void PlayerCB_8013F60(Player *p)
{
    s32 speed = p->speedGroundX;
    if (speed > 0) {
        if ((speed -= Q_24_8(0.375)) < 0)
            speed = 0;

        p->speedGroundX = speed;
    } else if (speed < 0) {
        if ((speed += Q_24_8(0.375)) > 0)
            speed = 0;

        p->speedGroundX = speed;
    }

    if (p->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        PLAYERFN_SET(PlayerCB_8025318);
    }

    sub_8027EF0(p);
}
