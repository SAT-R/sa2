#include "global.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/bosses/common.h"
#include "game/screen_transition.h"

#include "constants/animations.h"
#include "constants/zones.h"

#define INTRO_ICON_LEAF_FOREST  0
#define INTRO_ICON_HOT_CRATAER  1
#define INTRO_ICON_MUSIC_PLANT  2
#define INTRO_ICON_ICE_PARADISE 3
#define INTRO_ICON_SKY_CANYON   4
#define INTRO_ICON_TECHNO_BASE  5
#define INTRO_ICON_EGG_UTOPIA   6
#define INTRO_ICON_XX           7
#define INTRO_ICON_TRUE_AREA_53 8
#define INTRO_ICON_BOSS_ATTACK  9
#define NUM_INTRO_STAGE_ICONS   9 // excludes Boss Attack

// (Stage-Courses + XX + True Area 53) == 9
#define NUM_ZONE_UNLOCKED_ICONS  (NUM_COURSE_ZONES + 2)
#define NUM_ZONE_NAME_PARTS      4
#define ZONE_NAME_INDEX_TA53     32
#define ZONE_NAME_INDEX_BOSS_ATK 36

extern u16 zoneLoadingCharacterLogos[NUM_CHARACTERS][3];
extern u16 zoneLoadingZoneNames[(NUM_INTRO_STAGE_ICONS + 1) * NUM_ZONE_NAME_PARTS][3];
extern u16 zoneLoadingIcons[NUM_INTRO_STAGE_ICONS][3];

// NOTE: The usage code expects all these icons to have the same tile-count.
//       It uses the count of the 0th entry.
extern u16 zoneUnlockedIcons[NUM_INTRO_STAGE_ICONS][3];

extern u16 sZoneLoadingActLetters[5][3];

extern u8 gUnknown_080D6FF0[NUM_CHARACTERS]; // = {40, 55, 52, 40, 40};

extern TileInfo characterAnimsGettingReady[NUM_CHARACTERS]; // = {40, 55, 52, 40, 40};

typedef struct {
    /* 0x00 */ u32 counter;
    /* 0x04 */ u8 unk4;
} SITaskA; /* size: 0x8 */

// TODO: Are SITaskB/C/F the same struct?
typedef struct {
    /* 0x00 */ SITaskA *unk0;
    /* 0x04 */ struct TransitionState transition;
    /* 0x10 */ Vec2_16 unk10;
    /* 0x14 */ Vec2_16 unk14;
} SITaskB; /* size: 0x18 */

typedef struct {
    /* 0x00 */ SITaskA *unk0;
    /* 0x04 */ Sprite sUnlockedIcons[9];
    /* 0x1B4 */ Sprite sCharacterLogo;
    /* 0x1E4 */ Sprite sStageName[4];
    /* 0x2A4 */ Sprite s2A4;
    /* 0x2D4 */ Sprite s2D4;
    /* 0x314 */ u8 filler4[0xC];
} SITaskD; /* size: 0x310 */

typedef struct {
    /* 0x00 */ SITaskA *unk0;
    /* 0x04 */ Sprite sStageNames[4];
} SITaskE; /* size: 0xC4 */

void Task_802F75C(void);
void Task_802F9F8(void);
void Task_802FD34(void);
void Task_802FF94(void);
void Task_80302AC(void);
void Task_UpdateStageLoadingScreen(void);
void TaskDestructor_80303CC(struct Task *);
void TaskDestructor_nop_8030458(struct Task *);
void TaskDestructor_803045C(struct Task *);
void TaskDestructor_8030474(struct Task *);

// (99.66%) https://decomp.me/scratch/zGPtO
NONMATCH("asm/non_matching/game/stage/SetupStageIntro.inc",
         struct Task *SetupStageIntro(void))
{
    struct Task *t; // sp04
    SITaskA *sit_a; // sp08
    struct Task *t2;
    SITaskB *sit_b;
    // SITaskC *sit_c;
    SITaskD *sit_d; // r8
    SITaskE *sit_e;
    // SITaskF *sit_f;
    struct TransitionState *transition;
    Vec2_16 *vec;
    void *tilesCursor;
    Sprite *s;
    u8 i; // r7

