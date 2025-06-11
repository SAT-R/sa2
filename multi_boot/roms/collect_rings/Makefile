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

include config.mk

ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

#### Tools ####
SHELL     := /bin/bash -o pipefail
SHA1 	  := $(shell { command -v sha1sum || command -v shasum; } 2>/dev/null) -c

CC1       := ../../../tools/agbcc/bin/agbcc$(EXE)
CC1_OLD   := ../../../tools/agbcc/bin/old_agbcc$(EXE)

LD        := $(PREFIX)ld
OBJCOPY   := $(PREFIX)objcopy
AS 		  := $(PREFIX)as

GFX 	  := ../../../tools/gbagfx/gbagfx$(EXE)
AIF		  := ../../../tools/aif2pcm/aif2pcm$(EXE)
SCANINC   := ../../../tools/scaninc/scaninc$(EXE)
PREPROC	  := ../../../tools/preproc/preproc$(EXE)
RAMSCRGEN := ../../../tools/ramscrgen/ramscrgen$(EXE)
FIX 	  := ../../../tools/gbafix/gbafix$(EXE)

ASFLAGS  := -mcpu=arm7tdmi -mthumb-interwork --defsym $(GAME_REGION)=1


# Clear the default suffixes
.SUFFIXES:
# Don't delete intermediate files
.SECONDARY:
# Delete files that weren't built properly
.DELETE_ON_ERROR:

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

#### Files ####
OBJ_DIR:= build/collect_rings
ROM      := collect_rings.gba
ELF      := $(ROM:.gba=.elf)
MAP      := $(ROM:.gba=.map)
LDSCRIPT := ldscript.txt

INCLUDE_DIRS = include ../../../include
INCLUDE_CPP_ARGS := $(INCLUDE_DIRS:%=-iquote %)
INCLUDE_SCANINC_ARGS := $(INCLUDE_DIRS:%=-I %)

SA2_INCLUDE_DIRS = ../../../include
SA2_INCLUDE_CPP_ARGS := $(SA2_INCLUDE_DIRS:%=-iquote %)

ASM_SUBDIR = asm
ASM_BUILDDIR = $(OBJ_DIR)/$(ASM_SUBDIR)

DATA_ASM_SUBDIR = data
DATA_ASM_BUILDDIR = $(OBJ_DIR)/$(DATA_ASM_SUBDIR)

C_SUBDIR = src
C_BUILDDIR = $(OBJ_DIR)/$(C_SUBDIR)

$(shell mkdir -p $(C_BUILDDIR) $(ASM_BUILDDIR) $(DATA_ASM_BUILDDIR))

ifneq (,$(filter-out all rom compare libagbsyscall,$(MAKECMDGOALS)))
NODEP ?= 1
endif

# Moves any relevant sa2 c files to the build dir
SA2_C_FILES := \
	sa2/lib/m4a/m4a.c \
	sa2/lib/m4a/m4a_tables.c \
	sa2/multi_sio.c \
	sa2/sio32_multi_load.c \
	sa2/core.c \
	sa2/main.c \
	sa2/task.c \
	sa2/background.c \
	sa2/trig.c \
	sa2/sprite.c \
	sa2/malloc_vram.c \
	sa2/bg_triangles.c \
	sa2/game/multiplayer/multiplayer_event_mgr.c \
	sa2/game/multiplayer/multiplayer_event_recv_mgr.c \
	sa2/game/multiboot/collect_rings/results.c \
	sa2/game/sa1_sa2_shared/entities_manager.c \
	sa2/game/sa1_sa2_shared/collision.c \
	sa2/game/mystery_item_box.c \
	sa2/game/sa1_sa2_shared/rings_manager.c \
	sa2/game/multiboot/collect_rings/time_display.c \
	sa2/game/multiplayer/indicators.c \
	sa2/game/multiplayer/mp_player.c \
	sa2/game/multiplayer/finish.c \
	sa2/game/interactables_1/toggle_player_layer.c \
	sa2/game/sa1_sa2_shared/interactables/spring.c \
	sa2/game/sa1_sa2_shared/interactables/ramp.c \
	sa2/game/interactables_1/spikes.c \
	sa2/game/sa1_sa2_shared/interactables/grind_rail.c \
	sa2/game/interactables_2/multiplayer_teleport.c \
	sa2/game/sa1_sa2_shared/dust_cloud.c \
	sa2/game/sa1_sa2_shared/collect_ring_effect.c \
	sa2/game/multiplayer/mp_attack_2_effect.c \
	sa2/game/stage/camera.c \
	sa2/game/stage/terrain_collision.c \
	sa2/game/stage/player.c \
	sa2/game/stage/rings_scatter.c \
	sa2/game/stage/player_controls.c \
	sa2/game/stage/stage.c

SA2_C_ASM_FILES := \
	sa2/lib/m4a/m4a0.s \
	sa2/crt0.s \
	sa2/multi_sio_asm.s

