#include "global.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/bosses/common.h"
#include "game/screen_transition.h"

#include "constants/animations.h"
#include "constants/zones.h"

// (Stage-Courses + XX + True Area 53) == 9
#define NUM_ZONE_UNLOCKED_ICONS  (NUM_COURSE_ZONES + 2)
#define NUM_ZONE_NAME_PARTS      4
#define ZONE_NAME_INDEX_TA53     32
#define ZONE_NAME_INDEX_BOSS_ATK 36

extern u16 zoneLoadingCharacterLogos[NUM_CHARACTERS][3];
extern u16 zoneLoadingZoneNames[10 * NUM_ZONE_NAME_PARTS][3];
extern u16 zoneLoadingIcons[9][3];

// NOTE: The usage code expects all these icons to have the same tile-count.
//       It uses the count of the 0th entry.
extern u16 zoneUnlockedIcons[10][3];

typedef struct {
    /* 0x00 */ u32 unk0;
    /* 0x04 */ u8 unk4;
} SITaskA; /* size: 0x8 */

typedef struct {
    /* 0x00 */ SITaskA *unk0;
    /* 0x04 */ struct TransitionState transition;
    u8 filler4[0x8];
} SITaskB; /* size: 0x18 */

typedef struct {
    /* 0x00 */ SITaskA *unk0;
    /* 0x04 */ u8 filler4[0xC];
    /* 0x10 */ Vec2_16 unk10;
    /* 0x14 */ Vec2_16 unk14;
} SITaskC; /* size: 0x18 */

typedef struct {
    /* 0x00 */ SITaskA *unk0;
    /* 0x04 */ u8 filler4[0x1B0];
    /* 0x1B4 */ Sprite sCharacterLogo;
    /* 0x1E4 */ Sprite sStageName[4];
    /* 0x2A4 */ Sprite s2A4;
    /* 0x2D4 */ Sprite s2D4;
} SITaskD; /* size: 0x310 */

void Task_802F75C(void);
void Task_802F9F8(void);
void Task_802FD34(void);
void Task_802FF94(void);
void TaskDestructor_80303CC(struct Task *);
void TaskDestructor_nop_8030458(struct Task *);
void TaskDestructor_803045C(struct Task *);

struct Task *SetupStageIntro(void)
{
    struct Task *t; // sp04
    SITaskA *sit_a; // sp08
    struct Task *t2;
    SITaskB *sit_b;
    struct Task *t3;
    SITaskC *sit_c;
    struct Task *t4;
    SITaskD *sit_d; // r8
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
    sit_a->unk0 = 2;
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

    t3 = TaskCreate(Task_802FD34, sizeof(SITaskC), 0x2220, 0,
                    TaskDestructor_nop_8030458);
    sit_c = TaskGetStructPtr(t3);
    sit_c->unk0 = sit_a;

    vec = &sit_c->unk10;
    vec->x = 0;
    vec->y = 0;

    vec = &sit_c->unk14;
    vec->x = 0;
    vec->y = 0;

    t4 = TaskCreate(Task_802FF94, sizeof(SITaskD), 0x2230, 0, TaskDestructor_803045C);
    sit_d = TaskGetStructPtr(t4);
    sit_d->unk0 = sit_a;

    {
        u32 tilesToAlloc;
        u32 zone;
        u32 loadingIconsTiles;

        if (IS_SINGLE_PLAYER) {
            tilesToAlloc = zoneLoadingCharacterLogos[gSelectedCharacter][0];
            zone = LEVEL_TO_ZONE(gCurrentLevel);
            tilesToAlloc += zoneLoadingZoneNames[zone * 4 + 0][0];
            tilesToAlloc += zoneLoadingZoneNames[zone * 4 + 1][0];
            tilesToAlloc += zoneLoadingZoneNames[zone * 4 + 2][0];
            tilesToAlloc += zoneLoadingZoneNames[zone * 4 + 3][0];
            tilesToAlloc += zoneLoadingIcons[zone][0] + 0x24;
            tilesToAlloc += zoneUnlockedIcons[0][0] * NUM_ZONE_UNLOCKED_ICONS;
        } else {
            // _0802F260
            tilesToAlloc = zoneLoadingCharacterLogos[gSelectedCharacter][0];
            zone = LEVEL_TO_ZONE(gCurrentLevel);
            tilesToAlloc += zoneLoadingZoneNames[zone * 4 + 0][0];
            tilesToAlloc += zoneLoadingZoneNames[zone * 4 + 1][0];
            tilesToAlloc += zoneLoadingZoneNames[zone * 4 + 2][0];
            tilesToAlloc += zoneLoadingZoneNames[zone * 4 + 3][0];
            loadingIconsTiles = zoneLoadingIcons[zone][0] + 0x24;
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

    {
        // void *sp20 = &sit_d->s2A4.variant;
        //
        //  multiple ptrs pushed to stack, likely the compiler doing it
        //
        //  ...
    }

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

    s = &sit_d->s2A4;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tilesCursor;
    tilesCursor += 24 * TILE_SIZE_4BPP;

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

    s = &sit_d->s2D4;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tilesCursor;

    // continueHEreLabel

    return t;
}