    gUnknown_03005424 |= EXTRA_STATE__ACT_START;
    gUnknown_03005424 |= EXTRA_STATE__100;

    gPlayer.unk90->s.unk10 |= SPRITE_FLAG_MASK_18;
    gPlayer.unk94->s.unk10 |= SPRITE_FLAG_MASK_18;

    gActiveBossTask = NULL;

    t = TaskCreate(Task_802F75C, sizeof(SITaskA), 0x2200, 0, TaskDestructor_80303CC);
    sit_a = TaskGetStructPtr(t);
    sit_a->counter = 2;
    sit_a->unk4 = 0;

    gPlayer.moveState |= MOVESTATE_100000;

    t2 = TaskCreate(Task_802F9F8, sizeof(SITaskB), 0x2210, 0,
                    TaskDestructor_nop_8030458);
    sit_b = TaskGetStructPtr(t2);
    sit_b->unk0 = sit_a;

    transition = &sit_b->transition;
    transition->unk0 = 0;
    transition->unk4 = 0;
    transition->unk2 = 2;
    transition->speed = 0;
    transition->unk8 = 0x3FFF;
    transition->unkA = 0;
    NextTransitionFrame(transition);

    t2 = TaskCreate(Task_802FD34, sizeof(SITaskB), 0x2220, 0,
                    TaskDestructor_nop_8030458);
    sit_b = TaskGetStructPtr(t2);
    sit_b->unk0 = sit_a;

    vec = &sit_b->unk10;
    vec->x = 0;
    vec->y = 0;

    vec = &sit_b->unk14;
    vec->x = 0;
    vec->y = 0;

    t2 = TaskCreate(Task_802FF94, sizeof(SITaskD), 0x2230, 0, TaskDestructor_803045C);
    sit_d = TaskGetStructPtr(t2);
    sit_d->unk0 = sit_a;

