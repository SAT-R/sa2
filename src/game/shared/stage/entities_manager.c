#include "core.h"
#include "task.h"

#include "malloc_ewram.h"
#include "malloc_vram.h"

#include "lib/m4a/m4a.h"

#include "game/shared/stage/camera.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/enemy_defeat_score.h"

#if (GAME == GAME_SA1)
#include "game/sa1/stage/itembox.h"

#include "constants/sa1/songs.h"
#include "constants/zones.h"
#elif (GAME == GAME_SA2)
#include "game/sa2/stage/itembox.h"
#include "game/sa2/stage/interactables/platform_thin.h"
#include "game/sa2/stage/interactables/ceiling_slope.h"
#include "game/sa2/stage/interactables/grind_rail.h"
#include "game/sa2/stage/interactables/platform_square.h"
#include "game/sa2/stage/interactables/platform.h"
#include "game/sa2/stage/interactables/ramp.h"
#include "game/sa2/stage/interactables/slidy_ice.h"
#include "game/sa2/stage/interactables/spring.h"
#include "game/sa2/stage/interactables/pipe.h"

#include "game/sa2/stage/interactables/leaf_forest/windmill.h"
#include "game/sa2/stage/interactables/leaf_forest/checkpoint.h"
#include "game/sa2/stage/interactables/leaf_forest/gapped_loop.h"
#include "game/sa2/stage/interactables/leaf_forest/stage_goal.h"
#include "game/sa2/stage/interactables/leaf_forest/corkscrew.h"
#include "game/sa2/stage/interactables/leaf_forest/corkscrew_3d.h"
#include "game/sa2/stage/interactables/leaf_forest/incline_ramp.h"
#include "game/sa2/stage/interactables/leaf_forest/toggle_player_layer.h"
#include "game/sa2/stage/interactables/leaf_forest/bouncy_bar.h"
#include "game/sa2/stage/interactables/leaf_forest/spring_bouncy.h"
#include "game/sa2/stage/interactables/leaf_forest/rotating_handle.h"
#include "game/sa2/stage/interactables/leaf_forest/platform_crumbling.h"
#include "game/sa2/stage/interactables/leaf_forest/spikes.h"
#include "game/sa2/stage/interactables/leaf_forest/booster.h"
#include "game/sa2/stage/interactables/leaf_forest/decoration.h"

#include "game/sa2/stage/interactables/hot_crater/crane.h"
#include "game/sa2/stage/interactables/hot_crater/dash_ring.h"
#include "game/sa2/stage/interactables/hot_crater/windup_stick.h"
#include "game/sa2/stage/interactables/hot_crater/floating_spring.h"
#include "game/sa2/stage/interactables/hot_crater/turnaround_bar.h"
#include "game/sa2/stage/interactables/hot_crater/hook_rail.h"

#include "game/sa2/stage/interactables/music_plant/note_sphere.h"
#include "game/sa2/stage/interactables/music_plant/pipe_horn.h"
#include "game/sa2/stage/interactables/music_plant/french_horn.h"
#include "game/sa2/stage/interactables/music_plant/keyboard.h"
#include "game/sa2/stage/interactables/music_plant/note_block.h"
#include "game/sa2/stage/interactables/music_plant/chord.h"
#include "game/sa2/stage/interactables/music_plant/german_flute.h"

#include "game/sa2/stage/interactables/ice_paradise/big_snowball.h"
#include "game/sa2/stage/interactables/ice_paradise/funnel_sphere.h"
#include "game/sa2/stage/interactables/ice_paradise/half_pipe.h"
#include "game/sa2/stage/interactables/ice_paradise/slowing_snow.h"

#include "game/sa2/stage/interactables/sky_canyon/propeller.h"
#include "game/sa2/stage/interactables/sky_canyon/fan.h"
#include "game/sa2/stage/interactables/sky_canyon/small_windmill.h"
#include "game/sa2/stage/interactables/sky_canyon/whirlwind.h"
#include "game/sa2/stage/interactables/sky_canyon/propeller_spring.h"

#include "game/sa2/stage/interactables/techno_base/light_globe.h"
#include "game/sa2/stage/interactables/techno_base/light_bridge.h"
#include "game/sa2/stage/interactables/techno_base/arrow_platform.h"
#include "game/sa2/stage/interactables/techno_base/spike_platform.h"
#include "game/sa2/stage/interactables/techno_base/bounce_block.h"

#include "game/sa2/stage/interactables/egg_utopia/pole.h"
#include "game/sa2/stage/interactables/egg_utopia/flying_handle.h"
#include "game/sa2/stage/interactables/egg_utopia/gravity_toggle.h"
#include "game/sa2/stage/interactables/egg_utopia/cannon.h"
#include "game/sa2/stage/interactables/egg_utopia/iron_ball.h"
#include "game/sa2/stage/interactables/egg_utopia/speeding_platform.h"
#include "game/sa2/stage/interactables/egg_utopia/launcher.h"

#include "game/sa2/stage/interactables/note_particle.h"
#include "game/sa2/stage/interactables/105.h"
#include "game/sa2/stage/interactables/special_ring.h"
#include "game/sa2/stage/interactables/collect_rings_lap_trigger.h"
#include "game/sa2/stage/interactables/sky_canyon_init.h"

#include "game/sa2/stage/mystery_itembox.h"

