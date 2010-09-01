
include $(srctree)/packages/ti/common.mk

# Default goal
all: modules interfaces

# If O is not set take a default:
#  - ./build for in tree builds
#  - .       for out of tree builds
ifndef O
ifeq ($(abspath .),$(PKG_DIR))
O:=build
else
O:=
endif
endif

###########################################################################
############################# Build rules #################################
###########################################################################

# Rule to copy the source files in the build directory
define add-sub-module-src
$(1)_O := $$(if $$(O),$$(O)/)$(1)
$$($(1)_O)/%: $$(SRC_DIR)/$(2)/%
	@test -d $$(@D) || mkdir -p $$(@D)
	cp $$< $$@

.PHONY: clean-$(1)
clean-$(1):
	rm -rf $$($(1)_O)

clean: clean-$(1)
endef

INSTALL_KMOD_HDR_SUBDIR ?= $(1)/kernel

# Rules to build a kernel module
define add-sub-module-kmod
$$($(1)_KMOD)_BUILD_SRC := $$(addprefix $$($(1)_O)/,$$($$($(1)_KMOD)_SRC))
$$($(1)_KMOD)_OUT       := $$($(1)_O)/module/$$($(1)_KMOD)

$$($(1)_KMOD)_INSTALL_HDR ?= $$(filter %.h,$$($$($(1)_KMOD)_BUILD_SRC))
$$($(1)_KMOD)_INSTALL_KMOD_HDR_SUBDIR ?= $$(INSTALL_KMOD_HDR_SUBDIR)

$$($$($(1)_KMOD)_OUT): $$($$($(1)_KMOD)_BUILD_SRC) $$($(1)_O)/module/Makefile
	env -i PATH=$(PATH) $$(MAKE) -C $$(KERNEL_BUILD_DIR) \
		M=$$(realpath $$(@D)) \
		EXTRA_CFLAGS="$$($$($(1)_KMOD)_CFLAGS)" \
		modules

.PHONY: module-$(1)
module-$(1): $$($$($(1)_KMOD)_OUT)
modules: module-$(1)

.PHONY: install-module-$(1)
install-module-$(1)-kmod: $$($$($(1)_KMOD)_OUT)
	mkdir -p $$(INSTALL_KMOD_DIR)
	install -D $$($$($(1)_KMOD)_OUT) $$(INSTALL_KMOD_DIR)


ifneq ($$($$($(1)_KMOD)_INSTALL_HDR),)
.PHONY: install-module-$(1)-hdr
install-module-$(1)-hdr: $$($$($(1)_KMOD)_INSTALL_HDR)
	mkdir -p $$(INSTALL_HDR_DIR)/$$(call $$($(1)_KMOD)_INSTALL_KMOD_HDR_SUBDIR,$(1))
	install $$+ $$(INSTALL_HDR_DIR)/$$(call $$($(1)_KMOD)_INSTALL_KMOD_HDR_SUBDIR,$(1))
install-modules: install-module-$(1)-hdr
endif

install-modules: install-module-$(1)-kmod

.PHONY: clean-module-$(1)
clean-module-$(1):
	rm -rf $$($(1)_O)/module

clean-modules: clean-module-$(1)

endef

INSTALL_IFACE_HDR_SUBDIR ?= $(1)/include

# Rules to build an interface library
define add-sub-module-iface
$$($(1)_IFACE)_BUILD_SRC := $$(addprefix $$($(1)_O)/,$$($$($(1)_IFACE)_SRC))
$$($(1)_IFACE)_OBJ       := $$(addsuffix .o,$$(filter %.c,$$($$($(1)_IFACE)_BUILD_SRC)))
$$($(1)_IFACE)_OUT       := $$($(1)_O)/interface/$$($(1)_IFACE)

$$($(1)_IFACE)_INSTALL_HDR ?= $$(filter %.h,$$($$($(1)_IFACE)_BUILD_SRC))
$$($(1)_IFACE)_INSTALL_IFACE_HDR_SUBDIR ?= $$(INSTALL_IFACE_HDR_SUBDIR)

$$($$($(1)_IFACE)_OBJ): $$($$($(1)_IFACE)_BUILD_SRC) $$($$($(1)_IFACE)_DEP)
$$($$($(1)_IFACE)_OBJ): CFLAGS += $$($$($(1)_IFACE)_CFLAGS)

# Create a library
$$($$($(1)_IFACE)_OUT): $$($$($(1)_IFACE)_OBJ)
	$$(AR) $$(ARFLAGS) $$@ $$+

.PHONY: interface-$(1)
interface-$(1): $$($$($(1)_IFACE)_OUT)
interfaces: interface-$(1)

.PHONY: install-interface-$(1)-lib
install-interface-$(1)-lib: $$($$($(1)_IFACE)_OUT)
	mkdir -p $$(INSTALL_LIB_DIR)
	install $$< $$(INSTALL_LIB_DIR)

.PHONY: install-interface-$(1)
install-interface-$(1): install-interface-$(1)-lib

ifneq ($$($$($(1)_IFACE)_INSTALL_HDR),)
.PHONY: install-interface-$(1)-hdr
install-interface-$(1)-hdr: $$($$($(1)_IFACE)_INSTALL_HDR)
	mkdir -p $$(INSTALL_HDR_DIR)/$$(call $$($(1)_IFACE)_INSTALL_IFACE_HDR_SUBDIR,$(1))
	install $$+ $$(INSTALL_HDR_DIR)/$$(call $$($(1)_IFACE)_INSTALL_IFACE_HDR_SUBDIR,$(1))

install-interface-$(1): install-interface-$(1)-hdr
endif

install-interfaces: install-interface-$(1)

.PHONY: clean-interface-$(1)
clean-interface-$(1):
	rm -rf $$($(1)_O)/interface

clean-interfaces: clean-interface-$(1)

# Compile a C file
$$($(1)_O)/%.c.o: $$($(1)_O)/%.c
	$$(COMPILE.c) $$(OUTPUT_OPTION) $$<
endef

define -add-sub-module
$(call add-sub-module-src,$(1),$(2))
$(if $($(1)_KMOD),$(call add-sub-module-kmod,$(1),$(2)))
$(if $($(1)_IFACE),$(call add-sub-module-iface,$(1),$(2)))
endef

add-sub-module = $(eval $(call -add-sub-module,$(1),$(2)))

install: install-modules install-interfaces

# Global phony targets
.PHONY: all modules interfaces
.PHONY: install install-modules install-interfaces
.PHONY: clean clean-modules clean-interfaces
