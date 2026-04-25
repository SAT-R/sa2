#include "global.h"
#include "core.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/save.h"
#include "game/sa1/stage/enemies/bosses_shared.h" // CreatePreBossCameraPan
#include "game/sa1/stage/nuts_and_bolts_task.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"
#include "game/sa1/ui/stage_results.h"
#include "game/shared/stage/rings_scatter.h"
#include "game/shared/stage/screen_shake.h"
#include "game/shared/stage/stage.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/anim_sizes.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/zones.h" // for ALL_ZONE_CHAOS_EMERALDS

/* X-Zone Final Boss */

typedef struct EggX_10 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u8 unk8;
    u8 unk9;
    s16 unkA;
    s16 qUnkC;
    u16 unkE;
} EggX_10;

typedef struct EggX_48 {
    Sprite s;
    u16 unk30;
    u8 filler32[0x2];
    s32 qUnk34;
    s32 qUnk38;
    s16 qUnk3C;
    s16 qUnk3E;
    u16 unk40;
    u16 unk42;
    u16 unk44;
    u8 filler46[0x2];
} EggX_48;

typedef struct EggX_Sparkle {
    /* 0x00 */ Sprite s;
    /* 0x30 */ SpriteTransform transform;
    /* 0x3C */ u16 unk3C;
    /* 0x3E */ u8 filler3E[0x2];
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s16 unk48;
    /* 0x4A */ s16 unk4A;
    /* 0x4C */ s16 unk4C;
    /* 0x4E */ s16 unk4E;
    /* 0x50 */ s16 unk50;
    /* 0x52 */ s16 unk52;
    /* 0x52 */ s32 unk54;
    /* 0x52 */ s32 unk58;
    /* 0x5C */ s16 unk5C;
    /* 0x5E */ s16 unk5E;
    /* 0x60 */ u8 unk60;
    /* 0x61 */ u8 unk61;
    /* 0x62 */ u8 unk62;
} EggX_Sparkle;

typedef struct EggX_7C {
    Sprite s;
    Sprite s2;
    s16 unk60;
    u8 filler62[0x2];
    s32 unk64;
    s32 unk68;
    s32 unk6C;
    s32 unk70;
    u16 unk74;
    u16 unk76;
    u8 unk78;
    u8 unk79;
    u8 unk7A;
    u8 unk7B;
} EggX_7C;

typedef struct EggX {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
    /* 0x44 */ Sprite s2;
    /* 0x80 */ s32 qUnk74;
    /* 0x80 */ s32 qUnk78;
    /* 0x80 */ s32 qUnk7C;
    /* 0x80 */ s32 qUnk80;
    /* 0x84 */ s32 unk84;
    /* 0x88 */ s16 unk88;
    /* 0x8A */ s16 unk8A;
    /* 0x8C */ s16 unk8C;
    /* 0x8E */ s16 unk8E;
    /* 0x90 */ u16 unk90;
    /* 0x92 */ u16 unk92;
    /* 0x94 */ s8 unk94;
    /* 0x95 */ s8 unk95;
    /* 0x96 */ u16 unk96;
    /* 0x98 */ u8 unk98;
    /* 0x99 */ u8 unk99;
    /* 0x9A */ u8 unk9A;
    /* 0x9C */ struct Task *task9C; // -> EggX_7C
} EggX; /* 0xA0 */

void Task_EggXMain(void);
void sub_8036E20(CamCoord worldX, CamCoord worldY);
enum EHit sub_8036F9C(CamCoord worldX, CamCoord worldY, u8 arg2);
void sub_80370B4(void);
u8 sub_803711C(s16 arg0);
void Task_803753C(void);
void Task_803775C(void);
void sub_803803C(void);
void Task_8038154(void);
void sub_8038E34(void);
void sub_8038B38(void);
void sub_8038BC8(void);
void sub_8038C20(void);
void sub_8038D2C(void);
void sub_8038420(CamCoord worldX, CamCoord worldY);
void sub_8038F04(void);
void sub_8039074(u8 param0);
void sub_8039108(void);
void sub_803918C(u8 param0);
void Task_8039264(void);
void Task_803A2F8(void);
void sub_803967C(void);
void Task_80397A8(void);
void sub_8039940(void);
void Task_8039A64(void);
void sub_803A1D8(void);
void Task_803A46C(void);
void sub_803A54C(void);
void sub_803A594(void);
void sub_803A170(u32 param0);

void TaskDestructor_EggX7C(struct Task *t);
void TaskDestructor_EggX_Sparkle(struct Task *t);
void sub_80472AC(Player *p);
void TaskDestructor_EggX(struct Task *t);
void TaskDestructor_EggX48(struct Task *t);

extern const s16 gUnknown_084ACF1C[4];
extern const s16 gUnknown_084ACF24[];
extern const s16 gUnknown_084ACF2C[];
extern const s16 gUnknown_084ACF34[];

static inline void sub_803A614__inline()
{
    DmaFill16(3, 0x7FFF, &gObjPalette[12 * 16], 0x20);
    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
}

static inline void ChangeVariant2__inline()
{
    EggX *boss = TASK_DATA(TASK_PARENT(gCurTask));
    Sprite *s2 = &boss->s2;
    s2->variant = 3;
    s2->frameFlags &= ~0x4000;
    s2->prevVariant = -1;
}

static inline void sub_803A650__inline(CamCoord worldX, CamCoord worldY)
{
    enum EHit collPlayer;
    enum EHit collPartner;

    EggX_7C *strc7C = TASK_DATA(gCurTask);
    Sprite *s = &strc7C->s;
    collPlayer = sub_800BF10(s, worldX, worldY, &gPlayer);

    if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
        collPartner = sub_800BF10(s, worldX, worldY, &gPartner);
    } else {
        collPartner = HIT_NONE;
    }

    if ((collPlayer == HIT_PLAYER) || (collPartner == HIT_PLAYER)) {
        EggX *boss = TASK_DATA(TASK_PARENT(gCurTask));
        Sprite *s2 = &boss->s2;
        s2->variant = 3;
        s2->frameFlags &= ~0x4000;
        s2->prevVariant = -1;
    }
}

// sub_803A870
static inline void ChangeVariant__inline()
{
    EggX *boss = TASK_DATA(gCurTask);
    Sprite *s2 = &boss->s2;
    if ((s2->variant != 0) && (s2->frameFlags & 0x4000)) {
        s2->variant = 0;
        s2->prevVariant = -1;
    }
}

// sub_803A8AC
static inline void CopySpritePos__inline()
{
    EggX *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;

    s2->x = s->x;
    s2->y = s->y;
}

// sub_803A8CC
static inline void SetSpritePos__inline(CamCoord worldX, CamCoord worldY)
{
    EggX *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
}

static inline void sub_803A900__inline(u8 arg)
{
    EggX_7C *strc7C = TASK_DATA(gCurTask);
    switch (arg) {
        case 1:
            strc7C->unk78 = 8;
            break;
        case 2:
            strc7C->unk78 = 9;
            break;
        case 3:
            strc7C->unk78 = 10;
            break;
    }
}

void sub_8036E20(s16 worldX, s16 worldY)
{
    s32 sp0;
    s32 sp4;
    EggX *sp8;
    s32 spC;
    s32 temp_r3;
    u16 temp_r5;
    u16 temp_r6;
    u8 *temp_r1_2;
    u8 *temp_r1_3;
    u8 *temp_r1_4;
    u8 temp_r1;

    EggX *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2;
    EggX_7C *strc7C;

    if (PLAYER_IS_ALIVE) {
        boss->s.palId = 0;
    }

    if (boss->unk95 == 0) {
        EHit collPlayer = HIT_NONE;
        EHit collPartner = HIT_NONE;
        s2 = &boss->s2;
        strc7C = TASK_DATA(boss->task9C);

        if (!(4 & strc7C->unk7A)) {
            collPlayer = Coll_Player_Enemy(s, worldX, worldY, &gPlayer);
        }
        if (collPlayer == HIT_NONE) {
            collPlayer = sub_800BFEC(s, worldX, worldY, &gPlayer);
        }
        if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
            if (!(4 & strc7C->unk7A)) {
                collPartner = Coll_Player_Enemy(s, worldX, worldY, &gPartner);
            }
            if (collPartner == HIT_NONE) {
                collPartner = sub_800BFEC(s, worldX, worldY, &gPartner);
            }
        }

        if ((collPlayer == HIT_ENEMY) || (collPartner == HIT_ENEMY)) {
            boss->unk94++;
            boss->unk95 = 0x20;
            s2->variant = 2;
            s2->prevVariant = -1;
            s2->frameFlags &= 0xFFFFBFFF;
            m4aSongNumStart(0x8FU);
        } else if ((collPlayer == HIT_PLAYER) || (collPartner == HIT_PLAYER)) {
            s2->variant = 3;
            s2->prevVariant = -1;
            s2->frameFlags &= 0xFFFFBFFF;
        }
    }
}

enum EHit sub_8036F9C(CamCoord worldX, CamCoord worldY, u8 arg2)
{
    enum EHit collPlayer;
    enum EHit collPartner;
    EggX_Sparkle *sparkle = TASK_DATA(gCurTask);
    Sprite *s = &sparkle->s;

    if (arg2 == 0) {
        collPlayer = sub_800BF10(s, worldX, worldY, &gPlayer);
        if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
            collPartner = sub_800BF10(s, worldX, worldY, &gPartner);
        } else {
            collPartner = HIT_NONE;
        }
    } else {
        collPlayer = sub_800C2B8(s, worldX, worldY, &gPlayer);
        if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
            collPartner = sub_800BF10(s, worldX, worldY, &gPartner);
        } else {
            collPartner = HIT_NONE;
        }
    }
    if ((collPlayer == HIT_PLAYER) || (collPartner == HIT_PLAYER)) {
        EggX *boss = TASK_DATA(TASK_PARENT(gCurTask));
        Sprite *s2 = &boss->s2;
        s2->variant = 3;
        s2->frameFlags &= 0xFFFFBFFF;
        s2->prevVariant = -1;
    }

    if ((arg2 != 0) && (collPlayer == HIT_PLAYER) && (gRingCount == 0)) {
        Coll_DamagePlayer(&gPlayer);
        collPlayer = HIT_NONE;
    }

    return collPlayer;
}

