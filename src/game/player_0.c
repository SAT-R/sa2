#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a.h"
#include "sakit/camera.h"
#include "game/game.h"
#include "game/boost_effect.h"
#include "game/bosses/common.h"
#include "game/cheese.h"
#include "game/dust_effect_braking.h"
#include "game/stage/player.h"
#include "game/multiplayer/player_unk_2.h"
#include "game/parameters/bosses.h"
#include "game/player_controls.h"
#include "game/player_mp_actor.h"
#include "game/player_callbacks_1.h"
#include "game/player_super_sonic.h"
#include "game/playerfn_cmds.h"
#include "game/rings_scatter.h"
#include "game/stage/stage.h"
#include "game/unknown_effect.h"
#include "game/water_effects.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

extern u16 gUnknown_080D6736[115][2];

typedef struct {
    /* 0x00 */ u8 unk0;
    /* 0x04 */ u32 unk4; // TODO: Check the type!
} player_0_Task; /* size: 0x8 */

Player ALIGNED(8) gPlayer = {};

// Poentially some extra space on player for this to be aligned 16 (should be 8)
PlayerSpriteInfo ALIGNED(16) gUnknown_03005AA0 = {};
PlayerSpriteInfo ALIGNED(16) gUnknown_03005AF0 = {};

// sakit
extern void InitNewInputCounters(void);

void Task_8023FC0(void);
void AllocateCharacterStageGfx(Player *, PlayerSpriteInfo *);
void AllocateCharacterMidAirGfx(Player *, PlayerSpriteInfo *);
void TaskDestructor_802A07C(struct Task *);

void sub_80213C0(u32 UNUSED characterId, u32 UNUSED levelId, Player *player)
{
#ifndef NON_MATCHING
    register Player *p asm("r5") = player;
#else
    Player *p = player;
#endif

    s32 unk60 = p->unk60;
    struct Task *t;
    player_0_Task *gt;

    t = TaskCreate(Task_8023FC0, sizeof(player_0_Task), 0x3000, 0,
                   TaskDestructor_802A07C);
    p->spriteTask = t;
    gt = TASK_DATA(t);
    gt->unk0 = unk60;
    gt->unk4 = 0;

    if (IS_MULTI_PLAYER) {
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            gRingCount = 1;
        } else {
            gRingCount = 0;
        }
    }

    InitializePlayer(p);

    PLAYERFN_SET(PlayerCB_8025318);

    sub_801F754();
    InitPlayerHitRingsScatter();

    if ((gInputRecorder.mode == RECORDER_RECORD)) {
        InputRecorderLoadTape();
        gInputRecorder.mode = RECORDER_RECORD;
    } else if (gInputRecorder.mode == RECORDER_PLAYBACK) {
        InputRecorderLoadTape();
        gInputRecorder.mode = RECORDER_PLAYBACK;
    }

    gStageGoalX = 0;
    gUnknown_030054FC = 0;
    gUnknown_030054E0 = 0;

    InitNewInputCounters();
    AllocateCharacterStageGfx(p, p->unk90);
    AllocateCharacterMidAirGfx(p, p->unk94);
}

void AllocateCharacterStageGfx(Player *p, PlayerSpriteInfo *param2)
{
    s32 unk60 = p->unk60;
    Sprite *s = &param2->s;

    if (unk60 == 0) {
        s->graphics.dest = (void *)OBJ_VRAM0;
    } else {
        s->graphics.dest = VramMalloc(64);
    }

    s->graphics.size = 0;
    s->graphics.anim = p->anim;
    s->variant = p->variant;
    s->prevVariant = -1;
    s->x = Q_24_8_TO_INT(p->x);
    s->y = Q_24_8_TO_INT(p->y);
    s->unk1A = SPRITE_OAM_ORDER(16 + unk60);
    s->timeUntilNextFrame = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);

    if (IS_MULTI_PLAYER) {
        s->palId = SIO_MULTI_CNT->id;
    } else {
        s->palId = 0;
    }

    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    if (IS_MULTI_PLAYER) {
        s->unk10 |= (SPRITE_FLAG_MASK_18 | SPRITE_FLAG_MASK_19);
    }
    SPRITE_FLAG_SET(s, ROT_SCALE_ENABLE);
    s->unk10 |= unk60;

    s->hitboxes[0].index = -1;
    s->hitboxes[1].index = -1;

    param2->unk0[0] = 0;
    param2->unk0[1] = 0x100;
    param2->unk0[2] = 0x100;
    param2->unk0[3] = 0;
    param2->unk0[4] = 0;
}

// Allocate VRAM for Tails' tails and Cream's ears while mid-air
void AllocateCharacterMidAirGfx(Player *p, PlayerSpriteInfo *param2)
{
    Sprite *s = &param2->s;
    PlayerSpriteInfo *extraSprite = param2;
    u32 character = p->character;

    if (character == CHARACTER_CREAM) {
        s->graphics.dest = VramMalloc(16);
        s->graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_ATTACK, CHARACTER_CREAM);
        extraSprite->s.variant = 1;
    } else {
        if (character != CHARACTER_TAILS) {
            return;
        }

        s->graphics.dest = VramMalloc(16);
        s->graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_SPIN_ATTACK, CHARACTER_TAILS);
        extraSprite->s.variant = 1;
    }

    s->graphics.size = 0;
    s->prevVariant = -1;
    s->x = Q_24_8_TO_INT(p->x);
    s->y = Q_24_8_TO_INT(p->y);
    s->unk1A = SPRITE_OAM_ORDER(17);
    s->timeUntilNextFrame = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);

    if (IS_MULTI_PLAYER) {
        s->palId = SIO_MULTI_CNT->id;
    } else {
        s->palId = 0;
    }

    s->unk10 = (SPRITE_FLAG_MASK_18 | SPRITE_FLAG(PRIORITY, 2)
                | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG(ROT_SCALE, 4));

    extraSprite->unk0[0] = 0;
    extraSprite->unk0[1] = 0x100;
    extraSprite->unk0[2] = 0x100;
    extraSprite->unk0[3] = 0;
    extraSprite->unk0[4] = 0;
}

void SetStageSpawnPos(u32 character, u32 level, u32 p2, Player *p)
{
    p->unk60 = p2;
    p->character = character;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        p->checkPointX = gSpawnPositions[level][0];
        p->checkPointY = gSpawnPositions[level][1];
    } else {
        // _08021640
        p->checkPointX = 360 - (SIO_MULTI_CNT->id * 20);
        p->checkPointY = 177;
        p->x = -1;
        p->y = -1;
    }

    p->unk98 = 0;
    p->checkpointTime = 0;
    p->unk90 = &gUnknown_03005AF0;
    p->unk94 = &gUnknown_03005AA0;
}

