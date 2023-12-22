#include "global.h"
#include "sakit/globals.h"
#include "sakit/player.h"
#include "game/player_super_sonic.h"
#include "game/save.h"
#include "game/bosses/boss_9.h"

#include "lib/m4a.h"

#include "constants/characters.h"
#include "constants/songs.h"

void Task_802BC10(void);
void Task_802C7E8(void);
void sub_802C828(struct SuperSonic *);
void sub_802C8A0(struct SuperSonic *);
void sub_802C8EC(struct SuperSonic *);

extern struct Task *sSuperSonicTask;
extern const TileInfo gAnims_SuperSonic_080D69C8[23];

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

void sub_802B708()
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

    sonic->unk0 = 0x20;
    sonic->unk4 = 0x25800; // = 153600
    sonic->unk8 = 0x12000; // =  73728
    sonic->unk10 = 0;
    sonic->unk14 = 0;
    sonic->unk1A = 0;
    sonic->unk18 = 0;
    sonic->unk20 = 0;
    sonic->unkC = 300;
    sonic->unk22 = 0;
    sonic->func24 = sub_802C828;
    sonic->unk128 = 0;
    sonic->rawKeys = gInput;
    sonic->pressedKeys = gPressedKeys;
    sonic->unk129 = 0;

    spr = &sonic->spr134;
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

    sonic->tileInfoId = 2;
    sonic->spr134.graphics.anim = gAnims_SuperSonic_080D69C8[2].anim;
    sonic->spr134.variant = gAnims_SuperSonic_080D69C8[2].variant;

    sonic->spr134.prevVariant = -1;
    sonic->spr134.graphics.size = 0;
    sonic->spr134.animCursor = 0;
    sonic->spr134.timeUntilNextFrame = 0;

    sonic->unk10 = 0;
    sonic->unk14 = 0;
    sonic->unk22 = 0;
}

#if 001
int sub_802B8A8(struct SuperSonic *sonic)
{
    int zero = 0;

    if (!(sonic->unk0 & 0x10) && !(gUnknown_03005424 & EXTRA_STATE__100)) {
        if (gCourseTime >= MAX_COURSE_TIME && !gLoadedSaveGame->timeLimitDisabled) {
            Sprite *spr;
            // _0802B8CC+0x14
            gPlayer.moveState = MOVESTATE_DEAD;

            sonic->func24 = sub_802C8EC;
            sonic->unkC = 60;
            sonic->unk1A = 0;
            sonic->unk18 = 0x100;
            sonic->unk0 = 0x10;

            sonic->tileInfoId = 21;
            sonic->spr134.graphics.anim = gAnims_SuperSonic_080D69C8[21].anim;
            sonic->spr134.variant = gAnims_SuperSonic_080D69C8[21].variant;

            sonic->spr134.prevVariant = -1;
            sonic->spr134.graphics.size = 0;
            sonic->spr134.animCursor = 0;
            sonic->spr134.timeUntilNextFrame = 0;

            sonic->unk10 = 0;
            sonic->unk14 = 0;
            sonic->unk22 = 0;
        } else if (!(sonic->unk0 & 0x200)) {
            // _0802B964
            if (Mod(gStageTime, GBA_FRAMES_PER_SECOND) == 0) {
                if (gRingCount == 0) {
                    int ten;
                    gPlayer.moveState = MOVESTATE_DEAD;
                    ten = 0x10;

                    sonic->func24 = sub_802C8EC;
                    sonic->unkC = 60;
                    sonic->unk1A = 0;
                    sonic->unk18 = 0x100;
                    sonic->unk0 = ten;

                    sonic->tileInfoId = 21;
                    sonic->spr134.graphics.anim = gAnims_SuperSonic_080D69C8[21].anim;
                    sonic->spr134.variant = gAnims_SuperSonic_080D69C8[21].variant;

                    sonic->spr134.prevVariant = -1;
                    sonic->spr134.graphics.size = 0;
                    sonic->spr134.animCursor = 0;
                    sonic->spr134.timeUntilNextFrame = 0;

                    sonic->unk10 = 0;
                    sonic->unk14 = 0;
                    sonic->unk22 = 0;

                    m4aSongNumStart(SE_LIFE_LOST);
                } else {
                    // _0802BA08
                    gRingCount--;
                }
            }
        } else {
            if (ExtraBossIsDead() == TRUE) {
                // _0802BA0E+6
                gUnknown_03005424 |= (EXTRA_STATE__ACT_START | EXTRA_STATE__2);
                sonic->func24 = sub_802C8A0;

                sonic->tileInfoId = 2;
                sonic->spr134.graphics.anim = gAnims_SuperSonic_080D69C8[2].anim;
                sonic->spr134.variant = gAnims_SuperSonic_080D69C8[2].variant;

                sonic->spr134.prevVariant = -1;
                sonic->spr134.graphics.size = 0;
                sonic->spr134.animCursor = 0;
                sonic->spr134.timeUntilNextFrame = 0;

                sonic->unk10 = 0;
                sonic->unk14 = 0;
                sonic->unk22 = 0;
            }
        }
    }

#ifndef NON_MATCHING
    asm("" ::"r"(zero));
#endif

    return 0;
}
#endif