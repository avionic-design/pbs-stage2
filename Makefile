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

dirs := \
	packages

depend-dirs := $(addprefix depend-,$(dirs))

PHONY += $(package-list)
$(package-list): $(depend-dirs)
	@:

$(depends-file): $(package-list)
	$(call cmd,gen_dep)

PHONY += depend
depend: $(depends-file)
	@:

PHONY += $(depend-dirs)
$(depend-dirs): quiet = silent_
$(depend-dirs): depend-%:
	$(Q)$(MAKE) $(depend)=$*

_all: depend
	@:

endif # skip-makefile

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)

