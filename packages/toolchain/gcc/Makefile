PACKAGE = gcc
VERSION = 4.2.0

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)/$(PACKAGE_FULLNAME)
TARBALLS = \
	$(PACKAGE)-core-$(VERSION).tar.bz2 \
	$(PACKAGE)-g++-$(VERSION).tar.bz2

include packages/toolchain/common.mk

conf_opts = \
	--with-sysroot=$(PLATFORM) \
	--disable-nls \
	--enable-shared \
	--enable-languages=c,c++ \
	--enable-c99 \
	--enable-long-long \
	--enable-threads=posix

ifeq ($(MULTILIB),)
  conf_opts += --disable-multilib
endif

ifeq ($(LIBC),glibc)
  conf_opts += --enable-__cxa_atexit
endif

configure:
	mkdir -p $(pkgtree)/obj-$(HOST) && cd $(pkgtree)/obj-$(HOST) && \
		$(env) ../configure --target=$(HOST) --host=$(BUILD) \
			--prefix=$(PLATFORM)/usr --mandir=/usr/share/man \
			$(conf_opts)

build:
	# only for canadian build?
	#cd $(pkgtree) && $(env) $(MAKE) all-build-libiberty
	cd $(pkgtree)/obj-$(HOST) && $(env) $(MAKE)

install:
	cd $(pkgtree)/obj-$(HOST) && $(env) $(MAKE) install

