PACKAGE = ncurses
VERSION = 5.6

LOCATION = ftp://ftp.gnu.org/gnu/ncurses
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/buildroot/common.mk

conf-args += \
	--with-shared

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args) $(conf-vars)

package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args) $(build-vars)

install-args += \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) $(install-vars) install

