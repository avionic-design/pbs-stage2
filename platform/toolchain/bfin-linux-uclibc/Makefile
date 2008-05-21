ARCH = blackfin
CPU = bfin
OS = linux
LIBC = uclibc
TARGET = $(CPU)-$(OS)-$(LIBC)
export ARCH CPU OS LIBC TARGET

LINUX_VERSION = 2.6.25.4
GCC_VERSION = 4.3.0
#LIBC_VERSION = 0.9.29
LIBC_VERSION = snapshot
export LINUX_VERSION GCC_VERSION LIBC_VERSION

variant = sysroot
export variant

include platform/toolchain/common.mk

ifndef TOOLCHAIN
PHONY += platform-clean
platform-clean: __clean-dirs  += $(PLATFORM)/bootstrap
platform-clean: __clean-dirs  += $(PLATFORM)/lib
platform-clean: __clean-dirs  += $(PLATFORM)/usr
platform-clean: __clean-dirs  += $(builddir)
platform-clean: __clean-files += $(PLATFORM)/kernel-release
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

.PHONY: $(PHONY)
endif

