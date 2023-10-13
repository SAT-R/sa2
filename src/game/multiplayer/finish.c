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

// https://decomp.me/scratch/mH5Qf
void sub_8019CCC(u8 sioId, u8 count)
{
    u32 i = 0;

    if (gUnknown_030054B4[sioId] == -1) {
        struct Task *t = TaskCreate(Task_8019E70, sizeof(MpFinish1), 0x2010, 0,
                                    TaskDestructor_8019EF4);
        MpFinish1 *finish = TaskGetStructPtr(t);
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
            u8 *info = (u8 *)gUnknown_080D5768;
            const TileInfo *source; //

            s32 index;

            index = ((gLoadedSaveGame->language == LANG_DEFAULT)
                     || (gLoadedSaveGame->language == LANG_JAPANESE))
                ? 0
                : 0x38;
            source = (TileInfo *)(info + index);

            s->graphics.anim = (source + 1)->anim;

            index = ((gLoadedSaveGame->language == LANG_DEFAULT)
                     || (gLoadedSaveGame->language == LANG_JAPANESE))
                ? 0
                : 0x38;
            source = (TileInfo *)(info + index);

            s->variant = (source + 1)->variant;
        } else if (count == 4) {
            u8 *info = (u8 *)gUnknown_080D5768;
            const TileInfo *source; //

            s32 index;

            index = ((gLoadedSaveGame->language == LANG_DEFAULT)
                     || (gLoadedSaveGame->language == LANG_JAPANESE))
                ? 0
                : 0x38;
            source = (TileInfo *)(info + index);

            s->graphics.anim = (source + 2)->anim;

            index = ((gLoadedSaveGame->language == LANG_DEFAULT)
                     || (gLoadedSaveGame->language == LANG_JAPANESE))
                ? 0
                : 0x38;
            source = (TileInfo *)(info + index);

            s->variant = (source + 2)->variant;
        } else if ((i == 2) || gGameMode == GAME_MODE_TEAM_PLAY) {
            u8 *info = (u8 *)gUnknown_080D5768;
            const TileInfo *source; //

            s32 index;

            index = ((gLoadedSaveGame->language == LANG_DEFAULT)
                     || (gLoadedSaveGame->language == LANG_JAPANESE))
                ? 0
                : 0x38;
            source = (TileInfo *)(info + index);

            s->graphics.anim = (source)->anim;

            index = ((gLoadedSaveGame->language == LANG_DEFAULT)
                     || (gLoadedSaveGame->language == LANG_JAPANESE))
                ? 0
                : 0x38;
            source = (TileInfo *)(info + index);

            s->variant = count + (source)->variant;
        } else {
            u8 *info = (u8 *)gUnknown_080D5768;
            const TileInfo *source; //

            s32 index;

            index = ((gLoadedSaveGame->language == LANG_DEFAULT)
                     || (gLoadedSaveGame->language == LANG_JAPANESE))
                ? 0
                : 0x38;
            source = (TileInfo *)(info + index);

            s->graphics.anim = (source + 3)->anim;

            index = ((gLoadedSaveGame->language == LANG_DEFAULT)
                     || (gLoadedSaveGame->language == LANG_JAPANESE))
                ? 0
                : 0x38;
            source = (TileInfo *)(info + index);

            s->variant = count + (source + 3)->variant;
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