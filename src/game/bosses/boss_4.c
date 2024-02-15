#include "global.h"
#include "flags.h"
#include "malloc_vram.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a.h"
#include "sakit/camera.h"
#include "sakit/collision.h"
#include "sakit/player.h"
#include "game/game.h" // sub_801E4E4
#include "game/bosses/common.h"
#include "game/screen_shake.h"
#include "game/player_callbacks_1.h" // Player_DisableInputAndBossTimer

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/zones.h"

#define NUM_TAIL_SEGMENTS 3

#define PAL_BOSS_4_DEFAULT 0
#define PAL_BOSS_4_HIT     1

// TODO: Probably these will be globally automated in the long run?
#define AEROEGG_PILOT_OFFSET_X (0)
#define AEROEGG_PILOT_OFFSET_Y (-14)

#define AEROEGG_COOLDOWN_NORMAL ZONE_TIME_TO_INT(0, 2. + (1. / 3.))
#define AEROEGG_COOLDOWN_PINCH  ZONE_TIME_TO_INT(0, 1. + (1. / 3.))

#define RESERVED_EXPLOSION_TILES_VRAM (void *)(OBJ_VRAM0 + 0x2980)

static const u16 gUnknown_080D7F54[][16] = {
    [PAL_BOSS_4_DEFAULT] = INCBIN_U16("graphics/boss_4_a.gbapal"),
    [PAL_BOSS_4_HIT] = INCBIN_U16("graphics/boss_4_b.gbapal"),
};

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s32 dx;
    /* 0x0C */ s32 dy;
    /* 0x10 */ bool32 status;
} AeroEggPart; /* size: 0x14 */

typedef struct {
    /* 0x000 */ s32 unk0;
    /* 0x004 */ s32 worldX;
    /* 0x008 */ s32 worldY;
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
    /* 0x01C 0x04  */ AeroEggPart cockpit;
    /* 0x030 0x18  */ AeroEggPart tail[NUM_TAIL_SEGMENTS];
    /* 0x06C 0x54  */ AeroEggPart tailTip;
    /* 0x080 0x68  */ u8 unk68;
    /* 0x081 0x69  */ u8 unk69; // explosion parts count?
    /* 0x082 0x6A  */ u8 unk6A;
    /* 0x083 0x6B  */ u8 unk6B;
    /* 0x084 0x6C  */ u8 unk6C;
    /* 0x085 0x6D  */ u8 filler85[0x3];
    /* 0x088 0x70  */ Sprite spr70;
    /* 0x0B8 0xA0  */ u8 fillerB8[0x8];
    /* 0x0C0 0xA8  */ Sprite sprA8;
    /* 0x0F0 0xD8  */ Sprite sprD8;
    /* 0x120 0x108 */ Sprite spr108;
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
void Task_AeroEggExploding(void);
void Task_80426C4(void);
static void Task_8042AB0(void);
void sub_8041B44(AeroEgg *boss);
void sub_8041880(AeroEgg *boss);
void sub_8041A08(AeroEgg *boss);
void AeroEgg_CreateBombIfReady(AeroEgg *boss);
void AeroEgg_InitPartsDefeated(AeroEgg *boss);
bool32 sub_80423EC(AeroEgg *boss);
void sub_80424EC(AeroEgg *boss);
void CreateAeroEggBomb(AeroEgg *boss, s32 spawnX, s32 spawnY);
void sub_8042560(AeroEgg *boss);
void sub_8042774(AeroEgg *boss);
void AeroEgg_UpdatePos(AeroEgg *boss);
static void CreateAeroEggBombDebris(AeroEgg *boss, s32 screenX, s32 screenY, s16 param3,
                                    u16 param4);

#define AE_DEFEATED_COLL_COCKPIT(_sub, _part)                                           \
    {                                                                                   \
        if (_sub->unk6B != 0) {                                                         \
            if (--_sub->unk6B == 0) {                                                   \
                _part.dy = 0;                                                           \
                _part.status = 1;                                                       \
            }                                                                           \
                                                                                        \
            CreateScreenShake(0x400, 0x20, 0x80, 0x14, SCREENSHAKE_VERTICAL | 0x3);     \
        }                                                                               \
    }

#define AE_DEFEATED_COLL_PART(_part)                                                    \
    {                                                                                   \
        if (_part.dy > -48) {                                                           \
            _part.dy = 0;                                                               \
            _part.status = 1;                                                           \
        }                                                                               \
    }

#define AE_UPDATE_PART_DEFEATED(_sub, _part, _halfHeight, _dyNum, _dyDenom,             \
                                CODE_ON_COLL)                                           \
    if ((_sub->unk00 > 10) && (_part.status == 0)) {                                    \
        _part.dy += 0x10;                                                               \
    }                                                                                   \
    _part.x += _part.dx;                                                                \
    _part.y += _part.dy;                                                                \
                                                                                        \
    res = sub_801E4E4(Q_24_8_TO_INT(_part.y) + _halfHeight, Q_24_8_TO_INT(_part.x), 1,  \
                      8, NULL, &sub_801EE64);                                           \
                                                                                        \
    if ((res <= 0) && (_part.dy >= 0)) {                                                \
        _part.y += Q_24_8(res);                                                         \
        _part.dy = Div((_part.dy * (_dyNum)), (_dyDenom));                              \
                                                                                        \
        CODE_ON_COLL;                                                                   \
                                                                                        \
        _part.dx -= 8;                                                                  \
        if (_part.dx < 0) {                                                             \
            _part.dx = 0;                                                               \
        }                                                                               \
    } else if (_part.status != 0) {                                                     \
        _part.y += Q_24_8(res);                                                         \
    }

void sub_8041B44(AeroEgg *boss)
{
    Sprite *s;

    if (boss->main.unk16 == 0) {
        s32 worldX = Q_24_8_TO_INT(boss->main.worldX);
        s32 worldY = Q_24_8_TO_INT(boss->main.worldY);

        s = &boss->sub.spr70;

        if (PLAYER_IS_ALIVE) {
            if (sub_800C320(s, worldX, worldY, 0, &gPlayer) == 1) {
                if (Q_24_8_TO_INT(gPlayer.y) > worldY) {
                    sub_8042774(boss);
                    sub_800CBA4(&gPlayer);
                } else {
                    sub_80423EC(boss);
                }
            } else {
                sub_800CA20(s, worldX, worldY, 0, &gPlayer);
                sub_800CA20(s, worldX, worldY, 1, &gPlayer);
            }
        }

        // TODO(Jace): Could this be a bug?
        //             I'd expect this to use boss->main.worldX/Y
        //             instead of their floored counterparts.
        sub_80122DC(Q_24_8(worldX), Q_24_8(worldY));

        if (boss->main.unk16 == 0) {
            if (IsColliding_Cheese(s, worldX, worldY, 0, &gPlayer) == TRUE) {
                sub_80423EC(boss);
            }
        }
    }
}

void AeroEgg_CreateBombIfReady(AeroEgg *boss)
{
    Sprite *s;

    if (boss->main.timerBombDrop > 0) {
        boss->main.timerBombDrop--;
        return;
    }

    s = &boss->sub.spr70;
    CreateAeroEggBomb(boss, boss->main.worldX, boss->main.worldY + Q_24_8(26.0));

    if (boss->main.lives <= 4) {
        boss->main.timerBombDrop = AEROEGG_COOLDOWN_PINCH;
    } else {
        boss->main.timerBombDrop = AEROEGG_COOLDOWN_NORMAL;
    }

    s->graphics.anim = SA2_ANIM_AERO_EGG_COCKPIT;
    s->variant = 2;
    s->prevVariant = -1;
}

