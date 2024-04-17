#include "global.h"
#include "core.h"
#include "trig.h"
#include "sakit/globals.h"

#include "game/stage/camera.h"
#include "game/stage/player.h"

#include "game/bosses/boss_9.h"
#include "game/game_over.h"
#include "game/player_super_sonic.h"
#include "game/save.h"
#include "game/stage/stage.h"

#include "lib/m4a.h"

#include "constants/animations.h"
#include "constants/characters.h"
#include "constants/move_states.h"
#include "constants/songs.h"

bool32 sub_802BA8C();
static void Task_802BC10(void);
static void sub_802BE1C(struct SuperSonic *sonic);
static void sub_802C358(struct SuperSonic *sonic);
static void sub_802C480(struct SuperSonic *);
static void sub_802C55C(struct SuperSonic *);
static void Task_802C7E8(void);
static void sub_802C828(struct SuperSonic *);
static void sub_802C8A0(struct SuperSonic *sonic);
static void sub_802C8EC(struct SuperSonic *);
static void sub_802C92C(struct SuperSonic *sonic);
static void sub_802C9B0(struct SuperSonic *sonic);
static void sub_802BCCC(struct SuperSonic *sonic);
static u8 SuperSonicHandleDirectionalInput(struct SuperSonic *sonic);
static void sub_802C058(struct SuperSonic *sonic);
static void sub_802C988(struct SuperSonic *sonic);

#define RESERVED_SUPER_SONIC_TILES_VRAM (void *)(OBJ_VRAM0)
#define EXTRA_BOSS__INITIAL_RING_COUNT  50

struct Task *sSuperSonicTask = NULL;

extern const Vec2_32 gUnknown_080D650C[NUM_LEVEL_IDS];
extern const Vec2_32 gUnknown_080D661C[NUM_LEVEL_IDS];

const TileInfo gAnims_SuperSonic_080D69C8[23] = {
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 2 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 1 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 3 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 0 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 4 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 5 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 12 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 13 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 16 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 17 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 8 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 9 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 10 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 11 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 6 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 7 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 14 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 15 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 18 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 19 },
    { 0, SA2_ANIM_SUPER_SONIC_FROZEN, 0 },
    { 0, SA2_ANIM_CHAR(SA2_CHAR_ANIM_29, CHARACTER_SONIC), 0 },
    { 0, SA2_ANIM_SUPER_SONIC_STOPPING_ROCKET, 2 },
};

static void SuperSonicInitPlayer(void)
{
    Player *p = &gPlayer;
    p->unk4 = 0;
    p->x = 0;
    p->y = 0;
    p->speedAirX = 0;
    p->speedAirY = 0;
    p->speedGroundX = 0;
    p->unk16 = 0;
    p->unk17 = 0;
    // /* 0x18 */ u8 filler18[8]; // no idea what this data is and why it's not set
    p->moveState = 0;
    p->rotation = 0;
    p->unk25 = 0;
    p->spindashAccel = 0;
    // /* 0x28 */ u8 unk28;
    // /* 0x29 */ u8 unk29;
    p->unk2A = 0;
    p->timerInvulnerability = 0;
    p->timerInvincibility = 0;
    p->timerSpeedup = 0;
    p->unk32 = 0;
    p->unk34 = 0;
    p->unk36 = 0;
    p->itemEffect = 0;
    p->unk38 = 0;
    p->unk3C = NULL;
    p->unk40 = 0;
    p->unk44 = 0;
    p->unk48 = 0;
    p->unk4C = 0;
    p->unk50 = 0;
    p->unk52 = 0;
    p->unk54 = 0;
    p->unk56 = 0;
    p->unk58 = 0;
    p->unk5A = 0;
    p->unk5B = 0;
    p->unk5C = 0;
    p->unk5E = 0;
    p->unk60 = 0;
    p->unk61 = 0;
    p->unk62 = 0;
    p->unk63 = 0;
    p->unk64 = 0;
    p->unk66 = 0;
    p->anim = 0;
    p->variant = 0;
    p->unk6C = 0;
    p->transition = 0;
    p->unk6E = 0;
    p->prevTransition = 0;
    p->unk70 = 0;
    p->unk71 = 0;
    p->unk72 = 0;
    p->checkPointX = 0;
    p->checkPointY = 0;
    p->checkpointTime = 0;
    p->unk7C = 0;
    p->unk7E = 0;
    p->unk80 = 0;
    p->unk82 = 0;
    p->defeatScoreIndex = 0;
    p->character = CHARACTER_SONIC;
    p->unk86 = 0;
    p->unk87 = 0;
    p->unk88 = 0;
}

