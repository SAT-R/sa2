#include "core.h"
#include "task.h"

#include "malloc_ewram.h"
#include "malloc_vram.h"

#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/camera.h"
#include "game/entity.h"
#include "game/sa1_sa2_shared/item_box.h"
#include "game/sa1_sa2_shared/entities_manager.h"

#include "game/sa1_sa2_shared/interactables/platform_thin.h"
#include "game/sa1_sa2_shared/interactables/044.h"
#include "game/sa1_sa2_shared/interactables/grind_rail.h"
#include "game/sa1_sa2_shared/interactables/platform_square.h"
#include "game/sa1_sa2_shared/interactables/platform.h"
#include "game/sa1_sa2_shared/interactables/ramp.h"
#include "game/sa1_sa2_shared/interactables/slidy_ice.h"
#include "game/sa1_sa2_shared/interactables/spring.h"
#include "game/sa1_sa2_shared/interactables/pipe.h"

#include "game/interactables_1/windmill.h"
#include "game/interactables_1/checkpoint.h"
#include "game/interactables_1/gapped_loop.h"
#include "game/interactables_1/stage_goal.h"
#include "game/interactables_1/corkscrew.h"
#include "game/interactables_1/corkscrew_3d.h"
#include "game/interactables_1/incline_ramp.h"
#include "game/interactables_1/toggle_player_layer.h"
#include "game/interactables_1/bouncy_bar.h"
#include "game/interactables_1/spring_bouncy.h"
#include "game/interactables_1/rotating_handle.h"
#include "game/interactables_1/platform_crumbling.h"
#include "game/interactables_1/spikes.h"
#include "game/interactables_1/booster.h"
#include "game/interactables_1/decoration.h"

#include "game/interactables_2/hot_crater/crane.h"
#include "game/interactables_2/hot_crater/dash_ring.h"
#include "game/interactables_2/hot_crater/windup_stick.h"
#include "game/interactables_2/hot_crater/floating_spring.h"
#include "game/interactables_2/hot_crater/turnaround_bar.h"
#include "game/interactables_2/hot_crater/hook_rail.h"

#include "game/interactables_2/music_plant/note_sphere.h"
#include "game/interactables_2/music_plant/pipe_horn.h"
#include "game/interactables_2/music_plant/keyboard.h"
#include "game/interactables_2/music_plant/note_block.h"
#include "game/interactables_2/music_plant/guitar_string.h"
#include "game/interactables_2/music_plant/german_flute.h"

#include "game/interactables_2/ice_paradise/big_snowball.h"
#include "game/interactables_2/ice_paradise/funnel_sphere.h"
#include "game/interactables_2/ice_paradise/half_pipe.h"
#include "game/interactables_2/ice_paradise/slowing_snow.h"

#include "game/interactables_2/sky_canyon/propeller.h"
#include "game/interactables_2/sky_canyon/fan.h"
#include "game/interactables_2/sky_canyon/small_windmill.h"
#include "game/interactables_2/sky_canyon/whirlwind.h"
#include "game/interactables_2/sky_canyon/propeller_spring.h"

#include "game/interactables_2/techno_base/light_globe.h"
#include "game/interactables_2/techno_base/light_bridge.h"
#include "game/interactables_2/techno_base/arrow_platform.h"
#include "game/interactables_2/techno_base/spike_platform.h"
#include "game/interactables_2/techno_base/bounce_block.h"

#include "game/interactables_2/egg_utopia/pole.h"
#include "game/interactables_2/egg_utopia/flying_handle.h"
#include "game/interactables_2/egg_utopia/gravity_toggle.h"
#include "game/interactables_2/egg_utopia/cannon.h"
#include "game/interactables_2/egg_utopia/iron_ball.h"
#include "game/interactables_2/egg_utopia/speeding_platform.h"
#include "game/interactables_2/egg_utopia/launcher.h"

#include "game/interactables_2/note_particle.h"
#include "game/interactables_2/105.h"
#include "game/interactables_2/special_ring.h"
#include "game/interactables_2/notification_ring_bonus.h"
#include "game/interactables_2/sky_canyon_init.h"

#include "game/mystery_item_box.h"

#include "game/enemies/kiki.h"
#include "game/enemies/kura_kura.h"
#include "game/enemies/flickey.h"
#include "game/enemies/kubinaga.h"
#include "game/enemies/hammerhead.h"
#include "game/enemies/bullet_buzzer.h"
#include "game/enemies/circus.h"
#include "game/enemies/yado.h"
#include "game/enemies/pen.h"
#include "game/enemies/gohla.h"
#include "game/enemies/bell.h"
#include "game/enemies/straw.h"
#include "game/enemies/kyura.h"
#include "game/enemies/balloon.h"
#include "game/enemies/mouse.h"
#include "game/enemies/koura.h"
#include "game/enemies/madillo.h"
#include "game/enemies/piko_piko.h"
#include "game/enemies/geji_geji.h"
#include "game/enemies/star.h"
#include "game/enemies/mon.h"
#include "game/enemies/buzzer.h"
#include "game/enemies/spinner.h"

#include "game/assets/compressed/entities.h"

#include "constants/zones.h"
#include "constants/songs.h"

// Unknown task
extern void CreateEnemyDefeatScore(s16, s16);

typedef struct Task *(*StagePreInitFunc)(void);
typedef void (*MapEntityInit)(MapEntity *, u16, u16, u8);

struct Range {
    s32 xLow, yLow;
    s32 xHigh, yHigh;
};

void Task_8008DCC(void);

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

const RLCompressed *const gSpritePosData_itemboxes[] = {
    (void *)&zone1_act1_itemboxes,
    (void *)&zone1_act2_itemboxes,
    (void *)&zone1_boss_itemboxes,
    (void *)&zone1_act2_itemboxes,

    (void *)&zone2_act1_itemboxes,
    (void *)&zone2_act2_itemboxes,
    (void *)&zone2_boss_itemboxes,
    (void *)&zone2_act2_itemboxes,

    (void *)&zone3_act1_itemboxes,
    (void *)&zone3_act2_itemboxes,
    (void *)&zone3_boss_itemboxes,
    (void *)&zone3_act2_itemboxes,

    (void *)&zone4_act1_itemboxes,
    (void *)&zone4_act2_itemboxes,
    (void *)&zone4_boss_itemboxes,
    (void *)&zone4_act2_itemboxes,

    (void *)&zone5_act1_itemboxes,
    (void *)&zone5_act2_itemboxes,
    (void *)&zone5_boss_itemboxes,
    (void *)&zone5_act2_itemboxes,

    (void *)&zone6_act1_itemboxes,
    (void *)&zone6_act2_itemboxes,
    (void *)&zone6_boss_itemboxes,
    (void *)&zone6_act2_itemboxes,

    (void *)&zone7_act1_itemboxes,
    (void *)&zone7_act2_itemboxes,
    (void *)&zone7_boss_itemboxes,
    (void *)&zone7_act2_itemboxes,

    (void *)&zone8_act1_itemboxes,
    (void *)&zone8_act2_itemboxes,
    (void *)&zone8_boss_itemboxes,
    NULL,
    NULL,
    NULL,
};
const RLCompressed *const gSpritePosData_enemies[] = {
    (void *)&zone1_act1_enemies,
    (void *)&zone1_act2_enemies,
    (void *)&zone1_boss_enemies,
    (void *)&zone1_act2_enemies,

    (void *)&zone2_act1_enemies,
    (void *)&zone2_act2_enemies,
    (void *)&zone2_boss_enemies,
    (void *)&zone2_act2_enemies,

    (void *)&zone3_act1_enemies,
    (void *)&zone3_act2_enemies,
    (void *)&zone3_boss_enemies,
    (void *)&zone3_act2_enemies,

    (void *)&zone4_act1_enemies,
    (void *)&zone4_act2_enemies,
    (void *)&zone4_boss_enemies,
    (void *)&zone4_act2_enemies,

    (void *)&zone5_act1_enemies,
    (void *)&zone5_act2_enemies,
    (void *)&zone5_boss_enemies,
    (void *)&zone5_act2_enemies,

    (void *)&zone6_act1_enemies,
    (void *)&zone6_act2_enemies,
    (void *)&zone6_boss_enemies,
    (void *)&zone6_act2_enemies,

    (void *)&zone7_act1_enemies,
    (void *)&zone7_act2_enemies,
    (void *)&zone7_boss_enemies,
    (void *)&zone7_act2_enemies,

    (void *)&zone8_act1_enemies,
    (void *)&zone8_act2_enemies,
    (void *)&zone8_boss_enemies,
    NULL,
    NULL,
    NULL,
};

