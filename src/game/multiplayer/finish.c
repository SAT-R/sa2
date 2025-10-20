#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "game/save.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/multiplayer/finish.h"
#include "game/multiplayer/mp_player.h"
#include "game/multiplayer/results.h"
#include "game/multiplayer/multiplayer_event_mgr.h"

#include "game/multiboot/collect_rings/results.h"

#include "lib/m4a/m4a.h"

#include "constants/animations.h"
#include "constants/text.h"

typedef struct {
    Sprite s;
    u8 unk30;
    u8 unk31;
} MpFinish1; /* size: 0x34 */

typedef struct {
    u16 unk0;
} Finish2; /* size: 4 */

void Task_801A04C(void);
void Task_TransitionToResultsScreen(void);

void SA2_LABEL(Task_8019E70)(void);
void SA2_LABEL(TaskDestructor_8019EF4)(struct Task *);

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
#endif

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

void CreateMultiplayerFinishResult(u8 sioId, u8 count)
{
    u32 i = 0;

#if (GAME == GAME_SA2)
    if (SA2_LABEL(gUnknown_030054B4)[sioId] == -1)
#endif
    {
        struct Task *t = TaskCreate(SA2_LABEL(Task_8019E70), sizeof(MpFinish1), 0x2010, 0, SA2_LABEL(TaskDestructor_8019EF4));
        MpFinish1 *finish = TASK_DATA(t);
        struct Task **mpt = &gMultiplayerPlayerTasks[0];
        Sprite *s;

        for (; i < ARRAY_COUNT(gMultiplayerPlayerTasks); i++) {
            if (*mpt == NULL)
                break;
            else
                mpt++;
        }

        if (count < 6) {
            SA2_LABEL(gUnknown_030054B4)[sioId] = count;
        } else {
            // BUG(?): Value underflows if i is 0
            SA2_LABEL(gUnknown_030054B4)[sioId] = i - 1;
        }

        finish->unk30 = sioId;
        finish->unk31 = count;

        s = &finish->s;
        s->graphics.size = 0;

#if (GAME == GAME_SA1)
        s->graphics.anim = 904;

        if (count == 5) {
            s->variant = 1;
            s->graphics.dest = VramMalloc(12);
        } else if (count == 4) {
            s->variant = 2;
            s->graphics.dest = VramMalloc(12);
        } else if ((i == 2) || (gGameMode == GAME_MODE_CHAO_HUNT) || (gGameMode == GAME_MODE_MULTI_PLAYER)
                   || (gGameMode == GAME_MODE_TEAM_PLAY)) {
            s->variant = count;
            s->graphics.dest = VramMalloc(12);
        } else {
            s->variant = count + 3;
            s->graphics.dest = VramMalloc(8);
        }
#elif (GAME == GAME_SA2)
        s->graphics.dest = VramMalloc(12);
        if (count == 5) {
            s->graphics.anim = GET_MP_FINISH_RESULT_TILE_INFO(1)->anim;
            s->variant = GET_MP_FINISH_RESULT_TILE_INFO(1)->variant;
        } else if (count == 4) {
            s->graphics.anim = GET_MP_FINISH_RESULT_TILE_INFO(2)->anim;
            s->variant = GET_MP_FINISH_RESULT_TILE_INFO(2)->variant;
        } else if ((i == 2) || gGameMode == GAME_MODE_TEAM_PLAY) {
            s->graphics.anim = GET_MP_FINISH_RESULT_TILE_INFO(0)->anim;
            s->variant = count + GET_MP_FINISH_RESULT_TILE_INFO(0)->variant;
        } else {
            s->graphics.anim = GET_MP_FINISH_RESULT_TILE_INFO(3)->anim;
            s->variant = count + GET_MP_FINISH_RESULT_TILE_INFO(3)->variant;
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

void SA2_LABEL(Task_8019E70)(void)
{
    MpFinish1 *finish = TASK_DATA(gCurTask);
    Sprite *s = &finish->s;
    MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[finish->unk30]);

    s->x = mpp->pos.x - gCamera.x;

    if (!GRAVITY_IS_INVERTED) {
        s->y = (mpp->pos.y - gCamera.y) - 32;
    } else {
        s->y = (mpp->pos.y - gCamera.y) + 32;
    }

    DisplaySprite(s);
}

void SA2_LABEL(TaskDestructor_8019EF4)(struct Task *t)
{
    MpFinish1 *finish = TASK_DATA(t);
    Sprite *s = &finish->s;
    VramFree(s->graphics.dest);
}

void CreateMultiplayerFinishHandler(void)
{
    u32 i;
    u32 r2;
    u8 r6;
    struct Task *mpt;
    struct Task *t = TaskCreate(Task_801A04C, sizeof(Finish2), 0x2000, 0, NULL);
    Finish2 *f2 = TASK_DATA(t);
    f2->unk0 = 0;

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        return;
    }

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

            if (SA2_LABEL(gUnknown_030054B4)[i] != -1) {
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

        if (SA2_LABEL(gUnknown_030054B4)[i] == -1) {
            MultiplayerPlayer *mpp;
            mpt = gMultiplayerPlayerTasks[i];
            mpp = TASK_DATA(mpt);
            mpp->unk5C |= 1;
            CreateMultiplayerFinishResult(i, r6);
        }
    }
}
#endif

void Task_801A04C(void)
{
    u32 x = 0;
    Finish2 *f2 = TASK_DATA(gCurTask);

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        x = DISPLAY_WIDTH;
    }

    if (gRoomEventQueueWritePos == gRoomEventQueueSendPos) {
        if (f2->unk0++ > x) {
            gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
            gBldRegs.bldY = 0;

            m4aMPlayFadeOut(&gMPlayInfo_BGM, 4);
            m4aMPlayFadeOut(&gMPlayInfo_SE1, 4);
            m4aMPlayFadeOut(&gMPlayInfo_SE2, 4);
            m4aMPlayFadeOut(&gMPlayInfo_SE3, 4);

            f2->unk0 = 0;
            gCurTask->main = Task_TransitionToResultsScreen;
        }
    }
}

