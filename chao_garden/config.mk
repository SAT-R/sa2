### Build Configuration ###

# Default variables
GAME_REVISION ?= 0
GAME_REGION   ?= USA
DEBUG         ?= 0
COMPARE       ?= 1

# Version
BUILD_NAME := mb_chao_garden

# Revision
ifeq ($(GAME_REVISION), 0)
  BUILD_NAME := $(BUILD_NAME)
else
  $(error unknown revision $(GAME_REVISION))
endif

# Region
ifeq ($(GAME_REGION), USA)
  BUILD_NAME := $(BUILD_NAME)
else
ifeq ($(GAME_REGION), EUROPE)
  BUILD_NAME := $(BUILD_NAME)_europe
else
ifeq ($(GAME_REGION), JAPAN)
  BUILD_NAME := $(BUILD_NAME)_japan
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