void sub_80370B4()
{
    s8 *temp_r2;
    s8 temp_r1;

    EggX *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;

    if (boss->unk95 != 0) {
        if ((--boss->unk95 > 16) && !(boss->unk95 & 2) && PLAYER_IS_ALIVE) {
            s->palId = 253;
        }
    }

    DisplaySprite(s);
    DisplaySprite(s2);
}

u8 sub_803711C(s16 arg0)
{
    const s16 *ptr;
    s16 temp_r0;
    s16 temp_r1;
    s16 var_r0;
    s32 temp_r0_2;
    s16 var_r2_2;
    s32 var_r1;
    u8 i;

    var_r2_2 = I(gPlayer.qWorldX) - arg0;
    if (var_r2_2 < 0) {
        var_r2_2 = ABS(var_r2_2);
    }

    if (gPlayer.moveState & 2) {
        if (var_r2_2 > 120) {
            ptr = &gUnknown_084ACF34[0];
        } else {
            ptr = &gUnknown_084ACF24[0];
        }
    } else {
        if (var_r2_2 > 120) {
            ptr = &gUnknown_084ACF2C[0];
        } else {
            ptr = &gUnknown_084ACF1C[0];
        }
    }

    var_r1 = PseudoRandom32() % 100U;

    for (i = 0; i < 4; i++) {
        var_r1 -= ptr[i];

        if (var_r1 <= 0) {
            break;
        }
    }

    return ++i;
}

// (84.16%) https://decomp.me/scratch/wRxPL

void CreateEntity_EggX(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    s16 sp4;
    s16 *temp_r1_2;
    s16 *temp_r6;
    u8 *temp_r0;
    u8 *temp_r0_2;
    EggX *boss;
    Sprite *s;
    Sprite *s2;

    if (IS_MULTI_PLAYER) {
        SET_MAP_ENTITY_INITIALIZED(me);
        return;
    }
    boss = TASK_DATA(TaskCreate(Task_EggXMain, sizeof(EggX), 0x2000U, 0U, TaskDestructor_EggX));
    boss->base.regionX = regionX;
    boss->base.regionY = regionY;
    boss->base.me = me;
    boss->base.meX = me->x;
    boss->base.id = id;
    boss->unk92 = 120;
    boss->unk95 = 0;
    boss->unk99 = 0;
    boss->unk98 = 0;
    boss->qUnk74 = Q(116);
    boss->qUnk78 = Q(232);
    boss->qUnk7C = 0;
    boss->qUnk80 = 0;
    boss->unk84 = 0;
    boss->unk96 = 0;
    if (LOADED_SAVE->difficultyLevel != 0) {
        boss->unk94 = 2;
    } else {
        boss->unk94 = 0;
    }

    boss->unk88 = (me->x * 8) + (regionX << 8);
    temp_r1_2 = &boss->unk8A;
    boss->unk8A = (me->y * 8) + (regionY << 8);
    SET_MAP_ENTITY_INITIALIZED(me);
    s = &boss->s;
    s->x = boss->unk88;
    s->y = boss->unk8A;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_EGGX_BODY);
    s->oamFlags = SPRITE_OAM_ORDER(22);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_EGGX_BODY;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = 0x2000;

    s2 = &boss->s2;
    s2->x = boss->unk88;
    s2->y = boss->unk8A;
    s2->graphics.dest = ALLOC_TILES(SA1_ANIM_EGGX_EGGMAN);
    s2->oamFlags = SPRITE_OAM_ORDER(21);
    s2->graphics.size = 0;
    s2->graphics.anim = SA1_ANIM_EGGX_EGGMAN;
    s2->variant = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = 0;
    s2->prevVariant = -1;
    s2->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s2->palId = 0;
    s2->hitboxes[0].index = -1;
    s2->frameFlags = 0x2000;

    if (PLAYER_IS_ALIVE) {
        gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
        gWinRegs[WINREG_WININ] = 0x1F1F;
        gWinRegs[WINREG_WINOUT] = 0x1F1F;
        gBldRegs.bldCnt = 0xBF;
        gBldRegs.bldY = 0xC;
        gDispCnt |= 0x2000;
    }

    sub_803A614__inline();
}

void Task_EggXMain()
{
    EggX *boss = TASK_DATA(gCurTask);

    switch (boss->unk99) {
        case 0:
            if ((boss->unk88 - DISPLAY_CENTER_X) <= gCamera.x) {
                gCamera.minX = (u16)boss->unk88 - (DISPLAY_CENTER_X + 24);
                gCamera.maxX = (u16)boss->unk88 + (DISPLAY_CENTER_X + 24);
                boss->unk99 = 1;
                return;
            }
            return;
        case 1:
            if ((boss->unk8A - 40) <= gCamera.y) {
                CreatePreBossCameraPan((s16)(boss->unk8A - 40), (s16)(boss->unk8A + DISPLAY_HEIGHT));
                boss->unk99 = 2;
                return;
            }
            break;
        case 2:
            if ((gCamera.minY == (boss->unk8A - 40)) && (gCamera.maxY == (boss->unk8A + DISPLAY_HEIGHT))) {
                boss->unk99 = 3;
                return;
            }
            break;
        case 3:
            boss->unk99 = 0;
            boss->qUnk80 = -Q(1);
            boss->unk8C = boss->unk88 + I(boss->qUnk74);
            boss->unk8E = boss->unk8A + I(boss->qUnk78);
            sub_8038F04();
            gCurTask->main = Task_803753C;
            CreateScreenShake(0x400U, 4U, 0x100U, 0x7AU, 0x80U);
            gMusicManagerState.unk1 = 0x16;
            break;
    }
}

void Task_803753C()
{
    EggX *boss = TASK_DATA(gCurTask);
    EggX_7C *strc7C = TASK_DATA(boss->task9C);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    CamCoord worldX, worldY;

    boss->qUnk74 += boss->qUnk7C;
    boss->qUnk78 += boss->qUnk80;
    worldX = I(boss->qUnk74) + boss->unk88;
    worldY = I(boss->qUnk78) + boss->unk8A;

    if (boss->qUnk80 == 0) {
        boss->unk90 += 8;
        boss->unk90 &= 0x3FF;
        worldY += COS_24_8(boss->unk90) >> 6;
    } else {
        boss->unk90 = 0;
    }

    boss->unk8C = worldX;
    boss->unk8E = worldY;

    SetSpritePos__inline(worldX, worldY);
    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);

    CopySpritePos__inline();

    sub_80370B4();
    switch (boss->unk99) {
        case 0:
            if (boss->qUnk78 <= Q(110)) {
                boss->qUnk78 = Q(110);
                boss->qUnk7C = 0;
                boss->qUnk80 = 0;
                boss->unk92 = 15;
                boss->unk99++;
            }

            break;
        case 1:
            if (--boss->unk92 == 0) {
                strc7C->unk79 = 1;
                boss->unk99++;
            }
            break;
        case 2:
            if (strc7C->unk79 == 4) {
                s2->variant = 1;
                s2->prevVariant = -1;
                boss->unk99++;
            }
            break;
        case 3:
            if (s2->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
                strc7C->unk79 = 5;
                s2->variant = 0;
                s2->prevVariant = -1;
                boss->unk99++;
            }
            break;
        case 4:
            if (strc7C->unk79 == 7) {
                boss->unk92 = 0xF;
                boss->unk99++;
            }
            break;
        case 5:
            if (--boss->unk92 == 0) {
                boss->unk98 = 0xFF;
                boss->unk99 = 0;
                gCurTask->main = Task_803775C;
            }
            break;
    }
}

// (84.16%) https://decomp.me/scratch/wRxPL
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_x3__Task_803775C.inc", void Task_803775C())
{
    Sprite *s2;
    s32 sp8 = 0;
    Sprite *spC;
    Rect8 sp10;
    Sprite *sp14;
    Rect8 sp18;
    Sprite *s;
    s16 temp_r1_10;
    s16 temp_r1_11;
    s16 var_r0_2;
    s16 var_r5;
    s32 *temp_r0_14;
    s32 *temp_r3_5;
    s32 temp_r1;
    s32 temp_r1_3;
    s32 temp_r1_8;
    s32 temp_r4_2;
    s32 var_r0_4;
    s32 var_r0_6;
    s32 var_r2;
    s32 var_r4_3;
    s32 var_r6;
    u16 *temp_r2;
    s16 temp_r5_2;
    s16 var_r1_2;
    u16 var_r1_3;
    s16 var_r3;
    CamCoord worldX, worldY;
    u16 var_r4_2;

    EggX *boss = TASK_DATA(gCurTask);
    EggX_7C *strc7C;
    strc7C = TASK_DATA(boss->task9C);
    s = &boss->s;
    s2 = &boss->s2;

    if (s->frameFlags & 0x400) {
        boss->qUnk7C += boss->unk84;
        boss->qUnk74 -= boss->qUnk7C;
    } else {
        boss->qUnk7C += boss->unk84;
        boss->qUnk74 += boss->qUnk7C;
    }

    temp_r1 = boss->qUnk78 + boss->qUnk80;
    boss->qUnk78 = temp_r1;
    worldX = boss->unk88 + I(boss->qUnk74);
    worldY = boss->unk8A + I(temp_r1);
    if (boss->qUnk80 == 0) {
        boss->unk90 = (boss->unk90 + 8);
        boss->unk90 &= 0x3FF;
        worldY += (COS_24_8(boss->unk90) >> 6);
    } else {
        boss->unk90 = 0;
    }

    boss->unk8C = worldX;
    boss->unk8E = worldY;
    sub_8036E20(worldX, worldY);

    if (boss->unk94 > 7) {
        sub_803803C();
        return;
    }

    SetSpritePos__inline(worldX, worldY);

    ChangeVariant__inline();
    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    CopySpritePos__inline();
    sub_80370B4();

    switch (boss->unk99) {
        s32 rnd;
        case 0x0:
            boss->unk9A = 0;
            strc7C->unk79 = 8;
            boss->unk99++;
            rnd = ((u32)PseudoRandom32() & 0x30) >> 4;
            switch (rnd) {
                case 3:
                case 0:
                    boss->unk92 = 0x5A;
                    break;
                case 1:
                    boss->unk92 = 0xB4;
                    break;
                case 2:
                    boss->unk92 = 0xF0;
                    break;
            }

            // fallthrough
        case 0x1:
            if (--boss->unk92 != 0) {
                return;
            }

            boss->unk9A = sub_803711C(worldX);
            if (boss->unk9A != 4) {
                boss->unk92 = 10;
                boss->unk99++;
            } else {
                strc7C->unk79 = 10;
                boss->unk92 = 0x14;
                boss->unk99 = 64;
            }

            break;
        case 0x2:
            strc7C->unk7A = strc7C->unk7A & 0x1;
            if (strc7C->unk7A == 0) {
                return;
            }

            if (--boss->unk92 == 0) {
                boss->unk92 = 0xA;
                boss->unk99++;
                strc7C->unk79 = 0xA;
            }

            break;
        case 0x3:
            if (!(2 & strc7C->unk7A)) {
                return;
            }

            if (--boss->unk92 != 0) {
                return;
            }
            strc7C->unk79 = 0xD;
            boss->unk99 = boss->unk9A * 0x10;

            if (boss->unk9A == 2) {
                boss->unk92 = 0x1E;
                m4aSongNumStart(0xACU);
            } else if (boss->unk9A == 1) {
                boss->unk92 = 0;
            }

            break;
        case 0x4:
            strc7C->unk79 = 0xF;
            boss->unk9A = 0;
            boss->unk99++;
            break;
        case 0x10:
            sub_803967C();
            boss->unk92++;
            boss->qUnk7C = 0x200;
            boss->unk84 = -0x40;
            boss->unk99++;
            break;
        case 0x11:
            var_r2 = 0;
            if (boss->qUnk7C <= 0) {
                temp_r1_8 = boss->unk84;
                if (temp_r1_8 < 0) {
                    var_r0_4 = temp_r1_8 + 3;
                } else {
                    var_r0_4 = temp_r1_8;
                }
                boss->unk84 -= (var_r0_4 >> 2);
            }
            if (s->frameFlags & 0x400) {
                if (boss->qUnk74 >= -0x7400) {
                    boss->qUnk74 = -0x7400;
                    var_r2 = 1;
                }
            } else {
                if (boss->qUnk74 <= 0x7400) {
                    boss->qUnk74 = 0x7400;
                    var_r2 = 0xFF;
                }
            }

            if (var_r2 != 0) {
                boss->qUnk7C = 0;
                temp_r0_14 = &boss->unk84;
                boss->unk84 = 0;
                if (boss->unk92 != 0) {
                    boss->unk99 = 4;
                } else {
                    boss->unk99 = 0x10;
                }
            }

            break;

        case 0x20:
            if (--boss->unk92 == 0) {
                boss->unk99 = 4;
                if (PLAYER_IS_ALIVE || (gNumLives != 0)) {
                    gWinRegs[WINREG_WININ] = 0x1F1F;
                    gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
                    gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
                }
                break;
            }

            if (PLAYER_IS_ALIVE || (gNumLives != 0)) {
                gWinRegs[4] = 0x3F3F;
            }

            var_r1_2 = boss->unk92 - 15;
            if (var_r1_2 < 0) {
                var_r1_2 = -var_r1_2;
            }
            var_r1_3 = (15 - (s16)var_r1_2);
            var_r4_2 = var_r1_3;
            if ((s16)var_r1_3 > 0xB) {
                var_r1_3 = 0xC;
                var_r4_2 = 0xB;
            }

            temp_r1_10 = var_r1_3;
            var_r5 = s->y - var_r1_3;
            temp_r1_11 = s->y + var_r1_3;
            var_r3 = (u16)temp_r1_11;
            if (temp_r1_11 > DISPLAY_HEIGHT) {
                var_r3 = DISPLAY_HEIGHT;
            }

            if (s->frameFlags & 0x400) {
                u16 some_r0, some_v;
                if (PLAYER_IS_ALIVE || (gNumLives != 0)) {
                    gWinRegs[WINREG_WIN0H] = WIN_RANGE(s->x + 32, DISPLAY_WIDTH);
                    gWinRegs[WINREG_WIN0V] = WIN_RANGE(var_r5, var_r3);
                }

                {
                    // Likely easily matchable once sub_803A6EC__inline() matches
                    u16 v0;
                    var_r5 = gCamera.x + DISPLAY_CENTER_X;
                    v0 = ((u16)s->x - 88);
                    spC = NULL;
                    sp10.left = -v0;
                    sp10.right = 120;
                    sp10.top = -temp_r4_2;
                    sp10.bottom = +temp_r4_2;

                    var_r6 = sub_800C1E8(spC, sp10, worldX, worldY, &gPlayer);
                    if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
                        var_r0_6 = sub_800C1E8(spC, sp10, worldX, worldY, &gPlayer);
                    } else {
                        var_r0_6 = 0;
                    }
                }
            }
            if (PLAYER_IS_ALIVE || (gNumLives != 0)) {
                gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, s->x - 0x20);
                gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, (s16)var_r3 | ((temp_r5_2 << 0x10) >> 8));
            }

            // Likely easily matchable once sub_803A6EC__inline() matches
            var_r5 = (u16)gCamera.x + DISPLAY_CENTER_X;
            sp14 = 0;
            sp18.left = 88;
            sp18.right = s->x - 0x98;
            sp18.top = -var_r4_2;
            sp18.bottom = +var_r4_2;

            var_r6 = sub_800C1E8(sp14, sp18, worldX, worldY, &gPlayer);
            if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
                var_r0_6 = sub_800C1E8(sp14, sp18, worldX, worldY, &gPlayer);
            } else {
                var_r0_6 = 0;
            }
            if ((var_r6 | var_r0_6) == 2) {
                ChangeVariant2__inline();
            }

            break;
        case 0x30:
            sub_8039940();
            boss->unk99++;
            break;
        case 0x32:
            boss->unk99 = 4;
            break;
        case 0x33:
            boss->qUnk7C = -Q(2);
            boss->unk92 = 0;
            boss->unk99++;
            break;
        case 0x34:
            if (boss->unk92 != 0) {
                strc7C->unk79 = 0xF;
                boss->unk92 = 0;
            }
            var_r2 = 0;
            if (s->frameFlags & 0x400) {
                if (boss->qUnk74 >= +0xD000) {
                    sp8 = 0xD000;
                    var_r2 = 1;
                }
            } else {
                if (boss->qUnk74 <= -0xD000) {
                    sp8 = -0xD000;
                    var_r2 = 0xFF;
                }
            }

            if (var_r2 != 0) {
                boss->qUnk74 = sp8;
                s->frameFlags ^= 0x400;
                s2->frameFlags ^= 0x400;
                boss->unk99++;
            }
            break;
        case 0x35:
            var_r2 = 0;
            if (s->frameFlags & 0x400) {
                if (boss->qUnk74 >= -0x7400) {
                    sp8 = -0x7400;
                    var_r2 = 1;
                }
            } else {
                if (boss->qUnk74 <= 0x7400) {
                    sp8 = 0x7400;
                    var_r2 = 0xFF;
                }
            }

            if (var_r2 != 0) {
                boss->qUnk74 = sp8;
                boss->qUnk7C = 0;
                boss->unk99 = 0;
            }
            break;

        case 0x40:
            if (2 & strc7C->unk7A) {
                if (--boss->unk92 == 0) {
                    boss->qUnk7C = -0x300;
                    boss->unk99++;
                    break;
                }
            }
            break;

        case 0x41:
            var_r2 = 0;
            if (s->frameFlags & 0x400) {
                if (boss->qUnk74 >= 0xD000) {
                    sp8 = 0xD000;
                    var_r2 = 1;
                }
            } else if (boss->qUnk74 <= -Q(208)) {
                sp8 = -Q(208);
                var_r2 = 0xFF;
            }

            if (var_r2 != 0) {
                boss->qUnk7C = -0x200;
                strc7C->unk79 = 0x13;
                boss->qUnk74 = sp8;
                s->frameFlags ^= 0x400;
                s2->frameFlags ^= 0x400;
                boss->unk99++;
                break;
            }
            break;

        case 0x42:
            var_r2 = 0;
            if (s->frameFlags & 0x400) {
                if (boss->qUnk74 >= -Q(116)) {
                    boss->qUnk74 = -Q(116);
                    boss->qUnk7C = 0;
                    var_r2 = 1;
                }
            } else {
                if (boss->qUnk74 <= +Q(116)) {
                    boss->qUnk74 = +Q(116);
                    boss->qUnk7C = 0;
                    var_r2 = 0xFF;
                }
            }

            if (var_r2 != 0) {
                if (4 & strc7C->unk7A) {
                    boss->unk99 = 0;
                    break;
                }
            }

            break;

        case 0x5:
            if (4 & strc7C->unk7A) {
                boss->unk99 = 0;
                break;
            }
            break;
    }
}
END_NONMATCH

void sub_803803C(void)
{
    EggX *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    boss->unk99 = 0;
    boss->qUnk7C = 0;
    boss->qUnk80 = 0;
    boss->s2.variant = 2;
    boss->s2.prevVariant = 0xFF;
    gCamera.minX = gCamera.x;
    gCamera.maxX = gCamera.x + DISPLAY_WIDTH;
    m4aSongNumStart(SE_EXPLOSION);

    s->frameFlags &= ~0x180;
    if (PLAYER_IS_ALIVE) {
        gDispCnt &= ~DISPCNT_OBJWIN_ON;
        gWinRegs[WINREG_WINOUT] = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
        gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON | DISPCNT_OBJWIN_ON);
    }

    gPlayer.qSpeedGround = 0;
    gPlayer.moveState |= 0x200000;
    gPlayer.heldInput = 0;
    gPlayer.frameInput = 0;
    gStageFlags |= 3;

    INCREMENT_SCORE_A(1000);

    Task_8038154();
    gCurTask->main = Task_8038154;
}

