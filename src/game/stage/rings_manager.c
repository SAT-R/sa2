#include <string.h>
#include "global.h"
#include "core.h"
#include "malloc_ewram.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/player_super_sonic.h"
#include "game/stage/ring.h"
#include "game/stage/rings_manager.h"
#include "game/stage/collect_ring_effect.h"
#include "game/assets/compressed/entities.h"

#include "constants/animations.h"

typedef struct {
    Sprite s;
    void *rings;
} RingsManager;

void Task_RingsMgrMain(void);
void TaskDestructor_8007F1C(struct Task *);

#define RM_PLAYER_LEFT   (Q_24_8_TO_INT(gPlayer.x) + sp00[0])
#define RM_PLAYER_RIGHT  (RM_PLAYER_LEFT + (sp00[2] - sp00[0]))
#define RM_PLAYER_TOP    (Q_24_8_TO_INT(gPlayer.y) + sp00[1])
#define RM_PLAYER_BOTTOM (RM_PLAYER_TOP + (sp00[3] - sp00[1]))

const u8 *const gSpritePosData_rings[NUM_LEVEL_IDS] = {
    zone1_act1_rings,
    zone1_act2_rings,
    zone1_boss_rings,
    zone1_act2_rings,
    zone2_act1_rings,
    zone2_act2_rings,
    zone2_boss_rings,
    zone2_act2_rings,
    zone3_act1_rings,
    zone3_act2_rings,
    zone3_boss_rings,
    zone3_act2_rings,
    zone4_act1_rings,
    zone4_act2_rings,
    zone4_boss_rings,
    zone4_act2_rings,
    zone5_act1_rings,
    zone5_act2_rings,
    zone5_boss_rings,
    zone5_act2_rings,
    zone6_act1_rings,
    zone6_act2_rings,
    zone6_boss_rings,
    zone6_act2_rings,
    zone7_act1_rings,
    zone7_act2_rings,
    zone7_boss_rings,
    zone7_act2_rings,
    zone8_act1_rings,
    zone8_act2_rings,
    zone8_boss_rings,
    NULL,
    NULL,
    NULL,
};

void CreateStageRingsManager(void)
{
    struct Task *t;
    RingsManager *mgr;
    void **mgrRings;
    Sprite *s;
    u32 *ewramBuffer;
    const u8 *compressedRingPosData;
    u32 dataSize;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        t = TaskCreate(Task_RingsMgrMain, sizeof(RingsManager), 0x2000, 0,
                       TaskDestructor_8007F1C);

        compressedRingPosData = gSpritePosData_rings[gCurrentLevel];
        dataSize = (*(u32 *)compressedRingPosData) >> 8;
        ewramBuffer = EwramMalloc(dataSize);

        RLUnCompWram(gSpritePosData_rings[gCurrentLevel], ewramBuffer);
    } else {
        t = TaskCreate(Task_RingsMgrMain, sizeof(RingsManager), 0x2000, 0, NULL);

        compressedRingPosData = (u8 *)(*MP_COLLECT_RINGS_COMPRESSED_SIZE);
        dataSize = (*(u32 *)compressedRingPosData) >> 8;
        dataSize = (dataSize + 3) >> 2; // Make it multiple of 4
        dataSize <<= 4;
        ewramBuffer = (u32 *)(MP_COLLECT_RINGS_BUFFER + dataSize);
        RLUnCompWram(MP_COLLECT_RINGS_COMPRESSED_POS_DATA[0], ewramBuffer);
    }

    mgrRings = TaskGetStructPtr(t) + offsetof(RingsManager, rings);
    *mgrRings = ewramBuffer;

    s = TaskGetStructPtr(t);

    s->x = 0;
    s->y = 0;

    s->graphics.dest = RESERVED_RING_TILES_VRAM;
    s->unk1A = SPRITE_OAM_ORDER(20);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_RING_STATIC;
    s->variant = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10
        = (SPRITE_FLAG_MASK_18 | SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_MOSAIC);
}

