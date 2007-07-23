LINUX_VERSION = 2.6.22.1
GCC_VERSION = 4.2.0
export LINUX_VERSION GCC_VERSION

HOST = $(shell support/config.guess)
ROOTFS = $(PLATFORM)/rootfs
export HOST ROOTFS

LIBC = glibc
LDSO = /tools/lib/ld-linux.so.2
export LIBC LDSO

# build a bootstrap compiler
packages-y += buildroot/linux-headers
packages-y += buildroot/binutils
packages-y += buildroot/$(LIBC)-headers
packages-y += buildroot/gcc-core
packages-y += buildroot/$(LIBC)
packages-y += buildroot/gcc

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