#include "game/sa2/stage/enemies/kiki.h"
#include "game/sa2/stage/enemies/kura_kura.h"
#include "game/sa2/stage/enemies/flickey.h"
#include "game/sa2/stage/enemies/kubinaga.h"
#include "game/sa2/stage/enemies/hammerhead.h"
#include "game/sa2/stage/enemies/bullet_buzzer.h"
#include "game/sa2/stage/enemies/circus.h"
#include "game/sa2/stage/enemies/yado.h"
#include "game/sa2/stage/enemies/pen.h"
#include "game/sa2/stage/enemies/gohla.h"
#include "game/sa2/stage/enemies/bell.h"
#include "game/sa2/stage/enemies/straw.h"
#include "game/sa2/stage/enemies/kyura.h"
#include "game/sa2/stage/enemies/balloon.h"
#include "game/sa2/stage/enemies/mouse.h"
#include "game/sa2/stage/enemies/koura.h"
#include "game/sa2/stage/enemies/madillo.h"
#include "game/sa2/stage/enemies/piko_piko.h"
#include "game/sa2/stage/enemies/geji_geji.h"
#include "game/sa2/stage/enemies/star.h"
#include "game/sa2/stage/enemies/mon.h"
#include "game/sa2/stage/enemies/buzzer.h"
#include "game/sa2/stage/enemies/spinner.h"

#include "game/sa2/assets/compressed/entities.h"

#include "constants/zones.h"
#include "constants/sa2/songs.h"

#endif

#if (GAME == GAME_SA1)
#define RANGE_INIT(var)  CamCoord(var)[4]
#define RANGE_xLow(var)  (var)[0]
#define RANGE_yLow(var)  (var)[1]
#define RANGE_xHigh(var) (var)[2]
#define RANGE_yHigh(var) (var)[3]
typedef u16 region_t;
#else
typedef struct {
    CamCoord xLow, yLow;
    CamCoord xHigh, yHigh;
} Range;

#define RANGE_INIT(var)  Range var
#define RANGE_xLow(var)  (var).xLow
#define RANGE_yLow(var)  (var).yLow
#define RANGE_xHigh(var) (var).xHigh
#define RANGE_yHigh(var) (var).yHigh
typedef u32 region_t;
#endif

#define READ_START_INDEX(p, hrc, rx, ry) (*((u32 *)((((u8 *)(p)) + (((hrc) * (ry)) * (sizeof(u32)))) + ((rx) * (sizeof(u32))))))
#define NUM_ENEMY_DEFEAT_SCORES          5

typedef Task *(*StagePreInitFunc)(void);
typedef void (*MapEntityInit)(MapEntity *, u16, u16, u8);

static void SA2_LABEL(Task_8008DCC)(void);

#ifndef COLLECT_RINGS_ROM
static void TaskDestructor_EntitiesManager(Task *);
#endif

#if (GAME == GAME_SA1)
// TODO: move to header files
extern const RLCompressed *const gSpritePosData_interactables[NUM_LEVEL_IDS];
extern const RLCompressed *const gSpritePosData_itemboxes[NUM_LEVEL_IDS];
extern const RLCompressed *const gSpritePosData_enemies[NUM_LEVEL_IDS];