void Task_8038154()
{
    Sprite *s;
    Sprite *s2;
    s32 res;

    CamCoord worldX = 0;
    CamCoord worldY = 0;

    EggX *boss = TASK_DATA(gCurTask);
    s = &boss->s;
    s2 = &boss->s2;

    if (boss->unk99 <= 1U) {
        if (boss->unk99 == 0) {
            boss->qUnk80 += 0x10;
        }

        boss->qUnk74 += boss->qUnk7C;
        boss->qUnk78 += boss->qUnk80;
        worldX = boss->unk88 + I(boss->qUnk74);
        worldY = boss->unk8A + I(boss->qUnk78);
        boss->unk8C = (s16)worldX;
        boss->unk8E = (s16)worldY;
        if (!(7 & boss->unk92)) {
            sub_8038420(worldX, worldY);
        }
        UpdateSpriteAnimation(s);
        UpdateSpriteAnimation(s2);

        SetSpritePos__inline(worldX, worldY);
        CopySpritePos__inline();
        DisplaySprite(s);
        DisplaySprite(s2);
    }

    switch (boss->unk99) {
        case 0:
            boss->unk92--;
            res = sa2__sub_801F100(worldY + 20, worldX, 1, 8, sa2__sub_801EC3C);
            if (res < 0) {
                boss->qUnk78 += Q(res);
                boss->qUnk80 = (boss->qUnk80 >> 2) - boss->qUnk80;
                if (boss->qUnk80 > -Q(1)) {
                    boss->qUnk80 = 0;
                    boss->unk92 = 240;
                    boss->unk99++;
                    if ((gSelectedCharacter == CHARACTER_SONIC) //
                        && (gCurrentLevel > 0xB) //
                        && (LOADED_SAVE->chaosEmeralds == ALL_ZONE_CHAOS_EMERALDS) //
                        && (LOADED_SAVE->unlockedLevels[0] > 0xCU) //
                        && (LOADED_SAVE->unlockedLevels[1] > 0xCU) //
                        && (LOADED_SAVE->unlockedLevels[2] > 0xCU) //
                        && (LOADED_SAVE->unlockedLevels[3] > 0xCU) //
                        && ((LOADED_SAVE->unlockedLevels[0] != 0xF) || (gMultiplayerCurrentLevel != 0xC))) {
                        sub_803A54C();
                    } else {
                        sub_803A594();
                    }
                }
            }
            break;

        case 1:
            if (--boss->unk92 == 0) {
                if ((gSelectedCharacter == CHARACTER_SONIC) //
                    && (gCurrentLevel > 0xB) //
                    && (LOADED_SAVE->chaosEmeralds == ALL_ZONE_CHAOS_EMERALDS) //
                    && (LOADED_SAVE->unlockedLevels[0] > 0xCU) //
                    && (LOADED_SAVE->unlockedLevels[1] > 0xCU) //
                    && (LOADED_SAVE->unlockedLevels[2] > 0xCU) //
                    && (LOADED_SAVE->unlockedLevels[3] > 0xCU) //
                    && ((LOADED_SAVE->unlockedLevels[0] != 0xF) || (gMultiplayerCurrentLevel != 0xC))) {
                    CreatePostBossEggMobile(worldX, worldY - 8);
                }

                gMusicManagerState.unk1 = 0x36;
                sub_8017540(Q(worldX), (worldY - 24) << 8);
                sub_8017540(Q(worldX - 16), Q(worldY));
                sub_8017540(Q(worldX + 16), Q(worldY));
                sub_8017540(Q(worldX), Q(worldY + 24));
                boss->unk99++;
            }
            break;

        case 2:
            TaskDestroy(gCurTask);
            return;

            break;
    }
}

// NOTE: The contents of this function might originally have been from a macro or inline proc?
//       Many bosses calling CreateNutsAndBoltsTask have this same structure, almost identically.
void sub_8038420(CamCoord worldX, CamCoord worldY)
{
    struct Task *t;
    NutsAndBolts *bolts;
    Sprite *sprBolts;
    s32 rndIndex = PseudoRandom32() % ARRAY_COUNT(gUnknown_080BB41C);
    s32 rndTheta;
    s32 a0, a1;
    s32 rnd;
    t = CreateNutsAndBoltsTask(0x2000U, VramMalloc(gUnknown_080BB434[rndIndex]), gUnknown_080BB41C[rndIndex], gUnknown_080BB42C[rndIndex],
                               TaskDestructor_NutsAndBolts);
    bolts = TASK_DATA(t);
    sprBolts = &bolts->s;
    bolts->qUnk30 = Q(worldX);
    bolts->qUnk34 = Q(worldY + 16);
    sprBolts->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    sprBolts->oamFlags = SPRITE_OAM_ORDER(23);
    bolts->qUnk3E = Q(5. / 256.);
    bolts->qUnk40 = Q(32. / 256.);
    rndTheta = PseudoRandom32();
    bolts->qUnk3A = (-(SIN(rndTheta & 0x1FF) * 0x600)) >> 0xE;
    bolts->qUnk38 = (-(COS(rndTheta & 0x1FF) * 0x600)) >> 0xE;

    rnd = PseudoRandom32();
    sub_8017540(Q((worldX + (0x3F & rnd)) - 32), Q(worldY + 32 - ((rnd & 0x3F0000) >> 0x10)));
}

void Task_8038554()
{
    EggX_10 *strc10 = TASK_DATA(gCurTask);

    switch (strc10->unk8) {
        case 0: {
            if (strc10->unk6 != 0) {
                strc10->unk6--;
            } else if (!(gPlayer.moveState & 2)) {
                gPlayer.heldInput = 0x10;
                gRefCollision = gCollisionTable[gCurrentLevel];
                gCamera.maxX = gRefCollision->pxWidth;
                strc10->unk8++;
            }
        } break;

        case 1: {
            if (gPlayer.qWorldX >= Q(3680)) {
                gPlayer.heldInput = 0x20;
                strc10->unk6 = 0xCU;
                sub_8038C20();
                strc10->unk8++;
                Bosses_SetCamBounds(gCamera.minY, gCamera.maxY, ((gPlayer.qWorldX >> 8) - 96), gCamera.maxX);
            }
        } break;

        case 2: {
            if (--strc10->unk6 == 0) {
                gPlayer.heldInput = 0;
                gPlayer.charState = 0x34;
                gPlayer.moveState |= 0x400000;
                strc10->unk6 = 0x3CU;
                strc10->unk8++;
            }
        } break;

        case 3: {
            if (--strc10->unk6 == 0) {
                strc10->unk6 = CreateStageResults(gRingCount, gCourseTime);
                strc10->unk8++;
            }
        } break;

        case 4: {
            gPlayer.sa2__unk72 = 0x3C;

            if (--strc10->unk6 == 0) {
                gPlayer.charState = CHARSTATE_50;
                gPlayer.moveState |= 0x400000;
                gPlayer.qWorldY -= Q(16);
                strc10->unkE = 0;
                strc10->qUnkC = 0;
                strc10->unk6 = 0;
                strc10->unk8++;
                break;
            }
        } break;

        case 5: {
            if (++strc10->unk6 == 0x22) {
                sub_8038B38();
            }

            if (strc10->unk6 > 0x99U) {
                gPlayer.charState = 0x33;
                strc10->qUnkC = Q(1);
                strc10->unk6 = 120;
                strc10->unk8++;
                break;
            }

            if (strc10->unk6 > 33) {
                s16 theta;
                s16 v;
                strc10->unkE = ((strc10->unkE + 0x10));
                strc10->unkE &= ONE_CYCLE;
                theta = strc10->unkE;
                v = SIN(theta);
                v >>= 11;
                gPlayer.qWorldY = Q(strc10->unkA + (v));
            } else if (strc10->unk6 > 0x1FU) {
                strc10->qUnkC += Q(4);
                gPlayer.qWorldY += strc10->qUnkC;
                strc10->unkA = I(gPlayer.qWorldY);
            } else if (strc10->unk6 > 0x19U) {
                strc10->qUnkC -= Q(1.5);
                gPlayer.qWorldY += strc10->qUnkC;
            }
        } break;

        case 6: {
            if (gPlayer.qWorldX <= Q(3872)) {
                strc10->qUnkC += Q(0.5);
                gPlayer.qWorldX += strc10->qUnkC;
            } else {
                gPlayer.moveState |= 0x100000;
            }

            if (--strc10->unk6 == 0) {
                sub_8038D2C();
                strc10->unk6 = 0xB4U;
                strc10->unk8++;
                break;
            }
        } break;

        case 7: {
            if (--strc10->unk6 == 0) {
                gWinRegs[4] = 0x3F3F;
                gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
                gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
                gBldRegs.bldCnt = 0xBF;
                gBldRegs.bldY = 0;
                gDispCnt |= 0x2000;
                gDispCnt &= 0xBFFF;
                strc10->unk6 = 0;
                strc10->unk8++;
                break;
            }
        } break;

        case 8: {
            if (++strc10->unk6 > 0x80U) {
                TasksDestroyInPriorityRange(0x2000U, 0x2FFFU);
                TaskDestroy(gCurTask);
                GoToNextLevel();
            } else {
                gBldRegs.bldY = strc10->unk6 >> 3;
            }
        } break;
    }

    if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
        s32 v = (u8)strc10->unk8;
        if (v >= 0) {
            if (v <= 4) {
                switch (strc10->unk9) {
                    case 0:
                        if (gPartner.qWorldX >= Q(3632)) {
                            gPartner.moveState |= 0x200000;
                            gPartner.frameInput = 0;
                            gPartner.heldInput = DPAD_LEFT;
                            strc10->unk9++;
                        }
                        break;

                    case 1:
                        if (gPartner.qSpeedGround <= Q(0.5)) {
                            gPartner.heldInput = 0;
                            strc10->unk9++;
                        }
                        break;

                    case 2:
                        if (gPartner.charState == 0) {
                            gPartner.moveState |= 0x400000;
                            strc10->unk9++;
                        }
                        /* fallthrough */
                    case 3:
                        sub_80472AC(&gPartner);
                        break;
                }
            } else if (gPartner.charState != 0x3D) {
                gPartner.charState = 0x3D;
            }
        } else {
            if (gPartner.charState != 0x3D) {
                gPartner.charState = 0x3D;
            }
        }
    }
}

