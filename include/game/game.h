#ifndef GUARD_GAME_H
#define GUARD_GAME_H

#define GAME_MODE_SINGLE_PLAYER    0
#define GAME_MODE_TIME_ATTACK      1
#define GAME_MODE_BOSS_TIME_ATTACK 2

#define GAME_MODE_MULTI_PLAYER               3
#define GAME_MODE_TEAM_PLAY                  4
#define GAME_MODE_MULTI_PLAYER_COLLECT_RINGS 5

#include "global.h"
#include "sprite.h"
#include "multi_sio.h"
#include "task.h"

#include "sakit/globals.h"
#include "constants/game_modes.h"
#include "constants/characters.h"

// TODO: force users to include player
#include "game/stage/player.h"

#define ZONE_TIME_TO_INT(minutes, seconds)                                              \
    (((minutes * 60) + seconds) * GBA_FRAMES_PER_SECOND)
#define MAX_COURSE_TIME (ZONE_TIME_TO_INT(10, 0))

#define TIME_RECORDS_PER_COURSE 3

// TODO: move to staging
#define NUM_MULTIPLAYER_SCORES 10
#define MAX_MULTIPLAYER_SCORE  99

void GameStart(void);

extern struct Task *gGameStageTask;

typedef struct {
    s8 unk0;
    u8 filler1[3];
    struct Task *t;
} UNK_30059D0;

extern UNK_30059D0 gUnknown_030059D0;

// Copies of BG control regs for Multiplayer(?)
typedef struct {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
} MultiPlayerBgCtrlRegs; /* size: 8 */
extern MultiPlayerBgCtrlRegs *gUnknown_03005840;

extern u8 gSmallAirBubbleCount;

struct MultiplayerPlayer {
    // TODO: Verify that this is Sprite!
    //       (Used in Task_Item_Invincibility @ 0x0802AC60)
    Sprite s;

    u8 filler[0x20];
    // x
    s16 unk50;
    s16 unk52;
    u16 unk54;
    u8 unk56;
    u8 unk57;
    u8 unk58[4];
    u32 unk5C; // flags?
};

// Some sort of unused task variable
extern struct Task *gDummyTask;

struct UNK_80D62D8 {
    u8 unk0[28];
    u32 unk1C;
    u32 unk20;
    u8 unk24[12];
};

typedef struct {
    u16 pal[16 * 16];
} WaterData;

// Seems to be belonging to water effect
typedef struct {
    /* 0x00 */ bool8 isActive;
    /* 0x01 */ u8 unk1;
    /* 0x01 */ u8 unk2;
    /* 0x01 */ u8 unk3;
    /* 0x04 */ s16 currentWaterLevel;
    /* 0x06 */ s16 targetWaterLevel;
    /* 0x08 */ u32 unk8;
    /* 0x0C */ u32 mask;

    // t -> u16 palette[16*16] (additional "palette memory" for GUI stuff?)
    /* 0x10 */ struct Task *t; /* size: 0x400 */
    /* 0x14 */ Sprite s;
} Water;

extern Water gWater;

// TODO: find out what task is parent to IA
typedef struct {
    u8 filler0[0x18];
    struct Task *unk18; // UNK_807C5F8
} UNK_807C5F8_Parent;

typedef struct {
    Sprite sprite1;
    Sprite sprite2;
    u16 unk60;
    u16 unk62;
} UNK_807C5F8;

// TODO: Move this into the module sub_8011C98 gets defined in, once it's decomped
typedef struct {
    /* 0x00 */ s32 px[5];
    /* 0x14 */ s32 py[5];
    /* 0x28 */ u16 unk28;
    /* 0x2C */ Sprite s;
} TaskStrc_8011C98; /* size: 0x5C */

struct Backgrounds {
    Background unk0;
    Background unk40;
    Background unk80;
    Background unkC0;
};

extern struct Backgrounds gStageBackgroundsRam;

// rodata
extern const AnimId gPlayerCharacterIdleAnims[NUM_CHARACTERS];

// Some unused rom thing?
extern const u8 gUnknown_08C88408[0x8000];

// Obj vram (only 0x5000 used)
extern const u8 gUnknown_08C90408[0x8000];

// Backgrounds?
extern const u8 gUnknown_08C92208[0x8000];

extern const u8 gUnknown_08CA6760[0x6A7C];
extern const u8 gUnknown_08CAD1DC[0x6fe4];
extern const u8 gUnknown_08CB41C0[0x6a44];

extern const u8 gUnknown_08CBAC04[];

// TODO: Might need to be moved out of this header?
void Player_SetMovestate_IsInScriptedSequence(void);
void Player_ClearMovestate_IsInScriptedSequence(void);

void sub_802E164(s32, u16);

void CreateTrueArea53Intro(void);

// Sweep anim
void sub_802E044(s32, u16);

u16 CreateStageResults(u32, u16, u8);

void sub_8019F08(void);
struct Task *CreateStageGoalBonusPointsAnim(s32, s32, u16);
extern void Task_801F214(void);
void sub_801F550(struct Task *);

void sub_80218E4(Player *);
void sub_8023B5C(Player *, s8);
void sub_8023260(Player *);

// HandlePlayerDestroy?
extern bool32 sub_800C4FC(Sprite *, s32, s32, u8);

extern void sub_80122DC(s32, s32);

// HandleHitPlayer
extern u32 sub_800C84C(Sprite *, s32, s32);