extern void CreateEntity_StageGoal(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spikes_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spikes_Down(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spikes_Horizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spikes_Horizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spikes_HidingUp(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spikes_HidingDown(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Checkpoint(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Normal_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Normal_Down(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Horizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Horizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Big_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Big_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Small_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Small_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Decoration(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Toggle_PlayerLayer(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Toggle_PlayerLayer(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_GrindRail_Start(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_GrindRail_End(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_PlatformThin(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_PlatformThin_Falling(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Trampoline(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_PlatformCrumbling(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_BounceBlock(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_InclineRamp(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Waterfall(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_HalfPipeStart(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_HalfPipeEnd(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Shrubbery(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Booster(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Booster_SlightLeft(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Booster_SlightRight(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Interactable034(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_MiniLoop_Base(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_MiniLoop_StartBoost(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_MiniLoop_Exit(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_MiniLoop_Entrance(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Interactable039(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_WaterBridge(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_ToBeContinuedText(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_RedFlag(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_WaterBridgeSplash(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_WallPole_Left(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_WallPole_Right(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_ForcedSlide(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Booster_Wall(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_BumperHexagon(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_BumperRound_LinearMov(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_BumperRound_CircularMov(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_BumperTriHorizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_BumperTriVertical(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_BumperTriBig(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Flipper(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Platform_Square(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Flipper_Vertical(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_BarrelOfDoomMini(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_SegaSonicLetter(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_PartyBalloon(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_ShipSwing(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Platform_Spiked(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Bowl(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_PanelGate_Vertical(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_PanelGate_Horizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_MarbleTrack_Dir(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_MarbleTrack_Pipe(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_MarbleTrack_Entrance(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_MarbleTrack_Exit(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_ConveyorBelt(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Toggle_PlayerVisibility(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_WallBumper(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_TeleportOrb(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Flipper_SmallBlue(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Carousel(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_HookRail(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_SwingingHook(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_SecurityGate(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_SwingRope(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_SteamExhaust(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_CraneClaw(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_MovingSpring(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_IronBall(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_HangBar(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_SkatingStone(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Platform_SlowDescent(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_RunWheel(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Torch(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Lift(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Platform089(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Toggle_PlayerFloat(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_FerrisWheel(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_BoulderSpawner(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_SpikedBarrel(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_AirBubbles(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_IceBlock(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Interactable096(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Interactable097(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_UnderwaterLavaPlatform(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_ConveyorBeltObject(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Booster_Steep(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Booster_Steep2(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_SpecialSpring(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Propeller(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_SmallFallBlock(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Lava(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Track(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Interactable107(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Hiding(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_ToggleGravity(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_PipeEntrance(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_PipeExit(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_TrackAirCorner(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Interactable113(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_BreakableWall(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_MysteryItemBox(MapEntity *me, u16 regionX, u16 regionY, u8 id);

const MapEntityInit gSpriteInits_Interactables[116] = {
    /* 000 */ CreateEntity_StageGoal,
    /* 001 */ CreateEntity_Spikes_Up,
    /* 002 */ CreateEntity_Spikes_Down,
    /* 003 */ CreateEntity_Spikes_Horizontal, // Left
    /* 004 */ CreateEntity_Spikes_Horizontal, // Right
    /* 005 */ CreateEntity_Spikes_HidingUp,
    /* 006 */ CreateEntity_Spikes_HidingDown,
    /* 007 */ CreateEntity_Checkpoint,
    /* 008 */ CreateEntity_Spring_Normal_Up,
    /* 009 */ CreateEntity_Spring_Normal_Down,
    /* 010 */ CreateEntity_Spring_Horizontal, // Left
    /* 011 */ CreateEntity_Spring_Horizontal, // Right
    /* 012 */ CreateEntity_Spring_Big_Up, // Up-Left
    /* 013 */ CreateEntity_Spring_Big_Up, // Up-Right
    /* 014 */ CreateEntity_Spring_Small_Up, // Up-Left
    /* 015 */ CreateEntity_Spring_Small_Up, // Up-Right
    /* 016 */ CreateEntity_Decoration,
    /* 017 */ CreateEntity_Toggle_PlayerLayer,
    /* 018 */ CreateEntity_Toggle_PlayerLayer,
    /* 019 */ CreateEntity_GrindRail_Start,
    /* 020 */ CreateEntity_GrindRail_End,
    /* 021 */ CreateEntity_PlatformThin,
    /* 022 */ CreateEntity_PlatformThin_Falling,
    /* 023 */ CreateEntity_Trampoline,
    /* 024 */ CreateEntity_PlatformCrumbling,
    /* 025 */ CreateEntity_BounceBlock,
    /* 026 */ CreateEntity_InclineRamp,
    /* 027 */ CreateEntity_Waterfall, // Only particles, used for "Sand Falls", too.
    /* 028 */ CreateEntity_HalfPipeStart,
    /* 029 */ CreateEntity_HalfPipeEnd,
    /* 030 */ CreateEntity_Shrubbery,
    /* 031 */ CreateEntity_Booster,
    /* 032 */ CreateEntity_Booster_SlightLeft,
    /* 033 */ CreateEntity_Booster_SlightRight,
    /* 034 */ CreateEntity_Interactable034,
    /* 035 */ CreateEntity_MiniLoop_Base,
    /* 036 */ CreateEntity_MiniLoop_StartBoost,
    /* 037 */ CreateEntity_MiniLoop_Exit,
    /* 038 */ CreateEntity_MiniLoop_Entrance,
    /* 039 */ CreateEntity_Interactable039,
    /* 040 */ CreateEntity_WaterBridge,
    /* 041 */ CreateEntity_ToBeContinuedText,
    /* 042 */ CreateEntity_RedFlag,
    /* 043 */ CreateEntity_WaterBridgeSplash,
    /* 044 */ CreateEntity_WallPole_Left,
    /* 045 */ CreateEntity_WallPole_Right,
    /* 046 */ CreateEntity_ForcedSlide,
    /* 047 */ CreateEntity_Booster_Wall,
    /* 048 */ CreateEntity_BumperHexagon,
    /* 049 */ CreateEntity_BumperRound_LinearMov,
    /* 050 */ CreateEntity_BumperRound_CircularMov,
    /* 051 */ CreateEntity_BumperTriHorizontal,
    /* 052 */ CreateEntity_BumperTriVertical,
    /* 053 */ CreateEntity_BumperTriBig,
    /* 054 */ CreateEntity_Flipper,
    /* 055 */ CreateEntity_Platform_Square,
    /* 056 */ CreateEntity_Flipper_Vertical,
    /* 057 */ CreateEntity_BarrelOfDoomMini,
    /* 058 */ CreateEntity_SegaSonicLetter,
    /* 059 */ CreateEntity_PartyBalloon,
    /* 060 */ CreateEntity_ShipSwing,
    /* 061 */ CreateEntity_Platform_Spiked,
    /* 062 */ CreateEntity_Bowl,
    /* 063 */ CreateEntity_PanelGate_Vertical,
    /* 064 */ CreateEntity_PanelGate_Horizontal,
    /* 065 */ CreateEntity_MarbleTrack_Dir,
    /* 066 */ CreateEntity_MarbleTrack_Pipe,
    /* 067 */ CreateEntity_MarbleTrack_Entrance,
    /* 068 */ CreateEntity_MarbleTrack_Exit,
    /* 069 */ CreateEntity_ConveyorBelt, // 069 Also used for snow in Ice Paradise
    /* 070 */ CreateEntity_Toggle_PlayerVisibility, // data[0]: 0 = Visible, 1 = Invisible
    /* 071 */ CreateEntity_WallBumper,
    /* 072 */ CreateEntity_TeleportOrb, // Casino Paradise
    /* 073 */ CreateEntity_Flipper_SmallBlue,
    /* 074 */ CreateEntity_Carousel,
    /* 075 */ CreateEntity_HookRail,
    /* 076 */ CreateEntity_SwingingHook,
    /* 077 */ CreateEntity_SecurityGate,
    /* 078 */ CreateEntity_SwingRope,
    /* 079 */ CreateEntity_SteamExhaust,
    /* 080 */ CreateEntity_CraneClaw,
    /* 081 */ CreateEntity_MovingSpring, // 081 Moving Spring
    /* 082 */ CreateEntity_IronBall,
    /* 083 */ CreateEntity_HangBar,
    /* 084 */ CreateEntity_SkatingStone,
    /* 085 */ CreateEntity_Platform_SlowDescent,
    /* 086 */ CreateEntity_RunWheel,
    /* 087 */ CreateEntity_Torch, // Cosmic Angel: Antigravity field elements
    /* 088 */ CreateEntity_Lift,
    /* 089 */ CreateEntity_Platform089,
    /* 090 */ CreateEntity_Toggle_PlayerFloat, // data[0]: 0 = Whirlwind, 1 = Antigravity
    /* 091 */ CreateEntity_FerrisWheel,
    /* 092 */ CreateEntity_BoulderSpawner,
    /* 093 */ CreateEntity_SpikedBarrel,
    /* 094 */ CreateEntity_AirBubbles,
    /* 095 */ CreateEntity_IceBlock,
    /* 096 */ CreateEntity_Interactable096,
    /* 097 */ CreateEntity_Interactable097,
    /* 098 */ CreateEntity_UnderwaterLavaPlatform,
    /* 099 */ CreateEntity_ConveyorBeltObject,
    /* 100 */ CreateEntity_Booster_Steep,
    /* 101 */ CreateEntity_Booster_Steep2,
    /* 102 */ CreateEntity_SpecialSpring,
    /* 103 */ CreateEntity_Propeller,
    /* 104 */ CreateEntity_SmallFallBlock, // 104 (X-Zone)
    /* 105 */ CreateEntity_Lava,
    /* 106 */ CreateEntity_Track,
    /* 107 */ CreateEntity_Interactable107,
    /* 108 */ CreateEntity_Spring_Hiding,
    /* 109 */ CreateEntity_ToggleGravity,
    /* 110 */ CreateEntity_PipeEntrance,
    /* 111 */ CreateEntity_PipeExit,
    /* 112 */ CreateEntity_TrackAirCorner,
    /* 113 */ CreateEntity_Interactable113,
    /* 114 */ CreateEntity_BreakableWall,
    /* 115 */ CreateEntity_MysteryItemBox,
};

extern void CreateEntity_Kiki(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Buzzer(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_GamiGami(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Rhinotank(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_KeroKero(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Senbon(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Tentou(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Fireball(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Hanabii(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Slot(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Pierrot(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Leon(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Mirror(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Wamu(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Oct(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Mole(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Yukimaru(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Yukimaru_Wall(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Drisame(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Kuraa(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_PenMk1(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_EggHammerTank_Intro(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_EggHammerTank(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_EggPress(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_EggBall(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_EggSpider(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_MechaKnuckles(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_EggSnake(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_EggWrecker(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_EggDrillster(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_EggX(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_SuperEggRobot(MapEntity *me, u16 regionX, u16 regionY, u8 id);

const MapEntityInit gSpriteInits_Enemies[32] = {
    /* 000 */ CreateEntity_Kiki,
    /* 001 */ CreateEntity_Buzzer,
    /* 002 */ CreateEntity_GamiGami,
    /* 003 */ CreateEntity_Rhinotank,
    /* 004 */ CreateEntity_KeroKero,
    /* 005 */ CreateEntity_Senbon,
    /* 006 */ CreateEntity_Tentou,
    /* 007 */ CreateEntity_Fireball,
    /* 008 */ CreateEntity_Hanabii,
    /* 009 */ CreateEntity_Slot,
    /* 010 */ CreateEntity_Pierrot,
    /* 011 */ CreateEntity_Leon,
    /* 012 */ CreateEntity_Mirror,
    /* 013 */ CreateEntity_Wamu,
    /* 014 */ CreateEntity_Oct,
    /* 015 */ CreateEntity_Mole,
    /* 016 */ CreateEntity_Yukimaru,
    /* 017 */ CreateEntity_Yukimaru_Wall,
    /* 018 */ CreateEntity_Drisame,
    /* 019 */ CreateEntity_Kuraa,
    /* 020 */ CreateEntity_PenMk1,

    // Bosses
    /* 021 */ CreateEntity_EggHammerTank_Intro,
    /* 022 */ CreateEntity_EggHammerTank,
    /* 023 */ CreateEntity_EggPress,
    /* 024 */ CreateEntity_EggBall,
    /* 025 */ CreateEntity_EggSpider,
    /* 026 */ CreateEntity_MechaKnuckles,
    /* 027 */ CreateEntity_EggSnake,
    /* 028 */ CreateEntity_EggWrecker,
    /* 029 */ CreateEntity_EggDrillster,
    /* 030 */ CreateEntity_EggX,
    /* 031 */ CreateEntity_SuperEggRobot,
};

const u16 enemyDefeatScores[NUM_ENEMY_DEFEAT_SCORES] = {
    100, 200, 400, 800, 1000,
};

extern void CreateEntity_Spikes_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spikes_Down(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spikes_Horizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spikes_Horizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spikes_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spikes_Down(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Normal_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Normal_Down(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Horizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Horizontal(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Big_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Spring_Big_Up(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Toggle_PlayerLayer(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_Toggle_PlayerLayer(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_PlatformThin(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_PlatformThin_Falling(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_WaterBridge(MapEntity *me, u16 regionX, u16 regionY, u8 id);
extern void CreateEntity_MysteryItemBox(MapEntity *me, u16 regionX, u16 regionY, u8 id);

// Used for the Single Pak, "Collect Rings" stage
const MapEntityInit gSpriteInits_CollectRingsInteractables[] = {
    /* 000 */ CreateEntity_Spikes_Up,
    /* 001 */ CreateEntity_Spikes_Down,
    /* 002 */ CreateEntity_Spikes_Horizontal,
    /* 003 */ CreateEntity_Spikes_Horizontal,
    /* 004 */ CreateEntity_Spikes_Up,
    /* 005 */ CreateEntity_Spikes_Down,
    /* 006 */ CreateEntity_Spring_Normal_Up,
    /* 007 */ CreateEntity_Spring_Normal_Down,
    /* 008 */ CreateEntity_Spring_Horizontal,
    /* 009 */ CreateEntity_Spring_Horizontal,
    /* 010 */ CreateEntity_Spring_Big_Up,
    /* 011 */ CreateEntity_Spring_Big_Up,
    /* 012 */ CreateEntity_Toggle_PlayerLayer,
    /* 013 */ CreateEntity_Toggle_PlayerLayer,
    /* 014 */ CreateEntity_PlatformThin,
    /* 015 */ CreateEntity_PlatformThin_Falling,
    /* 016 */ CreateEntity_WaterBridge,
    /* 017 */ CreateEntity_MysteryItemBox,
};
#elif (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
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
    CreateEntity_Platform,
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
    CreateEntity_CeilingSlope,
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
    CreateEntity_NoteSphere,
    CreateEntity_NoteBlock,
    CreateEntity_Chord,
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
    CreateEntity_BounceBlock,
    CreateEntity_CeilingSlope,
    CreateEntity_Pipe_Start,
    CreateEntity_Pipe_End,
    CreateEntity_LightBridge,
    CreateEntity_ArrowPlatform_Left,
    CreateEntity_ArrowPlatform_Right,
    CreateEntity_ArrowPlatform_Up,
    CreateEntity_SpikePlatform,
    CreateEntity_FallingPlatform,
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

const u16 enemyDefeatScores[NUM_ENEMY_DEFEAT_SCORES] = {
    100, 200, 400, 800, 1000,
};
#endif

const MapEntityInit gSpriteInits_CollectRingsInteractables[] = {
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
    CreateEntity_CollectRingsLapTrigger,
};

#ifndef COLLECT_RINGS_ROM
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
#endif
#endif

#ifndef COLLECT_RINGS_ROM
void CreateStageEntitiesManager(void)
{
    void *decompBuf;
    Task *t;
    EntitiesManager *em;
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        t = TaskCreate(SA2_LABEL(Task_8008DCC), sizeof(EntitiesManager), 0x2000, 0, TaskDestructor_EntitiesManager);
    } else {
        t = TaskCreate(SA2_LABEL(Task_8008DCC), sizeof(EntitiesManager), 0x2000, 0, NULL);
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

#if (GAME == GAME_SA2)
        em->preInit = NULL;

        if (gSpriteTileInits_PreStageEntry[gCurrentLevel]) {
            em->preInit = gSpriteTileInits_PreStageEntry[gCurrentLevel]();
        }
#endif
    } else {
        decompBuf = (void *)EWRAM_START + 0x3F000;
        RLUnCompWram(*(void **)((void *)EWRAM_START + 0x3300C), decompBuf);
        em->interactables = decompBuf;
    }

    em->prevCamX = gCamera.x;
    em->prevCamY = gCamera.y;
    em->SA2_LABEL(unk14) = 1;
    gEntitiesManagerTask = t;
}
#endif

static void SpawnMapEntities()
{
    // Required to be here to help the stack match
#ifndef NON_MATCHING
    u32 temp, space;
#endif
    if ((gStageFlags & 2) == 0) {
        u32 i;
        region_t regionX, regionY;
        RANGE_INIT(range);
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
#ifndef NON_MATCHING
        h_regionCount = (u16)(temp = *interactables++);
#else
        h_regionCount = (u16)*interactables++;
#endif
        v_regionCount = (u16)*interactables++;

        RANGE_xLow(range) = gCamera.x - 128;
        RANGE_xHigh(range) = gCamera.x + (DISPLAY_WIDTH + 128);

        RANGE_yLow(range) = gCamera.y - 128;
        RANGE_yHigh(range) = gCamera.y + (DISPLAY_HEIGHT + 128);

        if (RANGE_xLow(range) < 0) {
            RANGE_xLow(range) = 0;
        }
        if (RANGE_yLow(range) < 0) {
            RANGE_yLow(range) = 0;
        }
        if (RANGE_xHigh(range) < 0) {
            RANGE_xHigh(range) = 0;
        }
        if (RANGE_yHigh(range) < 0) {
            RANGE_yHigh(range) = 0;
        }

        if (RANGE_xLow(range) >= TO_WORLD_POS(0, h_regionCount)) {
            RANGE_xLow(range) = TO_WORLD_POS(0, h_regionCount) - 1;
        }
        if (RANGE_yLow(range) >= TO_WORLD_POS(0, v_regionCount)) {
            RANGE_yLow(range) = TO_WORLD_POS(0, v_regionCount) - 1;
        }

        if (RANGE_xHigh(range) >= TO_WORLD_POS(0, h_regionCount)) {
            RANGE_xHigh(range) = TO_WORLD_POS(0, h_regionCount) - 1;
        }

        if (RANGE_yHigh(range) >= TO_WORLD_POS(0, v_regionCount)) {
            RANGE_yHigh(range) = TO_WORLD_POS(0, v_regionCount) - 1;
        }

        regionY = TO_REGION(RANGE_yLow(range));
        while (TO_WORLD_POS(0, regionY) < RANGE_yHigh(range) && regionY < v_regionCount) {
            regionX = TO_REGION(RANGE_xLow(range));
            while (TO_WORLD_POS(0, regionX) < RANGE_xHigh(range) && regionX < h_regionCount) {
#ifndef COLLECT_RINGS_ROM
                if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    i = READ_START_INDEX(interactables, h_regionCount, regionX, regionY);
                    if (i != 0) {
                        MapEntity *me = ((void *)interactables + (i - 8));
                        for (i = 0; (s8)me->x != -1; me++, i++) {
                            if ((s8)me->x >= -2) {
                                CamCoord x = TO_WORLD_POS(me->x, regionX);
                                CamCoord y = TO_WORLD_POS(me->y, regionY);
                                if (x >= RANGE_xLow(range) && x <= RANGE_xHigh(range) && y >= RANGE_yLow(range)
                                    && y <= RANGE_yHigh(range)) {
                                    gSpriteInits_Interactables[me->index](me, regionX, regionY, i);
                                }
                            }
                        }
                    }

                    i = READ_START_INDEX(itemBoxPositions, h_regionCount, regionX, regionY);
                    if (i != 0) {
                        MapEntity_Itembox *me = ((void *)itemBoxPositions + (i - 8));
                        for (i = 0; (s8)me->x != -1; me++, i++) {
                            if ((s8)me->x >= -2) {
                                CamCoord x = TO_WORLD_POS(me->x, regionX);
                                CamCoord y = TO_WORLD_POS(me->y, regionY);
                                if (x >= RANGE_xLow(range) && x <= RANGE_xHigh(range) && y >= RANGE_yLow(range)
                                    && y <= RANGE_yHigh(range)) {
                                    CreateEntity_ItemBox((void *)me, regionX, regionY, i);
                                }
                            }
                        }
                    }

                    i = READ_START_INDEX(enemyPositions, h_regionCount, regionX, regionY);
                    if (i != 0) {
                        MapEntity *me = ((void *)enemyPositions + (i - 8));
                        for (i = 0; (s8)me->x != -1; me++, i++) {

                            if ((s8)me->x >= -2) {
                                CamCoord x = TO_WORLD_POS(me->x, regionX);
                                CamCoord y = TO_WORLD_POS(me->y, regionY);
                                if (x >= RANGE_xLow(range) && x <= RANGE_xHigh(range) && y >= RANGE_yLow(range)
                                    && y <= RANGE_yHigh(range)) {
                                    gSpriteInits_Enemies[me->index](me, regionX, regionY, i);
                                }
                            }
                        }
                    }
                } else
#endif
                {
#ifndef NON_MATCHING
                    // Only required in the collect rings rom for non matching
                    if (0) {
                        while (1) { }
                    }
#endif
                    i = READ_START_INDEX(interactables, h_regionCount, regionX, regionY);
                    if (i != 0) {
                        MapEntity *me = ((void *)interactables + (i - 8));
                        for (i = 0; (s8)me->x != -1; me++, i++) {
                            if ((s8)me->x >= -2) {
                                CamCoord x = TO_WORLD_POS(me->x, regionX);
                                CamCoord y = TO_WORLD_POS(me->y, regionY);
                                if (x >= RANGE_xLow(range) && x <= RANGE_xHigh(range) && y >= RANGE_yLow(range)
                                    && y <= RANGE_yHigh(range)) {
                                    gSpriteInits_CollectRingsInteractables[me->index](me, regionX, regionY, i);
                                }
                            }
                        }
                    }
                }
                regionX++;
            }
#ifndef NON_MATCHING
            // Only required in the collect rings rom for non matching
            do {
#endif
                regionY++;
#ifndef NON_MATCHING
            } while (0);
#endif
        }
        em->prevCamX = gCamera.x;
        em->prevCamY = gCamera.y;
        em->SA2_LABEL(unk14) = 0;
        gCurTask->main = SA2_LABEL(Task_8008DCC);
    }
}

static void SA2_LABEL(Task_8008DCC)(void)
{
    if (!(gStageFlags & 2)) {
        u32 i;

        u16 regionX, regionY;

        RANGE_INIT(range1);
        RANGE_INIT(range2);

        u32 h_regionCount, v_regionCount;

        EntitiesManager *em = TASK_DATA(gCurTask);
        u32 temp, temp2, temp3, temp4;
        u32 *interactables;
        u32 *itemBoxPositions;
        u32 *enemyPositions;

        if (em->SA2_LABEL(unk14) != 0) {
            SpawnMapEntities();
            return;
        }
        if (ABS(gCamera.x - em->prevCamX) > 248) {
            SpawnMapEntities();
            return;
        }
        if (ABS(gCamera.y - em->prevCamY) > 208) {
            SpawnMapEntities();
            return;
        }

        interactables = (u32 *)em->interactables;
        if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            enemyPositions = em->enemies->offsets;
            itemBoxPositions = em->items->offsets;
        }

        interactables++;
        h_regionCount = (u16)*interactables++;
        v_regionCount = (u16)*interactables++;

        if (gCamera.x > em->prevCamX) {
            RANGE_xLow(range1) = em->prevCamX + (DISPLAY_WIDTH + 128);
            RANGE_xHigh(range1) = gCamera.x + (DISPLAY_WIDTH + 128);

#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
            if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
                // HACK: in zone 3 the TAS we are using depends on going so far off the screen
                // that some IAs do not spawn and so it gets to skip them. We have to emulate
                // that behaviour so that we can test the TAS in widescreen
                RANGE_xLow(range1) = em->prevCamX + (426 + 45);
                RANGE_xHigh(range1) = gCamera.x + (426 + 45);
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_4, ACT_2)) {
                // In this stage there is a pen which initialises earlier
                // than the TAS expects, so this limits that
                RANGE_xLow(range1) = em->prevCamX + (426 + 80);
                RANGE_xHigh(range1) = gCamera.x + (426 + 80);
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_5, ACT_1)) {
                // In this stage there are some birds which initialise early
                RANGE_xLow(range1) = em->prevCamX + (240 + 128);
                RANGE_xHigh(range1) = gCamera.x + (240 + 128);
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1)) {
                // In this stage some robot bird thing jumps too early
                RANGE_xLow(range1) = em->prevCamX + (426 + 35);
                RANGE_xHigh(range1) = gCamera.x + (426 + 35);
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_7, ACT_1)) {
                // Some spike thing generates too early
                RANGE_xLow(range1) = em->prevCamX + (426 + 35);
                RANGE_xHigh(range1) = gCamera.x + (426 + 35);
            } else if (gCurrentLevel == LEVEL_INDEX(ZONE_7, ACT_2)) {
                // A grind rail generates too early
                RANGE_xLow(range1) = em->prevCamX + (426 + 40);
                RANGE_xHigh(range1) = gCamera.x + (426 + 40);
            }
#endif
        } else {
            RANGE_xLow(range1) = gCamera.x - 128;
            RANGE_xHigh(range1) = em->prevCamX - 128;
        }

        if (em->SA2_LABEL(unk14) != 0) {
            SpawnMapEntities();
            return;
        }

        RANGE_yLow(range1) = gCamera.y - 128;
        RANGE_yHigh(range1) = gCamera.y + (DISPLAY_HEIGHT + 128);

        if (gCamera.y > em->prevCamY) {
            RANGE_yLow(range2) = em->prevCamY + (DISPLAY_HEIGHT + 128);
            RANGE_yHigh(range2) = gCamera.y + (DISPLAY_HEIGHT + 128);
        } else {
            RANGE_yLow(range2) = gCamera.y - 128;
            RANGE_yHigh(range2) = em->prevCamY - 128;
        }

        RANGE_xLow(range2) = gCamera.x - 128;
        RANGE_xHigh(range2) = gCamera.x + (DISPLAY_WIDTH + 128);
#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
        if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) {
            RANGE_xHigh(range2) = gCamera.x + (426 + 45);
        } else if (gCurrentLevel == LEVEL_INDEX(ZONE_4, ACT_2)) {
            RANGE_xHigh(range2) = gCamera.x + (426 + 80);
        } else if (gCurrentLevel == LEVEL_INDEX(ZONE_5, ACT_1)) {
            RANGE_xHigh(range2) = gCamera.x + (240 + 128);
        } else if (gCurrentLevel == LEVEL_INDEX(ZONE_6, ACT_1)) {
            RANGE_xHigh(range2) = gCamera.x + (426 + 35);
        } else if (gCurrentLevel == LEVEL_INDEX(ZONE_7, ACT_1)) {
            RANGE_xHigh(range2) = gCamera.x + (426 + 35);
        } else if (gCurrentLevel == LEVEL_INDEX(ZONE_7, ACT_2)) {
            RANGE_xHigh(range2) = gCamera.x + (426 + 40);
        }
#endif

        if (RANGE_xLow(range1) < 0) {
            RANGE_xLow(range1) = 0;
        }
        if (RANGE_yLow(range1) < 0) {
            RANGE_yLow(range1) = 0;
        }
        if (RANGE_xHigh(range1) < 0) {
            RANGE_xHigh(range1) = 0;
        }

        if (RANGE_yHigh(range1) < 0) {
            RANGE_yHigh(range1) = 0;
        }

        temp2 = RANGE_xLow(range1);
        temp = TO_WORLD_POS(0, h_regionCount);
        if (temp2 >= temp) {
            RANGE_xLow(range1) = temp - 1;
        }

        temp3 = RANGE_yLow(range1);
        temp4 = TO_WORLD_POS(0, v_regionCount);

        if (temp3 >= temp4) {
            RANGE_yLow(range1) = temp4 - 1;
        }

        if (RANGE_xHigh(range1) >= temp) {
            RANGE_xHigh(range1) = temp - 1;
        }

        if (RANGE_yHigh(range1) >= temp4) {
            RANGE_yHigh(range1) = temp4 - 1;
        }

        if (RANGE_xLow(range2) < 0) {
            RANGE_xLow(range2) = 0;
        }

        if (RANGE_yLow(range2) < 0) {
            RANGE_yLow(range2) = 0;
        }

        if (RANGE_xHigh(range2) < 0) {
            RANGE_xHigh(range2) = 0;
        }

        if (RANGE_yHigh(range2) < 0) {
            RANGE_yHigh(range2) = 0;
        }

        if (RANGE_xLow(range2) >= temp) {
            RANGE_xLow(range2) = temp - 1;
        }

        if (RANGE_yLow(range2) >= temp4) {
            RANGE_yLow(range2) = temp4 - 1;
        }

        if (RANGE_xHigh(range2) >= temp) {
            RANGE_xHigh(range2) = temp - 1;
        }

        if (RANGE_yHigh(range2) >= temp4) {
            RANGE_yHigh(range2) = temp4 - 1;
        }

        if (gCamera.x != em->prevCamX && RANGE_xLow(range1) != RANGE_xHigh(range1) && RANGE_yLow(range1) != RANGE_yHigh(range1)) {
            regionY = TO_REGION(RANGE_yLow(range1));

            while (TO_WORLD_POS(0, regionY) < RANGE_yHigh(range1) && regionY < v_regionCount) {
                regionX = TO_REGION(RANGE_xLow(range1));
                while (TO_WORLD_POS(0, regionX) < RANGE_xHigh(range1) && regionX < h_regionCount) {
#ifndef COLLECT_RINGS_ROM
                    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                        i = READ_START_INDEX(interactables, h_regionCount, regionX, regionY);
                        if (i != 0) {
                            MapEntity *me = ((void *)interactables + (i - 8));
                            for (i = 0; (s8)me->x != -1; me++, i++) {
                                if ((s8)me->x >= -2) {
                                    CamCoord x = TO_WORLD_POS(me->x, regionX);
                                    CamCoord y = TO_WORLD_POS(me->y, regionY);
                                    if (x >= RANGE_xLow(range1) && x <= RANGE_xHigh(range1) && y >= RANGE_yLow(range1)
                                        && y <= RANGE_yHigh(range1)) {
                                        gSpriteInits_Interactables[me->index](me, regionX, regionY, i);
                                    }
                                }
                            }
                        }

                        i = READ_START_INDEX(itemBoxPositions, h_regionCount, regionX, regionY);
                        if (i != 0) {
                            MapEntity_Itembox *me = ((void *)itemBoxPositions + (i - 8));
                            for (i = 0; (s8)me->x != -1; me++, i++) {
                                if ((s8)me->x >= -2) {
                                    CamCoord x = TO_WORLD_POS(me->x, regionX);
                                    CamCoord y = TO_WORLD_POS(me->y, regionY);
                                    if (x >= RANGE_xLow(range1) && x <= RANGE_xHigh(range1) && y >= RANGE_yLow(range1)
                                        && y <= RANGE_yHigh(range1)) {
                                        CreateEntity_ItemBox((MapEntity *)me, regionX, regionY, i);
                                    }
                                }
                            }
                        }

                        i = READ_START_INDEX(enemyPositions, h_regionCount, regionX, regionY);
                        if (i != 0) {
                            MapEntity *me = ((void *)enemyPositions + (i - 8));
                            for (i = 0; (s8)me->x != -1; me++, i++) {
                                if ((s8)me->x >= -2) {
                                    CamCoord x = TO_WORLD_POS(me->x, regionX);
                                    CamCoord y = TO_WORLD_POS(me->y, regionY);
                                    if (x >= RANGE_xLow(range1) && x <= RANGE_xHigh(range1) && y >= RANGE_yLow(range1)
                                        && y <= RANGE_yHigh(range1)) {
                                        gSpriteInits_Enemies[me->index](me, regionX, regionY, i);
                                    }
                                }
                            }
                        }
                    } else
#endif
                    {
#ifndef NON_MATCHING
                        // Only required in the collect rings rom for non matching
                        if (0) {
                            while (1) { }
                        }
#endif
                        i = READ_START_INDEX(interactables, h_regionCount, regionX, regionY);
                        if (i != 0) {
                            MapEntity *me = ((void *)interactables + (i - 8));
                            for (i = 0; (s8)me->x != -1; me++, i++) {
                                if ((s8)me->x >= -2) {
                                    CamCoord x = TO_WORLD_POS(me->x, regionX);
                                    CamCoord y = TO_WORLD_POS(me->y, regionY);
                                    if (x >= RANGE_xLow(range1) && x <= RANGE_xHigh(range1) && y >= RANGE_yLow(range1)
                                        && y <= RANGE_yHigh(range1)) {
                                        gSpriteInits_CollectRingsInteractables[me->index](me, regionX, regionY, i);
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

        if (((gCamera.y != em->prevCamY) && (RANGE_yLow(range2) != RANGE_yHigh(range2))) && (RANGE_xLow(range2) != RANGE_xHigh(range2))) {
            regionY = TO_REGION(RANGE_yLow(range2));
            while (({ TO_WORLD_POS(0, regionY); }) < RANGE_yHigh(range2) && regionY < v_regionCount) {
                regionX = TO_REGION(RANGE_xLow(range2));
                while (TO_WORLD_POS(0, regionX) < RANGE_xHigh(range2) && regionX < h_regionCount) {
#ifndef COLLECT_RINGS_ROM
                    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                        i = READ_START_INDEX(interactables, h_regionCount, regionX, regionY);
                        if (i != 0) {
                            MapEntity *me = ((void *)interactables + (i - 8));
                            for (i = 0; (s8)me->x != -1; me++, i++) {
                                if ((s8)me->x >= -2) {
                                    CamCoord x = TO_WORLD_POS(me->x, regionX);
                                    CamCoord y = TO_WORLD_POS(me->y, regionY);
                                    if (x >= RANGE_xLow(range2) && x <= RANGE_xHigh(range2) && y >= RANGE_yLow(range2)
                                        && y <= RANGE_yHigh(range2)) {
                                        gSpriteInits_Interactables[me->index](me, regionX, regionY, i);
                                    }
                                }
                            }
                        }

                        i = READ_START_INDEX(itemBoxPositions, h_regionCount, regionX, regionY);
                        if (i != 0) {
                            MapEntity_Itembox *me = ((void *)itemBoxPositions + (i - 8));
                            for (i = 0; (s8)me->x != -1; me++, i++) {
                                if ((s8)me->x >= -2) {
                                    CamCoord x = TO_WORLD_POS(me->x, regionX);
                                    CamCoord y = TO_WORLD_POS(me->y, regionY);
                                    if (x >= RANGE_xLow(range2) && x <= RANGE_xHigh(range2) && y >= RANGE_yLow(range2)
                                        && y <= RANGE_yHigh(range2)) {
                                        CreateEntity_ItemBox((MapEntity *)me, regionX, regionY, i);
                                    }
                                }
                            }
                        }

                        i = READ_START_INDEX(enemyPositions, h_regionCount, regionX, regionY);
                        if (i != 0) {
                            MapEntity *me = ((void *)enemyPositions + (i - 8));
                            for (i = 0; (s8)me->x != -1; me++, i++) {
                                if ((s8)me->x >= -2) {
                                    CamCoord x = TO_WORLD_POS(me->x, regionX);
                                    CamCoord y = TO_WORLD_POS(me->y, regionY);
                                    if (x >= RANGE_xLow(range2) && x <= RANGE_xHigh(range2) && y >= RANGE_yLow(range2)
                                        && y <= RANGE_yHigh(range2)) {
                                        gSpriteInits_Enemies[me->index](me, regionX, regionY, i);
                                    }
                                }
                            }
                        }
                    } else
#endif
                    {
#ifndef NON_MATCHING
                        // Only required in the collect rings rom for non matching
                        if (0) {
                            while (1) { }
                        }
#endif
                        i = READ_START_INDEX(interactables, h_regionCount, regionX, regionY);
                        if (i != 0) {
                            MapEntity *me = ((void *)interactables + (i - 8));
                            for (i = 0; (s8)me->x != -1; me++, i++) {
                                if ((s8)me->x >= -2) {
                                    CamCoord x = TO_WORLD_POS(me->x, regionX);
                                    CamCoord y = TO_WORLD_POS(me->y, regionY);
                                    if (x >= RANGE_xLow(range2) && x <= RANGE_xHigh(range2) && y >= RANGE_yLow(range2)
                                        && y <= RANGE_yHigh(range2)) {
                                        gSpriteInits_CollectRingsInteractables[me->index](me, regionX, regionY, i);
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

#if COLLECT_RINGS_ROM
void CreateStageEntitiesManager(void)
{
    void *decompBuf;
    Task *t = TaskCreate(SA2_LABEL(Task_8008DCC), sizeof(EntitiesManager), 0x2000, 0, NULL);
    EntitiesManager *em = TASK_DATA(t);

    decompBuf = (void *)EWRAM_START + 0x3F000;
    RLUnCompWram(*(void **)((void *)EWRAM_START + 0x3300C), decompBuf);
    em->interactables = decompBuf;

    em->prevCamX = gCamera.x;
    em->prevCamY = gCamera.y;
    em->unk14 = 1;
    gEntitiesManagerTask = t;
}
#endif

#ifndef COLLECT_RINGS_ROM
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

void TaskDestructor_EntityShared(Task *t)
{
    Sprite_Entity *s = TASK_DATA(t);
    VramFree(s->displayed.graphics.dest);
}

static void TaskDestructor_EntitiesManager(Task *t)
{
    EntitiesManager *em = TASK_DATA(t);
    EwramFree(em->interactables);
    EwramFree(em->items);
    EwramFree(em->enemies);
    gEntitiesManagerTask = NULL;
}
#endif
