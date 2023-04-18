#include "global.h"
#include "trig.h"
#include "lib/m4a.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/player_callbacks_1.h"
#include "game/playercb_cmds.h"
#include "game/parameters/characters.h"

#include "constants/animations.h"
#include "constants/move_states.h"
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
void PlayerCB_8012DA4(Player *player);
void PlayerCB_80123FC(Player *);
void PlayerCB_8012460(Player *);
void PlayerCB_8012498(Player *player);
void TaskDestructor_80124B8(struct Task *);
void PlayerCB_80124D0(Player *player);
void PlayerCB_80126B0(Player *player);
void PlayerCB_80127F0(Player *player);
void PlayerCB_8012938(Player *player);
void PlayerCB_8012978(Player *player);
void PlayerCB_80129BC(Player *player);
void PlayerCB_8012C2C(Player *player);
void PlayerCB_8012D1C(Player *player);
void PlayerCB_8012F6C(Player *player);
void PlayerCB_8013010(Player *player);
void PlayerCB_80130E4(Player *player);
s32 sub_8013644(Player *player);
void sub_801394C(Player *player);
void PlayerCB_8013B6C(Player *player);
void PlayerCB_8013BB4(Player *player);
void PlayerCB_8013BD4(Player *player);
void PlayerCB_8013BF0(Player *player);
void PlayerCB_8013C18(Player *player);
void PlayerCB_8013C34(Player *player);
void sub_8013C50(Player *player);
void sub_8013CA0(Player *player);

void sub_8015BD4(u16);

void sub_801F214(void);
void sub_801F550(struct Task *);
void sub_801F5CC(s32, s32);

void sub_8022318(Player *player);
void sub_8022838(Player *player);
void sub_80232D0(Player *player);

void sub_8023610(Player *player);
void sub_8029D64(Player *player);
void sub_8029DC8(Player *player);

extern void PlayerCB_8025318(Player *player);
extern void PlayerCB_80261D8(Player *player);
extern void sub_8027EF0(Player *player);
extern void sub_8028204(Player *player);
extern void sub_80282EC(Player *player);
extern void sub_80283C4(Player *player);
extern void sub_8029C84(Player *player);
extern void sub_8029FA4(Player *player);

extern u16 gUnknown_080D6736[115][2];

static const s16 gUnknown_080D552C[6]
    = { Q_24_8(2.0), Q_24_8(4.0), Q_24_8(6.0), Q_24_8(8.0), Q_24_8(10.0), 0 };

// static
const s8 gUnknown_080D5538[4] = { 0x60, 0x61, 0x62, 0x63 };

// static
const u16 gUnknown_080D553C[2][3] = {
    { 30, 0x121, 2 },
    { 25, 0x144, 3 },
};

