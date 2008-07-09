PACKAGE = uClibc
VERSION = $(LIBC_VERSION)

ifeq ($(VERSION),snapshot)
  LOCATION = http://uclibc.org/downloads/snapshots
  pkgtree  = $(buildtree)/$(PACKAGE)
else
  LOCATION = http://uclibc.org/downloads
endif

TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

##############################################################################

include packages/toolchain/common.mk

ifneq ($(ABI),)
DEF_CONFIG = $(PACKAGE_FULLNAME)-$(ARCH)-$(ABI).config
CPU_CONFIG = $(PACKAGE_FULLNAME)-$(ARCH)-$(CPU)-$(ABI).config
else
DEF_CONFIG = $(PACKAGE_FULLNAME)-$(ARCH).config
CPU_CONFIG = $(PACKAGE_FULLNAME)-$(ARCH)-$(CPU).config
endif

DOT_CONFIG = $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)),$(CPU_CONFIG),$(DEF_CONFIG))

exec-prefix = $(prefix)/$(TARGET)

conf-args = \
	RUNTIME_PREFIX=$(exec-prefix)/ \
	DEVEL_PREFIX=$(exec-prefix)/ \
	PREFIX=$(ROOTFS) \
	MAKEFLAGS=

package-configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	RUNTIME_PREFIX=$(exec-prefix)/ \
	DEVEL_PREFIX=$(exec-prefix)/ \
	PREFIX=$(ROOTFS)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) headers

install-args = \
	RUNTIME_PREFIX=$(exec-prefix)/ \
	DEVEL_PREFIX=$(exec-prefix)/ \
	PREFIX=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(priv) $(MAKE) $(install-args) install_headers
	# copy additional architecture-independent headers
	#cd $(pkgtree) && \
	#	cp -r libc/sysdeps/linux/common/sys $(ROOTFS)$(exec-prefix)/include && \
	#	cp -r libc/sysdeps/linux/common/bits $(ROOTFS)$(exec-prefix)/include
	# copy additional architecture-dependent headers
	#cd $(pkgtree) && \
	#	cp -r libc/sysdeps/linux/$(ARCH)/sys $(ROOTFS)$(exec-prefix)/include && \
	#	cp -r libc/sysdeps/linux/$(ARCH)/bits $(ROOTFS)$(exec-prefix)/include

package-clean:
	@:

