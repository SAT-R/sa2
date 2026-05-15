#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"

#include "game/shared/stage/player.h"
#include "game/shared/stage/camera.h"

#include "game/shared/stage/mp_finish.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/mp_event_mgr.h"

#include "game/shared/collect_rings/results.h"

#include "lib/m4a/m4a.h"

#if (GAME == GAME_SA1)
#include "game/sa1/save.h"
#include "game/sa1/stage/mp_results.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/text.h"
#elif (GAME == GAME_SA2)
#include "game/sa2/save.h"
#include "game/sa2/multiplayer/results.h"

#include "constants/sa2/animations.h"
#include "constants/sa2/text.h"
#endif

typedef struct {
    Sprite s;
    u8 sioId;
    u8 rank;
} FinishResult; /* size: 0x34 */

typedef struct {
    u16 frame;
} FinishTransition; /* size: 4 */

static void Task_TransitionWaitForResults(void);
static void Task_TransitionToResultsScreen(void);

static void Task_DisplayResult(void);
static void TaskDestructor_MultiplayerFinishResult(struct Task *);

#ifndef COLLECT_RINGS_ROM

// TODO: split finish result
#if (GAME == GAME_SA1)
extern const TileInfo sMPFinishTileInfo[2][7];
#elif (GAME == GAME_SA2)
const TileInfo sMPFinishTileInfo[2][7] = { {
                                               // Japanese
                                               { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_WIN },
                                               { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_LOSE },
                                               { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_DRAW },
                                               { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_1ST },
                                               { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_2ND },
                                               { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_3RD },
                                               { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_4TH },
                                           },
                                           {
                                               // English
                                               { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_WIN },
                                               { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_LOSE },
                                               { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_DRAW },
                                               { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_1ST },
                                               { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_2ND },
                                               { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_3RD },
                                               { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_4TH },
                                           } };

#define GET_MP_FINISH_RESULT_TILE_INFO(_id)                                                                                                \
    ({                                                                                                                                     \
        const TileInfo *source;                                                                                                            \
        u8 *info = (u8 *)sMPFinishTileInfo;                                                                                                \
                                                                                                                                           \
        s32 index;                                                                                                                         \
                                                                                                                                           \
        index = ((LOADED_SAVE->language == LANG_DEFAULT) || (LOADED_SAVE->language == LANG_JAPANESE)) ? 0 : (7 * sizeof(TileInfo));        \
        source = (TileInfo *)(info + index);                                                                                               \
                                                                                                                                           \
        (source + (_id));                                                                                                                  \
    })
#endif

void CreateMultiplayerFinishResult(u8 sioId, u8 rank)
{
    u32 i = 0;

#if (GAME == GAME_SA2)
    if (gMultiplayerRanks[sioId] == -1)
#endif
    {
        struct Task *t = TaskCreate(Task_DisplayResult, sizeof(FinishResult), 0x2010, 0, TaskDestructor_MultiplayerFinishResult);
        FinishResult *finish = TASK_DATA(t);
        struct Task **mpt = &gMultiplayerPlayerTasks[0];
        Sprite *s;

        for (; i < ARRAY_COUNT(gMultiplayerPlayerTasks); i++) {
            if (*mpt == NULL)
                break;
            else
                mpt++;
        }

        if (rank < 6) {
            gMultiplayerRanks[sioId] = rank;
        } else {
            // BUG(?): Value underflows if i is 0
            gMultiplayerRanks[sioId] = i - 1;
        }

        finish->sioId = sioId;
        finish->rank = rank;

        s = &finish->s;
        s->graphics.size = 0;

#if (GAME == GAME_SA1)
        s->graphics.anim = 904;

        if (rank == 5) {
            s->variant = 1;
            s->graphics.dest = VramMalloc(12);
        } else if (rank == 4) {
            s->variant = 2;
            s->graphics.dest = VramMalloc(12);
        } else if ((i == 2) || (gGameMode == GAME_MODE_CHAO_HUNT) || (gGameMode == GAME_MODE_MULTI_PLAYER)
                   || (gGameMode == GAME_MODE_TEAM_PLAY)) {
            s->variant = rank;
            s->graphics.dest = VramMalloc(12);
        } else {
            s->variant = rank + 3;
            s->graphics.dest = VramMalloc(8);
        }
#elif (GAME == GAME_SA2)
        s->graphics.dest = VramMalloc(12);
        if (rank == 5) {
            s->graphics.anim = GET_MP_FINISH_RESULT_TILE_INFO(1)->anim;
            s->variant = GET_MP_FINISH_RESULT_TILE_INFO(1)->variant;
        } else if (rank == 4) {
            s->graphics.anim = GET_MP_FINISH_RESULT_TILE_INFO(2)->anim;
            s->variant = GET_MP_FINISH_RESULT_TILE_INFO(2)->variant;
        } else if ((i == 2) || gGameMode == GAME_MODE_TEAM_PLAY) {
            s->graphics.anim = GET_MP_FINISH_RESULT_TILE_INFO(0)->anim;
            s->variant = rank + GET_MP_FINISH_RESULT_TILE_INFO(0)->variant;
        } else {
            s->graphics.anim = GET_MP_FINISH_RESULT_TILE_INFO(3)->anim;
            s->variant = rank + GET_MP_FINISH_RESULT_TILE_INFO(3)->variant;
        }
#endif

        s->prevVariant = -1;
        s->oamFlags = SPRITE_OAM_ORDER(0);
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);
    }
}

void Task_DisplayResult(void)
{
    FinishResult *finish = TASK_DATA(gCurTask);
    Sprite *s = &finish->s;
    MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[finish->sioId]);

    s->x = mpp->pos.x - gCamera.x;

    if (!GRAVITY_IS_INVERTED) {
        s->y = (mpp->pos.y - gCamera.y) - 32;
    } else {
        s->y = (mpp->pos.y - gCamera.y) + 32;
    }

    DisplaySprite(s);
}

void TaskDestructor_MultiplayerFinishResult(struct Task *t)
{
    FinishResult *finish = TASK_DATA(t);
    Sprite *s = &finish->s;
    VramFree(s->graphics.dest);
}

void CreateMultiplayerFinishTransition(void)
{
    u32 i;
    u32 r2;
    u8 r6;

#if (GAME == GAME_SA1)
    u8 arr[4] = { 0, 1, 2, 3 };
    u8 arr2[4] = {};
#endif
    {
        struct Task *mpt;
        struct Task *t = TaskCreate(Task_TransitionWaitForResults, sizeof(FinishTransition), 0x2000, 0, NULL);
        FinishTransition *finishTransition = TASK_DATA(t);

        finishTransition->frame = 0;

        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
#if (GAME == GAME_SA1)
            gMusicManagerState.unk0 = 0xFF;
            m4aSongNumStart(304);
#endif
        } else {
#if (GAME == GAME_SA2)
            return;
#endif
        }

#if (GAME == GAME_SA1)
        if (gGameMode == GAME_MODE_CHAO_HUNT) {
            *((u32 *)arr2) = *((u32 *)gMultiplayerCharRings);

            for (i = 0; i < ARRAY_COUNT(arr2); i++) {
                u32 j;
                for (j = 0; j < (3 - i); j++) {
                    if (arr2[j + 0] < arr2[j + 1]) {
                        XOR_SWAP(arr2[j + 0], arr2[j + 1]);
                        XOR_SWAP(arr[j + 0], arr[j + 1]);
                    }
                }
            }
            for (i = 0; i < ARRAY_COUNT(arr); i++) {
                u8 *ptr = &arr[i];

                if (i != 0) {
                    if (arr2[i] == arr2[0]) {
#ifndef NON_MATCHING
                        gMultiplayerRanks[*ptr] = ({
                            register u8 r1 asm("r1") = 4;
                            r1;
                        });
#else
                        gMultiplayerRanks[*ptr] = 4;
#endif

                    } else {
                        gMultiplayerRanks[*ptr] = 1;
                    }
                } else if (arr2[0] == arr2[1]) {
#ifndef NON_MATCHING
                    gMultiplayerRanks[*ptr] = ({
                        register u8 r1 asm("r1") = 4;
                        r1;
                    });
#else
                    gMultiplayerRanks[*ptr] = 4;
#endif
                } else {
                    gMultiplayerRanks[arr[0]] = i;
                }
            }

            for (i = 0; i < ARRAY_COUNT(gMultiplayerPlayerTasks); i++) {
                if (gMultiplayerPlayerTasks[i] != NULL) {
                    CreateMultiplayerFinishResult(i, (u8)gMultiplayerRanks[i]);
                }
            }
        } else if (gGameMode == GAME_MODE_TEAM_PLAY) {
            for (i = 0; i < ARRAY_COUNT(gMultiplayerPlayerTasks) && (gMultiplayerPlayerTasks[i] != NULL); i++) {
                arr2[(gMultiplayerConnections & (0x10 << i)) >> (i + 4)] += gMultiplayerCharRings[i];
            }

            if ((u32)arr2[0] < (u32)arr2[1]) {
                arr2[0] ^= (u8)arr2[1];
                arr2[1] ^= (u8)arr2[0];
                // xor swap swapped so can't use macro lol
                arr2[0] = ((u8)arr2[0] ^ (u8)arr2[1]);
                XOR_SWAP(arr[0], arr[1])
            }
            if (arr2[0] == arr2[1]) {
                for (i = 0; i < 4; i++) {
                    if (gMultiplayerPlayerTasks[i] != NULL) {
                        gMultiplayerRanks[i] = 4;
                    }
                }
            } else {
                for (i = 0; i < 4; i++) {
                    if (gMultiplayerPlayerTasks[i] != NULL) {
                        if (((gMultiplayerConnections & (0x10 << i)) >> (i + 4)) == arr[0]) {
                            gMultiplayerRanks[i] = 0;
                        } else {
                            gMultiplayerRanks[i] = 1;
                        }
                    }
                }
            }
            for (i = 0; i < 4; i++) {
                if (gMultiplayerPlayerTasks[i] != NULL) {
                    CreateMultiplayerFinishResult(i, gMultiplayerRanks[i]);
                }
            }
        } else if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            LOADED_SAVE->score += (s16)gRingCount;
            if (((u32)gCourseTime > MAX_COURSE_TIME) || ((STAGE_FLAG__TIMER_REVERSED & gStageFlags) && (gCourseTime == 0))) {
                u32 r2 = 0;
                u8 r5;
                u32 j;
                if ((gGameMode != GAME_MODE_MULTI_PLAYER) && (gGameMode != GAME_MODE_TEAM_PLAY)) {
                    for (j = 0; j < ARRAY_COUNT(gMultiplayerPlayerTasks) && (gMultiplayerPlayerTasks[j] != NULL); j++) {
                        if (gMultiplayerRanks[j] != -1) {
                            r2 += 1;
                        }
                    }

                    if (r2 == 0) {
                        r5 = 4;
                    } else if (r2 == (j - 1)) {
                        r5 = (j - 1);
                    } else {
                        r5 = 5;
                    }
                } else {
                    r5 = 4;
                }

                for (j = 0; j < ARRAY_COUNT(gMultiplayerPlayerTasks) && (gMultiplayerPlayerTasks[j] != NULL); j++) {
                    if ((gMultiplayerRanks[j] == -1) || (gGameMode == GAME_MODE_MULTI_PLAYER) || (gGameMode == GAME_MODE_TEAM_PLAY)) {
                        CreateMultiplayerFinishResult(j, r5);
                    }
                }
            }
        }
#elif (GAME == GAME_SA2)
        gMusicManagerState.unk0 = 0xFF;
        LOADED_SAVE->score += (s16)gRingCount;

        if (gCourseTime <= MAX_COURSE_TIME) {
            if (!(gStageFlags & STAGE_FLAG__TIMER_REVERSED) || (gCourseTime != 0)) {
                return;
            }
        }

        r2 = 0;

        if (gGameMode != GAME_MODE_TEAM_PLAY) {
            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                if (gMultiplayerPlayerTasks[i] == NULL) {
                    break;
                }

                if (gMultiplayerRanks[i] != -1) {
                    r2++;
                }
            }

            if (r2 == 0) {
                r6 = 4;
            } else if (r2 == (i - 1)) {
                r6 = r2;
            } else {
                r6 = 5;
            }
        } else {
            r6 = 4;
        }

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (gMultiplayerPlayerTasks[i] == NULL) {
                break;
            }

            if (gMultiplayerRanks[i] == -1) {
                MultiplayerPlayer *mpp;
                mpt = gMultiplayerPlayerTasks[i];
                mpp = TASK_DATA(mpt);
                mpp->unk5C |= 1;
                CreateMultiplayerFinishResult(i, r6);
            }
        }
#endif
    }
}

#endif // COLLECT_RINGS_ROM

static void Task_TransitionWaitForResults(void)
{
    u32 x = 0;
    FinishTransition *finishTransition = TASK_DATA(gCurTask);

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        x = DISPLAY_WIDTH;
    }

    if (gRoomEventQueueWritePos == gRoomEventQueueSendPos) {
        if (finishTransition->frame++ > x) {
            gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
            gBldRegs.bldY = 0;

            m4aMPlayFadeOut(&gMPlayInfo_BGM, 4);
            m4aMPlayFadeOut(&gMPlayInfo_SE1, 4);
            m4aMPlayFadeOut(&gMPlayInfo_SE2, 4);
            m4aMPlayFadeOut(&gMPlayInfo_SE3, 4);

            finishTransition->frame = 0;
            gCurTask->main = Task_TransitionToResultsScreen;
        }
    }
}