// For Sonic's Down-Trick "Bound"
struct Task *sub_8011C98(s32 x, s32 y)
{
    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
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

void sub_8011D48(Player *player)
{
    sub_80218E4(player);

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    sub_8023B5C(player, 9);
    player->unk16 = 6;
    player->unk17 = 9;
    player->moveState |= MOVESTATE_20000000;

    if (player->unk5A == FALSE) {
        if (player->moveState & MOVESTATE_FACING_LEFT) {
            player->speedGroundX = -Q_24_8(3.0);
        } else {
            player->speedGroundX = +Q_24_8(3.0);
        }

        player->unk64 = 15;
    } else {
        player->unk64 = 17;
    }

    m4aSongNumStart(SE_TAILS_TAIL_SWIPE);

    gPlayer.callback = PlayerCB_8011DCC;
    PlayerCB_8011DCC(player);
}

void PlayerCB_8011DCC(Player *player)
{
    s32 grndSpeed = player->speedGroundX;
    if (grndSpeed > 0) {
        player->speedGroundX = ((grndSpeed - 8) > 0) ? (grndSpeed - 8) : 0;
    } else if (grndSpeed < 0) {
        if ((grndSpeed + 8) <= 0)
            player->speedGroundX = (grndSpeed + 8);
        else
            player->speedGroundX = 0;
    }

    sub_8029C84(player);

    if (player->unk90->s.unk10 & MOVESTATE_4000) {
        if (player->moveState & MOVESTATE_IN_AIR) {
            player->unk64 = 50;
            player->unk6D = 5;
        } else {
            player->unk6A = 1;
            player->unk6C = 1;

            gPlayer.callback = PlayerCB_8011E88;

            if (!player->unk5A) {
                if (player->moveState & MOVESTATE_FACING_LEFT) {
                    player->speedGroundX = -Q_24_8(4.0);
                } else {
                    player->speedGroundX = +Q_24_8(4.0);
                }
            } else {
                sub_8011B88(Q_24_8_TO_INT(player->x), Q_24_8_TO_INT(player->y), 0);
            }

            player->unk72 = 32;
            m4aSongNumStart(SE_SONIC_SKID_ATTACK);
        }
    }

    sub_8027EF0(player);
}

void PlayerCB_8011E88(Player *player)
{
    s32 grndSpeed = player->speedGroundX;
    if (grndSpeed > 0) {
        player->speedGroundX
            = ((grndSpeed - Q_24_8(0.125)) > 0) ? (grndSpeed - Q_24_8(0.125)) : 0;
    } else if (grndSpeed < 0) {
        if ((grndSpeed + Q_24_8(0.125)) <= 0)
            player->speedGroundX = (grndSpeed + Q_24_8(0.125));
        else
            player->speedGroundX = 0;
    }

    sub_8029C84(player);

    if (--player->unk72 == -1) {
        if (player->moveState & MOVESTATE_IN_AIR) {
            player->unk64 = 50;
            player->unk6D = 5;
        } else {
            player->unk6A = 2;
            player->unk6C = 1;

            gPlayer.callback = PlayerCB_80123D0;
        }
    }
    // _08011EF6
    sub_8027EF0(player);

    if (!(player->moveState & MOVESTATE_IN_AIR)) {
        sub_8029FA4(player);
    }
}

// Seems to initialize the "Stop'n' Slam" moves (Trickmove-Down)
// for Sonic (Bound) & Amy (Mid-Air Hammer Swirl)
void PlayerCB_8011F1C(Player *player)
{
    sub_80218E4(player);
    sub_8023B5C(player, 9);
    player->unk16 = 6;
    player->unk17 = 9;

    player->moveState |= MOVESTATE_20000000;

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    player->unk5A = FALSE;
    player->unk64 = 36;

    if (player->character == CHARACTER_AMY) {
        m4aSongNumStart(SE_AMY_HAMMER_SWIRL);
    }

    player->speedAirX = 0;
    player->speedAirY = 0;

    gPlayer.callback = PlayerCB_80123FC;
    PlayerCB_80123FC(player);
}

void PlayerCB_8011F94(Player *player)
{
    player->speedAirY += TRICK__STOP_N_SLAM__DROP_SPEED;

    sub_80283C4(player);

    if ((player->moveState & (MOVESTATE_4000 | MOVESTATE_IN_AIR)) != MOVESTATE_IN_AIR) {
        s32 yVal;
        s32 rot;
        s32 sinValue;
        s32 negSix = -Q_24_8(6.0);

        // Matching
        u8 *rotPtr = &player->rotation;
        rotPtr++;
        rotPtr--;

        sinValue = SIN_24_8(rot = player->rotation * 4);
        player->speedAirX = -Q_24_8_TO_INT(negSix * sinValue);
        yVal = Q_24_8_TO_INT(negSix * (COS_24_8((rot))));

        player->speedAirY = -ABS(yVal);

        player->speedAirX = player->speedAirX >> 1;

        gPlayer.callback = PlayerCB_8012460;
        player->moveState |= MOVESTATE_IN_AIR;

        if (player->character == CHARACTER_SONIC) {
            m4aSongNumStart(SE_SONIC_BOUND_IMPACT);
        }

        player->unk64 = -1;
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

void sub_80120C0(Player *player)
{
    if (player->moveState & MOVESTATE_10) {
        if (player->unk5C & DPAD_LEFT)
            player->moveState |= MOVESTATE_FACING_LEFT;

        if (player->unk5C & DPAD_RIGHT)
            player->moveState &= ~MOVESTATE_FACING_LEFT;
    }

    sub_80218E4(player);
    player->moveState |= MOVESTATE_IN_AIR;
    player->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20 | MOVESTATE_4);

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->unk64 = 80;

    if (player->moveState & MOVESTATE_FACING_LEFT)
        player->speedAirX -= Q_24_8(2.25);
    else
        player->speedAirX += Q_24_8(2.25);

    player->speedAirY = 0;
    player->rotation = 0;
    player->unk70 = 0;
    player->unk71 = 0;

    m4aSongNumStart(SE_SONIC_MIDAIR_SOMERSAULT);

    player->unk6E = 0;
    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;
    player->rotation = 0;

    gPlayer.callback = PlayerCB_80261D8;
    PlayerCB_80261D8(player);
}

void sub_8012194(Player *player)
{
    s16 unk30054C0 = gUnknown_030054C0.unk4;
    s32 six = Q_24_8(6.0);
    s32 cosVal, sinVal;

    sub_80218E4(player);
    player->moveState
        |= (MOVESTATE_20000000 | MOVESTATE_BOOST_EFFECT_ON | MOVESTATE_IN_AIR);
    player->moveState &= ~(MOVESTATE_1000000 | MOVESTATE_20);

    sub_8023B5C(player, 9);
    player->unk16 = 6;
    player->unk17 = 9;

    player->unk64 = 19;

    cosVal = COS_24_8(unk30054C0);
    sinVal = SIN_24_8(unk30054C0);
    player->speedAirX = Q_24_8_TO_INT(cosVal * six);
    player->speedAirY = Q_24_8_TO_INT(sinVal * six) - Q_24_8(0.5);

    player->rotation = 0;
    player->unk70 = 0;
    player->unk71 = 0;
    player->unk6E = 0;
    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;
    player->rotation = 0;
    player->unk72 = GBA_FRAMES_PER_SECOND;

    m4aSongNumStart(SE_SONIC_MIDAIR_SOMERSAULT);

    gPlayer.callback = PlayerCB_80124D0;
    PlayerCB_80124D0(player);
}

void PlayerCB_801225C(Player *player)
{
    sub_80218E4(player);
    player->moveState |= (MOVESTATE_100 | MOVESTATE_IN_AIR);
    player->moveState &= ~(MOVESTATE_20000000 | MOVESTATE_1000000 | MOVESTATE_20);

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->unk64 = 14;

    player->speedAirX = 0;
    player->speedAirY = -Q_24_8(4.0);
    player->rotation = 0;

    player->unk70 = 1;
    player->unk71 = 0;
    player->unk6E = 0;
    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;
    player->rotation = 0;

    gPlayer.callback = PlayerCB_80261D8;
    PlayerCB_80261D8(player);
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
        // _08012382
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

void PlayerCB_80123D0(Player *player)
{
    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        gPlayer.callback = PlayerCB_8025318;
    }

    sub_8027EF0(player);
}

void PlayerCB_80123FC(Player *player)
{
    sub_80283C4(player);

    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        player->unk6A++;

        player->speedAirY = Q_24_8(2.0);
        gPlayer.callback = PlayerCB_8011F94;

        if (player->character == CHARACTER_SONIC) {
            sub_8011C98(Q_24_8_TO_INT(player->x), Q_24_8_TO_INT(player->y));
        } else if (player->character == CHARACTER_AMY) {
            sub_8015BD4(3);
        }
    }
}

void PlayerCB_8012460(Player *player)
{
    player->speedAirY += Q_24_8(56.0 / 256.0);

    if (player->speedAirY >= 0) {
        player->unk6A++;
        player->unk6C = 1;
        gPlayer.callback = PlayerCB_8012498;
    }

    sub_80283C4(player);
}

void PlayerCB_8012498(Player *player)
{
    sub_8027EF0(player);

    if (!(player->moveState & MOVESTATE_IN_AIR)) {
        player->unk6D = 1;
    }
}

void TaskDestructor_80124B8(struct Task *t)
{
    TaskStrc_8011C98 *strc = TaskGetStructPtr(t);
    Sprite *s = &strc->s;
    VramFree(s->graphics.dest);
}

void PlayerCB_80124D0(Player *player)
{
    if (--player->unk72 == -1) {
        player->unk64 = 14;
        player->moveState &= ~MOVESTATE_BOOST_EFFECT_ON;
    }

    sub_8027EF0(player);

    if (!(player->moveState & MOVESTATE_IN_AIR)) {
        player->unk6D = 1;
    }
}

/* Maybe new module here? */

bool32 sub_801251C(Player *player)
{
    if (player->character == CHARACTER_SONIC) {
        if (player->unk71 == 1) {
            sub_80120C0(player);
            return TRUE;
        }
    }

    return FALSE;
}

void sub_8012548(Player *player)
{
    sub_80218E4(player);

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->moveState |= MOVESTATE_20000000;

    if (ABS(player->speedGroundX) < Q_24_8(0.25)) {
        player->speedGroundX = 0;
        player->unk64 = 15;
    } else {
        player->unk64 = 87;
    }

    gPlayer.callback = PlayerCB_80127F0;
    PlayerCB_80127F0(player);
}

void sub_80125BC(Player *player)
{
    if (player->w.flyingDurationCream == 0) {
        if (player->unk64 == 85)
            m4aSongNumStop(SE_CREAM_FLYING);

        player->unk64 = 85;
    } else {
        if (((player->unk5C & DPAD_LEFT) && !(player->moveState & MOVESTATE_FACING_LEFT))
            || ((player->unk5C & DPAD_RIGHT)
                && (player->moveState & MOVESTATE_FACING_LEFT))) {
            player->unk64 = 84;
        } else if (player->unk64 == 84) {
            if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
                player->unk64 = 83;
            }
        } else {
            player->unk64 = 83;
        }

        m4aSongNumStartOrChange(SE_CREAM_FLYING);
    }
}