void SuperSonicInit()
{
    struct Task *t;
    struct SuperSonic *sonic;
    Sprite *spr;

    SuperSonicInitPlayer();
    gRingCount = EXTRA_BOSS__INITIAL_RING_COUNT;

    gPlayer.moveState = 0;
    gPlayer.checkpointTime = 0;
    gPlayer.speedAirX = Q_24_8(2.0);
    gPlayer.speedGroundX = Q_24_8(2.0);

    gCourseTime = 0;

    t = TaskCreate(Task_802BC10, sizeof(struct SuperSonic), 0x4040, 0, NULL);
    sSuperSonicTask = t;
    sonic = TASK_DATA(t);

    sonic->flags = SUPER_FLAG__20;
    sonic->worldX = Q_24_8(600);
    sonic->worldY = Q_24_8(288);
    sonic->unk10 = 0;
    sonic->unk14 = 0;
    sonic->unk1A = 0;
    sonic->rotation = 0;
    sonic->unk20 = 0;
    sonic->unkC = 300;
    sonic->unk22 = 0;
    sonic->func24 = sub_802C828;
    sonic->unk128 = 0;
    sonic->rawKeys = gInput;
    sonic->pressedKeys = gPressedKeys;
    sonic->shouldDestroy = FALSE;

    spr = &sonic->spr;
    spr->graphics.dest = RESERVED_SUPER_SONIC_TILES_VRAM;
    spr->graphics.anim = gAnims_SuperSonic_080D69C8[0].anim;
    spr->variant = gAnims_SuperSonic_080D69C8[0].variant;
    spr->unk1A = SPRITE_OAM_ORDER(8);
    spr->graphics.size = 0;
    spr->x = 0;
    spr->y = 0;
    spr->animCursor = 0;
    spr->timeUntilNextFrame = 0;
    spr->prevVariant = -1;
    spr->animSpeed = SPRITE_ANIM_SPEED(1.0);
    spr->palId = 0;
    spr->hitboxes[0].index = -1;
    spr->hitboxes[1].index = -1;
    spr->unk10 = (SPRITE_FLAG(PRIORITY, 1) | SPRITE_FLAG_MASK_X_FLIP);
}

void sub_802B81C(void)
{
    struct SuperSonic *sonic;

    if (!sSuperSonicTask) {
        return;
    }

    sonic = TASK_DATA(sSuperSonicTask);
    sSuperSonicTask->main = Task_802C7E8;
    sonic->func24 = sub_802C8A0;

    SUPER_SWITCH_ANIM(sonic, 2);
}

static s32 sub_802B8A8(struct SuperSonic *sonic)
{
    s32 zero = 0;

    if (!(sonic->flags & SUPER_FLAG__10) && !(gUnknown_03005424 & EXTRA_STATE__100)) {
        if (gCourseTime >= MAX_COURSE_TIME && !gLoadedSaveGame->timeLimitDisabled) {
            gPlayer.moveState = MOVESTATE_DEAD;

            sonic->func24 = sub_802C8EC;
            sonic->unkC = 60;
            sonic->unk1A = 0;
            sonic->rotation = 0x100;
            sonic->flags = SUPER_FLAG__10;

            SUPER_SWITCH_ANIM(sonic, 21);
        } else if (!(sonic->flags & SUPER_FLAG__200)) {
            if (Mod(gStageTime, GBA_FRAMES_PER_SECOND) == 0) {
                if (gRingCount == 0) {
                    u32 flags;
                    gPlayer.moveState = MOVESTATE_DEAD;

                    flags = SUPER_FLAG__10;

                    sonic->func24 = sub_802C8EC;
                    sonic->unkC = 60;
                    sonic->unk1A = 0;
                    sonic->rotation = Q_24_8(1.0);
                    sonic->flags = flags;

                    SUPER_SWITCH_ANIM(sonic, 21);

                    m4aSongNumStart(SE_LIFE_LOST);
                } else {
                    gRingCount--;
                }
            }
        } else {
            if (ExtraBossIsDead() == TRUE) {
                gUnknown_03005424 |= (EXTRA_STATE__ACT_START | EXTRA_STATE__2);
                sonic->func24 = sub_802C8A0;

                SUPER_SWITCH_ANIM(sonic, 2);
            }
        }
    }

#ifndef NON_MATCHING
    asm("" ::"r"(zero));
#endif

    return 0;
}

bool32 sub_802BA8C(void)
{
    struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);

    if (ExtraBossIsDead() == TRUE) {
        return FALSE;
    }
    if (sonic->flags & SUPER_FLAG__10) {
        return FALSE;
    }
    if (sonic->flags & SUPER_FLAG__80) {
        return FALSE;
    }
    if (sonic->flags & SUPER_FLAG__200) {
        return FALSE;
    }

    sonic->func24 = sub_802C480;
    sonic->unk20 = 120;
    sonic->unkC = 48;
    sonic->rotation = 0x200;

    sonic->flags &= ~SUPER_FLAG__1;
    sonic->flags &= ~SUPER_FLAG__2;
    sonic->flags &= ~SUPER_FLAG__8;
    sonic->flags &= ~SUPER_FLAG__40;
    sonic->flags |= SUPER_FLAG__4;
    sonic->flags |= SUPER_FLAG__80;

    SUPER_SWITCH_ANIM(sonic, 3);

    return TRUE;
}

void sub_802BB54(void)
{
    struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);

    if (ExtraBossIsDead() == TRUE) {
        return;
    }
    if (sonic->flags & SUPER_FLAG__10) {
        return;
    }
    if (sonic->flags & SUPER_FLAG__80) {
        return;
    }
    if (sonic->flags & SUPER_FLAG__8) {
        return;
    }

    sonic->func24 = sub_802C55C;
    sonic->unk1A = 0;
    sonic->unkC = 300;
    sonic->rotation = 0;

    sonic->flags &= ~SUPER_FLAG__1;
    sonic->flags &= ~SUPER_FLAG__2;
    sonic->flags |= SUPER_FLAG__8;

    SUPER_SWITCH_ANIM(sonic, 20);

    return;
}

static void Task_802BC10(void)
{
    struct SuperSonic *sonic = TASK_DATA(gCurTask);
    sub_802BCCC(sonic);
    sonic->func24(sonic);
    sub_802C9B0(sonic);
    sub_802B8A8(sonic);

    if (sonic->shouldDestroy) {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;

        if ((gNumLives != 0) && (--gNumLives != 0)) {
            if (gCourseTime >= MAX_COURSE_TIME) {
                CreateGameOverScreen(OVER_CAUSE_TIME_UP);
            } else {
                GameStageStart();
            }
        } else {
            CreateGameOverScreen(OVER_CAUSE_ZERO_LIVES);
        }
    } else {
        sub_802BE1C(sonic);
    }
}