// NOTE: Only reg-alloc mismatch in loop (see comment below)
// (99.91%) https://decomp.me/scratch/UT9dt
NONMATCH("asm/non_matching/game/InitializePlayer.inc", void InitializePlayer(Player *p))
{
    if ((gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)
        && (((p->x & p->y) + 1) != 0)) {
        p->x = Q_24_8(460);
    } else {
        p->x = Q_24_8(p->checkPointX);
    }
    p->y = Q_24_8(p->checkPointY);

    p->callback = PlayerCB_8025318;

    p->unk5C = gPlayerControls.jump | gPlayerControls.attack | gPlayerControls.trick;
    p->unk5E = gPlayerControls.jump | gPlayerControls.attack | gPlayerControls.trick;

    p->speedAirX = 0;
    p->speedAirY = 0;
    p->speedGroundX = 0;
    p->moveState = MOVESTATE_IGNORE_INPUT;
    p->rotation = 0;
    PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 14);
    p->unk25 = 120;
    p->spindashAccel = 0;
    p->unk29 = 0;
    p->unk28 = 0;
    p->unk38 = FLAG_PLAYER_x38__LAYER_BACK;
    p->unk40 = 0x900;
    p->unk44 = 0x600;
    p->unk48 = 8;
    p->unk4C = 64;
    p->unk64 = 0;
    p->unk66 = -1;
    p->anim = -1;
    p->variant = -1;
    p->timerInvulnerability = 0;
    p->timerInvincibility = 0;
    p->timerSpeedup = 0;
    p->unk32 = 0;
    p->unk3C = NULL;
    p->itemEffect = 0;
    p->unk2A = 0;
    p->unk72 = 0x168;
    p->unk7E = 0;
    p->unk7C = 0;
    p->unk82 = 0x100;
    p->unk80 = 0x100;
    p->defeatScoreIndex = 0;
    p->unk61 = 0;
    p->unk62 = 0;
    p->unk63 = 0;
    p->unk86 = 30;
    p->unk87 = 60;
    p->unk88 = 10;
    p->transition = 0;
    p->unk6E = 0;
    p->prevTransition = 0;
    p->unk5A = 0;
    p->unk58 = 0;
    p->unk6C = 0;
    p->unk71 = 0;
    p->unk70 = 0;
    p->unk36 = 0;

    sub_8015750();
    sub_801561C();
    sub_802989C(p);

    { // This smells like a memset macro.
        // Nonmatching reg-alloc between r4 & r6 here
        u32 *u99 = (void *)p->unk99;
        s32 i = 4;

        while (i-- != 0) {
            *u99++ = 0;
        }
    }

    p->unk99[0] = 0x7F;

    if ((p->unk60 == 0) && IS_SINGLE_PLAYER) {
        if (gCourseTime >= MAX_COURSE_TIME) {
            gCheckpointTime = 0;
            gCourseTime = 0;
            p->checkpointTime = 0;
        } else {
            gCheckpointTime = p->checkpointTime;
            gCourseTime = p->checkpointTime;
        }
    }

    switch (p->character) {
        case CHARACTER_SONIC: {
            p->w.sf.flags = 0;
            p->w.sf.unkAE = 0;
            p->w.sf.unkB0 = 0;
        } break;

        case CHARACTER_CREAM: {
            p->w.cf.unkAE = 0;
            p->w.cf.flyingDuration = 0;
            p->w.cf.unkB0 = 0;
        } break;

        case CHARACTER_TAILS: {
            p->w.tf.flags = 0;
            p->w.tf.flyingDuration = 0;
            p->w.tf.shift = 0;
        } break;

        case CHARACTER_KNUCKLES: {
            p->w.kf.unkAC = 0;
            p->w.kf.unkAD = 0;
            p->w.kf.unkAE = 0;
        } break;

        case CHARACTER_AMY: {
            p->w.af.unkAC = 0;
        } break;
    }

    gUnknown_03005B7C = 0;
    gUnknown_03005840 = NULL;
    gUnknown_0300583C = 0;
}
END_NONMATCH

// PlayerCancelMidAir? (Not only used for transitioning to ground)
void sub_80218E4(Player *p)
{
    if (p->moveState & MOVESTATE_20000) {
        m4aSongNumStop(SE_281);
    }

    p->moveState &= ~(MOVESTATE_20000000 | MOVESTATE_10000000 | MOVESTATE_1000000
                      | MOVESTATE_80000 | MOVESTATE_40000 | MOVESTATE_20000
                      | MOVESTATE_8000 | MOVESTATE_4000 | MOVESTATE_2000 | MOVESTATE_400
                      | MOVESTATE_200 | MOVESTATE_100 | MOVESTATE_20 | MOVESTATE_10);

    p->unk61 = 0;
    p->unk62 = 0;
    p->unk63 = 0;
    p->unk71 = 0;
    p->unk70 = 0;

    if (p->character == CHARACTER_TAILS) {
        m4aSongNumStop(SE_TAILS_PROPELLER_FLYING);
    }

    if (p->character == CHARACTER_CREAM) {
        m4aSongNumStop(SE_CREAM_FLYING);
    }

    if (p->character == CHARACTER_SONIC) {
        p->moveState &= ~MOVESTATE_BOOST_EFFECT_ON;
    }
}

// Very similar to sub_8029BB8
s32 sub_802195C(Player *p, u8 *p1, s32 *out)
{
    u8 dummy;
    s32 dummyInt;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    u32 mask;
    u8 anotherByte, anotherByte2;
    s32 r5, r1;
    s32 result;

    if (p1 == NULL)
        p1 = &dummy;
    if (out == NULL)
        out = &dummyInt;

    playerX2 = Q_24_8_TO_INT(p->x) - (2 + p->unk16);
    playerY2 = Q_24_8_TO_INT(p->y) - (p->unk17);

    mask = p->unk38;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask |= 0x80;
    }

    r5 = sub_801E4E4(playerX2, playerY2, mask, -8, &anotherByte, sub_801ED24);

    playerX = Q_24_8_TO_INT(p->x) - (2 + p->unk16);
    playerY = Q_24_8_TO_INT(p->y) + (p->unk17);

    mask = p->unk38;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask |= 0x80;
    }

    r1 = sub_801E4E4(playerX, playerY, mask, -8, &anotherByte2, sub_801ED24);

    if (r5 < r1) {
        result = r5;
        *p1 = anotherByte;
        *out = r1;
    } else {
        result = r1;
        *p1 = anotherByte2;
        *out = r5;
    }

    return result;
}

// Very similar to sub_802195C
s32 sub_8021A34(Player *p, u8 *p1, s32 *out)
{
    u8 dummy;
    s32 dummyInt;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    u32 mask;
    u8 anotherByte, anotherByte2;
    s32 r5, r1;
    s32 result;

    if (p1 == NULL)
        p1 = &dummy;
    if (out == NULL)
        out = &dummyInt;

    playerX2 = Q_24_8_TO_INT(p->x) + (2 + p->unk16);
    playerY2 = Q_24_8_TO_INT(p->y) - (p->unk17);

    mask = p->unk38;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask |= 0x80;
    }

    r5 = sub_801E4E4(playerX2, playerY2, mask, +8, &anotherByte, sub_801ED24);

    playerX = Q_24_8_TO_INT(p->x) + (2 + p->unk16);
    playerY = Q_24_8_TO_INT(p->y) + (p->unk17);

    mask = p->unk38;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask |= 0x80;
    }

    r1 = sub_801E4E4(playerX, playerY, mask, +8, &anotherByte2, sub_801ED24);

    if (r5 < r1) {
        result = r5;
        *p1 = anotherByte;
        *out = r1;
    } else {
        result = r1;
        *p1 = anotherByte2;
        *out = r5;
    }

    return result;
}

// Very similar to sub_802195C
s32 sub_8021B08(Player *p, u8 *p1, s32 *out)
{
    u8 dummy;
    s32 dummyInt;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    u32 mask;
    u8 anotherByte, anotherByte2;
    s32 r5, r1;
    s32 result;

    if (p1 == NULL)
        p1 = &dummy;
    if (out == NULL)
        out = &dummyInt;

    playerY2 = Q_24_8_TO_INT(p->y) - (p->unk17);
    playerX2 = Q_24_8_TO_INT(p->x) - (2 + p->unk16);

    mask = p->unk38;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask |= 0x80;
    }

    r5 = sub_801E4E4(playerY2, playerX2, mask, -8, &anotherByte, sub_801EE64);

    playerY = Q_24_8_TO_INT(p->y) - (p->unk17);
    playerX = Q_24_8_TO_INT(p->x) + (2 + p->unk16);

    mask = p->unk38;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask |= 0x80;
    }

    r1 = sub_801E4E4(playerY, playerX, mask, -8, &anotherByte2, sub_801EE64);

    if (r5 < r1) {
        result = r5;
        *p1 = anotherByte;
        *out = r1;
    } else {
        result = r1;
        *p1 = anotherByte2;
        *out = r5;
    }

    return result;
}