void sub_8012644(Player *player)
{
    sub_80218E4(player);

    if (player->moveState & MOVESTATE_4) {
        player->moveState &= ~MOVESTATE_4;

        sub_8023B5C(player, 14);
        player->unk16 = 6;
        player->unk17 = 14;
    }

    player->w.flyingDurationCream = CREAM_FLYING_DURATION;
    player->unk61 = 1;
    player->unk5A = 0;
    player->unk58 = 0;
    gPlayer.moveState |= MOVESTATE_10000000;
    gPlayer.callback = PlayerCB_80126B0;
    PlayerCB_80126B0(player);
}

void PlayerCB_80126B0(Player *player)
{
    if (player->w.flyingDurationCream != 0) {
        player->w.flyingDurationCream--;

        if (player->unk5C & gPlayerControls.attack) {
            player->unk64 = 86;
            player->unk6D = 0x5;

            m4aSongNumStop(SE_CREAM_FLYING);
            return;
        }
    }

    if (player->unk61 != 1) {
        if (player->speedAirY >= -Q_24_8(0.75)) {
            player->speedAirY -= Q_24_8(0.09375);

            if (++player->unk61 == 32) {
                player->unk61 = 1;
            }
        } else {
            player->unk61 = 1;
        }
    } else {
        if ((player->unk5E & gPlayerControls.jump)
            && (player->speedAirY >= -Q_24_8(0.75))
            && (player->w.flyingDurationCream != 0)) {
            player->unk61 = 2;
        }

        player->speedAirY += Q_24_8(PLAYER_GRAVITY);
    }
    // _08012756
    if (player->y < Q_24_8(gCamera.unk28)) {
        player->y = Q_24_8(gCamera.unk28);

        if (player->speedAirY < 0)
            player->speedAirY = 0;
    }

    sub_80125BC(player);

    {
        s16 speed = gUnknown_080D552C[player->unk52];
        if (ABS(player->speedAirX) > speed) {
            if (player->speedAirX > 0)
                player->speedAirX -= player->unk48 * 2;
            else
                player->speedAirX += player->unk48 * 2;
        }
    }
    // _080127BC
    sub_80282EC(player);

    if (!(player->moveState & MOVESTATE_IN_AIR)) {
        player->unk6D = 1;
    } else if (player->moveState & MOVESTATE_40) {
        player->unk64 = 14;
        player->unk6D = 5;
    }
}

void PlayerCB_80127F0(Player *player)
{
    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        if (player->moveState & MOVESTATE_IN_AIR) {
            player->unk64 = 9;
            player->unk6D = 5;
        } else {
            player->unk6D = 1;
        }
    }

    sub_8027EF0(player);
}

void sub_8012830(Player *player)
{
    sub_80218E4(player);

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->moveState |= MOVESTATE_20000000;

    player->unk64 = 17;

    gPlayer.callback = PlayerCB_8012938;
    PlayerCB_8012938(player);
}

void sub_8012888(Player *player)
{
    sub_80218E4(player);

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->moveState |= (MOVESTATE_20000000 | MOVESTATE_100 | MOVESTATE_IN_AIR);

    player->unk64 = 18;

    gPlayer.callback = PlayerCB_8012978;
    PlayerCB_8012978(player);
}

void sub_80128E0(Player *player)
{
    sub_80218E4(player);

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->moveState |= (MOVESTATE_20000000 | MOVESTATE_100 | MOVESTATE_IN_AIR);

    player->unk64 = 19;

    gPlayer.callback = PlayerCB_80129BC;
    PlayerCB_80129BC(player);
}

void PlayerCB_8012938(Player *player)
{
    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        if (player->moveState & MOVESTATE_IN_AIR) {
            player->unk64 = 50;
            player->unk6D = 5;
        } else {
            player->unk6D = 1;
        }
    }

    sub_8027EF0(player);
}

void PlayerCB_8012978(Player *player)
{
    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        if ((player->unk68
             == SA2_ANIM_CHAR(SA2_CHAR_ANIM_INSTA_SHIELD_1, CHARACTER_CREAM))
            && player->unk6A == 0) {
            player->unk6A++;
        }
    }

    sub_8027EF0(player);

    if (!(player->moveState & MOVESTATE_IN_AIR)) {
        player->unk6D = 1;
    }
}

void PlayerCB_80129BC(Player *player)
{
    sub_8027EF0(player);

    if (!(player->moveState & MOVESTATE_IN_AIR)) {
        player->unk6D = 1;
    }
}