const MapEntityInit gSpriteInits_Interactables[] = {
    CreateEntity_Toggle_PlayerLayer,
    CreateEntity_Toggle_PlayerLayer,
    CreateEntity_Platform_A,
    CreateEntity_Spring_Normal_Up,
    CreateEntity_Spring_Normal_Down,
    CreateEntity_Spring_Normal_Right,
    CreateEntity_Spring_Normal_Left,
    CreateEntity_Spring_Big_UpLeft,
    CreateEntity_Spring_Big_UpRight,
    CreateEntity_Spring_Big_DownRight,
    CreateEntity_Spring_Big_DownLeft,
    CreateEntity_Spring_Small_UpRight,
    CreateEntity_Spring_Small_UpLeft,
    CreateEntity_PlatformThin,
    CreateEntity_Decoration,
    CreateEntity_Ramp,
    CreateEntity_Booster,
    CreateEntity_InclineRamp,
    CreateEntity_BouncySpring,
    CreateEntity_PlatformCrumbling,
    CreateEntity_RotatingHandle,
    CreateEntity_GappedLoop_Start,
    CreateEntity_GappedLoop_End,
    CreateEntity_Spikes_Up,
    CreateEntity_Spikes_Down,
    CreateEntity_Spikes_LeftRight,
    CreateEntity_Spikes_LeftRight,
    CreateEntity_Spikes_HidingUp,
    CreateEntity_Spikes_HidingDown,
    CreateEntity_Corkscrew_Start,
    CreateEntity_Corkscrew_End,
    CreateEntity_BouncyBar,
    CreateEntity_GrindRail_Start,
    CreateEntity_GrindRail_StartAir,
    CreateEntity_GrindRail_EndGround,
    CreateEntity_GrindRail_End_ForcedJump,
    CreateEntity_GrindRail_EndAlternate,
    CreateEntity_GrindRail_EndAir,
    CreateEntity_GrindRail_EndGround_Left,
    CreateEntity_GrindRail_EndAir_Left,
    CreateEntity_Corkscrew3D_Start,
    CreateEntity_Corkscrew3D_End,
    CreateEntity_StageGoal,
    CreateEntity_Checkpoint,
    CreateEntity_044,
    CreateEntity_Toggle_Checkpoint,
    CreateEntity_Toggle_StageGoal,
    CreateEntity_WindUpStick,
    CreateEntity_HookRail_Unused,
    CreateEntity_HookRail_Start,
    CreateEntity_HookRail_End,
    CreateEntity_Windmill,
    CreateEntity_TurnAroundBar,
    CreateEntity_Crane,
    CreateEntity_DashRing,
    CreateEntity_FloatingSpring_Up,
    CreateEntity_Note_Sphere,
    CreateEntity_Note_Block,
    CreateEntity_GuitarString,
    CreateEntity_Keyboard_Vertical,
    CreateEntity_Keyboard_Horizontal_PushLeft,
    CreateEntity_Keyboard_Horizontal_PushRight,
    CreateEntity_GermanFlute,
    CreateEntity_FrenchHorn_Entry,
    CreateEntity_PipeInstrument_Entry,
    CreateEntity_SlowingSnow,
    CreateEntity_FunnelSphere,
    CreateEntity_HalfPipe_End,
    CreateEntity_HalfPipe_Start,
    CreateEntity_BigSnowball,
    CreateEntity_NoteBlock,
    CreateEntity_044,
    CreateEntity_Pipe_Start,
    CreateEntity_Pipe_End,
    CreateEntity_LightBridge,
    CreateEntity_ArrowPlatform_Left,
    CreateEntity_ArrowPlatform_Right,
    CreateEntity_ArrowPlatform_Up,
    CreateEntity_SpikePlatform,
    CreateEntity_Platform_B,
    CreateEntity_LightGlobe,
    CreateEntity_Platform_Square,
    CreateEntity_Propeller,
    CreateEntity_SlidyIce,
    CreateEntity_SmallWindmill,
    CreateEntity_PropellerSpring,
    CreateEntity_Whirlwind_A,
    CreateEntity_Fan_Left,
    CreateEntity_Fan_Right,
    CreateEntity_Fan_Left_Periodic,
    CreateEntity_Fan_Right_Periodic,
    CreateEntity_Launcher_Left_GDown,
    CreateEntity_Launcher_Right_GDown,
    CreateEntity_Cannon,
    CreateEntity_Pole,
    CreateEntity_IronBall,
    CreateEntity_FlyingHandle,
    CreateEntity_SpeedingPlatform,
    CreateEntity_Toggle_Gravity__Down,
    CreateEntity_Toggle_Gravity__Up,
    CreateEntity_Toggle_Gravity__Toggle,
    CreateEntity_Launcher_Left_GUp,
    CreateEntity_Launcher_Right_GUp,
    CreateEntity_SpecialRing,
    CreateEntity_Whirlwind_B,
    CreateEntity_Interactable105,
};

