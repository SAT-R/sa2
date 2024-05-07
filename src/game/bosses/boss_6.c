#include "core.h"
#include "task.h"
#include "sprite.h"
#include "trig.h"

#include "lib/m4a.h"

#include "sakit/globals.h"
#include "sakit/collision.h"

#include "game/bosses/boss_6.h"
#include "game/bosses/common.h"
#include "game/bosses/eggmobile_escape_sequence.h"

#include "game/stage/boss_results_transition.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/collision.h"
#include "game/player_callbacks.h"

#include "constants/move_states.h"
#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    u8 unk0;
    s32 unk4;
    s32 unk8;
    s16 unkC;
    s16 unkE;
} EggGoRound_unk3C;

typedef struct {
    Sprite s;
    Hitbox reserved;
    SpriteTransform transform;
} EggGoRound_unk25C;

typedef struct {
    s32 unk6C;
    s32 unk70;

    s32 unk74;
    s32 unk78;
    s32 unk7C;

    s32 unk80[4][5];
    s32 unkD0[4][3][5];

    u8 unk1C0;
    u8 unk1C1;

} EggGoRound_unk6C;

typedef struct {
    u32 unk0;
    s32 unk4; // x
    s32 unk8; // y
    s16 unkC;
    s16 unkE;

    s32 unk10;
    s32 unk14;
    u32 unk18;
    s16 unk1C;
    u16 unk1E;
    u16 unk20;
    u16 unk22;
    u8 unk24;
    u8 unk25;
    u8 unk26;
    u8 unk27;
    u8 unk28;
    u8 unk29;
    u8 unk2A;
    s8 unk2B;
    s32 unk2C[4];
    EggGoRound_unk3C unk3C[3];

    EggGoRound_unk6C unk6C;

    Sprite unk1C4;
    Hitbox reserved0;

    Sprite unk1FC;
    Sprite unk22C;

    EggGoRound_unk25C unk25C[4];

    Sprite unk36C;
    Sprite unk39C;

} EggGoRound; /* 0x3CC */

void Task_EggGoRound(void);
void TaskDestructor_EggGoRound(struct Task *);

extern const TileInfo gUnknown_080D8034[];

void CreateEggGoRound(void)
{
    u8 i;
    EggGoRound *boss;
    Sprite *s;
    void *vrams[2];
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    sub_8039ED4();
    gPseudoRandom = gStageTime;

    gUnknown_03005AF0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    gUnknown_03005AF0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);

    gUnknown_03005AA0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    gUnknown_03005AA0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);

    gPlayer.unk3C = NULL;
    gPlayer.moveState &= ~MOVESTATE_8;

    gActiveBossTask
        = TaskCreate(Task_EggGoRound, 0x3CC, 0x4000, 0, TaskDestructor_EggGoRound);
    boss = TASK_DATA(gActiveBossTask);

    if (gDifficultyLevel != 0 && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->unk28 = 6;
    } else {
        boss->unk28 = 8;
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        boss->unk28 = boss->unk28 >> 1;
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        boss->unk4 = Q_24_8(29076);
        boss->unk8 = Q_24_8(100);
    } else {
        boss->unk4 = Q_24_8(900);
        boss->unk8 = Q_24_8(150);
    }

    boss->unkC = 0x500;
    boss->unkE = 0;
    boss->unk29 = 0;
    boss->unk2A = 0;
    boss->unk14 = 0;
    boss->unk18 = 0;
    boss->unk27 = 0;
    boss->unk1E = 0;
    boss->unk26 = 0;
    boss->unk20 = 0;
    boss->unk24 = 0;
    boss->unk25 = 0;
    boss->unk2C[0] = 0;
    boss->unk2C[1] = 0;
    boss->unk2C[2] = 0;
    boss->unk2C[3] = 0;
    boss->unk0 = 0x80;
    boss->unk10 = 0xC00;
    boss->unk2B = 0xE0;
    boss->unk22 = 0x1C2;

    for (i = 0; i < 3; i++) {
        EggGoRound_unk3C *unk3C = &boss->unk3C[i];
        unk3C->unk0 = 0;
        unk3C->unk4 = 0;
        unk3C->unk8 = 0;
        unk3C->unkC = 0;
        unk3C->unkE = 0;
    }

    s = &boss->unk39C;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 4, SA2_ANIM_EGG_GO_ROUND_PROJECTILE, 0, 6, 1);

    s = &boss->unk36C;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 4, SA2_ANIM_EGG_GO_ROUND_GUN, 0, 7, 1);

    s = &boss->unk1C4;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 42, SA2_ANIM_EGG_GO_ROUND_CABIN, 1, 20, 1);

    s = &boss->unk1FC;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(8);
    s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
    s->variant = 0;
    s->prevVariant = -1;
    s->unk1A = SPRITE_OAM_ORDER(19);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = SPRITE_FLAG(PRIORITY, 1);

    s = &boss->unk22C;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 4, SA2_ANIM_EGG_GO_ROUND_LINK, 0, 22, 1);
    UpdateSpriteAnimation(s);

    for (i = 0; i < 2; i++) {
        EggGoRound_unk25C *unk25C = &boss->unk25C[i];
        s = &unk25C->s;
        s->x = 0;
        s->y = 0;

        s->graphics.dest = VramMalloc(gUnknown_080D8034[i].numTiles);
        vrams[i] = s->graphics.dest;
        s->graphics.anim = gUnknown_080D8034[i].anim;
        s->variant = gUnknown_080D8034[i].variant;

        s->unk1A = SPRITE_OAM_ORDER(21);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 1);
        UpdateSpriteAnimation(s);
    }

    for (; i < 4; i++) {
        s = &boss->unk25C[i].s;
        s->x = 0;
        s->y = 0;
        s->graphics.dest = vrams[i & 1];
        s->graphics.anim = gUnknown_080D8034[i & 1].anim;
        s->variant = gUnknown_080D8034[i & 1].variant;

        s->unk1A = SPRITE_OAM_ORDER(21);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 1);
        UpdateSpriteAnimation(s);
    }
}

