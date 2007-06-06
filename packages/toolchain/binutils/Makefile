PACKAGE = binutils
VERSION = 2.17

LOCATION = ftp://ftp.gnu.org/gnu/$(PACKAGE)
TARBALLS = $(PACKAGE_FULLNAME).tar.bz2

env = PATH=/usr/bin:/bin:$(PLATFORM)/usr/bin

package-configure:
	cd $(pkgtree) && ./configure --target=$(HOST) --prefix=/usr \
		--disable-nls --enable-tls --with-sysroot=$(PLATFORM)

package-build:
	cd $(pkgtree) && $(MAKE)

package-install:
	cd $(pkgtree) && $(MAKE) DESTDIR=$(PLATFORM) install