struct Task *sub_80129DC(s32 x, s32 y)
{
    struct Task *result;

    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
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

void sub_8012AD0(Player *player)
{
    sub_80218E4(player);

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    player->unk64 = 91;

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->moveState |= (MOVESTATE_20000000 | MOVESTATE_100 | MOVESTATE_IN_AIR);

    player->speedAirY = -Q_24_8(4.0);

    if (player->moveState & MOVESTATE_40) {
        player->speedAirY >>= 1;
    }

    m4aSongNumStart(SE_JUMP);

    gPlayer.callback = PlayerCB_8012D1C;
    PlayerCB_8012D1C(player);
}

void sub_8012B44(Player *player)
{
    if (player->flyingDurationTails == 0) {
        player->unk64 = 90;
        m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
    } else {
        if (((player->unk5C & DPAD_LEFT) && !(player->moveState & MOVESTATE_FACING_LEFT))
            || ((player->unk5C & DPAD_RIGHT)
                && (player->moveState & MOVESTATE_FACING_LEFT))) {
            player->unk64 = 89;
        } else if ((player->unk64 == 89)) {
            if ((player->unk90->s.unk10 & SPRITE_FLAG_MASK_14))
                player->unk64 = 88;
        } else {
            player->unk64 = 88;
        }

        m4aSongNumStartOrChange(SE_TAILS_PROPELLER_FLYING);
    }
}

void sub_8012BC0(Player *player)
{
    sub_80218E4(player);

    if (player->moveState & MOVESTATE_4) {
        player->moveState &= ~MOVESTATE_4;

        sub_8023B5C(player, 14);
        player->unk16 = 6;
        player->unk17 = 14;
    }

    player->flyingDurationTails = TAILS_FLYING_DURATION;
    player->unk61 = 1;
    player->unk5A = 0;
    player->unk58 = 0;

    gPlayer.moveState |= MOVESTATE_10000000;
    gPlayer.callback = PlayerCB_8012C2C;
    PlayerCB_8012C2C(player);
}

void PlayerCB_8012C2C(Player *player)
{
    // Only decrease Tails' counter every 2nd frame, giving him 8 seconds of flight.
    // ...why didn't they just set his timer to a bigger value?
    if ((gUnknown_03005590 & 0x1) && (player->flyingDurationTails != 0)) {
        player->flyingDurationTails--;
    }

    if (player->unk61 != 1) {
        if (player->speedAirY >= -Q_24_8(0.75)) {
            player->speedAirY -= Q_24_8(0.09375);

            if (++player->unk61 == 32) {
                player->unk61 = 1;
            }
        } else {
            player->unk61 = 1;
        }
    } else {
        if ((player->unk5E & gPlayerControls.jump)
            && (player->speedAirY >= -Q_24_8(0.75))
            && (player->flyingDurationTails != 0)) {
            player->unk61 = 2;
        }

        player->speedAirY += Q_24_8(PLAYER_GRAVITY);
    }

    if (player->y < Q_24_8(gCamera.unk28)) {
        player->y = Q_24_8(gCamera.unk28);

        if (player->speedAirY < 0)
            player->speedAirY = 0;
    }

    sub_8012B44(player);

    player->unk40 = Q_24_8(6.0);
    player->unk48 = 0x10;

    sub_80282EC(player);

    if (!(player->moveState & MOVESTATE_IN_AIR)) {
        player->unk6D = 1;
    } else if (player->moveState & MOVESTATE_40) {
        player->unk64 = 14;
        player->unk6D = 5;
    }
}

void PlayerCB_8012D1C(Player *player)
{
    if (!(player->moveState & MOVESTATE_IN_AIR)) {
        player->unk6D = 1;
    }

    sub_8028204(player);
}

void sub_8012D3C(Player *player)
{
    sub_80218E4(player);

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    player->unk64 = 15;

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->moveState |= MOVESTATE_20000000;

    sub_80129DC(Q_24_8_TO_INT(player->x), Q_24_8_TO_INT(player->y));

    m4aSongNumStart(SE_TAILS_TAIL_SWIPE);

    gPlayer.callback = PlayerCB_8012DA4;
    PlayerCB_8012DA4(player);
}

void PlayerCB_8012DA4(Player *player)
{
    s32 halfUnk4C = player->unk4C >> 1;

    s32 speed = player->speedGroundX;
    if (speed > 0) {
        if ((speed -= halfUnk4C) < 0)
            speed = 0;
    } else {
        if ((speed += halfUnk4C) > 0)
            speed = 0;
    }
    player->speedGroundX = speed;

    sub_8029C84(player);

    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        gPlayer.callback = PlayerCB_8025318;
    }

    sub_8027EF0(player);
}

struct Task *sub_8012DF8(s32 x, s32 y, u16 p2)
{
    struct Task *result;

    if (!GAME_MODE_IS_SINGLE_PLAYER(gGameMode)) {
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

        s->graphics.dest = VramMalloc(gUnknown_080D553C[p2][0]);
        s->graphics.anim = gUnknown_080D553C[p2][1];
        s->variant = gUnknown_080D553C[p2][2];

        s->unk1A = 0x200;
        s->unk10 = SPRITE_FLAG_PRIORITY(2);

        result = t;
    }

    return result;
}

void sub_8012EEC(Player *player)
{
    sub_80218E4(player);

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    player->unk64 = 15;

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->moveState |= MOVESTATE_20000000;

    if (ABS(player->speedGroundX) < Q_24_8(3.0)) {
        if (player->moveState & MOVESTATE_FACING_LEFT) {
            player->speedGroundX = -Q_24_8(3.0);
        } else {
            player->speedGroundX = +Q_24_8(3.0);
        }
    }

    gPlayer.callback = PlayerCB_8012F6C;
    PlayerCB_8012F6C(player);
}

void PlayerCB_8012F6C(Player *player)
{
    s32 speed = player->speedGroundX;
    if (speed > 0) {
        if ((speed -= Q_24_8(0.375)) < 0)
            speed = 0;

        player->speedGroundX = speed;
    } else if (speed < 0) {
        if ((speed += Q_24_8(0.375)) > 0)
            speed = 0;

        player->speedGroundX = speed;
    }

    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        if (player->moveState & MOVESTATE_IN_AIR) {
            player->unk64 = 50;
            player->unk6D = 5;
        } else {
            player->unk6A++;
            player->unk6C = 1;

            if (ABS(player->speedGroundX) < Q_24_8(3.0)) {
                if (player->moveState & MOVESTATE_FACING_LEFT) {
                    player->speedGroundX = -Q_24_8(3.0);
                } else {
                    player->speedGroundX = +Q_24_8(3.0);
                }
            }

            gPlayer.callback = PlayerCB_8013010;
        }
    }

    sub_8027EF0(player);
}

void PlayerCB_8013010(Player *player)
{
    s32 speed = player->speedGroundX;
    if (speed > 0) {
        if ((speed -= Q_24_8(0.375)) < 0)
            speed = 0;

        player->speedGroundX = speed;
    } else if (speed < 0) {
        if ((speed += Q_24_8(0.375)) > 0)
            speed = 0;

        player->speedGroundX = speed;
    }

    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        if (player->moveState & MOVESTATE_IN_AIR) {
            player->unk64 = 50;
            player->unk6D = 5;
        } else {
            player->unk6D = 1;
        }
    }

    sub_8027EF0(player);
}

void sub_8013070(Player *player)
{
    sub_80218E4(player);

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    player->unk64 = 17;

    sub_8023B5C(player, 9);
    player->unk16 = 6;
    player->unk17 = 9;

    player->moveState |= MOVESTATE_20000000;

    sub_8012DF8(Q_24_8_TO_INT(player->x), Q_24_8_TO_INT(player->y), 0);

    player->unk72 = 32;

    m4aSongNumStart(SE_225);

    gPlayer.callback = PlayerCB_80130E4;
    PlayerCB_80130E4(player);
}

void PlayerCB_80130E4(Player *player)
{
    s32 speed = player->speedGroundX;
    s32 addend = player->unk4C >> 1;
    if (speed > 0) {
        if ((speed -= addend) < 0)
            speed = 0;

        player->speedGroundX = speed;
    } else if (speed < 0) {
        if ((speed += addend) > 0)
            speed = 0;

        player->speedGroundX = speed;
    }

    sub_8029C84(player);

    if (--player->unk72 == -1) {
        player->unk6A++;
        player->unk6C = 1;
        gPlayer.callback = PlayerCB_8013B6C;
    }

    sub_8027EF0(player);
}

NONMATCH("asm/non_matching/playercb__sub_8013150.inc", void sub_8013150(Player *player))
{
    // HACK: Don't cast it like this!
    s8 xOffset = player->w.tf.shift;

    player->moveState &= ~MOVESTATE_20;
    player->moveState &= ~MOVESTATE_FACING_LEFT;

    if ((xOffset & 0x7F) == 0) {
        player->unk64 = 0x5C;

        if ((u8)xOffset == 0x80) {
            player->moveState |= MOVESTATE_FACING_LEFT;
        }
    } else {
        u8 val = ABS(xOffset);
        // _0801318C
        player->unk64 = gUnknown_080D5538[(val & 0x7F) >> 5];
    }
}
END_NONMATCH

// (91.52% on Apr. 17th 2023) https://decomp.me/scratch/9bH5g
NONMATCH("asm/non_matching/playercb__sub_80131B4.inc", void sub_80131B4(Player *player))
{
    u8 someFlags;
    u8 mstate_inAir;

    sub_8022838(player);

    // HACK: Don't cast it like this!
    someFlags = player->w.tf.flags;
    mstate_inAir = MOVESTATE_IN_AIR;

    if (!(someFlags & 0x2)) {
        if (player->speedAirX <= 0) {
            player->moveState |= MOVESTATE_FACING_LEFT;
        } else {
            player->moveState &= ~MOVESTATE_FACING_LEFT;
        }

        if (((player->rotation + Q_24_8(0.125)) & (-Q_24_8(0.25))) << 24 != 0) {
            // HACK: cast
            s8 urgh = *((u8 *)(&player->w.flyingDurationCream) + 1) + Q_24_8(0.25);
            if (urgh <= 0) {
                player->moveState |= MOVESTATE_FACING_LEFT;
            } else {
                player->moveState &= ~MOVESTATE_FACING_LEFT;
            }

            player->speedAirY = 0;

            sub_8022318(player);

            player->unk6D = 1;
        } else {
            gPlayer.callback = PlayerCB_8013C18;
            player->unk64 = 95;
            m4aSongNumStart(SE_SONIC_SKID_ATTACK);
        }
    } else if (someFlags & 0x20) {
        // _08013258

        type8029A28 sp08;

        if (player->w.tf.unkAE >= 0) {
            u8 *urgh = ((u8 *)(&player->w.flyingDurationCream) + 1);
            if ((*urgh + Q_24_8(0.25)) << 24 <= 0) {
                type8029A28 result; // <= r6
                player->moveState |= MOVESTATE_FACING_LEFT;
                result = sub_8029A28(player, NULL, &sp08);

                if (result == sp08) {
                    if (result != 0) {
                        u16 gravInv = gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED;
                        if (gravInv) {
                            s32 playerBottomX;
                            s32 playerBottomY = Q_24_8_TO_INT(player->y);
                            playerBottomY -= 1;
                            playerBottomY -= player->unk17;

                            playerBottomX = Q_24_8_TO_INT(player->x);
                            playerBottomX -= 1;
                            playerBottomX -= player->unk16;

                            if (sub_801E4E4(playerBottomY, playerBottomX, player->unk38,
                                            -8, NULL, sub_801EE64)
                                < 0) {
                                goto _08013348;
                            }
                        } else {
                            // _080132F0
                            s32 playerBottomX;
                            s32 playerBottomY = Q_24_8_TO_INT(player->y);
                            playerBottomY += 1;
                            playerBottomY += player->unk17;

                            playerBottomX = Q_24_8_TO_INT(player->x);
                            playerBottomX -= 1;
                            playerBottomX -= player->unk16;

                            if (sub_801E4E4(playerBottomY, playerBottomX, player->unk38,
                                            +8, NULL, sub_801EE64)
                                < 0) {
                                goto _08013348;
                            }
                        }
                        // _0801331E
                        player->x -= Q_24_8(*urgh);
                    }
                }
            } else {
                // _0801332C
                type8029A28 ret;
                player->moveState &= ~MOVESTATE_FACING_LEFT;

                ret = sub_8029A74(player, 0, &sp08);
                if (ret != sp08) {
                _08013348:
                    gPlayer.callback = PlayerCB_8013BD4;
                    player->unk64 = 93;
                    player->unk16 = 6;
                    player->unk17 = 14;
                    // HACK: Don't cast it like this!
                    player->w.tf.flags |= mstate_inAir;
                    return;
                } else if (ret != 0) {
                    // _08013370
                    if (!(gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)) {
                        s32 playerBottomX;
                        s32 playerBottomY = Q_24_8_TO_INT(player->y);
                        playerBottomY += 1;
                        playerBottomY += player->unk17;

                        playerBottomX = Q_24_8_TO_INT(player->x);
                        playerBottomX += 1;
                        playerBottomX += player->unk16;

                        if (sub_801E4E4(playerBottomY, // fmt
                                        playerBottomX, player->unk38, +8, NULL,
                                        sub_801EE64)
                            < 0) {
                            goto _08013348;
                        }
                    }

                    player->x += Q_24_8(ret);
                }
            }

            // _080133BA
            player->speedGroundX = 0;
            player->speedAirX = 0;
            player->speedAirY = 0;

            gPlayer.callback = PlayerCB_8013C34;

            *urgh = 3;

            player->unk64 = 100;
            player->moveState |= MOVESTATE_10000000;
            player->unk16 = 6;
            player->unk17 = 10;

            return;
        }
        // _080133FC
        gPlayer.callback = PlayerCB_8013BD4;

        player->unk64 = 93;
        player->unk16 = 6;
        player->unk17 = 14;
        // HACK: Don't cast it like this!
        player->w.tf.flags |= mstate_inAir;
    } else {
        // _08013424
        if (!(player->unk5C & gPlayerControls.jump)
            || (player->moveState & MOVESTATE_40)) {
            gPlayer.callback = PlayerCB_8013BD4;
            player->unk64 = 93;

            if (player->speedAirX <= 0) {
                player->moveState |= MOVESTATE_FACING_LEFT;
            } else {
                player->moveState &= ~MOVESTATE_FACING_LEFT;
            }

            player->speedAirX >>= 2;
            player->unk16 = 6;
            player->unk17 = 14;
        } else {
            sub_8013150(player);
        }
    }
}
END_NONMATCH

void sub_8013498(Player *player)
{
    u8 someFlags;

    sub_8023610(player);
    sub_8029DC8(player);
    sub_8022838(player);

    if (!(player->w.tf.flags & 0x2)) {
        player->speedGroundX = 0;
        player->speedAirX = 0;
        player->speedAirY = 0;

        player->unk16 = 6;
        player->unk17 = 14;

        sub_8022318(player);

        if ((player->rotation + Q_24_8(0.125)) & Q_24_8(0.75)) {
            player->unk6D = 1;
        } else {
            player->unk2A = 15;
            player->unk64 = 94;
            gPlayer.callback = PlayerCB_8013BF0;
        }
    }
}

void sub_801350C(Player *player)
{
    u8 rot;
    s32 p2;
    s32 res;

    if ((gUnknown_03005590 & 0x3) == 0) {
        s32 offsetY = player->unk17;

        if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)
            offsetY = -offsetY;

        sub_801F5CC(Q_24_8_TO_INT(player->x), Q_24_8_TO_INT(player->y) + offsetY);
    }
    // _0801353E
    sub_8022838(player);

    res = sub_8029B88(player, &rot, &p2);

    if (res < 12) {
        if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
            res = -res;
        }

        player->y += Q_24_8(res);
        player->rotation = rot;
    } else if (!(player->moveState & MOVESTATE_8)) {
        // _08013580
        gPlayer.callback = PlayerCB_8013BD4;

        sub_8023B5C(player, 14);
        player->unk16 = 6;
        player->unk17 = 14;

        player->w.tf.flags |= 0x2;
    }
}

void sub_80135BC(Player *player)
{
    if (player->unk5C & gPlayerControls.jump) {
        if (player->speedAirX <= 0) {
            player->speedAirX += Q_24_8(0.09375);

            if (player->speedAirX < 0) {
                sub_801350C(player);
                return;
            }
        } else {
            player->speedAirX -= Q_24_8(0.09375);

            if (player->speedAirX > 0) {
                sub_801350C(player);
                return;
            }
        }
    }

    player->speedGroundX = 0;
    player->speedAirX = 0;
    player->speedAirY = 0;

    {
        s32 offsetY;
        offsetY = player->unk17 - 14;

        if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED)
            offsetY = -offsetY;

        player->y += Q_24_8(offsetY);
    }

    sub_8022318(player);

    player->unk2A = 15;
    player->unk6D = 1;
}

s32 sub_8013644(Player *player)
{
    s32 result;
    u8 rot;

    if (player->moveState & MOVESTATE_FACING_LEFT) {
        s32 pX;
        s32 pY;

        pX = Q_24_8_TO_INT(player->x);
        pX -= 2;
        pX -= player->unk16;

        pY = Q_24_8_TO_INT(player->y);

        result = sub_801E4E4(pX, pY, player->unk38, -8, &rot, sub_801ED24);

        if (rot & 0x1) {
            player->rotation = Q_24_8(0.25);
        } else {
            player->rotation = rot;
        }
    } else {
        s32 pX;
        s32 pY;
        pX = Q_24_8_TO_INT(player->x);
        pX += 2;
        pX += player->unk16;

        pY = Q_24_8_TO_INT(player->y);

        result = sub_801E4E4(pX, pY, player->unk38, +8, &rot, sub_801ED24);

        if (!(rot & 0x1)) {
            player->rotation = rot;
        } else {
            player->rotation = Q_24_8(0.75);
        }
    }

    return result;
}