void AeroEgg_UpdateBossSpritesOnDefeat(AeroEgg *boss)
{
    AeroEggSub *sub = &boss->sub;
    Sprite *s;
    u8 i;

    s = &boss->sub.spr70;
    s->x = Q_24_8_TO_INT(sub->cockpit.x) - gCamera.x;
    s->y = Q_24_8_TO_INT(sub->cockpit.y) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (sub->unk6C == 0) {
        s = &sub->sprA8;
        s->x = Q_24_8_TO_INT(sub->cockpit.x) - gCamera.x + AEROEGG_PILOT_OFFSET_X;
        s->y = Q_24_8_TO_INT(sub->cockpit.y) - gCamera.y + AEROEGG_PILOT_OFFSET_Y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &sub->sprD8;
    for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {

        s->x = Q_24_8_TO_INT(sub->tail[i].x) - gCamera.x;
        s->y = Q_24_8_TO_INT(sub->tail[i].y) - gCamera.y;
        // NOTE(Jace): No need to call UpdateSpriteAnimation(s) here, since
        //             the anim on consists of showing one image, anyway.
        DisplaySprite(s);
    }

    s = &boss->sub.spr108;
    s->x = Q_24_8_TO_INT(sub->tailTip.x) - gCamera.x;
    s->y = Q_24_8_TO_INT(sub->tailTip.y) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

// (93.54%) https://decomp.me/scratch/PPILk
NONMATCH("asm/non_matching/game/bosses/boss_4__sub_8041D34.inc",
         void sub_8041D34(AeroEgg *boss))
{
    ExplosionPartsInfo partsInfo;
    s32 res, tmp;
    AeroEggSub *sub = &boss->sub;

    u32 newUnk6A;
    s32 spawnX, spawnY;

    --sub->unk6A;
    newUnk6A = sub->unk6A;

    if (sub->unk6C != 0) {
        return;
    }
    // _08041D62

    res = Mod(newUnk6A, 12);

    if (res == 0) {
        s32 rand, temp;

        sub->unk6A = 0x30;
        rand = PseudoRandom32();
        spawnX = (Q_24_8_TO_INT(sub->cockpit.x) - gCamera.x);
        spawnX += (rand & 0x1F);
        spawnX -= 0x1F;
        partsInfo.spawnX = spawnX;

        rand = PseudoRandom32();
        spawnY = (Q_24_8_TO_INT(sub->cockpit.y) - gCamera.y) + (rand % 64u);
        spawnY -= 48;
        partsInfo.spawnY = spawnY;
        partsInfo.velocity = 0;

        partsInfo.rotation = (1000 - (PseudoRandom32() & 0x3F));

        partsInfo.speed = 1024 - (PseudoRandom32() & 0x1FF);

        partsInfo.vram = RESERVED_EXPLOSION_TILES_VRAM;
        partsInfo.anim = SA2_ANIM_EXPLOSION;
        partsInfo.variant = 0;
        partsInfo.unk4 = 0;

        CreateBossParticleWithExplosionUpdate(&partsInfo, &sub->unk69);
    }
    // _08041DFA

    if ((sub->unk6A & 0x3) == 0) {
        s32 rand, spawnY;
        u8 r7;

        rand = (PseudoRandom32() & 0xF);
        r7 = rand - Div(rand, 6) * 6;
        spawnX = Q_24_8_TO_INT(sub->cockpit.x) - gCamera.x;
        spawnX -= rand * 2;
        spawnX += rand * 4;
        partsInfo.spawnX = spawnX;

        rand = PseudoRandom32() % 16u;
        spawnY = Q_24_8_TO_INT(sub->cockpit.y) - gCamera.y;
        spawnY -= rand * 2;
        spawnY += rand * 4;
        partsInfo.spawnY = spawnY;

        partsInfo.velocity = Q_24_8(0.25);

        partsInfo.rotation = (PseudoRandom32() & 0x3FF);
        partsInfo.speed = 1792 - (PseudoRandom32() % 512u);

        partsInfo.vram
            = (void *)(OBJ_VRAM0 + (gTileInfoBossScrews[r7][0] * TILE_SIZE_4BPP));
        partsInfo.anim = gTileInfoBossScrews[r7][1];
        partsInfo.variant = gTileInfoBossScrews[r7][2];
        partsInfo.unk4 = 1;

        CreateBossParticleWithExplosionUpdate(&partsInfo, &sub->unk69);
    }
    // _08041ED0

    {
        u8 i;
        for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {
            s32 temp;
            u8 r7;

            if (boss->sub.tail[i].status != 0) {
                continue;
            }

            if ((newUnk6A == i + 4) || (newUnk6A == i + 30)) {
                partsInfo.spawnX = Q_24_8_TO_INT(sub->tail[i].x) - gCamera.x;
                partsInfo.spawnY = Q_24_8_TO_INT(sub->tail[i].y) - gCamera.y;
                partsInfo.velocity = 0;

                temp = (1000 - (PseudoRandom32() & 0x3F));
                partsInfo.rotation = temp;

                temp = 1152 - (PseudoRandom32() & 0x1FF);
                partsInfo.speed = temp;

                partsInfo.vram = RESERVED_EXPLOSION_TILES_VRAM;
                partsInfo.anim = SA2_ANIM_EXPLOSION;
                partsInfo.variant = 0;
                partsInfo.unk4 = 0;
                CreateBossParticleWithExplosionUpdate(&partsInfo, &sub->unk69);
            }
        }
    }

    if ((newUnk6A == 41) || (newUnk6A == 18)) {
        ExplosionPartsInfo *localInfo;
        s32 tmp;
        if (sub->tailTip.status == 0) {
            partsInfo.spawnX = Q_24_8_TO_INT(sub->tailTip.x) - gCamera.x;
            partsInfo.spawnY = Q_24_8_TO_INT(sub->tailTip.y) - gCamera.y;
            partsInfo.velocity = 0;

            localInfo = &partsInfo;
            tmp = (1000 - (PseudoRandom32() % 64u));
            localInfo->rotation = tmp;

            tmp = 1024 - (PseudoRandom32() % 512u);
            localInfo->speed = tmp;

            localInfo->vram = RESERVED_EXPLOSION_TILES_VRAM;
            partsInfo.anim = SA2_ANIM_EXPLOSION;
            partsInfo.variant = 0;
            localInfo->unk4 = 0;
            CreateBossParticleWithExplosionUpdate(&partsInfo, &sub->unk69);
        }
    }
}
END_NONMATCH

// (99.64%) https://decomp.me/scratch/WJcpn
NONMATCH("asm/non_matching/game/bosses/AeroEgg_InitPartsDefeated.inc",
         void AeroEgg_InitPartsDefeated(AeroEgg *boss))
{
    Sprite *s;
    AeroEggSub *sub = &boss->sub;

    sub->unk00 = 0;

    sub->unk68 = 0;
    sub->unk69 = 0;
    sub->unk6A = 0x30;
    sub->unk6B = 0x3;
    sub->unk6C = 0;

    s = &sub->spr70;
    sub->cockpit.x = Q_24_8(s->x + gCamera.x);
    sub->cockpit.y = Q_24_8(s->y + gCamera.y);
    sub->cockpit.dx = Q_24_8(5.75);
    sub->cockpit.dy = Q_24_8(0.00);
    sub->cockpit.status = 0;

    s = &sub->spr108;
    sub->tailTip.x = Q_24_8(s->x + gCamera.x);
    sub->tailTip.y = Q_24_8(s->y + gCamera.y);
    sub->tailTip.dx = Q_24_8(5.75);
    sub->tailTip.dy = Q_24_8(0.00);
    sub->tailTip.status = 0;

    {
        u8 i;
        for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {
            s32 xVal, yVal;
            u16 period = SIN_24_8(((gStageTime * 12) + (i << 7)) & ONE_CYCLE) >> 3;
            s32 bossX, bossY;
            s32 sinV, cosV;

            bossX = Q_24_8_TO_INT(boss->main.worldX);
            period = (period + 500) & ONE_CYCLE;
            cosV = (COS(period) * 17);
            cosV *= (i + 1);
            cosV >>= 14;
            bossX += cosV;

            bossY = Q_24_8_TO_INT(boss->main.worldY);
            sinV = (SIN(period) * 17);
            sinV *= (i + 1);
            sinV >>= 14;
            sinV += 0x14;
            bossY += sinV;

            sub->tail[i].x = Q_24_8(bossX);
            sub->tail[i].y = Q_24_8(bossY);
            sub->tail[i].dx = Q_24_8(5.75);
            sub->tail[i].dy = 0;
            sub->tail[i].status = 0;
        }
    }
}
END_NONMATCH

void AeroEgg_UpdatePartsAfterBossDefeated(AeroEgg *boss)
{
    AeroEggSub *sub = &boss->sub;
    s32 res;
    u8 i;

    sub->unk68 = 1;
    sub->unk00++;

    AE_UPDATE_PART_DEFEATED(sub, sub->cockpit, 13, -70, 100,
                            AE_DEFEATED_COLL_COCKPIT(sub, sub->cockpit));

    for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {
        AE_UPDATE_PART_DEFEATED(sub, sub->tail[i], 7, -6, 10,
                                AE_DEFEATED_COLL_PART(sub->tail[i]));
    }

    AE_UPDATE_PART_DEFEATED(sub, sub->tailTip, 9, -6, 10,
                            AE_DEFEATED_COLL_PART(sub->tailTip));
}

bool32 sub_80423EC(AeroEgg *boss)
{
    Sprite *s = &boss->sub.sprA8;

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
            gUnknown_030054A8.unk1 = 0x11;
        }
    }

    return result;
}

