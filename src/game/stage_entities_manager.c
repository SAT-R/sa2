#include "core.h"
#include "task.h"

#include "malloc_ewram.h"
#include "malloc_vram.h"

#include "lib/m4a.h"

#include "game/game.h"
#include "game/entity.h"
#include "game/stage_item_box.h"
#include "game/stage_entities_manager.h"

#include "game/assets/compressed/entities.h"

#include "constants/zones.h"
#include "constants/songs.h"

// Unknown task
extern void sub_8009E00(s16, s16);

typedef struct Task *(*StagePreInitFunc)(void);
typedef void (*MapEntityInit)(MapEntity *, u16, u16, u8);

typedef struct {
    u32 unk0;
    u32 unk4; // h_regionCount
    u32 unk8; // v_regionCount
    u32 unkC[0]; // unknown size, offsets
} MapData; /* Unknown size */

typedef struct {
    MapData *unk0; // interactables
    MapData *unk4; // itemBoxes
    MapData *unk8; // enemies
    s32 unkC; // camX
    s32 unk10; // camY
    u8 unk14;
    struct Task *unk18; // preInitTask
} EntitesManager;

struct Range {
    s32 xLow, yLow;
    s32 xHigh, yHigh;
};

void sub_8008DCC(void);

void sub_80095FC(struct Task *);

const RLCompressed *const gSpritePosData_interactables[NUM_LEVEL_IDS] = {
    (void *)&zone1_act1_interactables,
    (void *)&zone1_act2_interactables,
    (void *)&zone1_boss_interactables,
    (void *)&zone1_act2_interactables,
    (void *)&zone2_act1_interactables,
    (void *)&zone2_act2_interactables,
    (void *)&zone2_boss_interactables,
    (void *)&zone2_act2_interactables,
    (void *)&zone3_act1_interactables,
    (void *)&zone3_act2_interactables,
    (void *)&zone3_boss_interactables,
    (void *)&zone3_act2_interactables,
    (void *)&zone4_act1_interactables,
    (void *)&zone4_act2_interactables,
    (void *)&zone4_boss_interactables,
    (void *)&zone4_act2_interactables,
    (void *)&zone5_act1_interactables,
    (void *)&zone5_act2_interactables,
    (void *)&zone5_boss_interactables,
    (void *)&zone5_act2_interactables,
    (void *)&zone6_act1_interactables,
    (void *)&zone6_act2_interactables,
    (void *)&zone6_boss_interactables,
    (void *)&zone6_act2_interactables,
    (void *)&zone7_act1_interactables,
    (void *)&zone7_act2_interactables,
    (void *)&zone7_boss_interactables,
    (void *)&zone7_act2_interactables,
    (void *)&zone8_act1_interactables,
    (void *)&zone8_act2_interactables,
    (void *)&zone8_boss_interactables,
    NULL,
    NULL,
    NULL,
};

extern const RLCompressed *gSpritePosData_itemboxes[];
extern const RLCompressed *gSpritePosData_enemies[];

extern const MapEntityInit gSpriteInits_Interactables[];
extern const MapEntityInit gSpriteInits_Enemies[];

extern const u16 gUnknown_080D5020[];
extern const MapEntityInit gUnknown_080D502C[];

extern const StagePreInitFunc gSpriteTileInits_PreStageEntry[];

void CreateStageEntitiesManager(void)
{
    void *decompBuf;
    struct Task *t;
    EntitesManager *em;
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        t = TaskCreate(sub_8008DCC, sizeof(EntitesManager), 0x2000, 0, sub_80095FC);
    } else {
        t = TaskCreate(sub_8008DCC, sizeof(EntitesManager), 0x2000, 0, NULL);
    }

    em = TaskGetStructPtr(t);

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        decompBuf = EwramMalloc(gSpritePosData_interactables[gCurrentLevel]->size);
        RLUnCompWram(gSpritePosData_interactables[gCurrentLevel], decompBuf);
        em->unk0 = decompBuf;

        decompBuf = EwramMalloc(gSpritePosData_itemboxes[gCurrentLevel]->size);
        RLUnCompWram(gSpritePosData_itemboxes[gCurrentLevel], decompBuf);
        em->unk4 = decompBuf;

        decompBuf = EwramMalloc(gSpritePosData_enemies[gCurrentLevel]->size);
        RLUnCompWram(gSpritePosData_enemies[gCurrentLevel], decompBuf);
        em->unk8 = decompBuf;

        em->unk18 = NULL;

        if (gSpriteTileInits_PreStageEntry[gCurrentLevel]) {
            em->unk18 = gSpriteTileInits_PreStageEntry[gCurrentLevel]();
        }
    } else {
        decompBuf = (void *)EWRAM_START + 0x3F000;
        RLUnCompWram(*(void **)((void *)EWRAM_START + 0x3300C), decompBuf);
        em->unk0 = decompBuf;
    }

    em->unkC = gCamera.x;
    em->unk10 = gCamera.y;
    em->unk14 = 1;
    gEntitesManagerTask = t;
}

static inline MapEntity *ReadMe(void *data, u32 r6)
{
    register u32 offset asm("r0") = r6 - 8;
    return data + offset;
}

// https://decomp.me/scratch/Co5bs
// logic is correct. Compiling differently for some reason
NONMATCH("asm/non_matching/sub_80089CC.inc", void sub_80089CC())
{
    if (!(gUnknown_03005424 & 2)) {
        u32 pos;

        u32 regionY, regionX;

        struct Range range;
        u32 h_regionCount, v_regionCount;

        EntitesManager *em = TaskGetStructPtr(gCurTask);
        u32 *interactables;
        u32 *itemBoxPositions;
        u32 *enemyPositions;

        interactables = (u32 *)em->unk0;
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            enemyPositions = em->unk8->unkC;
            itemBoxPositions = em->unk4->unkC;
        }

        interactables++;
        h_regionCount = (u16)*interactables++;
        v_regionCount = (u16)*interactables++;

        range.xLow = gCamera.x - 0x80;
        range.xHigh = gCamera.x + 0x170;

        range.yLow = gCamera.y - 0x80;
        range.yHigh = gCamera.y + 0x120;

        if (range.xLow < 0) {
            range.xLow = 0;
        }
        if (range.yLow < 0) {
            range.yLow = 0;
        }
        if (range.xHigh < 0) {
            range.xHigh = 0;
        }
        if (range.yHigh < 0) {
            range.yHigh = 0;
        }

        if ((u32)range.xLow >= Q_24_8(h_regionCount)) {
            range.xLow = Q_24_8(h_regionCount) - 1;
        }
        if ((u32)range.yLow >= Q_24_8(v_regionCount)) {
            range.yLow = Q_24_8(v_regionCount) - 1;
        }

        if ((u32)range.xHigh >= Q_24_8(h_regionCount)) {
            range.xHigh = Q_24_8(h_regionCount) - 1;
        }

        if ((u32)range.yHigh >= Q_24_8(v_regionCount)) {
            range.yHigh = Q_24_8(v_regionCount) - 1;
        }

        regionY = Q_24_8_TO_INT(range.yLow);
        while (Q_24_8(regionY) < (u32)range.yHigh && regionY < v_regionCount) {

            regionX = Q_24_8_TO_INT(range.xLow);
            while (Q_24_8(regionX) < (u32)range.xHigh && regionX < h_regionCount) {
                u32 posY;
                u32 i;
                register u32 r6 asm("r6");
                MapEntity *me;
                u32 sp28;

                sp28 = ({
                    u32 r0 = h_regionCount * regionY;
                    r0 *= 4;
                    r0 += (u32)interactables;
                    r0;
                });
                if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    r6 = *(u32 *)(sp28 + (regionX * 4));
                    if (r6 != 0) {
                        me = ReadMe(interactables, r6);
                        for (i = 0; (s8)me->x != -1; me++, i++) {
                            if ((s8)me->x >= -2) {
                                s32 x = TO_WORLD_POS(me->x, regionX);
                                s32 y = TO_WORLD_POS(me->y, regionY);
                                if (x >= range.xLow && x <= range.xHigh
                                    && y >= range.yLow && y <= range.yHigh) {
                                    gSpriteInits_Interactables[me->index](me, regionX,
                                                                          regionY, i);
                                }
                            }
                        }
                    }

                    r6 = *(u32 *)({
                        u32 r0 = h_regionCount * regionY;
                        r0 *= 4;
                        r0 += (u32)itemBoxPositions;
                        r0 += (regionX * 4);
                        r0;
                    });

                    if (r6 != 0) {
                        MapEntitySmall *me
                            = (MapEntitySmall *)ReadMe(itemBoxPositions, r6);
                        for (i = 0; (s8)me->x != -1; me++, i++) {
                            if ((s8)me->x >= -2) {
                                s32 x = TO_WORLD_POS(me->x, regionX);
                                s32 y = TO_WORLD_POS(me->y, regionY);
                                if (x >= range.xLow && x <= range.xHigh
                                    && y >= range.yLow && y <= range.yHigh) {
                                    CreateItemBox((void *)me, regionX, regionY, i);
                                }
                            }
                        }
                    }

                    sp28 = ({
                        u32 r0 = h_regionCount * regionY;
                        r0 *= 4;
                        r0 += (u32)enemyPositions;
                        r0 += (regionX * 4);
                        r0;
                    });
                    r6 = *(u32 *)sp28;
                    if (r6 != 0) {
                        me = ReadMe(enemyPositions, r6);
                        for (i = 0; (s8)me->x != -1; me++, i++) {

                            if ((s8)me->x >= -2) {
                                s32 x = TO_WORLD_POS(me->x, regionX);
                                s32 y = TO_WORLD_POS(me->y, regionY);
                                if (x >= range.xLow && x <= range.xHigh
                                    && y >= range.yLow && y <= range.yHigh) {
                                    gSpriteInits_Enemies[me->index](me, regionX, regionY,
                                                                    i);
                                }
                            }
                        }
                    }

                } else {
                    r6 = *(u32 *)(sp28 + (regionX * 4));
                    if (r6 != 0) {
                        me = ReadMe(interactables, r6);
                        for (i = 0; (s8)me->x != -1; me++, i++) {
                            if ((s8)me->x >= -2) {
                                s32 x = TO_WORLD_POS(me->x, regionX);
                                s32 y = TO_WORLD_POS(me->y, regionY);
                                if (x >= range.xLow && x <= range.xHigh
                                    && y >= range.yLow && y <= range.yHigh) {
                                    gUnknown_080D502C[me->index](me, regionX, regionY,
                                                                 i);
                                }
                            }
                        }
                    }
                }
                regionX++;
            }
            regionY++;
        }
        em->unkC = gCamera.x;
        em->unk10 = gCamera.y;
        em->unk14 = 0;
        gCurTask->main = sub_8008DCC;
    }
}
END_NONMATCH