void sub_80136E8(Player *player)
{
    u8 rot;
    s32 r2;

    if (player->w.tf.unkAE >= 0) {
        if (player->moveState & MOVESTATE_8) {
            sub_8013CA0(player);
            return;
        }

        player->speedGroundX = 0;
        player->speedAirX = 0;
        player->speedAirY = 0;

        if (player->unk64 != 100) {
            player->unk64 = 101;
        }

        if (player->unk5C & DPAD_UP) {
            s32 offsetY = Q_24_8(player->unk17);

            if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
                offsetY = -offsetY;
            }

            player->y -= offsetY;
            r2 = sub_8013644(player);
            player->y += offsetY;

            if (r2 > 2) {
                sub_8013C50(player);
                return;
            } else if (r2 > 0) {
                // BUG: rot is not initialised
                player->rotation = rot;

                player->speedGroundX = 0;
                player->speedAirX = 0;
                player->speedAirY = 0;

                sub_8022318(player);
                gPlayer.callback = PlayerCB_8013BD4;

                player->unk64 = 93;
                return;
            } else if (r2 < 0) {
                sub_801394C(player);
                return;
            } else {
                s32 offsetY = Q_24_8(9.0);
                if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
                    offsetY = -offsetY;
                }

                player->y -= offsetY;
                r2 = sub_8029AC0(player, &rot, NULL);
                player->y += offsetY;

                if (r2 < 0) {
                    player->unk64 = 0x66;
                    player->y -= Q_24_8(r2);
                } else {
                    s32 speed;
                    player->unk64 = 0x66;
                    speed = Q_24_8(0.75);
                    if (player->moveState & 0x40) {
                        speed = Q_24_8(0.5);
                    }
                    player->speedAirY = -speed;
                }
            }
        } else if (player->unk5C & DPAD_DOWN) {
            s32 speed;
            // _080137FC
            s32 offsetY = Q_24_8(player->unk17);
            if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
                offsetY = -offsetY;
            }

            // _0801381C
            player->y += offsetY;
            r2 = sub_8013644(player);
            player->y -= offsetY;

            if (r2 > 0) {
                sub_8013CA0(player);
                return;
            }

            if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
                r2 = sub_8029AC0(player, &rot, NULL);
            } else {
                r2 = sub_8029B0C(player, &rot, NULL);
            }

            if (r2 < 0) {
                if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
                    player->y -= Q_24_8(r2);
                } else {
                    player->y += Q_24_8(r2);
                }
                // _0801387E
                player->rotation = rot;

                player->speedGroundX = 0;
                player->speedAirX = 0;
                player->speedAirY = 0;

                sub_8022318(player);
                gPlayer.callback = PlayerCB_8013BD4;
                player->unk64 = 93;
                return;
            } else {
                player->unk64 = 103;
                speed = Q_24_8(0.75);
                if (player->moveState & MOVESTATE_40) {
                    speed = Q_24_8(0.5);
                }
                player->speedAirY = speed;
            }
        } else {
            r2 = sub_8013644(player);
            if (r2 > 0) {
                // _080138BE
                sub_8013CA0(player);
                return;
            }
        }

        // _080138D2
        r2 = 1;
        if (!(player->unk5C & (DPAD_DOWN | DPAD_UP))) {
            r2 = sub_8029B0C(player, &rot, NULL);
            if (r2 < 0) {
                player->y += Q_24_8(r2);
                player->rotation = rot;

                player->speedGroundX = 0;
                player->speedAirX = 0;
                player->speedAirY = 0;

                sub_8022318(player);

                player->unk64 = 93;
                return;
            }
        }
        // _08013914
        if (r2 != 0 && --player->w.tf.shift == 0) {
            player->w.tf.shift = 3;
        }

        sub_801394C(player);
    } else {
        sub_8013CA0(player);
    }
}

void sub_801394C(Player *player)
{
    if (player->unk5E & gPlayerControls.jump) {
        player->speedAirY = -Q_24_8(2.625);
        player->speedAirX = +Q_24_8(3.0);
        player->moveState ^= MOVESTATE_FACING_LEFT;

        if (player->moveState & MOVESTATE_FACING_LEFT)
            player->speedAirX = -player->speedAirX;

        player->moveState |= MOVESTATE_4;
        player->moveState |= MOVESTATE_IN_AIR;
        player->moveState |= MOVESTATE_100;

        player->unk16 = 6;
        player->unk17 = 9;
        player->unk64 = 50;
        player->unk6D = 4;
    }
}

// https://decomp.me/scratch/8fUWD
NONMATCH("asm/non_matching/playercb__sub_80139B0.inc", void sub_80139B0(Player *player))
{
    s32 speedGrnd = ABS(player->speedGroundX);
    s8 r2 = player->w.tf.shift;

    if (speedGrnd < Q_24_8(3.0)) {
        speedGrnd += Q_24_8(6.0 / 256.0);
    } else if (speedGrnd < Q_24_8(15.0)) {
        if ((r2 & 0x7F) == 0)
            speedGrnd += Q_24_8(3.0 / 256.0);
    }
    // _080139E4
    if (player->moveState & MOVESTATE_40) {
        if ((speedGrnd > Q_24_8(3.0))
            && (speedGrnd -= Q_24_8(9.0 / 256.0)) < Q_24_8(3.0))
            speedGrnd = Q_24_8(3.0);
    }

    {
        s8 shift = player->w.tf.shift + Q_24_8(0.25);
        if (shift <= 0) {
            player->speedGroundX = -speedGrnd;
        } else {
            player->speedGroundX = +speedGrnd;
        }
    }

    {
        u8 shift;

        if (player->unk5C & DPAD_LEFT) {
            if (((u8)r2 != 0x80)) {
                shift = ABS(r2) + Q_8_8(2.0);
            }
        } else if (player->unk5C & DPAD_RIGHT) {
            if ((r2 != 0)) {
                shift = ABS(r2) + Q_8_8(2.0);
            }
        } else {
            if (r2 & 0x7F) {
                shift = r2 + 2;
            }
        }

        player->w.tf.shift = shift;

        {
            s32 speedX = Q_24_8_TO_INT(COS_24_8(shift) * speedGrnd);
            player->speedAirX = speedX;
        }
        {
            s32 speedY = player->speedAirY;

            if (speedY < Q_24_8(0.5)) {
                speedY += Q_24_8(0.09375);
            } else {
                speedY -= Q_24_8(0.09375);
            }
            player->speedAirY = speedY;
        }

        if (gCamera.unk4C > 0) {
            gCamera.unk4C -= 2;
        } else if (gCamera.unk4C < 0) {
            gCamera.unk4C += 4;
        }
    }
}
END_NONMATCH

void sub_8013AD8(Player *player)
{
    player->moveState &= ~MOVESTATE_4;
    player->unk16 = 6;
    player->unk17 = 6;

    player->speedAirY += Q_24_8(1.5);

    if (player->speedAirY < 0)
        player->speedAirY = 0;

    player->speedGroundX = Q_24_8(3.0);

    if (player->moveState & MOVESTATE_40)
        player->speedGroundX /= 2;

    if (player->moveState & MOVESTATE_FACING_LEFT) {
        player->speedGroundX = -player->speedGroundX;
        player->speedAirX = player->speedGroundX;
        player->w.tf.shift = 0x80;
    } else {
        player->speedAirX = player->speedGroundX;
        player->w.tf.shift = 0;
    }

    player->rotation = 0;

    {
        u8 *tFlags = &player->w.tf.flags;
        *tFlags = 0;
        player->unk5A = FALSE;
        *tFlags |= 0x2;
    }

    gPlayer.callback = PlayerCB_8013BB4;
    PlayerCB_8013BB4(player);
}

void PlayerCB_8013B6C(Player *player)
{
    sub_8029C84(player);

    if ((player->unk90->s.unk10) & SPRITE_FLAG_MASK_14) {
        if (player->moveState & MOVESTATE_IN_AIR) {
            player->unk64 = 50;
            player->unk6D = 5;
        } else {
            player->unk6D = 1;
        }
    }

    sub_8027EF0(player);
}

void PlayerCB_8013BB4(Player *player)
{
    sub_80139B0(player);
    sub_80232D0(player);
    sub_8029D64(player);
    sub_80131B4(player);
}