const MapEntityInit gSpriteInits_Enemies[] = {
    CreateEntity_Mon,      CreateEntity_Kiki,     CreateEntity_Buzzer,       CreateEntity_Gohla,      CreateEntity_KuraKura,
    CreateEntity_Kubinaga, CreateEntity_PikoPiko, CreateEntity_Bell,         CreateEntity_Yado,       CreateEntity_Circus,
    CreateEntity_Koura,    CreateEntity_Madillo,  CreateEntity_Straw,        CreateEntity_Hammerhead, CreateEntity_Spinner,
    CreateEntity_Mouse,    CreateEntity_Pen,      CreateEntity_GejiGeji,     CreateEntity_Balloon,    CreateEntity_Flickey,
    CreateEntity_Kyura,    CreateEntity_Star,     CreateEntity_BulletBuzzer,
};

#define NUM_ENEMY_DEFEAT_SCORES 5
const u16 enemyDefeatScores[NUM_ENEMY_DEFEAT_SCORES] = {
    100, 200, 400, 800, 1000,
};

const MapEntityInit gSpriteInits_InteractablesMultiplayer[] = {
    CreateEntity_Toggle_PlayerLayer,
    CreateEntity_Toggle_PlayerLayer,
    CreateEntity_Spring_Normal_Up,
    CreateEntity_Spring_Normal_Down,
    CreateEntity_Spring_Normal_Right,
    CreateEntity_Spring_Normal_Left,
    CreateEntity_Spring_Big_UpLeft,
    CreateEntity_Spring_Big_UpRight,
    CreateEntity_Spring_Big_DownLeft,
    CreateEntity_Spring_Big_DownRight,
    CreateEntity_Spring_Small_UpLeft,
    CreateEntity_Spring_Small_UpRight,
    CreateEntity_Ramp,
    CreateEntity_Spikes_Up,
    CreateEntity_Spikes_Up,
    CreateEntity_Spikes_Up,
    CreateEntity_Spikes_Up,
    CreateEntity_Spikes_Up,
    CreateEntity_Spikes_Up,
    CreateEntity_GrindRail_Start,
    CreateEntity_GrindRail_StartAir,
    CreateEntity_GrindRail_EndGround,
    CreateEntity_GrindRail_End_ForcedJump,
    CreateEntity_GrindRail_EndAlternate,
    CreateEntity_GrindRail_EndAir,
    CreateEntity_GrindRail_EndGround_Left,
    CreateEntity_GrindRail_EndAir_Left,
    CreateEntity_MysteryItemBox,
    CreateEntity_MultiplayerTeleport,
};

const StagePreInitFunc gSpriteTileInits_PreStageEntry[] = {
    NULL,        NULL,        NULL, NULL, // Leaf Forest
    NULL,        NULL,        NULL, NULL, // Hot Crater
    NULL,        NULL,        NULL, NULL, // Music Plant
    NULL,        NULL,        NULL, NULL, // Ice Paradise
    sub_80807CC, sub_80807CC, NULL, NULL, // Sky Canyon
    NULL,        NULL,        NULL, NULL, // Techno Base
    NULL,        NULL,        NULL, NULL, // Egg Utopia
    NULL,        NULL,        NULL, NULL, // Final Zone
    NULL,        NULL,
};

void CreateStageEntitiesManager(void)
{
    void *decompBuf;
    struct Task *t;
    EntitiesManager *em;
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        t = TaskCreate(Task_8008DCC, sizeof(EntitiesManager), 0x2000, 0, sub_80095FC);
    } else {
        t = TaskCreate(Task_8008DCC, sizeof(EntitiesManager), 0x2000, 0, NULL);
    }

    em = TASK_DATA(t);

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        decompBuf = EwramMalloc(gSpritePosData_interactables[gCurrentLevel]->size);
        RLUnCompWram(gSpritePosData_interactables[gCurrentLevel], decompBuf);
        em->interactables = decompBuf;

        decompBuf = EwramMalloc(gSpritePosData_itemboxes[gCurrentLevel]->size);
        RLUnCompWram(gSpritePosData_itemboxes[gCurrentLevel], decompBuf);
        em->items = decompBuf;

        decompBuf = EwramMalloc(gSpritePosData_enemies[gCurrentLevel]->size);
        RLUnCompWram(gSpritePosData_enemies[gCurrentLevel], decompBuf);
        em->enemies = decompBuf;

        em->preInit = NULL;

        if (gSpriteTileInits_PreStageEntry[gCurrentLevel]) {
            em->preInit = gSpriteTileInits_PreStageEntry[gCurrentLevel]();
        }
    } else {
        decompBuf = (void *)EWRAM_START + 0x3F000;
        RLUnCompWram(*(void **)((void *)EWRAM_START + 0x3300C), decompBuf);
        em->interactables = decompBuf;
    }

    em->prevCamX = gCamera.x;
    em->prevCamY = gCamera.y;
    em->unk14 = 1;
    gEntitiesManagerTask = t;
}