void sub_8045E78(EggGoRound *boss)
{
    if (--boss->unk22 < 106) {
        if (boss->unk22 > 90 && boss->unk22 < 106) {
            Sprite *s = &boss->unk36C;
            s->x = I(boss->unk4) - gCamera.x;
            s->y = I(boss->unk8) - gCamera.y;
            if (boss->unk22 == 45) {
                s->prevVariant = -1;
            }
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
            return;
        }

        if (boss->unk22 == 0) {
            if (boss->unk28 < 5) {
                boss->unk22 = 320;
            } else {
                boss->unk22 = 450;
            }
        }

        if (Mod(boss->unk22, 30) == 0) {
            u8 i;
            u16 result
                = sub_8004418(I(gPlayer.y - boss->unk8), I(gPlayer.x - boss->unk4));

            for (i = 0; i < 3; i++) {
                EggGoRound_unk3C *unk3C = &boss->unk3C[i];
                if (unk3C->unk0 == 0) {
                    s32 sin;
                    unk3C->unk4 = boss->unk4;
                    unk3C->unk8 = boss->unk8 + Q(14);
                    sin = COS(result & (SIN_PERIOD - 1));
                    unk3C->unkC = sin >> 5;
                    sin = SIN(result & (SIN_PERIOD - 1));
                    unk3C->unkE = sin >> 5;
                    unk3C->unk0 = -1;
                    return;
                }
            }
        }
    }
}

void sub_8045F84(EggGoRound *boss)
{

    Sprite *s = &boss->unk39C;
    bool32 animUpdated = FALSE;
    u8 i;

    for (i = 0; i < 3; i++) {
        EggGoRound_unk3C *unk3C = &boss->unk3C[i];

        if (unk3C->unk0 != 0) {
            unk3C->unk0--;

            if (!PLAYER_IS_ALIVE) {
                unk3C->unk4 += unk3C->unkC;
            } else {
                unk3C->unk4 += unk3C->unkC + 0x500;
            }
            unk3C->unk8 += unk3C->unkE;

            if (!animUpdated) {
                UpdateSpriteAnimation(s);
                animUpdated = TRUE;
            }

            if (boss->unk28 != 0) {
                sub_800C84C(s, I(unk3C->unk4), I(unk3C->unk8));
            }

            s->x = I(unk3C->unk4) - gCamera.x;
            s->y = I(unk3C->unk8) - gCamera.y;
            DisplaySprite(s);
        }
    }
}

void sub_80460DC(void);

void sub_80475D0(EggGoRound *);
void sub_8046328(EggGoRound *);
void sub_804766C(EggGoRound *);
void sub_80478D4(EggGoRound *);
void sub_804683C(EggGoRound *);
void sub_8046C28(EggGoRound *);
void sub_8047700(EggGoRound *);

void sub_8046040(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    sub_80478D4(boss);
    sub_804683C(boss);
    sub_8046C28(boss);
    sub_8047700(boss);
    sub_8045E78(boss);
    sub_8045F84(boss);
    sub_80475D0(boss);
    sub_8046328(boss);
    sub_804766C(boss);

    if (boss->unk28 == 0) {
        boss->unk2B = 0;
        boss->unk10 = 0;
        boss->unk0 = 0x80;
        boss->unk6C.unk1C0 = 0;

        gPlayer.unk3C = NULL;
        gPlayer.moveState &= ~MOVESTATE_8;
        gPlayer.moveState |= MOVESTATE_IN_AIR;

        Player_DisableInputAndBossTimer();
        gCurTask->main = sub_80460DC;
    }
}

void sub_8046198(void);

void sub_804655C(EggGoRound *, u8);
void sub_8045F84(EggGoRound *);
void sub_8047060(EggGoRound *);

void sub_80460DC(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    s32 idx;
    if (Mod(gStageTime, 21) == 0) {
        m4aSongNumStart(SE_144);
    }

    if (boss->unk0 >= 0x40) {
        idx = CLAMP_SIN_PERIOD((boss->unk0 - 0x40) * 256);

    } else {
        idx = 0;
    }

    boss->unk2B = SIN(idx) >> 0xC;

    sub_80478D4(boss);
    sub_8045F84(boss);
    sub_80475D0(boss);
    sub_804655C(boss, 0);
    sub_804766C(boss);
    sub_8047060(boss);

    gPlayer.unk3C = NULL;
    gPlayer.moveState &= ~MOVESTATE_8;

    if (--boss->unk0 == 0) {
        boss->unk2B = 0;
        boss->unk10 = 0;
        boss->unk0 = 128;
        gCurTask->main = sub_8046198;
    }
}

void sub_804732C(EggGoRound *);
void sub_8046F00(EggGoRound *);
void sub_8046244(void);

void sub_8046198(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    s32 idx;
    if (Mod(gStageTime, 17) == 0) {
        m4aSongNumStart(SE_144);
    }
    idx = CLAMP_SIN_PERIOD((boss->unk0) * 256);
    boss->unk2B = SIN(idx) >> 0xC;
    boss->unk10 = 0;
    sub_80478D4(boss);
    sub_8045F84(boss);
    sub_80475D0(boss);
    sub_804655C(boss, 1);
    sub_804766C(boss);
    sub_8046F00(boss);
    sub_8047060(boss);

    if (--boss->unk0 == 0) {
        boss->unk6C.unk1C1 = 0;
        sub_804732C(boss);
        gCurTask->main = sub_8046244;
    }
}

void sub_8047868(void);

void sub_804797C(EggGoRound *);
void sub_80475D0(EggGoRound *);
void sub_8047138(EggGoRound *);
void sub_8046E90(EggGoRound *);

void sub_8046244(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    EggGoRound_unk6C *unk6C = &boss->unk6C;
    sub_804797C(boss);
    sub_80475D0(boss);
    sub_8046E90(boss);
    sub_804766C(boss);
    sub_8047138(boss);

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_144);
    }

    if (boss->unk6C.unk1C1 == 0 && (I(unk6C->unk6C) - gCamera.x) < 50) {
        u32 flags = boss->unk1FC.unk10;
        flags &= 0x400;
        flags |= 0x1000;
        boss->unk6C.unk1C1 = 1;
        CreateEggmobileEscapeSequence(I(unk6C->unk6C) - gCamera.x,
                                      I(unk6C->unk70) - gCamera.y - 0xF, flags);
    }

    if (I(boss->unk6C.unk6C) - gCamera.x < -200 && boss->unk6C.unk1C1 != 0) {
        sub_802EF68(-40, 150, 5);
        gCurTask->main = sub_8047868;
    }
}

extern const u8 gUnknown_080D8030[];

void sub_8046328(EggGoRound *boss)
{
    u8 i, j;
    Sprite *s = &boss->unk1C4;
    u32 idx;

    s->x = I(boss->unk4) - gCamera.x;
    s->y = I(boss->unk8) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->unk1FC;
    s->x = I(boss->unk4) - gCamera.x;
    s->y = I(boss->unk8) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    for (i = 0; i < 4; i++) {
        idx = ((u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16);
        s = &boss->unk22C;
        for (j = 0; j < 3; j++) {
            s->x = (I(boss->unk4) - gCamera.x)
                + ((gUnknown_080D8030[j]
                    * COS(CLAMP_SIN_PERIOD(idx + (j * boss->unk2B))))
                   >> 14);
            s->y = (I(boss->unk8) - gCamera.y)
                + ((gUnknown_080D8030[j]
                    * SIN(CLAMP_SIN_PERIOD(idx + (j * boss->unk2B))))
                   >> 14);
            DisplaySprite(s);
        }
    }

    for (i = 0; i < 4; i++) {
        s = &boss->unk25C[i].s;
        UpdateSpriteAnimation(s);
    }

    for (i = 0; i < 4; i++) {
        u8 temp2 = gUnknown_080D8030[3];
        idx = ((u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16);
        idx = CLAMP_SIN_PERIOD(idx + (boss->unk2B * 3));
        s = &boss->unk25C[i].s;

        s->x = (I(boss->unk4) - gCamera.x) + ((COS(idx) * temp2) >> 14);
        s->y = (I(boss->unk8) - gCamera.y) + ((SIN(idx) * temp2) >> 14);

        if (boss->unk1E != 0 && boss->unk24 == 0 && (i & 1)
            && (u8)(boss->unk25 - 1) <= 1) {
            SpriteTransform *transform = &boss->unk25C[i].transform;
            transform->rotation = I(boss->unk18);
            transform->width = 0x100;
            transform->height = 0x100;
            transform->x = s->x;
            transform->y = s->y;

            s->unk10 = gUnknown_030054B8++ | 0x1020;
            sub_8004860(s, transform);
        } else {
            s->unk10 = SPRITE_FLAG(PRIORITY, 1);
        }
        DisplaySprite(s);
    }
}

void sub_804655C(EggGoRound *boss, u8 val)
{
    Sprite *s = &boss->unk1C4;
    u8 temp;
    u8 i, j;
    u32 idx;

    s->x = I(boss->unk4) - gCamera.x;
    s->y = I(boss->unk8) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->unk1FC;
    s->x = I(boss->unk4) - gCamera.x;
    s->y = I(boss->unk8) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->unk0 < 0x30 && val != 0) {
        temp = (Div(48 - boss->unk0, 16)) + 1;
    } else {
        temp = 0;
    }

    for (i = 0; i < 4; i++) {
        idx = ((u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16);
        s = &boss->unk22C;
        for (j = temp; j < 3; j++) {
            if (j & 1) {
                s->x = (I(boss->unk4) - gCamera.x)
                    + ((gUnknown_080D8030[j]
                        * COS(CLAMP_SIN_PERIOD(idx + (j * boss->unk2B))))
                       >> 14);
                s->y = (I(boss->unk8) - gCamera.y)
                    + ((gUnknown_080D8030[j]
                        * SIN(CLAMP_SIN_PERIOD(idx + (j * boss->unk2B))))
                       >> 14);
            } else {
                s->x = (I(boss->unk4) - gCamera.x)
                    + ((gUnknown_080D8030[j]
                        * COS(CLAMP_SIN_PERIOD(idx - (j * boss->unk2B))))
                       >> 14);
                s->y = (I(boss->unk8) - gCamera.y)
                    + ((gUnknown_080D8030[j]
                        * SIN(CLAMP_SIN_PERIOD(idx - (j * boss->unk2B))))
                       >> 14);
            }

            DisplaySprite(s);
        }
    }

    for (i = 0; i < 4; i++) {
        s = &boss->unk25C[i].s;
        UpdateSpriteAnimation(s);
    }

    for (i = 0; i < 4; i++) {
        u8 temp2 = gUnknown_080D8030[3];
        idx = ((u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16);
        idx = CLAMP_SIN_PERIOD(idx + (boss->unk2B * 3));
        s = &boss->unk25C[i].s;

        s->x = (I(boss->unk4) - gCamera.x) + ((COS(idx) * temp2) >> 14);
        s->y = (I(boss->unk8) - gCamera.y) + ((SIN(idx) * temp2) >> 14);

        if (boss->unk1E != 0 && boss->unk24 == 0 && (i & 1)
            && (u8)(boss->unk25 - 1) <= 1) {
            SpriteTransform *transform = &boss->unk25C[i].transform;
            transform->rotation = I(boss->unk18);
            transform->width = 0x100;
            transform->height = 0x100;
            transform->x = s->x;
            transform->y = s->y;

            s->unk10 = gUnknown_030054B8++ | 0x1020;
            sub_8004860(s, transform);
        } else {
            s->unk10 = SPRITE_FLAG(PRIORITY, 1);
        }
        DisplaySprite(s);
    }
}

extern const u8 gUnknown_080D8044[];

extern const u16 gUnknown_080D804E[][10];
extern const u16 gUnknown_080D809E[][10];
extern const u16 gUnknown_080D8076[][10];

void sub_804683C(EggGoRound *boss)
{
    Sprite *s;

    if (boss->unk1E != 0) {
        if (boss->unk24 != 0) {
            if (--boss->unk24 == 0) {
                switch (boss->unk25) {
                    case 0:
                        m4aSongNumStart(SE_255);
                        s = &boss->unk25C[0].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                        s->variant = 3;
                        s->prevVariant = -1;

                        s = &boss->unk25C[2].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                        s->variant = 3;
                        s->prevVariant = -1;
                        break;

                    case 1:
                        m4aSongNumStart(SE_255);
                        s = &boss->unk25C[1].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                        s->variant = 1;
                        s->prevVariant = -1;

                        s = &boss->unk25C[3].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                        s->variant = 1;
                        s->prevVariant = -1;
                        break;

                    case 2:
                        m4aSongNumStart(SE_255);
                        s = &boss->unk25C[0].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                        s->variant = 3;
                        s->prevVariant = -1;

                        s = &boss->unk25C[2].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                        s->variant = 3;
                        s->prevVariant = -1;

                        s = &boss->unk25C[1].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                        s->variant = 1;
                        s->prevVariant = -1;

                        s = &boss->unk25C[3].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                        s->variant = 1;
                        s->prevVariant = -1;
                        break;
                }
            }
        } else {
            if (boss->unk27 == 0) {
                boss->unk20 += gUnknown_080D809E[(boss->unk28 < 5) ? 1 : 0][boss->unk26];
                if (boss->unk20
                    == gUnknown_080D8076[boss->unk28 < 5 ? 1 : 0][boss->unk26]) {
                    boss->unk27 = 1;
                }
            } else if (boss->unk27 == 1) {
                boss->unk20 -= gUnknown_080D809E[boss->unk28 < 5 ? 1 : 0][boss->unk26];

                if (boss->unk20 == 0) {
                    boss->unk27 = 2;
                    boss->unk18 = 0;
                    boss->unk20 = 0;
                }
            }
        }

        boss->unk18 = (boss->unk18 + boss->unk20) & (0x3FFFF);
        if (--boss->unk1E == 0) {
            u8 i;
            for (i = 0; i < 4; i++) {
                s = &boss->unk25C[i].s;
                s->graphics.anim = gUnknown_080D8034[i & 1].anim;
                s->variant = 0;
                s->prevVariant = -1;
            }
            boss->unk27 = 0;
            boss->unk18 = 0;
            boss->unk20 = 0;
        }
    } else {
        boss->unk25 = gUnknown_080D8044[Mod(PseudoRandom32() & 0xFF, 10)];
        boss->unk26 = Mod(PseudoRandom32() & 0xFF, 10);

        boss->unk1E = gUnknown_080D804E[boss->unk28 < 5 ? 1 : 0][boss->unk26];
        boss->unk24 = 0x1E;

        switch (boss->unk25) {
            case 0:
                m4aSongNumStart(SE_254);
                s = &boss->unk25C[0].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;

                s = &boss->unk25C[2].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;
                break;

            case 1:
                m4aSongNumStart(SE_254);
                s = &boss->unk25C[1].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;

                s = &boss->unk25C[3].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;
                break;

            case 2:
                m4aSongNumStart(SE_254);
                s = &boss->unk25C[0].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;

                s = &boss->unk25C[2].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;

                s = &boss->unk25C[1].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;

                s = &boss->unk25C[3].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;
                break;
        }
    }
}

void sub_8047940(EggGoRound *boss);

void sub_8046C28(EggGoRound *boss)
{
    if (boss->unk28 != 0) {
        u8 i;

        for (i = 0; i < 4; i++) {
            u8 someVal = gUnknown_080D8030[3];
            u32 idx = CLAMP_SIN_PERIOD(
                ((u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16) + (boss->unk2B * 3));
            Sprite *s = &boss->unk25C[i].s;
            s32 x = I(boss->unk4) + ((COS(idx) * someVal) >> 14);
            s32 y = I(boss->unk8) + ((SIN(idx) * someVal) >> 14);

            if (boss->unk1E != 0 && boss->unk24 == 0 && (i % 2)
                && (boss->unk25 == 1 || boss->unk25 == 2)
                && ((gPlayer.moveState & MOVESTATE_8) && gPlayer.unk3C == s)) {
                gPlayer.moveState &= ~MOVESTATE_8;
                gPlayer.moveState &= ~MOVESTATE_100;
                gPlayer.moveState |= 2;
                gPlayer.unk3C = NULL;
                gPlayer.speedAirX += Q(5);
                gPlayer.speedGroundX += Q(5);
                gPlayer.speedAirY = -Q(2);
                continue;
            }

            if (boss->unk1E == 0 || boss->unk24 != 0 || !(i % 2)
                || (boss->unk25 != 1 && boss->unk25 != 2)) {
                u32 val;
                u8 someBool;
                s32 speedAirY;

                if (gPlayer.unk3C == s) {
                    someBool = TRUE;
                } else {
                    someBool = FALSE;
                }
                speedAirY = gPlayer.speedAirY;

                if (gPlayer.moveState & MOVESTATE_IN_AIR
                    || (gPlayer.moveState & MOVESTATE_8 && gPlayer.unk3C == s)) {
                    val = sub_800CCB8(s, x, y, &gPlayer);
                } else {
                    val = 0;
                }

                if (val & 0x10000) {
                    if (!someBool && gPlayer.unk3C == s && speedAirY > 0) {
                        gPlayer.speedAirX -= Q(5);
                        gPlayer.speedGroundX -= Q(5);
                    }

                    if (boss->unk1E && !boss->unk24 && !(i % 2)
                        && (boss->unk25 == 0 || boss->unk25 == 2)) {
                        sub_8047940(boss);
                        sub_800CBA4(&gPlayer);
                        return;
                    }

                    gPlayer.y += Q(2) + Q_8_8(val);
                    if (boss->unk2C[i] != 0) {
                        gPlayer.x += Q(x - (boss->unk2C[i]));
                    }
                } else if (someBool) {
                    gPlayer.moveState &= ~MOVESTATE_8;
                    gPlayer.unk3C = NULL;
                    if (!(gPlayer.moveState & MOVESTATE_100)) {
                        gPlayer.moveState &= ~MOVESTATE_100;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                    }
                }
            }

            boss->unk2C[i] = x;
        }
    }
}

void sub_8046E90(EggGoRound *boss)
{
    EggGoRound_unk6C *unk6C = &boss->unk6C;
    Sprite *s = &boss->unk1C4;
    s->x = I(unk6C->unk6C) - gCamera.x;
    s->y = I(unk6C->unk70) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->unk6C.unk1C1 == 0) {
        s = &boss->unk1FC;
        s->x = I(unk6C->unk6C) - gCamera.x;
        s->y = I(unk6C->unk70) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void sub_8046F00(EggGoRound *boss)
{
    ExplosionPartsInfo explosion;
    EggGoRound_unk6C *unk6C = &boss->unk6C;
    if (boss->unk0 < 0x32) {
        u8 i;
        u8 temp = Div(0x31 - boss->unk0, 0x10);
        if ((0x31 - (temp & 0xFF) * 0x10) != boss->unk0) {
            return;
        }

        m4aSongNumStart(SE_144);

        for (i = 0; i < 4; i++) {
            u8 j;

            u16 idx = ((u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16);
            s16 x = ((I(boss->unk4) - gCamera.x)
                     + ((gUnknown_080D8030[temp] * COS(idx)) >> 14));
            s16 y = ((I(boss->unk8) - gCamera.y)
                     + ((gUnknown_080D8030[temp] * SIN(idx)) >> 14));
            for (j = 0; j < 3; j++) {
                u32 rand;

                rand = PseudoRandom32();
                explosion.spawnX = x + (rand & 0xF) - 8;

                rand = PseudoRandom32();
                explosion.spawnY = y + (rand & 0xF) - 8;

                explosion.velocity = 0;
                rand = PseudoRandom32();
                explosion.rotation = idx - ((rand & 0x3F)) + 0x1F;
                explosion.speed = 0xA00 - (j * 0x200);
                explosion.vram = (void *)OBJ_VRAM0 + (0x2980);
                explosion.anim = SA2_ANIM_EXPLOSION;
                explosion.variant = 0;
                explosion.unk4 = 0;

                CreateBossParticleWithExplosionUpdate(&explosion, &unk6C->unk1C0);
            }
        }
    }
}

void sub_8047060(EggGoRound *boss)
{
    if ((gStageTime & 0xF) == 0) {
        u32 rand;
        s16 x, y;

        ExplosionPartsInfo explosion;
        x = (I(boss->unk4) - gCamera.x);
        y = (I(boss->unk8) - gCamera.y);
        rand = PseudoRandom32();
        explosion.spawnX = ({ x + (rand & 0x3F) - 0x1F; });

        rand = PseudoRandom32();
        explosion.spawnY = ({ y + (rand & 0x3F) - 0x1F; });

        explosion.velocity = 0;
        explosion.rotation = ({ 0x407 - ((PseudoRandom32() & 0x3F)); });
        explosion.speed = ({ 0x400 - (PseudoRandom32() & 0x1FF); });
        explosion.vram = (void *)OBJ_VRAM0 + 0x2980;
        explosion.anim = SA2_ANIM_EXPLOSION;
        explosion.variant = 0;
        explosion.unk4 = 0;

        CreateBossParticleWithExplosionUpdate(&explosion, &boss->unk6C.unk1C0);
    }
}

void sub_8047138(EggGoRound *boss)
{
    EggGoRound_unk6C *unk6C = &boss->unk6C;
    if (Mod(gStageTime, 10) == 0 && unk6C->unk1C1 == 0) {
        u32 rand;
        s16 x, y;

        ExplosionPartsInfo explosion;
        x = (I(unk6C->unk6C) - gCamera.x);
        y = (I(unk6C->unk70) - gCamera.y);
        rand = PseudoRandom32();
        explosion.spawnX = ({ x + (rand & 0x3F) - 0x1F; });

        rand = PseudoRandom32();
        explosion.spawnY = ({ y + (rand & 0x3F) - 0x1F; });

        explosion.velocity = 0;
        explosion.rotation = ({ 0x407 - ((PseudoRandom32() & 0x3F)); });
        explosion.speed = ({ 0x400 - (PseudoRandom32() & 0x1FF); });
        explosion.vram = (void *)OBJ_VRAM0 + 0x2980;
        explosion.anim = SA2_ANIM_EXPLOSION;
        explosion.variant = 0;
        explosion.unk4 = 0;

        CreateBossParticleWithExplosionUpdate(&explosion, &boss->unk6C.unk1C0);
    }
}

void sub_8047224(s32 dX, s32 dY)
{
    EggGoRound_unk6C *unk6C;
    EggGoRound *boss;

    u8 j, i;

    boss = TASK_DATA(gActiveBossTask);
    unk6C = &boss->unk6C;

    boss->unk4 += dX;
    boss->unk8 += dY;
    unk6C->unk6C += dX;
    unk6C->unk70 += dY;

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 3; j++) {
            unk6C->unkD0[i][j][0] += dX;
            unk6C->unkD0[i][j][1] += dY;
        }
    }

    for (i = 0; i < 4; i++) {
        unk6C->unk80[i][0] = dX;
        unk6C->unk80[i][1] = dY;
        boss->unk2C[i] = 0;
    }

    for (i = 0; i < 3; i++) {
        EggGoRound_unk3C *unk3C = &boss->unk3C[i];
        unk3C->unk4 += dX;
        unk3C->unk8 += dY;
    }
}

void sub_804732C(EggGoRound *boss)
{
    u8 j, i;
    u8 someVal;
// solves some stack issue
#ifndef NON_MATCHING
    EggGoRound_unk6C *unk6C_2;
#endif
    EggGoRound_unk6C *unk6C;

    u32 idx;

    unk6C = &boss->unk6C;
    boss->unk1C = 0;
#ifndef NON_MATCHING
    unk6C_2 = unk6C;
#endif
    unk6C->unk6C = boss->unk4;
    unk6C->unk70 = boss->unk8;
    unk6C->unk74 = 0x580;
    unk6C->unk78 = 0;
    unk6C->unk7C = 300;

    for (i = 0; i < 4; i++) {
        idx = (u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16;

        for (j = 0; j < 3; j++) {
#ifndef NON_MATCHING
            unk6C_2->unkD0[i][j][0]
                = boss->unk4 + ((gUnknown_080D8030[j] * COS(idx)) >> 6);
            unk6C_2->unkD0[i][j][1]
                = boss->unk8 + ((gUnknown_080D8030[j] * SIN(idx)) >> 6);
#else
            unk6C->unkD0[i][j][0]
                = boss->unk4 + ((gUnknown_080D8030[j] * COS(idx)) >> 6);
            unk6C->unkD0[i][j][1]
                = boss->unk8 + ((gUnknown_080D8030[j] * SIN(idx)) >> 6);
#endif
            unk6C->unkD0[i][j][2] = (7 - j) * 0x14;
            unk6C->unkD0[i][j][3] = 1;
            unk6C->unkD0[i][j][4] = idx;
        }
    }

    for (i = 0; i < 4; i++) {
        someVal = gUnknown_080D8030[3];
        idx = (u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16;
        unk6C->unk80[i][0] = boss->unk4 + (someVal * (COS(idx)) >> 6);
        unk6C->unk80[i][1] = boss->unk8 + (someVal * (SIN(idx)) >> 6);
        unk6C->unk80[i][2] = (6 - j) * 0x14;
        unk6C->unk80[i][3] = 1;
        unk6C->unk80[i][4] = idx;
    }
}

u32 sub_80474C0(EggGoRound *boss)
{
    Sprite *s = &boss->unk1FC;
    u32 result = 0;
    if (boss->unk28 != 0) {
        boss->unk28--;
        if (boss->unk28 & 1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }

        boss->unk2A = 0x1E;
        if (boss->unk28 == 0) {
            s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
            s->variant = 3;
            INCREMENT_SCORE(1000);
        } else {
            s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
            s->variant = 0;
        }
        s->prevVariant = -1;

    } else {
        result = 1;
    }

    if (!IS_FINAL_STAGE(gCurrentLevel) && boss->unk28 == 4) {
        gUnknown_030054A8.unk1 = 0x11;
    }

    return result;
}

void sub_80475D0(EggGoRound *boss)
{
    Sprite *s = &boss->unk1FC;
    if (boss->unk2A != 0) {
        boss->unk29 = 0;
        if (--boss->unk2A != 0) {
            return;
        }

        if (boss->unk28 == 0) {
            s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
            s->variant = 3;
        } else {
            s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
            s->variant = 0;
        }
        s->prevVariant = -1;
    } else {
        if (boss->unk29 == 0) {
            return;
        }

        if (--boss->unk29 != 0) {
            return;
        }

        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
        s->variant = 0;
        s->prevVariant = -1;
    }
}

extern const u16 gUnknown_080D80C6[][0x10];

void sub_804766C(EggGoRound *boss)
{
    u8 i;
    if (boss->unk2A != 0) {
        for (i = 0; i < 16; i++) {
            gObjPalette[0x80 + i] = gUnknown_080D80C6[(gStageTime & 2) >> 1][i];
        }
    } else {
        for (i = 0; i < 16; i++) {
            gObjPalette[0x80 + i] = gUnknown_080D80C6[1][i];
        }
    }

    gFlags |= 2;
}

void sub_8047700(EggGoRound *boss)
{
    Sprite *s = &boss->unk1C4;
    s32 x = I(boss->unk4);
    s32 y = I(boss->unk8);

    Player_UpdateHomingPosition(boss->unk4, boss->unk8);
    if (sub_800C320(s, x, y, 1, &gPlayer) != 0) {
        if (gPlayer.x > boss->unk4) {
            gPlayer.speedAirX += 0x240;
            gPlayer.x += 0x200;
        }

        gPlayer.speedAirY += 0x200;
        return;
    }

    if (boss->unk2A == 0) {
        if (IsColliding_Cheese(s, x, y, 0, &gPlayer) == TRUE
            || sub_800C320(s, x, y, 0, &gPlayer) == TRUE) {
            sub_80474C0(boss);
        } else {
            Sprite *s2;
            if (sub_800CA20(s, x, y, 0, &gPlayer) != TRUE) {
                return;
            }
            s2 = &boss->unk1FC;

            boss->unk29 = 30;
            if (boss->unk2A != 0) {
                return;
            }

            s2->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
            s2->variant = 1;
            s2->prevVariant = -1;
            return;
        }
    }
}

void sub_804787C(EggGoRound *boss);

void Task_EggGoRound(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    sub_804787C(boss);
    sub_80475D0(boss);
    sub_8046328(boss);

    if (boss->unk0 < 0x40) {
        if (boss->unk0 & 1) {
            boss->unk2B++;
        }
        boss->unk10 -= 0x2C;
        boss->unk10 -= (boss->unk0 - 0x20) * 4;
    }

    if (--boss->unk0 == 0) {
        boss->unk2B = 0;
        boss->unk10 = 0x100;
        gCurTask->main = sub_8046040;
    }
}

void sub_8047868(void) { TaskDestroy(gCurTask); }

void sub_804787C(EggGoRound *boss)
{
    boss->unk4 += boss->unkC + (boss->unk0 * 8);
    boss->unk8 += boss->unkE;
    boss->unk8 += Q(sub_801E4E4(I(boss->unk8), I(boss->unk4), 0, 8, 0, sub_801EE64));
    boss->unk14 = (boss->unk14 + boss->unk10) & 0x3FFFF;
}

void sub_80478D4(EggGoRound *boss)
{
    boss->unk4 += boss->unkC;
    boss->unk8 += boss->unkE;

    boss->unk8 += Q(sub_801F07C(I(boss->unk8), I(boss->unk4), 0, 8, 0, sub_801EE64));
    boss->unk14 = (boss->unk14 + boss->unk10) & 0x3FFFF;

    if (boss->unk28 < 5 && boss->unk10 != -0x100) {
        boss->unk10--;
    }
}

void sub_8047940(EggGoRound *boss)
{
    Sprite *s = &boss->unk1FC;
    boss->unk29 = 30;
    if (boss->unk2A == 0) {
        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

void sub_804797C(EggGoRound *boss)
{
    s32 result;
    EggGoRound_unk6C *unk6C = &boss->unk6C;
    unk6C->unk78 += 0x30;
    unk6C->unk6C += unk6C->unk74;
    unk6C->unk70 += unk6C->unk78;

    result = sub_801F100(I(unk6C->unk70) + 0x14, I(unk6C->unk6C), 1, 8, sub_801EC3C);
    if (result < 0) {
        u32 temp;
        unk6C->unk74 -= 0x40;
        if (unk6C->unk74 < 0) {
            unk6C->unk74 = 0;
        }

        temp = unk6C->unk78 * 9;
        temp *= 4;
        temp -= unk6C->unk78;
        temp *= 2;

        unk6C->unk78 = Div(-temp, 100);
        unk6C->unk70 += Q(result);
    }
}

void TaskDestructor_EggGoRound(struct Task *t)
{
    EggGoRound *boss = TASK_DATA(t);
    VramFree(boss->unk39C.graphics.dest);
    VramFree(boss->unk36C.graphics.dest);
    VramFree(boss->unk1C4.graphics.dest);
    VramFree(boss->unk1FC.graphics.dest);
    VramFree(boss->unk25C[0].s.graphics.dest);
    VramFree(boss->unk25C[1].s.graphics.dest);
    VramFree(boss->unk22C.graphics.dest);

    gActiveBossTask = NULL;
}