void sub_80424EC(AeroEgg *boss)
{
    Sprite *s = &boss->sub.sprA8;

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

void sub_8042560(AeroEgg *boss)
{
    u8 i;

    if (boss->main.unk16 != 0) {
        for (i = 0; i < ARRAY_COUNT(gUnknown_080D7F54[PAL_BOSS_4_DEFAULT]); i++) {
            gObjPalette[128 + i] = gUnknown_080D7F54[((gStageTime & 0x2) >> 1)][i];
        }
    } else {
        for (i = 0; i < ARRAY_COUNT(gUnknown_080D7F54[PAL_BOSS_4_HIT]); i++) {
            gObjPalette[128 + i] = gUnknown_080D7F54[PAL_BOSS_4_HIT][i];
        }
    }

    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
}

void AeroEggResetPos(s32 dx, s32 dy)
{
    AeroEgg *boss = TASK_DATA(gActiveBossTask);
    u8 i;
    AeroEggSub *sub = &boss->sub;

    boss->main.worldX += dx;
    boss->main.worldY += dy;
    sub->cockpit.x += dx;
    sub->cockpit.y += dy;

    for (i = 0; i < ARRAY_COUNT(sub->tail); i++) {
        sub->tail[i].x += dx;
        sub->tail[i].y += dy;
    }

    sub->tailTip.x += dx;
    sub->tailTip.y += dy;
}

void Task_AeroEggMain(void)
{
    AeroEgg *boss = TASK_DATA(gCurTask);

    boss->main.worldX += boss->main.dx;
    boss->main.worldX += Q_24_8(2.25);

    sub_80424EC(boss);
    sub_8041880(boss);
    sub_8042560(boss);

    boss->main.unk0--;
    if (boss->main.unk0 == 0) {
        boss->main.timerBombDrop = ZONE_TIME_TO_INT(0, 3);

        gCurTask->main = Task_80426C4;
    }
}

void Task_80426C4(void)
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
        Sprite *s = &boss->sub.spr70;
        s->graphics.anim = SA2_ANIM_AERO_EGG_COCKPIT;
        s->variant = 3;
        s->prevVariant = -1;

        Player_DisableInputAndBossTimer();
        AeroEgg_InitPartsDefeated(boss);

        gCurTask->main = Task_AeroEggExploding;
    }
}