void sub_8021BE0(Player *p)
{
    if (!(p->moveState & MOVESTATE_200)) {
        if (!(p->moveState & MOVESTATE_800000)) {
            PLAYERFN_SET(PlayerCB_8025318);
            p->moveState &= ~(MOVESTATE_10 | MOVESTATE_IN_AIR);
        }

        if (p->moveState & MOVESTATE_4) {
            p->moveState &= ~MOVESTATE_4;
            sub_8023B5C(p, 14);
        }
        PLAYERFN_SET_SHIFT_OFFSETS(p, 6, 14);
    } else {
        p->moveState &= ~(MOVESTATE_10 | MOVESTATE_IN_AIR);
    }

    p->defeatScoreIndex = 0;
}

void sub_8021C4C(Player *p)
{
    u8 rotation, anotherByte2;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;

    u32 mask;
    u32 mask2 = p->unk38;

    playerX = Q_24_8_TO_INT(p->x) - (3 + p->unk16);
    playerY = Q_24_8_TO_INT(p->y);

    mask = mask2;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask = 0x80;
        mask |= mask2;
    }

    result = sub_801E4E4(playerX, playerY, mask, -8, 0, sub_801ED24);

    if (result <= 0) {
        p->x -= Q_24_8(result);
        p->speedAirX = 0;
    }

    playerX2 = Q_24_8_TO_INT(p->x) + (3 + p->unk16);
    playerY2 = Q_24_8_TO_INT(p->y);

    mask = mask2;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask |= 0x80;
    }

    result = sub_801E4E4(playerX2, playerY2, mask, +8, 0, sub_801ED24);

    if (result <= 0) {
        p->x += Q_24_8(result);
        p->speedAirX = 0;
    }

    ptr = &fnOut;
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029AC0(p, &rotation, ptr);
    } else {
        result = sub_8029B0C(p, &rotation, ptr);
    }

    if (result < 0) {
        s8 rotCopy;
        s32 r1 = Q_24_8_TO_INT(p->speedAirY);
        r1 += 6;
        r1 = -r1;

        if ((result >= r1) || (fnOut >= r1)) {
            s32 airY;
            p->rotation = rotation;

            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }

            p->y += result << 8;

            sub_8021BE0(p);

            if ((rotation + 32) & 0x40) {
                p->speedAirX = 0;

                if (p->speedAirY > Q_24_8(11.8125)) {
                    p->speedAirY = Q_24_8(11.8125);
                }
            } else if (!((rotation + 16) & 0x20)) {
                p->speedAirY = 0;
                p->speedGroundX = p->speedAirX;
                return;
            } else {
                p->speedAirY >>= 1;
            }

            airY = p->speedAirY;
            if (airY < 0) {
                airY = -airY;
            }
            p->speedGroundX = airY;

            rotCopy = rotation;
            if (rotCopy < 0) {
                p->speedGroundX = -airY;
            }
        }
    }
}

void sub_8021DB8(Player *p)
{
    u8 rotation, anotherByte2;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;

    u32 mask;
    u32 mask2 = p->unk38;

    playerX = Q_24_8_TO_INT(p->x) - (3 + p->unk16);
    playerY = Q_24_8_TO_INT(p->y);

    mask = mask2;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask = 0x80;
        mask |= mask2;
    }

    result = sub_801E4E4(playerX, playerY, mask, -8, 0, sub_801ED24);

    if (result <= 0) {
        p->x -= Q_24_8(result);
        p->speedAirX = 0;
    }

    playerX2 = Q_24_8_TO_INT(p->x) + (3 + p->unk16);
    playerY2 = Q_24_8_TO_INT(p->y);

    mask = mask2;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask |= 0x80;
    }

    result = sub_801E4E4(playerX2, playerY2, mask, +8, 0, sub_801ED24);

    if (result <= 0) {
        p->x += Q_24_8(result);
        p->speedAirX = 0;
    }

    ptr = &fnOut;
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029B0C(p, &rotation, ptr);
    } else {
        result = sub_8029AC0(p, &rotation, ptr);
    }

    if (result <= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }

        p->y -= result << 8;

        if (((rotation + 32) & 0x40)) {
            s8 *pt = (s8 *)&rotation;
            if ((*pt - 0x40) > 0) {
                s32 speed;
                p->rotation = rotation;

                sub_8021BE0(p);

                speed = p->speedAirY;
                if (speed < 0) {
                    speed = -speed;
                }
                p->speedGroundX = speed;
                return;
            }
        }
        p->speedAirY = 0;
    }
}

void sub_8021EE4(Player *p)
{
    u8 rotation, anotherByte2;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;
    u16 gravity;

    u32 mask;
    u32 mask2 = p->unk38;

    gravity = GRAVITY_IS_INVERTED;
    if (gravity) {
        playerX = Q_24_8_TO_INT(p->x) - (3 + p->unk16);
        playerY = Q_24_8_TO_INT(p->y);
        result = sub_801E4E4(playerX, playerY, mask2, -8, NULL, sub_801ED24);
    } else {
        playerX2 = Q_24_8_TO_INT(p->x) - (3 + p->unk16);
        playerY2 = Q_24_8_TO_INT(p->y);

        mask = mask2;
        if (p->speedAirY < Q_24_8(3.0)) {
            mask |= 0x80;
        }
        result = sub_801E4E4(playerX2, playerY2, mask, -8, NULL, sub_801ED24);
    }

    if (result <= 0) {
        p->x -= Q_24_8(result);
        p->speedAirX = 0;
        p->speedGroundX = p->speedAirY;
    }

    ptr = &fnOut;
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029B0C(p, &rotation, ptr);
    } else {
        result = sub_8029AC0(p, &rotation, ptr);
    }

    if (result <= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }

        p->y -= Q_24_8(result);

        if (p->speedAirY < 0) {
            p->speedAirY = 0;
        }
    } else if (p->speedAirY >= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = sub_8029AC0(p, &rotation, &fnOut);
        } else {
            result = sub_8029B0C(p, &rotation, &fnOut);
        }

        if (result <= 0) {
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }

            p->y += Q_24_8(result);

            p->rotation = rotation;
            sub_8021BE0(p);

            p->speedAirY = 0;
            p->speedGroundX = p->speedAirX;
        }
    }
}

void sub_802203C(Player *p)
{
    u8 rotation, anotherByte2;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;
    u16 gravity;

    u32 mask;
    u32 mask2 = p->unk38;

    gravity = GRAVITY_IS_INVERTED;
    if (gravity) {
        playerX = Q_24_8_TO_INT(p->x) + (3 + p->unk16);
        playerY = Q_24_8_TO_INT(p->y);
        result = sub_801E4E4(playerX, playerY, mask2, +8, NULL, sub_801ED24);
    } else {
        playerX2 = Q_24_8_TO_INT(p->x) + (3 + p->unk16);
        playerY2 = Q_24_8_TO_INT(p->y);

        mask = mask2;
        if (p->speedAirY < Q_24_8(3.0)) {
            mask |= 0x80;
        }
        result = sub_801E4E4(playerX2, playerY2, mask, +8, NULL, sub_801ED24);
    }

    if (result <= 0) {
        p->x += Q_24_8(result);
        p->speedAirX = 0;
        p->speedGroundX = p->speedAirY;
    }

    ptr = &fnOut;
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029B0C(p, &rotation, ptr);
    } else {
        result = sub_8029AC0(p, &rotation, ptr);
    }

    if (result <= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }

        p->y -= Q_24_8(result);

        if (p->speedAirY < 0) {
            p->speedAirY = 0;
        }
    } else if (p->speedAirY >= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = sub_8029AC0(p, &rotation, &fnOut);
        } else {
            result = sub_8029B0C(p, &rotation, &fnOut);
        }

        if (result <= 0) {
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }

            p->y += Q_24_8(result);

            p->rotation = rotation;
            sub_8021BE0(p);

            p->speedAirY = 0;
            p->speedGroundX = p->speedAirX;
        }
    }
}

