#include "global.h"
#include "flags.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a/m4a.h"
#include "game/sa1_sa2_shared/camera.h"
#include "game/sa1_sa2_shared/collision.h"

#include "game/game.h" // sub_801E4E4

#include "game/player_callbacks.h"
#include "game/stage/player.h"
#include "game/stage/terrain_collision.h"

#include "game/entity.h" // Coll_Player_Entity_Intersection
#include "game/bosses/common.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/parameters/bosses.h"

#include "game/stage/screen_shake.h"
#include "game/stage/boss_results_transition.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/songs.h"
#include "constants/zones.h"

#define NUM_TAIL_SEGMENTS 3

#define PAL_BOSS_4_DEFAULT 0
#define PAL_BOSS_4_HIT     1

// TODO: Probably these will be globally automated in the long run?
#define AEROEGG_PILOT_OFFSET_X   (0)
#define AEROEGG_PILOT_OFFSET_Y   (-14)
#define AEROEGG_TAILTIP_OFFSET_X (0)
#define AEROEGG_TAILTIP_OFFSET_Y (20)

#define AEROEGG_COOLDOWN_NORMAL ZONE_TIME_TO_INT(0, 2. + (1. / 3.))
#define AEROEGG_COOLDOWN_PINCH  ZONE_TIME_TO_INT(0, 1. + (1. / 3.))

#define RESERVED_EXPLOSION_TILES_VRAM (void *)(OBJ_VRAM0 + 0x2980)

static const u16 sPalAeroEggHit[2][PALETTE_LEN_4BPP] = {
    [PAL_BOSS_4_DEFAULT] = INCBIN_U16("graphics/boss_4_a.gbapal"),
    [PAL_BOSS_4_HIT] = INCBIN_U16("graphics/boss_4_b.gbapal"),
};

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s32 dx;
    /* 0x0C */ s32 dy;
    /* 0x10 */ bool32 status; // TODO: Is this actually 2 16bit values?
} AeroEggPart; /* size: 0x14 */

typedef struct {
    /* 0x000 */ s32 unk0;
    /* 0x004 */ s32 qWorldX;
    /* 0x008 */ s32 qWorldY;
    /* 0x00C */ s16 dx;
    /* 0x00E */ s16 dy;
    /* 0x010 */ u16 timerUnk;
    /* 0x012 */ u16 timerBombDrop;
    /* 0x014 */ u8 lives;
    /* 0x015 */ u8 unk15;
    /* 0x016 */ u8 unk16;
    /* 0x017 */ u8 unk17;
} AeroEggMain;

typedef struct {
    /* Full  Sub   */
    /* 0x018 0x00  */ u32 unk00;
    /* 0x01C 0x04  */ AeroEggPart body;
    /* 0x030 0x18  */ AeroEggPart tail[NUM_TAIL_SEGMENTS];
    /* 0x06C 0x54  */ AeroEggPart tailTip;
    /* 0x080 0x68  */ s8 unk68;
    /* 0x081 0x69  */ u8 unk69; // explosion parts count?
    /* 0x082 0x6A  */ u8 unk6A;
    /* 0x083 0x6B  */ u8 unk6B;
    /* 0x084 0x6C  */ u8 unk6C;
    /* 0x085 0x6D  */ u8 filler85[0x3];
    /* 0x088 0x70  */ Sprite sprBody;
    /* 0x0B8 0xA0  */ Hitbox reserved;
    /* 0x0C0 0xA8  */ Sprite sprPilot;
    /* 0x0F0 0xD8  */ Sprite sprTail;
    /* 0x120 0x108 */ Sprite sprTailTip;
    /* 0x150 0x138 */ void *tilesBomb;
} AeroEggSub;

typedef struct {
    /* 0x00 */ AeroEggMain main;
    /* 0x18 */ AeroEggSub sub;
} AeroEgg; /* size: 0x154 */

typedef struct {
    /* 0x00 */ u32 tAlive;
    /* 0x04 */ s32 screenX;
    /* 0x08 */ s32 screenY;
    /* 0x0C */ s16 dx;
    /* 0x0E */ s16 dy;
    /* 0x10 */ AeroEgg *boss;
    /* 0x14 */ Sprite s;
} AeroEggBomb; /* size: 0x44 */

typedef AeroEggBomb AeroEggDebris; /* size: 0x44 */

