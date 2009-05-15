MAKEFLAGS += -rR --no-print-directory

ifdef V
  ifeq ("$(origin V)", "command line")
    KBUILD_VERBOSE = $(V)
  endif
endif
ifndef KBUILD_VERBOSE
  KBUILD_VERBOSE = 0
endif

ifeq ($(KBUILD_SRC),)

ifdef O
  ifeq ("$(origin O)", "command line")
    KBUILD_OUTPUT := $(O)
  endif
endif
ifndef KBUILD_OUTPUT
  KBUILD_OUTPUT = $(CURDIR)
endif

PHONY := _all
_all:

$(CURDIR)/Makefile Makefile: ;

KCONFIG_CONFIG ?= .config

ifneq ($(KBUILD_OUTPUT),)

saved-output := $(KBUILD_OUTPUT)
KBUILD_OUTPUT := $(shell cd $(KBUILD_OUTPUT) 2> /dev/null && pwd)
$(if $(KBUILD_OUTPUT),, \
	$(error output directory "$(saved-output)" does not exist))

PHONY += $(MAKECMDGOALS) sub-make

$(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: sub-make
	$(Q)@:

sub-make: FORCE
	$(if $(KBUILD_VERBOSE:1=),@)$(MAKE) KBUILD_SRC=$(CURDIR) \
		-f $(CURDIR)/Makefile \
		-C $(KBUILD_OUTPUT) \
		$(filter-out _all sub-make, $(MAKECMDGOALS))

skip-makefile := 1
endif # KBUILD_OUTPUT
endif # KBUILD_SRC

ifneq ($(skip-makefile),1)
PHONY += all
_all: all

srctree	:= $(if $(KBUILD_SRC),$(KBUILD_SRC),$(CURDIR))
objtree	:= $(CURDIR)
src	:= $(srctree)
obj	:= $(objtree)
VPATH	:= $(srctree)
export srctree objtree VPATH

SRCARCH := $(ARCH)
export SRCARCH

HOSTCC = gcc
HOSTCXX = g++
HOSTCFLAGS = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
HOSTCXXFLAGS = -O2
export HOSTCC HOSTCXX HOSTCFLAGS HOSTCXXFLAGS

##
## beautify output
##
ifeq ($(KBUILD_VERBOSE),1)
  quiet =
  Q =
else
  quiet = quiet_
  Q = @
endif

ifneq ($(findstring s,$(MAKEFLAGS)),)
  quiet = silent_
endif

export quiet Q KBUILD_VERBOSE

MAKEFLAGS += --include-dir=$(srctree)

$(srctree)/scripts/Kbuild.include: ;
include $(srctree)/scripts/Kbuild.include

$(srctree)/scripts/Makefile.lib: ;
include $(srctree)/scripts/Makefile.lib

PHONY += scripts_basic
scripts_basic:
	$(Q)$(MAKE) $(host)=scripts/basic

scripts/basic/%: scripts_basic ;

no-dot-config-targets := clean mrproper distclean

config-targets	:= 0
mixed-targets	:= 0
dot-config	:= 1

ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
  ifeq ($(filter-out $(no-dot-config-targets), $(MAKECMDGOALS)),)
    dot-config := 0
  endif
endif

ifneq ($(filter config %config, $(MAKECMDGOALS)),)
  config-targets := 1
  ifneq ($(filter-out config %config, $(MAKECMDGOALS)),)
    mixed-targets := 1
  endif
endif

ifeq ($(mixed-targets),1)
%:: FORCE
	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= $@
else
  ifeq ($(config-targets),1)

config: scripts_basic FORCE
	$(Q)mkdir -p include/config include/linux
	$(Q)$(MAKE) $(host)=scripts/kconfig $@

%config: scripts_basic FORCE
	$(Q)mkdir -p include/config include/linux
	$(Q)$(MAKE) $(host)=scripts/kconfig $@

  else

PHONY += scripts
scripts: scripts_basic include/config/auto.conf
	$(Q)$(MAKE) $(host)=$@

    ifeq ($(dot-config),1)
      -include include/config/auto.conf
      -include include/config/auto.conf.cmd

$(KCONFIG_CONFIG) include/config/auto.conf.cmd: ;

include/config/auto.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig

    else

include/config/auto.conf:
	@echo "  ERROR: configuration is invalid."
	@/bin/false

    endif

  endif
endif

dirs := \
	packages

build-dirs := $(addprefix build-,$(dirs))
uscan-dirs := $(addprefix uscan-,$(dirs))

PHONY += $(uscan-dirs)
$(uscan-dirs): uscan-%: %
	$(Q)$(MAKE) $(uscan)=$*

PHONY += uscan
uscan: $(uscan-dirs)
	@:

PHONY += $(build-dirs)
#$(build-dirs): quiet = silent_
$(build-dirs): build-%: %
	$(Q)$(MAKE) $(build)=$*

PHONY += build
build: $(build-dirs)
	@:

_all: build
	@:

PHONY += initrd
initrd:
	$(Q)$(MAKE) $(initrd)=$(objtree)

clean-dirs := $(dirs) scripts/basic scripts/kconfig
clean-dirs := $(addprefix _clean_-,$(clean-dirs))

PHONY += $(clean-dirs)
$(clean-dirs): _clean_-%: %
	$(Q)$(MAKE) $(clean)=$*

PHONY += clean
clean: $(clean-dirs)
	@echo "$@"

PHONY += mrproper
mrproper: clean
	@echo "$@"

endif # skip-makefile

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)