static inline MapEntity *ReadMapEntity(void *data, u32 r6)
{
#ifndef NON_MATCHING
    register u32 offset asm("r0") = r6 - 8;
#else
    u32 offset = r6 - 8;
#endif
    return data + offset;
}

// (98.55%) https://decomp.me/scratch/Co5bs
NONMATCH("asm/non_matching/game/stage/SpawnMapEntities.inc", void SpawnMapEntities())
{
    if (!(gStageFlags & 2)) {
        u32 pos;

        u32 regionY, regionX;

        struct Range range;
        u32 h_regionCount, v_regionCount;

        EntitiesManager *em = TASK_DATA(gCurTask);
        u32 *interactables;
        u32 *itemBoxPositions;
        u32 *enemyPositions;

        interactables = (u32 *)em->interactables;
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            enemyPositions = em->enemies->offsets;
            itemBoxPositions = em->items->offsets;
        }

        interactables++;
        h_regionCount = (u16)*interactables++;
        v_regionCount = (u16)*interactables++;

        range.xLow = gCamera.x - 128;
        range.xHigh = gCamera.x + (DISPLAY_WIDTH + 128);

        range.yLow = gCamera.y - 128;
        range.yHigh = gCamera.y + (DISPLAY_HEIGHT + 128);

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

        if ((u32)range.xLow >= Q(h_regionCount)) {
            range.xLow = Q(h_regionCount) - 1;
        }
        if ((u32)range.yLow >= Q(v_regionCount)) {
            range.yLow = Q(v_regionCount) - 1;
        }

        if ((u32)range.xHigh >= Q(h_regionCount)) {
            range.xHigh = Q(h_regionCount) - 1;
        }

        if ((u32)range.yHigh >= Q(v_regionCount)) {
            range.yHigh = Q(v_regionCount) - 1;
        }

        regionY = I(range.yLow);
        while (Q(regionY) < (u32)range.yHigh && regionY < v_regionCount) {

            regionX = I(range.xLow);
            while (Q(regionX) < (u32)range.xHigh && regionX < h_regionCount) {
                u32 posY;
                u32 i;
#ifndef NON_MATCHING
                register u32 r6 asm("r6");
#else
                u32 r6;
#endif
                MapEntity *me;
                intptr_t sp28;

                sp28 = ({
                    intptr_t r0 = h_regionCount * regionY;
                    r0 *= 4;
                    r0 += (intptr_t)interactables;
                    r0;
                });
                if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    r6 = *(u32 *)(sp28 + (regionX * 4));
                    if (r6 != 0) {
                        me = ReadMapEntity(interactables, r6);
                        for (i = 0; (s8)me->x != -1; me++, i++) {
                            if ((s8)me->x >= -2) {
                                s32 x = TO_WORLD_POS(me->x, regionX);
                                s32 y = TO_WORLD_POS(me->y, regionY);
                                if (x >= range.xLow && x <= range.xHigh && y >= range.yLow && y <= range.yHigh) {
                                    gSpriteInits_Interactables[me->index](me, regionX, regionY, i);
                                }
                            }
                        }
                    }

                    r6 = *(intptr_t *)({
                        intptr_t r0 = h_regionCount * regionY;
                        r0 *= sizeof(u32);
                        r0 += (intptr_t)itemBoxPositions;
                        r0 += (regionX * sizeof(u32));
                        r0;
                    });

                    if (r6 != 0) {
                        MapEntity_Itembox *me = (MapEntity_Itembox *)ReadMapEntity(itemBoxPositions, r6);
                        for (i = 0; (s8)me->x != -1; me++, i++) {
                            if ((s8)me->x >= -2) {
                                s32 x = TO_WORLD_POS(me->x, regionX);
                                s32 y = TO_WORLD_POS(me->y, regionY);
                                if (x >= range.xLow && x <= range.xHigh && y >= range.yLow && y <= range.yHigh) {
                                    CreateEntity_ItemBox((void *)me, regionX, regionY, i);
                                }
                            }
                        }
                    }

                    sp28 = ({
                        intptr_t r0 = h_regionCount * regionY;
                        r0 *= 4;
                        r0 += (intptr_t)enemyPositions;
                        r0 += (regionX * 4);
                        r0;
                    });
                    r6 = *(u32 *)sp28;
                    if (r6 != 0) {
                        me = ReadMapEntity(enemyPositions, r6);
                        for (i = 0; (s8)me->x != -1; me++, i++) {

                            if ((s8)me->x >= -2) {
                                s32 x = TO_WORLD_POS(me->x, regionX);
                                s32 y = TO_WORLD_POS(me->y, regionY);
                                if (x >= range.xLow && x <= range.xHigh && y >= range.yLow && y <= range.yHigh) {
                                    gSpriteInits_Enemies[me->index](me, regionX, regionY, i);
                                }
                            }
                        }
                    }

                } else {
                    r6 = *(u32 *)(sp28 + (regionX * 4));
                    if (r6 != 0) {
                        me = ReadMapEntity(interactables, r6);
                        for (i = 0; (s8)me->x != -1; me++, i++) {
                            if ((s8)me->x >= -2) {
                                s32 x = TO_WORLD_POS(me->x, regionX);
                                s32 y = TO_WORLD_POS(me->y, regionY);
                                if (x >= range.xLow && x <= range.xHigh && y >= range.yLow && y <= range.yHigh) {
                                    gSpriteInits_InteractablesMultiplayer[me->index](me, regionX, regionY, i);
                                }
                            }
                        }
                    }
                }
                regionX++;
            }
            regionY++;
        }
        em->prevCamX = gCamera.x;
        em->prevCamY = gCamera.y;
        em->unk14 = 0;
        gCurTask->main = Task_8008DCC;
    }
}
END_NONMATCH

