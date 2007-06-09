PACKAGE = uClibc
VERSION = 0.9.29

LOCATION = http://uclibc.org/downloads
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

include packages/toolchain/common.mk

conf-args = \
	MAKEFLAGS=

package-configure:
	cp conf/$(PACKAGE_FULLNAME).config $(pkgtree)/.config
	cd $(pkgtree) && $(env) $(MAKE) $(conf-args) oldconfig

build-args = \
	PREFIX=$(PLATFORM) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=/usr/

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) headers

install-args = \
	PREFIX=$(PLATFORM) \
	RUNTIME_PREFIX=/ \
	DEVEL_PREFIX=/usr/

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install_headers
	# copy additional architecture-independent headers
	#cd $(pkgtree) && \
	#	cp -r libc/sysdeps/linux/common/sys $(PLATFORM)/usr/include && \
	#	cp -r libc/sysdeps/linux/common/bits $(PLATFORM)/usr/include
	# copy additional architecture-dependent headers
	#cd $(pkgtree) && \
	#	cp -r libc/sysdeps/linux/$(ARCH)/sys $(PLATFORM)/usr/include && \
	#	cp -r libc/sysdeps/linux/$(ARCH)/bits $(PLATFORM)/usr/include

