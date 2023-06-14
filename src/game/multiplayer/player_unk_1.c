#include "global.h"
#include "core.h"
#include "game/game.h"
#include "game/multiplayer/unknown_1.h"
#include "game/stage/entities_manager.h"

struct UNK_3005510 *sub_8019224(void)
{
    struct UNK_3005510 *result = &gUnknown_03005510[gUnknown_03005438];

    gUnknown_03005438 = (gUnknown_03005438 + 1) & 0xF;

    return result;
}

#if 01
// https://decomp.me/scratch/fIfdo
void sub_8019240(union MultiSioData *msioData, u32 someId)
{
    if (gEntitiesManagerTask != NULL) {
        EntitiesManager *em = TaskGetStructPtr(gEntitiesManagerTask);
        // MapData *ias = em->interactables;
        u32 *ias = (u32 *)em->interactables;
        u16 h_regionCount;
        u32 r1, r2, r2_2;
        u32 offset, offset2;
        ias++; // skip size
        h_regionCount = *ias++; // get h_regionCount
        ias++; // skip v_regionCount
        r2 = msioData->pat0.unkF;

        offset = *(u32 *)(((u8 *)ias)
                          + ((h_regionCount * msioData->pat4.unk10) * sizeof(u32))
                          + (r2 << 2));
        if (offset != 0) {
            u32 *cursor;

            // cursor's 0-pos is the same as h_regionCount
            offset -= 8;
            cursor = (u32 *)(((u8 *)ias) + offset);

            cursor = (u32 *)(((u8 *)cursor) + (msioData->pat4.unk11 * 7));

            if ((msioData->pat4.unk12 == 0)
                || ((msioData->pat4.unk12 == 1) && (*((s8 *)cursor) == -2))) {
                *(s8 *)cursor = -3;
            }
        }
    }
}
#endif