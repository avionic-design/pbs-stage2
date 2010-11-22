
CFLAGS   += $(EXTRA_CFLAGS)
CPPFLAGS += $(EXTRA_CPPFLAGS)
CXXFLAGS += $(EXTRA_CXXFLAGS)
LDFLAGS  += $(EXTRA_LDFLAGS)

## Get the kernel to build against ##
KERNEL_PACKAGE   := linux.git
KERNEL_VERSION   := $(shell cat $(objtree)/build/packages/kernel/$(KERNEL_PACKAGE)/kernel-version)
KERNEL_MOD_DIR   := $(SYSROOT)/lib/modules/$(KERNEL_VERSION)
KERNEL_BUILD_DIR := $(KERNEL_MOD_DIR)/build
KERNEL_SRC_DIR   := $(KERNEL_MOD_DIR)/source

## Where to install ##
INSTALL_KMOD_PREFIX   := $(DESTDIR)/
INSTALL_KMOD_DIR      := $(INSTALL_KMOD_PREFIX)/lib/modules/$(KERNEL_VERSION)/kernel/ti

INSTALL_PREFIX        := $(DESTDIR)/$(prefix)
INSTALL_LIB_DIR       := $(INSTALL_PREFIX)/lib
INSTALL_HDR_DIR       := $(INSTALL_PREFIX)/include
