ARCH = arm
OS = linux
LIBC = uclibc
HOST = $(ARCH)-$(OS)-$(LIBC)

export ARCH OS LIBC HOST

ifndef TOOLCHAIN
  packages-y  = toolchain/linux-headers
  packages-y += toolchain/binutils
  packages-y += toolchain/uclibc-headers
  packages-y += toolchain/gcc-core
  packages-y += toolchain/uclibc
  packages-y += toolchain/gcc

PHONY += platform-clean
platform-clean: __clean-dirs += $(PLATFORM)/usr
platform-clean: __clean-dirs += $(builddir)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)

.PHONY: $(PHONY)
else
  # set optimization flags, etc.
endif

