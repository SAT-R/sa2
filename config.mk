### Build Configuration ###

# Default platform variables
PLATFORM      ?= gba
CPU_ARCH      ?= arm
THUMB_SUPPORT ?= 1   # Supports ARM's Thumb instruction set


ifeq ($(CPU_ARCH),arm)
  ifneq ($(PLATFORM),gba)
    THUMB_SUPPORT ?= 0
  endif
else
  THUMB_SUPPORT ?= 0
endif

LDSCRIPT := ldscript

NON_MATCHING ?= 0
ifeq ($(PLATFORM),gba)
ifeq ($(DEBUG),1)
    PORTABLE     := 0
    NON_MATCHING := 1
    LDSCRIPT := $(LDSCRIPT)_modern.txt
else
    PORTABLE     := 0
    NON_MATCHING := 0
    LDSCRIPT := $(LDSCRIPT).txt
endif
else
    PORTABLE     := 1
    NON_MATCHING := 1
    LDSCRIPT := $(LDSCRIPT)_modern.txt
endif

# Default game variables
GAME_REVISION ?= 0
GAME_REGION   ?= USA
DEBUG         ?= 0
COMPARE       ?= 1

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
  COMPARE := 0
  BUILD_NAME := $(BUILD_NAME)_debug
endif
