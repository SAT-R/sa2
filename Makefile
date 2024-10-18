#
# NOTE: Overrideable default flags are set in config.mk
#
include config.mk

ROOT_DIR := $(realpath $(dir $(realpath $(lastword $(MAKEFILE_LIST)))))

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
else ifeq ($(CPU_ARCH),i386)
  ifeq ($(PLATFORM),sdl_win32)
    TOOLCHAIN := /usr/i686-w64-mingw32/
    PREFIX := i686-w64-mingw32-
  else ifeq ($(PLATFORM),win32)
    TOOLCHAIN := /usr/i686-w64-mingw32/
    PREFIX := i686-w64-mingw32-
  endif
else
  ifneq ($(PLATFORM),sdl)
    $(error Unsupported CPU arch for platform '$(CPU_ARCH)', '$(PLATFORM)')
  endif
endif # (PLATFORM == gba)


ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

#### Tools ####
SHELL     := /bin/bash -o pipefail
SHA1 	  := $(shell { command -v sha1sum || command -v shasum; } 2>/dev/null) -c

ifeq ($(PLATFORM),gba)
CC1       := tools/agbcc/bin/agbcc$(EXE)
CC1_OLD   := tools/agbcc/bin/old_agbcc$(EXE)
else
CC1       := $(PREFIX)gcc$(EXE)
CC1_OLD   := $(CC1)
endif

CPP       := $(PREFIX)cpp
LD        := $(PREFIX)ld
OBJCOPY   := $(PREFIX)objcopy
AS 		  := $(PREFIX)as

FORMAT    := clang-format-13

GFX 	  := tools/gbagfx/gbagfx$(EXE)
EPOS 	  := tools/entity_positions/epos$(EXE)
AIF		  := tools/aif2pcm/aif2pcm$(EXE)
MID2AGB   := tools/mid2agb/mid2agb$(EXE)
SCANINC   := tools/scaninc/scaninc$(EXE)
PREPROC	  := tools/preproc/preproc$(EXE)
RAMSCRGEN := tools/ramscrgen/ramscrgen$(EXE)
FIX 	  := tools/gbafix/gbafix$(EXE)
ifeq ($(CREATE_PDB),1)
CV2PDB    := ./cv2pdb.exe
endif

TOOLDIRS := $(filter-out tools/Makefile tools/agbcc tools/binutils,$(wildcard tools/*))
TOOLBASE = $(TOOLDIRS:tools/%=%)
TOOLS = $(foreach tool,$(TOOLBASE),tools/$(tool)/$(tool)$(EXE))

# -P disables line markers (don't EVER use this, if you want proper debug info!)
# -I sets an include path
# -D defines a symbol
CPPFLAGS ?= -iquote include -D $(GAME_REGION)
CC1FLAGS ?= -Wimplicit -Wparentheses -Werror

SDL_MINGW_PKG          :=  ext/SDL2-2.30.3/i686-w64-mingw32
SDL_MINGW_INCLUDE      := $(SDL_MINGW_PKG)/include/SDL2
SDL_MINGW_BIN          := $(SDL_MINGW_PKG)/bin
SDL_MINGW_SDL_DLL      := $(SDL_MINGW_PKG)/bin/SDL2.dll
SDL_MINGW_LIB          := $(SDL_MINGW_PKG)/lib
SDL_MINGW_LINKER_FLAGS := -L$(SDL_MINGW_LIB) -lSDL2main -lSDL2.dll
SDL_MINGW_FLAGS        := -I$(SDL_MINGW_INCLUDE) -D_THREAD_SAFE

# These have to(?) be defined this way, because
# the C-preprocessor cannot resolve stuff like:
# #if (PLATFORM == gba), where PLATFORM is defined via -D.
ifeq ($(PLATFORM),gba)
	CPPFLAGS += -D PLATFORM_GBA=1 -D PLATFORM_SDL=0 -D PLATFORM_WIN32=0 -D CPU_ARCH_X86=0 -D CPU_ARCH_ARM=1 -nostdinc -I tools/agbcc/include
	CC1FLAGS += -fhex-asm
else 
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
  ifeq ($(THUMB_SUPPORT),1)
    ASFLAGS  += -mthumb-interwork
    CC1FLAGS += -mthumb-interwork
  endif
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
endif

ifeq ($(PORTABLE),1)
  CPPFLAGS += -D PORTABLE=1
else
  CPPFLAGS += -D PORTABLE=0
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


# Clear the default suffixes
.SUFFIXES:
# Don't delete intermediate files
.SECONDARY:
# Delete files that weren't built properly
.DELETE_ON_ERROR:

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

# these commands will run regardless of deps being completed
.PHONY: clean tools clean-tools $(TOOLDIRS) libagbsyscall

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

#### Files ####
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

ASM_SUBDIR = asm

ifeq ($(CPU_ARCH),arm)
ASM_BUILDDIR = $(OBJ_DIR)/$(ASM_SUBDIR)
else
ASM_BUILDDIR =
endif

C_SUBDIR = src
C_BUILDDIR = $(OBJ_DIR)/$(C_SUBDIR)

DATA_ASM_SUBDIR = data
DATA_ASM_BUILDDIR = $(OBJ_DIR)/$(DATA_ASM_SUBDIR)

SONG_SUBDIR = sound/songs
SONG_BUILDDIR = $(OBJ_DIR)/$(SONG_SUBDIR)

SOUND_ASM_SUBDIR = sound
SOUND_ASM_BUILDDIR = $(OBJ_DIR)/$(SOUND_ASM_SUBDIR)

MID_SUBDIR = sound/songs/midi
MID_BUILDDIR = $(OBJ_DIR)/$(MID_SUBDIR)

SAMPLE_SUBDIR = sound/direct_sound_samples

OBJ_TILES_4BPP_SUBDIR = graphics/obj_tiles/4bpp
TILESETS_SUBDIR = graphics/tilesets/


$(shell mkdir -p $(C_BUILDDIR) $(ASM_BUILDDIR) $(DATA_ASM_BUILDDIR) $(SOUND_ASM_BUILDDIR) $(SONG_BUILDDIR) $(MID_BUILDDIR))

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

ifeq ($(PLATFORM),gba)
C_ASM_SRCS := $(shell find $(C_SUBDIR) -name "*.s")
C_ASM_OBJS := $(patsubst $(C_SUBDIR)/%.s,$(C_BUILDDIR)/%.o,$(C_ASM_SRCS))
ASM_SRCS := $(wildcard $(ASM_SUBDIR)/*.s)
else
# Don't include asm sources on non-gba platforms
ASM_SRCS :=
endif

ASM_OBJS := $(patsubst $(ASM_SUBDIR)/%.s,$(ASM_BUILDDIR)/%.o,$(ASM_SRCS))

DATA_ASM_SRCS := $(wildcard $(DATA_ASM_SUBDIR)/*.s)
DATA_ASM_OBJS := $(patsubst $(DATA_ASM_SUBDIR)/%.s,$(DATA_ASM_BUILDDIR)/%.o,$(DATA_ASM_SRCS))

SONG_SRCS := $(wildcard $(SONG_SUBDIR)/*.s)
SONG_OBJS := $(patsubst $(SONG_SUBDIR)/%.s,$(SONG_BUILDDIR)/%.o,$(SONG_SRCS))

MID_SRCS := $(wildcard $(MID_SUBDIR)/*.mid)
MID_OBJS := $(patsubst $(MID_SUBDIR)/%.mid,$(MID_BUILDDIR)/%.o,$(MID_SRCS))

SOUND_ASM_SRCS := $(wildcard $(SOUND_ASM_SUBDIR)/*.s)
SOUND_ASM_OBJS := $(patsubst $(SOUND_ASM_SUBDIR)/%.s,$(SOUND_ASM_BUILDDIR)/%.o,$(SOUND_ASM_SRCS))

OBJS := $(C_OBJS) $(ASM_OBJS) $(C_ASM_OBJS) $(DATA_ASM_OBJS) $(SONG_OBJS) $(MID_OBJS)
OBJS_REL := $(patsubst $(OBJ_DIR)/%,%,$(OBJS))

# Use the old compiler for m4a, as it was prebuilt and statically linked
# to the original codebase
$(C_BUILDDIR)/lib/m4a.o: CC1 := $(CC1_OLD)

# Use `-O1` for agb_flash libs, as these were also prebuilt
ifeq ($(PLATFORM),gba)
$(C_BUILDDIR)/lib/agb_flash.o: CC1FLAGS := -O1 -mthumb-interwork -Werror
$(C_BUILDDIR)/lib/agb_flash%.o: CC1FLAGS := -O1 -mthumb-interwork -Werror
endif

MAKEFLAGS += --no-print-directory

all: compare

#### win32 deps ####

$(SDL_MINGW_LIB):
	@mkdir -p ext
	cd ext && wget -qO- https://github.com/libsdl-org/SDL/releases/download/release-2.30.3/SDL2-devel-2.30.3-mingw.zip | bsdtar -xvf-

SDL2.dll: $(SDL_MINGW_LIB)
	cp $(SDL_MINGW_SDL_DLL) SDL2.dll

#### Main Targets ####

rom: $(ROM)

FORMAT_SRC_PATHS := $(shell find . -name "*.c" ! -path '*/src/data/*' ! -path '*/build/*' ! -path '*/ext/*')
FORMAT_H_PATHS   := $(shell find . -name "*.h" ! -path '*/build/*' ! -path '*/ext/*')

format:
	@echo $(FORMAT) -i -style=file "**/*.c" "**/*.h"
	@$(FORMAT) -i --verbose -style=file $(FORMAT_SRC_PATHS) $(FORMAT_H_PATHS)

check_format:
	@echo $(FORMAT) -i -style=file --dry-run --Werror "**/*.c" "**/*.h"
	@$(FORMAT) -i --verbose -style=file --dry-run --Werror $(FORMAT_SRC_PATHS) $(FORMAT_H_PATHS)

tools: $(TOOLDIRS)

$(TOOLDIRS): tool_libs
	@$(MAKE) -C $@

tool_libs:
	@$(MAKE) -C tools/_shared

compare: rom
ifeq ($(PLATFORM),gba)
	$(SHA1) $(BUILD_NAME).sha1
endif

clean: tidy clean-tools
	@$(MAKE) clean -C chao_garden
	@$(MAKE) clean -C multi_boot/subgame_bootstrap
	@$(MAKE) clean -C multi_boot/programs/subgame_loader
	@$(MAKE) clean -C multi_boot/collect_rings
	@$(MAKE) clean -C libagbsyscall PLATFORM=$(PLATFORM) CPU_ARCH=$(CPU_ARCH)

	$(RM) $(SAMPLE_SUBDIR)/*.bin $(MID_SUBDIR)/*.s
	find . \( -iwholename './data/maps/*/*/entities/*.bin' -o -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.rl' -o -iname '*.latfont' -o -iname '*.hwjpnfont' -o -iname '*.fwjpnfont' \) -exec $(RM) {} +

clean-tools:
	@$(foreach tooldir,$(TOOLDIRS),$(MAKE) clean -C $(tooldir);)

tidy:
	$(RM) $(ROM) $(ELF) $(MAP)
	$(RM) $(BUILD_NAME)_europe.gba $(BUILD_NAME)_europe.elf $(BUILD_NAME)_europe.map
	$(RM) $(BUILD_NAME)_japan.gba $(BUILD_NAME)_japan.elf $(BUILD_NAME)_japan.map
	$(RM) -r build/*
	$(RM) SDL2.dll
ifeq ($(PLATFORM), GBA)
	$(MAKE) tidy PLATFORM=win32 CPU_ARCH=i386
	$(MAKE) tidy PLATFORM=sdl_win32 CPU_ARCH=i386
	$(MAKE) tidy PLATFORM=sdl
endif


#### Recipes ####

include songs.mk
include graphics.mk

%.s: ;
%.png: ;
%.pal: ;

%.1bpp: %.png  ; $(GFX) $< $@
%.4bpp: %.png  ; $(GFX) $< $@
%.8bpp: %.png  ; $(GFX) $< $@
%.gbapal: %.pal ; $(GFX) $< $@
%.gbapal: %.png ; $(GFX) $< $@

chao_garden/mb_chao_garden.gba.lz: chao_garden/mb_chao_garden.gba
	$(GFX) $< $@ -search 1

data/mb_chao_garden_japan.gba.lz: data/mb_chao_garden_japan.gba
	$(GFX) $< $@ -search 1

%interactables.bin: %interactables.csv
	$(EPOS) $< $@ -entities INTERACTABLES -header "./include/constants/interactables.h"

%itemboxes.bin: %itemboxes.csv
	$(EPOS) $< $@ -entities ITEMS -header "./include/constants/items.h"

%enemies.bin: %enemies.csv
	$(EPOS) $< $@ -entities ENEMIES -header "./include/constants/enemies.h"

%rings.bin: %rings.csv
	$(EPOS) $< $@ -entities RINGS

%.gba.lz: %.gba 
	$(GFX) $< $@
%.bin.lz: %.bin 
	$(GFX) $< $@

%.lz: % ; $(GFX) $< $@
%.rl: % ; $(GFX) $< $@

%.bin: %.aif ; $(AIF) $< $@

PROCESSED_LDSCRIPT := $(OBJ_DIR)/$(LDSCRIPT)

# -P disables line markers
$(PROCESSED_LDSCRIPT): $(LDSCRIPT)
	$(CPP) -P $(CPPFLAGS) $(LDSCRIPT) > $(PROCESSED_LDSCRIPT)

$(ELF): $(OBJS) $(PROCESSED_LDSCRIPT) libagbsyscall
ifeq ($(PLATFORM),gba)
	@echo "$(LD) -T $(LDSCRIPT) -Map $(MAP) <objects> <lib>"
	@cd $(OBJ_DIR) && $(LD) -A CPU_ARCH -T $(LDSCRIPT) -Map "$(ROOT_DIR)/$(MAP)" $(OBJS_REL) "$(ROOT_DIR)/tools/agbcc/lib/libgcc.a" "$(ROOT_DIR)/tools/agbcc/lib/libc.a" -L$(ROOT_DIR)/libagbsyscall -lagbsyscall -o $(ROOT_DIR)/$@
else
	@echo Outputting $(ROOT_DIR)/$@
	@touch $(ROOT_DIR)/$(MAP)
ifeq ($(PLATFORM),sdl)
	@cd $(OBJ_DIR) && $(CC1) $(OBJS_REL) $(shell sdl2-config --cflags --libs) -o $(ROOT_DIR)/$@
else ifeq ($(PLATFORM),sdl_win32)
	@cd $(OBJ_DIR) && $(CC1) -mwin32 $(OBJS_REL) -lmingw32 -L$(ROOT_DIR)/$(SDL_MINGW_LIB) -lSDL2main -lSDL2.dll -lwinmm -lkernel32 -lxinput -o $(ROOT_DIR)/$@ -Xlinker -Map "$(ROOT_DIR)/$(MAP)"
else
	@cd $(OBJ_DIR) && $(CC1) -mwin32 $(OBJS_REL) -L$(ROOT_DIR)/libagbsyscall -lagbsyscall -lkernel32 -o $(ROOT_DIR)/$@ -Xlinker -Map "$(ROOT_DIR)/$(MAP)"
endif
endif

$(ROM): $(ELF)
ifeq ($(PLATFORM),gba)
	$(OBJCOPY) -O binary --pad-to 0x8400000 $< $@
	$(FIX) $@ -p -t"$(TITLE)" -c$(GAME_CODE) -m$(MAKER_CODE) -r$(GAME_REVISION) --silent
else ifeq ($(PLATFORM),sdl)
	cp $< $@
else
	$(OBJCOPY) -O pei-i386 $< $@
ifeq ($(CREATE_PDB),1)
	$(CV2PDB) $@
endif
endif

ifeq ($(NODEP),1)
$(OBJ_DIR)/src/%.o: c_dep :=
else
$(OBJ_DIR)/src/%.o: C_FILE = $(*D)/$(*F).c
$(OBJ_DIR)/src/%.o: c_dep = $(shell $(SCANINC) -I include $(C_FILE:$(OBJ_DIR)/=) 2>/dev/null)
endif

# Build c sources, and ensure alignment
$(C_OBJS): $(OBJ_DIR)/%.o: %.c $$(c_dep)
	@echo "$(CC1) <flags> -o $@ $<"
	@$(shell mkdir -p $(shell dirname '$(OBJ_DIR)/$*.i'))
	@$(CPP) $(CPPFLAGS) $< -o $(OBJ_DIR)/$*.i
	@$(PREPROC) $(OBJ_DIR)/$*.i | $(CC1) $(CC1FLAGS) -o $(OBJ_DIR)/$*.s -
ifeq ($(PLATFORM), gba)
	@printf ".text\n\t.align\t2, 0\n" >> $(OBJ_DIR)/$*.s
endif
	@$(AS) $(ASFLAGS) $(OBJ_DIR)/$*.s -o $@

# Build arm asm sources
ifeq ($(CPU_ARCH),arm)
ifeq ($(NODEP),1)
$(ASM_BUILDDIR)/%.o: asm_dep :=
else
$(ASM_BUILDDIR)/%.o: asm_dep = $(shell $(SCANINC) $(ASM_SUBDIR)/$*.s)
endif

# rule for sources from the src dir (parts of libraries)
$(C_BUILDDIR)/%.o: $(C_SUBDIR)/%.s
	@echo "$(AS) <flags> -o $@ $<"
	@$(AS) $(ASFLAGS) -o $@ $<

# rule for rest of asm directory
$(ASM_BUILDDIR)/%.o: $(ASM_SUBDIR)/%.s $$(asm_dep)
	@echo "$(AS) <flags> -o $@ $<"
	@$(AS) $(ASFLAGS) -o $@ $<
endif

ifeq ($(NODEP),1)
$(DATA_ASM_BUILDDIR)/%.o: data_dep :=
else
$(DATA_ASM_BUILDDIR)/%.o: data_dep = $(shell $(SCANINC) $(DATA_ASM_SUBDIR)/$*.s)
endif

$(DATA_ASM_BUILDDIR)/%.o: $(DATA_ASM_SUBDIR)/%.s $$(data_dep)
	@echo "$(AS) <flags> -o $@ $<"
	@$(PREPROC) $< "" | $(CPP) $(CPPFLAGS) - | $(AS) $(ASFLAGS) -o $@ -

$(SONG_BUILDDIR)/%.o: $(SONG_SUBDIR)/%.s
	@echo "$(AS) <flags> -o $@ $<"
	@$(PREPROC) $< "" | $(CPP) $(CPPFLAGS) - | $(AS) $(ASFLAGS) -o $@ -


japan: ; @$(MAKE) GAME_REGION=JAPAN

europe: ; @$(MAKE) GAME_REGION=EUROPE


sdl: ; @$(MAKE) PLATFORM=sdl

sdl_win32: SDL2.dll $(SDL_MINGW_LIB)
	@$(MAKE) PLATFORM=sdl_win32 CPU_ARCH=i386

win32: ; @$(MAKE) PLATFORM=win32 CPU_ARCH=i386

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
	@$(MAKE) -C libagbsyscall MODERN=0 PLATFORM=$(PLATFORM) CPU_ARCH=$(CPU_ARCH)
