#include "global.h"
#include "core.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/multiplayer/unknown_1.h"
#include "game/stage/entities_manager.h"

struct UNK_3005510 *sub_8019224(void)
{
    struct UNK_3005510 *result = &gUnknown_03005510[gUnknown_03005438];

    gUnknown_03005438 = (gUnknown_03005438 + 1) & 0xF;

    return result;
}

/* NOTE(Jace): Once one of the non-matching procedures is matched,
               the others should be relatively easy to do as well. */

// (99.61%)
// https://decomp.me/scratch/fIfdo
NONMATCH("asm/non_matching/sub_8019240.inc",
         void sub_8019240(union MultiSioData *msioData, u32 UNUSED someId))
{
    if (gEntitiesManagerTask != NULL) {
        EntitiesManager *em = TaskGetStructPtr(gEntitiesManagerTask);
        // MapData *ias = em->interactables;
        u32 *ias = (u32 *)em->interactables;
        u16 h_regionCount;
        u32 r2;
        u32 offset;
        ias++; // skip size
        h_regionCount = *ias++; // get h_regionCount
        ias++; // skip v_regionCount
        r2 = msioData->pat0.unkF;

        // NONMATCH: this line has reg-alloc issues, otherwise it matches
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
END_NONMATCH

// (97.68%)
// https://decomp.me/scratch/mLFFR
NONMATCH("asm/non_matching/sub_80192A8.inc",
         void sub_80192A8(union MultiSioData *msioData, u32 UNUSED someId))
{
    if (gEntitiesManagerTask != NULL) {
        EntitiesManager *em = TaskGetStructPtr(gEntitiesManagerTask);
        // MapData *items = em->interactables;
        u32 *items = (u32 *)em->items;
        u16 h_regionCount;
        u32 r2;
        u32 offset;
        items++; // skip size
        h_regionCount = *items++; // get h_regionCount
        items++; // skip v_regionCount
        r2 = msioData->pat0.unkF;

        offset = *(u32 *)(((u8 *)items)
                          + ((h_regionCount * msioData->pat4.unk10) * sizeof(u32))
                          + (r2 << 2));
        if (offset != 0) {
            u32 *cursor;

            // cursor's 0-pos is the same as h_regionCount
            offset -= 8;
            cursor = (u32 *)(((u8 *)items) + offset);

            cursor = (u32 *)(((u8 *)cursor) + (msioData->pat4.unk11 * 3));

            *(s8 *)cursor = -3;
        }
    }
}
END_NONMATCH

// (97.68%)
// https://decomp.me/scratch/X2CJ3
NONMATCH("asm/non_matching/sub_80192FC.inc",
         void sub_80192FC(union MultiSioData *msioData, u32 UNUSED someId))
{
    if (gEntitiesManagerTask != NULL) {
        EntitiesManager *em = TaskGetStructPtr(gEntitiesManagerTask);
        // MapData *enemies = em->interactables;
        u32 *enemies = (u32 *)em->enemies;
        u16 h_regionCount;
        u32 r2;
        u32 offset;
        enemies++; // skip size
        h_regionCount = *enemies++; // get h_regionCount
        enemies++; // skip v_regionCount
        r2 = msioData->pat0.unkF;

        offset = *(u32 *)(((u8 *)enemies)
                          + ((h_regionCount * msioData->pat4.unk10) * sizeof(u32))
                          + (r2 << 2));
        if (offset != 0) {
            u32 *cursor;

            // cursor's 0-pos is the same as h_regionCount
            offset -= 8;
            cursor = (u32 *)(((u8 *)enemies) + offset);

            cursor = (u32 *)(((u8 *)cursor) + (msioData->pat4.unk11 * 7));

            *(s8 *)cursor = -3;
        }
    }
}
END_NONMATCH

void sub_8019350(union MultiSioData *msioData, u32 UNUSED someId)
{
    sub_801FD34(msioData->pat4.unk2, msioData->pat4.unk4, msioData->pat4.unkF);
}

// (97.95%)
// https://decomp.me/scratch/FzUTp
NONMATCH("asm/non_matching/sub_8019368.inc",
         void sub_8019368(union MultiSioData *msioData, u32 UNUSED someId))
{
    if (gEntitiesManagerTask != NULL) {
        EntitiesManager *em = TaskGetStructPtr(gEntitiesManagerTask);
        // MapData *ias = em->interactables;
        u32 *ias = (u32 *)em->interactables;
        u16 h_regionCount;
        u32 r2;
        u32 offset;
        ias++; // skip size
        h_regionCount = *ias++; // get h_regionCount
        ias++; // skip v_regionCount
        r2 = msioData->pat0.unkF;

        // NONMATCH: this line has reg-alloc issues, otherwise it matches
        offset = *(u32 *)(((u8 *)ias)
                          + ((h_regionCount * msioData->pat4.unk10) * sizeof(u32))
                          + (r2 << 2));
        if (offset != 0) {
            u32 *cursor;

            // cursor's 0-pos is the same as h_regionCount
            offset -= 8;
            cursor = (u32 *)(((u8 *)ias) + offset);

            cursor = (u32 *)(((u8 *)cursor) + (msioData->pat4.unk11 * 7));

            *(s8 *)cursor = msioData->pat4.unk12;
        }
    }
}
END_NONMATCH

// Type of this is determined by it being called in a C func-array
void VoidReturnSIOControl32(union MultiSioData *msioData, u32 UNUSED someId)
{
    REG_SIOCNT_32;
}