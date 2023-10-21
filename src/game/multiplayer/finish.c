#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"
#include "game/game.h"
#include "game/multiplayer/finish.h"
#include "game/save.h"

#include "constants/animations.h"
#include "constants/text.h"

typedef struct {
    Sprite s;
    u8 unk30;
    u8 unk31;
} MpFinish1; /* size: 0x34 */

void Task_8019E70(void);
void TaskDestructor_8019EF4(struct Task *);

const TileInfo gUnknown_080D5768[2][7]
    = { {
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

#define GET_MP_FINISH_RESULT_TILE_INFO(_id)                                             \
    ({                                                                                  \
        const TileInfo *source;                                                         \
        u8 *info = (u8 *)gUnknown_080D5768;                                             \
                                                                                        \
        s32 index;                                                                      \
                                                                                        \
        index = ((gLoadedSaveGame->language == LANG_DEFAULT)                            \
                 || (gLoadedSaveGame->language == LANG_JAPANESE))                       \
            ? 0                                                                         \
            : (7 * sizeof(TileInfo));                                                   \
        source = (TileInfo *)(info + index);                                            \
                                                                                        \
        (source + (_id));                                                               \
    })

void sub_8019CCC(u8 sioId, u8 count)
{
    u32 i = 0;

    if (gUnknown_030054B4[sioId] == -1) {
        struct Task *t = TaskCreate(Task_8019E70, sizeof(MpFinish1), 0x2010, 0,
                                    TaskDestructor_8019EF4);
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
            gUnknown_030054B4[sioId] = count;
        } else {
            // BUG(?): Value underflows if i is 0
            gUnknown_030054B4[sioId] = i - 1;
        }

        finish->unk30 = sioId;
        finish->unk31 = count;

        s = &finish->s;
        s->graphics.size = 0;
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

        s->prevVariant = -1;
        s->unk1A = SPRITE_OAM_ORDER(0);
        s->timeUntilNextFrame = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->unk10 = SPRITE_FLAG(PRIORITY, 0);
        UpdateSpriteAnimation(s);
    }
}

void Task_8019E70(void)
{
    MpFinish1 *finish = TASK_DATA(gCurTask);
    Sprite *s = &finish->s;
    struct MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[finish->unk30]);

    s->x = mpp->unk50 - gCamera.x;

    if (!GRAVITY_IS_INVERTED) {
        s->y = (mpp->unk52 - gCamera.y) - 32;
    } else {
        s->y = (mpp->unk52 - gCamera.y) + 32;
    }

    DisplaySprite(s);
}

void TaskDestructor_8019EF4(struct Task *t)
{
    MpFinish1 *finish = TASK_DATA(t);
    Sprite *s = &finish->s;
    VramFree(s->graphics.dest);
}

#if 0
typedef struct {
    u16 unk0;
    u8 filler2[2];
} Finish2; /* size: 4 */

void sub_801A04C(void);

void sub_8019F08(void)
{
    u32 r6;
    struct Task *t = TaskCreate(sub_801A04C, sizeof(Finish2), 0x2000, 0, NULL);
    Finish2 *f2 = TASK_DATA(t);
    f2->unk0 = 0;

    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        return;
    }

    gUnknown_030054A8.unk0 = 0xFF;
    gLoadedSaveGame->score += gRingCount;

    if((gCourseTime <= MAX_COURSE_TIME)
    && !(gUnknown_03005424 & EXTRA_STATE__4)
    && (gCourseTime != 0))
    {
        return;
    }
    // _08019F6C

    if(gGameMode != GAME_MODE_TEAM_PLAY) {
        struct Task *mpt = gMultiplayerPlayerTasks[0];
        
    } else {
        // _08019FE4
        r6 = 4;
    }
}
#endif