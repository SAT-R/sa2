#include "core.h"
#include "task.h"

#include "malloc_ewram.h"
#include "game/entity.h"

#include "game/game.h"
#include "game/stage_entities_manager.h"

typedef struct Task *(*StagePreInitFunc)(void);
typedef void (*MapEntityInit)(MapEntity *, u16, u16, u8);

extern void CreateItemBox(MapEntity *, u16, u16, u8);

typedef struct {
    u32 unk0;
    u32 unk4; // h_regionCount
    u32 unk8; // v_regionCount
    u32 unkC[0]; // unknown size, offsets
} MapData; /* Unknown size */

extern const RLCompressed *gSpritePosData_interactables[];
extern const RLCompressed *gSpritePosData_itemboxes[];
extern const RLCompressed *gSpritePosData_enemies[];

extern const StagePreInitFunc gSpriteTileInits_PreStageEntry[];

extern const MapEntityInit gSpriteInits_Interactables[];
extern const MapEntityInit gSpriteInits_Enemies[];
extern const MapEntityInit gUnknown_080D502C[];

typedef struct {
    MapData *unk0; // interactables
    MapData *unk4; // itemBoxes
    MapData *unk8; // enemies
    s32 unkC; // camX
    s32 unk10; // camY
    u8 unk14;
    struct Task *unk18; // preInitTask
} EntitesManager;

void sub_8008DCC(void);

void sub_80095FC(struct Task *);

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