// (99.25%) https://decomp.me/scratch/2dbbE
NONMATCH("asm/non_matching/game/super_sonic__sub_802BCCC.inc",
         static void sub_802BCCC(struct SuperSonic *sonic))
{
    s32 ssx, ssx2;
    u8 i;
    u8 *id;
    u8 id2;
    Vec2_32 *idk;

    if (!(sonic->flags & SUPER_FLAG__10)) {
        sonic->worldX += Q_24_8(5);
    }

    ssx = sonic->worldX;
    if ((sonic->unk20 == 0) || (--sonic->unk20 == 0)) {
        sonic->flags &= ~SUPER_FLAG__80;
    }
    // _0802BD0E

    ssx2 = Q_24_8(gUnknown_080D650C[gCurrentLevel].x);
    id = &sonic->unk128;

    if (ssx >= ssx2) {
        s32 someX, someY;
        someX = (gUnknown_080D661C[gCurrentLevel].x);
        someY = (gUnknown_080D661C[gCurrentLevel].y);

        ssx += Q_24_8(someX);
        sub_804D594(Q_24_8(someX), Q_24_8(someY));

        for (i = 0; i < ARRAY_COUNT(sonic->unk28); i++) {
            sonic->unk28[i].x += Q_24_8(someX);
            sonic->unk28[i].y += Q_24_8(someY);
        }

        gBossRingsShallRespawn = TRUE;
        gCamera.x += someX;
        gCamera.unk20 += someX;
        gCamera.unk10 += someX;
        gCamera.y += someY;
        gCamera.unk24 += someY;
        gCamera.unk14 += someY;
    }
    // _0802BDAA

    if (sonic->func24 != sub_802C8A0) {
        if (ssx < (Q_24_8(gCamera.unk10) + Q_24_8(8))) {
            ssx = Q_24_8(gCamera.unk10) + Q_24_8(8);
        } else if (ssx > (Q_24_8(gCamera.unk10) + Q_24_8(312))) {
            ssx = Q_24_8(gCamera.unk10) + Q_24_8(312);
        }
    }
    sonic->worldX = ssx;

    id2 = *id;
    sonic->unk28[id2].x = sonic->worldX;
    sonic->unk28[id2].y = sonic->worldY;
    *id = (id2 + 1) % ARRAY_COUNT(sonic->unk28);
}
END_NONMATCH

static void sub_802BE1C(struct SuperSonic *sonic)
{
    u8 i;
    s32 prio;
    u8 *unk128;
    Sprite *spr;
    SpriteTransform *transform;

    if (sonic->flags & SUPER_FLAG__40) {
        return;
    }

    if (((sonic->flags & (SUPER_FLAG__80 | SUPER_FLAG__2)) == SUPER_FLAG__80)
        && (gStageTime & 0x4)) {
        return;
    }
    if ((sonic->flags & SUPER_FLAG__4) && ((gStageTime & 0x4) != 0)) {
        return;
    }

    spr = &sonic->spr;
    transform = &sonic->transform;

    spr->x = Q_24_8_TO_INT(sonic->worldX) - gCamera.x + Q_24_8_TO_INT(sonic->unk10);
    spr->y = Q_24_8_TO_INT(sonic->worldY) - gCamera.y + Q_24_8_TO_INT(sonic->unk14);

    prio = (sonic->flags & SUPER_FLAG__200) ? 3 : 0;

    if (sonic->flags & 0x4) {
        spr->unk10 = SPRITE_FLAG(PRIORITY, prio) | gUnknown_030054B8++
            | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;
    } else {
        spr->unk10 = SPRITE_FLAG(PRIORITY, prio) | SPRITE_FLAG_MASK_X_FLIP;
    }
    UpdateSpriteAnimation(spr);

    if (sonic->flags & SUPER_FLAG__4) {
        transform->rotation = (COS((sonic->unkC * 20) & ONE_CYCLE) >> 4) & ONE_CYCLE;
        transform->width = Q_24_8(1.0);
        transform->height = Q_24_8(1.0);
        transform->x = spr->x;
        transform->y = spr->y;
        sub_8004860(spr, transform);
        DisplaySprite(spr);
    } else {
        DisplaySprite(spr);

        if (((sonic->flags & (SUPER_FLAG__80 | SUPER_FLAG__2)) == SUPER_FLAG__80)) {
            return;
        }

        if (sonic->flags & (SUPER_FLAG__200 | SUPER_FLAG__10 | SUPER_FLAG__8)) {
            return;
        }

        i = 0;
        unk128 = &sonic->unk128;
        for (; i < SUPER_SONIC_AFTERIMAGE_COUNT; i++) {
            if (Mod(gStageTime, i + 2) == 0) {
                s32 ii = (i + 1) * 3;

                u32 r2 = (*unk128 - ii) % 32u;
                spr->x = Q_24_8_TO_INT(sonic->unk28[r2].x) - gCamera.x;
                spr->y = Q_24_8_TO_INT(sonic->unk28[r2].y) - gCamera.y;
                DisplaySprite(spr);
            }
        }
    }
}

