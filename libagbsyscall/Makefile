# If no other platform is specified, assume gba
PLATFORM ?= gba
CPU_ARCH ?= arm

SHELL := /bin/bash -o pipefail

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
    TOOLCHAIN := /usr/x86_64-w64-mingw32/
    PREFIX := x86_64-w64-mingw32-
  else ifeq ($(PLATFORM),win32)
    TOOLCHAIN := /usr/x86_64-w64-mingw32/
    PREFIX := x86_64-w64-mingw32-
  endif
else ifeq ($(PLATFORM),psp)
  PSPDEV    ?= $(HOME)/pspdev
  export PATH := $(PSPDEV)/bin:$(PATH)
  PREFIX    := psp-
else ifneq ($(PLATFORM),sdl)
   $(error Unknown CPU architecture $(CPU_ARCH))
endif # (PLATFORM == gba)

ifeq ($(OS),Windows_NT)
    EXE := .exe
else
    EXE :=
endif

# use arm-none-eabi-cpp for macOS
# as macOS's default compiler is clang
# and clang's preprocessor will warn on \u
# when preprocessing asm files, expecting a unicode literal
# we can't unconditionally use arm-none-eabi-cpp
# as installations which install binutils-arm-none-eabi
# don't come with it
ifneq ($(MODERN),1)
  ifeq ($(shell uname -s),Darwin)
    CPP := $(PREFIX)cpp
  else
    CPP := $(CC) -E
  endif
endif

AS := $(PREFIX)as
AR := $(PREFIX)ar

ifneq ($(PLATFORM),gba)
    CPP       := $(PREFIX)cpp
    CPPFLAGS  := -I ../include -D PORTABLE=1
    CC1       := $(PREFIX)gcc
    CC1FLAGS  := -Wall -x c -S
    LD        := $(PREFIX)ld

    ifeq ($(DEBUG),1)
        CC1FLAGS += -g -O0
    else
        CC1FLAGS += -O2
    endif

    ifeq ($(CPU_ARCH),i386)
      # Use the more legible Intel dialect for x86
      CC1FLAGS += -masm=intel -msse2
      CPPFLAGS += -D CPU_ARCH_X86=1
    else
        CPPFLAGS += -D CPU_ARCH_X86=0
    endif

    ifeq ($(shell uname -s),Darwin)
        # -E: Pre-process only (needed for MacOS?)
        CPP := $(CC1) -E
    endif
endif # PLATFORM != gba


ifeq ($(CPU_ARCH),arm)
ifeq ($(PLATFORM),gba)
    ASFLAGS := -mcpu=arm7tdmi -mthumb-interwork
endif
endif

ARFLAGS := rc 

SYSCALLS := IntrWait \
            RegisterRamReset \
            Sqrt \
            MusicPlayerOpen \
            SoundBiasReset \
            SoundDriverVSyncOn \
            Mod \
            VBlankIntrWait \
            MusicPlayerStart \
            SoundDriverVSyncOff \
            HuffUnComp \
            SoftResetExram \
            MusicPlayerFadeOut \
            LZ77UnCompWram \
            SoundDriverMain \
            SoundBiasChange \
            LZ77UnCompVram \
            ArcTan2 \
            MusicPlayerStop \
            DivArm \
            ModArm \
            SoundDriverVSync \
            SoundDriverInit \
            BgAffineSet \
            Diff8bitUnFilterWram \
            MultiBoot \
            MidiKey2Freq \
            Div \
            Diff8bitUnFilterVram \
            ArcTan \
            ObjAffineSet \
            SoftResetRom \
            SoundDriverMode \
            RLUnCompWram \
            BitUnPack \
            SoundChannelClear \
            CpuFastSet \
            CpuSet \
            Diff16bitUnFilter \
            SoundBiasSet \
            MusicPlayerContinue \
            SoftReset \
            RLUnCompVram

ifeq ($(PLATFORM),gba)
SRCS := libagbsyscall.s
else
SRCS := libagbsyscall.c
endif

ASMS := $(foreach syscall, $(SYSCALLS), $(syscall).s) # $(syscall).s should only exist after compiling non-GBA
OBJS := $(foreach syscall, $(SYSCALLS), $(syscall).o)

LIB := libagbsyscall.a

.PHONY: all clean

all: $(LIB)
	@:

clean:
	rm -f $(LIB) $(OBJS) $(ASMS)

$(LIB): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

ifeq ($(PLATFORM),gba)
$(OBJS): $(SRCS)
	$(AS) $(ASFLAGS) --defsym L_$(*F)=1 -o $@ $<
else
$(OBJS): $(SRCS)
	$(CPP) $(CPPFLAGS) -D L_$(*F)=1 $< | $(CC1) $(CC1FLAGS) -o $*.s - && $(AS) $(ASFLAGS) -o $@ $*.s
endif
