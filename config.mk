### Build Configuration ###

# Default platform variables
PLATFORM      ?= gba
CPU_ARCH      ?= arm
MIDI_COMMENTS := "arm"
THUMB_SUPPORT ?= 1   # Supports ARM's Thumb instruction set
COMPARE       ?= 1


ifeq ($(CPU_ARCH),arm)
  ifneq ($(PLATFORM),gba)
    THUMB_SUPPORT ?= 0
  endif

  MIDI_COMMENTS := "arm"
else ifeq ($(CPU_ARCH),x86)
    CPU_ARCH := i386
    THUMB_SUPPORT ?= 0
    MIDI_COMMENTS := "x86"
else ifeq ($(CPU_ARCH),i386)
    THUMB_SUPPORT ?= 0
    MIDI_COMMENTS := "x86"
else
    $(error unknown arch: $(CPU_ARCH))
endif

LDSCRIPT := ldscript

NON_MATCHING ?= 0
ifeq ($(PLATFORM),gba)
ifeq ($(DEBUG),1)
    PORTABLE     := 0
    NON_MATCHING := 1
    COMPARE      ?= 0
    LDSCRIPT := $(LDSCRIPT).txt
else
    PORTABLE     := 0
    NON_MATCHING := 0
    COMPARE      ?= 1
    LDSCRIPT := $(LDSCRIPT).txt
endif
else
    PORTABLE     := 1
    NON_MATCHING := 1
    COMPARE      ?= 0
    LDSCRIPT := $(LDSCRIPT).txt
endif

# Default game variables
GAME_REVISION ?= 0
GAME_REGION   ?= USA
DEBUG         ?= 0

# For gbafix
MAKER_CODE := 78

# Version
BUILD_NAME := sa2
TITLE      := SONICADVANC2
GAME_CODE  := A2N


# Revision
ifeq ($(GAME_REVISION), 0)
  BUILD_NAME := $(BUILD_NAME)
else
  $(error unknown revision $(GAME_REVISION))
endif

# Region
ifeq ($(GAME_REGION), USA)
  BUILD_NAME := $(BUILD_NAME)
  GAME_CODE  := $(GAME_CODE)E
else
ifeq ($(GAME_REGION), JAPAN)
  BUILD_NAME := $(BUILD_NAME)_japan
  GAME_CODE  := $(GAME_CODE)J
  MAKER_CODE := 8P
else
ifeq ($(GAME_REGION), EUROPE)
  BUILD_NAME := $(BUILD_NAME)_europe
  GAME_CODE  := $(GAME_CODE)P
  MAKER_CODE := 8P
  TITLE      := SONIC ADVANC
else
  $(error unknown region $(GAME_REGION))
endif
endif
endif

# Debug
ifeq ($(DEBUG), 1)
  BUILD_NAME := $(BUILD_NAME)_debug
endif
