MAKEFLAGS += -rR --no-print-directory

ifdef V
  ifeq ("$(origin V)", "command line")
    PBUILD_VERBOSE = $(V)
  endif
endif
ifndef PBUILD_VERBOSE
  PBUILD_VERBOSE =
endif

srctree := $(if $(PBUILD_SRC),$(PBUILD_SRC),$(CURDIR))
objtree := $(CURDIR)
tmptree  = $(CURDIR)/tmp
src     := $(srctree)
obj     := $(objtree)
tmp      = $(tmptree)
VPATH   := $(srctree)

export srctree objtree tmptree VPATH

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

clean   := -f $(if $(PBUILD_SRC), $(srctree)/)scripts/Makefile.clean         obj
fetch   := -f $(if $(PBUILD_SRC), $(srctree)/)scripts/Makefile.build fetch   obj
build   := -f $(if $(PBUILD_SRC), $(srctree)/)scripts/Makefile.build build   obj
install := -f $(if $(PBUILD_SRC), $(srctree)/)scripts/Makefile.build install obj
pkg     := -f $(if $(PBUILD_SRC), $(srctree)/)scripts/Makefile.pkg           obj
export clean build install pkg

checksum = sha256
builddir = $(PLATFORM)/build/$(package)
stampdir = $(tmptree)/stamps
patchdir = $(srctree)/packages/$(package)/patches
export checksum builddir stampdir patchdir

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
PLATFORM = $(objtree)/platform/$(platform)
tmptree = $(PLATFORM)/build
export PLATFORM

fetch:
	$(Q)$(MAKE) $(fetch)=platform/$(platform)

build:
	$(Q)$(MAKE) $(build)=platform/$(platform)

install:
	$(Q)$(MAKE) $(install)=platform/$(platform)

clean:
	$(Q)$(MAKE) $(clean)=platform/$(platform)
endif

ifdef package
clean fetch checksum extract patch:
	$(Q)$(MAKE) $(pkg)=$(package) $@

configure build install:
	$(Q)$(MAKE) $(pkg)=$(package) $@
endif

PHONY += FORCE
FORCE:

Makefile: ;

.PHONY: $(PHONY)