void Task_TransitionToResultsScreen(void)
{
    u32 i; // r7

    Finish2 *f2 = TASK_DATA(gCurTask);
    f2->unk0 += Q(0.25);

    gBldRegs.bldY = I(f2->unk0);

    if (f2->unk0 >= 0x1000) {
        // _0801A110
        gBldRegs.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        gBldRegs.bldY = 0;

        if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            u8 sp00[4] = { 0, 1, 2, 3 };
            u8 sp04[4] = { 0 };

            m4aMPlayAllStop();
            *((u32 *)sp04) = *((u32 *)gMultiplayerCharRings);

            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                s32 m;

                for (m = 0; m < (3 - i); m++) {
                    if (sp04[m] < sp04[m + 1]) {
                        XOR_SWAP(sp04[m], sp04[m + 1]);
                        XOR_SWAP(sp00[m], sp00[m + 1]);
                    }
                }
            }

            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {

                if (i != 0) {
                    if (sp04[i] != sp04[0]) {
                        SA2_LABEL(gUnknown_030054B4)[sp00[i]] = i;
                        gMultiplayerCharacters[sp00[i]] = 1;
                    } else {
#ifndef NON_MATCHING
                        // TODO: Match without goto
                        goto else_block;
#else
                        SA2_LABEL(gUnknown_030054B4)[sp00[i]] = i;
                        gMultiplayerCharacters[sp00[i]] = 2;
#endif
                    }
                } else {
                    // _0801A1F4
                    if (sp04[0] == sp04[1]) {
#ifndef NON_MATCHING
                    else_block:
#endif
                        SA2_LABEL(gUnknown_030054B4)[sp00[i]] = i;
                        gMultiplayerCharacters[sp00[i]] = 2;
                    } else {
                        SA2_LABEL(gUnknown_030054B4)[sp00[0]] = i;
                        gMPRingCollectWins[sp00[0]]++;
                        gMultiplayerCharacters[sp00[0]] = i;
                    }
                }
            }

            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
#ifndef NON_MATCHING
                // TODO: Match without goto
                goto _0801A2DA;
#else
                TasksDestroyAll();

                { // TODO: This is a macro!
                    PAUSE_BACKGROUNDS_QUEUE();
                    gUnknown_03005390 = 0;
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
        }
        // _0801A232

#ifndef COLLECT_RINGS_ROM
        {
            s16 pid;
            s32 foeResult;
            s16 ownResult = 0;
            for (pid = 0; pid < MULTI_SIO_PLAYERS_MAX; pid++) {

                if (!((gMultiplayerConnections >> pid) & 0x1))
                    continue;

                if (pid == SIO_MULTI_CNT->id)
                    continue;

                if (SA2_LABEL(gUnknown_030054B4)[SIO_MULTI_CNT->id] < SA2_LABEL(gUnknown_030054B4)[pid]) {
                    foeResult = 0;
                } else if (SA2_LABEL(gUnknown_030054B4)[SIO_MULTI_CNT->id] > SA2_LABEL(gUnknown_030054B4)[pid]) {
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
            gUnknown_03005390 = 0;
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
void CreateMultiplayerFinishHandler(void)
{
    u32 i;
    u32 r2;
    u8 r6;
    struct Task *mpt;
    struct Task *t = TaskCreate(Task_801A04C, sizeof(Finish2), 0x2000, 0, NULL);
    Finish2 *f2 = TASK_DATA(t);
    f2->unk0 = 0;
}
#endif