// https://decomp.me/scratch/Co5bs
// logic is correct. Compiling differently for some reason
NONMATCH("asm/non_matching/sub_80089CC.inc", void sub_80089CC())
{
    u32 r0 = (gUnknown_03005424 & 2);
    register u32 r3 asm("r3") = r0;
    if (!r3) {
        u32 pos;

        u32 regionX, regionY;
        u32 r6;

        u32 minCamX, minCamY;
        u32 maxCamX, maxCamY;
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

        minCamX = gCamera.x - 0x80;
        maxCamX = gCamera.x + 0x170;

        minCamY = gCamera.y - 0x80;
        maxCamY = gCamera.y + 0x120;
        asm("" ::: "sl");
        asm("" ::: "r9");
        asm("" ::: "r8");

        if (gCamera.x - 0x80 < 0) {
            minCamX = r3;
        }
        if (gCamera.y - 0x80 < 0) {
            minCamY = r3;
        }
        if (gCamera.x + 0x170 < 0) {
            maxCamX = r3;
        }
        if (gCamera.y + 0x120 < 0) {
            maxCamY = r3;
        }

        if ((u32)minCamX >= Q_24_8(h_regionCount)) {
            minCamX = Q_24_8(h_regionCount) - 1;
        }
        if ((u32)minCamY >= Q_24_8(v_regionCount)) {
            minCamY = Q_24_8(v_regionCount) - 1;
        }

        if ((u32)maxCamX >= Q_24_8(h_regionCount)) {
            maxCamX = Q_24_8(h_regionCount) - 1;
        }

        if ((u32)maxCamY >= Q_24_8(v_regionCount)) {
            maxCamY = Q_24_8(v_regionCount) - 1;
        }

        regionY = Q_24_8_TO_INT((s32)minCamY);

        while (Q_24_8(regionY) < maxCamY && regionY < v_regionCount) {
            regionX = Q_24_8_TO_INT((s32)minCamX);
            while (Q_24_8(regionX) < maxCamX && regionX < h_regionCount) {
                u32 posY;
                u32 i;
                u32 *sp28;
                u32 sp2C;
                u32 sp2C2;

                register u32 r0 asm("r0") = ({ h_regionCount *regionY; });
                sp28 = &interactables[r0];

                if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    r6 = sp28[regionX];
                    sp2C = ({ h_regionCount *regionY; });
                    if (r6 != 0) {
                        MapEntity *me;
                        u32 offset = r6 - 8;
                        me = (MapEntity *)((void *)interactables + offset);
                        for (i = 0; (s8)me->x != -1;) {
                            if ((s8)me->x >= -2) {
                                s32 x = TO_WORLD_POS(me->x, regionX);
                                s32 y = TO_WORLD_POS(me->y, regionY);
                                if (x >= (s32)minCamX && x <= (s32)maxCamX
                                    && y >= (s32)minCamY && y <= (s32)maxCamY) {
                                    gSpriteInits_Interactables[me->index](me, regionX,
                                                                          regionY, i);
                                }
                            }
                            (void *)me += 7, i++;

                            {
                                register u8 r1 asm("r1") = me->x;
                                register s32 r0 asm("r0") = (s8)me->x;
                                register s32 r2 asm("r2") = maxCamX;
                                asm("" ::"r"(r1));
                                asm("" ::"r"(r0));
                                asm("" ::"r"(r2));
                            }
                            {
                                register s32 r3 asm("r3") = maxCamY;
                                asm("" ::"r"(r3));
                            }
                        }
                    }

                    // {
                    //     u32 r0 = sp2C * 4;
                    //     r0 += (u32)itemBoxPositions;
                    //     r0 = posY + r0;
                    //     r6 = *(u32*)r0;
                    // }
                    sp28 = &itemBoxPositions[sp2C];
                    if (sp28[regionX] != 0) {
                        MapEntity *me;
                        u32 offset = sp28[regionX] - 8;
                        me = (MapEntity *)((void *)itemBoxPositions + offset);
                        for (i = 0; (s8)me->x != -1;) {
                            if ((s8)me->x >= -2) {
                                s32 x = TO_WORLD_POS(me->x, regionX);
                                s32 y = TO_WORLD_POS(me->y, regionY);
                                if (x >= (s32)minCamX && x <= (s32)maxCamX
                                    && y >= (s32)minCamY && y <= (s32)maxCamY) {
                                    CreateItemBox(me, regionX, regionY, i);
                                }
                            }
                            (void *)me += 3, i++;

                            {
                                register u8 r1 asm("r1") = me->x;
                                register s32 r0 asm("r0") = (s8)me->x;
                                register s32 r2 asm("r2") = maxCamX;
                                asm("" ::"r"(r1));
                                asm("" ::"r"(r0));
                                asm("" ::"r"(r2));
                            }
                            {
                                register s32 r3 asm("r3") = maxCamY;
                                asm("" ::"r"(r3));
                            }
                        }
                    }

                    sp28 = (void *)enemyPositions;
                    sp28 += ({ h_regionCount *regionY; });
                    if (sp28[regionX] != 0) {
                        u32 offset = sp28[regionX] - 8;
                        MapEntity *me = (MapEntity *)((void *)enemyPositions + offset);
                        for (i = 0; (s8)me->x != -1;) {

                            if ((s8)me->x >= -2) {
                                s32 x = TO_WORLD_POS(me->x, regionX);
                                s32 y = TO_WORLD_POS(me->y, regionY);
                                if (x >= (s32)minCamX && x <= (s32)maxCamX
                                    && y >= (s32)minCamY && y <= (s32)maxCamY) {
                                    gSpriteInits_Enemies[me->index](me, regionX, regionY,
                                                                    i);
                                }
                            }
                            (void *)me += 7;
                            i++;

                            {
                                register u8 r1 asm("r1") = me->x;
                                register s32 r0 asm("r0") = (s8)me->x;
                                register s32 r2 asm("r2") = maxCamX;
                                asm("" ::"r"(r1));
                                asm("" ::"r"(r0));
                                asm("" ::"r"(r2));
                            }
                            {
                                register s32 r3 asm("r3") = maxCamY;
                                asm("" ::"r"(r3));
                            }
                        }
                    }

                } else {
                    if (sp28[regionX] != 0) {
                        MapEntity *me;
                        u32 offset = sp28[regionX] - 8;
                        me = (MapEntity *)((void *)interactables + offset);
                        for (i = 0; (s8)me->x != -1;) {
                            if ((s8)me->x >= -2) {
                                s32 x = TO_WORLD_POS(me->x, regionX);
                                s32 y = TO_WORLD_POS(me->y, regionY);
                                if (x >= (s32)minCamX && x <= (s32)maxCamX
                                    && y >= (s32)minCamY && y <= (s32)maxCamY) {
                                    gUnknown_080D502C[me->index](me, regionX, regionY,
                                                                 i);
                                }
                            }
                            (void *)me += 7, i++;
                            {
                                register u8 r1 asm("r1") = me->x;
                                register s32 r0 asm("r0") = (s8)me->x;
                                register s32 r2 asm("r2") = maxCamX;
                                asm("" ::"r"(r1));
                                asm("" ::"r"(r0));
                                asm("" ::"r"(r2));
                            }
                            {
                                register s32 r3 asm("r3") = maxCamY;
                                asm("" ::"r"(r3));
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