// (88.58%) https://decomp.me/scratch/pOpmU
NONMATCH("asm/non_matching/game/stage/Task_8008DCC.inc", void Task_8008DCC(void))
{
    if (!(gStageFlags & 2)) {
        u32 pos;

        u16 regionX, regionY;
        u32 temp, temp2, temp3, temp4;
        s32 temp5;

        struct Range range1;
        struct Range range2;

        u32 h_regionCount, v_regionCount;

        EntitiesManager *em = TASK_DATA(gCurTask);

        if (em->unk14 != 0) {
            SpawnMapEntities();
            return;
        }
        if ((gCamera.x - em->prevCamX >= 0 ? gCamera.x - em->prevCamX : em->prevCamX - gCamera.x) > 248) {
            SpawnMapEntities();
            return;
        }
        if ((gCamera.y - em->prevCamY >= 0 ? gCamera.y - em->prevCamY : em->prevCamY - gCamera.y) > 208) {
            SpawnMapEntities();
            return;
        }
        {
            u32 *interactables;
            u32 *itemBoxPositions;
            u32 *enemyPositions;

            interactables = (u32 *)em->interactables;
            if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                enemyPositions = em->enemies->offsets;
                itemBoxPositions = em->items->offsets;
            }

            interactables++;
            h_regionCount = (u16)*interactables++;
            v_regionCount = (u16)*interactables++;

            if (gCamera.x > em->prevCamX) {
                range1.xLow = em->prevCamX + (DISPLAY_WIDTH + 128);
                range1.xHigh = gCamera.x + (DISPLAY_WIDTH + 128);

#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
                    // HACK: in zone 3 the TAS we are using depends on going so far off the screen
                    // that some IAs do not spawn and so it gets to skip them. We have to emulate
                    // that behaviour so that we can test the TAS in widescreen
                    range1.xLow = em->prevCamX + (426 + 45);
                    range1.xHigh = gCamera.x + (426 + 45);
                } else if (gCurrentLevel == LEVEL_INDEX(ZONE_4, ACT_2)) {
                    // In this stage there is a pen which initialises earlier
                    // than the TAS expects, so this limits that
                    range1.xLow = em->prevCamX + (426 + 80);
                    range1.xHigh = gCamera.x + (426 + 80);
                } else if (gCurrentLevel == LEVEL_INDEX(ZONE_5, ACT_1)) {
                    // In this stage there are some birds which initialise early
                    range1.xLow = em->prevCamX + (240 + 128);
                    range1.xHigh = gCamera.x + (240 + 128);
                } else if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1)) {
                    // In this stage some robot bird thing jumps too early
                    range1.xLow = em->prevCamX + (426 + 35);
                    range1.xHigh = gCamera.x + (426 + 35);
                } else if (gCurrentLevel == LEVEL_INDEX(ZONE_7, ACT_1)) {
                    // Some spike thing generates too early
                    range1.xLow = em->prevCamX + (426 + 35);
                    range1.xHigh = gCamera.x + (426 + 35);
                } else if (gCurrentLevel == LEVEL_INDEX(ZONE_7, ACT_2)) {
                    // A grind rail generates too early
                    range1.xLow = em->prevCamX + (426 + 40);
                    range1.xHigh = gCamera.x + (426 + 40);
                }