void sub_8022190(Player *p)
{
    s16 airY = p->speedAirY;
    u8 arcResult = (GRAVITY_IS_INVERTED) ? 0x80 : 0;
    s16 airX = p->speedAirX;

    if (airX || airY) {
        arcResult = Q_24_8_TO_INT(ArcTan2(airX, airY));
    }

    arcResult = (arcResult - 0x20) & 0xC0;

    switch (arcResult >> 6) {
        case 0: {
            sub_8021C4C(p);
        } break;

        case 2: {
            sub_8021DB8(p);
        } break;

        case 1: {
            sub_8021EE4(p);
        } break;

        case 3: {
            sub_802203C(p);
        } break;
    }
}

void sub_8022218(Player *p)
{
    u8 rotation;
    s32 sp04;
    s32 res;

    // u8 *pRot = &rotation;
    s32 *pSp04 = &sp04;

    if (GRAVITY_IS_INVERTED) {
        res = sub_8029AC0(p, &rotation, pSp04);
    } else {
        res = sub_8029B0C(p, &rotation, pSp04);
    }

    if (res <= 0) {
        if (GRAVITY_IS_INVERTED) {
            res = -res;
        }

        p->y += Q_24_8(res);
        p->rotation = rotation;
        sub_8021BE0(p);

        p->speedAirY = 0;
        p->speedGroundX = p->speedAirX;
    }
}

void sub_8022284(Player *p)
{
    u8 rotation;
    s32 sp04;
    s32 res;
    s32 airY;

    // u8 *pRot = &rotation;
    s32 *pSp04 = &sp04;

    if (GRAVITY_IS_INVERTED) {
        res = sub_8029B0C(p, &rotation, pSp04);
    } else {
        res = sub_8029AC0(p, &rotation, pSp04);
    }

    if (res <= 0) {
        if (GRAVITY_IS_INVERTED) {
            res = -res;
        }

        p->y -= Q_24_8(res);
        p->rotation = rotation;
        sub_8021BE0(p);

        airY = p->speedAirY;
        if (airY < 0) {
            airY = -airY;
        }
        p->speedGroundX = airY;

        if ((s8)rotation >= 0) {
            p->speedGroundX = -airY;
        }

        if (p->unk6E) {
            p->moveState ^= MOVESTATE_FACING_LEFT;
        }
    }
}

void sub_8022318(Player *p)
{
    s32 offsetY;

    if (!(p->moveState & MOVESTATE_4)) {
        p->unk16 = 6;
        p->unk17 = 14;
    } else {
        // _08022334
        p->moveState &= ~MOVESTATE_4;
        p->unk64 = 0;

        offsetY = p->unk17 - 14;

        if (GRAVITY_IS_INVERTED) {
            offsetY = -offsetY;
        }

        if (((p->rotation + 0x40) << 24) <= 0) {
            offsetY = -offsetY;
        }

        p->unk16 = 6;
        p->unk17 = 14;

        p->y += Q_24_8(offsetY);
    }

    p->moveState &= ~MOVESTATE_IN_AIR;
    p->moveState &= ~MOVESTATE_20;
    p->moveState &= ~MOVESTATE_10;
    p->moveState &= ~MOVESTATE_100;

    p->defeatScoreIndex = 0;
    p->unk25 = 120;
    p->unk61 = 0;

    if (p->unk64 > SA2_NUM_PLAYER_CHAR_ANIMATIONS) {
        p->unk64 = SA2_CHAR_ANIM_IDLE;
    }
}

void sub_80223BC(Player *p)
{
    u8 rotation, anotherByte2;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;
    u16 gravity;

    u32 mask;
    u32 mask2 = p->unk38;

    playerX = Q_24_8_TO_INT(p->x) - (3 + p->unk16);
    playerY = Q_24_8_TO_INT(p->y);

    mask = mask2;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask = 0x80;
        mask |= mask2;
    }
    result = sub_801E4E4(playerX, playerY, mask, -8, NULL, sub_801ED24);

    if (result <= 0) {
        p->x -= Q_24_8(result);
        p->speedAirX = 0;
        // TODO: Find out which character(s) call this, to use the appropriate 'flags'
        p->w.sf.flags |= 0x20;
    }

    playerX2 = Q_24_8_TO_INT(p->x) + (3 + p->unk16);
    playerY2 = Q_24_8_TO_INT(p->y);

    mask = mask2;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask |= 0x80;
    }
    result = sub_801E4E4(playerX2, playerY2, mask, +8, NULL, sub_801ED24);

    if (result <= 0) {
        p->x += Q_24_8(result);
        p->speedAirX = 0;
        p->w.sf.flags |= 0x20;
    }

    ptr = &fnOut;
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029AC0(p, &rotation, ptr);
    } else {
        result = sub_8029B0C(p, &rotation, ptr);
    }

    if (result <= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }

        p->y += Q_24_8(result);

        p->rotation = rotation;
        p->speedAirY = 0;
        p->w.sf.flags &= ~0x2;
    }
}

// Similar to sub_80223BC
void sub_80224DC(Player *p)
{
    u8 rotation, anotherByte2;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;
    u16 gravity;

    u32 mask;
    u32 mask2 = p->unk38;

    playerX = Q_24_8_TO_INT(p->x) - (3 + p->unk16);
    playerY = Q_24_8_TO_INT(p->y);

    mask = mask2;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask = 0x80;
        mask |= mask2;
    }
    result = sub_801E4E4(playerX, playerY, mask, -8, NULL, sub_801ED24);

    if (result <= 0) {
        p->x -= Q_24_8(result);
        p->speedAirX = 0;
        // TODO: Find out which character(s) call this, to use the appropriate 'flags'
        p->w.sf.flags |= 0x20;
    }

    playerX2 = Q_24_8_TO_INT(p->x) + (3 + p->unk16);
    playerY2 = Q_24_8_TO_INT(p->y);

    mask = mask2;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask |= 0x80;
    }
    result = sub_801E4E4(playerX2, playerY2, mask, +8, NULL, sub_801ED24);

    if (result <= 0) {
        p->x += Q_24_8(result);
        p->speedAirX = 0;
        p->w.sf.flags |= 0x20;
    }

    ptr = &fnOut;
    if (GRAVITY_IS_INVERTED) {
        result = sub_8029B0C(p, &rotation, ptr);
    } else {
        result = sub_8029AC0(p, &rotation, ptr);
    }

    if (result <= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }

        p->y -= Q_24_8(result);

        p->speedAirY = 0;
    }
}