static void Task_CreateAeroEggBombMain(void);
static void Task_DeleteAeroEggBombTask(void);
static void Task_AeroEggBombDebris(void);
static void Task_AeroEggExploding(void);
static void Task_80426C4(void);
static void Task_DeleteAeroEggTask(void);
static void Task_AeroEggBombHitGround(void);
static void sub_8041B44(AeroEgg *boss);
static void sub_8041880(AeroEgg *boss);
static void sub_8041A08(AeroEgg *boss);
void sub_8041D34(AeroEgg *boss);
static void AeroEgg_CreateBombIfReady(AeroEgg *boss);
void AeroEgg_InitPartsDefeated(AeroEgg *boss);
static bool32 sub_80423EC(AeroEgg *boss);
static void sub_80424EC(AeroEgg *boss);
static void sub_8042560(AeroEgg *boss);
static void Task_AeroEggMain(void);
static void sub_8042774(AeroEgg *boss);
static void TaskDestructor_AeroEggMain(struct Task *t);

void CreateAeroEggBomb(AeroEgg *boss, s32 spawnX, s32 spawnY);
static void AeroEgg_UpdatePos(AeroEgg *boss);
static void AeroEgg_UpdatePartsAfterBossDefeated(AeroEgg *boss);
static void AeroEgg_UpdateBossSpritesOnDefeat(AeroEgg *boss);
static void CreateAeroEggBombDebris(AeroEgg *boss, s32 screenX, s32 screenY, s16 param3, u16 param4);

#define AE_DEFEATED_COLL_BODY(_sub, _part)                                                                                                 \
    {                                                                                                                                      \
        if (_sub->unk6B != 0) {                                                                                                            \
            if (--_sub->unk6B == 0) {                                                                                                      \
                _part.dy = 0;                                                                                                              \
                _part.status = 1;                                                                                                          \
            }                                                                                                                              \
                                                                                                                                           \
            CreateScreenShake(0x400, 0x20, 0x80, 0x14, SCREENSHAKE_VERTICAL | 0x3);                                                        \
        }                                                                                                                                  \
    }

#define AE_DEFEATED_COLL_PART(_part)                                                                                                       \
    {                                                                                                                                      \
        if (_part.dy > -48) {                                                                                                              \
            _part.dy = 0;                                                                                                                  \
            _part.status = 1;                                                                                                              \
        }                                                                                                                                  \
    }

#define AE_UPDATE_PART_DEFEATED(_sub, _part, _halfHeight, _dyNum, _dyDenom, CODE_ON_COLL)                                                  \
    if ((_sub->unk00 > 10) && (_part.status == 0)) {                                                                                       \
        _part.dy += 0x10;                                                                                                                  \
    }                                                                                                                                      \
    _part.x += _part.dx;                                                                                                                   \
    _part.y += _part.dy;                                                                                                                   \
                                                                                                                                           \
    res = sub_801E4E4(I(_part.y) + _halfHeight, I(_part.x), 1, 8, NULL, &sub_801EE64);                                                     \
                                                                                                                                           \
    if ((res <= 0) && (_part.dy >= 0)) {                                                                                                   \
        _part.y += Q(res);                                                                                                                 \
        _part.dy = Div((_part.dy * (_dyNum)), (_dyDenom));                                                                                 \
                                                                                                                                           \
        CODE_ON_COLL;                                                                                                                      \
                                                                                                                                           \
        _part.dx -= 8;                                                                                                                     \
        if (_part.dx < 0) {                                                                                                                \
            _part.dx = 0;                                                                                                                  \
        }                                                                                                                                  \
    } else if (_part.status != 0) {                                                                                                        \
        _part.y += Q(res);                                                                                                                 \
    }

void CreateAeroEgg(void)
{
    AeroEgg *boss;
    Sprite *s;

    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    sub_8039ED4();
    gPseudoRandom = gStageTime;
    gActiveBossTask = TaskCreate(Task_AeroEggMain, sizeof(AeroEgg), 0x4000, 0, TaskDestructor_AeroEggMain);
    boss = TASK_DATA(gActiveBossTask);

    if (DIFFICULTY_BOSS_IS_NOT_NORMAL) {
        boss->main.lives = BOSS4_LIVES_EASY;
    } else {
        boss->main.lives = BOSS4_LIVES_NORMAL;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->main.lives /= 2u;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->main.qWorldX = BOSS4_START_X_FINAL;
        boss->main.qWorldY = BOSS4_START_Y_FINAL;
    } else {
        boss->main.qWorldX = BOSS4_START_X;
        boss->main.qWorldY = BOSS4_START_Y;
    }

    boss->main.dx = BOSS4_VELOCITY_X;
    boss->main.dy = BOSS4_VELOCITY_Y;
    boss->main.unk15 = 0;
    boss->main.unk16 = 0;
    boss->main.timerBombDrop = 0;
    boss->main.unk0 = ZONE_TIME_TO_INT(0, 2);
    boss->main.timerUnk = 0;
    boss->main.unk17 = 0;

    boss->sub.tilesBomb = VramMalloc(45);

    s = &boss->sub.sprBody;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT_FLAGS(s, 8 * 8, SA2_ANIM_AERO_EGG_BODY, 0, 20, 2, SPRITE_FLAG_MASK_X_FLIP);

    s = &boss->sub.sprPilot;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT_FLAGS(s, 4 * 3, SA2_ANIM_HAMMERTANK_PILOT, 0, 21, 2, SPRITE_FLAG_MASK_X_FLIP);

    s = &boss->sub.sprTail;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 2 * 4, SA2_ANIM_AERO_EGG_ELEMENT, 0, 18, 2);
    UpdateSpriteAnimation(s);

    s = &boss->sub.sprTailTip;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 5 * 5, SA2_ANIM_AERO_EGG_PLATFORM, 0, 17, 2);
}

