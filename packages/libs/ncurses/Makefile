PACKAGE = ncurses
VERSION = 5.6

LOCATION = ftp://ftp.gnu.org/gnu/ncurses
TARBALLS = $(PACKAGE_FULLNAME).tar.gz

##############################################################################

include packages/autotools.mk

conf-args += \
	--with-shared

package-post-install:
	$(priv) mv $(ROOTFS)/usr/lib/libncurses.so* $(ROOTFS)/lib
	$(priv) ln -sf ../../lib/libncurses.so $(ROOTFS)/usr/lib/libcurses.so

package-clean:
	@:

