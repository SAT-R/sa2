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

LD        := $(PREFIX)ld
OBJCOPY   := $(PREFIX)objcopy
AS 		  := $(PREFIX)as

GFX 	  := ../../tools/gbagfx/gbagfx$(EXE)
AIF		  := ../../tools/aif2pcm/aif2pcm$(EXE)
SCANINC   := ../../tools/scaninc/scaninc$(EXE)
PREPROC	  := ../../tools/preproc/preproc$(EXE)
RAMSCRGEN := ../../tools/ramscrgen/ramscrgen$(EXE)
FIX 	  := ../../tools/gbafix/gbafix$(EXE)

ASFLAGS  := -mcpu=arm7tdmi -mthumb-interwork


# Clear the default suffixes
.SUFFIXES:
# Don't delete intermediate files
.SECONDARY:
# Delete files that weren't built properly
.DELETE_ON_ERROR:

# Secondary expansion is required for dependency variables in object rules.
.SECONDEXPANSION:

#### Files ####
OBJ_DIR:= build/mb_subgame_loader
ROM      := mb_subgame_loader.gba
ELF      := $(ROM:.gba=.elf)
MAP      := $(ROM:.gba=.map)
LDSCRIPT := ldscript.txt

ASM_SUBDIR = asm
DATA_ASM_SUBDIR = data

ASM_BUILDDIR = $(OBJ_DIR)/$(ASM_SUBDIR)
DATA_ASM_BUILDDIR = $(OBJ_DIR)/$(DATA_ASM_SUBDIR)

$(shell mkdir -p $(ASM_BUILDDIR) $(DATA_ASM_BUILDDIR))

ASM_SRCS := $(wildcard $(ASM_SUBDIR)/*.s)
ASM_OBJS := $(patsubst $(ASM_SUBDIR)/%.s,$(ASM_BUILDDIR)/%.o,$(ASM_SRCS))

DATA_ASM_SRCS := $(wildcard $(DATA_ASM_SUBDIR)/*.s)
DATA_ASM_OBJS := $(patsubst $(DATA_ASM_SUBDIR)/%.s,$(DATA_ASM_BUILDDIR)/%.o,$(DATA_ASM_SRCS))

OBJS := $(ASM_OBJS) $(DATA_ASM_OBJS)
OBJS_REL := $(patsubst $(OBJ_DIR)/%,%,$(OBJS))

#### Main Targets ####

MAKEFLAGS += --no-print-directory

compare: $(ROM)
	$(SHA1) checksum.sha1

clean: tidy
	@$(MAKE) clean -C signed_payload
	find . \( -iname '*.1bpp' -o -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.lz' -o -iname '*.latfont' -o -iname '*.hwjpnfont' -o -iname '*.fwjpnfont' \) -exec $(RM) {} +

tidy:
	$(RM) -f $(ROM) $(ELF) $(MAP)
	$(RM) -r build/*

#### Recipes ####

%.s: ;

$(ELF): $(OBJS) $(LDSCRIPT)
	@echo "$(LD) -T $(LD_SCRIPT) -Map $(MAP) <objects> <lib>"
	@$(LD) -T $(LDSCRIPT) -Map $(MAP) $(OBJS) ../../tools/agbcc/lib/libgcc.a ../../tools/agbcc/lib/libc.a -o $@

%.gba: %.elf
	$(OBJCOPY) -O binary $< $@
	$(FIX) $@ -t"$(TITLE)" -c$(GAME_CODE) -m$(MAKER_CODE) -r$(GAME_REVISION) --silent

ifeq ($(NODEP),1)
$(ASM_BUILDDIR)/%.o: asm_dep :=
else
$(ASM_BUILDDIR)/%.o: asm_dep = $(shell $(SCANINC) $(ASM_SUBDIR)/$*.s)
endif

$(ASM_BUILDDIR)/%.o: $(ASM_SUBDIR)/%.s $$(asm_dep)
	@echo "$(AS) <flags> -o $@ $<"
	@$(AS) $(ASFLAGS) -o $@ $<


ifeq ($(NODEP),1)
$(DATA_ASM_BUILDDIR)/%.o: data_dep :=
else
$(DATA_ASM_BUILDDIR)/%.o: data_dep = $(shell $(SCANINC) $(DATA_ASM_SUBDIR)/$*.s)
endif

$(DATA_ASM_BUILDDIR)/%.o: $(DATA_ASM_SUBDIR)/%.s $$(data_dep)
	@echo "$(AS) <flags> -o $@ $<"
	@$(PREPROC) $< | $(CPP) $(CPPFLAGS) - | $(AS) $(ASFLAGS) -o $@

signed_payload/signed_payload.gba: 
	$(MAKE) -C signed_payload