SA2_C_SRCS = $(patsubst sa2/%.c,$(C_BUILDDIR)/sa2/%.c,$(SA2_C_FILES))
SA2_C_OBJS = $(patsubst %.c,%.o,$(SA2_C_SRCS))

C_SRCS := $(shell find $(C_SUBDIR) -name "*.c" -not -path "*/platform/*")
C_OBJS := $(patsubst $(C_SUBDIR)/%.c,$(C_BUILDDIR)/%.o,$(C_SRCS))

SA2_C_ASM_SRCS = $(patsubst sa2/%.s,$(C_BUILDDIR)/sa2/%.s,$(SA2_C_ASM_FILES))
SA2_C_ASM_OBJS = $(patsubst %.s,%.o,$(SA2_C_ASM_SRCS))

C_ASM_SRCS := $(shell find $(C_SUBDIR) -name "*.s")
C_ASM_OBJS := $(patsubst $(C_SUBDIR)/%.s,$(C_BUILDDIR)/%.o,$(C_ASM_SRCS))

ASM_SRCS := $(wildcard $(ASM_SUBDIR)/*.s)
ASM_OBJS := $(patsubst $(ASM_SUBDIR)/%.s,$(ASM_BUILDDIR)/%.o,$(ASM_SRCS))

DATA_ASM_SRCS := $(wildcard $(DATA_ASM_SUBDIR)/*.s)
DATA_ASM_OBJS := $(patsubst $(DATA_ASM_SUBDIR)/%.s,$(DATA_ASM_BUILDDIR)/%.o,$(DATA_ASM_SRCS))

OBJS := $(ASM_OBJS) $(DATA_ASM_OBJS) $(C_ASM_OBJS) $(C_OBJS) $(SA2_C_OBJS) $(SA2_C_ASM_OBJS)
OBJS_REL := $(patsubst $(OBJ_DIR)/%,%,$(OBJS))


### COMPILER FLAGS ###

# -P disables line markers (don't EVER use this, if you want proper debug info!)
# -I sets an include path
# -D defines a symbol
CPPFLAGS ?= -D $(GAME_REGION) -D COLLECT_RINGS_ROM
CC1FLAGS ?= -Wimplicit -Wparentheses -Werror

INCLUDE_SCANINC_ARGS += -I ../../../tools/agbcc/include
CPPFLAGS += -D PLATFORM_GBA=1 -D PLATFORM_SDL=0 -D PLATFORM_WIN32=0 -D CPU_ARCH_X86=0 -D CPU_ARCH_ARM=1 -nostdinc -I ../../../tools/agbcc/include
CC1FLAGS += -fhex-asm

ifeq ($(BUILD_NAME), sa1)
    # It seems this bug was introduced to GCC after SA1 released.
    PROLOGUE_FIX := -fprologue-bugfix
endif # BUILD_NAME == sa1

ASFLAGS  += -mcpu=arm7tdmi -mthumb-interwork
CC1FLAGS += -mthumb-interwork


ifeq ($(DEBUG),1)
  CC1FLAGS += -g3 -O0
  CPPFLAGS += -D DEBUG=1
else
  CC1FLAGS += -O2
  CPPFLAGS += -D DEBUG=0
endif


ifeq ($(NON_MATCHING),1)
# TODO: We use "#if(n)def NON_MATCHING a lot, maybe we should switch to "#if (!)NON_MATCHING"
#    CPPFLAGS += -D NON_MATCHING=1
endif

### LINKER FLAGS ###

# GBA
MAP_FLAG := -Map

# Libs
# LIBS := $(ROOT_DIR)/tools/agbcc/lib/libgcc.a $(ROOT_DIR)/tools/agbcc/lib/libc.a $(LIBABGSYSCALL_LIBS)

$(C_BUILDDIR)/sa2/lib/m4a/m4a.o: CC1 := $(CC1_OLD)

#### Main Targets ####

MAKEFLAGS += --no-print-directory

compare: $(ROM)
	$(SHA1) $(BUILD_NAME).sha1

clean: tidy
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -iname 'graphics/*.pal' -o -iname '*.lz' -o -iname '*.rl' -o -iname '*.latfont' -o -iname '*.hwjpnfont' -o -iname '*.fwjpnfont' \) -exec $(RM) {} +
	@$(MAKE) clean -C ../../../libagbsyscall

tidy:
	$(RM) -f $(ROM) $(ELF) $(MAP)
	$(RM) -r build/*

#### Recipes ####

%.pal:
	$(shell mkdir -p $(shell dirname '$@'))
	cp ../../../$@ $@;

%.gbapal: %.pal ; $(GFX) $< $@
%.gbapal: %.png ; $(GFX) $< $@

$(ELF): $(OBJS) $(LDSCRIPT) libagbsyscall
	@echo "$(LD) -T $(LD_SCRIPT) -Map $(MAP) <objects> <lib>"
	@$(LD) -T $(LDSCRIPT) -Map $(MAP) $(OBJS) ../../../tools/agbcc/lib/libgcc.a ../../../tools/agbcc/lib/libc.a -L../../../libagbsyscall -lagbsyscall -o $@

%.gba: %.elf
	$(OBJCOPY) -O binary $< $@
	$(FIX) $@ -t"$(TITLE)" -c$(GAME_CODE) -m$(MAKER_CODE) -r$(GAME_REVISION) --silent

# Copy asm and C files from SA2
$(C_BUILDDIR)/sa2/%.c: ../../../src/%.c
	$(shell mkdir -p $(shell dirname '$@'))
	cp $< $@

$(C_BUILDDIR)/sa2/%.s: ../../../src/%.s
	$(shell mkdir -p $(shell dirname '$@'))
	cp $< $@

# Build C and ASM sources from SA2
$(C_BUILDDIR)/sa2/%.o: $(C_BUILDDIR)/sa2/%.c
	@echo "$(CC1) <flags> -o $@ $<"
	@$(shell mkdir -p $(shell dirname '$(C_BUILDDIR)/sa2/$*.i'))
	@$(CPP) $(CPPFLAGS) $(SA2_INCLUDE_CPP_ARGS) $< -o $(C_BUILDDIR)/sa2/$*.i
	@$(PREPROC) $(C_BUILDDIR)/sa2/$*.i | $(CC1) $(PROLOGUE_FIX) $(CC1FLAGS) -o $(C_BUILDDIR)/sa2/$*.s -
	@printf ".text\n\t.align\t2, 0\n" >> $(C_BUILDDIR)/sa2/$*.s
	@$(AS) $(ASFLAGS) -I ../../../ $(C_BUILDDIR)/sa2/$*.s -o $@

$(C_BUILDDIR)/sa2/%.d: $(C_BUILDDIR)/sa2/%.c
	@$(shell mkdir -p $(shell dirname '$(C_BUILDDIR)/sa2/$*.d'))
	$(SCANINC) -M $@ $(INCLUDE_SCANINC_ARGS) $<

$(C_BUILDDIR)/sa2/%.o: $(C_BUILDDIR)/sa2/%.s
	@echo "$(AS) <flags> -o $@ $<"
	@$(AS) $(ASFLAGS) -I ../../../ -o $@ $<

# Build c sources, and ensure alignment
$(C_BUILDDIR)/%.o: $(C_SUBDIR)/%.c
	@echo "$(CC1) <flags> -o $@ $<"
	@$(shell mkdir -p $(shell dirname '$(C_BUILDDIR)/$*.i'))
	@$(CPP) $(CPPFLAGS) $(INCLUDE_CPP_ARGS) $< -o $(C_BUILDDIR)/$*.i
	@$(PREPROC) $(C_BUILDDIR)/$*.i | $(CC1) $(PROLOGUE_FIX) $(CC1FLAGS) -o $(C_BUILDDIR)/$*.s -
	@printf ".text\n\t.align\t2, 0\n" >> $(C_BUILDDIR)/$*.s
	@$(AS) $(ASFLAGS) $(C_BUILDDIR)/$*.s -o $@

# Scan the src dependencies to determine if any dependent files have changed
$(C_BUILDDIR)/%.d: $(C_SUBDIR)/%.c
	@$(shell mkdir -p $(shell dirname '$(C_BUILDDIR)/$*.d'))
	$(SCANINC) -M $@ $(INCLUDE_SCANINC_ARGS) $<

# rule for sources from the src dir (parts of libraries)
$(C_BUILDDIR)/%.o: $(C_SUBDIR)/%.s
	@echo "$(AS) <flags> -o $@ $<"
	@$(AS) $(ASFLAGS) -o $@ $<

$(ASM_BUILDDIR)/%.o: $(ASM_SUBDIR)/%.s
	@echo "$(AS) <flags> -o $@ $<"
	@$(AS) $(ASFLAGS) -o $@ $<

$(DATA_ASM_BUILDDIR)/%.o: $(DATA_ASM_SUBDIR)/%.s
	@echo "$(AS) <flags> -o $@ $<"
	@$(PREPROC) $< "" | $(CPP) $(CPPFLAGS) - | $(AS) $(ASFLAGS) -o $@ -

# Scan the ASM data dependencies to determine if any .inc files have changed
$(DATA_ASM_BUILDDIR)/%.d: $(DATA_ASM_SUBDIR)/%.s
	$(SCANINC) -M $@ $(INCLUDE_SCANINC_ARGS) $<
    
ifneq ($(NODEP),1)
-include $(SA2_C_SRCS:.c=.d)
-include $(addprefix $(OBJ_DIR)/,$(C_SRCS:.c=.d))
-include $(addprefix $(OBJ_DIR)/,$(DATA_ASM_SRCS:.s=.d))
endif

libagbsyscall:
	@$(MAKE) -C ../../../libagbsyscall MODERN=0 PLATFORM=gba CPU_ARCH=arm