static void Task_TransitionToResultsScreen(void)
{
    u32 i; // r7

    FinishTransition *finishTransition = TASK_DATA(gCurTask);
    finishTransition->frame += Q(0.25);

    gBldRegs.bldY = I(finishTransition->frame);

    if (finishTransition->frame >= 0x1000) {
        // _0801A110
        gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        gBldRegs.bldY = 0;

        if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            u8 rankToPid[4] = { 0, 1, 2, 3 };
            u8 charRings[4] = { 0 };

#if (GAME == GAME_SA2)
            m4aMPlayAllStop();
#endif
            *((u32 *)charRings) = *((u32 *)gMultiplayerCharRings);

            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                s32 m;

                for (m = 0; m < (3 - i); m++) {
                    if (charRings[m] < charRings[m + 1]) {
                        XOR_SWAP(charRings[m], charRings[m + 1]);
                        XOR_SWAP(rankToPid[m], rankToPid[m + 1]);
                    }
                }
            }

            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {

                if (i != 0) {
                    if (charRings[i] != charRings[0]) {
                        gMultiplayerRanks[rankToPid[i]] = i;
                        gMultiplayerCharacters[rankToPid[i]] = 1;
                    } else {
#ifndef NON_MATCHING
                        // TODO: Match without goto
                        goto else_block;
#else
                        gMultiplayerRanks[rankToPid[i]] = i;
                        gMultiplayerCharacters[rankToPid[i]] = 2;
#endif
                    }
                } else {
                    // _0801A1F4
                    if (charRings[0] == charRings[1]) {
#ifndef NON_MATCHING
                    else_block:
#endif
                        gMultiplayerRanks[rankToPid[i]] = i;
                        gMultiplayerCharacters[rankToPid[i]] = 2;
                    } else {
                        gMultiplayerRanks[rankToPid[0]] = i;
                        gMPRingCollectWins[rankToPid[0]]++;
                        gMultiplayerCharacters[rankToPid[0]] = i;
                    }
                }
            }

#if (GAME == GAME_SA2)
            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
#ifndef NON_MATCHING
                // TODO: Match without goto
                goto _0801A2DA;
#else
                TasksDestroyAll();

                { // TODO: This is a macro!
                    PAUSE_BACKGROUNDS_QUEUE();
                    gBgSpritesCount = 0;
                    PAUSE_GRAPHICS_QUEUE();
                }

                if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    DmaFill32(3, 0, &gMultiSioSend, sizeof(struct MultiSioData_0_0));
                    CreateMultiplayerResultsScreen(1);
                } else {
                    DmaFill32(3, 0, &gMultiSioSend, sizeof(struct MultiSioData_0_0));
                    CreateMultiplayerSinglePakResultsScreen(1);
                }

                return;
#endif
            }
#endif
        }
        // _0801A232

#if (GAME == GAME_SA2) && !(defined COLLECT_RINGS_ROM)
        {
            s16 pid;
            s32 foeResult;
            s16 ownResult = 0;
            for (pid = 0; pid < MULTI_SIO_PLAYERS_MAX; pid++) {

                if (!CONNECTION_REGISTERED(pid))
                    continue;

                if (pid == SIO_MULTI_CNT->id)
                    continue;

                if (gMultiplayerRanks[SIO_MULTI_CNT->id] < gMultiplayerRanks[pid]) {
                    foeResult = 0;
                } else if (gMultiplayerRanks[SIO_MULTI_CNT->id] > gMultiplayerRanks[pid]) {
                    foeResult = 1;
                    ownResult = 1;
                } else {
                    foeResult = 2;

                    if (ownResult != 1) {
                        ownResult = 2;
                    }
                }
                // _0801A2A8
                RecordMultiplayerResult(gMultiplayerIds[pid], &gMultiplayerNames[pid][0], foeResult);
            }

            RecordOwnMultiplayerResult(ownResult);
            WriteSaveGame();
        }
#endif
#ifndef NON_MATCHING
    _0801A2DA:
#endif
        TasksDestroyAll();

        { // TODO: This is a macro!
            PAUSE_BACKGROUNDS_QUEUE();
            gBgSpritesCount = 0;
            PAUSE_GRAPHICS_QUEUE();
        }

#ifndef COLLECT_RINGS_ROM
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            DmaFill32(3, 0, &gMultiSioSend, sizeof(struct MultiSioData_0_0));
            CreateMultiplayerResultsScreen(1);
        } else
#endif
        {
#ifndef COLLECT_RINGS_ROM
            DmaFill32(3, 0, &gMultiSioSend, sizeof(struct MultiSioData_0_0));
#endif
            CreateMultiplayerSinglePakResultsScreen(1);
        }

        return;
    }
}

#if COLLECT_RINGS_ROM
void CreateMultiplayerFinishTransition(void)
{
    u32 i;
    u32 r2;
    u8 r6;
    struct Task *mpt;
    struct Task *t = TaskCreate(Task_TransitionWaitForResults, sizeof(FinishTransition), 0x2000, 0, NULL);
    FinishTransition *finishTransition = TASK_DATA(t);
    finishTransition->frame = 0;
}
#endif