void sub_80225E8(Player *p)
{
    u8 rotation, anotherByte2;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;
    u16 gravity;

    u32 mask;
    u8 *mask2 = &p->unk38;

    playerX = Q_24_8_TO_INT(p->x) - (2 + p->unk16);
    playerY = Q_24_8_TO_INT(p->y);

    mask = *mask2;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask |= 0x80;
    }
    result = sub_801E4E4(playerX, playerY, mask, -8, NULL, sub_801ED24);

    if (result <= 0) {
        p->x -= Q_24_8(result);
        p->speedAirX = 0;
        // TODO: Find out which character(s) call this, to use the appropriate 'flags'
        p->w.sf.flags |= 0x20;
    }

    gravity = GRAVITY_IS_INVERTED;
    ptr = &fnOut;
    if (gravity) {
        result = sub_8029B0C(p, &rotation, ptr);
    } else {
        result = sub_8029AC0(p, &rotation, ptr);
    }

    if (result <= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }
        p->y -= Q_24_8(result);

        if (p->speedAirY < 0) {
            p->speedAirY = 0;
        }
    } else if (p->speedAirY >= 0) {

        if (GRAVITY_IS_INVERTED) {
            result = sub_8029AC0(p, &rotation, ptr);
        } else {
            result = sub_8029B0C(p, &rotation, ptr);
        }

        if (result <= 0) {
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }

            p->y += Q_24_8(result);

            p->rotation = rotation;
            p->speedAirY = 0;
            p->w.sf.flags &= ~0x2;
        }
    }
}

// Similar to sub_80225E8
void sub_8022710(Player *p)
{
    u8 rotation, anotherByte2;
    s32 fnOut;
    s32 result;
    s32 playerX, playerY;
    s32 playerX2, playerY2;
    s32 *ptr;
    u16 gravity;

    u32 mask;
    u8 *mask2 = &p->unk38;

    playerX = Q_24_8_TO_INT(p->x) + (2 + p->unk16);
    playerY = Q_24_8_TO_INT(p->y);

    mask = *mask2;
    if (p->speedAirY < Q_24_8(3.0)) {
        mask |= 0x80;
    }
    result = sub_801E4E4(playerX, playerY, mask, +8, NULL, sub_801ED24);

    if (result <= 0) {
        p->x += Q_24_8(result);
        p->speedAirX = 0;
        // TODO: Find out which character(s) call this, to use the appropriate 'flags'
        p->w.sf.flags |= 0x20;
    }

    gravity = GRAVITY_IS_INVERTED;
    ptr = &fnOut;
    if (gravity) {
        result = sub_8029B0C(p, &rotation, ptr);
    } else {
        result = sub_8029AC0(p, &rotation, ptr);
    }

    if (result <= 0) {
        if (GRAVITY_IS_INVERTED) {
            result = -result;
        }
        p->y -= Q_24_8(result);

        if (p->speedAirY < 0) {
            p->speedAirY = 0;
        }
    } else if (p->speedAirY >= 0) {

        if (GRAVITY_IS_INVERTED) {
            result = sub_8029AC0(p, &rotation, ptr);
        } else {
            result = sub_8029B0C(p, &rotation, ptr);
        }

        if (result <= 0) {
            if (GRAVITY_IS_INVERTED) {
                result = -result;
            }

            p->y += Q_24_8(result);

            p->rotation = rotation;
            p->speedAirY = 0;
            p->w.sf.flags &= ~0x2;
        }
    }
}

void sub_8022838(Player *p)
{
    s16 airX = p->speedAirX;
    s16 airY = p->speedAirY;
    u8 arcResult = 0;

    if (p->moveState & MOVESTATE_8) {
        p->w.sf.flags &= ~0x2;
        p->unk29 = 0;
        p->unk28 = 0;
    } else {
        arcResult = Q_24_8_TO_INT(ArcTan2(airX, airY));

        arcResult = (arcResult - 0x20) & 0xC0;

        switch (arcResult >> 6) {
            case 0: {
                sub_80223BC(p);
            } break;

            case 2: {
                sub_80224DC(p);
            } break;

            case 1: {
                sub_80225E8(p);
            } break;

            case 3: {
                sub_8022710(p);
            } break;
        }
    }
}

