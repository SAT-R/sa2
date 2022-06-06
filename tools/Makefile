
MAKEFLAGS += --no-print-directory

TOOLDIRS := $(filter-out agbcc binutils,$(wildcard ./*))

.PHONY: all $(TOOLDIRS)

all: $(TOOLDIRS)

$(TOOLDIRS):
	@$(MAKE) -C $@
