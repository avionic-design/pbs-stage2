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
ifeq ($(variant),sysroot)
  ROOTFS := $(PLATFORM)
  libdir :=
else
  ROOTFS :=
  libdir := $(TARGET)
endif

ifneq ($(ABI),)
DEF_CONFIG = $(PACKAGE_FULLNAME)-$(ARCH)-$(ABI).config
CPU_CONFIG = $(PACKAGE_FULLNAME)-$(ARCH)-$(CPU)-$(ABI).config
else
DEF_CONFIG = $(PACKAGE_FULLNAME)-$(ARCH).config
CPU_CONFIG = $(PACKAGE_FULLNAME)-$(ARCH)-$(CPU).config
endif

DOT_CONFIG = $(if $(wildcard $(pkgsrctree)/conf/$(CPU_CONFIG)),$(CPU_CONFIG),$(DEF_CONFIG))

conf-args = \
	RUNTIME_PREFIX=$(prefix)/$(libdir)/ \
	DEVEL_PREFIX=$(prefix)/$(libdir)/ \
	PREFIX=$(ROOTFS) \
	MAKEFLAGS=

package-configure:
	cp $(pkgsrctree)/conf/$(DOT_CONFIG) $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	RUNTIME_PREFIX=$(prefix)/$(libdir)/ \
	DEVEL_PREFIX=$(prefix)/$(libdir)/ \
	PREFIX=$(ROOTFS)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) headers

install-args = \
	RUNTIME_PREFIX=$(prefix)/$(libdir)/ \
	DEVEL_PREFIX=$(prefix)/$(libdir)/ \
	PREFIX=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(priv) $(MAKE) $(install-args) install_headers
	# copy additional architecture-independent headers
	#cd $(pkgtree) && \
	#	cp -r libc/sysdeps/linux/common/sys $(PLATFORM)/usr/include && \
	#	cp -r libc/sysdeps/linux/common/bits $(PLATFORM)/usr/include
	# copy additional architecture-dependent headers
	#cd $(pkgtree) && \
	#	cp -r libc/sysdeps/linux/$(ARCH)/sys $(PLATFORM)/usr/include && \
	#	cp -r libc/sysdeps/linux/$(ARCH)/bits $(PLATFORM)/usr/include

package-clean:
	@:

