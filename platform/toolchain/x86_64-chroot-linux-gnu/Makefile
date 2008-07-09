ARCH = x86_64
CPU = chroot
OS = linux
LIBC = gnu
FLOAT = hard
TARGET = $(ARCH)-$(CPU)-$(OS)-$(LIBC)
export ARCH CPU OS LIBC FLOAT TARGET

LINUX_VERSION = 2.6.25.9
GCC_VERSION = 4.3.1
LIBC_VERSION = 2.7
export LINUX_VERSION GCC_VERSION LIBC_VERSION

variant = chroot
export variant

include platform/toolchain/common.mk

ifndef TOOLCHAIN
PHONY += platform-clean
platform-clean: __clean-dirs  += $(PLATFORM)$(tprefix)
platform-clean: __clean-dirs  += $(builddir)
platform-clean: __clean-files += $(PLATFORM)/kernel-version
platform-clean: __clean-files += $(PLATFORM)/kernel-release
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

.PHONY: $(PHONY)
endif

