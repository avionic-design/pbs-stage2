ARCH = arm
ARCH_LONG = armv4t
CPU = xscale
TUNE = strongarm110
OS = linux
LIBC = uclibc
FLOAT = soft
ABI = eabi
TARGET = $(ARCH)-$(CPU)-$(OS)-$(LIBC)$(ABI)
export ARCH ARCH_LONG CPU TUNE OS LIBC FLOAT ABI TARGET

LINUX_VERSION = 2.6.25.9
GCC_VERSION = 4.3.1
LIBC_VERSION = 0.9.29
export LINUX_VERSION GCC_VERSION LIBC_VERSION

variant = sysroot
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

