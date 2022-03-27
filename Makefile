#### Tools ####
include config.mk

SHA1 := $(shell { command -v sha1sum || command -v shasum; } 2>/dev/null) -c

CC1      := tools/agbcc/bin/agbcc
CC1_OLD  := tools/agbcc/bin/old_agbcc
CPP      := $(DEVKITARM)/bin/arm-none-eabi-cpp
AS       := $(DEVKITARM)/bin/arm-none-eabi-as
LD       := $(DEVKITARM)/bin/arm-none-eabi-ld
OBJCOPY  := $(DEVKITARM)/bin/arm-none-eabi-objcopy

GFX := tools/gbagfx/gbagfx
AIF := tools/aif2pcm/aif2pcm
MID := $(abspath tools/mid2agb/mid2agb)
SCANINC := tools/scaninc/scaninc
PREPROC := tools/preproc/preproc
RAMSCRGEN := tools/ramscrgen/ramscrgen
FIX := tools/gbafix/gbafix

CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -O2 -fhex-asm
CPPFLAGS := -I tools/agbcc/include -iquote include -nostdinc -undef
ASFLAGS  := -mcpu=arm7tdmi -mthumb-interwork -I asminclude


#### Files ####
OBJ_DIR:= build/sa2
ROM      := sa2.gba
ELF      := $(ROM:.gba=.elf)
MAP      := $(ROM:.gba=.map)
LDSCRIPT := ldscript.txt

C_SUBDIR = src
ASM_SUBDIR = asm
DATA_ASM_SUBDIR = data
SOUND_ASM_SUBDIR = sound

C_BUILDDIR = $(OBJ_DIR)/$(C_SUBDIR)
ASM_BUILDDIR = $(OBJ_DIR)/$(ASM_SUBDIR)
DATA_ASM_BUILDDIR = $(OBJ_DIR)/$(DATA_ASM_SUBDIR)
SOUND_ASM_BUILDDIR = $(OBJ_DIR)/$(SOUND_ASM_SUBDIR)
SAMPLE_SUBDIR = sound/direct_sound_samples

$(shell mkdir -p $(C_BUILDDIR) $(ASM_BUILDDIR) $(DATA_ASM_BUILDDIR) $(SOUND_ASM_BUILDDIR))

C_SRCS := $(wildcard $(C_SUBDIR)/*.c)
C_OBJS := $(patsubst $(C_SUBDIR)/%.c,$(C_BUILDDIR)/%.o,$(C_SRCS))

ASM_SRCS := $(wildcard $(ASM_SUBDIR)/*.s)
ASM_OBJS := $(patsubst $(ASM_SUBDIR)/%.s,$(ASM_BUILDDIR)/%.o,$(ASM_SRCS))

DATA_ASM_SRCS := $(wildcard $(DATA_ASM_SUBDIR)/*.s)
DATA_ASM_OBJS := $(patsubst $(DATA_ASM_SUBDIR)/%.s,$(DATA_ASM_BUILDDIR)/%.o,$(DATA_ASM_SRCS))

SOUND_ASM_SRCS := $(wildcard $(SOUND_ASM_SUBDIR)/*.s)
SOUND_ASM_OBJS := $(patsubst $(SOUND_ASM_SUBDIR)/%.s,$(SOUND_ASM_BUILDDIR)/%.o,$(SOUND_ASM_SRCS))

OBJS := $(C_OBJS) $(ASM_OBJS) $(DATA_ASM_OBJS) $(SOUND_ASM_OBJS)
OBJS_REL := $(patsubst $(OBJ_DIR)/%,%,$(OBJS))

src/agb_sram.o: CC1FLAGS := -O1 -mthumb-interwork
src/test.o: CC1FLAGS := -O0 -mthumb-interwork


#### Main Targets ####

compare: $(ROM)
	$(SHA1) checksum.sha1

clean:
	$(RM) $(ROM) $(ELF) $(MAP) $(OBJS) $(SAMPLE_SUBDIR)/*.bin src/*.s

tidy:
	rm -f $(ROM) $(ELF) $(MAP)
	rm -r build/*


#### Recipes ####

%.s: ;
%.png: ;
%.pal: ;

$(SAMPLE_SUBDIR)/%.bin: $(SAMPLE_SUBDIR)/%.aif
	$(AIF) $< $@
	
$(ELF): $(OBJS) $(LDSCRIPT)
	$(LD) -T $(LDSCRIPT) -Map $(MAP) $(OBJS) tools/agbcc/lib/libgcc.a tools/agbcc/lib/libc.a -o $@

%.gba: %.elf
	$(OBJCOPY) -O binary --pad-to 0x8400000 $< $@
	$(FIX) $@ -p -t"$(TITLE)" -c$(GAME_CODE) -m$(MAKER_CODE) -r$(GAME_REVISION) --silent

# Build c sources, and ensure alignment
$(C_BUILDDIR)/%.o : $(C_SUBDIR)/%.c
	$(CPP) $(CPPFLAGS) $< | $(CC1) $(CC1FLAGS) -o $(C_BUILDDIR)/$*.s
	@echo ".text\n\t.align\t2, 0\n" >> $(C_BUILDDIR)/$*.s
	$(AS) $(ASFLAGS) -o $@ $(C_BUILDDIR)/$*.s

$(ASM_BUILDDIR)/%.o: $(ASM_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<

$(DATA_ASM_BUILDDIR)/%.o: $(DATA_ASM_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<

# Tell make that sounds.s depends
# on all the .bin files in `direct_sound_samples`
sound/sound.s: $(shell find $(SAMPLE_SUBDIR) -type f -iname '*.aif' | sed 's/\(.*\.\)aif/\1bin/')

$(SOUND_ASM_BUILDDIR)/%.o: $(SOUND_ASM_SUBDIR)/%.s
	$(AS) $(ASFLAGS) -o $@ $<