void Task_DeleteAeroEggTask(void) { TaskDestroy(gCurTask); }

void AeroEgg_UpdatePos(AeroEgg *boss)
{
    boss->main.worldX += boss->main.dx;
    boss->main.worldY += boss->main.dy;
}

void sub_8042774(AeroEgg *boss)
{
    Sprite *s = &boss->sub.sprA8;
    boss->main.unk15 = 30;

    if (boss->main.unk16 == 0) {
        s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

void TaskDestructor_AeroEggMain(struct Task *t)
{
    AeroEgg *boss = TASK_DATA(t);

    VramFree(boss->sub.tilesBomb);
    VramFree(boss->sub.spr70.graphics.dest);
    VramFree(boss->sub.sprA8.graphics.dest);
    VramFree(boss->sub.sprD8.graphics.dest);
    VramFree(boss->sub.spr108.graphics.dest);

    gActiveBossTask = NULL;
}

void CreateAeroEggBomb(AeroEgg *boss, s32 spawnX, s32 spawnY)
{
    struct Task *t
        = TaskCreate(Task_CreateAeroEggBombMain, sizeof(AeroEggBomb), 0x6100, 0, NULL);
    AeroEggBomb *eb = TASK_DATA(t);
    Sprite *s;

    eb->screenX = spawnX - Q_24_8(gCamera.x);
    eb->screenY = spawnY - Q_24_8(gCamera.y);
    eb->dx = Q_24_8(5.00);
    eb->dy = Q_24_8(1.00);
    eb->tAlive = 0;
    eb->boss = boss;

    s = &eb->s;
    s->x = Q_24_8_TO_INT(boss->main.worldX) - gCamera.x;
    s->y = Q_24_8_TO_INT(eb->screenY);
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
        eb->screenY += Q_24_8(1.0);
        s->x = Q_24_8_TO_INT(eb->boss->main.worldX) - gCamera.x;
        s->y = Q_24_8_TO_INT(eb->screenY);

        if (eb->tAlive == 16 - 1) {
            m4aSongNumStart(SE_PROJECTILE_DROP);
            eb->screenX = eb->boss->main.worldX - Q_24_8(gCamera.x);
        }
    } else {
        eb->dy += Q_24_8(0.0625);

        if (!PLAYER_IS_ALIVE) {
            eb->screenX += eb->dx;
            eb->screenY += eb->dy;
        } else {
            eb->screenX += eb->dx + Q_24_8(gCamera.unk38);
            eb->screenY += eb->dy + Q_24_8(gCamera.unk3C);
        }

        s->x = Q_24_8_TO_INT(eb->screenX);
        s->y = Q_24_8_TO_INT(eb->screenY);
    }

    if (sub_801E4E4(Q_24_8_TO_INT(eb->screenY) + gCamera.y,
                    Q_24_8_TO_INT(eb->screenX) + gCamera.x, 1, 8, NULL, sub_801EE64)
        < 0) {
        m4aSongNumStart(SE_PROJECTILE_IMPACT);

        eb->dx = 0;
        s->graphics.anim = SA2_ANIM_AERO_EGG_FIRE;
        s->variant = 0;

        CreateScreenShake(0x800, 0x10, 0x80, 0x14, SCREENSHAKE_VERTICAL | 0x3);

        CreateAeroEggBombDebris(eb->boss, eb->screenX, eb->screenY, 0x600, 738);
        CreateAeroEggBombDebris(eb->boss, eb->screenX, eb->screenY, 0x600, 798);
        CreateAeroEggBombDebris(eb->boss, eb->screenX, eb->screenY, 0x580, 708);
        CreateAeroEggBombDebris(eb->boss, eb->screenX, eb->screenY, 0x580, 828);
        gCurTask->main = Task_8042AB0;
    }

    if (eb->boss->main.lives > 0) {
        if (sub_800CA20(s, Q_24_8_TO_INT(eb->screenX) + gCamera.x,
                        Q_24_8_TO_INT(eb->screenY) + gCamera.y, 0, &gPlayer)
            == TRUE) {
            if (eb->boss->main.unk16 == 0) {
                Sprite *s2 = &eb->boss->sub.sprA8;
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

static void Task_8042AB0(void)
{
    AeroEggBomb *eb = TASK_DATA(gCurTask);
    Sprite *s = &eb->s;

    if (!PLAYER_IS_ALIVE) {
        eb->screenX += eb->dx;
    } else {
        eb->screenX += eb->dx + Q_24_8(gCamera.unk38);
        eb->screenY += Q_24_8(gCamera.unk3C);
    }

    s->x = Q_24_8_TO_INT(eb->screenX);
    s->y = Q_24_8_TO_INT(eb->screenY);

    if (eb->boss->main.lives > 0) {
        if (sub_800CA20(s, Q_24_8_TO_INT(eb->screenX) + gCamera.x,
                        Q_24_8_TO_INT(eb->screenY) + gCamera.y, 0, &gPlayer)
            == TRUE) {
            if (eb->boss->main.unk16 == 0) {
                Sprite *s2 = &eb->boss->sub.sprA8;
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

static void CreateAeroEggBombDebris(AeroEgg *boss, s32 screenX, s32 screenY, s16 param3,
                                    u16 param4)
{
    struct Task *t
        = TaskCreate(Task_AeroEggBombDebris, sizeof(AeroEggDebris), 0x6100, 0, NULL);
    AeroEggDebris *deb = TASK_DATA(t);
    Sprite *s;
    s16 cos, sin;

    deb->screenX = screenX;
    deb->screenY = screenY;

    deb->dx = Q_2_14_TO_INT(COS(param4) * param3);
    deb->dy = Q_2_14_TO_INT(SIN(param4) * param3);
    deb->tAlive = 0;
    deb->boss = boss;

    s = &deb->s;
    s->x = Q_24_8_TO_INT(screenX);
    s->y = Q_24_8_TO_INT(deb->screenY);

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

    deb->dy += Q_24_8(0.3125);

    if (!PLAYER_IS_ALIVE) {
        deb->screenX += deb->dx;
        deb->screenY += deb->dy;
    } else {
        deb->screenX += deb->dx + Q_24_8(gCamera.unk38);
        deb->screenY += deb->dy + Q_24_8(gCamera.unk3C);
    }

    s->x = Q_24_8_TO_INT(deb->screenX);
    s->y = Q_24_8_TO_INT(deb->screenY);

    if (sub_801E4E4(Q_24_8_TO_INT(deb->screenY) + gCamera.y,
                    Q_24_8_TO_INT(deb->screenX) + gCamera.x, 1, 8, NULL, sub_801EE64)
        < 0) {
        if (deb->dy > 0) {
            TaskDestroy(gCurTask);
            return;
        }
    }

    if (deb->boss->main.lives > 0) {
        if (sub_800CA20(s, Q_24_8_TO_INT(deb->screenX) + gCamera.x,
                        Q_24_8_TO_INT(deb->screenY) + gCamera.y, 0, &gPlayer)
            == TRUE) {
            if (deb->boss->main.unk16 == 0) {
                Sprite *s2 = &deb->boss->sub.sprA8;
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