#endif
            } else {
                range1.xLow = gCamera.x - 128;
                range1.xHigh = em->prevCamX - 128;
            }

            if (em->unk14 != 0) {
                SpawnMapEntities();
                return;
            }

            range1.yLow = gCamera.y - 128;
            range1.yHigh = gCamera.y + (DISPLAY_HEIGHT + 128);

            if (gCamera.y > em->prevCamY) {
                range2.yLow = em->prevCamY + (DISPLAY_HEIGHT + 128);
                range2.yHigh = gCamera.y + (DISPLAY_HEIGHT + 128);
            } else {
                range2.yLow = gCamera.y - 128;
                range2.yHigh = em->prevCamY - 128;
            }

            range2.xLow = gCamera.x - 128;
            range2.xHigh = gCamera.x + (DISPLAY_WIDTH + 128);
#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
            if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
                range2.xHigh = gCamera.x + (426 + 45);
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_4, ACT_2)) {
                range2.xHigh = gCamera.x + (426 + 80);
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_5, ACT_1)) {
                range2.xHigh = gCamera.x + (240 + 128);
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1)) {
                range2.xHigh = gCamera.x + (426 + 35);
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_7, ACT_1)) {
                range2.xHigh = gCamera.x + (426 + 35);
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_7, ACT_2)) {
                range2.xHigh = gCamera.x + (426 + 40);
            }
