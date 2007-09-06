GCC_VERSION = 4.2.1
LIBC        = glibc
export GCC_VERSION LIBC

HOST   = $(shell support/config.guess)
ROOTFS = $(abspath $(PLATFORM)/../rootfs)
export HOST ROOTFS

ARCH          = arm
CROSS_COMPILE =
export ARCH CROSS_COMPILE

# build a target toolchain
#packages-y += buildroot/toolchain/linux-headers
#packages-y += buildroot/toolchain/binutils
#packages-y += buildroot/toolchain/$(LIBC)-headers
#packages-y += buildroot/toolchain/gcc-core
#packages-y += buildroot/toolchain/$(LIBC)
#packages-y += buildroot/toolchain/gcc

PHONY += platform-clean
platform-clean: __clean-dirs += $(builddir)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)