// https://decomp.me/scratch/pOpmU
NONMATCH("asm/non_matching/sub_8008DCC.inc", void sub_8008DCC())
{
    if (!(gUnknown_03005424 & 2)) {
        u32 pos;

        u16 regionX, regionY;
        u32 temp, temp2, temp3, temp4;
        s32 temp5;
        MapEntity *me;
        u32 i;
        register u32 r6 asm("r6");
        u32 sp28;

        struct Range range1;
        struct Range range2;

        u32 h_regionCount, v_regionCount;

        EntitesManager *em = TaskGetStructPtr(gCurTask);

        if (em->unk14 != 0) {
            sub_80089CC();
            return;
        }
        if ((gCamera.x - em->unkC >= 0 ? gCamera.x - em->unkC : em->unkC - gCamera.x)
            > 248) {
            sub_80089CC();
            return;
        }
        if ((gCamera.y - em->unk10 >= 0 ? gCamera.y - em->unk10 : em->unk10 - gCamera.y)
            > 208) {
            sub_80089CC();
            return;
        }
        {
            u32 *interactables;
            u32 *itemBoxPositions;
            u32 *enemyPositions;

            interactables = (u32 *)em->unk0;
            if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                enemyPositions = em->unk8->unkC;
                itemBoxPositions = em->unk4->unkC;
            }

            interactables++;
            h_regionCount = (u16)*interactables++;
            v_regionCount = (u16)*interactables++;

            if (gCamera.x > em->unkC) {
                range1.xLow = em->unkC + 0x170;
                range1.xHigh = gCamera.x + 0x170;
            } else {
                range1.xLow = gCamera.x - 0x80;
                range1.xHigh = em->unkC - 0x80;
            }

            if (em->unk14 != 0) {
                sub_80089CC();
                return;
            }

            range1.yLow = gCamera.y - 0x80;
            range1.yHigh = gCamera.y + 0x120;

            if (gCamera.y > em->unk10) {
                range2.yLow = em->unk10 + 0x120;
                range2.yHigh = gCamera.y + 0x120;
            } else {
                range2.yLow = gCamera.y - 0x80;
                range2.yHigh = em->unk10 - 0x80;
            }

            range2.xLow = gCamera.x - 0x80;
            range2.xHigh = gCamera.x + 0x170;

            if ((s32)range1.xLow < 0) {
                range1.xLow = 0;
            }
            if ((s32)range1.yLow < 0) {
                range1.yLow = 0;
            }
            if ((s32)range1.xHigh < 0) {
                range1.xHigh = 0;
            }

            if ((s32)range1.yHigh < 0) {
                range1.yHigh = 0;
            }

            temp2 = range1.xLow;
            temp = Q_24_8(h_regionCount);
            if (temp2 >= temp) {
                range1.xLow = temp - 1;
            }

            temp3 = range1.yLow;
            temp4 = Q_24_8(v_regionCount);

            if (temp3 >= temp4) {
                range1.yLow = temp4 - 1;
            }

            if ((u32)range1.xHigh >= temp) {
                range1.xHigh = temp - 1;
            }

            if (range1.yHigh >= temp4) {
                range1.yHigh = temp4 - 1;
            }

            if (range2.xLow < 0) {
                range2.xLow = 0;
            }

            if (range2.yLow < 0) {
                range2.yLow = 0;
            }

            if ((s32)range2.xHigh < 0) {
                range2.xHigh = 0;
            }

            if ((s32)range2.yHigh < 0) {
                range2.yHigh = 0;
            }

            if ((u32)range2.xLow >= temp) {
                range2.xLow = temp - 1;
            }

            if ((u32)range2.yLow >= temp4) {
                range2.yLow = temp4 - 1;
            }

            if ((u32)range2.xHigh >= temp) {
                range2.xHigh = temp - 1;
            }

            if ((u32)range2.yHigh >= temp4) {
                range2.yHigh = temp4 - 1;
            }

            if (gCamera.x != em->unkC && range1.xLow != range1.xHigh
                && range1.yLow != range1.yHigh) {
                regionY = Q_24_8_TO_INT(range1.yLow);

                while (Q_24_8(regionY) < range1.yHigh && regionY < v_regionCount) {
                    regionX = Q_24_8_TO_INT((s32)range1.xLow);
                    while (Q_24_8(regionX) < range1.xHigh && regionX < h_regionCount) {

                        sp28 = ({
                            u32 r0 = h_regionCount * regionY;
                            r0 *= 4;
                            r0 += (u32)interactables;
                            r0;
                        });

                        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                            r6 = *(u32 *)(sp28 + (regionX * 4));
                            if (r6 != 0) {
                                me = ReadMe(interactables, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range1.xLow
                                            && x <= (s32)range1.xHigh
                                            && y >= (s32)range1.yLow
                                            && y <= (s32)range1.yHigh) {
                                            gSpriteInits_Interactables[me->index](
                                                me, regionX, regionY, i);
                                        }
                                    }
                                }
                            }

                            r6 = *(u32 *)({
                                u32 r0 = h_regionCount * regionY;
                                r0 *= 4;
                                r0 += (u32)itemBoxPositions;
                                r0 += (regionX * 4);
                                r0;
                            });

                            if (r6 != 0) {
                                MapEntitySmall *me
                                    = (MapEntitySmall *)ReadMe(itemBoxPositions, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range1.xLow
                                            && x <= (s32)range1.xHigh
                                            && y >= (s32)range1.yLow
                                            && y <= (s32)range1.yHigh) {
                                            CreateItemBox((MapEntity *)me, regionX,
                                                          regionY, i);
                                        }
                                    }
                                }
                            }

                            sp28 = ({
                                u32 r0 = h_regionCount * regionY;
                                r0 *= 4;
                                r0 += (u32)enemyPositions;
                                r0 += (regionX * 4);
                                r0;
                            });
                            r6 = *(u32 *)sp28;
                            if (r6 != 0) {
                                me = ReadMe(enemyPositions, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range1.xLow
                                            && x <= (s32)range1.xHigh
                                            && y >= (s32)range1.yLow
                                            && y <= (s32)range1.yHigh) {
                                            gSpriteInits_Enemies[me->index](me, regionX,
                                                                            regionY, i);
                                        }
                                    }
                                }
                            }

                        } else {
                            r6 = *(u32 *)(sp28 + (regionX * 4));
                            if (r6 != 0) {
                                me = ReadMe(interactables, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range1.xLow
                                            && x <= (s32)range1.xHigh
                                            && y >= (s32)range1.yLow
                                            && y <= (s32)range1.yHigh) {
                                            gUnknown_080D502C[me->index](me, regionX,
                                                                         regionY, i);
                                        }
                                    }
                                }
                            }
                        }
                        regionX++;
                    }
                    regionY++;
                }
            }
            if (((gCamera.y != em->unk10) && (range2.yLow != range2.yHigh))
                && (range2.xLow != range2.xHigh)) {
                regionY = Q_24_8_TO_INT((s32)range2.yLow);

                while (Q_24_8(regionY) < range2.yHigh && regionY < v_regionCount) {
                    regionX = Q_24_8_TO_INT((s32)range2.xLow);
                    while (Q_24_8(regionX) < range2.xHigh && regionX < h_regionCount) {

                        sp28 = ({
                            u32 r0 = h_regionCount * regionY;
                            r0 *= 4;
                            r0 += (u32)interactables;
                            r0;
                        });

                        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                            r6 = *(u32 *)(sp28 + (regionX * 4));
                            if (r6 != 0) {
                                me = ReadMe(interactables, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range2.xLow
                                            && x <= (s32)range2.xHigh
                                            && y >= (s32)range2.yLow
                                            && y <= (s32)range2.yHigh) {
                                            gSpriteInits_Interactables[me->index](
                                                me, regionX, regionY, i);
                                        }
                                    }
                                }
                            }

                            r6 = *(u32 *)({
                                u32 r0 = h_regionCount * regionY;
                                r0 *= 4;
                                r0 += (u32)itemBoxPositions;
                                r0 += (regionX * 4);
                                r0;
                            });

                            if (r6 != 0) {
                                MapEntitySmall *me
                                    = (MapEntitySmall *)ReadMe(itemBoxPositions, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range2.xLow
                                            && x <= (s32)range2.xHigh
                                            && y >= (s32)range2.yLow
                                            && y <= (s32)range2.yHigh) {
                                            CreateItemBox((MapEntity *)me, regionX,
                                                          regionY, i);
                                        }
                                    }
                                }
                            }

                            sp28 = ({
                                u32 r0 = h_regionCount * regionY;
                                r0 *= 4;
                                r0 += (u32)enemyPositions;
                                r0 += (regionX * 4);
                                r0;
                            });
                            r6 = *(u32 *)sp28;
                            if (r6 != 0) {
                                me = ReadMe(enemyPositions, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range2.xLow
                                            && x <= (s32)range2.xHigh
                                            && y >= (s32)range2.yLow
                                            && y <= (s32)range2.yHigh) {
                                            gSpriteInits_Enemies[me->index](me, regionX,
                                                                            regionY, i);
                                        }
                                    }
                                }
                            }

                        } else {
                            r6 = *(u32 *)(sp28 + (regionX * 4));
                            if (r6 != 0) {
                                me = ReadMe(interactables, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range2.xLow
                                            && x <= (s32)range2.xHigh
                                            && y >= (s32)range2.yLow
                                            && y <= (s32)range2.yHigh) {
                                            gUnknown_080D502C[me->index](me, regionX,
                                                                         regionY, i);
                                        }
                                    }
                                }
                            }
                        }
                        regionX++;
                    }
                    regionY++;
                }
            }
            em->unkC = gCamera.x;
            em->unk10 = gCamera.y;
        }
    }
}
END_NONMATCH