void PlayerCB_8013BD4(Player *player)
{
    sub_80232D0(player);
    sub_8029D64(player);
    sub_8013498(player);
}

void PlayerCB_8013BF0(Player *player)
{
    if ((player->unk90->s.unk10) & SPRITE_FLAG_MASK_14) {
        player->unk6D = 1;
    }

    sub_8027EF0(player);
}

void PlayerCB_8013C18(Player *player)
{
    sub_80135BC(player);
    sub_80232D0(player);
    sub_8029D64(player);
}

void PlayerCB_8013C34(Player *player)
{
    sub_80136E8(player);
    sub_80232D0(player);
    sub_8029D64(player);
}

void PlayerCB_8013E64(Player *player);

void sub_8013C50(Player *player)
{
    player->unk64 = 104;

    if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
        player->y += Q_24_8(player->unk17);
    } else {
        player->y -= Q_24_8(player->unk17);
    }

    gPlayer.callback = PlayerCB_8013E64;

    player->w.tf.shift = 0;
}

void sub_8013CA0(Player *player)
{
    gPlayer.callback = PlayerCB_8013BD4;

    player->unk16 = 6;
    player->unk17 = 14;

    player->unk64 = 93;
}

// PlayerSomething_CeilGroundSpeed
void sub_8013CC0(Player *player)
{
    s32 speedGrnd = ABS(player->speedGroundX);

    if (speedGrnd < Q_24_8(3.0)) {
        if (player->moveState & MOVESTATE_FACING_LEFT) {
            player->speedGroundX = -Q_24_8(3.0);
        } else {
            player->speedGroundX = +Q_24_8(3.0);
        }
    }
}

// Identical to sub_8013EE0
void sub_8013CF4(Player *player)
{
    s32 speedGrnd = player->speedGroundX;

    if (speedGrnd > 0) {
        if ((speedGrnd - Q_24_8(0.375)) < 0) {
            speedGrnd = 0;
        } else {
            speedGrnd -= Q_24_8(0.375);
        }

        player->speedGroundX = speedGrnd;
    } else if (speedGrnd < 0) {
        if ((speedGrnd + Q_24_8(0.375)) > 0) {
            speedGrnd = 0;
        } else {
            speedGrnd += Q_24_8(0.375);
        }

        player->speedGroundX = speedGrnd;
    }
}

void PlayerCB_8013DA8(Player *player);

void PlayerCB_8013D18(Player *player)
{
    sub_80218E4(player);

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->moveState |= (MOVESTATE_20000000 | MOVESTATE_100);

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    player->unk64 = 106;

    player->speedAirX = 0;
    player->speedAirY = 0;

    m4aSongNumStart(SE_226);

    gPlayer.callback = PlayerCB_8013DA8;
    PlayerCB_8013DA8(player);
}

void sub_8013D7C(Player *player)
{
    gPlayer.callback = PlayerCB_8013BD4;

    player->unk64 = 93;

    player->unk16 = 6;
    player->unk17 = 14;

    player->w.tf.flags |= 0x2;
}

void PlayerCB_8013DFC(Player *player);

void PlayerCB_8013DA8(Player *player)
{
    sub_80283C4(player);

    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        player->unk64 = 107;
        player->speedAirX = Q_24_8(0.0);
        player->speedAirY = Q_24_8(1.0);

        sub_8012DF8(Q_24_8_TO_INT(player->x), Q_24_8_TO_INT(player->y), 1);

        gPlayer.callback = PlayerCB_8013DFC;
        PlayerCB_8013DFC(player);
    }
}

void PlayerCB_8013E34(Player *player);

void PlayerCB_8013DFC(Player *player)
{
    player->speedAirY += Q_24_8(42.0 / 256.0);

    sub_80283C4(player);

    if (!(player->moveState & MOVESTATE_IN_AIR)) {
        gPlayer.callback = PlayerCB_8013E34;

        player->unk64 = 108;
        player->speedAirY = 0;
    }
}

void PlayerCB_8013E34(Player *player)
{
    sub_8027EF0(player);

    player->speedGroundX = 0;
    player->speedAirX = 0;
    player->speedAirY = 0;

    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        player->unk6D = 1;
    }
}

void PlayerCB_8013E64(Player *player)
{
    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        player->rotation = 0;

        if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
            player->y += Q_24_8(player->unk17);
        } else {
            player->y -= Q_24_8(player->unk17);
        }

        if (player->moveState & MOVESTATE_FACING_LEFT) {
            player->x -= Q_24_8(16.0);
        } else {
            player->x += Q_24_8(16.0);
        }

        PlayerCB_8025318(player);
    } else {
        sub_80232D0(player);
        sub_8029D64(player);
    }
}

// Identical to sub_8013CF4
void sub_8013EE0(Player *player)
{
    s32 speedGrnd = player->speedGroundX;

    if (speedGrnd > 0) {
        if ((speedGrnd - Q_24_8(0.375)) < 0) {
            speedGrnd = 0;
        } else {
            speedGrnd -= Q_24_8(0.375);
        }

        player->speedGroundX = speedGrnd;
    } else if (speedGrnd < 0) {
        if ((speedGrnd + Q_24_8(0.375)) > 0) {
            speedGrnd = 0;
        } else {
            speedGrnd += Q_24_8(0.375);
        }

        player->speedGroundX = speedGrnd;
    }
}

void PlayerCB_8013F60(Player *player);

void sub_8013F04(Player *player)
{
    sub_80218E4(player);

    player->unk90->s.unk10 &= ~SPRITE_FLAG_MASK_14;

    player->unk64 = 15;

    sub_8023B5C(player, 14);
    player->unk16 = 6;
    player->unk17 = 14;

    player->moveState |= MOVESTATE_20000000;

    sub_8015BD4(0);

    gPlayer.callback = PlayerCB_8013F60;
    PlayerCB_8013F60(player);
}

void PlayerCB_8013F60(Player *player)
{
    s32 speed = player->speedGroundX;
    if (speed > 0) {
        if ((speed -= Q_24_8(0.375)) < 0)
            speed = 0;

        player->speedGroundX = speed;
    } else if (speed < 0) {
        if ((speed += Q_24_8(0.375)) > 0)
            speed = 0;

        player->speedGroundX = speed;
    }

    if (player->unk90->s.unk10 & SPRITE_FLAG_MASK_14) {
        gPlayer.callback = PlayerCB_8025318;
    }

    sub_8027EF0(player);
}