    { // Allocate VRAM for all icon's tiles
#ifndef NON_MATCHING
        register u32 tilesToAlloc asm("r0");
#else
        u32 tilesToAlloc;
#endif
        u32 loadingIconsTiles;

        if (IS_SINGLE_PLAYER) {
            tilesToAlloc = zoneLoadingCharacterLogos[gSelectedCharacter][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 0][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 1][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 2][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 3][0];
            loadingIconsTiles = zoneLoadingIcons[LEVEL_TO_ZONE(gCurrentLevel)][0] + 0x24;
            tilesToAlloc += loadingIconsTiles;
            tilesToAlloc += zoneUnlockedIcons[0][0] * NUM_ZONE_UNLOCKED_ICONS;
        } else {
            // _0802F260
            tilesToAlloc = zoneLoadingCharacterLogos[gSelectedCharacter][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 0][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 1][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 2][0];
            tilesToAlloc
                += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + 3][0];
            loadingIconsTiles = zoneLoadingIcons[LEVEL_TO_ZONE(gCurrentLevel)][0] + 0x24;
            tilesToAlloc += loadingIconsTiles;
        }
        tilesCursor = VramMalloc(tilesToAlloc);
    }
    // __0802F2C4

    /*     Init Character Logo     */
    s = &sit_d->sCharacterLogo;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tilesCursor;

    // Advance cursor to next collection of tiles
    tilesCursor += zoneLoadingCharacterLogos[gSelectedCharacter][0] * TILE_SIZE_4BPP;

    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->graphics.anim = zoneLoadingCharacterLogos[gSelectedCharacter][1];
    s->variant = zoneLoadingCharacterLogos[gSelectedCharacter][2];
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;

    if (IS_MULTI_PLAYER) {
        s->palId = SIO_MULTI_CNT->id;
    }
    // _0802F34C
    s->hitboxes[0].index = -1;
    s->unk10 = 0;
    UpdateSpriteAnimation(s);

    for (i = 0; i < NUM_ZONE_NAME_PARTS; i++) {
        u32 nameIndex;

        // _0802F39C
        s = &sit_d->sStageName[i];
        s->x = 0;
        s->y = 0;

        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            s->graphics.dest = tilesCursor;

            nameIndex = (ZONE_NAME_INDEX_TA53 + i);
            tilesCursor += zoneLoadingZoneNames[nameIndex][0] * TILE_SIZE_4BPP;
            s->graphics.anim = zoneLoadingZoneNames[nameIndex][1];
            s->variant = zoneLoadingZoneNames[nameIndex][2];
        } else if ((gCurrentLevel & 0x3) == ACT_BOSS) {
            // _0802F41C
            s->graphics.dest = tilesCursor;

            nameIndex = (ZONE_NAME_INDEX_BOSS_ATK + i);
            tilesCursor += zoneLoadingZoneNames[nameIndex][0] * TILE_SIZE_4BPP;
            s->graphics.anim = zoneLoadingZoneNames[nameIndex][1];
            s->variant = zoneLoadingZoneNames[nameIndex][2];
        } else {
            // _0802F446
            s->graphics.dest = tilesCursor;

            tilesCursor += zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + i][0]
                * TILE_SIZE_4BPP;
            s->graphics.anim
                = zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + i][1];
            s->variant = zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel) * 4 + i][2];
        }
        // _0802F47E
        s->unk1A = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 0);
    }

    /*    Loading Wheel in upper-left corner    */
    s = &sit_d->s2A4;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tilesCursor;
    tilesCursor += 36 * TILE_SIZE_4BPP;

    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_STAGE_INTRO_LOADING_WHEEL;
    s->variant = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(2.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = SPRITE_FLAG(PRIORITY, 0);
    UpdateSpriteAnimation(s);

    /*    Icon inside the loading wheel    */
    s = &sit_d->s2D4;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tilesCursor;

    tilesCursor += zoneLoadingIcons[LEVEL_TO_ZONE(gCurrentLevel)][0] * TILE_SIZE_4BPP;
    s->graphics.anim = zoneLoadingIcons[LEVEL_TO_ZONE(gCurrentLevel)][1];
    s->variant = zoneLoadingIcons[LEVEL_TO_ZONE(gCurrentLevel)][2];

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
        s->graphics.anim = zoneLoadingIcons[INTRO_ICON_TRUE_AREA_53][1];
        s->variant = zoneLoadingIcons[INTRO_ICON_TRUE_AREA_53][2];
    }

    s->unk1A = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant |= -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = (gUnknown_030054B8++ | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE);
    UpdateSpriteAnimation(s);

    /*    The icons of all unlocked zones in the upper-right    */
    if (IS_SINGLE_PLAYER) {
        // _0802F5A8
        for (i = 0; i < NUM_INTRO_STAGE_ICONS; i++) {
            s = &sit_d->sUnlockedIcons[i];
            s->x = 0;
            s->y = -32;
            s->graphics.dest = tilesCursor;
            tilesCursor += zoneUnlockedIcons[0][0] * TILE_SIZE_4BPP;

            if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
                if (i == INTRO_ICON_TRUE_AREA_53) {
                    // TODO: The macro names don't line up right now.
                    //       (i == TA53, but icon index for Boss Attack)
                    s->graphics.anim = zoneUnlockedIcons[INTRO_ICON_BOSS_ATTACK][1];
                    s->variant = zoneUnlockedIcons[INTRO_ICON_BOSS_ATTACK][2];
                } else {
                    // _0802F5FE
                    s->graphics.anim = zoneUnlockedIcons[i][1];
                    s->variant = zoneUnlockedIcons[i][2];
                }
            } else if (i == LEVEL_TO_ZONE(gCurrentLevel)) {
                // _0802F5F0
                s->graphics.anim = zoneUnlockedIcons[INTRO_ICON_BOSS_ATTACK][1];
                s->variant = zoneUnlockedIcons[INTRO_ICON_BOSS_ATTACK][2];
            } else {
                // _0802F5FE
                s->graphics.anim = zoneUnlockedIcons[i][1];
                s->variant = zoneUnlockedIcons[i][2];
            }

            s->unk1A = SPRITE_OAM_ORDER(4);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->timeUntilNextFrame = 0;
            s->prevVariant = -1;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 0;
            s->hitboxes[0].index = -1;
            s->unk10 = SPRITE_FLAG(PRIORITY, 0);
            UpdateSpriteAnimation(s);
        }
    }
    // _0802F652

    /*    Act Names    */
    t2 = TaskCreate(Task_80302AC, sizeof(SITaskE), 0x2240, 0, TaskDestructor_8030474);
    sit_e = TaskGetStructPtr(t2);
    sit_e->unk0 = sit_a;
    tilesCursor = VramMalloc(sZoneLoadingActLetters[0][0] * 4);

    for (i = 0; i < 4; i++) {
        s = &sit_e->sStageNames[i];
        s->x = 0;
        s->y = -32;

        s->graphics.anim = sZoneLoadingActLetters[i][1];
        s->variant = sZoneLoadingActLetters[i][2];

        // Set Act number anim (1 or 2)
        if ((i == 3) && ((ACT_INDEX(gCurrentLevel) & 0x1) != ACT_1)) {
            s->graphics.anim = sZoneLoadingActLetters[4][1];
            s->variant = sZoneLoadingActLetters[4][2];
        }

        s->graphics.dest = tilesCursor;
        tilesCursor += sZoneLoadingActLetters[0][0] * TILE_SIZE_4BPP;

        s->unk1A = SPRITE_OAM_ORDER(2);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);
    }

    t2 = TaskCreate(Task_UpdateStageLoadingScreen, sizeof(SITaskB), 0x22F0, 0,
                    TaskDestructor_nop_8030458);
    sit_b = TaskGetStructPtr(t2);
    sit_b->unk0 = sit_a;

    return t;
}
END_NONMATCH

void Task_802F75C(void)
{
    SITaskA *sit_a = TaskGetStructPtr(gCurTask);
    u32 frameCounter = sit_a->counter + 1;

    if ((IS_SINGLE_PLAYER) && !IS_BOSS_STAGE(gCurrentLevel)) {
        if (gPressedKeys & (A_BUTTON | B_BUTTON)) {
            gPlayer.moveState &= ~MOVESTATE_100000;
            gPlayer.moveState &= ~MOVESTATE_400000;
            frameCounter = 200;
            sit_a->unk4 = 1;
        }
        sit_a->counter = frameCounter;
    }
    // _0802F7BA

    gUnknown_03005AF0.s.unk10 &= ~(SPRITE_FLAG_MASK_OBJ_MODE);

    if (frameCounter < 150) {
        gPlayer.moveState |= MOVESTATE_100000;
        gPlayer.moveState |= MOVESTATE_400000;
    } else if (frameCounter == 151) {
        gPlayer.moveState &= ~MOVESTATE_100000;
    } else if (frameCounter >= 150 && frameCounter <= 166) {
        gPlayer.moveState &= ~MOVESTATE_400000;
    }
    // _0802F82E

    if ((frameCounter == (200 - gUnknown_080D6FF0[gSelectedCharacter]))
        && (gUnknown_030055B0 == 0) && (ACT_INDEX(gCurrentLevel) != ACT_BOSS)) {
        Player *p = &gPlayer;
        p->anim = characterAnimsGettingReady[gSelectedCharacter].anim;
        p->variant = characterAnimsGettingReady[gSelectedCharacter].variant;
        p->unk6C = 1;
        p->unk90->s.unk10 |= MOVESTATE_40000;
        p->unk94->s.unk10 |= MOVESTATE_40000;

        if (IS_MULTI_PLAYER) {
            p->unk90->s.palId = SIO_MULTI_CNT->id;
        } else {
            p->unk90->s.palId = 0;
        }
    }
    // _0802F8D8

    if (frameCounter > 200) {
        // _0802F8DE
        gUnknown_03005424 &= ~EXTRA_STATE__100;

        if (IS_BOSS_STAGE(gCurrentLevel)) {
            if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
                // Create the 1st boss (for Boss Rush)
                if (gUnknown_030055B0 == 0) {
                    CreateZoneBoss(0);
                }
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
                //_0802F938
                CreateZoneBoss(8);
            } else {
                CreateZoneBoss(LEVEL_TO_ZONE(gCurrentLevel));
            }
            // _0802F962
        } else {
            // _0802F988
        }
    }
}