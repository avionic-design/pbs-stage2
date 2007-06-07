PACKAGE = gcc
VERSION = 4.2.0

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)/$(PACKAGE_FULLNAME)
TARBALLS = \
	$(PACKAGE)-core-$(VERSION).tar.bz2 \
	$(PACKAGE)-g++-$(VERSION).tar.bz2

include packages/toolchain/common.mk

conf_opts = --mandir=/usr/share/man
ifeq ($(LIBC),glibc)
  conf_opts += --enable-__cxa_atexit
endif

configure:
	mkdir -p $(pkgtree)/obj-$(HOST) && cd $(pkgtree)/obj-$(HOST) && \
		$(env) ../configure --target=$(HOST) --prefix=/usr \
			--with-local-prefix=$(PLATFORM) --with-sysroot=$(PLATFORM) \
			--with-build-sysroot=$(PLATFORM) --disable-nls $(conf_opts) \
			--with-float=soft --enable-threads=posix --enable-symvers=gnu \
			--enable-languages=c,c++ --enable-c99 --enable-long-long

build:
	# only for canadian build?
	#cd $(pkgtree) && $(env) $(MAKE) all-build-libiberty
	cd $(pkgtree)/obj-$(HOST) && $(env) $(MAKE) all

install:
	cd $(pkgtree)/obj-$(HOST) && $(env) $(MAKE) DESTDIR=$(PLATFORM) install

