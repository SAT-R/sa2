#
# NOTE: Overrideable default flags are set in config.mk
#
include config.mk

MAKEFLAGS += --no-print-directory

# Clear the default suffixes
.SUFFIXES:
# Don't delete intermediate files
.SECONDARY:
# Delete files that weren't built properly
.DELETE_ON_ERROR:
# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

# Quotes must remain to ensure that paths with spaces are respected
ROOT_DIR := "$(shell dirname "$(realpath $(firstword $(MAKEFILE_LIST)))")"
OS       := $(shell uname)

### TOOLCHAIN ###

# GBA
ifeq ($(PLATFORM),gba)
  TOOLCHAIN := $(DEVKITARM)
  COMPARE ?= 0

  ifeq (compare,$(MAKECMDGOALS))
    COMPARE := 1
  endif

  # don't use dkP's base_tools anymore
  # because the redefinition of $(CC) conflicts
  # with when we want to use $(CC) to preprocess files
  # thus, manually create the variables for the bin
  # files, or use arm-none-eabi binaries on the system
  # if dkP is not installed on this system

  ifneq (,$(TOOLCHAIN))
    ifneq ($(wildcard $(TOOLCHAIN)/bin),)
	  export PATH := $(TOOLCHAIN)/bin:$(PATH)
    endif
  endif

  PREFIX := arm-none-eabi-
# x86
else ifeq ($(CPU_ARCH),i386)
  ifeq ($(PLATFORM),sdl_win32)
    TOOLCHAIN := /usr/x86_64-w64-mingw32/
    PREFIX := x86_64-w64-mingw32-
  else ifeq ($(PLATFORM),win32)
    TOOLCHAIN := /usr/x86_64-w64-mingw32/
    PREFIX := x86_64-w64-mingw32-
  endif
else
# Native
  ifneq ($(PLATFORM),sdl)
    $(error Unsupported CPU arch for platform '$(CPU_ARCH)', '$(PLATFORM)')
  endif
endif # (PLATFORM == gba)


ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

SHELL     := /bin/bash -o pipefail
SHA1 	  := $(shell { command -v sha1sum || command -v shasum; } 2>/dev/null) -c

ifeq ($(PLATFORM),gba)
CC1       := ../tools/agbcc/bin/agbcc$(EXE)
CC1_OLD   := ../tools/agbcc/bin/old_agbcc$(EXE)
else
CC1       := $(PREFIX)gcc$(EXE)
CC1_OLD   := $(CC1)
endif

CPP       := $(PREFIX)cpp
LD        := $(PREFIX)ld
OBJCOPY   := $(PREFIX)objcopy
AS 		  := $(PREFIX)as

FORMAT    := clang-format-13

### TOOLS ###
GFX 	  := ../tools/gbagfx/gbagfx$(EXE)
ENT_POS   := ../tools/entity_positions/entity_positions$(EXE)
AIF		  := ../tools/aif2pcm/aif2pcm$(EXE)
MID2AGB   := ../tools/mid2agb/mid2agb$(EXE)
SCANINC   := ../tools/scaninc/scaninc$(EXE)
PREPROC	  := ../tools/preproc/preproc$(EXE)
RAMSCRGEN := ../tools/ramscrgen/ramscrgen$(EXE)
FIX 	  := ../tools/gbafix/gbafix$(EXE)