void Task_Strc10_803891C()
{
    const Collision *temp_r0_7;
    s32 rndX, rndY;
    CamCoord x, y;

    EggX_10 *strc10 = TASK_DATA(gCurTask);

    if ((++strc10->unk4 & 3) == 0) {
        rndX = PseudoRandom32();
        x = (rndX % DISPLAY_WIDTH) + gCamera.x;
        rndY = PseudoRandom32();
        y = (rndY % DISPLAY_HEIGHT) + gCamera.y;
        sub_8038420(x, y);
    }

    if (++strc10->unk2 >= strc10->unk0) {
        strc10->unk2 = 0;
        strc10->unk0 -= 2;
        if (strc10->unk0 < 4) {
            strc10->unk0 = 4;
        }

        x = I(gPlayer.qWorldX) - 48;
        y = I(gPlayer.qWorldY);
        sub_8038420(x, y);
    }

    switch (strc10->unk8) {
        case 0:
            if (strc10->unk6 != 0) {
                strc10->unk6--;
            } else if (!(gPlayer.moveState & MOVESTATE_IN_AIR)) {
                gPlayer.heldInput = 0x10;
                gRefCollision = gCollisionTable[gCurrentLevel];
                gCamera.maxX = gRefCollision->pxWidth;

                strc10->unk8++;
            }

            break;
        case 1:
            if ((s32)gPlayer.qWorldX > 0xBFFFF) {
                gWinRegs[4] = 0x3F3F;
                gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
                gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
                gBldRegs.bldCnt = 0xBF;
                gBldRegs.bldY = 0;
                gDispCnt |= 0x2000;
                gDispCnt &= 0xBFFF;
                strc10->unk6 = 0;
                strc10->unk8++;
            }
            break;

        case 2:
            if (++strc10->unk6 > 128) {
                gPlayer.heldInput = 0;
                gPlayer.qSpeedAirX = 0;
                gPlayer.qSpeedAirY = 0;
                gPlayer.qSpeedGround = 0;
                gPlayer.moveState |= 0x100000;
                TasksDestroyInPriorityRange(0x2000U, 0x2FFFU);
                CreateStageResults((u32)gRingCount, gCourseTime);
                TaskDestroy(gCurTask);
                gBldRegs.bldCnt &= 0xFFEF;
                return;
            } else {
                gBldRegs.bldY = strc10->unk6 >> 3;
                gCamera.shiftX = 0 - ((u16)strc10->unk6 >> 1);
            }
            break;
    }
}

void sub_8038B38(void)
{
    struct Task *t;
    EggX_48 *strc48;
    Sprite *s;

    // Needed for matching... (puts IWRAM-address to the beginning of the func)
    EggX_10 *strc10 = TASK_DATA(gCurTask);

    strc48 = TASK_DATA(TaskCreate(sub_8038BC8, sizeof(EggX_48), 0x2100U, 0U, TaskDestructor_EggX48));
    strc48->unk30 = 0xF;
    strc48->s.graphics.dest = VramMalloc(0x38U);
    strc48->s.oamFlags = 0x440;
    strc48->s.graphics.size = 0;
    strc48->s.graphics.anim = SA1_ANIM_SUPER_SONIC_TRANSFORM;
    strc48->s.variant = 1;
    strc48->s.animCursor = 0;
    strc48->s.qAnimDelay = 0;
    strc48->s.prevVariant = 0xFF;
    strc48->s.animSpeed = SPRITE_ANIM_SPEED(1.0);
    strc48->s.palId = 0;
    strc48->s.frameFlags = 0x2000;
}

void sub_8038BC8(void)
{
    EggX_48 *strc48 = TASK_DATA(gCurTask);

    Sprite *s = &strc48->s;
    s->x = I(gPlayer.qWorldX) - gCamera.x;
    s->y = I(gPlayer.qWorldY) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (--strc48->unk30 == 0) {
        TaskDestroy(gCurTask);
    }
}

void sub_8038C20(void)
{
    EggX_Sparkle *sparkle;
    Sprite *s;
    SpriteTransform *tf;

    sparkle = TASK_DATA(TaskCreate(sub_8038E34, sizeof(EggX_Sparkle), 0x2100U, 0U, TaskDestructor_EggX_Sparkle));
    sparkle->unk50 = 0xEF4;
    sparkle->unk52 = 0x120;
    sparkle->unk54 = 0;
    sparkle->unk58 = 0;
    sparkle->unk5C = -8;
    sparkle->unk5E = 4;
    sparkle->unk4A = 0x1000;
    sparkle->unk4C = -1;
    sparkle->unk3C = 0x258;

    s = &sparkle->s;
    s->graphics.dest = VramMalloc(4U);
    s->oamFlags = 0x5C0;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_FINAL_CUTSCENE_SPARKLE_A;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2030;

    tf = &sparkle->transform;
    tf->rotation = 0;
    tf->qScaleX = 0x100;
    tf->qScaleY = 0x100;
}

void sub_8038D2C(void)
{
    EggX_Sparkle *sparkle;
    Sprite *s;
    SpriteTransform *tf;

    sparkle = TASK_DATA(TaskCreate(sub_8038E34, sizeof(EggX_Sparkle), 0x2100U, 0U, TaskDestructor_EggX_Sparkle));
    sparkle->unk50 = 0xEF4;
    sparkle->unk52 = 0x120;
    sparkle->unk54 = 0;
    sparkle->unk58 = 0;
    sparkle->unk5C = -12;
    sparkle->unk5E = 6;
    sparkle->unk4A = 0x1000;
    sparkle->unk4C = -1;
    sparkle->unk3C = 0x258;

    s = &sparkle->s;
    s->graphics.dest = VramMalloc(16);
    s->oamFlags = 0x5C0;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_FINAL_CUTSCENE_SPARKLE_B;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2030;

    tf = &sparkle->transform;
    tf->rotation = 0;
    tf->qScaleX = 0x100;
    tf->qScaleY = 0x100;
}

void sub_8038E34()
{
    SpriteTransform *tf;

    EggX_Sparkle *sparkle = TASK_DATA(gCurTask);
    CamCoord worldX, worldY;

    tf = &sparkle->transform;
    sparkle->unk54 += sparkle->unk5C;
    sparkle->unk58 += sparkle->unk5E;
    worldX = sparkle->unk50 + I(sparkle->unk54);
    worldY = sparkle->unk52 + I(sparkle->unk58);
    tf->x = worldX - gCamera.x;
    tf->y = worldY - gCamera.y;
    sparkle->unk4A += sparkle->unk4C;

    if (sparkle->unk4A <= Q(8)) {
        sparkle->unk4A = Q(8);
    }

    tf->qScaleX = sparkle->unk4A >> 4;
    tf->qScaleY = sparkle->unk4A >> 4;
    UpdateSpriteAnimation(&sparkle->s);
    TransformSprite(&sparkle->s, tf);
    DisplaySprite(&sparkle->s);

    if (--sparkle->unk3C == 0) {
        TaskDestroy(gCurTask);
    }
}

void sub_8038F04(void)
{
    Sprite *s;
    Sprite *s2;
    EggX_7C *strc7C;
    EggX *boss = TASK_DATA(gCurTask);
    struct Task *t;
    CamCoord worldX, worldY;

    t = TaskCreate(Task_8039264, sizeof(EggX_7C), 0x2001U, 0U, TaskDestructor_EggX7C);
    boss->task9C = t;
    strc7C = TASK_DATA(t);
    strc7C->unk74 = boss->unk88 + I(boss->qUnk74);
    strc7C->unk76 = boss->unk8A + I(boss->qUnk78);
    strc7C->unk64 = 0;
    strc7C->unk68 = 0xFFFFE900;
    strc7C->unk6C = 0;
    strc7C->unk70 = 0;
    strc7C->unk78 = 0;
    strc7C->unk79 = 0;
    strc7C->unk7A = 0;
    s = &strc7C->s;
    s->graphics.dest = VramMalloc(0xCU);
    s->oamFlags = 0x500;
    s->graphics.size = 0;
    s->graphics.anim = 0x2B0;
    s->variant = 8;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    s2 = &strc7C->s2;
    s2->graphics.dest = VramMalloc(0xCU);
    s2->oamFlags = 0x500;
    s2->graphics.size = 0;
    s2->graphics.anim = 0x2B0;
    s2->variant = 0xB;
    s2->animCursor = 0;
    s2->qAnimDelay = 0;
    s2->prevVariant = -1;
    s2->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s2->palId = 0;
    s2->hitboxes[0].index = -1;
    s2->frameFlags = 0x2000;
}

void sub_8039074(u8 param0)
{
    u8 var_r0;

    EggX_7C *strc7C = TASK_DATA(gCurTask);

    switch (param0) {
        case 1:
            strc7C->s.variant = 4;
            strc7C->s2.variant = 5;
            strc7C->s.prevVariant = -1;
            strc7C->s2.prevVariant = -1;
            strc7C->unk78 = 4;
            break;
        case 2:
            strc7C->s.variant = 2;
            strc7C->s2.variant = 3;
            strc7C->s.prevVariant = -1;
            strc7C->s2.prevVariant = -1;
            strc7C->unk78 = 2;
            break;
        case 3:
            strc7C->s.variant = 6;
            strc7C->s2.variant = 7;
            strc7C->s.prevVariant = -1;
            strc7C->s2.prevVariant = -1;
            strc7C->unk78 = 6;
            break;
    }
}

void sub_8039108(void)
{
    EggX_7C *strc7C = TASK_DATA(gCurTask);

    switch (strc7C->s.variant) {
        case 4:
            strc7C->s.variant = 0xE;
            strc7C->s2.variant = 17;
            strc7C->s.prevVariant = -1;
            strc7C->s2.prevVariant = -1;
            strc7C->unk78 = 14;
            break;
        case 2:
            strc7C->s.variant = 15;
            strc7C->s2.variant = 18;
            strc7C->s.prevVariant = -1;
            strc7C->s2.prevVariant = -1;
            strc7C->unk78 = 15;
            break;
        case 6:
            strc7C->s.variant = 16;
            strc7C->s2.variant = 19;
            strc7C->s.prevVariant = -1;
            strc7C->s2.prevVariant = -1;
            strc7C->unk78 = 16;
            break;
    }
}

void sub_803918C(u8 param0)
{
    EggX_7C *strc7C = TASK_DATA(gCurTask);
    Sprite *s = &strc7C->s;
    Sprite *s2 = &strc7C->s2;

    if (s->frameFlags & 0x4000) {
        if (s->variant == param0) {
            strc7C->unk7A |= 1;
            return;
        } else {
            switch (s->variant - 8) {
                case 0:
                case 6:
                    s->variant = 10;
                    s2->variant = 13;
                    break;
                case 1:
                case 7:
                    s->variant = 8;
                    s2->variant = 11;
                    break;
                case 2:
                case 8:
                    s->variant = 9;
                    s2->variant = 12;
                    break;
            }
            s->prevVariant = 0xFF;
            s2->prevVariant = -1;
        }
    }

    strc7C->unk7A &= ~1;
}

