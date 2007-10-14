GCC_VERSION = 4.2.2
LIBC        = glibc
export GCC_VERSION LIBC

HOST   ?= $(shell support/config.guess)
ROOTFS  = $(abspath $(PLATFORM)/rootfs)
export HOST ROOTFS

ARCH          ?= $(shell echo $(HOST) | cut -d- -f1)
CROSS_COMPILE  =
unexport ARCH CROSS_COMPILE

# build a bootstrap toolchain
packages-y += buildroot/core/binutils
packages-y += buildroot/core/gcc-core
packages-y += buildroot/core/linux-headers
packages-y += buildroot/core/glibc
packages-y += buildroot/core/gcc

PHONY += platform-clean
platform-clean: __clean-dirs += $(builddir)
platform-clean: __clean-dirs += $(ROOTFS)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)