typedef s32 (*Func801F100)(s32, s32, s32);
extern s32 sub_801EB44(s32, s32, s32);
extern s32 sub_801EC3C(s32, s32, s32);
extern s32 sub_801ED24(s32, s32, s32);
extern s32 sub_801EE64(s32, s32, s32);

// ground collision clamp functions
s32 sub_801E4E4(s32, s32, u32, s32, void *, Func801F100);
s32 sub_801E6D4(s32, s32, s32, s32, void *, Func801F100);
s32 sub_801F07C(s32, s32, s32, s32, void *, Func801F100);

s32 sub_801F100(s32, s32, s32, s32, Func801F100);

// TODO: Include header this belongs to
u32 sub_800C944(Sprite *, s32, s32);

// TODO: Include header this belongs to
bool32 sub_800CA20(Sprite *s, s32 x, s32 y, u16 p3, Player *p);
bool32 sub_800C320(Sprite *s, s32 x, s32 y, u16 p3, Player *p);
bool32 sub_800C418(Sprite *s, s32 x, s32 y, u16 p3, Player *p);

// Lose rings?
bool32 sub_800CBA4(Player *);

// TODO: Move this into the module sub_801F15C gets defined in, once it's decomped
typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ u8 fillerC[0x4];
    /* 0x10 */ s16 unk10;
    /* 0x12 */ u16 unk12;
    /* 0x14 */ u16 unk14;
    /* 0x16 */ AnimId playerAnim;
    /* 0x18 */ u16 playerVariant;
    /* 0x1A */ u8 unk1A;
    /* 0x1C */ Sprite s;
    /* 0x4C */ SpriteTransform transform;
} TaskStrc_801F15C; /* size: 0x58 */

extern struct Task *sub_801F15C(s16, s16, u16, s8, TaskMain, TaskDestructor);
extern void TaskDestructor_801F550(struct Task *);

extern void sub_801F78C(void);

extern void sub_802C668(s32 *x, s32 *y);

// NOTE: Proc type should be the same as SetStageSpawnPosInternal!
extern void SetStageSpawnPos(u32 character, u32 level, u32 p2, Player *player);

#define INCREMENT_SCORE_A(incVal)                                                       \
    {                                                                                   \
        s32 divResA, divResB;                                                           \
        s32 oldScore = gLevelScore;                                                     \
        gLevelScore += incVal;                                                          \
                                                                                        \
        divResA = Div(gLevelScore, 50000);                                              \
        divResB = Div(oldScore, 50000);                                                 \
                                                                                        \
        if ((divResA != divResB) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {           \
            u16 lives = divResA - divResB;                                              \
            lives += gNumLives;                                                         \
                                                                                        \
            gNumLives = ({                                                              \
                if (lives > 255)                                                        \
                    lives = 255;                                                        \
                lives;                                                                  \
            });                                                                         \
        }                                                                               \
    }

#define INCREMENT_SCORE(incVal)                                                         \
    {                                                                                   \
        s32 divResA, divResB;                                                           \
        s32 oldScore = gLevelScore;                                                     \
        gLevelScore += incVal;                                                          \
                                                                                        \
        divResA = Div(gLevelScore, 50000);                                              \
        divResB = Div(oldScore, 50000);                                                 \
                                                                                        \
        if ((divResA != divResB) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {           \
            u16 lives = divResA - divResB;                                              \
            lives += gNumLives;                                                         \
                                                                                        \
            gNumLives = ({                                                              \
                if (lives > 255)                                                        \
                    lives = 255;                                                        \
                lives;                                                                  \
            });                                                                         \
                                                                                        \
            gUnknown_030054A8.unk3 = 16;                                                \
        }                                                                               \
    }

#define INCREMENT_RINGS(incVal)                                                         \
    {                                                                                   \
        s32 prevLives, newLives;                                                        \
        s32 oldRings = gRingCount;                                                      \
        gRingCount += incVal;                                                           \
                                                                                        \
        if (!IS_EXTRA_STAGE(gCurrentLevel)) {                                           \
            newLives = Div(gRingCount, 100);                                            \
            prevLives = Div(oldRings, 100);                                             \
                                                                                        \
            if ((newLives != prevLives) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {    \
                u16 lives = gNumLives + 1;                                              \
                                                                                        \
                gNumLives = ({                                                          \
                    if (lives > 255)                                                    \
                        lives = 255;                                                    \
                    lives;                                                              \
                });                                                                     \
                                                                                        \
                gUnknown_030054A8.unk3 = 16;                                            \
            }                                                                           \
        }                                                                               \
    }

#define INCREMENT_RINGS2(incVal)                                                        \
    {                                                                                   \
        s32 prevLives, newLives;                                                        \
        s32 oldRings = gRingCount;                                                      \
        gRingCount += incVal;                                                           \
                                                                                        \
        if (!IS_EXTRA_STAGE(gCurrentLevel)) {                                           \
            newLives = Div(gRingCount, 100);                                            \
            prevLives = Div(oldRings, 100);                                             \
                                                                                        \
            /* RingsScatterSingleplayer_NormalGravity turns the if around */            \
            if ((newLives != prevLives) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {    \
                u16 lives = gNumLives + 1;                                              \
                                                                                        \
                gNumLives = ({                                                          \
                    if (lives > 255)                                                    \
                        lives = 255;                                                    \
                    lives;                                                              \
                });                                                                     \
                                                                                        \
                gUnknown_030054A8.unk3 = 16;                                            \
            }                                                                           \
        }                                                                               \
    }

#endif // GUARD_GAME_H