static void Task_AeroEggExploding(void)
{
    AeroEgg *boss = TASK_DATA(gCurTask);
    AeroEggSub *sub = &boss->sub;

    AeroEgg_UpdatePartsAfterBossDefeated(boss);
    sub_80424EC(boss);
    AeroEgg_UpdateBossSpritesOnDefeat(boss);
    sub_8042560(boss);
    sub_8041D34(boss);

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
    }

    if (sub->unk6C == 0) {
        if ((I(sub->body.x) - gCamera.x < 50) && (sub->unk68 != 0)) {
            sub->unk6C = 1;

            CreateEggmobileEscapeSequence(I(sub->body.x) - gCamera.x, I(sub->body.y) - gCamera.y - 15, SPRITE_FLAG(PRIORITY, 2));
        }
    }

    if ((I(boss->sub.body.x) - gCamera.x < -200) && (boss->sub.unk6C != 0)) {
        sub_802EF68(-40, 150, 3);
        gCurTask->main = Task_DeleteAeroEggTask;
    }
}

static void sub_8041880(AeroEgg *boss)
{

    u32 period;

    Sprite *s = &boss->sub.sprBody;
    u8 i;
    s->x = I(boss->main.qWorldX) - gCamera.x;
    s->y = I(boss->main.qWorldY) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->sub.sprPilot;
    s->x = I(boss->main.qWorldX) - gCamera.x - 0;
    s->y = I(boss->main.qWorldY) - gCamera.y - 14;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    for (i = 0; i < ARRAY_COUNT(boss->sub.tail); i++) {
        s32 sinV, cosV;
        s32 bossX, bossY;

        period = (u16)(SIN_24_8(((gStageTime * 12) + (i << 7)) & ONE_CYCLE) >> 3);
        s = &boss->sub.sprTail;

        bossX = I(boss->main.qWorldX) - gCamera.x;
        cosV = (COS((period + 500) & ONE_CYCLE) * 17);
        cosV *= (i + 1);
        cosV >>= 14;
        bossX += cosV;
        s->x = bossX;

        bossY = I(boss->main.qWorldY) - gCamera.y;
        sinV = (SIN((period + 500) & ONE_CYCLE) * 17);
        sinV *= (i + 1);
        sinV >>= 14;
        sinV += 0x14;
        bossY += sinV;
        s->y = bossY;

        DisplaySprite(s);
    }

    {
        s32 bossX, bossY;
        s32 sinV, cosV;
        period = (u16)(SIN_24_8(((gStageTime * 12) + 512) & ONE_CYCLE) >> 3);

        s = &boss->sub.sprTailTip;
        bossX = I(boss->main.qWorldX) - gCamera.x;
        cosV = (COS((period + 500) & ONE_CYCLE) * 15);
        cosV >>= 12;
        bossX += cosV;
        s->x = bossX;

        bossY = I(boss->main.qWorldY) - gCamera.y;
        sinV = (SIN((period + 500) & ONE_CYCLE) * 15);
        sinV >>= 12;
        sinV += 0x14;
        bossY += sinV;
        s->y = bossY;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

static void sub_8041A08(AeroEgg *boss)
{
    bool32 r7;
    Sprite *s;
    s32 worldX, worldY;
    u32 tVal;

    r7 = FALSE;

    tVal = (u16)(SIN_24_8((gStageTime * 12 + 0x200) & ONE_CYCLE) >> 3);
    s = &boss->sub.sprTailTip;
    worldX = AEROEGG_TAILTIP_OFFSET_X + I(boss->main.qWorldX) + ((COS((tVal + 500) & ONE_CYCLE) * 15) >> 12);
    worldY = AEROEGG_TAILTIP_OFFSET_Y + I(boss->main.qWorldY) + ((SIN((tVal + 500) & ONE_CYCLE) * 15) >> 12);

    if (boss->main.unk17 == 0) {
        Player *p = &gPlayer;

        if ((p->qSpeedAirY > 0) && (p->moveState & MOVESTATE_IN_AIR)) {
            if ((!Coll_Player_Entity_Intersection(s, worldX, worldY, p)) == COLL_NONE) {
                s16 v = -Q(4.75);
                p->qSpeedAirY = v;
                p->moveState &= ~(MOVESTATE_100 | MOVESTATE_STOOD_ON_OBJ);
                p->stoodObj = NULL;
                p->charState = CHARSTATE_JUMP_2;
                p->transition = 5;
                r7 = TRUE;
            }
        }

        if (++boss->main.timerUnk > ZONE_TIME_TO_INT(0, 5)) {
            r7 = TRUE;
        }

        if (r7) {
            s->graphics.anim = SA2_ANIM_AERO_EGG_PLATFORM;
            s->variant = 2;
            s->prevVariant = -1;
            boss->main.timerUnk = ZONE_TIME_TO_INT(0, 5);
            boss->main.unk17 = TRUE;
        }
    } else {
        if (--boss->main.timerUnk == 18) {
            AnimId anim = SA2_ANIM_AERO_EGG_PLATFORM;
            s->graphics.anim = anim;
            s->variant = 3;
            s->prevVariant = -1;
        }

        if (boss->main.timerUnk == 0) {
            boss->main.unk17 = FALSE;
        }
    }
}

static void sub_8041B44(AeroEgg *boss)
{
    Sprite *s;

    if (boss->main.unk16 == 0) {
        s32 worldX = I(boss->main.qWorldX);
        s32 worldY = I(boss->main.qWorldY);

        s = &boss->sub.sprBody;

        if (PLAYER_IS_ALIVE) {
            if (Coll_Player_Boss_Attack(s, worldX, worldY, 0, &gPlayer) == 1) {
                if (I(gPlayer.qWorldY) > worldY) {
                    sub_8042774(boss);
                    Coll_DamagePlayer(&gPlayer);
                } else {
                    sub_80423EC(boss);
                }
            } else {
                Coll_Player_Enemy(s, worldX, worldY, 0, &gPlayer);
                Coll_Player_Enemy(s, worldX, worldY, 1, &gPlayer);
            }
        }

        // TODO(Jace): Could this be a bug?
        //             I'd expect this to use boss->main.qWorldX/Y
        //             instead of their floored counterparts.
        Player_UpdateHomingPosition(Q(worldX), Q(worldY));

        if (boss->main.unk16 == 0) {
            if (Coll_Cheese_Enemy_Attack(s, worldX, worldY, 0, &gPlayer) == TRUE) {
                sub_80423EC(boss);
            }
        }
    }
}

static void AeroEgg_CreateBombIfReady(AeroEgg *boss)
{
    Sprite *s;

    if (boss->main.timerBombDrop > 0) {
        boss->main.timerBombDrop--;
        return;
    }

    s = &boss->sub.sprBody;
    CreateAeroEggBomb(boss, boss->main.qWorldX, boss->main.qWorldY + Q(26.0));

    if (boss->main.lives <= 4) {
        boss->main.timerBombDrop = AEROEGG_COOLDOWN_PINCH;
    } else {
        boss->main.timerBombDrop = AEROEGG_COOLDOWN_NORMAL;
    }

    s->graphics.anim = SA2_ANIM_AERO_EGG_BODY;
    s->variant = 2;
    s->prevVariant = -1;
}

static void AeroEgg_UpdateBossSpritesOnDefeat(AeroEgg *boss)
{
    AeroEggSub *sub = &boss->sub;
    Sprite *s;
    u8 i;

    s = &boss->sub.sprBody;
    s->x = I(sub->body.x) - gCamera.x;
    s->y = I(sub->body.y) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (sub->unk6C == 0) {
        s = &sub->sprPilot;
        s->x = I(sub->body.x) - gCamera.x + AEROEGG_PILOT_OFFSET_X;
        s->y = I(sub->body.y) - gCamera.y + AEROEGG_PILOT_OFFSET_Y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &sub->sprTail;
    for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {

        s->x = I(sub->tail[i].x) - gCamera.x;
        s->y = I(sub->tail[i].y) - gCamera.y;
        // NOTE(Jace): No need to call UpdateSpriteAnimation(s) here, since
        //             the anim on consists of showing one image, anyway.
        DisplaySprite(s);
    }

    s = &boss->sub.sprTailTip;
    s->x = I(sub->tailTip.x) - gCamera.x;
    s->y = I(sub->tailTip.y) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

// (93.54%) https://decomp.me/scratch/PPILk
// (97.22%) https://decomp.me/scratch/30p2x
NONMATCH("asm/non_matching/game/bosses/boss_4__sub_8041D34.inc", void sub_8041D34(AeroEgg *boss))
{
    ExplosionPartsInfo partsInfo;
    AeroEggSub *sub = &boss->sub;

    u32 newUnk6A;
    u8 i;

    --sub->unk6A;
    newUnk6A = sub->unk6A;

    if (sub->unk6C != 0) {
        return;
    }
    // _08041D62

    if (Mod(newUnk6A, 12) == 0) {
        s32 rand, spawnX, spawnY;

#ifndef NON_MATCHING
        do {
#endif
            sub->unk6A = 0x30;
            rand = PseudoRandom32() + 0;
            spawnX = (I(sub->body.x));
            partsInfo.spawnX = (spawnX - gCamera.x) + (rand & 0x1F) - 0x1F;
            ;

            rand = PseudoRandom32() + 0;
            spawnY = (I(sub->body.y));
            partsInfo.spawnY = (spawnY - gCamera.y) + (rand % 64u) - 48;
            partsInfo.velocity = 0;

            partsInfo.rotation = ({ (1000 - (PseudoRandom32() & 0x3F)); }) + 0;
            partsInfo.speed = ({ 1024 - (PseudoRandom32() & 0x1FF); }) + 0;

            partsInfo.vram = RESERVED_EXPLOSION_TILES_VRAM;
            partsInfo.anim = SA2_ANIM_EXPLOSION;
            partsInfo.variant = 0;
            partsInfo.unk4 = 0;

            CreateBossParticleWithExplosionUpdate(&partsInfo, &sub->unk69);
#ifndef NON_MATCHING
        } while (0);
#endif
    }
    // _08041DFA

    if ((sub->unk6A & 0x3) == 0) {
        s32 rand;
        s32 spawnX;
        s32 spawnY, r5, r4;
        s32 temp;

        rand = ({ PseudoRandom32() & 0xF; }) + 0;

        i = rand - Div(rand, 6) * 6;
        spawnX = I(sub->body.x);
        partsInfo.spawnX = (spawnX - gCamera.x) - rand * 2 + rand * 4;

        rand = ({ PseudoRandom32() & 0xF; }) + 0;
        spawnY = I(sub->body.y);
        partsInfo.spawnY = (spawnY - gCamera.y) - (rand * 2) + rand * 4;

        partsInfo.velocity = Q_24_8(0.25);

        partsInfo.rotation = ({ (PseudoRandom32() & 0x3FF); }) + 0;
        partsInfo.speed = ({ 1792 - (PseudoRandom32() & 0x1FF); }) + 0;

        partsInfo.vram = (void *)(OBJ_VRAM0 + (gTileInfoBossScrews[i][0] * TILE_SIZE_4BPP));
        partsInfo.anim = gTileInfoBossScrews[i][1];
        partsInfo.variant = gTileInfoBossScrews[i][2];
        partsInfo.unk4 = 1;

        CreateBossParticleWithExplosionUpdate(&partsInfo, &sub->unk69);
    }
    // _08041ED0

    for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {
        if (boss->sub.tail[i].status == 0 && ((newUnk6A == i + 4) || (newUnk6A == i + 30))) {
            s32 spawnX, spawnY;
            spawnX = Q_24_8_TO_INT(sub->tail[i].x);
            partsInfo.spawnX = spawnX - gCamera.x;
            spawnY = Q_24_8_TO_INT(sub->tail[i].y);
            partsInfo.spawnY = spawnY - gCamera.y;

            partsInfo.velocity = 0;
            partsInfo.rotation = ({ (1000 - (PseudoRandom32() & 0x3F)); }) + 0;
            partsInfo.speed = ({ 1152 - (PseudoRandom32() & 0x1FF); }) + 0;

            partsInfo.vram = RESERVED_EXPLOSION_TILES_VRAM;
            partsInfo.anim = SA2_ANIM_EXPLOSION;
            partsInfo.variant = 0;
            partsInfo.unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&partsInfo, &sub->unk69);
        }
    }

    if ((newUnk6A == 41) || (newUnk6A == 18)) {
        if (sub->tailTip.status == 0) {
            s32 spawnX, spawnY;
            spawnX = I(sub->tailTip.x);
            partsInfo.spawnX = spawnX - gCamera.x;

            spawnY = I(sub->tailTip.y);
            partsInfo.spawnY = spawnY - gCamera.y;

            partsInfo.velocity = 0;
            partsInfo.rotation = ({ (1000 - (PseudoRandom32() % 64u)); }) + 0;
            partsInfo.speed = ({ 1024 - (PseudoRandom32() % 512u); }) + 0;

            partsInfo.vram = RESERVED_EXPLOSION_TILES_VRAM;
            partsInfo.anim = SA2_ANIM_EXPLOSION;
            partsInfo.variant = 0;
            partsInfo.unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&partsInfo, &sub->unk69);
        }
    }
}
END_NONMATCH

void AeroEgg_InitPartsDefeated(AeroEgg *boss)
{
    Sprite *s;
    AeroEggSub *sub = &boss->sub;
    u8 i;

    sub->unk00 = 0;
    sub->unk68 = 0;
    sub->unk69 = 0;
    sub->unk6A = 0x30;
    sub->unk6B = 0x3;
    sub->unk6C = 0;

    s = &sub->sprBody;
    sub->body.x = Q(s->x + gCamera.x);
    sub->body.y = Q(s->y + gCamera.y);
    sub->body.dx = Q(5.75);
    sub->body.dy = Q(0.00);
    sub->body.status = 0;

    s = &sub->sprTailTip;
    sub->tailTip.x = Q(s->x + gCamera.x);
    sub->tailTip.y = Q(s->y + gCamera.y);
    sub->tailTip.dx = Q(5.75);
    sub->tailTip.dy = Q(0.00);
    sub->tailTip.status = 0;

    for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {
        s32 xVal, yVal;
        s32 sinV, cosV;
        s32 bossX, bossY;

        u16 period = SIN_24_8(((gStageTime * 12) + (i << 7)) & ONE_CYCLE) >> 3;

        bossX = I(boss->main.qWorldX);
        cosV = (COS((period + 500) & ONE_CYCLE) * 17);
        cosV *= (i + 1);
        cosV >>= 14;
        bossX += cosV;

        bossY = I(boss->main.qWorldY);
        sinV = (SIN((period + 500) & ONE_CYCLE) * 17);
        sinV *= (i + 1);
        sinV >>= 14;
        sinV += 20;
        bossY += sinV;

        sub->tail[i].x = Q_24_8(bossX);
        sub->tail[i].y = Q_24_8(bossY);
        sub->tail[i].dx = Q_24_8(5.75);
        sub->tail[i].dy = 0;
        // The scope is actually required to make it match,
        // we are gonna assume there was an if here or something
#ifndef NON_MATCHING
        if (1)
#endif
        {
            sub->tail[i].status = 0;
        }
    }
}

static void AeroEgg_UpdatePartsAfterBossDefeated(AeroEgg *boss)
{
    AeroEggSub *sub = &boss->sub;
    s32 res;
    u8 i;

    sub->unk68 = 1;
    sub->unk00++;

    AE_UPDATE_PART_DEFEATED(sub, sub->body, 13, -70, 100, AE_DEFEATED_COLL_BODY(sub, sub->body));

    for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {
        AE_UPDATE_PART_DEFEATED(sub, sub->tail[i], 7, -6, 10, AE_DEFEATED_COLL_PART(sub->tail[i]));
    }

    AE_UPDATE_PART_DEFEATED(sub, sub->tailTip, 9, -6, 10, AE_DEFEATED_COLL_PART(sub->tailTip));
}

static bool32 sub_80423EC(AeroEgg *boss)
{
    Sprite *s = &boss->sub.sprPilot;

    bool32 result = FALSE;

    if (boss->main.lives > 0) {
        boss->main.lives--;

        if (boss->main.lives & 0x1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }

        boss->main.unk16 = 30;

        if (boss->main.lives == 0) {
            s->graphics.anim = SA2_ANIM_AERO_EGG_PILOT;
            s->variant = 4;

            INCREMENT_SCORE(1000);
        } else {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 2;
        }
        s->prevVariant = -1;
    } else {
        result = TRUE;
    }

    if (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        if (boss->main.lives == 4) {
            gMusicManagerState.unk1 = 0x11;
        }
    }

    return result;
}

static void sub_80424EC(AeroEgg *boss)
{
    Sprite *s = &boss->sub.sprPilot;

    if (boss->main.unk16 != 0) {
        boss->main.unk15 = 0;

        if (--boss->main.unk16 == 0) {
            if (boss->main.lives == 0) {
                s->graphics.anim = SA2_ANIM_AERO_EGG_PILOT;
                s->variant = 4;
            } else {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 0;
            }

            s->prevVariant = -1;
        }
    } else if (boss->main.unk15 != 0) {
        boss->main.unk15--;

        if (boss->main.unk15 == 0) {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 0;
            s->prevVariant = -1;
        }
    }
}

static void sub_8042560(AeroEgg *boss)
{
    u8 i;

    if (boss->main.unk16 != 0) {
        for (i = 0; i < PALETTE_LEN_4BPP; i++) {
            SET_PALETTE_COLOR_OBJ(8, i, sPalAeroEggHit[((gStageTime & 0x2) >> 1)][i]);
        }
    } else {
        for (i = 0; i < PALETTE_LEN_4BPP; i++) {
            SET_PALETTE_COLOR_OBJ(8, i, sPalAeroEggHit[PAL_BOSS_4_HIT][i]);
        }
    }

    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
}

void AeroEggMove(s32 dx, s32 dy)
{
    AeroEgg *boss = TASK_DATA(gActiveBossTask);
    u8 i;
    AeroEggSub *sub = &boss->sub;

    boss->main.qWorldX += dx;
    boss->main.qWorldY += dy;
    sub->body.x += dx;
    sub->body.y += dy;

    for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {
        sub->tail[i].x += dx;
        sub->tail[i].y += dy;
    }

    sub->tailTip.x += dx;
    sub->tailTip.y += dy;
}

static void Task_AeroEggMain(void)
{
    AeroEgg *boss = TASK_DATA(gCurTask);

    boss->main.qWorldX += boss->main.dx;
    boss->main.qWorldX += Q(2.25);

    sub_80424EC(boss);
    sub_8041880(boss);
    sub_8042560(boss);

    boss->main.unk0--;
    if (boss->main.unk0 == 0) {
        boss->main.timerBombDrop = ZONE_TIME_TO_INT(0, 3);

        gCurTask->main = Task_80426C4;
    }
}

static void Task_80426C4(void)
{
    AeroEgg *boss = TASK_DATA(gCurTask);

    AeroEgg_UpdatePos(boss);
    sub_8041B44(boss);
    sub_80424EC(boss);
    AeroEgg_CreateBombIfReady(boss);
    sub_8041880(boss);
    sub_8042560(boss);
    sub_8041A08(boss);

    if (boss->main.lives == 0) {
        Sprite *s = &boss->sub.sprBody;
        s->graphics.anim = SA2_ANIM_AERO_EGG_BODY;
        s->variant = 3;
        s->prevVariant = -1;

        Player_DisableInputAndBossTimer();
        AeroEgg_InitPartsDefeated(boss);

        gCurTask->main = Task_AeroEggExploding;
    }
}

static void Task_DeleteAeroEggTask(void) { TaskDestroy(gCurTask); }

static void AeroEgg_UpdatePos(AeroEgg *boss)
{
    boss->main.qWorldX += boss->main.dx;
    boss->main.qWorldY += boss->main.dy;
}

static void sub_8042774(AeroEgg *boss)
{
    Sprite *s = &boss->sub.sprPilot;
    boss->main.unk15 = 30;

    if (boss->main.unk16 == 0) {
        s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

static void TaskDestructor_AeroEggMain(struct Task *t)
{
    AeroEgg *boss = TASK_DATA(t);

    VramFree(boss->sub.tilesBomb);
    VramFree(boss->sub.sprBody.graphics.dest);
    VramFree(boss->sub.sprPilot.graphics.dest);
    VramFree(boss->sub.sprTail.graphics.dest);
    VramFree(boss->sub.sprTailTip.graphics.dest);

    gActiveBossTask = NULL;
}

void CreateAeroEggBomb(AeroEgg *boss, s32 spawnX, s32 spawnY)
{
    struct Task *t = TaskCreate(Task_CreateAeroEggBombMain, sizeof(AeroEggBomb), 0x6100, 0, NULL);
    AeroEggBomb *eb = TASK_DATA(t);
    Sprite *s;

    eb->screenX = spawnX - Q(gCamera.x);
    eb->screenY = spawnY - Q(gCamera.y);
    eb->dx = Q(5.00);
    eb->dy = Q(1.00);
    eb->tAlive = 0;
    eb->boss = boss;

    s = &eb->s;
    s->x = I(boss->main.qWorldX) - gCamera.x;
    s->y = I(eb->screenY);
    s->graphics.dest = boss->sub.tilesBomb;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_AERO_EGG_BOMB, 0, 21, 2, 0);
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void Task_CreateAeroEggBombMain(void)
{
    AeroEggBomb *eb = TASK_DATA(gCurTask);
    Sprite *s = &eb->s;

    eb->tAlive++;

    if (eb->tAlive < 16) {
        eb->screenY += Q(1.0);
        s->x = I(eb->boss->main.qWorldX) - gCamera.x;
        s->y = I(eb->screenY);

        if (eb->tAlive == 16 - 1) {
            m4aSongNumStart(SE_PROJECTILE_DROP);
            eb->screenX = eb->boss->main.qWorldX - Q(gCamera.x);
        }
    } else {
        eb->dy += Q(0.0625);

        if (!PLAYER_IS_ALIVE) {
            eb->screenX += eb->dx;
            eb->screenY += eb->dy;
        } else {
            eb->screenX += eb->dx + Q(gCamera.dx);
            eb->screenY += eb->dy + Q(gCamera.dy);
        }

        s->x = I(eb->screenX);
        s->y = I(eb->screenY);
    }

    if (sub_801E4E4(I(eb->screenY) + gCamera.y, I(eb->screenX) + gCamera.x, 1, 8, NULL, sub_801EE64) < 0) {
        m4aSongNumStart(SE_PROJECTILE_IMPACT);

        eb->dx = 0;
        s->graphics.anim = SA2_ANIM_AERO_EGG_FIRE;
        s->variant = 0;

        CreateScreenShake(0x800, 0x10, 0x80, 0x14, SCREENSHAKE_VERTICAL | 0x3);

        CreateAeroEggBombDebris(eb->boss, eb->screenX, eb->screenY, 0x600, 738);
        CreateAeroEggBombDebris(eb->boss, eb->screenX, eb->screenY, 0x600, 798);
        CreateAeroEggBombDebris(eb->boss, eb->screenX, eb->screenY, 0x580, 708);
        CreateAeroEggBombDebris(eb->boss, eb->screenX, eb->screenY, 0x580, 828);
        gCurTask->main = Task_AeroEggBombHitGround;
    }

    if (eb->boss->main.lives > 0) {
        if (Coll_Player_Enemy(s, I(eb->screenX) + gCamera.x, I(eb->screenY) + gCamera.y, 0, &gPlayer) == TRUE) {
            if (eb->boss->main.unk16 == 0) {
                Sprite *s2 = &eb->boss->sub.sprPilot;
                eb->boss->main.unk15 = 30;
                s2->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s2->variant = 1;
                s2->prevVariant = -1;
            }
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void Task_AeroEggBombHitGround(void)
{
    AeroEggBomb *eb = TASK_DATA(gCurTask);
    Sprite *s = &eb->s;

    if (!PLAYER_IS_ALIVE) {
        eb->screenX += eb->dx;
    } else {
        eb->screenX += eb->dx + Q(gCamera.dx);
        eb->screenY += Q(gCamera.dy);
    }

    s->x = I(eb->screenX);
    s->y = I(eb->screenY);

    if (eb->boss->main.lives > 0) {
        if (Coll_Player_Enemy(s, I(eb->screenX) + gCamera.x, I(eb->screenY) + gCamera.y, 0, &gPlayer) == TRUE) {
            if (eb->boss->main.unk16 == 0) {
                Sprite *s2 = &eb->boss->sub.sprPilot;
                eb->boss->main.unk15 = 30;
                s2->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s2->variant = 1;
                s2->prevVariant = -1;
            }
        }
    }

    if (UpdateSpriteAnimation(s) == 0) {
        gCurTask->main = Task_DeleteAeroEggBombTask;
    }

    DisplaySprite(s);
}

static void CreateAeroEggBombDebris(AeroEgg *boss, s32 screenX, s32 screenY, s16 param3, u16 param4)
{
    struct Task *t = TaskCreate(Task_AeroEggBombDebris, sizeof(AeroEggDebris), 0x6100, 0, NULL);
    AeroEggDebris *deb = TASK_DATA(t);
    Sprite *s;

    deb->screenX = screenX;
    deb->screenY = screenY;

    deb->dx = Q_2_14_TO_INT(COS(param4) * param3);
    deb->dy = Q_2_14_TO_INT(SIN(param4) * param3);
    deb->tAlive = 0;
    deb->boss = boss;

    s = &deb->s;
    s->x = I(screenX);
    s->y = I(deb->screenY);

    if (PseudoRandom32() % 2u) {
        s->graphics.dest = boss->sub.tilesBomb + (32 * TILE_SIZE_4BPP);
        s->graphics.anim = SA2_ANIM_AERO_EGG_DEBRIS_BIG;
        s->variant = 0;
    } else {
        s->graphics.dest = boss->sub.tilesBomb + (41 * TILE_SIZE_4BPP);
        s->graphics.anim = SA2_ANIM_AERO_EGG_DEBRIS_SMALL;
        s->variant = 0;
    }
    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 20, 2, 0);

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void Task_AeroEggBombDebris(void)
{
    AeroEggDebris *deb = TASK_DATA(gCurTask);
    Sprite *s = &deb->s;

    deb->dy += Q(0.3125);

    if (!PLAYER_IS_ALIVE) {
        deb->screenX += deb->dx;
        deb->screenY += deb->dy;
    } else {
        deb->screenX += deb->dx + Q(gCamera.dx);
        deb->screenY += deb->dy + Q(gCamera.dy);
    }

    s->x = I(deb->screenX);
    s->y = I(deb->screenY);

    if (sub_801E4E4(I(deb->screenY) + gCamera.y, I(deb->screenX) + gCamera.x, 1, 8, NULL, sub_801EE64) < 0) {
        if (deb->dy > 0) {
            TaskDestroy(gCurTask);
            return;
        }
    }

    if (deb->boss->main.lives > 0) {
        if (Coll_Player_Enemy(s, I(deb->screenX) + gCamera.x, I(deb->screenY) + gCamera.y, 0, &gPlayer) == TRUE) {
            if (deb->boss->main.unk16 == 0) {
                Sprite *s2 = &deb->boss->sub.sprPilot;
                deb->boss->main.unk15 = 30;
                s2->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s2->variant = 1;
                s2->prevVariant = -1;
            }
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void Task_DeleteAeroEggBombTask(void) { TaskDestroy(gCurTask); }