static u8 SuperSonicHandleDirectionalInput(struct SuperSonic *sonic)
{
    sonic->rawKeys = gInput;
    sonic->pressedKeys = gPressedKeys;

    if (sonic->rawKeys & DPAD_LEFT) {
        if (sonic->rawKeys & DPAD_UP) {
            sonic->rotation = Q_24_8(2.5);
            return 16;
        } else if (sonic->rawKeys & DPAD_DOWN) {
            sonic->rotation = Q_24_8(1.5);
            return 12;
        } else {
            sonic->rotation = Q_24_8(2.0);
            return 6;
        }
    } else if (sonic->rawKeys & DPAD_RIGHT) {
        if (sonic->rawKeys & DPAD_UP) {
            sonic->rotation = Q_24_8(3.5);
            return 18;
        } else if (sonic->rawKeys & DPAD_DOWN) {
            sonic->rotation = Q_24_8(0.5);
            return 14;
        } else {
            sonic->rotation = Q_24_8(0.0);
            return 4;
        }
    } else if (sonic->rawKeys & DPAD_UP) {
        sonic->rotation = Q_24_8(3.0);
        return 8;
    } else if (!(sonic->rawKeys & DPAD_DOWN)) {
        return 0;
    } else {
        sonic->rotation = Q_24_8(1.0);
        return 10;
    }
}

static void sub_802C058(struct SuperSonic *sonic)
{
    u32 dir;
    Sprite *spr = &sonic->spr;
    spr->hitboxes[1].index = -1;

    dir = SuperSonicHandleDirectionalInput(sonic);
    if (dir) {
        sonic->unk1A = ABS(sonic->unk1A);
        sonic->unk1A += 0x40;

        if (sonic->unk1A > Q_24_8(2.5)) {
            sonic->unk1A = Q_24_8(2.5);
        }

        if (sonic->rawKeys & DPAD_UP) {
            if (sonic->spr.variant != 1) {
                SUPER_SWITCH_ANIM(sonic, 1);
            }
        } else if (sonic->rawKeys & DPAD_DOWN) {
            if (sonic->spr.variant != 3) {
                SUPER_SWITCH_ANIM(sonic, 2);
            }
        } else {
            if (sonic->spr.variant != 2) {
                SUPER_SWITCH_ANIM(sonic, 0);
            }
        }
    } else {
        if (sonic->unk1A < 0) {
            sonic->unk1A += 0x40;
            if (sonic->unk1A >= 0) {
                sonic->unk1A = 0;
                sonic->rotation = 0;
            }
        } else if (sonic->unk1A > 0) {
            sonic->unk1A -= 0x40;
            if (sonic->unk1A <= 0) {
                sonic->unk1A = 0;
                sonic->rotation = 0;
            }
        }

        if (sonic->spr.variant != 2) {
            SUPER_SWITCH_ANIM(sonic, 0);
        }
        sonic->worldX -= Q_24_8(0.5);
    }

    if (sonic->pressedKeys & (A_BUTTON | B_BUTTON)) {
        sonic->func24 = sub_802C358;
        sonic->unkC = 20;
        sonic->flags &= ~SUPER_FLAG__1;
        sonic->flags |= (SUPER_FLAG__80 | SUPER_FLAG__2);
        m4aSongNumStart(SE_SONIC_MIDAIR_SOMERSAULT);

        if (dir != 0) {
            SUPER_SWITCH_ANIM(sonic, dir);
        } else {
            sonic->rotation = 0;

            SUPER_SWITCH_ANIM(sonic, 4);
        }
    }

    sonic->worldX += (COS(sonic->rotation) * sonic->unk1A) >> 14;
    sonic->worldY += (SIN(sonic->rotation) * sonic->unk1A) >> 14;
}