void sub_80228C0(Player *p)
{
    s32 val;
    u8 *p29;
    s32 resultB;
#ifndef NON_MATCHING
    register s32 resultA asm("r6");
    register u32 r1 asm("r1");
    register u32 r0 asm("r0");
    register s32 playerX asm("r4") = p->x;
    register s32 playerY asm("sl") = (p->y);
#else
    s32 resultA;
    u32 r1;
    u32 r0;
    s32 playerX = p->x;
    s32 playerY = (p->y);
#endif
    u32 mask = p->unk38;
    s32 py = Q_24_8_TO_INT(playerY);

    resultA
        = sub_801E4E4(py + p->unk17, (playerX = Q_24_8_TO_INT(playerX)) - (2 + p->unk16),
                      mask, 8, &p->unk28, sub_801EE64);

    py = py + (p->unk17);
    playerX += 2;
    playerX += p->unk16;
    p29 = &p->unk29;
    resultB = sub_801E4E4(py, playerX, mask, 8, p29, sub_801EE64);

    val = resultB;
    if (resultB > resultA) {
        val = resultA;
    }

    if (val != 0) {
        if (val < 0) {
            if (val < -11) {
                return;
            }

            playerY += Q_24_8(val);

            if (resultA < resultB) {
                r0 = p->unk28;
            } else {
                r0 = *p29;
            }
        } else /* val > 0 */ {
            s32 airX = p->speedAirX;

            if (airX < 0) {
                airX = -airX;
            }

            airX = Q_24_8_TO_INT(airX);
            airX += 3;

            if (airX > 11)
                airX = 11;

            if (val <= airX) {
                playerY += Q_24_8(val);

                if (resultA < resultB) {
                    r0 = p->unk28;
                } else {
                    r0 = *p29;
                }
            } else {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_20;
                return;
            }
        }
    } else {
        if (resultA < resultB) {
            r0 = p->unk28;
        } else {
            r0 = p->unk29;
        }
    }

    r1 = r0;
    p->y = playerY;

    if (!(r1 & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = r1;

        if (GRAVITY_IS_INVERTED) {
            // TODO: CLEANUP (effectively *pRot = -r1)
            r1 = *pRot;
            asm("" ::"r"(r1));
            r0 = r1;
            r0 += 0x40;
            r0 <<= 24;
            r0 = -r0;
            r1 = r0 >> 24;
            asm("" ::"r"(r0, r1));
            r0 = r1;
            r0 -= 0x40;

            *pRot = r0;
        }
    }
}

// Similar to sub_80228C0, sub_8022B18
void sub_80229EC(Player *p)
{
    s32 val;
    u8 *p29;
    s32 resultB;
    s32 playerY;
    s32 py;
#ifndef NON_MATCHING
    register s32 resultA asm("r6");
    register u32 r1 asm("r1");
    register u32 r0 asm("r0");
    register s32 playerX asm("r4");
    register u32 mask asm("r9");
#else
    s32 resultA;
    u32 r1;
    u32 r0;
    s32 playerX;
    u32 mask;
#endif
    playerX = p->x;
    playerY = (p->y);
    mask = p->unk38;
    py = Q_24_8_TO_INT(playerY);

    resultA
        = sub_801E4E4(py - p->unk17, (playerX = Q_24_8_TO_INT(playerX)) + (2 + p->unk16),
                      mask, -8, &p->unk28, sub_801EE64);

    py = py - (p->unk17);
    playerX -= 2;
    playerX -= p->unk16;
    p29 = &p->unk29;
    resultB = sub_801E4E4(py, playerX, mask, -8, p29, sub_801EE64);

    val = resultB;
    if (resultB > resultA) {
        val = resultA;
    }

    if (val != 0) {
        if (val < 0) {
            if (val < -11) {
                return;
            }

            playerY -= Q_24_8(val);

            if (resultA < resultB) {
                r0 = p->unk28;
            } else {
                r0 = *p29;
            }
        } else /* val > 0 */ {
            s32 airX = p->speedAirX;

            if (airX < 0) {
                airX = -airX;
            }

            airX = Q_24_8_TO_INT(airX);
            airX += 3;

            if (airX > 11)
                airX = 11;

            if (val <= airX) {
                playerY -= Q_24_8(val);

                if (resultA < resultB) {
                    r0 = p->unk28;
                } else {
                    r0 = *p29;
                }
            } else {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_20;
                return;
            }
        }
    } else {
        if (resultA < resultB) {
            r0 = p->unk28;
        } else {
            r0 = p->unk29;
        }
    }

    r1 = r0;
    p->y = playerY;

    if (!(r1 & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = r1;

        if (GRAVITY_IS_INVERTED) {
            // TODO: CLEANUP (effectively *pRot = 128-r1)
            r1 = *pRot;
            asm("" ::"r"(r1));
            r0 = r1;
            r0 += 0x40;
            r0 <<= 24;
            r0 = -r0;
            r1 = r0 >> 24;
            asm("" ::"r"(r0, r1));
            r0 = r1;
            r0 -= 0x40;

            *pRot = r0;
        }
    }
}

// Similar to sub_80228C0, sub_80229EC
void sub_8022B18(Player *p)
{
    s32 val;
    u8 *p29;
    s32 resultB;
    s32 playerX;
    s32 py;
#ifndef NON_MATCHING
    register s32 resultA asm("r6");
    register u32 r1 asm("r1");
    register u32 r0 asm("r0");
    register s32 playerY asm("r4");
    register u32 mask asm("r9");
#else
    s32 resultA;
    u32 r1;
    u32 r0;
    s32 playerY;
    u32 mask;
#endif
    playerX = p->x;
    playerY = (p->y);
    mask = p->unk38;
    py = Q_24_8_TO_INT(playerX);

    resultA
        = sub_801E4E4(py - p->unk17, (playerY = Q_24_8_TO_INT(playerY)) - (2 + p->unk16),
                      mask, -8, &p->unk28, sub_801ED24);

    py = py - (p->unk17);
    playerY += 2;
    playerY += p->unk16;
    p29 = &p->unk29;
    resultB = sub_801E4E4(py, playerY, mask, -8, p29, sub_801ED24);

    val = resultB;
    if (resultB > resultA) {
        val = resultA;
    }

    if (val != 0) {
        if (val < 0) {
            if (val < -11) {
                return;
            }

            playerX -= Q_24_8(val);

            if (resultA < resultB) {
                r0 = p->unk28;
            } else {
                r0 = *p29;
            }
        } else /* val > 0 */ {
            s32 airY = p->speedAirY;

            if (airY < 0) {
                airY = -airY;
            }

            airY = Q_24_8_TO_INT(airY);
            airY += 3;

            if (airY > 11)
                airY = 11;

            if (val <= airY) {
                playerX -= Q_24_8(val);

                if (resultA < resultB) {
                    r0 = p->unk28;
                } else {
                    r0 = *p29;
                }
            } else {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_20;
                return;
            }
        }
    } else {
        if (resultA < resultB) {
            r0 = p->unk28;
        } else {
            r0 = p->unk29;
        }
    }

    r1 = r0;
    p->x = playerX;

    if (!(r1 & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = r1;

        if (GRAVITY_IS_INVERTED) {
            // TODO: CLEANUP (effectively *pRot = 128-r1)
            r1 = *pRot;
            asm("" ::"r"(r1));
            r0 = r1;
            r0 += 0x40;
            r0 <<= 24;
            r0 = -r0;
            r1 = r0 >> 24;
            asm("" ::"r"(r0, r1));
            r0 = r1;
            r0 -= 0x40;

            *pRot = r0;
        }
    }
}

// Similar to sub_80228C0, sub_80229EC, sub_8022B18
void sub_8022C44(Player *p)
{
    s32 val;
    s32 resultB;
    s32 playerX;
    s32 py;
    s32 resultA;

#ifndef NON_MATCHING
    register u32 r1 asm("r1");
    register u32 r0 asm("r0");
    register s32 playerY asm("r4");
    register u32 mask asm("r8");
#else
    u32 r1;
    u32 r0;
    s32 playerY;
    u32 mask;
#endif
    playerX = p->x;
    playerY = (p->y);
    mask = p->unk38;
    py = Q_24_8_TO_INT(playerX);

    resultA
        = sub_801E4E4(py + p->unk17, (playerY = Q_24_8_TO_INT(playerY)) + (2 + p->unk16),
                      mask, +8, &p->unk28, sub_801ED24);

    py = py + (p->unk17);
    playerY -= 2;
    playerY -= p->unk16;
    resultB = sub_801E4E4(py, playerY, mask, +8, &p->unk29, sub_801ED24);

    val = resultB;
    if (resultB > resultA) {
        val = resultA;
    }

    if (val != 0) {
        if (val < 0) {
            if (val < -11) {
                return;
            }

            playerX += Q_24_8(val);

            if (resultA < resultB) {
                r0 = p->unk28;
            } else {
                r0 = p->unk29;
            }
        } else /* val > 0 */ {
            s32 airY = p->speedAirY;

            if (airY < 0) {
                airY = -airY;
            }

            airY = Q_24_8_TO_INT(airY);
            airY += 3;

            if (airY > 11)
                airY = 11;

            if (val <= airY) {
                playerX += Q_24_8(val);

                if (resultA < resultB) {
                    r0 = p->unk28;
                } else {
                    r0 = p->unk29;
                }
            } else {
                p->moveState |= MOVESTATE_IN_AIR;
                p->moveState &= ~MOVESTATE_20;
                return;
            }
        }
    } else {
        if (resultA < resultB) {
            r0 = p->unk28;
        } else {
            r0 = p->unk29;
        }
    }

    r1 = r0;
    p->x = playerX;

    if (!(r1 & 0x1)) {
        vu8 *pRot = &p->rotation;
        *pRot = r1;

        if (GRAVITY_IS_INVERTED) {
            // TODO: CLEANUP (effectively *pRot = 128-r1)
            r1 = *pRot;
            asm("" ::"r"(r1));
            r0 = r1;
            r0 += 0x40;
            r0 <<= 24;
            r0 = -r0;
            r1 = r0 >> 24;
            asm("" ::"r"(r0, r1));
            r0 = r1;
            r0 -= 0x40;

            *pRot = r0;
        }
    }
}

// (99.91%) https://decomp.me/scratch/WA4Qa
NONMATCH("asm/non_matching/game/sub_8022D6C.inc", void sub_8022D6C(Player *p))
{
    u32 zero = 0;
    if (p->moveState & MOVESTATE_8) {
        p->unk29 = zero;
        p->unk28 = zero;
    } else {
        if ((gCurrentLevel == 0) && (gWater.isActive == 1)) {
            s32 r5 = Q_24_8(p->y) >> 16;
            u32 mask = ~0x3;
            s32 offsetY = p->unk17;
            s32 waterLevel = gWater.currentWaterLevel;
            s32 r0 = (waterLevel - offsetY) & mask;
            s16 r6;
            r0 <<= 16;
            r5 &= mask;
            r6 = (s16)(r0 >> 16);
#ifndef NON_MATCHING
            asm("\tasr %0, %0, #16\n" : "=r"(r0) : "r"(r0));
#else
            r0 = r0 >> 16;
#endif

            if ((r5 == r0) && (p->speedAirY >= 0) && ((u8)(p->rotation + 0x18) <= 0x30)
                && (!(p->moveState & MOVESTATE_IN_AIR))
                && (ABS(p->speedGroundX) >= Q_24_8(6.0))) {
                sub_80228C0(p);

                if (p->y >= Q_24_8(r5)) {
                    if (!(p->moveState & MOVESTATE_20000)) {
                        p->moveState |= MOVESTATE_20000;

                        if (IS_SINGLE_PLAYER) {
                            CreateRunOnWaterEffect();
                        }
                    }

                    m4aSongNumStartOrContinue(SE_281);
                    p->y = (r6 << 8);
                    p->rotation = 0;
                    p->moveState &= ~MOVESTATE_IN_AIR;
                } else {
                    // _08022E54
                    if (p->moveState & MOVESTATE_20000) {
                        m4aSongNumStop(SE_281);
                    }
                    p->moveState &= ~MOVESTATE_20000;
                }
                return;
            } else if (p->moveState & MOVESTATE_20000) {
                p->moveState &= ~MOVESTATE_20000;
                m4aSongNumStop(SE_281);
            }
        }
        // _08022E90
        {
            u8 r1;
            s8 r0;
            if (GRAVITY_IS_INVERTED) {
                r0 = (s8)p->rotation;
                r0 += 0x40;
                r0 = NEGATE(r0);
                r0 -= 0x40;

                // _08022EF4

                if (r0 + 0x20 > 0) {
                    if (r0 <= 0) {
                        r1 = r0 + 0x20;
                    } else {
                        r1 = r0 + 0x1F;
                    }
                } else {
                    if (r0 > 0) {
                        r1 = r0 + 0x20;
                    } else {
                        r1 = r0 + 0x1F;
                    }
                }

                r0 = r1 >> 6;
                switch (r0) {
                    case 0: {
                        sub_80228C0(p);
                    } break;

                    case 2: {
                        sub_80229EC(p);
                    } break;

                    case 1: {
                        sub_8022B18(p);
                    } break;

                    case 3: {
                        sub_8022C44(p);
                    } break;
                }

            } else {
                r0 = (s8)p->rotation;
                // _08022EF4

                if (r0 + 0x20 > 0) {
                    if (r0 <= 0) {
                        r1 = r0 + 0x20;
                    } else {
                        r1 = r0 + 0x1F;
                    }
                } else {
                    if (r0 > 0) {
                        r1 = r0 + 0x20;
                    } else {
                        r1 = r0 + 0x1F;
                    }
                }

                switch (r1 >> 6) {
                    case 0: {
                        sub_80228C0(p);
                    } break;

                    case 2: {
                        sub_80229EC(p);
                    } break;

                    case 1: {
                        sub_8022B18(p);
                    } break;

                    case 3: {
                        sub_8022C44(p);
                    } break;
                }
            }
        }
    }
}
END_NONMATCH

// (100.00%) https://decomp.me/scratch/U0r54
s32 sub_8022F58(u8 param0, Player *p)
{
    u32 p0;
    s32 result = 0; // maybe u8?
    s32 r4;
    u8 sp0[4];
    s32 sp4[4];
#ifndef NON_MATCHING
    register s32 fnRes asm("r3");
#else
    s32 fnRes;
#endif

    p->unk29 = param0;
    p->unk28 = param0;

    p0 = (param0 + Q(0.125)) & 0xC0;

#ifndef NON_MATCHING
    asm("asr %0, %1, #6\n" : "=r"(r4) : "r"(p0));
#else
    r4 = p0 >> 6;
#endif

    switch (r4) {
        case 0: {
            u8 *ptr = sp0;
            u8 temp;
            fnRes = sub_8029BB8(p, ptr, &sp4[0]);
            temp = *ptr;

            if (sp0[0] & 0x1) {
                *ptr = result;
            } else {
                // _08023006
                if (GRAVITY_IS_INVERTED) {
                    s32 v = -0x80 - temp;
                    *ptr = v;
                }
            }

            result = fnRes;
        } break;

        case 1: {
            u8 *ptr = sp0;
            u8 temp;
            fnRes = sub_802195C(p, ptr, &sp4[1]);
            temp = *ptr;

            if (temp & 0x1) {
                *ptr = result;
            } else {
                // _08023006
                if (GRAVITY_IS_INVERTED) {
                    s32 v = -0x80 - temp;
                    *ptr = v;
                }
            }

            result = fnRes;
        } break;

        case 2: {
            u8 *ptr = sp0;
            u8 temp;
            fnRes = sub_8021B08(p, ptr, &sp4[2]);
            temp = *ptr;

            if (temp & 0x1) {
                *ptr = result;
            } else {
                // _08023006
                if (GRAVITY_IS_INVERTED) {
                    s32 v = -0x80 - temp;
                    *ptr = v;
                }
            }

            result = fnRes;
        } break;

        case 3: {
            u8 *ptr = sp0;
            u8 temp;
            fnRes = sub_8021A34(p, ptr, &sp4[3]);
            temp = *ptr;

            if (temp & 0x1) {
                *ptr = result;
            } else {
                // _08023006
                if (GRAVITY_IS_INVERTED) {
                    s32 v = -0x80 - temp;
                    *ptr = v;
                }
            }

            result = fnRes;
        } break;
    }

    return result;
}

// (98.07%) https://decomp.me/scratch/xgjsf
NONMATCH("asm/non_matching/game/player__sub_802302C.inc",
         s32 sub_802302C(u8 param0, Player *p))
{
    s32 r3;
    u32 r0;
    s32 result;
    u32 temp;

    s32 px = I(p->x);
    s32 py = I(p->y);

    p->unk29 = param0;
    r3 = (s8)param0;
    p->unk28 = param0;

    if (((param0 + Q(0.125)) << 24) > 0) {
        if (r3 <= 0) {
            asm("");
            param0 += Q(0.125);
        } else {
            param0 += Q(0.125) - 1;
        }
    } else {
        if (r3 <= 0) {
            param0 += Q(0.125) - 1;
        } else {
            param0 += Q(0.125);
        }
    }

    switch (param0 >> 6) {
        case 0: {
            s32 y = py + 2;
            result = sub_801E4E4(y + p->unk16, px, p->unk38, +8, NULL, sub_801EE64);
        } break;

        case 2: {
            s32 y = py - 2;
            result = sub_801E4E4(y - p->unk16, px, p->unk38, -8, NULL, sub_801EE64);
        } break;

        case 1: {
            s32 x = (px - 2);
            result = sub_801E4E4(x - p->unk16, py, p->unk38, -8, NULL, sub_801ED24);
        } break;

        case 3: {
            s32 x = (px + 2);
            result = sub_801E4E4(x + p->unk16, py, p->unk38, +8, NULL, sub_801ED24);
        } break;

        default: {
            result = 0;
        }
    }

    return result;
}
END_NONMATCH

void sub_8023128(Player *p)
{
    u8 r1;
    u32 temp;
    u8 r5;
    s32 r2;

    if (p->speedGroundX == 0) {
        return;
    }

    r1 = Q(0.25);
    if (p->speedGroundX >= 0) {
        r1 = -Q(0.25);
    }

    // without temp, the add instr. sources get switched
    temp = p->rotation + r1;
    r5 = temp;

    r2 = Q(sub_802302C(r5, p));

    if (r2 <= 0) {
        s32 rot = (r5 + Q(0.125));

        switch ((rot & 0xC0) >> 6) {

            case 0: {
                p->y += r2;
                p->speedAirY = 0;
            } break;

            case 1: {
                p->x -= r2;
                p->speedAirX = 0;
                p->moveState |= MOVESTATE_20;
                p->speedGroundX = 0;
            } break;

            case 2: {
                p->y -= r2;
                p->speedAirY = 0;
                p->moveState |= MOVESTATE_IN_AIR;
            } break;

            case 3: {
                p->x += r2;
                p->speedAirX = 0;
                p->moveState |= MOVESTATE_20;
                p->speedGroundX = 0;
            } break;
        }

        p->unk62 = 0;
        p->unk63 = 0;
    }
}

void sub_80231C0(Player *p)
{
    u8 r1;
    u32 temp;
    u8 r5;
    s32 r2;

    if (p->speedGroundX == 0) {
        return;
    }

    r1 = Q(0.25);
    if (p->speedGroundX >= 0) {
        r1 = -Q(0.25);
    }

    // without temp, the add instr. sources get switched
    temp = p->rotation + r1;
    r5 = temp;

    r2 = Q(sub_802302C(r5, p));

    if (r2 <= 0) {
        switch (((r5 + Q(0.125)) & 0xC0) >> 6) {

            case 0: {
                p->y += r2;
                p->speedAirY = 0;
            } break;

            case 1: {
                p->x -= r2;
                p->speedAirX = 0;
                p->moveState &= ~MOVESTATE_4;

                sub_8023B5C(p, 14);
                p->unk16 = 6;
                p->unk17 = 14;
                p->speedGroundX = 0;
            } break;

            case 2: {
                p->y -= r2;
                p->speedAirY = 0;
                p->moveState |= MOVESTATE_IN_AIR;
            } break;

            case 3: {
                p->x += r2;
                p->speedAirX = 0;
                p->moveState &= ~MOVESTATE_4;

                sub_8023B5C(p, 14);
                p->unk16 = 6;
                p->unk17 = 14;
                p->speedGroundX = 0;
            } break;
        }
    }
}

void sub_8023260(Player *p)
{
    s32 r4 = p->unk40;
    s32 temp;

    if (p->speedGroundX > (s16)r4) {
        p->speedGroundX = +r4;
    } else {
        s32 speedX = p->speedGroundX;
        if (speedX < -(s16)r4) {
            p->speedGroundX = -r4;
        }
    }

    r4 = p->speedGroundX;

    {
        s16 rot = p->rotation;

        p->speedAirX = I(COS_24_8(rot * 4) * r4);

        if (!(p->moveState & MOVESTATE_IN_AIR)) {
            p->speedAirY = 0;
        }

        p->speedAirY += I(SIN_24_8(rot * 4) * r4);
    }
}

// (100.00%)
void sub_80232D0(Player *p)
{
    struct Camera *cam = &gCamera;
    s32 qPX = p->x;
    s32 qPY = p->y;
    s32 ix, iy;
    s32 ox, oy;

    if (p->unk60 == 0) {
        if (IS_BOSS_STAGE(gCurrentLevel)) {
            if (gCurrentLevel & 0x2) {
                ox = gUnknown_080D650C[gCurrentLevel].x;
                if ((ox >= 0) && (qPX >= Q(ox))) {
                    ix = gUnknown_080D661C[gCurrentLevel].x;
                    iy = gUnknown_080D661C[gCurrentLevel].y;

                    qPX += Q(ix);
                    qPY += Q(iy);

                    if (gCheese != NULL) {
                        gCheese->posX += Q(ix);
                        gCheese->posY += Q(iy);
                    }

                    gUnknown_030054FC = Q(ix);
                    gUnknown_030054E0 = Q(iy);

                    sub_8039F14(Q(ix), Q(iy));

                    gBossRingsShallRespawn = TRUE;

                    cam->x += ix;
                    cam->unk20 += ix;
                    cam->unk10 += ix;
                    cam->y += iy;
                    cam->unk24 += iy;
                    cam->unk14 += iy;
                }
            }
        } else if ((gPlayer.moveState & MOVESTATE_8000000)
                   && (gSpecialRingCount >= SPECIAL_STAGE_REQUIRED_SP_RING_COUNT)) {
            ox = gUnknown_080D650C[gCurrentLevel].x;
            if ((ox >= 0) && (qPX >= Q(ox)) && (cam->unk8 != 0)) {
                if (!(cam->unk50 & 0x1)) {
                    s32 ix;

                    ix = gUnknown_080D661C[gCurrentLevel].x;
                    qPX += Q(ix);
                    cam->x += ix;
                    cam->unk20 += ix;
                    cam->unk10 += ix;

                    if (gCheese != NULL) {
                        gCheese->posX += Q(ix);
                    }
                }
            }

            oy = gUnknown_080D650C[gCurrentLevel].y;
            if ((oy >= 0) && (qPY >= Q(oy)) && (cam->unkC != 0)) {
                if (!(cam->unk50 & 0x2)) {
                    s32 iy;

                    iy = gUnknown_080D661C[gCurrentLevel].y;
                    qPY += Q(iy << 8);
                    cam->y += Q(iy);
                    cam->unk24 += Q(iy);

                    if (gCheese != NULL) {
                        gCheese->posY += Q(iy << 8);
                    }
                }
            }
        }
    }

    if ((p->moveState & (MOVESTATE_80000000 | MOVESTATE_DEAD)) != MOVESTATE_DEAD) {
        s32 r2, r3;
        struct Camera *cam2 = &gCamera;
        r3 = p->y;

        if ((s32)p->moveState >= 0) {
            s32 r1;

            if (GRAVITY_IS_INVERTED) {
                if (p->y > Q(gCamera.minY)) {
                    goto lbl0;
                } else {
                    r1 = 1;
                }
            } else {
                s32 qMaxY = Q(cam2->maxY) - 1;

                r1 = 1;

                if (p->y < qMaxY) {
                lbl0:
                    r1 = 0;
                }
            }

            if (r1 != 0) {
                p->moveState |= MOVESTATE_DEAD;

                if (p->moveState & MOVESTATE_40) {
                    p->speedAirY = -Q(2.625);
                } else {
                    p->speedAirY = -Q(4.875);
                }

                qPY = GRAVITY_IS_INVERTED ? Q(cam->minY) : Q(cam->maxY) - 1;
            }
        }

        if (IS_BOSS_STAGE(gCurrentLevel)) {
            r2 = gUnknown_03005440;
            r3 = gUnknown_030054BC;
        } else {
            r2 = cam->minY;
            r3 = cam->maxY;
        }

        {
            s32 oldQPX = qPX;
            s32 oldQPY = qPY;
            s32 qMinX = Q(cam->minX);

            qPX = CLAMP_32(qPX, qMinX, Q(cam->maxX) - 1);
            qPY = CLAMP_32(qPY, Q(r2), Q(r3) - 1);

            if (qPX != oldQPX) {
                p->speedAirX = 0;
                p->speedGroundX = 0;
            }

            if (qPY != oldQPY) {
                p->speedAirY = 0;
                p->speedGroundX = 0;
            }

            if (IS_BOSS_STAGE(gCurrentLevel)) {
                s32 qPXMin = (Q(cam->unk10));
                if (qPX < qPXMin + Q(8.0)) {
                    qPX = qPXMin + Q(8.0);
                    p->speedGroundX = BOSS_VELOCITY_X;
                    p->speedAirX = BOSS_VELOCITY_X;

                    p->moveState &= ~MOVESTATE_FACING_LEFT;
                } else if (qPX > (qPXMin + Q(312.0))) {
                    qPX = (qPXMin + Q(312.0));
                    p->speedGroundX = BOSS_VELOCITY_X;
                    p->speedAirX = BOSS_VELOCITY_X;
                }
            }

            p->x = qPX;
            p->y = qPY;
        }
    }
}
