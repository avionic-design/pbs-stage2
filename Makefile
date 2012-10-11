VERSION = 2010
PATCHLEVEL = 08
SUBLEVEL =
EXTRAVERSION = -wip
NAME =

ifeq ($(O),)
  $(error O=<build-path> must be set!)
endif

ifneq ($(SUBLEVEL),)
  RELEASE = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
else
  RELEASE = $(VERSION).$(PATCHLEVEL)$(EXTRAVERSION)
endif
export RELEASE

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

KCONFIG_CONFIG ?= .config

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
	$(Q)$(MAKE) $(build)=scripts/basic

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
	$(Q)$(MAKE) $(build)=scripts/kconfig $@

%config: scripts_basic FORCE
	$(Q)mkdir -p include/config include/linux
	$(Q)$(MAKE) $(build)=scripts/kconfig $@

  else

PHONY += scripts
scripts: scripts_basic include/config/auto.conf
	$(Q)$(MAKE) $(build)=$@

    ifeq ($(dot-config),1)
      -include include/config/auto.conf
      -include include/config/auto.conf.cmd

ifeq ($(wildcard $(objtree)/all.config),)
$(KCONFIG_CONFIG) include/config/auto.conf.cmd: ;
else
$(KCONFIG_CONFIG):
	$(Q)$(MAKE) -f $(srctree)/Makefile KCONFIG_ALLCONFIG=1 alldefconfig

include/config/auto.conf.cmd: ;
endif

include/config/auto.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig

    else

include/config/auto.conf:
	@echo "  ERROR: configuration is invalid."
	@/bin/false

    endif

  endif
endif

obj-y := packages/
obj-y += platforms/

depend-dirs := $(addprefix depend-,$(obj-y))

PHONY += $(depend-dirs)
$(depend-dirs): depend-%: %
	$(Q)$(MAKE) $(depend)=$(patsubst %//,%/,$*/)

PHONY += depend
depend: $(depend-dirs)
	@:

quiet_cmd_gen_depends = GEN     $@
      cmd_gen_depends = $< $(src)/Kconfig

include/config/depends.mk: scripts/kconfig/deps \
		include/config/auto.conf
	$(call cmd,gen_depends)

PHONY += build
build: include/config/depends.mk
	$(Q)$(MAKE) $(platform)=$(obj) build

PHONY += rebuild-sysroot
rebuild-sysroot: include/config/depends.mk
	$(Q)$(MAKE) $(platform)=$(obj) rebuild-sysroot

PHONY += dist
dist: include/config/depends.mk
	$(Q)$(MAKE) $(platform)=$(obj) dist

PHONY += uscan
uscan: include/config/depends.mk
	$(Q)$(MAKE) $(platform)=$(obj) uscan

PHONY += watch
watch: include/config/depends.mk
	$(Q)$(MAKE) $(platform)=$(obj) watch

PHONY += print
print: include/config/depends.mk
	$(Q)$(MAKE) $(platform)=$(obj) print

PHONY += license
license: include/config/depends.mk
	$(Q)$(MAKE) $(platform)=$(obj) license

PHONY += touch
touch: include/config/depends.mk
	$(Q)$(MAKE) $(platform)=$(obj) touch

PHONY += fs
fs: include/config/depends.mk
	$(Q)$(MAKE) $(fs)=$(obj)

_all: build
	@:

PHONY += initrd
initrd:
	$(Q)$(MAKE) $(initrd)=$(objtree)

PHONY += rootfs
rootfs:
	$(Q)$(MAKE) $(rootfs)=$(objtree)

clean-dirs := $(dirs) scripts/basic scripts/kconfig
ifneq ($(CURDIR),$(srctree))
clean-dirs += $(obj)
endif
clean-dirs := $(addprefix _clean_-,$(clean-dirs))

PHONY += $(clean-dirs)
$(clean-dirs): _clean_-%: %
	$(Q)$(MAKE) $(clean)=$*

PHONY += clean
clean: $(clean-dirs)
	@:

mrproper-dirs := $(patsubst _clean_-%,_mrproper_-%,$(clean-dirs))

PHONY += $(mrproper-dirs)
$(mrproper-dirs): _mrproper_-%:%
	$(Q)$(MAKE) $(clean)=$* mrproper

PHONY += mrproper
mrproper: clean $(mrproper-dirs)
	@:

distclean-dirs := $(patsubst _clean_-%,_distclean_-%,$(clean-dirs))

PHONY += $(distclean-dirs)
$(distclean-dirs): _distclean_-%:%
	$(Q)$(MAKE) $(clean)=$* distclean

PHONY += distclean
distclean: clean $(distclean-dirs)
	@:

%/build:
	@rm -f $(objtree)/build/$*/.build
	$(Q)$(MAKE) $(package)=$* install

%/install:
	@rm -f $(objtree)/build/$*/.do-install
	$(Q)$(MAKE) $(package)=$* install

%/clean:
	$(Q)$(MAKE) $(package)=$* clean

%/rebuild:
	$(Q)$(MAKE) $(package)=$* clean
	$(Q)$(MAKE) $(package)=$* install

%/binary:
	@rm -f $(objtree)/build/$*/.binary
	$(Q)$(MAKE) $(package)=$* install

%/print:
	$(Q)$(MAKE) $(package)=$* print

%/configure:
	$(Q)$(MAKE) $(package)=$* configure

quiet_cmd_autoconf = GEN     $@
      cmd_autoconf = $(srctree)/configure --output $@ > /dev/null

$(srctree)/autoconf.mk: configure
	$(call cmd,autoconf)

config-files = \
	/etc/pbs.mk \
	$(HOME)/.pbs.mk \
	$(srctree)/pbs.mk

-include $(srctree)/autoconf.mk
-include $(config-files)
endif # skip-makefile

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)
