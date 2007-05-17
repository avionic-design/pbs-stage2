MAKEFLAGS += -rR --no-print-directory

ifdef V
  ifeq ("$(origin V)", "command line")
    PBUILD_VERBOSE = $(V)
  endif
endif
ifndef PBUILD_VERBOSE
  PBUILD_VERBOSE = 0
endif

srctree := $(if $(PBUILD_SRC),$(PBUILD_SRC),$(CURDIR))
objtree := $(CURDIR)
src     := $(srctree)
obj     := $(objtree)
VPATH   := $(srctree)

export srctree objtree VPATH

# TODO: beautify output
ifeq ($(PBUILD_VERBOSE),1)
  quiet =
  Q =
else
  quiet = quiet_
  Q = @
endif

ifneq ($(findstring s, $(MAKEFLAGS)),)
  quiet = silent_
endif

export quiet Q PBUILD_VERBOSE

include scripts/pbuild.mk

build := -f $(if $(PBUILD_SRC), $(srctree)/)scripts/Makefile.build obj
pkg   := -f $(if $(PBUILD_SRC), $(srctree)/)scripts/Makefile.pkg   obj

config-targets := 0
mixed-targets  := 0

ifneq ($(filter config %config, $(MAKECMDGOALS)),)
  config-targets := 1
  ifneq ($(filter-out config %config, $(MAKECMDGOALS)),)
    mixed-targets := 1
  endif
endif

ifeq ($(mixed-targets),1)
%:: FORCE
	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= $@
endif

ifdef platform
build:
	$(Q)$(MAKE) $(build)=platform/$(platform)

install:
	$(Q)$(MAKE) $(install)=platform/$(platform)

clean:
	$(Q)$(MAKE) $(clean)=platform/$(platform)
endif

ifdef package
fetch checksum extract patch configure build install:
	$(Q)$(MAKE) $(pkg)=packages/$(package) $@
endif

PHONY += FORCE
FORCE:

Makefile: ;

.PHONY: $(PHONY)