TOOLDIRS := $(filter-out ../tools/agbcc/ ../tools/BriBaSA_ex/, $(dir $(wildcard ../tools/*/Makefile)))
TOOLBASE = $(TOOLDIRS:tools/%=%)
TOOLS = $(foreach tool,$(TOOLBASE),../tools/$(tool)/$(tool)$(EXE))

### DEPS ###

SDL_MINGW_PKG     := $(ROOT_DIR)/ext/SDL2-2.30.3/x86_64-w64-mingw32
SDL_MINGW_INCLUDE := $(SDL_MINGW_PKG)/include/SDL2
SDL_MINGW_SDL_DLL := $(SDL_MINGW_PKG)/bin/SDL2.dll
SDL_MINGW_LIB     := $(SDL_MINGW_PKG)/lib
SDL_MINGW_FLAGS   := -I$(SDL_MINGW_INCLUDE) -D_THREAD_SAFE
SDL_MINGW_LIBS    := -L$(SDL_MINGW_LIB) -lSDL2main -lSDL2.dll

LIBABGSYSCALL_LIBS := -L$(ROOT_DIR)/../libagbsyscall/build/gba -lagbsyscall

### FILES ###

OBJ_DIR  := build/$(PLATFORM)/$(BUILD_NAME)
ifeq ($(PLATFORM),gba)
ROM      := $(BUILD_NAME).gba
ELF      := $(ROM:.gba=.elf)
MAP      := $(ROM:.gba=.map)
else ifeq ($(PLATFORM),sdl)
ROM      := $(BUILD_NAME).sdl
ELF      := $(ROM).elf
MAP      := $(ROM).map
else
ROM      := $(BUILD_NAME).$(PLATFORM).exe
ELF      := $(ROM:.exe=.elf)
MAP      := $(ROM:.exe=.map)
endif

INCLUDE_DIRS = include
INCLUDE_CPP_ARGS := $(INCLUDE_DIRS:%=-iquote %)
INCLUDE_SCANINC_ARGS := $(INCLUDE_DIRS:%=-I %)

SA2_INCLUDE_DIRS = ../include
SA2_INCLUDE_CPP_ARGS := $(SA2_INCLUDE_DIRS:%=-iquote %)
SA2_INCLUDE_SCANINC_ARGS := $(INCLUDE_DIRS:%=-I %)

ASM_SUBDIR = asm
ASM_BUILDDIR = $(OBJ_DIR)/$(ASM_SUBDIR)

C_SUBDIR = src
C_BUILDDIR = $(OBJ_DIR)/$(C_SUBDIR)

DATA_ASM_SUBDIR = data/sa1
DATA_ASM_BUILDDIR = $(OBJ_DIR)/$(DATA_ASM_SUBDIR)

SONG_SUBDIR = sound/sa1/songs
SONG_BUILDDIR = $(OBJ_DIR)/$(SONG_SUBDIR)

SOUND_ASM_SUBDIR = sound
SOUND_ASM_BUILDDIR = $(OBJ_DIR)/$(SOUND_ASM_SUBDIR)

MID_SUBDIR = sound/sa1/songs/midi
MID_BUILDDIR = $(OBJ_DIR)/$(MID_SUBDIR)

SAMPLE_SUBDIR = sound/sa1/direct_sound_samples

OBJ_TILES_4BPP_SUBDIR = graphics/sa1/obj_tiles/4bpp
TILESETS_SUBDIR = graphics/sa1/tilesets/

ifeq ($(PLATFORM),gba)
C_SRCS := $(shell find $(C_SUBDIR) -name "*.c" -not -path "*/platform/*")
else ifeq ($(PLATFORM),sdl)
C_SRCS := $(shell find $(C_SUBDIR) -name "*.c" -not -path "*/platform/win32/*")
else ifeq ($(PLATFORM),sdl_win32)
C_SRCS := $(shell find $(C_SUBDIR) -name "*.c" -not -path "*/platform/win32/*")
else ifeq ($(PLATFORM),win32)
C_SRCS := $(shell find $(C_SUBDIR) -name "*.c" -not -path "*/platform/pret_sdl/*")
else
C_SRCS := $(shell find $(C_SUBDIR) -name "*.c")
endif
C_OBJS := $(patsubst $(C_SUBDIR)/%.c,$(C_BUILDDIR)/%.o,$(C_SRCS))

# Platform not included as we only need the headers for decomp scratches
C_HEADERS := $(shell find $(INCLUDE_DIRS) -name "*.h" -not -path "*/platform/*")

ifeq ($(PLATFORM),gba)
C_ASM_SRCS := $(shell find $(C_SUBDIR) -name "*.s")
C_ASM_OBJS := $(patsubst $(C_SUBDIR)/%.s,$(C_BUILDDIR)/%.o,$(C_ASM_SRCS))

ASM_SRCS := $(wildcard $(ASM_SUBDIR)/*.s)
ASM_OBJS := $(patsubst $(ASM_SUBDIR)/%.s,$(ASM_BUILDDIR)/%.o,$(ASM_SRCS))
endif

# TEMP SOLUTION UNTIL MAKEFILES ARE COMBINED
# Moves any relevant sa2 c files to the build dir
SA2_C_FILES := \
	src/lib/m4a/m4a.c \
	src/lib/m4a/m4a_tables.c \
	src/lib/agb_flash/agb_flash.c \
	src/lib/agb_flash/agb_flash_at_512k.c \
	src/lib/agb_flash/agb_flash_le_512k.c \
	src/lib/agb_flash/agb_flash_mx_512k.c \
	src/multi_sio.c \
	src/sio32_multi_load.c \
	src/multi_boot.c \
	src/core.c \
	src/main.c \
	src/task.c \
	src/sprite.c \
	src/trig.c \
	src/malloc_vram.c \
	src/malloc_ewram.c \
	src/bg_triangles.c \
	src/input_recorder.c \
	src/background.c \
	src/game/globals.c \
	src/game/dummy_task.c \
	src/game/game.c \
	src/game/sa1/ui/time_attack_record.c \
	src/game/sa1/ui/multiplayer_continue_screen.c \
	src/game/sa1/ui/vs_record.c \
	src/game/sa1/ui/edit_language_screen.c \
	src/game/sa1/ui/sound_test.c \
	src/game/sa1/ui/time_attack_records.c \
	src/game/sa1/ui/time_over.c \
	src/game/sa1/ui/game_2_3.c \
	src/game/sa1/ui/time_attack_results.c \
	src/game/sa1/ui/time_attack_lobby.c \
	src/game/sa1/ui/special_stage_intro.c \
	src/game/sa1/ui/player_name_input_menu.c \
	src/game/sa1/ui/course_select.c \
	src/game/sa1/ui/staff_credits.c \
	src/game/sa1/ui/collect_chaos_emeralds_msg.c \
	src/game/sa1/ui/game_over.c \
	src/game/sa1/ui/character_select.c \
	src/game/sa1/ui/extra_stage_results.c \
	src/game/sa1/menus/time_attack.c \
	src/game/sa1/menus/mp_mode_select.c \
	src/game/sa1/menus/player_data.c \
	src/game/sa1/menus/options.c \
	src/game/sa1/stage/mp_unk_1.c \
	src/game/sa1/stage/mp_results.c \
	src/game/sa1/stage/player_controls.c \
	src/game/sa1/stage/to_be_continued_screen.c \
	src/game/sa1/stage/mp_results_b.c \
	src/game/sa1/stage/mp_hud.c \
	src/game/sa1/stage/ui_rendering.c \
	src/game/sa1/stage/mp_unk_0.c \
	src/game/sa1/stage/nuts_and_bolts_task.c \
	src/game/sa1/stage/some_task_manager.c \
	src/game/sa1/save.c \
	src/game/sa1/multiplayer/chao_message.c \
	src/game/shared/stage/palette_loader.c \
	src/game/shared/stage/terrain_collision.c \
	src/game/shared/stage/screen_shake.c \
	src/game/shared/stage/dust_effect_braking.c \
	src/game/shared/stage/dust_cloud.c \
	src/game/shared/stage/collect_ring_effect.c \
	src/game/shared/stage/unused_flash_task.c \
	src/game/shared/stage/magnetic_ring.c \
	src/game/shared/multiplayer/communication_outcome.c \
	src/game/shared/stage/pause_menu.c \
	src/game/shared/stage/item_tasks.c \
	src/game/shared/stage/demo_manager.c \
	src/game/shared/stage/enemy_defeat_score.c \
	src/game/shared/stage/mp_finish.c \
	src/game/shared/stage/music_manager.c \
	src/game/shared/stage/mp_sprite_task.c \
	src/game/shared/stage/dust_effect_spindash.c \
	src/game/shared/stage/amy_attack_heart_effect.c \
	src/game/shared/stage/mp_indicators.c \
	src/game/shared/stage/underwater_effects.c \
	src/game/shared/stage/grind_effect_1.c \
	src/game/shared/stage/mp_event_recv_mgr.c \
	src/game/shared/stage/spot_lights_manager.c \
	src/game/shared/stage/mp_event_mgr.c \
	src/game/shared/stage/mp_player.c \
	src/game/shared/stage/rings_scatter.c \
	src/game/shared/stage/player.c \
	src/game/shared/collect_rings/results.c \
	src/game/shared/menus/unused_level_select.c \
	src/game/shared/stage/collision_1.c \
	src/game/shared/stage/collision_2.c \
	src/game/shared/stage/collision_3.c \
	src/game/shared/stage/water_effects.c \
	src/game/shared/stage/spot_light_beam_task.c \
	src/game/sa1/ui/game_2_0.c \
	src/game/sa1/ui/game_2_1.c \
	src/game/sa1/ui/stage_results.c \
	src/game/sa1/menus/mp_mode_select_2.c \
	src/game/sa1/special_stage/main.c \
	src/game/sa1/stage/egg_rocket_transitions.c \
	src/game/sa1/stage/temporary_sound_play_task.c \
	src/game/sa1/stage/itembox.c \
	src/game/sa1/menus/title_screen.c \
	src/game/sa1/stage/interactables/special_spring.c \
	src/game/sa1/stage/interactables/toggle_gravity.c \
	src/game/sa1/stage/interactables/half_pipe.c \
	src/game/sa1/stage/interactables/conveyor_belt_movement.c \
	src/game/sa1/stage/interactables/track.c \
	src/game/sa1/stage/interactables/water_bridge_splash.c \
	src/game/sa1/stage/interactables/updraft.c \
	src/game/sa1/stage/interactables/bounce_block.c \
	src/game/sa1/stage/interactables/pipe.c \
	src/game/sa1/stage/interactables/wall_bumper.c \
	src/game/sa1/stage/interactables/flippers.c \
	src/game/sa1/stage/interactables/ferris_wheel.c \
	src/game/sa1/stage/interactables/platform_square.c \
	src/game/sa1/stage/interactables/booster.c \
	src/game/sa1/stage/interactables/ship_swing.c \
	src/game/sa1/stage/interactables/maze_air_corner.c \
	src/game/sa1/stage/interactables/113.c \
	src/game/sa1/stage/interactables/toggle_player_visibility.c \
	src/game/sa1/stage/interactables/flipper_small_blue.c \
	src/game/sa1/stage/interactables/air_bubbles.c \
	src/game/sa1/stage/interactables/spring.c \
	src/game/sa1/stage/interactables/spikes.c \
	src/game/sa1/stage/interactables/decoration.c \
	src/game/sa1/stage/interactables/hook_rail.c \
	src/game/sa1/stage/interactables/platforms_085_089.c \
	src/game/sa1/stage/interactables/107.c \
	src/game/sa1/stage/interactables/mini_loop.c \
	src/game/sa1/stage/interactables/boulder_spawner.c \
	src/game/sa1/stage/interactables/lava.c \
	src/game/sa1/stage/interactables/fadein_to_be_continued.c \
	src/game/sa1/stage/interactables/039.c \
	src/game/sa1/stage/interactables/checkpoint.c \
	src/game/sa1/stage/interactables/marble_track.c \
	src/game/sa1/stage/interactables/moving_spring.c \
	src/game/sa1/stage/interactables/platform_crumbling.c \
	src/game/sa1/stage/interactables/hang_bar.c \
	src/game/sa1/stage/interactables/shrubbery.c \
	src/game/sa1/stage/interactables/steam_exhaust.c \
	src/game/sa1/stage/interactables/propeller.c \
	src/game/sa1/stage/interactables/spiked_barrel.c \
	src/game/sa1/stage/interactables/stage_goal.c \
	src/game/sa1/stage/interactables/platform_spiked.c \
	src/game/sa1/stage/interactables/conveyor_belt_object.c \
	src/game/sa1/stage/interactables/toggle_player_float.c \
	src/game/sa1/stage/interactables/grind_rail.c \
	src/game/sa1/stage/interactables/party_balloon.c \
	src/game/sa1/stage/interactables/skating_stone.c \
	src/game/sa1/stage/interactables/teleport_orb.c \
	src/game/sa1/stage/interactables/breakable_wall.c \
	src/game/sa1/stage/interactables/trampoline.c \
	src/game/sa1/stage/interactables/waterfall.c \
	src/game/sa1/stage/interactables/spring_hiding.c \
	src/game/sa1/stage/interactables/forced_slide.c \
	src/game/sa1/stage/interactables/platform_thin.c \
	src/game/sa1/stage/interactables/small_fall_block.c \
	src/game/sa1/stage/interactables/crane_claw_and_lift.c \
	src/game/sa1/stage/interactables/incline_ramp.c \
	src/game/sa1/stage/interactables/security_gate.c \
	src/game/sa1/stage/interactables/toggle_player_layer.c \
	src/game/sa1/stage/interactables/bowl.c \
	src/game/sa1/stage/interactables/iron_ball.c \
	src/game/sa1/stage/interactables/034.c \
	src/game/sa1/stage/interactables/run_wheel.c \
	src/game/sa1/stage/interactables/ice_block.c \
	src/game/sa1/stage/interactables/torch.c \
	src/game/sa1/stage/interactables/swinging_hook.c \
	src/game/sa1/stage/interactables/red_flag_and_pole.c \
	src/game/sa1/stage/interactables/underwater_lava_platform.c \
	src/game/sa1/stage/interactables/mini_loop_boost.c \
	src/game/sa1/stage/interactables/sega_sonic_letters.c \
	src/game/sa1/stage/interactables/water_bridge.c \
	src/game/sa1/stage/interactables/096.c \
	src/game/sa1/stage/interactables/panel_gate.c \
	src/game/sa1/stage/interactables/carousel.c \
	src/game/sa1/stage/interactables/swing_rope.c \
	src/game/sa1/stage/interactables/bumpers.c \
	src/game/sa1/stage/enemies/wamu.c \
	src/game/sa1/stage/enemies/bosses_egg_mobile.c \
	src/game/sa1/stage/enemies/tentou.c \
	src/game/sa1/stage/enemies/boss_1_egg_hammer_tank.c \
	src/game/sa1/stage/enemies/gamigami.c \
	src/game/sa1/stage/enemies/boss_4_egg_spider.c \
	src/game/sa1/stage/enemies/kerokero.c \
	src/game/sa1/stage/enemies/boss_3_egg_ball.c \
	src/game/sa1/stage/enemies/pen_mk1.c \
	src/game/sa1/stage/enemies/bosses_misc.c \
	src/game/sa1/stage/enemies/drisame.c \
	src/game/sa1/stage/enemies/leon.c \
	src/game/sa1/stage/enemies/slot.c \
	src/game/sa1/stage/enemies/buzzer.c \
	src/game/sa1/stage/enemies/boss_xtra_super_egg_robot.c \
	src/game/sa1/stage/enemies/oct.c \
	src/game/sa1/stage/enemies/boss_x1_egg_wrecker.c \
	src/game/sa1/stage/enemies/fireball.c \
	src/game/sa1/stage/enemies/pierrot.c \
	src/game/sa1/stage/enemies/kiki.c \
	src/game/sa1/stage/enemies/boss_2_egg_press.c \
	src/game/sa1/stage/enemies/boss_x3_egg_x.c \
	src/game/sa1/stage/enemies/mole.c \
	src/game/sa1/stage/enemies/boss_x2_egg_drillster.c \
	src/game/sa1/stage/enemies/senbon.c \
	src/game/sa1/stage/enemies/rhinotank.c \
	src/game/sa1/stage/enemies/mirror.c \
	src/game/sa1/stage/enemies/kuraa.c \
	src/game/sa1/stage/enemies/boss_5_mecha_knuckles.c \
	src/game/sa1/stage/enemies/boss_6_egg_snake.c \
	src/game/sa1/stage/enemies/yukimaru.c \
	src/game/sa1/stage/enemies/hanabii.c \
	src/game/sa1/stage/player_sonic.c \
	src/game/sa1/stage/player_amy.c \
	src/game/sa1/stage/player_knuckles.c \
	src/game/sa1/stage/player_tails.c \
  	src/game/sa1/stage/player_super_sonic.c \
	src/game/sa1/stage/mp_chao.c \
	src/game/sa1/stage/camera_destroy.c \
	src/game/sa1/stage/backgrounds/zone_5_init.c \
	src/game/sa1/stage/backgrounds/zone_4.c \
	src/game/sa1/stage/backgrounds/zone_3_firework.c \
	src/game/sa1/stage/backgrounds/zone_3.c \
	src/game/sa1/stage/backgrounds/zone_2_interior.c \
	src/game/sa1/stage/backgrounds/zone_7_act_2.c \
	src/game/sa1/stage/backgrounds/zone_4_init.c \
	src/game/sa1/stage/backgrounds/zone_2.c \
	src/game/sa1/stage/backgrounds/zone_6_hblank.c \
	src/game/sa1/stage/backgrounds/zone_6.c \
	src/game/sa1/stage/backgrounds/zone_7_act_1.c \
	src/game/sa1/stage/backgrounds/zone_1.c \
	src/game/sa1/stage/backgrounds/zone_7_act_2_init.c \
	src/game/sa1/stage/backgrounds/zone_5.c \
	src/game/sa1/stage/trapped_animals.c \
	src/game/sa1/stage/stage_ui_z.c \
	src/game/sa1/stage/stage_ui.c \
	src/game/sa1/stage/mystery_itembox.c \
	src/game/sa1/ui/intro_animation.c \

SA2_C_ASM_FILES := \
	src/rom_header.s \
	src/lib/m4a/m4a0.s \
	src/crt0.s \
	src/multi_sio_asm.s

SA2_C_SRCS = $(patsubst %.c,$(OBJ_DIR)/sa2/%.c,$(SA2_C_FILES))
SA2_C_OBJS = $(patsubst %.c,%.o,$(SA2_C_SRCS))

SA2_C_ASM_SRCS = $(patsubst %.s,$(OBJ_DIR)/sa2/%.s,$(SA2_C_ASM_FILES))
SA2_C_ASM_OBJS = $(patsubst %.s,%.o,$(SA2_C_ASM_SRCS))

DATA_ASM_SRCS := $(wildcard $(DATA_ASM_SUBDIR)/*.s)
DATA_ASM_OBJS := $(patsubst $(DATA_ASM_SUBDIR)/%.s,$(DATA_ASM_BUILDDIR)/%.o,$(DATA_ASM_SRCS))

SONG_SRCS := $(wildcard $(SONG_SUBDIR)/*.s)
SONG_OBJS := $(patsubst $(SONG_SUBDIR)/%.s,$(SONG_BUILDDIR)/%.o,$(SONG_SRCS))

MID_SRCS := $(wildcard $(MID_SUBDIR)/*.mid)
MID_OBJS := $(patsubst $(MID_SUBDIR)/%.mid,$(MID_BUILDDIR)/%.o,$(MID_SRCS))

SOUND_ASM_SRCS := $(wildcard $(SOUND_ASM_SUBDIR)/*.s)
SOUND_ASM_OBJS := $(patsubst $(SOUND_ASM_SUBDIR)/%.s,$(SOUND_ASM_BUILDDIR)/%.o,$(SOUND_ASM_SRCS))

OBJS := $(C_OBJS) $(ASM_OBJS) $(C_ASM_OBJS) $(DATA_ASM_OBJS) $(SONG_OBJS) $(SA2_C_OBJS) $(SA2_C_ASM_OBJS) $(MID_OBJS)
OBJS_REL := $(patsubst $(OBJ_DIR)/%,%,$(OBJS))

FORMAT_SRC_PATHS := $(shell find . -name "*.c" ! -path '*/src/data/*' ! -path '*/build/*' ! -path '*/ext/*')
FORMAT_H_PATHS   := $(shell find . -name "*.h" ! -path '*/build/*' ! -path '*/ext/*')

### COMPILER FLAGS ###

# -P disables line markers (don't EVER use this, if you want proper debug info!)
# -I sets an include path
# -D defines a symbol
CPPFLAGS ?= -D $(GAME_REGION) -D GAME=$(GAME)
CC1FLAGS ?= -Wimplicit -Wparentheses -Werror

ifneq ($(GAME_VARIANT), DEFAULT)
	CPPFLAGS += -D $(GAME_VARIANT)
endif

# These have to(?) be defined this way, because
# the C-preprocessor cannot resolve stuff like:
# #if (PLATFORM == gba), where PLATFORM is defined via -D.
ifeq ($(PLATFORM),gba)
	INCLUDE_SCANINC_ARGS += -I ../tools/agbcc/include
	CPPFLAGS += -D PLATFORM_GBA=1 -D PLATFORM_SDL=0 -D PLATFORM_WIN32=0 -D CPU_ARCH_X86=0 -D CPU_ARCH_ARM=1 -nostdinc -I ../tools/agbcc/include
	CC1FLAGS += -fhex-asm

ifeq ($(BUILD_NAME), sa1)
    # It seems this bug was introduced to GCC after SA1 released.
    PROLOGUE_FIX := -fprologue-bugfix
endif # BUILD_NAME == sa1

else
	CC1FLAGS += -Wstrict-overflow=1
	ifeq ($(PLATFORM),sdl)
		CC1FLAGS += -Wno-parentheses-equality -Wno-unused-value
		CPPFLAGS += -D TITLE_BAR=$(BUILD_NAME).$(PLATFORM) -D PLATFORM_GBA=0 -D PLATFORM_SDL=1 -D PLATFORM_WIN32=0 $(shell sdl2-config --cflags)
	else ifeq ($(PLATFORM),sdl_win32)
		CPPFLAGS += -D TITLE_BAR=$(BUILD_NAME).$(PLATFORM) -D PLATFORM_GBA=0 -D PLATFORM_SDL=1 -D PLATFORM_WIN32=0 $(SDL_MINGW_FLAGS)
	else ifeq ($(PLATFORM),win32)
		CPPFLAGS += -D TITLE_BAR=$(BUILD_NAME).$(PLATFORM) -D PLATFORM_GBA=0 -D PLATFORM_SDL=0 -D PLATFORM_WIN32=1
	endif

	ifeq ($(CPU_ARCH),i386)
        CPPFLAGS += -D CPU_ARCH_X86=1 -D CPU_ARCH_ARM=0

        # Use the more legible Intel dialect for x86, without underscores
        CC1FLAGS += -masm=intel
	else 
        CPPFLAGS += -D CPU_ARCH_X86=0 -D CPU_ARCH_ARM=0
	endif
endif

ifeq ($(PLATFORM),gba)
  ASFLAGS  += -mcpu=arm7tdmi -mthumb-interwork
  CC1FLAGS += -mthumb-interwork
else
  ifeq ($(PLATFORM), sdl)
    # for modern we are using a modern compiler
    # so instead of CPP we can use gcc -E to "preprocess only"
    CPP := $(CC1) -E
  endif
  # Allow file input through stdin on modern GCC and set it to "compile only"
  CC1FLAGS += -x c -S
endif

ifeq ($(DEBUG),1)
  CC1FLAGS += -g3 -O0
  CPPFLAGS += -D DEBUG=1
else
  CC1FLAGS += -O2
  CPPFLAGS += -D DEBUG=0
endif

ifeq ($(PORTABLE),1)
  CPPFLAGS += -D PORTABLE=1
else
  CPPFLAGS += -D PORTABLE=0
endif

ifeq ($(TAS_TESTING),1)
  CPPFLAGS += -D TAS_TESTING=1
else
  CPPFLAGS += -D TAS_TESTING=0
endif

ifeq ($(NON_MATCHING),1)
# TODO: We use "#if(n)def NON_MATCHING a lot, maybe we should switch to "#if (!)NON_MATCHING"
#    CPPFLAGS += -D NON_MATCHING=1
endif

ifeq ($(ENABLE_DECOMP_CREDITS),0)
  CPPFLAGS += -D ENABLE_DECOMP_CREDITS=0
else
  CPPFLAGS += -D ENABLE_DECOMP_CREDITS=1
endif

### LINKER FLAGS ###

# GBA
ifeq ($(PLATFORM),gba)
    MAP_FLAG := -Map
# Native
else ifeq ($(PLATFORM),sdl)
    ifeq ($(OS), Darwin)
        MAP_FLAG := -Wl,-map,
    else
        MAP_FLAG := -Xlinker -Map=
    endif
# Win32
else
    MAP_FLAG := -Xlinker -Map=
endif

# Libs
ifeq ($(PLATFORM),gba)
    LIBS := $(ROOT_DIR)/../tools/agbcc/lib/libgcc.a $(ROOT_DIR)/../tools/agbcc/lib/libc.a $(LIBABGSYSCALL_LIBS)
else ifeq ($(PLATFORM),sdl)
    LIBS := $(shell sdl2-config --cflags --libs)
else ifeq ($(PLATFORM),sdl_win32)
    LIBS := -mwin32 -lkernel32 -lwinmm -lmingw32 -lxinput $(SDL_MINGW_LIBS)
else ifeq ($(PLATFORM), win32)
    LIBS := -mwin32 -lkernel32 -lwinmm -lgdi32 -lxinput -lopengl32 $(LIBABGSYSCALL_LIBS)
endif

#### MAIN TARGETS ####

# these commands will run regardless of deps being completed
.PHONY: clean tools tidy clean-tools $(TOOLDIRS) libagbsyscall

# Ensure required directories exist
$(shell mkdir -p $(C_BUILDDIR) $(ASM_BUILDDIR) $(DATA_ASM_BUILDDIR) $(SOUND_ASM_BUILDDIR) $(SONG_BUILDDIR) $(MID_BUILDDIR))

# a special command which ensures that stdout and stderr
# get printed instead of output into the makefile
infoshell = $(foreach line, $(shell $1 | sed "s/ /__SPACE__/g"), $(info $(subst __SPACE__, ,$(line))))

# Build tools when building the rom
# Disable dependency scanning for clean/tidy/tools
ifeq (,$(filter-out all rom compare libagbsyscall,$(MAKECMDGOALS)))
# if we are doing any of these things, build tools first
$(call infoshell, $(MAKE) tools)
# ensure that tools did build
MAKE_TOOLS_OUTCOME=$(shell $(MAKE) tools > /dev/null 2>&1 && echo 0 || echo 1)
ifneq ($(MAKE_TOOLS_OUTCOME),0)
  $(error Make tools command failed!)
endif
else
NODEP ?= 1
endif

# When not building tools, we should specify this
ifneq ($(NODEP),1)
# MacOS refuses to link the songs data because some pointers
# are not aligned. The music player code reads pointers from raw
# bytes, so they don't need to be aligned. But this is a simple
# work around which tells the compiler not to care. Once we are
# compiling the songs to C, we can cast the pointers to integers
# which means the linker will not notice.
#
# TODO: compile songs to C so that we can work around this.
export MACOSX_DEPLOYMENT_TARGET := 11
endif

ifeq ($(PLATFORM),gba)
# Use the old compiler for m4a, as it was prebuilt and statically linked to the original codebase
# PROLOGUE_FIX has to be set to nothing, since -fprologue-bugfix does not work with oldagbcc
$(OBJ_DIR)/sa2/src/lib/m4a/m4a.o: CC1 := $(CC1_OLD)
$(OBJ_DIR)/sa2/src/lib/m4a/m4a.o: PROLOGUE_FIX :=
# Use `-O1` for agb_flash libs, as these were also prebuilt
$(OBJ_DIR)/sa2/src/lib/agb_flash/agb_flash.o:  CC1FLAGS := -O1 -mthumb-interwork -Werror
$(OBJ_DIR)/sa2/src/lib/agb_flash/agb_flash%.o: CC1FLAGS := -O1 -mthumb-interwork -Werror
endif

#### Main Targets ####

ifeq ($(PLATFORM),gba)
all: compare

compare: rom
	$(SHA1) $(BUILD_NAME).sha1
else
all: rom
endif

rom: $(ROM)

tools: $(TOOLDIRS)

tool_libs:
	@$(MAKE) -C ../tools/_shared

clean: tidy clean-tools
	@$(MAKE) clean -C ../tools/BriBaSA_ex
#	@$(MAKE) clean -C chao_garden
#	@$(MAKE) clean -C multi_boot/subgame_bootstrap
#	@$(MAKE) clean -C multi_boot/programs/subgame_loader
#	@$(MAKE) clean -C multi_boot/collect_rings
	@$(MAKE) clean -C ../libagbsyscall PLATFORM=$(PLATFORM) CPU_ARCH=$(CPU_ARCH)

	$(RM) $(SAMPLE_SUBDIR)/*.bin $(MID_SUBDIR)/*.s
	find . \( -iwholename './data/*/maps/*/*/entities/*.bin' -o -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.rl' -o -iname '*.latfont' -o -iname '*.hwjpnfont' -o -iname '*.fwjpnfont' \) -exec $(RM) {} +

clean-tools:
	@$(foreach tooldir,$(TOOLDIRS),$(MAKE) clean -C $(tooldir);)

tidy:
	$(RM) -r build/*
	#$(RM) SDL2.dll
	$(RM) $(BUILD_NAME)*.exe $(BUILD_NAME)*.elf $(BUILD_NAME)*.map $(BUILD_NAME)*.sdl $(BUILD_NAME)*.gba

japan: ; @$(MAKE) GAME_REGION=JAPAN

europe: ; @$(MAKE) GAME_REGION=EUROPE

sdl: ; @$(MAKE) PLATFORM=sdl

sdl_win32:
	@$(MAKE) PLATFORM=sdl_win32 CPU_ARCH=i386

win32: ; @$(MAKE) PLATFORM=win32 CPU_ARCH=i386

#### RECIPES ####

include songs.mk
include ../graphics.mk

%.png: ;
%.pal: ;

%.1bpp: %.png  ; $(GFX) $< $@
%.4bpp: %.png  ; $(GFX) $< $@
%.8bpp: %.png  ; $(GFX) $< $@
%.gbapal: %.pal ; $(GFX) $< $@
%.gbapal: %.png ; $(GFX) $< $@

chao_garden/mb_chao_garden.gba.lz: chao_garden/mb_chao_garden.gba 
	$(GFX) $< $@ -search 1
    
data/sa1/mb_chao_garden_japan.gba.lz: data/sa1/mb_chao_garden_japan.gba
	$(GFX) $< $@ -search 1

%interactables.bin: %interactables.csv
	$(ENT_POS) $< $@ -entities INTERACTABLES -header "../include/constants/sa1/interactables.h"

%itemboxes.bin: %itemboxes.csv
	$(ENT_POS) $< $@ -entities ITEMS -header "../include/constants/sa1/items.h"

%enemies.bin: %enemies.csv
	$(ENT_POS) $< $@ -entities ENEMIES -header "../include/constants/sa1/enemies.h"

%rings.bin: %rings.csv
	$(ENT_POS) $< $@ -entities RINGS

%.gba.lz: %.gba 
	$(GFX) $< $@
%.bin.lz: %.bin 
	$(GFX) $< $@

%.lz: % ; $(GFX) $< $@
%.rl: % ; $(GFX) $< $@

%.bin: %.aif ; $(AIF) $< $@

$(ELF): $(OBJS) libagbsyscall
ifeq ($(PLATFORM),gba)
	@echo "$(LD) -T $(LDSCRIPT) $(MAP_FLAG) $(MAP) <objects> <lib> -o $@"
	@$(CPP) -P $(CPPFLAGS) $(LDSCRIPT) > $(OBJ_DIR)/$(LDSCRIPT)
	@cd $(OBJ_DIR) && $(LD) -T $(LDSCRIPT) $(MAP_FLAG) $(ROOT_DIR)/$(MAP) $(OBJS_REL) $(LIBS) -o $(ROOT_DIR)/$@
else
	@echo "$(CC1) $(MAP_FLAG)$(MAP) <objects> <lib> -o $@"
	@touch $(ROOT_DIR)/$(MAP)
	@cd $(OBJ_DIR) && $(CC1) $(MAP_FLAG)$(ROOT_DIR)/$(MAP) $(OBJS_REL) $(LIBS) -o $(ROOT_DIR)/$@
endif

$(ROM): $(ELF)
ifeq ($(PLATFORM),gba)
	$(OBJCOPY) -O binary --pad-to 0x8400000 $< $@
	$(FIX) $@ -p -t"$(TITLE)" -c$(GAME_CODE) -m$(MAKER_CODE) -r$(GAME_REVISION) --silent
else ifeq ($(PLATFORM),sdl)
	cp $< $@
else
	$(OBJCOPY) -O pei-x86-64 $< $@
endif

# Copy files from SA2
$(OBJ_DIR)/sa2/%.c: ../%.c
	$(shell mkdir -p $(shell dirname '$@'))
	cp $< $@

$(OBJ_DIR)/sa2/%.s: ../%.s
	$(shell mkdir -p $(shell dirname '$@'))
	cp $< $@

# TODO: remove once we are building sources from the same makefile
# Build C and ASM sources from SA2
$(OBJ_DIR)/sa2/%.o: $(OBJ_DIR)/sa2/%.c
	@echo "$(CC1) <flags> -o $@ $<"
	@$(shell mkdir -p $(shell dirname '$(OBJ_DIR)/sa2/$*.i'))
	@$(CPP) $(CPPFLAGS) $(SA2_INCLUDE_CPP_ARGS) $< -o $(OBJ_DIR)/sa2/$*.i
	@$(PREPROC) $(OBJ_DIR)/sa2/$*.i $(PLATFORM) "" | $(CC1) $(PROLOGUE_FIX) $(CC1FLAGS) -o $(OBJ_DIR)/sa2/$*.s -
	@printf ".text\n\t.align\t2, 0\n" >> $(OBJ_DIR)/sa2/$*.s
	@$(AS) $(ASFLAGS) $(OBJ_DIR)/sa2/$*.s -o $@

$(OBJ_DIR)/sa2/%.d: $(OBJ_DIR)/sa2/%.c
	@$(shell mkdir -p $(shell dirname '$(OBJ_DIR)/sa2/$*.d'))
	$(SCANINC) -M $@ $(SA2_INCLUDE_SCANINC_ARGS) $<

$(OBJ_DIR)/sa2/%.o: $(OBJ_DIR)/sa2/%.s
	@echo "$(AS) <flags> -o $@ $<"
	@$(shell mkdir -p $(shell dirname '$(OBJ_DIR)/$*.s'))
	@$(AS) $(ASFLAGS) -o $@ $<

# Build c sources, and ensure alignment
$(C_BUILDDIR)/%.o: $(C_SUBDIR)/%.c
	@echo "$(CC1) <flags> -o $@ $<"
	@$(shell mkdir -p $(shell dirname '$(C_BUILDDIR)/$*.i'))
	@$(CPP) $(CPPFLAGS) $(INCLUDE_CPP_ARGS) $(SA2_INCLUDE_CPP_ARGS) $< -o $(C_BUILDDIR)/$*.i
	@$(PREPROC) $(C_BUILDDIR)/$*.i $(PLATFORM) "" | $(CC1) $(PROLOGUE_FIX) $(CC1FLAGS) -o $(C_BUILDDIR)/$*.s -
ifeq ($(PLATFORM), gba)
	@printf ".text\n\t.align\t2, 0\n" >> $(C_BUILDDIR)/$*.s
endif
	@$(AS) $(ASFLAGS) $(C_BUILDDIR)/$*.s -o $@

# Scan the src dependencies to determine if any dependent files have changed
$(C_BUILDDIR)/%.d: $(C_SUBDIR)/%.c
	@$(shell mkdir -p $(shell dirname '$(C_BUILDDIR)/$*.d'))
	$(SCANINC) -M $@ $(INCLUDE_SCANINC_ARGS) $<

# rule for sources from the src dir (parts of libraries)
$(C_BUILDDIR)/%.o: $(C_SUBDIR)/%.s
	@echo "$(AS) <flags> -o $@ $<"
	@$(shell mkdir -p $(shell dirname '$(C_BUILDDIR)/$*.s'))
	@$(AS) $(ASFLAGS) -o $@ $<

$(DATA_ASM_BUILDDIR)/%.o: $(DATA_ASM_SUBDIR)/%.s
	@echo "$(AS) <flags> -o $@ $<"
	@$(PREPROC) $< $(PLATFORM) "" | $(CPP) $(CPPFLAGS) $(INCLUDE_CPP_ARGS) - | $(AS) $(ASFLAGS) -o $@ -

# Scan the ASM data dependencies to determine if any .inc files have changed
$(DATA_ASM_BUILDDIR)/%.d: $(DATA_ASM_SUBDIR)/%.s
	$(SCANINC) -M $@ $(INCLUDE_SCANINC_ARGS) $<
    
ifneq ($(NODEP),1)
-include $(addprefix $(OBJ_DIR)/,$(C_SRCS:.c=.d))
-include $(SA2_C_SRCS:.c=.d)
-include $(addprefix $(OBJ_DIR)/,$(DATA_ASM_SRCS:.s=.d))
endif

$(SONG_BUILDDIR)/%.o: $(SONG_SUBDIR)/%.s
	@echo "$(AS) <flags> -o $@ $<"
	@$(PREPROC) $< $(PLATFORM) "" | $(CPP) $(CPPFLAGS) $(INCLUDE_CPP_ARGS) - | $(AS) $(ASFLAGS) -o $@ -

### SUB-PROGRAMS ###

chao_garden/mb_chao_garden.gba: 
ifeq ($(PLATFORM), gba)
	@$(MAKE) -C chao_garden DEBUG=0
else
	@echo "Not building on the chao garden rom, as platform is $(PLATFORM)"
	@printf "1" > chao_garden/mb_chao_garden.gba
endif

chao_garden: tools
	@$(MAKE) -C chao_garden DEBUG=0
    
# Dependency here is already explicit, but we sometimes get a race condition if this
# is not specified
multi_boot/subgame_bootstrap/subgame_bootstrap.gba: multi_boot/programs/subgame_loader/subgame_loader.bin
ifeq ($(PLATFORM), gba)
	@$(MAKE) -C multi_boot/subgame_bootstrap DEBUG=0
else
	@echo "Not building on the subgame bootstrap rom, as platform is $(PLATFORM)" 
	@printf "1" > multi_boot/subgame_bootstrap/subgame_bootstrap.gba
endif

multi_boot/programs/subgame_loader/subgame_loader.bin:
ifeq ($(PLATFORM), gba)
	@$(MAKE) -C multi_boot/programs/subgame_loader DEBUG=0
else
	@echo "Not building on the subgame loader rom, as platform is $(PLATFORM)" 
	@printf "1" > multi_boot/programs/subgame_loader/subgame_loader.bin
endif

multi_boot/collect_rings/mb_signed_collect_rings.gba:
ifeq ($(PLATFORM), gba)
	@$(MAKE) -C multi_boot/collect_rings DEBUG=0
else
	@echo "Not building on the collect the rings rom, as platform is $(PLATFORM)" 
	@printf "1" > multi_boot/collect_rings/mb_signed_collect_rings.gba
endif

subgame_bootstrap: tools
	@$(MAKE) -C multi_boot/subgame_bootstrap DEBUG=0

subgame_loader: tools
	@$(MAKE) -C multi_boot/programs/subgame_loader DEBUG=0

collect_rings: tools
	@$(MAKE) -C multi_boot/collect_rings DEBUG=0

libagbsyscall:
	@$(MAKE) -C ../libagbsyscall MODERN=0 PLATFORM=$(PLATFORM) CPU_ARCH=$(CPU_ARCH)

bribasa:
	@$(MAKE) -C tools/BriBaSA_ex

$(TOOLDIRS): tool_libs
	@$(MAKE) -C $@
    
### DEPS INSTALL COMMANDS ###

$(SDL_MINGW_LIB):
	@mkdir -p ext
	cd ext && wget -qO- https://github.com/libsdl-org/SDL/releases/download/release-2.30.3/SDL2-devel-2.30.3-mingw.zip | bsdtar -xvf-

SDL2.dll: $(SDL_MINGW_LIB)
	cp $(SDL_MINGW_SDL_DLL) SDL2.dll

### FORMATTER ###

format:
	@echo $(FORMAT) -i -style=file "**/*.c" "**/*.h"
	@$(FORMAT) -i --verbose -style=file $(FORMAT_SRC_PATHS) $(FORMAT_H_PATHS)

check_format:
	@echo $(FORMAT) -i -style=file --dry-run --Werror "**/*.c" "**/*.h"
	@$(FORMAT) -i --verbose -style=file --dry-run --Werror $(FORMAT_SRC_PATHS) $(FORMAT_H_PATHS)


### DECOMP TOOLS ###

CONTEXT_FLAGS := -DM2C -DPLATFORM_GBA=1 -DGEN_CTX=1 -Dsize_t=int -D "offsetof(TYPE, MEMBER)"="((size_t)&((TYPE *)0)->MEMBER)"

ctx.c: $(C_HEADERS)
	@for header in $(C_HEADERS); do echo "#include \"$$header\""; done > ctx.h
	gcc -P -E -dD -undef -I ./tools/agbcc/include -I include $(CONTEXT_FLAGS) ctx.h | sed '/^\/\/ TODO: Remove M2C occurences EVERYWHERE once ctx is not needed anymore!/d' | sed '/#undef/d' | sed '/typedef unsigned long int int;/d' | sed 's/__attribute__((.*))//' | sed '/^#define __STDC/d' > ctx.c
