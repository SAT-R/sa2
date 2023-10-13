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
            { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_WIN },
            { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_LOSE },
            { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_DRAW },
            { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_1ST },
            { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_2ND },
            { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_3RD },
            { 0, SA2_ANIM_MP_RESULT_JP, SA2_ANIM_MP_RESULT_4TH },
        },
        {
            { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_WIN },
            { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_LOSE },
            { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_DRAW },
            { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_1ST },
            { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_2ND },
            { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_3RD },
            { 0, SA2_ANIM_MP_RESULT, SA2_ANIM_MP_RESULT_4TH },
        } };

void sub_8019CCC(u8 sioId, u8 count)
{
    u32 i;

    if (gUnknown_030054B4[sioId] == -1) {
        struct Task *t = TaskCreate(Task_8019E70, sizeof(MpFinish1), 0x2010, 0,
                                    TaskDestructor_8019EF4);
        MpFinish1 *finish = TaskGetStructPtr(t);
        struct Task **mpt = &gMultiplayerPlayerTasks[0];
        Sprite *s;

        for (i = 0; i < ARRAY_COUNT(gMultiplayerPlayerTasks); i++) {
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

        finish->unk30 = 0;
        finish->unk31 = count;

        s = &finish->s;
        s->graphics.size = 0;
        s->graphics.dest = VramMalloc(12);

        if (count == 5) {
            bool32 isInternational = FALSE;

            if ((gLoadedSaveGame->language != LANG_DEFAULT)
                && (gLoadedSaveGame->language != LANG_JAPANESE)) {
                isInternational = TRUE;
            }
            s->graphics.anim = gUnknown_080D5768[isInternational][1].anim;

            
            if ((gLoadedSaveGame->language != LANG_DEFAULT)
                && (gLoadedSaveGame->language != LANG_JAPANESE)) {
                isInternational = TRUE;
            }
            s->variant = gUnknown_080D5768[isInternational][1].variant;
        } else if (count == 4) {
            // _08019D94+4
            bool32 isInternational;

            if ((gLoadedSaveGame->language != LANG_DEFAULT)
                && (gLoadedSaveGame->language != LANG_JAPANESE)) {
                isInternational = TRUE;
            } else {
                isInternational = FALSE;
            }
            s->graphics.anim = gUnknown_080D5768[isInternational][2].anim;

            if ((gLoadedSaveGame->language != LANG_DEFAULT)
                && (gLoadedSaveGame->language != LANG_JAPANESE)) {
                isInternational = TRUE;
            }
            s->variant = gUnknown_080D5768[isInternational][2].variant;
        } else if ((i == 2) || gGameMode == GAME_MODE_TEAM_PLAY) {
            // _08019DD8
        } else {
            // _08019E0C
        }
    }
}