void Task_8039264()
{
    enum EHit collPlayer;
    enum EHit collPartner;
    s16 temp_r2;
    s32 worldX32, worldY32;
    CamCoord worldX, worldY;
    s32 temp_r0_4;
    s32 temp_r0_7;
    s32 temp_r0_8;
    s32 temp_r1;
    s32 temp_r3_2;
    s32 var_r0;
    s32 var_r0_2;
    u16 temp_r0_6;
    u16 temp_r0_9;
    u16 temp_r2_2;
    u8 *temp_r1_2;
    u8 *temp_r1_4;
    u8 *temp_r1_5;
    u8 *temp_r3;
    u8 *temp_r4_2;
    u8 *var_r0_3;
    u8 temp_r0_5;
    u8 var_r0_4;
    u8 var_r1;
    u8 var_r1_2;

    u32 mask;

    EggX_7C *strc7C = TASK_DATA(gCurTask);
    EggX *boss = TASK_DATA(TASK_PARENT(gCurTask));
    Sprite *s = &strc7C->s;
    Sprite *s2 = &strc7C->s2;
    s->frameFlags &= 0xFFFFFBFF;
    s2->frameFlags &= 0xFFFFFBFF;
    mask = boss->s.frameFlags & 0x400;
    s->frameFlags |= mask;
    s2->frameFlags |= mask;

    if (boss->s.palId != 0) {
        s2->palId = s->palId = 254;
    } else {
        s2->palId = s->palId = 0;
    }

    strc7C->unk74 = boss->unk8C;
    strc7C->unk76 = boss->unk8E;
    if (boss->unk94 > 7) {
        if (strc7C->unk79 != 0) {
            if (s->variant != 6) {
                sub_8039108();
            }
            strc7C->unk79 = 0;
        }
        strc7C->unk6C = 0;
        strc7C->unk70 = 0;
        if (boss->unk99 > 1U) {
            TaskDestroy(gCurTask);
            return;
        }
    } else {
        switch (strc7C->unk79) {
            case 0:
                break;
            case 1: {
                EggX_7C *strc7C_ = TASK_DATA(gCurTask);
                strc7C_->unk78 = 8;
                if (1 & strc7C->unk7A) {
                    strc7C->unk60 = 30;
                    goto lbl;
                }
            } break;
            case 2:
                if (--strc7C->unk60 == 0) {
                    strc7C->unk70 = 0x100;
                    strc7C->unk79++;
                    break;
                }
                break;
            case 3:
                if ((strc7C->unk68 + strc7C->unk70) >= 0) {
                    strc7C->unk68 = 0;
                    strc7C->unk70 = 0;
                    strc7C->unk79++;
                }
                break;
            case 4:
                break;
            case 5:
                strc7C->unk70 = -0x100;
                strc7C->unk79++;
                break;
            case 7:
                break;
            case 8:
                strc7C->unk68 = -0x1700;
                strc7C->unk78 = 0;
                strc7C->unk79++;
                /* fallthrough */
            case 9:
                if (boss->unk9A != 0) {
                    sub_803A900__inline(boss->unk9A);
                }
                break;
            case 10:
                strc7C->unk70 = 0x200;
                strc7C->unk79++;
                /* fallthrough */
            case 11:
                if ((strc7C->unk68 + strc7C->unk70) >= 0) {
                    strc7C->unk68 = 0;
                    strc7C->unk70 = 0;
                    strc7C->unk79++;
                    break;
                }
                break;
            case 12:
                break;
            case 13:
                sub_8039074(boss->unk9A);
                strc7C->unk79++;
                break;
            case 14:
                break;
            case 15:
                sub_8039108();
                strc7C->unk60 = 0xA;
                strc7C->unk79++;
                /* fallthrough */
            case 16:
                if (--strc7C->unk60 == 0) {
                    strc7C->unk70 = -Q(2);
                    strc7C->unk79++;
                    break;
                }
                break;
            case 18:
                break;
            case 19:
                strc7C->unk79++;
                strc7C->unk70 = -Q(2);
                strc7C->unk79++;
                break;
            case 6:
            case 17:
            case 21:
                if ((strc7C->unk68 + strc7C->unk70) <= -0x1700) {
                    strc7C->unk68 = -0x1700;
                    strc7C->unk70 = 0;
                lbl:
                    strc7C->unk79++;
                    break;
                }
                break;
            case 22:
                break;
        }
    }
    strc7C->unk64 += strc7C->unk6C;
    strc7C->unk68 += strc7C->unk70;

    if (strc7C->unk68 <= -Q(23)) {
        strc7C->unk7A |= 0x4;
    } else {
        strc7C->unk7A &= ~0x4;
    }
    if ((s32)strc7C->unk68 >= 0) {
        strc7C->unk7A |= 0x2;
    } else {
        strc7C->unk7A &= ~0x2;
    }

    worldX = worldX32 = I(strc7C->unk64) + strc7C->unk74;
    worldY = worldY32 = I(strc7C->unk68) + strc7C->unk76;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    s2->x = s->x;
    s2->y = s->y;
    sub_803918C(strc7C->unk78);

    if ((boss->unk98 != 0) && (boss->unk95 == 0) && (boss->unk94 < 8)) {
        sub_803A650__inline(worldX, worldY);
    }
    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    DisplaySprite(s2);
}

void sub_803967C(void)
{
    s32 rnd = PseudoRandom32() & 0x800;
    EggX *boss = TASK_DATA(gCurTask);
    Sprite *s;
    struct Task *t;
    EggX_48 *strc48;
    s32 r2;
    s32 v;
    t = TaskCreate(Task_80397A8, sizeof(EggX_48), 0x2100, 0, TaskDestructor_EggX48);
    strc48 = TASK_DATA(t);
    strc48->unk40 = boss->unk88;
    strc48->unk42 = boss->unk8A;
    strc48->qUnk34 = boss->qUnk74;
    strc48->qUnk38 = boss->qUnk78;

    if (rnd) {
        strc48->unk44 = 40;
        strc48->qUnk3E = -Q(2);
        r2 = Q(3);
    } else {
        strc48->unk44 = 48;
        strc48->qUnk3E = -Q(5);
        r2 = Q(1.5);
    }

    if (boss->s.frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        strc48->qUnk34 += Q(20);
        strc48->qUnk3C = +r2;
    } else {
        strc48->qUnk34 -= Q(20);
        strc48->qUnk3C = -r2;
    }

    s = &strc48->s;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_EGGX_BALL);
    s->oamFlags = 0x5C0;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_EGGX_BALL;
    s->variant = 1;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    m4aSongNumStart(SE_IMPACT);
}

void Task_80397A8(void)
{
    s32 sp4;
    enum EHit temp_r8;
    enum EHit var_r0_2;
    s32 var_r0;
    s32 temp_r0;
    s32 res;
    s32 temp_r1;
    s32 temp_r3;
    CamCoord worldX, worldY;
    u16 temp_r0_4;
    u16 temp_r2;
    u16 temp_r6;
    EggX *boss;
    Sprite *s;

    EggX_48 *strc48 = TASK_DATA(gCurTask);
    boss = TASK_DATA(TASK_PARENT(gCurTask));
    s = &strc48->s;
    strc48->qUnk3E += strc48->unk44;
    strc48->qUnk34 += strc48->qUnk3C;
    strc48->qUnk38 += strc48->qUnk3E;
    worldX = I(strc48->qUnk34) + strc48->unk40;
    worldY = I(strc48->qUnk38) + strc48->unk42;
    res = sa2__sub_801F100(worldY + 8, worldX, 1, 8, sa2__sub_801EC3C);
    if (res < 0) {
        s32 v16;
        s32 v;
        strc48->qUnk38 += Q(res);
        v16 = -(u16)strc48->qUnk3E;
        var_r0 = +strc48->qUnk3E;
        if (var_r0 < 0) {
            var_r0 += 3;
        }
        strc48->qUnk3E = v16 + (var_r0 >> 2);
    }

    if (boss->unk94 <= 7) {
        sub_803A650__inline(worldX, worldY);
    }
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    if ((strc48->qUnk34 + 0xD000) > 0x1A000U) {
        TaskDestroy(gCurTask);
    }
}

void sub_8039940()
{
    SpriteTransform *tf;
    s16 var_r0;
    s16 var_r0_2;
    u32 temp_r0_2;
    u8 *temp_r0;
    u8 *temp_r1;

    EggX *boss = TASK_DATA(gCurTask);
    struct Task *t;
    EggX_Sparkle *sparkle;
    Sprite *s;

    t = TaskCreate(Task_8039A64, sizeof(EggX_Sparkle), 0x2100U, 0U, TaskDestructor_EggX_Sparkle);
    sparkle = TASK_DATA(t);
    sparkle->unk50 = boss->unk88 + I(boss->qUnk74);
    sparkle->unk52 = boss->unk8A + I(boss->qUnk78);
    sparkle->unk40 = Q(14);
    sparkle->unk48 = -Q(2);
    sparkle->unk4A = 0;
    if (boss->s.frameFlags & 0x400) {
        sparkle->unk50 += 0x1A;
    } else {
        sparkle->unk50 -= 0x1A;
    }
    sparkle->unk3C = 0x11;
    sparkle->unk61 = 0;
    sparkle->unk62 = 0;

    s = &sparkle->s;
    s->graphics.dest = VramMalloc(0x40U);
    s->oamFlags = 0x5C0;
    s->graphics.size = 0;
    s->graphics.anim = 0x2B1;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = (boss->s.frameFlags & 0x400) | 0x2030;

    tf = &sparkle->transform;
    tf->rotation = 0;
    if (s->frameFlags & 0x400) {
        tf->qScaleX = -0x100;
    } else {
        tf->qScaleX = 0x100;
    }
    tf->qScaleY = 0x100;
}

