GCC_VERSION = 4.2.1
LIBC        = glibc
export GCC_VERSION LIBC

HOST   = $(shell support/config.guess)
ROOTFS = $(abspath $(PLATFORM)/../rootfs)
export HOST ROOTFS

ARCH          =
CROSS_COMPILE =
unexport ARCH CROSS_COMPILE

# build a bootstrap toolchain
packages-y += buildroot/bootstrap/binutils
packages-y += buildroot/bootstrap/gcc-core
packages-y += buildroot/bootstrap/linux-headers
packages-y += buildroot/bootstrap/glibc
packages-y += buildroot/bootstrap/gcc

PHONY += platform-clean
platform-clean: __clean-dirs += $(builddir)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)

