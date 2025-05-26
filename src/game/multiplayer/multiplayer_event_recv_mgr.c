#include "global.h"
#include "core.h"
#include "game/entity.h"
#include "game/multiplayer/multiplayer_event_mgr.h"
#include "game/stage/rings_scatter.h"
#include "game/sa1_sa2_shared/entities_manager.h"

void *CreateRoomEvent(void)
{
    RoomEvent *result = &gRoomEventQueue[gRoomEventQueueWritePos];

    gRoomEventQueueWritePos = (gRoomEventQueueWritePos + 1) & 0xF;

    return result;
}

void ReceiveRoomEvent_PlatformChange(union MultiSioData *msioData, u8 someId)
{
    if (gEntitiesManagerTask != NULL) {
        EntitiesManager *em = TASK_DATA(gEntitiesManagerTask);
        // MapData *ias = em->interactables;
        u32 *ias = (u32 *)em->interactables;
        u16 h_regionCount;
        u32 r1, r2, r2_2;
        u32 offset, offset2;
        ias++; // skip size
        h_regionCount = *ias++; // get h_regionCount
        ias++; // skip v_regionCount
        r2 = msioData->pat0.unkF;

        offset = *(u32 *)(((u8 *)ias) + ((h_regionCount * msioData->pat4.unk10) * sizeof(u32)) + (r2 * sizeof(u32)));
        if (offset != 0) {
            MapEntity *cursor;

            // cursor's 0-pos is the same as h_regionCount
            offset -= 8;
            cursor = (MapEntity *)((u8 *)ias + offset);
            cursor += msioData->pat4.unk11;

            if ((msioData->pat4.unk12 == 0) || ((msioData->pat4.unk12 == 1) && ((s8)cursor->x == MAP_ENTITY_STATE_INITIALIZED))) {
                *(s8 *)(&cursor->x) = MAP_ENTITY_STATE_MINUS_THREE;
            }
        }
    }
}

void ReceiveRoomEvent_ItemBoxBreak(union MultiSioData *msioData, u8 UNUSED someId)
{
    if (gEntitiesManagerTask != NULL) {
        EntitiesManager *em = TASK_DATA(gEntitiesManagerTask);
        // MapData *items = em->interactables;
        u32 *items = (u32 *)em->items;
        u16 h_regionCount;
        u32 r2;
        items++; // skip size
        h_regionCount = *items++; // get h_regionCount
        items++; // skip v_regionCount
        r2 = msioData->pat0.unkF;

        {
#ifdef NON_MATCHING
            u32 offset
#else
            register u32 offset asm("r1")
#endif
                = *(u32 *)(((u8 *)items) + ((h_regionCount * msioData->pat4.unk10) * sizeof(u32)) + (r2 * sizeof(u32)));
            if (offset != 0) {
                MapEntity_Itembox *cursor;

                // cursor's 0-pos is the same as h_regionCount
                offset -= 8;
                cursor = (MapEntity_Itembox *)((s8 *)items + offset);

                cursor += msioData->pat4.unk11;

                *(s8 *)(&cursor->x) = MAP_ENTITY_STATE_MINUS_THREE;
            }
        }
    }
}

void ReceiveRoomEvent_EnemyDestroyed(union MultiSioData *msioData, u8 UNUSED someId)
{
    if (gEntitiesManagerTask != NULL) {
        EntitiesManager *em = TASK_DATA(gEntitiesManagerTask);
        // MapData *enemies = em->interactables;
        u32 *enemies = (u32 *)em->enemies;
        u16 h_regionCount;
        u32 r2;
        enemies++; // skip size
        h_regionCount = *enemies++; // get h_regionCount
        enemies++; // skip v_regionCount
        r2 = msioData->pat0.unkF;
        {
#ifdef NON_MATCHING
            u32 offset
#else
            register u32 offset asm("r1")
#endif
                = *(u32 *)(((u8 *)enemies) + ((h_regionCount * msioData->pat4.unk10) * sizeof(u32)) + (r2 * sizeof(u32)));
            if (offset != 0) {
                MapEntity *cursor;

                // cursor's 0-pos is the same as h_regionCount
                offset -= 8;
                cursor = (MapEntity *)((u8 *)enemies + offset);

                cursor += msioData->pat4.unk11;

                *((s8 *)&cursor->x) = MAP_ENTITY_STATE_MINUS_THREE;
            }
        }
    }
}

void ReceiveRoomEvent_PlayerRingLoss(union MultiSioData *msioData, u8 UNUSED someId)
{
    InitScatteringRings(msioData->pat4.x, msioData->pat4.y, msioData->pat4.numRings);
}

void ReceiveRoomEvent_MysteryItemBoxBreak(union MultiSioData *msioData, u8 UNUSED someId)
{
    if (gEntitiesManagerTask != NULL) {
        EntitiesManager *em = TASK_DATA(gEntitiesManagerTask);
        // MapData *ias = em->interactables;
        u32 *ias = (u32 *)em->interactables;
        u16 h_regionCount;
        u32 r2;
        ias++; // skip size
        h_regionCount = *ias++; // get h_regionCount
        ias++; // skip v_regionCount
        r2 = msioData->pat0.unkF;
        {
#ifdef NON_MATCHING
            u32 offset
#else
            register u32 offset asm("r1")
#endif
                = *(u32 *)(((u8 *)ias) + ((h_regionCount * msioData->pat4.unk10) * sizeof(u32)) + (r2 * sizeof(u32)));
            if (offset != 0) {
                MapEntity *cursor;

                offset -= 8;
                cursor = (MapEntity *)((u8 *)ias + offset);

                cursor += msioData->pat4.unk11;

                cursor->d.sData[1] = msioData->pat4.unk12;
            }
        }
    }
}

#ifndef COLLECT_RINGS_ROM
// Type of this is determined by it being referenced in a C func-array
void ReceiveRoomEvent_Unknown(union MultiSioData *msioData, u8 UNUSED someId) { REG_SIOCNT_32; }
#endif
