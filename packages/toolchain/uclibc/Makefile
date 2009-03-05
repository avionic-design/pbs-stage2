PACKAGE = uClibc
VERSION = $(LIBC_VERSION)

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/toolchain/common.mk

ifneq ($(ABI),)
DEF_CONFIG = $(ARCH)-$(ABI).config
CPU_CONFIG = $(ARCH)-$(CPU)-$(ABI).config
else
DEF_CONFIG = $(ARCH).config
CPU_CONFIG = $(ARCH)-$(CPU).config
endif

DOT_CONFIG = $(strip $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)), \
		$(CPU_CONFIG), $(DEF_CONFIG)))

exec-prefix = $(prefix)/$(TARGET)

conf-args = \
	CROSS_COMPILE=$(ROOTFS)$(prefix)/bin/$(TARGET)- \
	RUNTIME_PREFIX=$(exec-prefix)/ \
	DEVEL_PREFIX=$(exec-prefix)/ \
	PREFIX=$(ROOTFS) \
	MAKEFLAGS=

package-configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	CROSS_COMPILE=$(ROOTFS)$(prefix)/bin/$(TARGET)- \
	RUNTIME_PREFIX=$(exec-prefix)/ \
	DEVEL_PREFIX=$(exec-prefix)/ \
	PREFIX=$(ROOTFS)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	CROSS_COMPILE=$(ROOTFS)$(prefix)/bin/$(TARGET)- \
	RUNTIME_PREFIX=$(exec-prefix)/ \
	DEVEL_PREFIX=$(exec-prefix)/ \
	PREFIX=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(priv) $(MAKE) $(install-args) install

package-clean:
	@:

