GCC_VERSION = 4.2.1
export GCC_VERSION

HOST = $(shell support/config.guess)
ROOTFS = $(PLATFORM)/rootfs
export HOST ROOTFS

LIBC = glibc
export LIBC

ARCH          = $(shell gcc -dumpmachine | cut -d- -f1)
CROSS_COMPILE =
export ARCH CROSS_COMPILE

# build a bootstrap compiler
#packages-y += buildroot/binutils
#packages-y += buildroot/gcc-core
#packages-y += buildroot/linux-headers
##packages-y += buildroot/$(LIBC)-headers
#packages-y += buildroot/$(LIBC)
#packages-y += buildroot/gcc

# build a basic toolchain
packages-y += buildroot/binutils
packages-y += buildroot/gcc
packages-y += buildroot/linux-headers
packages-y += buildroot/glibc

# build a basic development root filesystem
packages-y += buildroot/ncurses
packages-y += buildroot/bash
#packages-y += buildroot/grep

# build a target toolchain
#packages-y += buildroot/toolchain/linux-headers
#packages-y += buildroot/toolchain/binutils
#packages-y += buildroot/toolchain/$(LIBC)-headers
#packages-y += buildroot/toolchain/gcc-core
#packages-y += buildroot/toolchain/$(LIBC)
#packages-y += buildroot/toolchain/gcc

PHONY += platform-clean
platform-clean: __clean-dirs += $(builddir)
platform-clean: __clean-dirs += $(ROOTFS)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)