// TODO: Create GET_OFFSET macro!
//
// NONMATCH("asm/non_matching/game/stage/Task_RingsMgrMain.inc",
//          void Task_RingsMgrMain(void))
// (74.06%) https://decomp.me/scratch/pbchb
void Task_RingsMgrMain(void)
{
    // oam sub-frame ID?
    u8 sp1C = 0;
    s8 sp00[4];
    s8 sp04[4];
    s32 sp08;
    u16 regions_x; // sp0C;
    u16 regions_y; // sp10;

    s8 *pSp04 = &sp04[0];
    *pSp04++ = -gPlayer.unk16;
    *pSp04++ = -gPlayer.unk17;
    *pSp04++ = +gPlayer.unk16;
    *pSp04 = +gPlayer.unk17;
    memcpy(sp00, sp04, sizeof(sp00));

    if (!(gUnknown_03005424 & EXTRA_STATE__2)) {
        // _08007F60
        RingsManager *rm = TaskGetStructPtr(gCurTask);
        void *rings = rm->rings; // sp14
        s32 *rings_header;
        Sprite *s; // sp18
        SpriteOffset *dimensions; // sp20
        u16 sl; // sl / sp40
        u16 sb;

        if (IS_BOSS_STAGE(gCurrentLevel)) {
            if (gBossRingsShallRespawn && gBossRingsRespawnCount > 0) {
                RLUnCompWram(gSpritePosData_rings[gCurrentLevel], rings);
                gBossRingsShallRespawn = FALSE;
                gBossRingsRespawnCount--;
            }
        }
        // _08007FBE
        sp08 = FALSE;
        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            u32 res = sub_802C6E4() & 0x21C;
            sp08 = TRUE;

            if (res) {
                sp08 = FALSE;
            }

            // _08007FE4
            sub_802C668(&gPlayer.x, &gPlayer.y);
            sp00[0] = -10;
            sp00[1] = -10;
            sp00[2] = +10;
            sp00[3] = +10;
        }
        // _08007FFA

        rm = TaskGetStructPtr(gCurTask);
        rings = rm->rings;
        s = &rm->s;
        UpdateSpriteAnimation(s);

        dimensions = s->dimensions;

        rings_header = rings + 4;
        regions_x = *rings_header++;
        regions_y = *rings_header++;
        rings = rings_header;

        sl = (Q_24_8_TO_INT(gPlayer.y) + sp00[1]) >> 8;
        while (((sl <= (((sp00[3] + Q_24_8_TO_INT(gPlayer.y)) + 8)) >> 8))
               && (sl < regions_y)) {
            // _08008064
            s32 r0x;
            sb = ((Q_24_8_TO_INT(gPlayer.x) + sp00[0] - 8) >> 8);

            while ((sb <= ((Q_24_8_TO_INT(gPlayer.x) + sp00[2] + 16) >> 8))
                   && sb < regions_x) {
                // _080080A0
                s32 yPos = sl * regions_x;
                s32 xPos = sb * 4;
                s32 offset;
                yPos *= 4;
                offset = *(u32 *)(rings + (yPos + xPos));

                if (offset) {
                    MapEntity_Ring *meRing;
                    offset -= 8;

                    meRing = (MapEntity_Ring *)&((u8 *)rings)[offset];

                    while (meRing->x != (u8)MAP_ENTITY_STATE_ARRAY_END) {
                        if (meRing->x != (u8)MAP_ENTITY_STATE_INITIALIZED) {
                            // _080080D6
                            s32 rx = TO_WORLD_POS(meRing->x, sb);
                            s32 ry = TO_WORLD_POS(meRing->y, sl);

                            if ((sp08 != FALSE)
                                || (gCurrentLevel
                                        != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)
                                    && PLAYER_IS_ALIVE)) {
                                // _0800810A
                                s32 ringLeft = rx - 8;

                                // Player touches ring(?)
                                if (((ringLeft <= RM_PLAYER_LEFT)
                                     && ((rx + 8) >= RM_PLAYER_LEFT))
                                    || ((RM_PLAYER_RIGHT >= ringLeft))) {
                                    // _0800813A
                                    s32 ringTop = ry - 16;

                                    if (((ringTop <= RM_PLAYER_TOP)
                                         && (RM_PLAYER_TOP >= ringTop))
                                        || (ry >= RM_PLAYER_TOP)
                                        || (((ringTop >= RM_PLAYER_TOP)
                                             && (((ry + 16) <= RM_PLAYER_BOTTOM))))) {
                                        // _08008166
                                        u16 prevRingCount = gRingCount;
                                        gRingCount++;

                                        if (gCurrentLevel
                                            != LEVEL_INDEX(ZONE_FINAL,
                                                           ACT_TRUE_AREA_53)) {
                                            s32 lives = Div(gRingCount, 100);
                                            s32 prevLives = Div(prevRingCount, 100);

                                            if ((lives != prevLives)
                                                && (gGameMode
                                                    == GAME_MODE_SINGLE_PLAYER)) {
                                                if ((gNumLives + 1) > 255u)
                                                    gNumLives = 255;
                                                else
                                                    gNumLives++;

                                                gUnknown_030054A8.unk3 = 0x10;
                                            }
                                        }
                                        // _080081AC

                                        if (gGameMode
                                            == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                                            if (gRingCount > 0xFF)
                                                gRingCount = 0xFF;
                                        }
                                        // _080081C0
                                        CreateCollectRingEffect(rx, ry);
                                        meRing->x = (u8)MAP_ENTITY_STATE_INITIALIZED;
                                    }
                                }
                            }
                            // _080081D2
                        }
                        meRing++;
                    }
                }

                sb++;
            }

            sl++;
        }
        // _0800822C

        if (IS_MULTI_PLAYER) {
            // _08008236
            u8 i; // sp30
            for (i = 0; i < 4; i++) {
                u32 playerId = SIO_MULTI_CNT->id;

                if ((i == playerId) && (gMultiplayerPlayerTasks[i] != NULL)) {
                    // _08008258
                    struct MultiplayerPlayer *mpPlayer
                        = TaskGetStructPtr(gMultiplayerPlayerTasks[i]);
                    s16 px, py = mpPlayer->unk52;
                    s32 hbBottom, hbLeft, hbRight;
                    sl = Q_24_8(py + s->hitboxes[0].top);
                    hbBottom = Q_24_8(py + s->hitboxes[0].bottom);

                    while ((sl <= ((hbBottom + 8) >> 8)) && ((unsigned)sl < regions_y)) {
                        // _080082E2
                        // sp28 = mpPlayer->unk50;
                        // sp2C = mpPlayer->s.hitboxes[0].left;
                        // sp48 = mpPlayer->s.hitboxes[0].right;
                        px = mpPlayer->unk50;
                        sb = Q_24_8(px + mpPlayer->s.hitboxes[0].left - 8);

                        hbRight = Q_24_8((px + mpPlayer->s.hitboxes[0].right) + 16);
                        // hbLeft = Q_24_8((px + mpPlayer->s.hitboxes[0].left) + 16);

                        while (((sb << 8) < (gCamera.x + DISPLAY_WIDTH))
                               && (sb < regions_x)) {
                            // _080086E8
                            s32 yPos = sl * regions_x;
                            s32 xPos = sb * 4;
                            s32 offset;
                            yPos *= 4;
                            offset = *(u32 *)(rings + (yPos + xPos));

                            if (offset != 0) {
                                MapEntity_Ring *meRing;
                                offset -= 8;

                                meRing = (rings + (offset));
                                while (meRing->x != (u8)MAP_ENTITY_STATE_ARRAY_END) {
                                    if (meRing->x != (u8)MAP_ENTITY_STATE_INITIALIZED) {
                                        s32 rx = TO_WORLD_POS(meRing->x, sb);
                                        s32 ry = TO_WORLD_POS(meRing->y, sl);

                                        if ((((rx - 8)
                                              <= (mpPlayer->unk50
                                                  + mpPlayer->s.hitboxes[0].left))
                                             && ((rx + 8)
                                                 > mpPlayer->s.hitboxes[0].right))
                                            && (((ry - 8)
                                                 >= (mpPlayer->unk52
                                                     + mpPlayer->s.hitboxes[0].top))
                                                && ((rx + 8) <= mpPlayer->s.hitboxes[0]
                                                                    .bottom))) {
                                            u8 anim = rm->s.graphics.anim
                                                - gPlayerCharacterIdleAnims
                                                    [gMultiplayerCharacters
                                                         [mpPlayer->unk56]];
                                            if ((anim != SA2_CHAR_ANIM_28
                                                 && anim != SA2_CHAR_ANIM_29)
                                                || !(mpPlayer->unk54 & 0x4)) {
                                                CreateCollectRingEffect(rx, ry);
                                                meRing->x
                                                    = (u8)MAP_ENTITY_STATE_INITIALIZED;
                                            }
                                        }
                                    }
                                    meRing++;
                                }
                            }

                            sb++;
                        }
                        sl++;
                    }
                }
                // _08008472 = continue
            }
        }
        // _0800847E
        {
            sl = Q_24_8(gCamera.y) >> 16;

            if ((gPlayer.itemEffect & PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC)
                && (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)) {

                while (((sl << 8) < gCamera.y + DISPLAY_HEIGHT) && (sl < regions_y)) {
                    // _080086CC
                    sb = Q_24_8(gCamera.x) >> 16;

                    while (((sb << 8) < (gCamera.x + DISPLAY_WIDTH))
                           && (sb < regions_x)) {
                        // _080086E8
                        s32 yPos = sl * regions_x;
                        s32 xPos = sb * 4;
                        s32 offset;
                        yPos *= 4;
                        offset = *(u32 *)(rings + (yPos + xPos));

                        if (offset != 0) {
                            MapEntity_Ring *meRing;
                            offset -= 8;

                            meRing = (rings + (offset));
                            while (meRing->x != (u8)MAP_ENTITY_STATE_ARRAY_END) {
                                // _0800870C
                                if (meRing->x != (u8)MAP_ENTITY_STATE_INITIALIZED) {
                                    s32 rx = TO_WORLD_POS(meRing->x, sb);
                                    s32 ry = TO_WORLD_POS(meRing->y, sl);

                                    if (((u32)(rx - gCamera.x) + TILE_WIDTH)
                                            <= (DISPLAY_WIDTH + 2 * TILE_WIDTH)
                                        && (((ry - gCamera.y)) >= 0)
                                        && (((ry - gCamera.y) - 2 * TILE_WIDTH)
                                            > DISPLAY_HEIGHT)) {
                                        meRing++;
                                    } else if (((rx - 64) <= Q_24_8_TO_INT(gPlayer.x))
                                               && ((rx + 64) >= Q_24_8_TO_INT(gPlayer.x))
                                               && ((ry - 72) <= Q_24_8_TO_INT(gPlayer.y))
                                               && ((ry + 56
                                                    >= Q_24_8_TO_INT(gPlayer.y)))) {
                                        sub_800BAAC(rx, ry);
                                        meRing->x = (u8)MAP_ENTITY_STATE_INITIALIZED;
                                        meRing++;

                                    } else {
                                        meRing++;
                                        // _08008750
                                        if ((sp1C == 0) || s->oamBaseIndex == 0xFF) {
                                            // _08008764
                                            s->oamBaseIndex = 0xFF;

                                            s->x = rx - gCamera.x;
                                            s->y = ry - gCamera.y;
                                            DisplaySprite(s);
                                        } else {
                                            // _08008788
                                            OamData *oamDat
                                                = &gUnknown_030022D0[s->oamBaseIndex];
                                            OamData *oamAllocated
                                                = OamMalloc(GET_SPRITE_OAM_ORDER(s));

                                            if (iwram_end == oamAllocated)
                                                return;

                                            DmaCopy16(3, oamDat, oamAllocated,
                                                      sizeof(OamDataShort));

                                            // TODO: Can these be done more explicitly?
                                            oamAllocated->all.attr1 &= 0xFE00;
                                            oamAllocated->all.attr0 &= 0xFF00;
                                            oamAllocated->all.attr0
                                                += ((ry - gCamera.y)
                                                    - dimensions->offsetY)
                                                & 0xFF;
                                            oamAllocated->all.attr1
                                                += ((rx - gCamera.x)
                                                    - dimensions->offsetX)
                                                & 0x1FF;
                                        }
                                        sp1C++;
                                    }
                                }
                            }
                        }

                        sb++;
                    }
                    // _0800882C
                    sl++;
                }
            } else {
                // _080086B4

                sl = Q_24_8(gCamera.y) >> 16;
                while (((sl << 8) < gCamera.y + DISPLAY_HEIGHT) && (sl < regions_y)) {
                    // _080086CC
                    sb = Q_24_8(gCamera.x) >> 16;

                    while (((sb << 8) < (gCamera.x + DISPLAY_WIDTH))
                           && (sb < regions_x)) {
                        // _080086E8
                        s32 yPos = sl * regions_x;
                        s32 xPos = sb * 4;
                        s32 offset;
                        yPos *= 4;
                        offset = *(u32 *)(rings + (yPos + xPos));

                        if (offset != 0) {
                            MapEntity_Ring *meRing;
                            offset -= 8;

                            meRing = (rings + (offset));
                            while (meRing->x != (u8)MAP_ENTITY_STATE_ARRAY_END) {
                                // _0800870C
                                if (meRing->x == (u8)MAP_ENTITY_STATE_INITIALIZED) {
                                    meRing++;
                                } else {
                                    s32 rx = TO_WORLD_POS(meRing->x, sb);
                                    s32 ry = TO_WORLD_POS(meRing->y, sl);

                                    if ((unsigned)((rx - gCamera.x) + TILE_WIDTH)
                                            <= (DISPLAY_WIDTH + 2 * TILE_WIDTH)
                                        && (((ry - gCamera.y)) >= 0)
                                        && (((ry - gCamera.y) - 2 * TILE_WIDTH)
                                            > DISPLAY_HEIGHT)) {
                                        meRing++;
                                    } else {
                                        meRing++;
                                        // _08008750
                                        if ((sp1C == 0) || s->oamBaseIndex == 0xFF) {
                                            // _08008764
                                            s->oamBaseIndex = 0xFF;

                                            s->x = rx - gCamera.x;
                                            s->y = ry - gCamera.y;
                                            DisplaySprite(s);
                                        } else {
                                            // _08008788
                                            OamData *oamDat
                                                = &gUnknown_030022D0[s->oamBaseIndex];
                                            OamData *oamAllocated
                                                = OamMalloc(GET_SPRITE_OAM_ORDER(s));

                                            if (iwram_end == oamAllocated)
                                                return;

                                            DmaCopy16(3, oamDat, oamAllocated,
                                                      sizeof(OamDataShort));

                                            // TODO: Can these be done more explicitly?
                                            oamAllocated->all.attr1 &= 0xFE00;
                                            oamAllocated->all.attr0 &= 0xFF00;
                                            oamAllocated->all.attr0
                                                += ((ry - gCamera.y)
                                                    - dimensions->offsetY)
                                                & 0xFF;
                                            oamAllocated->all.attr1
                                                += ((rx - gCamera.x)
                                                    - dimensions->offsetX)
                                                & 0x1FF;
                                        }
                                        sp1C++;
                                    }

                                    continue;
                                }
                            }
                        }

                        sb++;
                    }
                    // _0800882C
                    sl++;
                }
            }
        }
    }
}
// END_NONMATCH

void TaskDestructor_8007F1C(struct Task *t)
{
    void *rings = *(void **)(TaskGetStructPtr(t) + offsetof(RingsManager, rings));
    EwramFree(rings);
}