// (97.65%) https://decomp.me/scratch/tCZo7
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_x3__Task_8039A64.inc", void Task_8039A64())
{
    s32 worldX, worldY;
    s32 temp_r0;
    s16 temp_r1_3;
    s32 temp_r2_4;
    s16 var_r6;
    s16 var_ip;
    u8 temp_r2_5;
    s32 qX, qY;

    EggX *boss;
    SpriteTransform *tf;
    s32 sp8 = 0;
    EggX_Sparkle *sparkle = TASK_DATA(gCurTask);
    Sprite *s;
    boss = TASK_DATA(TASK_PARENT(gCurTask));
    s = &sparkle->s;
    tf = &sparkle->transform;
    if (boss->unk94 <= 7) {
        sparkle->unk50 = boss->unk8C;
        sparkle->unk52 = boss->unk8E;
        if (s->frameFlags & 0x400) {
            sparkle->unk50 += 0x1A;
        } else {
            sparkle->unk50 -= 0x1A;
        }
    }
    sparkle->unk40 += sparkle->unk48;
    sparkle->unk4E = sparkle->unk4A;
    var_r6 = sparkle->unk4A;
    var_ip = sparkle->unk4A;

    if (s->frameFlags & 0x400) {
        var_r6 = (-var_r6 - Q(2));
        var_r6 &= 0x3FF;
        var_ip = (-(var_ip << 16) >> 16) & 0x3FF;
    }
    worldX = COS(var_r6);
    worldX >>= 6;
    worldX *= sparkle->unk40;
    worldX = I((worldX) >> 8); // NOTE: Technically I(Q_MUL())!
    worldY = SIN(var_r6);
    worldY >>= 6;
    worldY *= sparkle->unk40;
    worldY = I((worldY) >> 8);
    worldX += sparkle->unk50;
    worldY += sparkle->unk52;
    tf->x = worldX - gCamera.x;
    tf->y = worldY - gCamera.y;
    tf->rotation = var_ip;
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);

    if (boss->unk94 > 7) {
        sparkle->unk48 = 0;
        sparkle->unk54 = Q(worldX);
        sparkle->unk58 = Q(worldY);
        s->oamFlags = 0x5C0;
        sparkle->unk3C = 0x50;
        gCurTask->main = Task_803A46C;
        return;
    }

    {
        switch (sparkle->unk61) {
            case 0:
            case 1: {
                sp8 = sub_8036F9C(worldX, worldY, 0);
            } break;

            case 2: {
                sp8 = sub_8036F9C(worldX, worldY, 1);
            } break;
        }
    }

    switch (sparkle->unk61) {
        case 0:
            if (--sparkle->unk3C == 0) {
                temp_r0 = PseudoRandom32();
                sparkle->unk48 = 0;
                sparkle->unk61++;
                if (((temp_r0 % 100) - 35) <= 0) {
                    sparkle->unk3C = 0xB4;
                } else if (((temp_r0 % 100) - 70) <= 0) {
                    sparkle->unk3C = 0x3C;
                } else if (((temp_r0 % 100) - 90) <= 0) {
                    sparkle->unk3C = 0x12;
                } else {
                    sparkle->unk3C = 0x12C;
                }
            }
            break;
        case 1:
            worldX = sparkle->unk50 - I(gPlayer.qWorldX);
            worldY = sparkle->unk52 - I(gPlayer.qWorldY);

            worldX = ABS(worldX);

            worldX = (u16)sa2__sub_8004418(worldY, worldX);
            if ((u32)((u32)((worldX - 225) + 0xFF1F0000) >> 0x10) < 0x11F) {
                worldX = 224;
            }
            if ((u32)((u32)((worldX << 0x10) + 0xFDFF0000) >> 0x10) < 0x11F) {
                worldX = 800;
            }

            temp_r1_3 = (sparkle->unk4A << 6);
            if (temp_r1_3 > (temp_r0 = ((worldX << 22) >> 16))) {
                if (temp_r1_3 >= (temp_r0 + Q(1.5))) {
                    sparkle->unk4A -= 6;
                } else {
                    goto lbl2;
                }
            } else if (temp_r1_3 < temp_r0) {
                if (temp_r1_3 > (temp_r0 - Q(1.5))) {
                lbl2:
                    sparkle->unk4A = (s16)worldX;
                } else {
                    sparkle->unk4A += 6;
                }
            }
            sparkle->unk4A &= 0x3FF;

            if (--sparkle->unk3C == 0) {
                temp_r0 = sparkle->unk50 - I(gPlayer.qWorldX);
                temp_r2_4 = sparkle->unk52 - I(gPlayer.qWorldY);
                sparkle->unk44 = -(Sqrt(Q(SQUARE(temp_r0)) + Q(SQUARE(temp_r2_4))) * 16) - Q(16);
                sparkle->unk48 = -Q(6);
                sparkle->unk60 = 0;
                sparkle->unk61++;
                s->oamFlags = 0x3C0;
                s->variant = 1;
                s->prevVariant = -1;
                m4aSongNumStart(0xB3U);
            }
            break;
        case 2:
            temp_r2_5 = (((I(-sparkle->unk40) - 20) >> 4) + 1);
            if (sparkle->unk60 < temp_r2_5) {
                sparkle->unk60 = temp_r2_5;
                sub_803A1D8();
            }

            if (sp8 == 2) {
                sparkle->unk62 = 0xFF;
                sparkle->unk48 = 0;
                sparkle->unk61 = 7;
                s->variant = 2;
                s->prevVariant = -1;
                Player_TransitionCancelFlyingAndBoost(&gPlayer);

                gPlayer.qWorldX = Q(worldX);
                gPlayer.qWorldY = Q(worldY);
                gPlayer.qSpeedAirX = 0;
                gPlayer.qSpeedAirY = 0;
                gPlayer.qSpeedGround = 0;
                gPlayer.moveState |= 0xE00100;

                if (s->frameFlags & 0x400) {
                    gPlayer.rotation = (-sparkle->unk4A) >> 2;
                } else {
                    gPlayer.rotation = (+sparkle->unk4A) >> 2;
                }
                gPlayer.charState = CHARSTATE_40;
                gPlayer.heldInput = 0;
                gPlayer.frameInput = 0;
            } else if (sparkle->unk40 <= sparkle->unk44) {
                sparkle->unk48 = 0;
                sparkle->unk61++;
                s->variant = 2;
                s->prevVariant = -1;
            }
            break;
        case 3:
            if (s->frameFlags & 0x4000) {
                sparkle->unk48 = 0x200;
                sparkle->unk61++;
            }
            break;
        case 4:
            if (sparkle->unk40 >= -Q(20)) {
                sparkle->unk40 = -0x1400;
                sparkle->unk48 = 0;
                s->oamFlags = 0x5C0;
                s->variant = 0;
                s->prevVariant = -1;
                sparkle->unk61++;
            }
            break;
        case 5:
            if (sparkle->unk4A == 0) {
                s->oamFlags = 0x5C0;
                sparkle->unk48 = 0x100;
                sparkle->unk61++;
                break;
            } else if (sparkle->unk4A > 0x200) {
                sparkle->unk4A = (sparkle->unk4A + 6) & 0x3FF;
                if (sparkle->unk4A >= 7) {
                    break;
                }
                sparkle->unk4A = 0;
            } else {
                sparkle->unk4A = (sparkle->unk4A - 6) & 0x3FF;
                if (sparkle->unk4A <= 0x200) {
                    break;
                }
                sparkle->unk4A = 0;
            }
            break;
        case 6:
            if (sparkle->unk40 >= 0xE00) {
                if (sparkle->unk62 == 0) {
                    boss->unk99++;
                } else {
                    boss->unk92 = 1;
                }
                TaskDestroy(gCurTask);
                return;
            }
            break;
        case 7:
            gPlayer.qWorldX = Q(worldX);
            gPlayer.qWorldY = Q(worldY);
            if (s->frameFlags & 0x400) {
                gPlayer.rotation = (-sparkle->unk4A) >> 2;
            } else {
                gPlayer.rotation = (+sparkle->unk4A) >> 2;
            }
            if (s->frameFlags & 0x4000) {
                sparkle->unk48 = 0x600;
                sparkle->unk61++;
            }
            break;
        case 8:
            gPlayer.qWorldX = Q(worldX);
            gPlayer.qWorldY = Q(worldY);
            if (s->frameFlags & 0x400) {
                gPlayer.rotation = (-sparkle->unk4A) >> 2;
            } else {
                gPlayer.rotation = (+sparkle->unk4A) >> 2;
            }

            if (sparkle->unk40 >= -0x2400) {
                sparkle->unk40 = -0x2400;
                sparkle->unk48 = 0;
                sparkle->unk4C = 0x10;
                sparkle->unk3C = 0;
                sparkle->unk61++;
            }
            break;
        case 9:
            gPlayer.qWorldX = Q(worldX);
            gPlayer.qWorldY = Q(worldY);

            if (s->frameFlags & 0x400) {
                gPlayer.rotation = (-sparkle->unk4A) >> 2;
            } else {
                gPlayer.rotation = (+sparkle->unk4A) >> 2;
            }

            sparkle->unk4A = (sparkle->unk4A + sparkle->unk4C) & 0x3FF;
            if (sparkle->unk4A > 0x1FF) {
                u16 lostRingsCount = gRingCount;
                if ((lostRingsCount > 0) && (sparkle->unk4C < 0)) {
                    if ((u32)lostRingsCount > 5U) {
                        lostRingsCount = 5;
                    }
                    InitScatteringRings(I(gPlayer.qWorldX), I(gPlayer.qWorldY), lostRingsCount);
                    gRingCount -= lostRingsCount;
                }
                sparkle->unk4C = 0x10;
            }
            if ((u16)(sparkle->unk4A + -Q(1)) < Q(1)) {
                sparkle->unk4C = -0x10;
                if (++sparkle->unk3C == 4) {
                    boss->unk99 = 0x33;
                }

                if (sparkle->unk3C == 5) {
                    sub_803A170(s->frameFlags & 0x400);
                    sparkle->unk61 = 5;
                }
            }
            break;
    }
}
END_NONMATCH

// (99.10%) https://decomp.me/scratch/xmkJN
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_x3__sub_803A170.inc", void sub_803A170(u32 arg0))
{
    s16 var_r0;

    gPlayer.timerInvulnerability = 0x78;
    if (arg0 != 0) {
        gPlayer.qSpeedAirX = -Q(2);
    } else {
        gPlayer.qSpeedAirX = +Q(2);
    }

    gPlayer.qSpeedAirY = -0x5E0;
    gPlayer.rotation = 0;
    gPlayer.moveState = (gPlayer.moveState & 0xFF1FFAC3) | 2;
    gPlayer.charState = 0xF;
    Player_HandleSpriteYOffsetChange(&gPlayer, 0xE);
    gPlayer.spriteOffsetX = 6;
    gPlayer.spriteOffsetY = 0xE;
    gPlayer.SA2_LABEL(unk61) = 0;
    gPlayer.SA2_LABEL(unk62) = 0;
}
END_NONMATCH

