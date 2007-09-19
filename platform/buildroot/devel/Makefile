HOST   = $(shell support/config.guess)
ROOTFS = $(abspath $(PLATFORM)/../rootfs)
export HOST ROOTFS

ARCH          = $(shell gcc -dumpmachine | cut -d- -f1)
CROSS_COMPILE =
export ARCH CROSS_COMPILE

# build a basic development root filesystem
packages-y += buildroot/devel/coreutils
packages-y += buildroot/devel/ncurses
packages-y += buildroot/devel/bash
packages-y += buildroot/devel/grep
packages-y += buildroot/devel/gzip
packages-y += buildroot/devel/bzip2
packages-y += buildroot/devel/tar
packages-y += buildroot/devel/sed
packages-y += buildroot/devel/libpam
packages-y += buildroot/devel/sudo
packages-y += buildroot/devel/make
packages-y += buildroot/devel/flex
packages-y += buildroot/devel/bison
packages-y += buildroot/devel/quilt

PHONY += platform-clean
platform-clean: __clean-dirs += $(builddir)
platform-clean:
	$(if $(wildcard $(__clean-dirs)),$(call cmd,cleandir),)
	$(if $(wildcard $(__clean-files)),$(call cmd,clean),)

PHONY += FORCE
FORCE:

.PHONY: $(PHONY)