static void sub_802C358(struct SuperSonic *sonic)
{
    Sprite *spr;

    if (--sonic->unkC == 0) {
        spr = &sonic->spr;
        sonic->func24 = sub_802C058;
        sonic->flags &= ~SUPER_FLAG__2;
        sonic->flags |= SUPER_FLAG__1;
        spr->hitboxes[1].index = -1;

        SUPER_SWITCH_ANIM(sonic, 0);
    }

    if (sonic->unkC == 8) {
        sonic->spr.graphics.anim
            = gAnims_SuperSonic_080D69C8[sonic->tileInfoId + 1].anim;
        sonic->spr.variant = gAnims_SuperSonic_080D69C8[sonic->tileInfoId + 1].variant;
        sonic->spr.prevVariant = -1;
        sonic->flags &= ~SUPER_FLAG__80;
    } else if (sonic->unkC > 8) {
        sonic->flags |= SUPER_FLAG__80;
    }

    sonic->unk1A = (SIN(sonic->unkC * 12) * 3) >> 5;
    sonic->worldX += (COS(sonic->rotation) * sonic->unk1A) >> 14;
    sonic->worldY += (SIN(sonic->rotation) * sonic->unk1A) >> 14;
}

static void sub_802C480(struct SuperSonic *sonic)
{
    Sprite *spr;

    if (--sonic->unkC == 0) {
        sonic->func24 = sub_802C058;
        sonic->flags &= ~SUPER_FLAG__4;
        sonic->flags |= SUPER_FLAG__1;

        SUPER_SWITCH_ANIM(sonic, 0);
    }

    spr = &sonic->spr;
    spr->hitboxes[0].index = -1;
    spr->hitboxes[1].index = -1;

    sonic->unk1A = (SIN(sonic->unkC * 5) * 3) >> 5;
    sonic->worldX += (COS(sonic->rotation) * sonic->unk1A) >> 14;
    sonic->worldY += (SIN(sonic->rotation) * sonic->unk1A) >> 14;
}

static void sub_802C55C(struct SuperSonic *sonic)
{
    SuperSonicHandleDirectionalInput(sonic);

#ifndef NON_MATCHING
    sonic->unk10 = -((sonic->unk10 * 55) << 1) >> 7;
    sonic->unk14 = -((sonic->unk14 * 55) << 1) >> 7;
#else
    sonic->unk10 = -(sonic->unk10 * 110) / 128;
    sonic->unk14 = -(sonic->unk14 * 110) / 128;
#endif

    if (--sonic->unkC == 0) {
        sonic->func24 = sub_802C058;
        sonic->flags &= ~SUPER_FLAG__8;
        sonic->flags |= SUPER_FLAG__1;

        SUPER_SWITCH_ANIM(sonic, 0);
    } else if (sonic->pressedKeys & (DPAD_ANY | A_BUTTON | B_BUTTON)) {
        if (sonic->unkC <= 4) {
            sonic->unkC = 1;
        } else {
            sonic->unkC -= 4;
        }

        if (++sonic->unk22 > 4) {
            sonic->unk22 = 0;
            sonic->unk10 = (PseudoRandom32() % 0x1000u) - (0x800 - 1);
            sonic->unk14 = (PseudoRandom32() % 0x1000u) - (0x800 - 1);
        }
    }
}

void SuperSonicGetPos(s32 *outX, s32 *outY)
{
    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);

        *outX = sonic->worldX;
        *outY = sonic->worldY;

        if (!(sonic->flags & SUPER_FLAG__10)) {
            gPlayer.moveState = 0;
        } else {
            gPlayer.moveState = MOVESTATE_DEAD;
        }
    } else {
        *outX = 0;
        *outY = 0;

        gPlayer.moveState = MOVESTATE_DEAD;
    }
}

void SuperSonicSetPos(s32 x, s32 y)
{
    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);

        if (!(sonic->flags & SUPER_FLAG__10)) {
            sonic->worldX = x;
            sonic->worldY = y;
        }
    }
}

u32 SuperSonicGetFlags()
{
    u32 result = 0;

    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);
        result = sonic->flags;
    }

    return result;
}

void sub_802C704(u8 index, s32 *outX, s32 *outY)
{
    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);

        s32 posIndex = (sonic->unk128 - index) % ARRAY_COUNT(sonic->unk28);
        *outX = sonic->unk28[posIndex].x;
        *outY = sonic->unk28[posIndex].y;
    }
}