#endif

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
            temp = Q(h_regionCount);
            if (temp2 >= temp) {
                range1.xLow = temp - 1;
            }

            temp3 = range1.yLow;
            temp4 = Q(v_regionCount);

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

            if (gCamera.x != em->prevCamX && range1.xLow != range1.xHigh && range1.yLow != range1.yHigh) {
                regionY = I(range1.yLow);

                while (Q(regionY) < range1.yHigh && regionY < v_regionCount) {
                    regionX = I((s32)range1.xLow);
                    while (Q(regionX) < range1.xHigh && regionX < h_regionCount) {
                        u32 r6;
                        u32 i;
                        MapEntity *me;

                        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                            r6 = *(u32 *)(((u8 *)interactables) + ((h_regionCount * regionY) * sizeof(u32)) + (regionX * sizeof(u32)));
                            if (r6 != 0) {
                                MapEntity *me;
                                me = ReadMapEntity(interactables, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range1.xLow && x <= (s32)range1.xHigh && y >= (s32)range1.yLow
                                            && y <= (s32)range1.yHigh) {
                                            gSpriteInits_Interactables[me->index](me, regionX, regionY, i);
                                        }
                                    }
                                }
                            }

                            r6 = *(u32 *)(((u8 *)itemBoxPositions) + ((h_regionCount * regionY) * sizeof(u32)) + (regionX * sizeof(u32)));

                            if (r6 != 0) {
                                MapEntity_Itembox *me;
                                me = (MapEntity_Itembox *)ReadMapEntity(itemBoxPositions, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range1.xLow && x <= (s32)range1.xHigh && y >= (s32)range1.yLow
                                            && y <= (s32)range1.yHigh) {
                                            CreateEntity_ItemBox((MapEntity *)me, regionX, regionY, i);
                                        }
                                    }
                                }
                            }

                            r6 = *(u32 *)(((u8 *)enemyPositions) + ((h_regionCount * regionY) * sizeof(u32)) + (regionX * sizeof(u32)));
                            if (r6 != 0) {
                                MapEntity *me;
                                me = ReadMapEntity(enemyPositions, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range1.xLow && x <= (s32)range1.xHigh && y >= (s32)range1.yLow
                                            && y <= (s32)range1.yHigh) {
                                            gSpriteInits_Enemies[me->index](me, regionX, regionY, i);
                                        }
                                    }
                                }
                            }

                        } else {
                            r6 = *(u32 *)(((u8 *)interactables) + ((h_regionCount * regionY) * sizeof(u32)) + (regionX * sizeof(u32)));
                            if (r6 != 0) {
                                MapEntity *me;
                                me = ReadMapEntity(interactables, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range1.xLow && x <= (s32)range1.xHigh && y >= (s32)range1.yLow
                                            && y <= (s32)range1.yHigh) {
                                            gSpriteInits_InteractablesMultiplayer[me->index](me, regionX, regionY, i);
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
            if (((gCamera.y != em->prevCamY) && (range2.yLow != range2.yHigh)) && (range2.xLow != range2.xHigh)) {
                regionY = I((s32)range2.yLow);

                while (Q(regionY) < range2.yHigh && regionY < v_regionCount) {
                    regionX = I((s32)range2.xLow);
                    while (Q(regionX) < range2.xHigh && regionX < h_regionCount) {
                        u32 r6;
                        u32 offset;
                        u32 i;
                        MapEntity *me;

                        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                            r6 = *(u32 *)(((u8 *)interactables) + ((h_regionCount * regionY) * sizeof(u32)) + (regionX * sizeof(u32)));
                            if (r6 != 0) {
                                MapEntity *me;
                                me = ReadMapEntity(interactables, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range2.xLow && x <= (s32)range2.xHigh && y >= (s32)range2.yLow
                                            && y <= (s32)range2.yHigh) {
                                            gSpriteInits_Interactables[me->index](me, regionX, regionY, i);
                                        }
                                    }
                                }
                            }

                            r6 = *(u32 *)(((u8 *)itemBoxPositions) + ((h_regionCount * regionY) * sizeof(u32)) + (regionX * sizeof(u32)));

                            if (r6 != 0) {
                                MapEntity_Itembox *me;
                                me = (MapEntity_Itembox *)ReadMapEntity(itemBoxPositions, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range2.xLow && x <= (s32)range2.xHigh && y >= (s32)range2.yLow
                                            && y <= (s32)range2.yHigh) {
                                            CreateEntity_ItemBox((MapEntity *)me, regionX, regionY, i);
                                        }
                                    }
                                }
                            }

                            r6 = *(u32 *)(((u8 *)enemyPositions) + ((h_regionCount * regionY) * sizeof(u32)) + (regionX * sizeof(u32)));
                            if (r6 != 0) {
                                MapEntity *me;
                                me = ReadMapEntity(enemyPositions, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range2.xLow && x <= (s32)range2.xHigh && y >= (s32)range2.yLow
                                            && y <= (s32)range2.yHigh) {
                                            gSpriteInits_Enemies[me->index](me, regionX, regionY, i);
                                        }
                                    }
                                }
                            }

                        } else {
                            r6 = *(u32 *)(((u8 *)interactables) + ((h_regionCount * regionY) * sizeof(u32)) + (regionX * sizeof(u32)));
                            if (r6 != 0) {
                                MapEntity *me;
                                me = ReadMapEntity(interactables, r6);
                                for (i = 0; (s8)me->x != -1; me++, i++) {
                                    if ((s8)me->x >= -2) {
                                        s32 x = TO_WORLD_POS(me->x, regionX);
                                        s32 y = TO_WORLD_POS(me->y, regionY);
                                        if (x >= (s32)range2.xLow && x <= (s32)range2.xHigh && y >= (s32)range2.yLow
                                            && y <= (s32)range2.yHigh) {
                                            gSpriteInits_InteractablesMultiplayer[me->index](me, regionX, regionY, i);
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
            em->prevCamX = gCamera.x;
            em->prevCamY = gCamera.y;
        }
    }
}
END_NONMATCH

void CreateEnemyDefeatScoreAndManageLives(s16 x, s16 y)
{
    u32 old;
    u32 temp1;
    u32 temp2;
    m4aSongNumStart(SE_ITEM_BOX);

    INCREMENT_SCORE(enemyDefeatScores[gPlayer.defeatScoreIndex]);

    CreateEnemyDefeatScore(x, y);

    // NOTE: This should be (ARRAY_COUNT(enemyDefeatScores) - 1)
    //       But padding makes it (6-1) instead of (5-1),
    //       hence the macro.
    if (gPlayer.defeatScoreIndex < (NUM_ENEMY_DEFEAT_SCORES - 1)) {
        gPlayer.defeatScoreIndex++;
    }
}

void TaskDestructor_80095E8(struct Task *t)
{
    Sprite_Entity *s = TASK_DATA(t);
    VramFree(s->displayed.graphics.dest);
}

void sub_80095FC(struct Task *t)
{
    EntitiesManager *em = TASK_DATA(t);
    EwramFree(em->interactables);
    EwramFree(em->items);
    EwramFree(em->enemies);
    gEntitiesManagerTask = NULL;
}
