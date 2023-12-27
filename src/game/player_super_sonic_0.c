#include "global.h"
#include "sakit/globals.h"
#include "sakit/camera.h"
#include "sakit/player.h"
#include "game/player_super_sonic.h"
#include "game/game_over.h"
#include "game/save.h"
#include "game/stage/stage.h"
#include "game/bosses/boss_9.h"

#include "lib/m4a.h"

#include "constants/characters.h"
#include "constants/songs.h"

void Task_802BC10(void);
void sub_802C9B0(struct SuperSonic *);
void sub_802BCCC(struct SuperSonic *);
void sub_802BE1C(struct SuperSonic *);
void sub_802C480(struct SuperSonic *);
void sub_802C55C(struct SuperSonic *);
void Task_802C7E8(void);
void sub_802C828(struct SuperSonic *);
void sub_802C8A0(struct SuperSonic *);
void sub_802C8EC(struct SuperSonic *);

extern struct Task *sSuperSonicTask;
extern const TileInfo gAnims_SuperSonic_080D69C8[23];
extern const Vec2_32 gUnknown_080D650C[NUM_LEVEL_IDS];
extern const Vec2_32 gUnknown_080D661C[NUM_LEVEL_IDS];

#define RESERVED_SUPER_SONIC_TILES_VRAM (void *)(OBJ_VRAM0)
#define EXTRA_BOSS__INITIAL_RING_COUNT  50

void SuperSonicInitPlayer(void)
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
    p->unk2C = 0;
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
    sonic->unk4 = Q_24_8(600);
    sonic->unk8 = Q_24_8(288);
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
    sonic->unk129 = FALSE;

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

int sub_802B8A8(struct SuperSonic *sonic)
{
    int zero = 0;

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
                    int ten;
                    gPlayer.moveState = MOVESTATE_DEAD;
                    ten = SUPER_FLAG__10;

                    sonic->func24 = sub_802C8EC;
                    sonic->unkC = 60;
                    sonic->unk1A = 0;
                    sonic->rotation = 0x100;
                    sonic->flags = ten;

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

void Task_802BC10(void)
{
    struct SuperSonic *sonic = TASK_DATA(gCurTask);
    sub_802BCCC(sonic);
    sonic->func24(sonic);
    sub_802C9B0(sonic);
    sub_802B8A8(sonic);

    if (sonic->unk129) {
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
         void sub_802BCCC(struct SuperSonic *sonic))
{
    s32 ssx, ssx2;
    u8 i;
    u8 *id;
    u8 id2;
    Vec2_32 *idk;

    if (!(sonic->flags & SUPER_FLAG__10)) {
        sonic->unk4 += Q_24_8(5);
    }

    ssx = sonic->unk4;
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
    sonic->unk4 = ssx;

    id2 = *id;
    sonic->unk28[id2].x = sonic->unk4;
    sonic->unk28[id2].y = sonic->unk8;
    *id = (id2 + 1) & 0x1F;
}
END_NONMATCH
