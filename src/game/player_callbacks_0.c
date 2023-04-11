#include "global.h"
#include "trig.h"
#include "lib/m4a.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/playercb_cmds.h"

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
void PlayerCB_80123FC(Player *);
void PlayerCB_8012460(Player *);
void TaskDestructor_80124B8(struct Task *);
void PlayerCB_80124D0(Player *player);

extern void PlayerCB_80261D8(Player *player);
extern void sub_8027EF0(Player *player);
extern void sub_80283C4(Player *player);
extern void sub_8029C84(Player *player);
extern void sub_8029FA4(Player *player);

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

#define TRICK__STOP_N_SLAM__DROP_SPEED Q_24_8(0.21875)

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
