LINUX_VERSION = 2.6.25.4
GCC_VERSION   = 4.3.0
LIBC          = glibc
LIBC_VERSION  = 2.7
export LINUX_VERSION GCC_VERSION LIBC LIBC_VERSION

HOST   ?= $(shell support/config.guess)
ROOTFS  = $(abspath $(PLATFORM)/../rootfs)
export HOST ROOTFS

ARCH          ?= $(shell echo $(HOST) | cut -d- -f1)
CROSS_COMPILE  =
unexport ARCH CROSS_COMPILE

# build a bootstrap toolchain
packages-y += buildroot/bootstrap/binutils
packages-y += buildroot/bootstrap/gcc-core
packages-y += buildroot/bootstrap/linux-headers
packages-y += buildroot/bootstrap/$(LIBC)
packages-y += buildroot/bootstrap/gcc

PHONY += platform-clean
platform-clean: __clean-dirs += $(builddir)
platform-clean: __clean-dirs += $(ROOTFS)/bootstrap
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)