void sub_8009530(s16 a, s16 b)
{
    u32 old;
    u32 temp1;
    u32 temp2;
    m4aSongNumStart(SE_ITEM_BOX);
    old = gUnknown_03005450;
    gUnknown_03005450 += gUnknown_080D5020[gPlayer.unk84];
    temp1 = Div(gUnknown_03005450, 50000);
    temp2 = Div(old, 50000);
    if (temp1 != temp2 && gGameMode == GAME_MODE_SINGLE_PLAYER) {
        u16 numLives = (temp1 - temp2);
        numLives += gNumLives;
        if (numLives > 255) {
            gNumLives = 255;
        } else {
            gNumLives = numLives;
        }
        gUnknown_030054A8[3] = 0x10;
    }

    sub_8009E00(a, b);

    if (gPlayer.unk84 < 4) {
        gPlayer.unk84++;
    }
}

void TaskDestructor_80095E8(struct Task *t)
{
    Sprite_Entity *s = TaskGetStructPtr(t);
    VramFree(s->displayed.graphics.dest);
}

void sub_80095FC(struct Task *t)
{
    EntitesManager *em = TaskGetStructPtr(t);
    EwramFree(em->unk0);
    EwramFree(em->unk4);
    EwramFree(em->unk8);
    gEntitesManagerTask = NULL;
}