void sub_803A1D8()
{
    s32 sp4;
    SpriteTransform *tf;
    s16 var_r0;
    struct Task *t;
    EggX_Sparkle *sparkle;
    EggX_Sparkle *sparkleParent;
    Sprite *s;

    sparkleParent = TASK_DATA(gCurTask);

    t = TaskCreate(Task_803A2F8, sizeof(EggX_Sparkle), 0x2101U, 0U, TaskDestructor_EggX_Sparkle);
    sparkle = TASK_DATA(t);
    sparkle->unk50 = sparkleParent->unk50;
    sparkle->unk52 = sparkleParent->unk52;
    sparkle->unk4A = sparkleParent->unk4E;
    sparkle->unk60 = sparkleParent->unk60;
    s = &sparkle->s;
    sparkle->s.graphics.dest = ALLOC_TILES(SA1_ANIM_EGGX_BALL);
    sparkle->s.oamFlags = SPRITE_OAM_ORDER(24);
    sparkle->s.graphics.size = 0;
    sparkle->s.graphics.anim = SA1_ANIM_EGGX_BALL;
    sparkle->s.variant = 0;
    sparkle->s.animCursor = 0;
    sparkle->s.qAnimDelay = 0;
    sparkle->s.prevVariant = -1;
    sparkle->s.animSpeed = SPRITE_ANIM_SPEED(1.0);
    sparkle->s.palId = 0;
    sparkle->s.hitboxes[0].index = -1;
    sparkle->s.frameFlags = (sparkleParent->s.frameFlags & 0x400) | 0x2030;

    tf = &sparkle->transform;
    tf->rotation = 0;
    if (sparkle->s.frameFlags & 0x400) {
        tf->qScaleX = -Q(1);
    } else {
        tf->qScaleX = +Q(1);
    }
    tf->qScaleY = 0x100;
}

void Task_803A2F8()
{
    s32 worldX, worldY;
    s16 temp_r0;
    s16 var_r4;
    u16 var_r6;

    EggX_Sparkle *sparkle;
    EggX_Sparkle *sparkleParent;
    SpriteTransform *tf;
    EggX *boss;
    Sprite *s;

    sparkle = TASK_DATA(gCurTask);
    s = &sparkle->s;
    sparkleParent = TASK_DATA(TASK_PARENT(gCurTask));
    boss = TASK_DATA(TASK_PARENT(TASK_PARENT(gCurTask)));

    tf = &sparkle->transform;
    sparkle->unk50 = sparkleParent->unk50;
    sparkle->unk52 = sparkleParent->unk52;
    var_r4 = var_r6 = sparkleParent->unk4E;
    if (s->frameFlags & 0x400) {
        temp_r0 = (s16)var_r6;
        var_r4 = ((-temp_r0 - Q(2))) % 1024u;
        var_r6 = (-temp_r0) % 1024u;
    }

    sparkle->unk40 = sparkleParent->unk40 + (Q((sparkle->unk60 * 0x10) + 8));
    worldX = COS(var_r4);
    worldX >>= 6;
    worldX *= sparkle->unk40;
    worldX = I((worldX) >> 8);
    worldY = SIN(var_r4);
    worldY >>= 6;
    worldY *= sparkle->unk40;
    worldY = I((worldY) >> 8);
    worldX += sparkle->unk50;
    worldY += sparkle->unk52;

    tf->x = worldX - gCamera.x;
    tf->y = worldY - gCamera.y;
    tf->rotation = var_r6;
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);
    if ((sparkle->unk40 > 0x800) || (sparkleParent->unk61 == 6)) {
        TaskDestroy(gCurTask);
    }
    if (boss->unk94 > 7) {
        sparkle->unk48 = 0;
        sparkle->unk54 = worldX << 8;
        sparkle->unk58 = worldY << 8;
        gCurTask->main = Task_803A46C;
        sparkle->unk3C = (0x50 - (sparkle->unk60 * 4));
    }
}

void Task_803A46C()
{
    EggX_Sparkle *sparkle;
    EggX_Sparkle *sparkleParent;
    SpriteTransform *tf;
    EggX *boss;
    Sprite *s;
    Sprite *s2;
    CamCoord worldX, worldY;
    s32 res;

    sparkle = TASK_DATA(gCurTask);
    s = &sparkle->s;
    tf = &sparkle->transform;

    sparkle->unk48 += 0x20;
    sparkle->unk58 += sparkle->unk48;

    worldX = I(sparkle->unk54);
    worldY = I(sparkle->unk58);

    res = SA2_LABEL(sub_801F100)(worldY + 8, worldX, 1, 8, sa2__sub_801EC3C);

    if (res < 0) {
        sparkle->unk58 += Q(res);
        sparkle->unk48 = (sparkle->unk48 >> 2) - sparkle->unk48;
    }

    tf->x = worldX - gCamera.x;
    tf->y = worldY - gCamera.y;
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);
    if ((--sparkle->unk3C == 0)) {
        sub_8017540(Q(worldX), Q(worldY));
        TaskDestroy(gCurTask);
    }
}

void TaskDestructor_EggX(struct Task *t)
{
    EggX *boss = TASK_DATA(t);
    VramFree(boss->s.graphics.dest);
    VramFree(boss->s2.graphics.dest);
}

void sub_803A54C(void)
{
    EggX_10 *strc10;
    u16 temp_r0;

    temp_r0 = LOADED_SAVE->unlockedLevels[0];
    if (temp_r0 < 0xE) {
        temp_r0 = 0xE;
    }
    LOADED_SAVE->unlockedLevels[0] = temp_r0;

    strc10 = TASK_DATA(TaskCreate(Task_8038554, sizeof(EggX_10), 0x1FFFU, 0U, NULL));
    strc10->unk6 = 0x1A4;
    strc10->unk9 = 0;
    strc10->unk8 = 0;
}

void sub_803A594(void)
{
    EggX_10 *strc10;

    strc10 = TASK_DATA(TaskCreate(Task_Strc10_803891C, sizeof(EggX_10), 0x1FFFU, 0U, NULL));
    strc10->unk0 = 32;
    strc10->unk2 = 0;
    strc10->unk4 = 0;
    strc10->unk6 = 120;
    strc10->unk8 = 0;
}

void TaskDestructor_EggX7C(struct Task *t)
{
    EggX_7C *strc7C = TASK_DATA(t);
    VramFree(strc7C->s.graphics.dest);
    VramFree(strc7C->s2.graphics.dest);
}

void TaskDestructor_EggX48(struct Task *t)
{
    EggX_48 *strc48 = TASK_DATA(t);
    VramFree(strc48->s.graphics.dest);
}

void TaskDestructor_EggX_Sparkle(struct Task *t)
{
    EggX_Sparkle *strc48 = TASK_DATA(t);
    VramFree(strc48->s.graphics.dest);
}

void sub_803A614(void) { sub_803A614__inline(); }

void sub_803A650(CamCoord worldX, CamCoord worldY)
{
    enum EHit collPlayer;
    enum EHit collPartner;

    EggX_7C *strc7C = TASK_DATA(gCurTask);
    Sprite *s = &strc7C->s;
    collPlayer = sub_800BF10(s, worldX, worldY, &gPlayer);

    if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
        collPartner = sub_800BF10(s, worldX, worldY, &gPartner);
    } else {
        collPartner = HIT_NONE;
    }

    if ((collPlayer == HIT_PLAYER) || (collPartner == HIT_PLAYER)) {
        EggX *boss = TASK_DATA(TASK_PARENT(gCurTask));
        Sprite *s2 = &boss->s2;
        s2->variant = 3;
        s2->frameFlags &= ~0x4000;
        s2->prevVariant = -1;
    }
}

// Belongs to sub_803A6EC, might be able to be removed once matched...
typedef struct Test {
    Sprite *s;
} Test;

// (70.86%) https://decomp.me/scratch/rf3AU
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_x3__sub_803A6EC.inc",
         void sub_803A6EC(CamCoord worldX, CamCoord worldY, u8 param2, u8 param3, u8 param4, u8 param5))
{
    EHit collPlayer, collPartner;
    const Test test = { .s = NULL };
    Rect8 rect;
    rect.left = param2;
    rect.right = param3;
    rect.top = param4;
    rect.bottom = param5;

    collPlayer = sub_800C1E8(test.s, rect, worldX, worldY, &gPlayer);
    if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
        collPartner = sub_800C1E8(test.s, rect, worldX, worldY, &gPartner);
    } else {
        collPartner = 0;
    }

    if ((collPlayer | collPartner) == HIT_PLAYER) {
        EggX *strc7C = TASK_DATA(gCurTask);
        Sprite *s2 = &strc7C->s2;
        s2->variant = 3;
        s2->frameFlags &= ~0x4000;
        s2->prevVariant = -1;
    }
}
END_NONMATCH

void sub_803A7D4(CamCoord worldX, CamCoord worldY)
{
    EggX_7C *strc7C = TASK_DATA(gCurTask);
    Sprite *s = &strc7C->s;
    EHit collPlayer, collPartner;

    collPlayer = sub_800BF10(s, worldX, worldY, &gPlayer);
    if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
        collPartner = sub_800BF10(s, worldX, worldY, &gPartner);
    } else {
        collPartner = HIT_NONE;
    }

    if ((collPlayer == HIT_PLAYER) || (collPartner == HIT_PLAYER)) {
        EggX *boss = TASK_DATA(TASK_PARENT(gCurTask));
        Sprite *s2 = &boss->s2;

        s2->variant = 3;
        s2->frameFlags &= ~0x4000;
        s2->prevVariant = -1;
    }
}

static void ChangeVariant(void) { ChangeVariant__inline(); }

void sub_803A8AC(void) { CopySpritePos__inline(); }

void sub_803A8CC(CamCoord worldX, CamCoord worldY)
{
    EggX *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
}

void sub_803A900(u8 arg0) { sub_803A900__inline(arg0); }