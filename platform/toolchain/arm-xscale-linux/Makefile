ARCH = arm
ARCH_LONG = armv5te
CPU = xscale
TUNE = xscale
OS = linux
LIBC = glibc

ifeq ($(LIBC),glibc)
  HOST  = $(ARCH)-$(CPU)-$(OS)
  GLIBC = y
else
  HOST   = $(ARCH)-$(CPU)-$(OS)-$(LIBC)
  UCLIBC = y
endif

export ARCH ARCH_LONG CPU TUNE OS LIBC HOST

ifndef TOOLCHAIN
  packages-y          = toolchain/linux-headers
  packages-y         += toolchain/binutils
  packages-y         += toolchain/gcc-core
  #packages-$(GLIBC)  += toolchain/glibc-headers
  #packages-$(UCLIBC) += toolchain/uclibc-headers
  packages-$(GLIBC)  += toolchain/glibc
  packages-$(UCLIBC) += toolchain/uclibc
  packages-y         += toolchain/gcc

PHONY += platform-clean
platform-clean: __clean-dirs += $(PLATFORM)/usr
platform-clean: __clean-dirs += $(builddir)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)

.PHONY: $(PHONY)
else
  # set optimization flags, etc.
endif

