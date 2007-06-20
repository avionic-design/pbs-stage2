PACKAGE = ncurses
VERSION = 5.6

LOCATION = ftp://ftp.gnu.org/gnu/ncurses
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

include packages/common.mk

conf-args = \
	--host=$(HOST) \
	--prefix=/usr \
	--mandir=\$${prefix}/share/man \
	--with-shared \
	$(call set-args, CC CFLAGS CXX CXXFLAGS LDFLAGS)

package-configure:
	cd $(pkgtree) && $(env) ./configure $(conf-args)

build-args =
package-build:
	cd $(pkgtree) && $(env) $(MAKE) $(build-args)

install-args = \
	DESTDIR=$(ROOTFS)

package-install:
	cd $(pkgtree) && $(env) $(MAKE) $(install-args) install
#	mv $(ROOTFS)/usr/lib/libncurses.so* $(ROOTFS)/lib
#	mv $(ROOTFS)/usr/lib/libncurses*.a $(ROOTFS)/lib
#	ln -s $(ROOTFS)/usr/lib/libncurses.so.5 $(DEVEL_PREFIX)/lib/libncurses.so
#	rm $(DEVEL_PREFIX)/usr/lib/libncurses.so