Sprite *SuperSonicGetSprite(void)
{
    Sprite *spr = NULL;

    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);
        spr = &sonic->spr;
    }

    return spr;
}

u16 SuperSonicGetRotation(void)
{
    u16 result = 0;

    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);
        result = sonic->rotation & ONE_CYCLE;
    }

    return result;
}

void sub_802C798(void)
{
    struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);

    if ((ExtraBossIsDead() != TRUE) && !(sonic->flags & SUPER_FLAG__10)) {
        sonic->func24 = sub_802C92C;
        sonic->unkC = 20;
        sonic->rotation = 0;
        sonic->flags &= ~SUPER_FLAG__1;
        sonic->flags &= ~SUPER_FLAG__2;
        sonic->flags &= ~SUPER_FLAG__8;
        sonic->flags |= SUPER_FLAG__200;
        sonic->flags |= SUPER_FLAG__80;
    }
}

static void Task_802C7E8(void)
{
    struct SuperSonic *sonic = TASK_DATA(gCurTask);

    sub_802BCCC(sonic);

    if (sonic->func24 != sub_802C8A0) {
        sonic->func24 = sub_802C8A0;
    }

    sonic->func24(sonic);
    sub_802C9B0(sonic);
    sub_802BE1C(sonic);
}

static void sub_802C828(struct SuperSonic *sonic)
{
    s32 x, y;

    if (!(gUnknown_03005424 & EXTRA_STATE__100)) {
        if (--sonic->unkC == 0) {
            sonic->func24 = sub_802C058;
            sonic->flags &= ~SUPER_FLAG__20;
            sonic->flags |= SUPER_FLAG__1;
        }

        x = Q_24_8(gCamera.x + 80);
        y = Q_24_8(gCamera.y + 90);

        sonic->worldX += Div(((x - sonic->worldX) * 3), 100);
        sonic->worldY += Div(((y - sonic->worldY) * 3), 100);
    }
}

static void sub_802C8A0(struct SuperSonic *sonic)
{
    s32 x, y;

    sonic->flags &= ~SUPER_FLAG__4;

    x = Q_24_8(gCamera.x + (DISPLAY_WIDTH + 76));
    y = Q_24_8(gCamera.y + (DISPLAY_HEIGHT / 2));

    sonic->worldX += Div((x - sonic->worldX), 100);
    sonic->worldY += Div((y - sonic->worldY), 100);
}

static void sub_802C8EC(struct SuperSonic *sonic)
{
    Sprite *spr = &sonic->spr;
    spr->unk10 = SPRITE_FLAG(PRIORITY, 2);

    sonic->unk1A += Q_24_8(0.125);
    sonic->worldY += sonic->unk1A;

    if ((Q_24_8_TO_INT(sonic->worldY) - gCamera.y) > DISPLAY_HEIGHT) {
        sonic->shouldDestroy = TRUE;
    }
}

static void sub_802C92C(struct SuperSonic *sonic)
{
    if (--sonic->unkC == 0) {
        sonic->func24 = sub_802C988;
        sonic->flags |= SUPER_FLAG__40;
        sonic->unkC = 100;
    }

    sonic->unk1A = Q_24_8(1.0);
    sonic->worldX += Q_24_8_TO_INT(COS(sonic->rotation) * 4);
    sonic->worldY += Q_24_8_TO_INT(SIN(sonic->rotation) * 4);
}

static void sub_802C988(struct SuperSonic *sonic)
{
    if (--sonic->unkC == 0) {
        sonic->flags &= ~SUPER_FLAG__40;
        sonic->flags &= ~SUPER_FLAG__200;
        sub_802BA8C();
    }
}

static void sub_802C9B0(struct SuperSonic *sonic)
{
    if (!(sonic->flags & (SUPER_FLAG__20 | SUPER_FLAG__10))) {
#ifndef NON_MATCHING
        CLAMP_INLINE_NO_ELSE(sonic->worldY, Q_24_8(50), Q_24_8(254));
#else
        CLAMP_INLINE(sonic->worldY, Q_24_8(50), Q_24_8(254));
#endif
    }
}

bool32 sub_802C9E0(void) { return FALSE; }