ARCH = blackfin
CPU = bfin
OS = linux
LIBC = uclibc
HOST = $(CPU)-$(OS)-$(LIBC)
export ARCH CPU OS LIBC HOST

LINUX_VERSION = 2.6.24.4
GCC_VERSION = 4.3.0
export LINUX_VERSION GCC_VERSION

include platform/toolchain/common.mk

ifndef TOOLCHAIN
  packages-y += toolchain/binutils
  packages-y += toolchain/gcc-core
  packages-y += toolchain/linux-headers
  packages-y += toolchain/binutils
  packages-y += toolchain/uclibc-headers
  packages-y += toolchain/gcc-core
  packages-y += toolchain/uclibc
  packages-y += toolchain/gcc

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

